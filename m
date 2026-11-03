Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E01606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 09:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mHE4FK8R;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CjHJjZnH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ErjjaE4RW/5nRw+4oz+qsM8b9z5s5mnnmQMT84WCfP4=; b=mHE4FK8Rvff/9gNb6pgti/tBLZ
	3pxnopQ1gk3M+yr/hX4BequYq6tk/XMyq8mQG10sjwOZXUzTZN9+ZFTpg1MSAdE8fgdIX9Wj/Ss8O
	lReSQzxNTD6NXT/8vcl99UZm1Ue3qwf1sfvat/6cGbWabb3aj0aWE/pUojuXbUOV7Z9n5qq0FTr0/
	4bsi8oudQCoXsJZ14Qg/Q7JXu8v4xrcxnqd0lphSebb9Z+tyvbheBw3OwjsgMuCpzHMEnqP7YFmwB
	5FrZ8ZvMpfqDgArd/pZiXf1uKFo2qnIzvz4Y9LapHO4keb3wL6Jmm3Mp45Q5AVH1EflurYNyXSUSB
	85GvACPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAZW-00000001i2o-23cc;
	Tue, 03 Nov 2026 09:12:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAZV-00000001i2g-48do
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 09:12:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 321FE406B9;
	Tue,  3 Nov 2026 09:12:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 649761F00A16;
	Tue,  3 Nov 2026 09:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793697169;
	bh=ErjjaE4RW/5nRw+4oz+qsM8b9z5s5mnnmQMT84WCfP4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CjHJjZnHJhML0IaNYkNnjUimzWrMY+rv3vUBhX7VJZ58Hn/Vja471Sv8GRBP0j9wR
	 GoUYKY6SGyiMtf2YG3486PCDMd02cSD6kIs0zFGArLXN8bclXQovAAJi1tWz8u6i+2
	 VTzAZbalCBsa6ib+cVgk2UKQ2ov4j4uiX7TjaNpepEZx1jYJpztowO9RApgU/lSnqR
	 3SUb0e3AOACYHkJkQ7Sgd8fQZjp8iy3cFCoJwNZwBkLH6l/D89Hp+qKC2x51M9EsqW
	 gndNLpn9RVygU3gcvTkHkFBC5DRvu7VibL1eABt60xFGG4pVbmgvUGQc+RhLVfl5oy
	 d3hSMv3S3jANQ==
Date: Tue, 3 Nov 2026 10:12:43 +0100
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
Subject: Re: [PATCH 03/10] irqchip/gic-v5: Serialise IRS synchronisation
 requests
Message-ID: <aumlixJkwDBlv8Yf@red-moon>
References: <20261102-host_gicv5_fixes-v1-0-743b61626fc5@arm.com>
 <20261102-host_gicv5_fixes-v1-3-743b61626fc5@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102-host_gicv5_fixes-v1-3-743b61626fc5@arm.com>
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

On Mon, Nov 02, 2026 at 01:32:56PM +0000, Sascha Bischoff wrote:
> IRS_SYNCR writes are ignored while IRS_SYNC_STATUSR.IDLE is clear.
> Calls to gicv5_irs_syncr() for different IRQs can overlap, allowing
> the second request to be dropped. Its caller can then observe the
> first request completing and assume that its own events have been
> processed.
> 
> Serialise the request and completion poll with a raw spinlock. We use
> atomic polling, as the lock cannot be held over a sleeping wait.
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

Why does it have to be a spinlock ?

Thanks,
Lorenzo

>  	irs_writel_relaxed(irs_data, syncr, GICV5_IRS_SYNCR);
>  
> -	gicv5_wait_for_op(irs_data->irs_base, GICV5_IRS_SYNC_STATUSR,
> -			  GICV5_IRS_SYNC_STATUSR_IDLE);
> +	gicv5_wait_for_op_atomic(irs_data->irs_base, GICV5_IRS_SYNC_STATUSR,
> +				 GICV5_IRS_SYNC_STATUSR_IDLE, NULL);
>  }
>  
>  int gicv5_irs_register_cpu(int cpuid)
> 
> -- 
> 2.34.1
> 

