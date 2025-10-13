Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F73ECCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 10:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JLiA3SxJf+5kqzmUAQRqg4ufl8ckV2JQJp6D5yFrBmk=; b=fLZDwG8agCFZXbGQEx2XDj9Slf
	x2eZ4Y1q06nXZA2JW9nQ9QhDuxReiYRkbNbz5k2YWR07szs9fQmCFCbEkva7VC+OuYJrh58iwmP9e
	y3xpDRagNHMZaUZpHWxa80dN8IOmOpUnxIssmlN8OsHgmVRQze3wfkzq7+JRMyUfLrtg6TfzX9RRj
	FzXaIOC0bKDDP+rObwbS/53dhuKfSEEM007XMdjf/TSe7t948/PZpFrGifUbm5oTXVcO3ZRB8uG+6
	Jb8TR8UknRI+8uCna3J7LllDoOGs9SDTKcc9An4dUOYstetImPijciyh+kuwUtbHZijxUKNWK+SIc
	Oi7Klb4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Fdm-0000000CtIJ-2ojv;
	Mon, 13 Oct 2025 10:18:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Fdl-0000000CtHl-15D8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 10:18:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6E5F0611DF;
	Mon, 13 Oct 2025 10:18:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB8F4C4CEFE;
	Mon, 13 Oct 2025 10:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760350731;
	bh=ouuqUBDWHlhYA/UeSBYZG7v0qdrIikgKeIsUG354HMU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a6V6XmT8AMmRZZZjj2K4xW3xsCtRTlPQe7+ISoXf1jIQEH1gwGfqLRnYn4ZuVlldt
	 2aLtgi4gPMC+zQIQXSdOaEB5WC12V2nVf6nSVYTzfF2aiK7HAyu2ZseeMS9SXfgwUn
	 7+ywyxXqdM+hwoVzZBzUut5uvpgLItDxre++xuX347u3G6P7vjZtoSAkfZRX00IXt/
	 edKxQo8yBatMkh27B14Eja+/yFHtK4K0UydSWCAHer8YqK5i01rLTPvOrFdt9UfSFe
	 XuUsDjrV+gnqENRIpcTlP0hil9vHzVcG8H2sGQ9zbwv0PZQgsixp74DLgxBUN3G9ee
	 k9epFFO3Si0gw==
Date: Mon, 13 Oct 2025 12:18:46 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Rob Herring <robh@kernel.org>, Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH] irqchip/gic-v5: Add PCI bus msi-parent property handling
Message-ID: <aOzSBlTUdN6sLQds@lpieralisi>
References: <20250922142610.80200-1-lpieralisi@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922142610.80200-1-lpieralisi@kernel.org>
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

On Mon, Sep 22, 2025 at 04:26:10PM +0200, Lorenzo Pieralisi wrote:
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
> Add a helper function to its_v5_pci_msi_prepare() to check the msi-parent
> property in addition to msi-map and retrieve the MSI controller node (with
> a 1:1 ID deviceID-IN<->deviceID-OUT mapping) to provide support for
> deviceID mapping and MSI controller node retrieval for such platforms.
> 
> Fixes: 57d72196dfc8 ("irqchip/gic-v5: Add GICv5 ITS support")
> Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Sascha Bischoff <sascha.bischoff@arm.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Marc Zyngier <maz@kernel.org>
> ---
> Follow-up to [1] in that it is a fix and too risky to fix generic OF code at
> this stage of development since it might affect other platforms.
> 
> Apply a fix to GIC ITS v5 MSI parent code - follow-up will clean up
> the msi-parent parsing in the kernel tree.
> 
> [1] https://lore.kernel.org/lkml/20250916091858.257868-1-lpieralisi@kernel.org/

Hi Thomas,

just asking you please to ignore this patch, I will carry on fixing the issue
with the core OF approach in [1] above, sorry for the noise, it is better
to fix it in generic OF code rather than a temporary plaster as this one.

Thanks,
Lorenzo

>  drivers/irqchip/irq-gic-its-msi-parent.c | 34 ++++++++++++++++++++++--
>  1 file changed, 32 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-gic-its-msi-parent.c b/drivers/irqchip/irq-gic-its-msi-parent.c
> index eb1473f1448a..198fb4e9a22d 100644
> --- a/drivers/irqchip/irq-gic-its-msi-parent.c
> +++ b/drivers/irqchip/irq-gic-its-msi-parent.c
> @@ -101,6 +101,33 @@ static int its_pci_msi_prepare(struct irq_domain *domain, struct device *dev,
>  	return msi_info->ops->msi_prepare(domain->parent, dev, nvec, info);
>  }
>  
> +static int its_v5_get_msi_parent(struct device *dev, struct device_node **msi_np)
> +{
> +	struct of_phandle_args out_msi;
> +	struct device *parent_dev;
> +	int ret;
> +
> +	/*
> +	 * Walk up the device parent links looking for one with a
> +	 *  "msi-parent" property.
> +	 */
> +	for (parent_dev = dev; parent_dev; parent_dev = parent_dev->parent) {
> +		ret = of_parse_phandle_with_optional_args(parent_dev->of_node, "msi-parent",
> +							  "#msi-cells",
> +							  0, &out_msi);
> +		if (!ret) {
> +			if (!out_msi.args_count) {
> +				/* Return with a node reference held */
> +				*msi_np = out_msi.np;
> +				return 0;
> +			}
> +			of_node_put(out_msi.np);
> +		}
> +	}
> +
> +	return -ENODEV;
> +}
> +
>  static int its_v5_pci_msi_prepare(struct irq_domain *domain, struct device *dev,
>  				  int nvec, msi_alloc_info_t *info)
>  {
> @@ -117,8 +144,11 @@ static int its_v5_pci_msi_prepare(struct irq_domain *domain, struct device *dev,
>  	pdev = to_pci_dev(dev);
>  
>  	rid = pci_msi_map_rid_ctlr_node(pdev, &msi_node);
> -	if (!msi_node)
> -		return -ENODEV;
> +	if (!msi_node) {
> +		ret = its_v5_get_msi_parent(&pdev->dev, &msi_node);
> +		if (ret)
> +			return ret;
> +	}
>  
>  	ret = its_translate_frame_address(msi_node, &pa);
>  	if (ret)
> -- 
> 2.48.0
> 

