Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 657F0E7716B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 14:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c5dJWCCGmuo/rrbDElavgBYIrX7vdAKrghhtXY8nXwg=; b=HxMVaenrBjGmcfKALmp805w+I2
	Nq3/TiUu1PwbJithM0gLZ5vZlUxACeFkISXwfrxb5hhNr6LsSwr2z6EBDj0cesgPrstYpb7Ik98VP
	oOLif+Xnch2MTsRlwAY5Je2JA10ljDFqfaEJQbzVNVHVqkBHpVPBUgPuXrKRzVvRFNR0BiRV0IN2P
	EO0nI69nonFt9bcaviulzEOwKsG70KzyJfULPTtmlbTPtVVguKvRUrDXgicDt7PaV7fSqG7/0qOF/
	dlNk0h4YwzAx8X1704q03vSaWv5so9RxtiwhyEucG1HKDs6N+uEjLa3+gnPLbcLZIykMDpARC2GiZ
	PgAAGjhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIqqD-0000000CuoM-2zuQ;
	Wed, 04 Dec 2024 14:59:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIppx-0000000CjLD-2rbc
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 04 Dec 2024 13:54:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=c5dJWCCGmuo/rrbDElavgBYIrX7vdAKrghhtXY8nXwg=; b=OoUNUdlUZOYnJGZiLrFK2CdRTF
	iG5deBZU4EWfotE5oG4H0s9rh/aSQKpxaTSqm32yV32WNHC9xt2yWLGBUocIXtGs6Mxv76yc3OhXj
	CUoB6A/JVHnsJr+DzgzSctXmPjgR92lz746xuP8dOGAF7ZWUoOc6PVe6fJYC7L8ZGwBHmLAqC4tM5
	e4YeYz63fX+m2cwtvTs2yyOZ39nl/kTKTn9jwm2jL2p5Rj21Ou4joehSFeCrXjUczV44DnXW75n48
	gcHJ+6Zg9m9gJq10WWQ9OViMcMJRtjs9PVdYC0RvSqZTqzVlqGj58HjRoO1cVMoJ4QzpDC+enafTb
	jUo511bA==;
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIppu-00000002cpg-24XB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 13:54:40 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-53e1c3dfbb0so1056194e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 05:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733320475; x=1733925275; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c5dJWCCGmuo/rrbDElavgBYIrX7vdAKrghhtXY8nXwg=;
        b=h3e7ZOAe7BibQp6SqQce5ria6lDBIJl9FyNar8boCnNIzprJOngT7p3wtFp/zzySDG
         MBj2CKbwEJ784fd9KthufzGEOE1Ng7yAvUBR5Ei4kDLjbmOYdz18RPx8zQ6IC5QL7SrU
         MPmSQ0S+KOT2e8BQkcaNVjyyVPP7oG2+vIskd6uEWrYEUcJqGaIbm5saLo88v4+HyPOX
         rlS9y6MQrtSo0wPmJ3yhXcnowZD8X9rf35Wdx6f5aakGw5GpQfdldR6n+tqgTOsZcuA3
         Gh99CsesRAnO46bRtDt8blxrcN6Cju0RTw2D+/ekpvyuuRXIH+QhnrJQUB7cvtUbKB6Y
         qfxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733320475; x=1733925275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c5dJWCCGmuo/rrbDElavgBYIrX7vdAKrghhtXY8nXwg=;
        b=h/Rc88m73k9wtmyyYcSCJtUtSeJiSaIB2oMMwERj8/Is9yXFF8MH4KU70Md6zvpwYh
         Whfcx+doFkhr2/nOYMKBZjPfy7M9X9y+7TvmffMFnPEmEs+bt9Rp/wQWQHgpcnZlU9U/
         gHKGZrak82cdKn8SajxrUc80LisIl5oSzGAdiMOL6HzYkiBsJ1CcILrj9+kiRSFWEVz/
         LLt6momDW4PpHiif3iHj4StofIkTMNxXZeR+CKhbxn9+uijQvJJxg+g2VsO36iavfm4H
         aIJvL5rPDlMS3AvF36bfcpWABa+wVEiIQf5pg44Qh9Dhl8xpeFrm3UBGnntASuuFn7OF
         xvzw==
