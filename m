Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B7E2CAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Sep 2025 17:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bb144XaT3ozq0w1qVMTiSOGlsjiwTNHYJ14plQdks2w=; b=J13hTyMQC1kRSXeXtRRZW2bCSZ
	vUaVWNJDY3vgd65EYbjH1vdjKOckiYGBnry2hhEHSbMsmY5d9Xgx1DqXNkOvVhhDm5QcDXRGjH9Hd
	e1OdqEIitL+RLFF2bSJhbdQAVVc3ohDK0mP55aOwqR4j0RdFAZqJwF2llQRMkmQmecHFUqDjOwp9R
	eiV+vekaXat6rSUmFilAeKmNsG8NCBhCkGVy3E7Go/M6LJDE8lqRg1FBfxNterrXNUZ2E8w9YtkN/
	wM2g9E1P+Aem4ubhaz6rCk13vdm1ImNC1lrSOy2XeBKRvC/JkujEp1Ft1gieRrPsW/Z6op9k0CX4E
	qDNeN5Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2vVG-0000000GwT0-2EMg;
	Sun, 28 Sep 2025 17:48:06 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2vVE-0000000GwSH-0MWH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Sep 2025 17:48:05 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-b5526b7c54eso2359161a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Sep 2025 10:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759081682; x=1759686482; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bb144XaT3ozq0w1qVMTiSOGlsjiwTNHYJ14plQdks2w=;
        b=iLEljCnGxwrJzRnYp2+9PtFXEZ6OXf9mZE1bScUHmpeVg9Y+NcwD7Qan/Uvm4cNwR/
         jkdPg/Gz3tMdynXPp0wWdclNs/2oMNfvTduWW5WyzBiU1NVmEByzmpGjZuBEBYDp77hT
         eZGaRbPk6FsURVIpNWpk1j+CatMsyE2YgMKC0KTgq9vOyIAhrBJJJKrEce8sTaZnaiic
         hoGjhbk62wR/lD+i0/06dzoR0rjXv5vCKzLyXz1+OzqfMElHB0aIglo4ZVrp/wAWYM7L
         lS9Ae/IrrE7CJnVeWnQUDRIptAMwpNFE1op+bEBZYJzDcCMfS0bDY50JJJfX7I/LLj5N
         5jBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759081682; x=1759686482;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bb144XaT3ozq0w1qVMTiSOGlsjiwTNHYJ14plQdks2w=;
        b=hhH4rIdXd+M9rXo/qX3XK2fajxKVOk9jOAAiOE5Rqi2u4Yu+qbJIhUQtV8FL9Ik5T8
         AavDlX8MooeK1rN9dYukRyJ/Ylz95HHln35lKdYfrT/goHX2Vv7GTFh5Wza2iyZSMURW
         XhTeVLCZCa8uhQWgxqbpwPlQOfP+0AMFcy+fa/WjL4x9SJVzBYWo0QE4APH7SyUOLeg2
         IHP5Nq0fB6T9cUpsduNL/xEnbuwRkzAKBm5/Mf4h+mfSVk9OWMOrH1+TWkIv/n2WAL+3
         6ah/9gQl/+zMSb0MUuSEmCsTm5+o0FoRZRNDyHhH/k3H+pGrPYf1KCX+XtVwNcUPSk1W
         3RBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWs8ayWp7TXsZgDTjC+UClmhl30mtQo3tbGFAF4nLGZ8FwvrydBbvUQTT4V/3u85gpQ+9uDfEgbTAn++9ztnZzC@lists.infradead.org
X-Gm-Message-State: AOJu0Yyl36m+l3ozieI1oKaAAlNZnIuVzq9NPLMk6n69l4HSVR6agPwH
	4oiV+11+S4qT1DVPVB9kGhu2Kp5U95vyxIEFcTtheakcTkGzivLOBfoYHZjY+k6lwyR9dEB9sW6
	KeMirNsb6Y+T83MOxm1peKMKk3hoOCGk=
X-Gm-Gg: ASbGncupFTGMJmrpfqbMpD+MLidPsxiCa5rAUUTpAM7z+IVZP4hRGBCEV4chEDGlbTR
	Re5mZ33AJ1HbgYI8BY4zJREtJg/5seJsYg8xJU/3rPzupZRkF6g1XKYLf3G0f2p736VDFpu9Fct
	r2/lGdOaEyZLYxWB0eTyQ8U2OUz5xZ3MZsLGL1RL9t83X/tJpO1TannaT1MfipmXAIWls6Sovur
	KQbFQzlUDKvzMIEmHI=
X-Google-Smtp-Source: AGHT+IGIhTRX0vPWXRnKGbM7/t9PfWgMfG3icRhXm/bikRRYDgSLLR3zWm4hL7da1xUZ+6JNLVBVdbp7N1oWnUBqBMY=
X-Received: by 2002:a17:902:cf0d:b0:27d:69bd:cc65 with SMTP id
 d9443c01a7336-27ed4a96a83mr141161955ad.45.1759081681919; Sun, 28 Sep 2025
 10:48:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAOprWosSvBmORh9NKk-uxoWZpD6zdnF=dODS-uxVnTDjmofL6g@mail.gmail.com>
 <20250919-lurking-agama-of-genius-96b832-mkl@pengutronix.de>
 <CAOprWott046xznChj7JBNmVw3Z65uOC1_bqTbVB=LA+YBw7TTQ@mail.gmail.com>
 <20250922-eccentric-rustling-gorilla-d2606f-mkl@pengutronix.de> <CAOprWoucfBm_BZOwU+qzo3YrpDE+f-x4YKNDS6phtOD2hvjsGg@mail.gmail.com>
In-Reply-To: <CAOprWoucfBm_BZOwU+qzo3YrpDE+f-x4YKNDS6phtOD2hvjsGg@mail.gmail.com>
From: Alexander Shiyan <eagle.alexander923@gmail.com>
Date: Sun, 28 Sep 2025 20:47:49 +0300
X-Gm-Features: AS18NWDPKklTiLrxKFeYvofRAgeM8OwBQfBPUfJA357z4XaPxxHtrQTv3DSxvMw
Message-ID: <CAP1tNvTD2uhK79VB_PT0JByv_VVy245WH-3a1ZaG1-Khw5_vaw@mail.gmail.com>
Subject: Re: Possible race condition of the rockchip_canfd driver
To: Andrea Daoud <andreadaoud6@gmail.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>, 
	Elaine Zhang <zhangqing@rock-chips.com>, kernel@pengutronix.de, linux-can@vger.kernel.org, 
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_104804_126167_AC6DC440 
X-CRM114-Status: GOOD (  15.38  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hello.

> > > Could you please let me know how to check whether my RK3568 is v2 or v3?
> >
> > Alexander Shiyan (Cc'ed) reads the information from an nvmem cell:
> >
> > | https://github.com/MacroGroup/barebox/blob/macro/arch/arm/boards/diasom-rk3568/board.c#L239-L257
> >
> > The idea is to fixup the device tree in the bootloader depending on the
> > SoC revision, so that the CAN driver uses only the needed workarounds.
> >
>
> Thanks, it is not easy to correlate this because I am currently not using
> barebox. I'll try this later.

I think this can be done from the userspace.
Build the driver as a module, get the SoC version, then modprobe it
with an alias for the desired version.

