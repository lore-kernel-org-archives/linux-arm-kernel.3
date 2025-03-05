Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5ED8C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 22:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RsjM4YASNleulr3tBXWY5lzfU3eAoHcF5KVgOaYjt5c=; b=IEpXwnxENgEJygkzGradQduVqN
	RxUDY9u1YgMvnOfFk6etEJm4xApA6Lc8JV17SJ9xBNWRpTTElim01aIUALjpRVIdlyNsCrrwzAOoj
	CZtt1ncRfPOTHWDJSjonNryuhK7XzsLBcwyfZpoZ05VvJAI+sSgjzLFJY8BS2FYJCf/FqCBR6rXZH
	TFavpvSMNZYxeLJyG9F9Yh4yBSVMJ8fbSRsHeYBXeqagOpn9rUL1LbsTPA1q9d5Z1nshwKDUoJp6c
	wkn+nrOoWKZe8wfD6sefIMwreZeRajjxT0Z6vXJLd8Y5ILf5WMo+iVpJsqtk4QCJV7ux6Auh9+Y4T
	mOisxJoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpxb9-00000009XRG-3Pvm;
	Wed, 05 Mar 2025 22:52:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpxZZ-00000009XJF-21Sv
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 22:50:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=RsjM4YASNleulr3tBXWY5lzfU3eAoHcF5KVgOaYjt5c=; b=cg7hLwu0RMSm5MVgywc2/tEEes
	f2/T+pcYRaiD0E2chIZU8M2ENefNi7jig/Iv6CgKbKEiaFVY2RoSMpBJeGM1urwd1XoZhCjk1yc3x
	SoVlHbTXCJN9lNStzbxQEQYmuA19tO4OrFxFF9Cc8JrQMgtkDkQ/AW4IArcjUpnImdPevFbi6fwP/
	9H95piTGPmnyADrxljDsACxlWKoI8I8sfhOi2COsLp2l+cfoogqZUqDSjtDJXuLlTN41fWq7IsYbs
	Hdq8yWpkb0Wjr0Aejc/3UkE1Gh6zVgF6uQAj+OE0SjRcXSQY4yl5J/FgW6DqQm7P1xmQ0gL9UIiUu
	Pb6raIKA==;
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpxZW-00000000n2k-15eF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 22:50:40 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-474e1b8c935so99071cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 14:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741215035; x=1741819835; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RsjM4YASNleulr3tBXWY5lzfU3eAoHcF5KVgOaYjt5c=;
        b=WnHbEJ4XS9lsmUxmuKK0G1Yd4CCvp9oKq6pDkVOGDtuzFP0DAJkIq5AsJiU5Hxcj8X
         8VpEkE9LgT5zkhI54Mi6W4CPT4HgOLbxf//317a4ilnw+M393RxZdIo59mY2hBHIsISA
         OCEufFQHjYsIq1I7j8p+kEIr5bLCorRP76RQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741215035; x=1741819835;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RsjM4YASNleulr3tBXWY5lzfU3eAoHcF5KVgOaYjt5c=;
        b=mFpYYTyBG6wUpdcgcAvxWmiIdPJ20dnTsA2WXhEJGbGqqC2xYuLLGnylXohF4KdJjV
         KsH6RHJ7oSmqIUsq1vKF4swBfgqnfs1PT1Rg9Cd4WeVvicWsK5oGn2WDZmmVnyVectZ+
         yZ6oeaaOlCLSNaf0QcfDsbbU/i9S1TIip5VRDwmIa3HzjpG9EmNiIn9zFcTGNmeAbhpw
         aXjUyopeLmx71haVzyFZvrsq9XzeVFLe32a8WmfSmEJ9yKhzbKUeZ2OQN0T3OvAt1eCo
         C+z5aNk+BHMGcR1Jmy3FPCYcOtwPKm1Wuih1bYUK7NQv+Ik7n1kQ13E1apAE4GRJf1W/
         tPUQ==
