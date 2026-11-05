Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB7D606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 07:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dSHmH1k7;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tus64+ki
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cccu6IRsMQeLQd78s6fwoKTtP+m0EnGz9D3UFhBgw70=; b=dSHmH1k7sFtB5po3dRNG6DUwN9
	yymhf1rUjVGtlNiUsfPPoNXOwHra+dJwWwhlw7CENU+3SkUXpeLNqCUglVZ8oPcTO4QInhls2uy5I
	UXqsYVWhSfGu9dycN/HZOaTXrtoQeT5uV5gGW9qRwfWrVr/wcGBZgSx19kBPqW/xHdupqq4Jq616E
	2O1iqBgkO8Txt7xplErezDDQ97A9lA3Cbf5BXOf3w6yjUbhhMLCrjYPUpwSfqD5EAjGFdrKAAZLzi
	3jZwTvbxkpQrgOPUe9wT08Q7myNhOvkeb2e43z5XkcZmeN3JVX5Ev4oDzg96NM9R7cWGrFPU4WuAA
	dybsLwlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsCo-00000008318-2WIj;
	Thu, 05 Nov 2026 07:48:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsCm-0000000830i-34xF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 07:48:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3265E60213;
	Thu,  5 Nov 2026 07:48:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 204FC1F000C1;
	Thu,  5 Nov 2026 07:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793864895;
	bh=cccu6IRsMQeLQd78s6fwoKTtP+m0EnGz9D3UFhBgw70=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Tus64+kiiu8OCMzKk6Heycm1KF6FxRYt561NxnLKxXsXtN0qLbCDwpRtK5/a7KCEp
	 fkR2rRoHU8dJU47985DAeip4Y7Vi2OWAZIFdJIH8Rzrra54g/aW+IAGtx3LnFm/g78
	 mZrJ5/bTh0WHEZZlUTOiZ5MliGL9kkmDX88m+CfwFPhQ910iBwePtLaIePmyP7q/Xl
	 yGHIBJI+oCTpUYVeJVx4uLtEbb4uQPlxVZdPHnpMo1OEi9BNfvaJHAwivueZPicjz5
	 UBNq8PanCBb9RS5Uu1mV05PTBxbP0f/4FHnFEyK58B7xt6t0Pz9qbELZaxy8mIIhOq
	 XsSHaIc5sJqUw==
Date: Thu, 5 Nov 2026 08:48:10 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 03/10] irqchip/gic-v5: Serialise IRS synchronisation
 requests
Message-ID: <auw0ulR3wrsKVcYe@red-moon>
References: <20261104-host_gicv5_fixes-v2-0-e47ad20ea3c8@arm.com>
 <20261104-host_gicv5_fixes-v2-3-e47ad20ea3c8@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104-host_gicv5_fixes-v2-3-e47ad20ea3c8@arm.com>
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

[Remove stable from the CC email recipient list, leave it only in the log]

On Wed, Nov 04, 2026 at 05:47:57PM +0000, Sascha Bischoff wrote:
> IRS_SYNCR writes are ignored while IRS_SYNC_STATUSR.IDLE is clear.
> Calls to gicv5_irs_syncr() for different IRQs can overlap, allowing

Nit: gicv5_irs_syncr() has no notion of specific IRQs, this is
misleading.

> the second request to be dropped. Its caller can then observe the
> first request completing and assume that its own events have been
> processed.
> 
> With GICv5 ITS KVM support, gicv5_irs_syncr() is also called while
> restoring the host ITTE in gicv5_its_set_vcpu_affinity(). The callback
> runs under the IRQ descriptor lock via irq_set_vcpu_affinity(), so it
> cannot sleep.

Technically we are talking about a use case that does not exist yet.

I understand it is churn to fix it first and change it again later,
I would just say that gicv5_irs_syncr() might need to be called in atomic
context.

> Serialise the request and completion poll with a raw spinlock, and use
> atomic polling because the synchronisation runs while holding the IRQ
> descriptor lock.
> 
> Fixes: 57d72196dfc8 ("irqchip/gic-v5: Add GICv5 ITS support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> ---
>  drivers/irqchip/irq-gic-v5-irs.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-gic-v5-irs.c b/drivers/irqchip/irq-gic-v5-irs.c
> index 4edf787f3f97f..ead76560ea08f 100644
> --- a/drivers/irqchip/irq-gic-v5-irs.c
> +++ b/drivers/irqchip/irq-gic-v5-irs.c
> @@ -10,6 +10,7 @@
>  #include <linux/log2.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> +#include <linux/spinlock.h>
>  
>  #include <linux/irqchip.h>
>  #include <linux/irqchip/arm-gic-v5.h>
> @@ -22,6 +23,8 @@
>  #define LPI_ID_BITS_LINEAR		12
>  
>  static DEFINE_PER_CPU_READ_MOSTLY(struct gicv5_irs_chip_data *, per_cpu_irs_data);
> +/* Synchronization requests must not overlap in an IRS Domain. */
> +static DEFINE_RAW_SPINLOCK(irs_sync_lock);
>  static LIST_HEAD(irs_nodes);
>  
>  static u32 irs_readl_relaxed(struct gicv5_irs_chip_data *irs_data,
> @@ -507,10 +510,11 @@ void gicv5_irs_syncr(void)
>  		return;
>  
>  	syncr = FIELD_PREP(GICV5_IRS_SYNCR_SYNC, 1);
> +	guard(raw_spinlock_irqsave)(&irs_sync_lock);
>  	irs_writel_relaxed(irs_data, syncr, GICV5_IRS_SYNCR);
>  
> -	gicv5_wait_for_op(irs_data->irs_base, GICV5_IRS_SYNC_STATUSR,
> -			  GICV5_IRS_SYNC_STATUSR_IDLE);
> +	gicv5_wait_for_op_atomic(irs_data->irs_base, GICV5_IRS_SYNC_STATUSR,
> +				 GICV5_IRS_SYNC_STATUSR_IDLE, NULL);
>  }

Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>

>  
>  int gicv5_irs_register_cpu(int cpuid)
> 
> -- 
> 2.34.1
> 

