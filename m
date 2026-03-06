Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8351F51413
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 06:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mVlhqHe7CkV4fZT/h0SneJI3zUiLhQDfGLpZ4oeyULo=; b=fRREJuw+S/drVgLu5b7cQxdoLt
	rvKr6gw0HGee7beL3KSzIr7KXQFAabxx3ssVu3y1+4OW0yK9lGKYpcCMI6ZY9KyoBk1CtqSYlRtc+
	RpUZz5+UYo34RgMvTQCe+p8xdp5VbZhS/1cF7mgccpOEHKkVmtqgSN7xCaoHvTpZoJY5+lCCCT+2T
	lIEYNUDis2rmJ62CH/vMpK5h7B/7Qlb8Wcoh1jnEEpufqGusoXtc8O3Do50CQTWROtwvyJ8VwxBVy
	PJBSy2hqEAtGwGt4BXYpusLYT0u5GDqIfzLn84RJnWavZ/6/r79GfvlNvji0xTY9ix8lliSI9ovmP
	yZFhQr6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyP9o-000000037AN-02h0;
	Fri, 06 Mar 2026 06:59:32 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyP9j-00000003798-3IUa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 06:59:29 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-b9381e78a31so1160739366b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 22:59:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772780366; cv=none;
        d=google.com; s=arc-20240605;
        b=KdB8JO1xPPGfMItfpiCNkLI1lD2gjACGlcuiS9en3dKLd6VEbxg4rWCVk65Kgq4z5q
         W7cjaFwc76XNgPhqDgscN7jh9fvXeYIMtYCW3qze2J/M+3ng3yXxeeRpRRgxHg9JTLwT
         1nKU2Ac107D/4/2z5bNxeygmDP3xs+Oz4s/4anujBliGagzw+NoyWp1D9Bx6jEnYHvD2
         ICgEE2DlkWe/XOpnY0gLBMKEZ2nn8GpUpSMj6Cwqst4YshlLnrrFN/yPM6DxeBPP+37A
         8NZr/FSJGJw4VUuUApThbVxvEr8zoxyiWGpUS7cWOPrjILIKthB8G3iqJFFVm1kCDM8a
         yfxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mVlhqHe7CkV4fZT/h0SneJI3zUiLhQDfGLpZ4oeyULo=;
        fh=xkXCeJQR6xpNZR7fm5JDfrQFble2cOFGovwzZZuOMsk=;
        b=axLb7J2HPxrU1ewp/u6yathy4H5w7BOuauJQ0slraRiIhNN0gMeehcQEZalbHlkRYe
         19UbIlIiSIuY/Jwgfa7x0AHZwvDBE+8hw8ZkDLLdKeOBPKNDP7kkiVAx0K5Fsy6Rq9pd
         ZwdkN+tWqRpuTN9RM2HEQaYTt7kI8kR/RROGrWQ3nTtJV4KHTyJQyE6xOADwakIL8xWe
         a4gNKtjANsUUcGeEI3p5SmyPGcifeSd/zDJ/ukw/lKghraxVzgf1UtROiXHaZftdb/tR
         RBZ1ENMtap98kbQarAVra2S5iY9GEbl5p1lKhxSbJpuciE08DITJnTbEis61TZKToEjI
         hnJA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772780366; x=1773385166; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mVlhqHe7CkV4fZT/h0SneJI3zUiLhQDfGLpZ4oeyULo=;
        b=SPxMwF2wCnr/vg77Et6eG4yBT8UhBNqWFF1VUoVFSSJVd0CVtTfTZRfbOGgTySJZe3
         ILkmyV/seF7r5Tz9QzAixxP5hBEa5caixFeD41inWnU1i++iCo+/uo9qT+VHKyJ7FzAK
         Sx9hP2WfsiIfiFxvH9nEBoMTsk2Tg5EAWAh4e1rXNJvk9TRa35t7t5i0rZlYSuhigtDd
         28bEhJdbXuQ3haMVBY6kWWeHbqKhfkGwqiKcwdfhWDdGkAkarIhTSXLUrOBH+BOcTwEv
         PCc1WW3yNCqHz2V2QeAcYNyVlUwx7JHQv1s56IHascZnAibveNeDFDxgIrdx6wmkcDBm
         v1dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772780366; x=1773385166;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mVlhqHe7CkV4fZT/h0SneJI3zUiLhQDfGLpZ4oeyULo=;
        b=n/wSkFNxcLv55XTCFt5/QqWM7aqOF5rUOCOzpTooQwjdZkZf9736tYg6B4LT/Wn/Gu
         3VSbug1e2aNKOwvA5Vx1Xbd6SY2zsfHUlvt2KxFb2lW6dCm4tcPwwNiV2U1E1uKJEXWz
         +AlNw+S3OPEkaELJw8PZh0ixB6u8kugLLCfo505CVRZ2TFqbZAX7lYB+BcRqGsDOKVNg
         zmESwVJFcZt4lFKDAHoUKFaS6BVU8tBN4EU757XqJA+erK9ShobjH8CW8aAN2zxTaccW
         q4IKCsuEX7eTPCEMnXIGtKbQzxbjCQ5eRSC13moOtRNA7QJmWVQIC38w+t+IKWENEcky
         yHEQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6sRWYkhqbXoIGA1s9h6d88uA7L+OACfMMtBY3cBK5aNKYmzFqcR6jZ+f8N5p8GXcsGl8LQzwOQsrgSYYVhuRA@lists.infradead.org