X-Forwarded-Encrypted: i=1; AJvYcCVQLsCbKetap+o1F/IPYSurqhrolUg5YRS4c5JJ9pYED1QesmkX2afcjL2lc+W/HsynyPfprPnD0UvB7Hrn0RlH@lists.infradead.org
X-Gm-Message-State: AOJu0YxWb2qNTO/nmoOZYfRZ6Ea1fTzNW3H0d78WIz9KwwxlMpUCJlF5
	wx4ks4AQIRHzINRUsyVILVbOPakpEELtA7cQaCzBbzboU/nc9DX5RGapk1eomcWE9BBMEXzEtP7
	3ZtCKk1SnxPJILBgvyKL+3X79qNjhAhvtkX/n5Q==
X-Gm-Gg: ASbGncu/inmCIusoa6D4XKERKlW5lqqSfCD1ZaO6XTbP8Bc154tBcOCYShnppok7vcb
	1NZ73KO1UHRSIhZEhRvpam6GIO3sIIA==
X-Google-Smtp-Source: AGHT+IFQAF45jSUX7G+c3P5oVfTSj462ZlR4upknCoRsECBqNzH0Ltm8COxlV0RAMg5Yp5X62i6d6iGKuwvltseW+R8=
X-Received: by 2002:a05:6512:12cd:b0:53d:d467:3aa1 with SMTP id
 2adb3069b0e04-53e12a26357mr3998871e87.40.1733320474328; Wed, 04 Dec 2024
 05:54:34 -0800 (PST)
MIME-Version: 1.0
References: <20241204102904.1863796-1-arnd@kernel.org> <20241204102904.1863796-2-arnd@kernel.org>
In-Reply-To: <20241204102904.1863796-2-arnd@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 4 Dec 2024 14:54:23 +0100
Message-ID: <CACRpkdYmCzYT6s3XaQURLW9ak1xvzuKPpm_LB5GM+AzNUHtv7g@mail.gmail.com>
Subject: Re: [PATCH 01/15] ARM: use CONFIG_AEABI by default everywhere
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Arnd Bergmann <arnd@arndb.de>, Aaro Koskinen <aaro.koskinen@iki.fi>, Andrew Lunn <andrew@lunn.ch>, 
	Ard Biesheuvel <ardb@kernel.org>, Daniel Mack <daniel@zonque.org>, 
	Gregory Clement <gregory.clement@bootlin.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	"Jeremy J. Peper" <jeremy@jeremypeper.com>, Kristoffer Ericson <kristoffer.ericson@gmail.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Ralph Siemsen <ralph.siemsen@linaro.org>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Russell King <linux@armlinux.org.uk>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_135438_705673_ED79CF50 
X-CRM114-Status: GOOD (  19.11  )
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

On Wed, Dec 4, 2024 at 11:29=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wro=
te:

> From: Arnd Bergmann <arnd@arndb.de>
>
> On ARMv4 and ARMv5, the default is still to build for OABI, with
> CONFIG_AEABI disabled, even though distros and toolchains no longer
> support OABI as a target.
>
> Change the default to EABI for all architecture levels and change
> the defconfig entries as follows:
>
>  - All machines that used to explicitly enable EABI can drop that line no=
w
>  - Machines that are likely to actually use old distros and had NWFPE
>    enabled in combination with OABI (rpc, footrbridge, netwinder,
>    assabet, neponset) explicitly turn it on now.
>  - Machines that already had both EABI and NWFPE disabled in defconfig
>    (at91_dt, collie, ep93xx, gemini, h3600, imx_v4_v5, integrator, jornad=
a,
>    moxart, multi_v4t, omap1) were likely not usable with either OABI or
>    EABI and now use EABI instead implicitly, making it more likely that
>    they could work.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

For these:

>  arch/arm/configs/gemini_defconfig       |  1 -
>  arch/arm/configs/integrator_defconfig   |  1 -
>  arch/arm/configs/ixp4xx_defconfig       |  1 -
>  arch/arm/configs/netwinder_defconfig    |  1 +
>  arch/arm/configs/nhk8815_defconfig      |  1 -
>  arch/arm/configs/versatile_defconfig    |  1 -

Acked-by: Linus Walleij <linus.walleij@linaro.org>

I only ever use these platforms with AEABI, and a corresponding
userspace.

My userspace for the Faraday FA526 uses the OpenWrt-resident
GCC --fix-v4bx hack:
https://github.com/openwrt/openwrt/blob/main/toolchain/gcc/patches-14.x/840=
-armv4_pass_fix-v4bx_to_ld.patch
(maybe this is a bit sloppy but it works for us)

Maybe LLVM CLANG can build an ARMv4 userspace without this
hack? I haven't looked closer.

Yours,
Linus Walleij

