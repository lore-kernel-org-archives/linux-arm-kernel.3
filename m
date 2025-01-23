Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D601EC02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 20:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+JkSlsaIfhcFzvcBCwyzBDOC4gQnSGt2mpkIon0qZ64=; b=gyo0zI4xW9cCGnTsUrA/BwQhOd
	4lBFM4RnpDhMHJ8GyAwoQ51wmSdlNFKpducS7zMGJGkTDug2EGyxLWJDHZlTq6exctnXikyJjsCV8
	8C+WjG5x1Moz33+MGuwJll13bX3J1xZE52k2abGC7al6oC1DBV544E7iC9UdkDCLm5jfTxCz2L9Q/
	E68kvP7AtKeyDRA5LkPYqmDEBZlQHlwYOBeihTsSV4AxmCgCuBwXe6e6z7V6pIRhC95AJUiItfzyg
	uCcWVKm3/VR9ZBhXXoPhdWbNbBA9J4vB7jHPCtJxCtmLFVilozKjcU8FqF6IvsK0yBXXK7jIKnhYT
	TYwwFY+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb3Vh-0000000DCYu-2HId;
	Thu, 23 Jan 2025 20:09:05 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tb3UP-0000000DCTW-2uHP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 20:07:47 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50NK7gBZ1256773
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Jan 2025 14:07:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737662862;
	bh=+JkSlsaIfhcFzvcBCwyzBDOC4gQnSGt2mpkIon0qZ64=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Bh00+rr9e2qKlFCS4tadjOXJ8upWWlchxNQ5nI4bRx4T/q3Ds52DK2liH20+/Anq0
	 O12FQh+nyKmOn5ZSyERox6RoDcNx6twxpF79QBDHYZviQxatfyi8TQKEf+DrkM4g12
	 4iT1JGiHemNS8cyQNdg3MmmSqbus3MJTWGO7Js3w=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50NK7gbI089921
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 23 Jan 2025 14:07:42 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 23
 Jan 2025 14:07:41 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 23 Jan 2025 14:07:41 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50NK7fjU008713;
	Thu, 23 Jan 2025 14:07:41 -0600
Date: Thu, 23 Jan 2025 14:07:41 -0600
From: Nishanth Menon <nm@ti.com>
To: Andrew Davis <afd@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>,
        Santosh Shilimkar
	<ssantosh@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        "Rob Herring (Arm)" <robh@kernel.org>, Lee
 Jones <lee@kernel.org>
Subject: Re: [PATCH] soc: ti: k3-socinfo: Do not use syscon helper to build
 regmap
Message-ID: <20250123200741.wcpnqejut5b6zkvp@consonant>
References: <20250123181726.597144-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250123181726.597144-1-afd@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_120745_821209_A97F391F 
X-CRM114-Status: GOOD (  27.03  )
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

On 12:17-20250123, Andrew Davis wrote:
> The syscon helper device_node_to_regmap() is used to fetch a regmap
> registered to a device node. It also currently creates this regmap
> if the node did not already have a regmap associated with it. This
> should only be used on "syscon" nodes. This driver is not such a
> device and instead uses device_node_to_regmap() on its own node as
> a hacky way to create a regmap for itself.
> 
> This will not work going forward and so we should create our regmap
> the normal way by defining our regmap_config, fetching our memory
> resource, then using the normal regmap_init_mmio() function.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---

This is part of the fixes TI K3 platforms boot issues reported in
https://lore.kernel.org/all/b2413460-ec8b-4c77-99b8-4c32b262439a@ti.com/
on the latest linus master v6.13-5001-gd0d106a2bd21 + linux
next-20250123

Total set of patches tested with:
https://lore.kernel.org/all/20250119182121.3956546-1-vaishnav.a@ti.com/
https://lore.kernel.org/r/20250123181726.597144-1-afd@ti.com
https://lore.kernel.org/r/20250123181913.597304-1-afd@ti.com
https://lore.kernel.org/r/20250123182059.597491-1-afd@ti.com
https://lore.kernel.org/r/20250123182234.597665-1-afd@ti.com

I will try and get this in at the earliest possible window. Thanks for
providing a fix.

Cc Rob and Lee

>  drivers/soc/ti/k3-socinfo.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/ti/k3-socinfo.c b/drivers/soc/ti/k3-socinfo.c
> index 4fb0f0a248288..704039eb3c078 100644
> --- a/drivers/soc/ti/k3-socinfo.c
> +++ b/drivers/soc/ti/k3-socinfo.c
> @@ -105,6 +105,12 @@ k3_chipinfo_variant_to_sr(unsigned int partno, unsigned int variant,
>  	return -ENODEV;
>  }
>  
> +static const struct regmap_config k3_chipinfo_regmap_cfg = {
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +};
> +
>  static int k3_chipinfo_probe(struct platform_device *pdev)
>  {
>  	struct device_node *node = pdev->dev.of_node;
> @@ -112,13 +118,18 @@ static int k3_chipinfo_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct soc_device *soc_dev;
>  	struct regmap *regmap;
> +	void __iomem *base;
>  	u32 partno_id;
>  	u32 variant;
>  	u32 jtag_id;
>  	u32 mfg;
>  	int ret;
>  
> -	regmap = device_node_to_regmap(node);
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	regmap = regmap_init_mmio(dev, base, &k3_chipinfo_regmap_cfg);
>  	if (IS_ERR(regmap))
>  		return PTR_ERR(regmap);
>  
> -- 
> 2.39.2
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