X-Gm-Message-State: AOJu0YybyFn5x8KfC/NdmJvHmYQyZKu0WFpouP7S7E1xqkcCLz+NGY8J
	nV+mz7zAO2Y74pOU3vxA7P2a+i6rSj8yvz/+VzKEMB+AV6vXjMszC20WQKMhW+PaVxgdKShQU6X
	TgjSBm0inTMOhyYDXCoeZLOjRoOhNg7k=
X-Gm-Gg: ATEYQzx3jUVIRA8whAbwUSLpE0msWoL19Kx9SK3SipbhrPPbPmwZVgRSU0Zis1IHSxS
	kHHRt5bdeh6xpKpWRwHtkNzMmLPxaSl4wB2qeSfV0Hztp+wHHOsoWoiiSJvbA14i+B7P40xcfeB
	ZqTf0krg13SsyL/NB8EssmoQr0zaVzkCsy3KV1pdTWAM3Zjzn4XHdkzXLfn70C3r8YDKz7OgaSW
	iuCJiaI1ndTQl7LwLbDdCE2td+g/Fhp4qAbirV/9qpaAx1GkygINTrFusR0XbbyRW+j+jerpfm8
	/Gq+JXGrPy0aGmMm4gK/pP/lqpIiiLsnkeTItwP660Wd3FFO9Z+/Mr+xpZtORDUoAFndL66iPYL
	2D097xA==
X-Received: by 2002:a17:907:3f07:b0:b90:ba21:62c4 with SMTP id
 a640c23a62f3a-b942dfe566cmr55999266b.54.1772780365567; Thu, 05 Mar 2026
 22:59:25 -0800 (PST)
MIME-Version: 1.0
References: <20260306044536.149204-1-rosenp@gmail.com> <20260306-handsome-quixotic-catfish-705bde-mkl@pengutronix.de>
In-Reply-To: <20260306-handsome-quixotic-catfish-705bde-mkl@pengutronix.de>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 5 Mar 2026 22:59:13 -0800
X-Gm-Features: AaiRm50vB-zSPWaBk9wa73JDVss8keXDl3ZA1Vf7DNaa1ZQu4Laz-oBPUltxeOs
Message-ID: <CAKxU2N9szBV0C95=v7_HxJOBgOhFv1J=k9XPE1Lm-w3zQMQWdg@mail.gmail.com>
Subject: Re: [PATCH] media: nxp: imx8-isi: remove kzalloc_objs
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: linux-media@vger.kernel.org, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Frank Li <Frank.Li@nxp.com>, gustavoars@kernel.org, 
	open list <linux-kernel@vger.kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_225927_872165_DDC444A9 
X-CRM114-Status: GOOD (  12.26  )
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

On Thu, Mar 5, 2026 at 10:56=E2=80=AFPM Marc Kleine-Budde <mkl@pengutronix.=
de> wrote:
>
> On 05.03.2026 20:45:36, Rosen Penev wrote:
> > Use a flexible arraay member to combine allocations.
> >
> > It looks like pipes never gets freed anywhere. Meaning this effectively
> > fixes a memory leak.
>
> It's a devm_kzalloc(), which means it's automatically free()ed after the
> remove callback.
Yes but pipes does not use devm.
>
> Marc
>
> --
> Pengutronix e.K.                 | Marc Kleine-Budde          |
> Embedded Linux                   | https://www.pengutronix.de |
> Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
> Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

