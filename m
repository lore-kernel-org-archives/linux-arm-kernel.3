Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1BF606A581
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 14:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gemBXvJJ;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bn6RzhIh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9OYNXyiMp/NC0QRIeIQvA61Kb8/WnJv+aMx46NH/CgM=; b=gemBXvJJjYhBavkOb+b3VX8mdb
	Z+DgGhr0XuaRd6GrcJldpYx6X9EUh+hUE2ICreit7bmkP59zT/ke1KMbx2VmnLHNccOLVy8zBc9zE
	f6wA+ZwF/T/siFi4srfbJ2xxm9Jj7gP67tLbLXCSlyjcV2K1VPeHJ3ytgTGdU89eYZjLCDYQipA8t
	qEZg0FK3K+gUzzn10NvROZiO4C6uX8mxP8BJPThHXiIwSTfHGekyM1lOjyvTAUM+kmcCFVgqZjSkU
	WoxV2U4Nu6nJIds/1DAncbnyIJ6/XsxURZFIrRMNa42iIOand6rQYjNJk4EVMbRu+HjCmlS6tk5nK
	QFXoA7aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNtQJ-0000000GvKp-28Lx;
	Mon, 02 Nov 2026 14:54:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNtQI-0000000GvK7-2Ama
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 14:54:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4493740283;
	Mon,  2 Nov 2026 14:54:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94B6E1F00A17;
	Mon,  2 Nov 2026 14:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793631250;
	bh=9OYNXyiMp/NC0QRIeIQvA61Kb8/WnJv+aMx46NH/CgM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Bn6RzhIh4hpXuKH7GJzk4gNKkUiQVGCXQtZ1YIOR4tzWUIYftJVzDT3L0tiQlV2qv
	 Z+X//2tzu8B5eG3FLO8Eu9eeRXQEgocpW/1HV0pQIgR5pxyI3KrTVEEsbmWwVjejIg
	 G6OVISi3CRHkSmiyrcaM8j7B8aBFQdzTQ+/35EhJQ4ShcUM+Ff6AGaHUa6WJo8BaWu
	 IcKWos0NV5mvbnmrvdkzF8KPNgqMc4FaJl4XYJS5pAhvCGxXOAaG+JHVoc80NDu2En
	 Cv4SwoO1vFtpueKoDN5+Z2Li5zkVN7JtHPROxO/i2E7sYDCtMs+NP6XQIQKAL+OAi1
	 L3WyPNL7qOKCA==
Date: Mon, 2 Nov 2026 15:54:05 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/10] irqchip/gic-v5: Release ITS MMIO region on DT
 probe failure
Message-ID: <auikDS0RE5E13z8I@red-moon>
References: <20261102-host_gicv5_fixes-v1-0-743b61626fc5@arm.com>
 <20261102-host_gicv5_fixes-v1-10-743b61626fc5@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102-host_gicv5_fixes-v1-10-743b61626fc5@arm.com>
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

On Mon, Nov 02, 2026 at 01:33:03PM +0000, Sascha Bischoff wrote:
> of_io_request_and_map() reserves the ITS configuration frame region.
> If ITS initialisation fails after mapping it, the error path only
> unmaps the registers and leaves the region reserved.
> 
> Keep the resource description and release the region on that path.
> 
> Fixes: 57d72196dfc85 ("irqchip/gic-v5: Add GICv5 ITS support")
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> ---
>  drivers/irqchip/irq-gic-v5-its.c | 7 +++++++
>  1 file changed, 7 insertions(+)

A minor note on coding style below, other than that:

Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> 
> diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
> index c0f3982229194..91abe63cb5cf9 100644
> --- a/drivers/irqchip/irq-gic-v5-its.c
> +++ b/drivers/irqchip/irq-gic-v5-its.c
> @@ -1188,6 +1188,7 @@ static int __init gicv5_its_init_bases(void __iomem *its_base, struct fwnode_han
>  
>  static int __init gicv5_its_init(struct device_node *node)
>  {
> +	struct resource res;

FIR tree ordering.

https://docs.kernel.org/process/maintainer-tip.html

>  	void __iomem *its_base;
>  	int ret, idx;
>  
> @@ -1197,6 +1198,11 @@ static int __init gicv5_its_init(struct device_node *node)
>  		return -ENODEV;
>  	}
>  
> +	/* Save the region to release if ITS setup fails after mapping it. */
> +	ret = of_address_to_resource(node, idx, &res);
> +	if (ret)
> +		return ret;
> +
>  	its_base = of_io_request_and_map(node, idx, of_node_full_name(node));
>  	if (IS_ERR(its_base)) {
>  		pr_err("%pOF: unable to map GICv5 ITS_CONFIG_FRAME\n", node);
> @@ -1213,6 +1219,7 @@ static int __init gicv5_its_init(struct device_node *node)
>  
>  out_unmap:
>  	iounmap(its_base);
> +	release_mem_region(res.start, resource_size(&res));
>  	return ret;
>  }
>  
> 
> -- 
> 2.34.1
> 

