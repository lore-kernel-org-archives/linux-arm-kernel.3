Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC3ECA0FF7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 08:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SdOWi2UEtM5sH76Xw90D+BD8MyqOdvac/zHgDsx1Nac=; b=eGnAqwTPRoxcWudql4l3g5cOZb
	ZYCkefYw/QtXueFXuENezczn1Tu0g6kYbLTZecOa+x1pGcGuxljEWLcgYsF//QclSox584wjOfd2U
	0w+k/7WdddNrzdbwjxG4tFmXvYV305H/ORqVGpYSeEI5U67t36kd9TsyxNszu5/bkRKQ+yXZVjraR
	VwktTGeOu2QULRDQoQZAkLZesx0SfJVMti428KoshtjvQILcLyPcTc3rgnHv4iWEzgRPJrVAgH5HC
	h7rPaQud8RYlTNkvNNU9+u7EgQ79Xw7BDQNzoj4UZTNRWWl58s4K/YtTZQI43gH6490xNDn65A1D3
	oP/xIGHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uruPT-00000004xrN-1yYd;
	Fri, 29 Aug 2025 08:24:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urtxy-00000004qeO-0J37
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 07:56:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9FA4244719;
	Fri, 29 Aug 2025 07:56:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA52BC4CEF0;
	Fri, 29 Aug 2025 07:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756454169;
	bh=gEVY2TEOLXWuc/PylIHeYa0ayOzElTCYmrn2BP+q/ow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ThUpyuCEt+rHjGchX/jdas1nJIAeIqJ6AnMYOF9cySZOYAnrJZYC/QcNcxw2bHsMR
	 f1bS5mUqF9syMOLObU9aoV97mJjLf4lbHaYNHo2UrzxWImgkd3rV7YWUeRrqiu5ujd
	 zdBpWZrXThODYKC6Yay5tyTon+RB67NHLqQYKCalVyKw98bTZgRb927gWS14SJwVS+
	 v+iAlJSdNA69eV935f/yCfNPpnUtlbxGk7DaTpnRylJJJwdhvVh3EJOOo2IRZXw7Va
	 UCO8AhPWZTjqDZXc2LWD7ROB8k2Gtf9BrFLnJNtLT9l+JJEt8BTHB1UXGdssEAkXzj
	 mRAxskbk1f3YA==
Date: Fri, 29 Aug 2025 09:56:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ravi Patel <ravi.patel@samsung.com>
Cc: jesper.nilsson@axis.com, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, s.nawrocki@samsung.com, 
	cw00.choi@samsung.com, alim.akhtar@samsung.com, linus.walleij@linaro.org, 
	tomasz.figa@gmail.com, catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de, 
	ksk4725@coasia.com, kenkim@coasia.com, pjsin865@coasia.com, gwk1013@coasia.com, 
	hgkim05@coasia.com, mingyoungbo@coasia.com, smn1196@coasia.com, 
	pankaj.dubey@samsung.com, shradha.t@samsung.com, inbaraj.e@samsung.com, 
	swathi.ks@samsung.com, hrishikesh.d@samsung.com, dj76.yang@samsung.com, 
	hypmean.kim@samsung.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@axis.com, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	soc@lists.linux.dev
Subject: Re: [PATCH v3 08/10] arm64: dts: exynos: axis: Add initial ARTPEC-8
 SoC support
Message-ID: <20250829-attentive-watchful-guan-b79ccc@kuoka>
References: <20250825114436.46882-1-ravi.patel@samsung.com>
 <CGME20250825120735epcas5p3c86b9db5f17c0938f1d53ef6014ab342@epcas5p3.samsung.com>
 <20250825114436.46882-9-ravi.patel@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250825114436.46882-9-ravi.patel@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_005610_148517_CEFB2945 
X-CRM114-Status: GOOD (  13.49  )
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

On Mon, Aug 25, 2025 at 05:14:34PM +0530, Ravi Patel wrote:
>  config ARCH_AXIADO
>  	bool "Axiado SoC Family"
>  	select GPIOLIB
> diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/exynos/Makefile
> index bdb9e9813e50..bcca63136557 100644
> --- a/arch/arm64/boot/dts/exynos/Makefile
> +++ b/arch/arm64/boot/dts/exynos/Makefile
> @@ -1,4 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
> +subdir-y += axis
>  subdir-y += google
>  
>  dtb-$(CONFIG_ARCH_EXYNOS) += \
> diff --git a/arch/arm64/boot/dts/exynos/axis/artpec-pinctrl.h b/arch/arm64/boot/dts/exynos/axis/artpec-pinctrl.h
> new file mode 100644
> index 000000000000..70bd1dcac85e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/axis/artpec-pinctrl.h
> @@ -0,0 +1,36 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

Does not match rest of licenses.

> +/*
> + * Axis ARTPEC-8 SoC device tree pinctrl constants
> + *
> + * Copyright (c) 2025 Samsung Electronics Co., Ltd.
> + *             https://www.samsung.com
> + * Copyright (c) 2025  Axis Communications AB.
> + *             https://www.axis.com
> + */
> +
> +#ifndef __DTS_ARM64_SAMSUNG_EXYNOS_AXIS_ARTPEC_PINCTRL_H__
> +#define __DTS_ARM64_SAMSUNG_EXYNOS_AXIS_ARTPEC_PINCTRL_H__
> +
> +#define ARTPEC_PIN_PULL_NONE		0
> +#define ARTPEC_PIN_PULL_DOWN		1
> +#define ARTPEC_PIN_PULL_UP		3
> +
> +#define ARTPEC_PIN_FUNC_INPUT		0
> +#define ARTPEC_PIN_FUNC_OUTPUT		1
> +#define ARTPEC_PIN_FUNC_2		2
> +#define ARTPEC_PIN_FUNC_3		3
> +#define ARTPEC_PIN_FUNC_4		4
> +#define ARTPEC_PIN_FUNC_5		5
> +#define ARTPEC_PIN_FUNC_6		6
> +#define ARTPEC_PIN_FUNC_EINT		0xf
> +#define ARTPEC_PIN_FUNC_F		ARTPEC_PIN_FUNC_EINT
> +
> +/* Drive strength for ARTPEC */
> +#define ARTPEC_PIN_DRV_SR1		0x8
> +#define ARTPEC_PIN_DRV_SR2		0x9
> +#define ARTPEC_PIN_DRV_SR3		0xa
> +#define ARTPEC_PIN_DRV_SR4		0xb
> +#define ARTPEC_PIN_DRV_SR5		0xc
> +#define ARTPEC_PIN_DRV_SR6		0xd
> +
> +#endif /* __DTS_ARM64_SAMSUNG_EXYNOS_AXIS_ARTPEC_PINCTRL_H__ */
> diff --git a/arch/arm64/boot/dts/exynos/axis/artpec8-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/axis/artpec8-pinctrl.dtsi
> new file mode 100644
> index 000000000000..8d239a70f1b4
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/axis/artpec8-pinctrl.dtsi
> @@ -0,0 +1,120 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)

This is Dual license, so why pincltr header is not?

Best regards,
Krzysztof


