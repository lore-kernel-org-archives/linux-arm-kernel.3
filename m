Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4673EC71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 08:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZqI7kAo6MeG0sMHvX7PV6GcdL7E7AfKvl43JH5JjnsA=; b=NGUYIb8gL3sEs4at0RD7RdId7I
	66PxyDrx6yfKlC8vZyaWJBtYpKyozlnDrpf6rT5QYtyMT1KaBswqbc0h+jgTM3k/VbHXakNRms8XW
	2a5RO8qQIBvTf1ZHNZbLm8+7Cni7g8opgTFvCxQmMyoZwsTaZ/o5dBykYP96WP8vq6p/bHczgaquA
	IEe+5KXt5CASoSItexfg8mQVbXIXBQ0SMVxbtm8tl0iXoU7WFRF1R0NhRCaMgsGzzktthpaAl/asb
	axHYC/vMtmjSwVQRg/A9n0EQ/i1EsuK38fqyuhk/+TwurifjnN7IueEzNoND9C0CGJMKqInwyqr9P
	lj+gfDZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR5ee-00000003rGY-3rP7;
	Mon, 16 Jun 2025 08:57:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR4xL-00000003l0p-326S;
	Mon, 16 Jun 2025 08:12:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 25A394A054;
	Mon, 16 Jun 2025 08:12:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F231C4CEEA;
	Mon, 16 Jun 2025 08:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750061559;
	bh=WNQjjeV2gpE3amaa7wziU/9tXorxQQ+MAUeb2tTJ1Qo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gra7XrJGV4ZiC9vwS2uNjs0AZSx2u8/PhN1+EJGI0ROURDSEW8XMDu7r3vG+1d0JZ
	 UvefqBXj04DnNpChqeHfukMy8bj9FcFik6jeT552r0ILMIOQzXN+8wrhAe+aL8rJbg
	 94wKlcnjz5imUN5HQrZxU/JxiSc6KaZk1M1lC0HgpvZOSjezQ0MYhkVc7x3IM696Sf
	 k38l+6hMaHDTR4HmcfXfUlvvTLy5Kx8KzzDuqdX/lWW2APKBVl7HC92Ko7TIImRsgh
	 pgo9E+Rr4L4Khf+d7Zk5nI7O3Jt+wbXZjtxM6dZ5j4+Fku/iMxhnNwGz9rqf5fxEeP
	 uJY1v9tkI6CKQ==
Date: Mon, 16 Jun 2025 10:12:35 +0200
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
Subject: Re: [PATCH v3 2/9] phy: exyons5-usbdrd: support HS phy for
 ExynosAutov920
Message-ID: <20250616-boisterous-mouse-of-current-adfd67@kuoka>
References: <20250613055613.866909-1-pritam.sutar@samsung.com>
 <CGME20250613055043epcas5p2437abc65042529a2012a6ca80559ac80@epcas5p2.samsung.com>
 <20250613055613.866909-3-pritam.sutar@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250613055613.866909-3-pritam.sutar@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_011239_851938_462F460C 
X-CRM114-Status: GOOD (  16.02  )
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

On Fri, Jun 13, 2025 at 11:26:06AM GMT, Pritam Manohar Sutar wrote:
> This SoC has a single USB 3.1 DRD combo phy that supports both
> UTMI+ (HS) and PIPE3 (SS) and three USB2.0 DRD HS phy controllers
> those only support the UTMI+ (HS) interface.
> 
> Support only UTMI+ port for this SoC which is very similar to what
> the existing Exynos850 supports.
> 
> The combo phy support is out of scope of this commit.
> 
> Add required change in phy driver to support HS phy for this SoC.
> 
> Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
> ---
>  drivers/phy/samsung/phy-exynos5-usbdrd.c | 25 ++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> index 917a76d584f0..15965b4c6f78 100644
> --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> @@ -2025,6 +2025,28 @@ static const struct exynos5_usbdrd_phy_drvdata exynos850_usbdrd_phy = {
>  	.n_regulators		= ARRAY_SIZE(exynos5_regulator_names),
>  };
>  
> +static const struct phy_ops exynosautov920_usbdrd_phy_ops = {
> +	.init		= exynos850_usbdrd_phy_init,
> +	.exit		= exynos850_usbdrd_phy_exit,
> +	.owner		= THIS_MODULE,
> +};
> +
> +static const struct exynos5_usbdrd_phy_config phy_cfg_exynosautov920[] = {
> +	{
> +		.id		= EXYNOS5_DRDPHY_UTMI,
> +		.phy_init	= exynos850_usbdrd_utmi_init,
> +	},
> +};
> +
> +static const struct exynos5_usbdrd_phy_drvdata exynosautov920_usbdrd_phy = {
> +	.phy_cfg		= phy_cfg_exynosautov920,
> +	.phy_ops		= &exynosautov920_usbdrd_phy_ops,
> +	.clk_names		= exynos5_clk_names,
> +	.n_clks			= ARRAY_SIZE(exynos5_clk_names),
> +	.core_clk_names		= exynos5_core_clk_names,
> +	.n_core_clks		= ARRAY_SIZE(exynos5_core_clk_names),

Where are the supplies? Where is power on/off seqequence in the phy
ops?

No pmu control (missing offset)?

You have entire commit msg to explain unusual things.

Best regards,
Krzysztof


