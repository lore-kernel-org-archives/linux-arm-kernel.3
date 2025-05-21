Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE2F0C54E92
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 10:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6elJAwhXgPNbnSawcUMUmxZhhZa/nlhEIID7Gj1JXxw=; b=poCQ1OphVcmbQHNciq89KOU1/o
	Dc9FOBapIhWglTAo3yr8q/ZMdB9ybGLsWcilyTmrPoBXlHQIXj7k6pEFb7zi0EnxOzkX7X87h8Xfd
	n9fOyX5HxMNwDTCo6nQsqe/mspGRL9WMkMK9k8dBcr4PNlqBDDaOOxr4mVMpAs1bf9l5BgE8grp2Q
	gg9VQdWVxF8LjEoqNDTsTN+zywppn7KXXt9Ri5HjMJ91REzS6pmK2mHjlr7UutdS3sdcVLW7fy9jx
	x656vwKW2WQ7OsrhFqoPUYMAWNpHE4bQp9KTWhXxQTtDtAHmceS/VKpm1ue1KIr2urlnyZm4vAD83
	/B/jFppA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHgho-0000000FSq6-22nv;
	Wed, 21 May 2025 10:29:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHg3k-0000000FMph-2j1A;
	Wed, 21 May 2025 09:48:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DE54E5C51B8;
	Wed, 21 May 2025 09:46:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24CFCC4CEE4;
	Wed, 21 May 2025 09:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747820903;
	bh=eSB4+kYQk9B5Ny4FaYdOJjyIyatCOgRUu77XD/ivzsE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gblETKwjKAg/6vPGvMLFwRLy+nIftJcjXdnCHOvYyXv9G7Lkwb6k7dY8yvunqG1IA
	 crYzV1ujSs0vfCEeKG8/q2CUW67AHnNJhteYhFiE9yveWc7hH1zsp+3sot6hu/rE03
	 Zhc3bNANh32VIP4E/I1GHUpfy5cxDjyeWNsdISUwtWvkeHe8rHZ8lS+9bc54UxPoVD
	 3hj24fwedWXb1TLOc/DBKeFXhe/jU7liX553FZsoG4l4tYG10xS0lxoKgb8x9Aucek
	 l1+AOWG1lnDqihrcepARsaJ5huNo9vUKDERCMj4MwVw+Forxl1171xq7j1Y0kEv5Zg
	 Ppn1TgTmIN76w==
Date: Wed, 21 May 2025 11:48:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shradha Todi <shradha.t@samsung.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.or, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, manivannan.sadhasivam@linaro.org, lpieralisi@kernel.org, 
	kw@linux.com, robh@kernel.org, bhelgaas@google.com, jingoohan1@gmail.com, 
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com, vkoul@kernel.org, 
	kishon@kernel.org, arnd@arndb.de, m.szyprowski@samsung.com, jh80.chung@samsung.com
Subject: Re: [PATCH 09/10] PCI: exynos: Add support for Tesla FSD SoC
Message-ID: <20250521-competent-honeybee-of-will-3f3ae1@kuoka>
References: <20250518193152.63476-1-shradha.t@samsung.com>
 <CGME20250518193300epcas5p17e954bb18de9169d65e00501b1dcd046@epcas5p1.samsung.com>
 <20250518193152.63476-10-shradha.t@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250518193152.63476-10-shradha.t@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_024824_727363_4189AE6A 
X-CRM114-Status: GOOD (  13.66  )
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

On Mon, May 19, 2025 at 01:01:51AM GMT, Shradha Todi wrote:
>  static int exynos_pcie_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -355,6 +578,26 @@ static int exynos_pcie_probe(struct platform_device *pdev)
>  	if (IS_ERR(ep->phy))
>  		return PTR_ERR(ep->phy);
>  
> +	if (ep->pdata->soc_variant == FSD) {
> +		ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(36));
> +		if (ret)
> +			return ret;
> +
> +		ep->sysreg = syscon_regmap_lookup_by_phandle(dev->of_node,
> +				"samsung,syscon-pcie");
> +		if (IS_ERR(ep->sysreg)) {
> +			dev_err(dev, "sysreg regmap lookup failed.\n");
> +			return PTR_ERR(ep->sysreg);
> +		}
> +
> +		ret = of_property_read_u32_index(dev->of_node, "samsung,syscon-pcie", 1,
> +						 &ep->sysreg_offset);
> +		if (ret) {
> +			dev_err(dev, "couldn't get the register offset for syscon!\n");

So all MMIO will go via syscon? I am pretty close to NAKing all this,
but let's be sure that I got it right - please post your complete DTS
for upstream. That's a requirement from me for any samsung drivers - I
don't want to support fake, broken downstream solutions (based on
multiple past submissions).

Best regards,
Krzysztof


