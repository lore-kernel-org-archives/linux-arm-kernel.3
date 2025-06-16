Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3CD3C71135
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 09:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vGuRi2Bnf/EPD8X5sOGiu6HEjL1dtabGiiIsrTKbE0U=; b=QUsnu3vdptA3AMTFgSpGblh9oq
	by/NUaegDbk96OwFZ+RVD8OV7+6joB+nguYLBO6gKDmOGrxtqyKhyVKdWS2khWBSKMDJZgaDBQO8W
	B5C+vWTcx4n28u/j1vOyowMEWfnsGfdTDNWzqnXfpqX+gqcbsUvmyoilk7hcgLth7/HDSmg0JsM4W
	8w61N+7TTDXYsb9IduBVWlFDJdIvmlNspHICIN4HLVh9Sklyqff6aP+SSuFegGMhY0z+vRjSsCN8/
	y7gQinRa6HOWcxXrhTWGFQciBPFQyiGt8yr1Lzg0LL63xU+qCzY8soJaEjgc/SV3r8N+In/qpIywu
	Ojwk4FSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR5pa-00000003sYN-0JQk;
	Mon, 16 Jun 2025 09:08:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR51d-00000003lbs-0lGA;
	Mon, 16 Jun 2025 08:17:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 41EB85C5831;
	Mon, 16 Jun 2025 08:14:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDF3AC4CEEA;
	Mon, 16 Jun 2025 08:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750061823;
	bh=Pv+qRkMsv9lRRwPOjtQx71ZyCSusRSw8Q6iZKmn358g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fhV+NdKfZ+tv9iKOkcX2Fd/stsEHXlDLgbZZ1aubgk+935jgjOEEqSk2W9BrwD/OR
	 6teDMlggVHffNW4Jm5wlNJ2W4lhC+fBpKnDcwBn8gUMp25sUGGYvJwssbLFIMaldEh
	 rBM1XkrKFROhYfMBBWfssLhA8im15DlDYFes0JdtdhE3TaoKU5s7MVHi11hRDTSlYt
	 wM1rgqK1Z1MctNHjdj8mX6nB2323Z8utUD4RFbt4pGX3Md9S5aDGam+S6vASYAZyXn
	 8/WtLhVc3Aobu9fB1lf3fA9TzR5henk8IPvX1zTD2Q0+2VeM3rMmGQcsIINcksIkuT
	 U+K5g7h9GRLdA==
Date: Mon, 16 Jun 2025 10:17:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pritam Manohar Sutar <pritam.sutar@samsung.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com, 
	andre.draszik@linaro.org, peter.griffin@linaro.org, kauschluss@disroot.org, 
	ivo.ivanov.ivanov1@gmail.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com, 
	dev.tailor@samsung.com, faraz.ata@samsung.com, muhammed.ali@samsung.com, 
	selvarasu.g@samsung.com
Subject: Re: [PATCH v3 5/9] phy: exyons5-usbdrd: support HS combo phy for
 ExynosAutov920
Message-ID: <20250616-proud-statuesque-polecat-616eaf@kuoka>
References: <20250613055613.866909-1-pritam.sutar@samsung.com>
 <CGME20250613055053epcas5p377269bcc2c8567c00a2298d86c0d26a4@epcas5p3.samsung.com>
 <20250613055613.866909-6-pritam.sutar@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250613055613.866909-6-pritam.sutar@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_011705_311400_8398C080 
X-CRM114-Status: UNSURE (   6.47  )
X-CRM114-Notice: Please train this message.
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

On Fri, Jun 13, 2025 at 11:26:09AM GMT, Pritam Manohar Sutar wrote:
> +static const struct
> +exynos5_usbdrd_phy_config usbdrd_hsphy_cfg_exynosautov920[] = {
> +	{
> +		.id		= EXYNOS5_DRDPHY_UTMI,
> +		.phy_init	= exynosautov920_usbdrd_utmi_init,
> +	},
> +};
> +
> +static const struct exynos5_usbdrd_phy_drvdata exynosautov920_usbdrd_hsphy = {
> +	.phy_cfg		= usbdrd_hsphy_cfg_exynosautov920,
> +	.phy_ops		= &exynosautov920_usb31drd_phy_ops,
> +	.clk_names		= exynos5_clk_names,
> +	.n_clks			= ARRAY_SIZE(exynos5_clk_names),
> +	.core_clk_names		= exynos5_core_clk_names,
> +	.n_core_clks		= ARRAY_SIZE(exynos5_core_clk_names),
> +};

Same questions: where are all other fields and resources?

Best regards,
Krzysztof