X-Forwarded-Encrypted: i=1; AJvYcCX//jYO19SAlIBRaSZVG3g3yAhAD+LkiyTF/dQPwnIv3wCPgPSXTSVVSyMs/UW3d0Ybsz1rKCoxjGgqdFxawnF+@lists.infradead.org
X-Gm-Message-State: AOJu0Yxq15CiRyIvZgQabxcXqkvhAcm0n/pzddw/BcpfA7qkMKz/k17i
	ZsVetKTPLpa+0Sd7fgZk/x+Xg2CsSP7PFFv39v4KB056C2nhyI/y1yv/suwVYBI3inC7DhWcVe2
	/RsCfxXuYrkS9hFLUbsbkvaTljVty6WsXgPaj
X-Gm-Gg: ASbGncv4crye+I76ooXe6I4oP+RSGvUxNTa9MHXBKAr6Wzp4LWlXptDyAxyUMDrZ902
	VPu25KsvBpyOZl9rnBdnvcH0DhGnB6DVp8mQQJyVn6YJ2sQSCzb6aZUAG4St1yFMi2gGlz9RKe9
	zycwcsKuDPSaw+TF9oHt2q4ZjnChq1DJab8PCHXlChqS9CeKxZeySK70v1n0Q=
X-Google-Smtp-Source: AGHT+IHvK+t3RyIjKaNCRJHSF0lsNgux1FRjfJb7Y820KcKp5rPghSBOwl1IAFSXci0ouoP0BoEyc1UcQ1d61NKzM3g=
X-Received: by 2002:ac8:5905:0:b0:475:1754:e044 with SMTP id
 d75a77b69052e-4751c567b75mr312741cf.3.1741215034513; Wed, 05 Mar 2025
 14:50:34 -0800 (PST)
MIME-Version: 1.0
References: <20250305101025.2279951-1-george.cherian@marvell.com> <20250305101025.2279951-2-george.cherian@marvell.com>
In-Reply-To: <20250305101025.2279951-2-george.cherian@marvell.com>
From: Julius Werner <jwerner@chromium.org>
Date: Wed, 5 Mar 2025 14:50:20 -0800
X-Gm-Features: AQ5f1Jq5WN2NBjpsa146UgayYxAH8L0biqGumwPp8sUUsQ-SzcQC8JeVH7zSTCI
Message-ID: <CAODwPW_3BCfTcTu=K+6Q3PMe8DtWTiKFHC6+HO2q+cTqs=EPAA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] watchdog: Add a new flag WDIOF_STOP_MAYSLEEP
To: George Cherian <george.cherian@marvell.com>
Cc: linux@roeck-us.net, wim@linux-watchdog.org, jwerner@chromium.org, 
	evanbenn@chromium.org, kabel@kernel.org, krzk@kernel.org, 
	mazziesaccount@gmail.com, thomas.richard@bootlin.com, lma@chromium.org, 
	bleung@chromium.org, support.opensource@diasemi.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	andy@kernel.org, paul@crapouillou.net, alexander.usyskin@intel.com, 
	andreas.werner@men.de, daniel@thingy.jp, romain.perier@gmail.com, 
	avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	christophe.leroy@csgroup.eu, naveen@kernel.org, mwalle@kernel.org, 
	xingyu.wu@starfivetech.com, ziv.xu@starfivetech.com, 
	hayashi.kunihiko@socionext.com, mhiramat@kernel.org, 
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, 
	imx@lists.linux.dev, linux-mips@vger.kernel.org, openbmc@lists.ozlabs.org, 
	linuxppc-dev@lists.ozlabs.org, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_225038_497571_658CFD8F 
X-CRM114-Status: GOOD (  12.29  )
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

>  static const struct watchdog_ops adv_ec_wdt_ops = {
> diff --git a/drivers/watchdog/arm_smc_wdt.c b/drivers/watchdog/arm_smc_wdt.c
> index 8f3d0c3a005f..794cf0086912 100644
> --- a/drivers/watchdog/arm_smc_wdt.c
> +++ b/drivers/watchdog/arm_smc_wdt.c
> @@ -90,7 +90,8 @@ static const struct watchdog_info smcwd_info = {
>         .identity       = DRV_NAME,
>         .options        = WDIOF_SETTIMEOUT |
>                           WDIOF_KEEPALIVEPING |
> -                         WDIOF_MAGICCLOSE,
> +                         WDIOF_MAGICCLOSE |
> +                         WDIOF_STOP_MAYSLEEP,
>  };

I don't think this driver can sleep, unless I'm missing something?
`arm_smccc_smc()` does a synchronous call into firmware that always
returns back to the caller.

