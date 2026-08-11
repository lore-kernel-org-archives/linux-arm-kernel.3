Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60413C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 07:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=umesvR1teUL1fcs6zCQaA4uwUSphr0DcLDjBnMFX9JE=; b=it+pt+plRi19CXkWjtHHZB8pTF
	l55xollKA1VYyFTFQKANb76uM9lXgj4GEHTjvaOo/SQYUnUuDlr5d0vYaUEgbmC4vq27phCFtBgAz
	7R2ZLNNqk5V61RwJJzyT9V35IKKU4zic2jjH3bKiBlALS/S02LJ8G8zLA7muUS39GIiJKMO522jiD
	V9acbG75ik1HeZ4RMzS0WbLn/7qM4FRpbIbQ5MaZBzUkhZ9DsacJQswNWdbqWmPAJ+lErRHon3ugH
	JQuE7SyTo/0mdew6YtwQs8/yaTvxBj1mA+j3zKGiasUDLCyob36kUuCHJjFZ/78rb2N57ZnZ2OVG3
	NDppREow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtgvv-0000000DWgA-3mno;
	Tue, 11 Aug 2026 07:30:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtgvu-0000000DWfs-41IG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 07:29:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 57A6943BED
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 07:29:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20D961F0155A
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 07:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786433398;
	bh=umesvR1teUL1fcs6zCQaA4uwUSphr0DcLDjBnMFX9JE=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=h9MJlD/TMbk1yYwxU1auxF3+RTiscFC8LEVkGOBR3L0L5NnHKaO35NeHFQbkMq7+X
	 KpjM6059ZumPxL3YaJJ58W+d2plUYv4UhsRjmuO8c3PXeMRGCo+WjQwVyHS+HdmnaK
	 LESbW/tUZTbeRqV6Rk3F3JSfA/7Urk1eaIb/1Ty0XHB5rNkIVSx2kwVbMo1mRDUDw3
	 8o759Z3P0QB95srqkPVsv9lYLOwLewOTKZjSmDHfT2kiJ1N12/qyE9e8ikWarOH8nB
	 VB9Z+UoNQoVli6ZzDwo80aAOEb2AsdwLNGx6T1wTP/5l3SSeem4O5GSgqDCWkq7rGM
	 zcHmD5JC4udtQ==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aebd52488cso2853687e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 00:29:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoNtDBnaDY3aPvltlzunZJYkJimCXQ/fTB2KscRRsObM67+HMxI6LPuEWYM1rzStBYuVc7vgqOtKW5SnNgocU/p@lists.infradead.org
X-Gm-Message-State: AOJu0YxU7N6SBhNeAzNMJzOsY8LrISsca2aFT46dNsPPK7pqBur1uPWU
	VyDf566SAHA/7RsWl2YZhExF9slHr5cnPKxLAiVa97nUv0EdO7vUPLMA/lYM9gNjZs+lVo64djV
	aqItEfNiANLjKEzikd6MeByJQ2BKc129v8+9BgcVjGQ==
X-Received: by 2002:a05:6512:3096:b0:5b1:5451:d969 with SMTP id
 2adb3069b0e04-5b448649002mr229675e87.25.1786433396689; Tue, 11 Aug 2026
 00:29:56 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 11 Aug 2026 00:29:55 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 11 Aug 2026 00:29:55 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260810213456.1268831-1-marex@nabladev.com>
MIME-Version: 1.0
References: <20260810213456.1268831-1-marex@nabladev.com>
Date: Tue, 11 Aug 2026 00:29:55 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfnU5mJHsoJee-8-xy3e7vXE5yORfZRN9=Wom2-+ZocUQ@mail.gmail.com>
X-Gm-Features: AUfX_mw3-GSxONxlPDeIuQSCzqxdWbLCCFW-DmbFUzmLFDfvwVGs6ZIrWEPCMBI
Message-ID: <CAMRc=MfnU5mJHsoJee-8-xy3e7vXE5yORfZRN9=Wom2-+ZocUQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: Select HAVE_SHARED_GPIOS for ARCH_MXC
To: Marek Vasut <marex@nabladev.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Fedor Ross <fedor.ross@ifm.com>, Frank Li <Frank.Li@nxp.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, Will Deacon <will@kernel.org>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
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

On Mon, 10 Aug 2026 23:34:38 +0200, Marek Vasut <marex@nabladev.com> said:
> Some NXP i.MX platforms use shared GPIOs. Enable support for them by
> selecting the Kconfig switch provided by GPIOLIB.
>
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Bartosz Golaszewski <brgl@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Fedor Ross <fedor.ross@ifm.com>
> Cc: Frank Li <Frank.Li@nxp.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  arch/arm64/Kconfig.platforms | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index d2acfac730037..bc279b864d3cb 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -275,6 +275,7 @@ config ARCH_MXC
>  	bool "NXP i.MX SoC family"
>  	select ARM64_ERRATUM_843419
>  	select ARM64_ERRATUM_845719 if COMPAT
> +	select HAVE_SHARED_GPIOS
>  	select IMX_GPCV2
>  	select IMX_GPCV2_PM_DOMAINS
>  	select PM
> --
> 2.53.0
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

