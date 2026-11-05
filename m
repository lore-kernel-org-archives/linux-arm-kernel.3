Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B65606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 08:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MaumSbi3;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UdpAjSX1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VTYeLaYKKNnR4GNV/TaYDsoMFc7kD+xhaqkactUd/3g=; b=MaumSbi3CMFhFj1IUc98ngeEW+
	0O2vWVRXbtu/9nwQPTIU48HVrn7gbwQGyz4iaTUKR6pTt9jNRSgEJb9SYryuKdPP8xps3qWG/hYR6
	fjNaz+usFgNY+MSJdAVZN5c8egZScG9DsKzKzG6y61+geZQsp7EUcdu5hhmq6W26ufREGkBTNIt3Z
	2iiIFJZ2eA6IBqw04tlOArbXIeo5Mt4LoNfGuzb9o+zMZjegl1Vd+fwiXSoUyP/v6HVCb0coCszAg
	Zo+dhiGGJrMo+SegRH8HNqc0Vv1H6436blSikSGw0agNojKmzOifbwpo0dbanoHM4zetxFmYAtLJt
	PzpXtnMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOssn-00000008AJw-02wF;
	Thu, 05 Nov 2026 08:31:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOssk-00000008AIm-2WFs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 08:31:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2985E403BF;
	Thu,  5 Nov 2026 08:31:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BB8D1F000C1;
	Thu,  5 Nov 2026 08:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793867498;
	bh=VTYeLaYKKNnR4GNV/TaYDsoMFc7kD+xhaqkactUd/3g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UdpAjSX1Ro0Jx1+rM9vTzFKPs+jUr4o3qyZkDKLIoulXlVpD2YPlJvVvDOWjHASuj
	 +yLcDwbbQPABVdze7sA2RY2GN+t3teeLFEJcaSC5bmEF9fM7fbjoBsvCyqLsk8DA9F
	 oqGyrhiP3CXAZdK9WEQhAlOhKvWrj8WMFcK70NhUkfMNODpoH7l30kifsigPUx5G4q
	 lcNj2sBFDmdqf/qNvyEDHAmIKn+zvcpiE1VSDExndt3rZv5LIew1oIRX1dgqUvxZuo
	 qjrmtbfPGHJJ9Pi708oRJOadeqNITHmJ39z7dBeJWrVb6u7Dbqpg93qCgBE+LAgLRN
	 6JkFfr9Qa4PYA==
Date: Thu, 5 Nov 2026 09:31:32 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Sashiko AI <sashiko-bot@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH v2 04/10] irqchip/gic-v5: Serialise ITS invalidation
 commands
Message-ID: <auw-5EyY_aifcv1N@red-moon>
References: <20261104-host_gicv5_fixes-v2-0-e47ad20ea3c8@arm.com>
 <20261104-host_gicv5_fixes-v2-4-e47ad20ea3c8@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104-host_gicv5_fixes-v2-4-e47ad20ea3c8@arm.com>
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

On Wed, Nov 04, 2026 at 05:47:58PM +0000, Sascha Bischoff wrote:
> The ITS uses the shared DIDR and EIDR registers to select the DeviceID
> and EventID whose translation is to be invalidated. Event
> invalidations for different IRQs can overlap, as can an event
> invalidation and a device invalidation. The per-IRQ descriptor lock
> does not serialise these commands, so writes can interleave and cause
> an invalidation to use the DeviceID or EventID of another IRQ being
> invalidated concurrently on a different CPU.
> 
> Serialise the command register writes and STATUSR.IDLE polls for both
> invalidation paths with a per-ITS raw spinlock. The KVM
> gicv5_its_set_vcpu_affinity() callback calls the event invalidation
> helper via irq_set_vcpu_affinity(), which holds the IRQ descriptor
> lock. This path cannot sleep, so use atomic polling.

Same comment here as IRS sync. This one though looks like a host
driver bug that can happen regardless of KVM, so I'd just fix it
and remove/rephrase this paragraph.

> Fixes: 57d72196dfc8 ("irqchip/gic-v5: Add GICv5 ITS support")
> Reported-by: Sashiko AI <sashiko-bot@kernel.org>
> Link: https://sashiko.dev/#/patchset/20261016155741.979985-1-sascha.bischoff@arm.com?part=11

Again, this is linking to a report on a series that wasn't merged
yet but probably it makes sense to leave it there for context.

> Cc: stable@vger.kernel.org
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> ---
>  drivers/irqchip/irq-gic-v5-its.c | 9 +++++++++
>  1 file changed, 9 insertions(+)

Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>

> diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
> index 28e39b065de0e..6d98f3dbe34b6 100644
> --- a/drivers/irqchip/irq-gic-v5-its.c
> +++ b/drivers/irqchip/irq-gic-v5-its.c
> @@ -16,6 +16,7 @@
>  #include <linux/of_address.h>
>  #include <linux/of_irq.h>
>  #include <linux/slab.h>
> +#include <linux/spinlock.h>
>  
>  #include <linux/irqchip.h>
>  #include <linux/irqchip/arm-gic-v5.h>
> @@ -28,6 +29,8 @@
>  struct gicv5_its_chip_data {
>  	struct	xarray			its_devices;
>  	struct	mutex			dev_alloc_lock;
> +	/* Event and device invalidation commands share DIDR. */
> +	raw_spinlock_t			inv_lock;
>  	struct	fwnode_handle		*fwnode;
>  	struct gicv5_its_devtab_cfg	devtab_cfgr;
>  	void	__iomem			*its_base;
> @@ -129,6 +132,8 @@ static int gicv5_its_itt_cache_inv(struct gicv5_its_chip_data *its, u32 device_i
>  	eidr = FIELD_PREP(GICV5_ITS_EIDR_EVENTID, event_id);
>  	eventr = FIELD_PREP(GICV5_ITS_INV_EVENTR_I, 0x1);
>  
> +	guard(raw_spinlock_irqsave)(&its->inv_lock);
> +
>  	its_writeq_relaxed(its, didr, GICV5_ITS_DIDR);
>  	its_writel_relaxed(its, eidr, GICV5_ITS_EIDR);
>  	its_writel_relaxed(its, eventr, GICV5_ITS_INV_EVENTR);
> @@ -371,6 +376,9 @@ static int gicv5_its_device_cache_inv(struct gicv5_its_chip_data *its,
>  		  FIELD_PREP(GICV5_ITS_INV_DEVICER_EVENTID_BITS,
>  			     its_dev->itt_cfg.event_id_bits)	|
>  		  FIELD_PREP(GICV5_ITS_INV_DEVICER_L1, 0x0);
> +
> +	guard(raw_spinlock_irqsave)(&its->inv_lock);
> +
>  	its_writeq_relaxed(its, didr, GICV5_ITS_DIDR);
>  	its_writel_relaxed(its, devicer, GICV5_ITS_INV_DEVICER);
>  
> @@ -1112,6 +1120,7 @@ static int __init gicv5_its_init_bases(void __iomem *its_base, struct fwnode_han
>  		return -ENOMEM;
>  
>  	mutex_init(&its_node->dev_alloc_lock);
> +	raw_spin_lock_init(&its_node->inv_lock);
>  	xa_init(&its_node->its_devices);
>  	its_node->fwnode = handle;
>  	its_node->its_base = its_base;
> 
> -- 
> 2.34.1
> 

