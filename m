Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE55FC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 07:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2JijS86Jw1VKItMsxEtHHn8Jv2/Telj2s55VY9QKuIU=; b=wypIBOOiJkp7BucFNhtrX0Ky4R
	ZqzXQd7utoUoYVGm8v67L9h24UCKaUPLs6Mp/tUdJBMR4uNbkdqwyNv+FV/c6aVkG7NzL89JhtG+z
	/na2LAEqGHDyK63WLYdHiP2GCKJz5KtMDkC0Nd+wrl4CQHwZM8vP1p7m+gP9TvMm8z9uIORGrLsIx
	O66nS3koL6X8uPhsQlKWzSs7LY75u7BEnHIes06BwJW3B5D68XJKrf7oo6V1hMNQ4NpiOE46kWCRV
	jE8cGoNylTLv8owounjxF1gPVcWdMHLtlc2T+cgFEjcuxmRXwDvod9s/yqAZpexm36xQoIFb7wIHn
	9y1VidDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKl6-00000009fSB-1HzZ;
	Thu, 30 Jul 2026 07:00:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKl4-00000009fRj-0NXK;
	Thu, 30 Jul 2026 07:00:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A7F3A40A2E;
	Thu, 30 Jul 2026 07:00:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 618131F000E9;
	Thu, 30 Jul 2026 07:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785394845;
	bh=2JijS86Jw1VKItMsxEtHHn8Jv2/Telj2s55VY9QKuIU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lKOZbfri9z5YOMp6hAdPIvqp4XAFYFEB9wvMDaz6nuMB+Cir+KxLlA0QIC7SHvyCn
	 mNjxjVDsq+zgleMpHQAXI1pmmW45eg8z/NWZu4BmvXxkQkSmQkSm7Q4HZBvrAH/x84
	 ysDI5UKoDMTylhOmsF/Kpdylo2kwA7cNEfHra0sp8Ypd1Lv2jORKJsVuuUDDG6kuzc
	 4K1/3szDXdmbSDvknNjsTqDIOIWLsrdefgugfK5rljV8aof2A+yk3sg6UXfFaePb+M
	 B2LNd19p2SVYg7hBh5B9bomb2AS0ikh8x3dftcs4lxQFg/ryRxxxxFWv7d23bD7Weu
	 rP3N476pdYWNg==
Date: Thu, 30 Jul 2026 09:00:40 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Daniel Drake <dan@reactivated.net>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, nick.hollinghurst@raspberrypi.com, 
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v2 4/5] iommu: Add Broadcom BCM2712 IOMMU driver
Message-ID: <20260730-small-solid-spoonbill-8a8bbd@quoll>
References: <20260727-bcm2712-iommu-submit-v2-0-0247b5c03de8@reactivated.net>
 <20260727-bcm2712-iommu-submit-v2-4-0247b5c03de8@reactivated.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260727-bcm2712-iommu-submit-v2-4-0247b5c03de8@reactivated.net>
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

On Mon, Jul 27, 2026 at 09:43:59PM +0100, Daniel Drake wrote:
> +static int bcm2712_iommu_init_cache(struct bcm2712_iommu *mmu,
> +				    struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct platform_device *cache_pdev;
> +	struct device_node *cache_np;
> +
> +	cache_np = of_parse_phandle(dev->of_node, "brcm,iommu-cache", 0);
> +
> +	/* Fall back on 'cache' property used in old/downstream firmware */
> +	if (!cache_np)
> +		cache_np = of_parse_phandle(dev->of_node, "cache", 0);

NAK.

You cannot have undocumented ABI. I asked you to drop this at v1.

Best regards,
Krzysztof


