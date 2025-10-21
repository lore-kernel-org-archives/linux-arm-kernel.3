Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E80CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 11:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wonPNlWchsA1qXbGSjFZR1auIRLgsv2ySZ9se4osWqQ=; b=Ex8uvLz6RgBYkx67mED5HuyvBU
	VypzKqhdgZGe32pGyl/gQiOfbaR3NM5nDBD2J0Wg5ajssB5gdASK6cMWsobNlQvaL6XCk81SUNTQm
	zODqKpDhP2vPlNor4JNqplJ9ppngbjJh/FN/t4lAD8cFzcwsCdtx7nsj0f+VZ2gcNDmfMtgoa6Wc1
	S3EnofQMm5KP2708AI7bE3dllymFy1L2ajVN7kxkX7Mzj+st481sTYH5Z0vlkvwyj4eVREWc2JzEr
	Y5abwYO6AoVkbcEA/GGxUZqtxnvx+KJpBoN96r+vHIRU7p1PD1R7d/NA5s5BmPKj6SKkMk6RWPqD+
	8OmK6/HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBAxk-0000000Gqxy-0TOQ;
	Tue, 21 Oct 2025 11:55:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBAxi-0000000Gqxj-3CMQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 11:55:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 309E7623E7;
	Tue, 21 Oct 2025 11:55:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 915FCC4CEF5;
	Tue, 21 Oct 2025 11:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761047719;
	bh=jd/Bf81nqyDyDpW6x/DkkmJv1ZNZPuhb0Hccb0F61Ds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oSQUZiuqFcr27MLiTsBV7/eyu+B9tAd9+WiNR/+vYCq4Kyor8RVuhDgiZJ7PrEwfu
	 0VVkCrosaoYXdn/ORSKBg6lbpOH/HK6MmzA4qX3zbXbp/sgVFzT6q+MDILz/7GnYgR
	 2mU4fZ5y7I5QguVmO0rDJ/J3AFUUNcR1AZdiy/YyGr/KyU5pTzUaorijRexd6t5MYR
	 bFTC9T+UMUfokIJqzVLZMAauWnt4wDYPwWG/szPZcobpG8MVs6lbRO0lFpLTL1KP/D
	 Y7vGTvFSOfJlpOAN7YaqBeFBxNX5G5UpbyeNwhRyPynE6ctLyMNzbNcJAzAsf3FOxS
	 9Y8IOc1WcwYcw==
Date: Tue, 21 Oct 2025 06:55:17 -0500
From: Rob Herring <robh@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Scott Branden <sbranden@broadcom.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Bjorn Helgaas <bhelgaas@google.com>, Ray Jui <rjui@broadcom.com>,
	Frank Li <Frank.Li@nxp.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Subject: Re: [PATCH v3 1/5] of/irq: Add msi-parent check to of_msi_xlate()
Message-ID: <20251021115517.GA3713879-robh@kernel.org>
References: <20251017084752.1590264-1-lpieralisi@kernel.org>
 <20251017084752.1590264-2-lpieralisi@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017084752.1590264-2-lpieralisi@kernel.org>
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

On Fri, Oct 17, 2025 at 10:47:48AM +0200, Lorenzo Pieralisi wrote:
> In some legacy platforms the MSI controller for a PCI host bridge is
> identified by an msi-parent property whose phandle points at an MSI
> controller node with no #msi-cells property, that implicitly
> means #msi-cells == 0.
> 
> For such platforms, mapping a device ID and retrieving the MSI controller
> node becomes simply a matter of checking whether in the device hierarchy
> there is an msi-parent property pointing at an MSI controller node with
> such characteristics.
> 
> Add a helper function to of_msi_xlate() to check the msi-parent property in
> addition to msi-map and retrieve the MSI controller node (with a 1:1 ID
> deviceID-IN<->deviceID-OUT  mapping) to provide support for deviceID
> mapping and MSI controller node retrieval for such platforms.
> 
> Fixes: 57d72196dfc8 ("irqchip/gic-v5: Add GICv5 ITS support")
> Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Sascha Bischoff <sascha.bischoff@arm.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Marc Zyngier <maz@kernel.org>
> ---
>  drivers/of/irq.c | 38 +++++++++++++++++++++++++++++++++++---
>  1 file changed, 35 insertions(+), 3 deletions(-)

It all looks good to me other than 1 nit below. How do you propose 
merging the series? I can take the first 3 for 6.18 and then patches 4 
and 5 can go via their respective trees for 6.19?

> 
> diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> index 65c3c23255b7..e67b2041e73b 100644
> --- a/drivers/of/irq.c
> +++ b/drivers/of/irq.c
> @@ -671,6 +671,35 @@ void __init of_irq_init(const struct of_device_id *matches)
>  	}
>  }
>  
> +static int of_check_msi_parent(struct device_node *dev_node, struct device_node **msi_node)
> +{
> +	struct of_phandle_args msi_spec;
> +	int ret;
> +
> +	/*
> +	 * An msi-parent phandle with a missing or == 0 #msi-cells
> +	 * property identifies a 1:1 ID translation mapping.
> +	 *
> +	 * Set the msi controller node if the firmware matches this
> +	 * condition.
> +	 */
> +	ret = of_parse_phandle_with_optional_args(dev_node, "msi-parent", "#msi-cells",
> +						  0, &msi_spec);
> +	if (!ret) {

if (ret)
	return ret;

And then save a level of indentation.

> +		if ((*msi_node && *msi_node != msi_spec.np) || msi_spec.args_count != 0)
> +			ret = -EINVAL;
> +
> +		if (!ret) {
> +			/* Return with a node reference held */
> +			*msi_node = msi_spec.np;
> +			return 0;
> +		}
> +		of_node_put(msi_spec.np);
> +	}
> +
> +	return ret;
> +}
> +
>  /**
>   * of_msi_xlate - map a MSI ID and find relevant MSI controller node
>   * @dev: device for which the mapping is to be done.
> @@ -678,7 +707,7 @@ void __init of_irq_init(const struct of_device_id *matches)
>   * @id_in: Device ID.
>   *
>   * Walk up the device hierarchy looking for devices with a "msi-map"
> - * property. If found, apply the mapping to @id_in.
> + * or "msi-parent" property. If found, apply the mapping to @id_in.
>   * If @msi_np points to a non-NULL device node pointer, only entries targeting
>   * that node will be matched; if it points to a NULL value, it will receive the
>   * device node of the first matching target phandle, with a reference held.
> @@ -692,12 +721,15 @@ u32 of_msi_xlate(struct device *dev, struct device_node **msi_np, u32 id_in)
>  
>  	/*
>  	 * Walk up the device parent links looking for one with a
> -	 * "msi-map" property.
> +	 * "msi-map" or an "msi-parent" property.
>  	 */
> -	for (parent_dev = dev; parent_dev; parent_dev = parent_dev->parent)
> +	for (parent_dev = dev; parent_dev; parent_dev = parent_dev->parent) {
>  		if (!of_map_id(parent_dev->of_node, id_in, "msi-map",
>  				"msi-map-mask", msi_np, &id_out))
>  			break;
> +		if (!of_check_msi_parent(parent_dev->of_node, msi_np))
> +			break;
> +	}
>  	return id_out;
>  }
>  
> -- 
> 2.50.1
> 

