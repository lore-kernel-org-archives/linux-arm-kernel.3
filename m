Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6991B606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 14:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BjO5Vg8U;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LUEEU0Sr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3ji/RNZ20nE8AsnN9V5/uNaOxgK+7G8URWli+zWVq9U=; b=BjO5Vg8UMhMs6OK52DhtSynYGS
	3I1qwxTif4upHjA50juQmGZvNXfDcDoVOl7TjBNufFUw9oNjsFAf/9U1hIQdGOXNLWi2RH5ikGzMX
	TGkGz/Sg73eom7cwI+3yu5NxbmXZkm+vSzVT+HQV6O6LscRHPAVvzulmTQ8Ba1sFcQ3u3kriT9aMq
	Ow8J6VMeC1895t1zdfc19k6dDHjVKH9HgeNvPVHjrFrf94lq6gVS5la5k/xfWmxKqHJiA/OGOkF+c
	YpTvuC2/F5ftTpYaO+hDz6TSpc1EcTgeuXlaW4z+XddC6NdGzuD+MrxkE4PZXiZOUyqj6fwu39Rgi
	a3GPVvbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsud-0000000GllU-0YQz;
	Mon, 02 Nov 2026 14:21:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsub-0000000GllN-1inV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 14:21:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1B41B43313;
	Mon,  2 Nov 2026 14:21:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EFCA1F00A16;
	Mon,  2 Nov 2026 14:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793629285;
	bh=3ji/RNZ20nE8AsnN9V5/uNaOxgK+7G8URWli+zWVq9U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LUEEU0SrMHB7u0ZvtA93nNY42eOtOHb3WX3BbLZoRHvNvBx292gRAva8d9GNgsptO
	 TEzZJ5z1C2YaMBGM9VqT9uQpB5SrOYMISBLKpPhJbpMX80VgV4V+42wws+eZ9Ey5Zw
	 x5TnStOA9Pws5s7iWVxcLpNcWRH0kZPnh0hKJYRkmTvA58N/VMTNenAjP4CgaUDQIu
	 CbnJVzZ7EsLletxKR7MkWdgEXxZR7z5aAOr26izK4z5L4vjRwsk3XTccZ6E7BTfMHZ
	 rQj7TCf3+TnchGQBe+0sdwQ42YXQKuJyLL9ll1qr0fcIuxe7gQu8HkivB48JN6AHKs
	 8JKi1gizLlUgA==
Date: Mon, 2 Nov 2026 15:21:20 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/10] irqchip/gic-v5: Use firmware node name in ITS
 warning
Message-ID: <auicYCM6KykNHLln@red-moon>
References: <20261102-host_gicv5_fixes-v1-0-743b61626fc5@arm.com>
 <20261102-host_gicv5_fixes-v1-7-743b61626fc5@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102-host_gicv5_fixes-v1-7-743b61626fc5@arm.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026 at 01:33:00PM +0000, Sascha Bischoff wrote:
> The common ITS initialiser can be called with an ACPI firmware node.
> If firmware leaves the ITS enabled, the warning dereferences the DT
> node pointer, which is NULL on that path.
> 
> Use the firmware node name for the warning and drop the DT-only pointer.
> 
> Fixes: a97efa5ba5946 ("irqchip/gic-v5: Add ACPI ITS probing")
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> ---
>  drivers/irqchip/irq-gic-v5-its.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>

> diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
> index c5d057f713134..8628de326f28d 100644
> --- a/drivers/irqchip/irq-gic-v5-its.c
> +++ b/drivers/irqchip/irq-gic-v5-its.c
> @@ -1109,7 +1109,6 @@ static int gicv5_its_init_domain(struct gicv5_its_chip_data *its, struct irq_dom
>  static int __init gicv5_its_init_bases(void __iomem *its_base, struct fwnode_handle *handle,
>  				       struct irq_domain *parent_domain, bool noncoherent)
>  {
> -	struct device_node *np = to_of_node(handle);
>  	struct gicv5_its_chip_data *its_node;
>  	u32 cr0, cr1;
>  	bool enabled;
> @@ -1129,7 +1128,8 @@ static int __init gicv5_its_init_bases(void __iomem *its_base, struct fwnode_han
>  
>  	cr0 = its_readl_relaxed(its_node, GICV5_ITS_CR0);
>  	enabled = FIELD_GET(GICV5_ITS_CR0_ITSEN, cr0);
> -	if (WARN(enabled, "ITS %s enabled, disabling it before proceeding\n", np->full_name)) {
> +	if (WARN(enabled, "ITS %s enabled, disabling it before proceeding\n",
> +		 fwnode_get_name(handle))) {
>  		ret = gicv5_its_disable(its_node);
>  		if (ret)
>  			goto out_free_node;
> 
> -- 
> 2.34.1
> 

