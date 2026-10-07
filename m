Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D8BCA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 14:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=69NaiJVqu5bg+To8yBMQFs2+GW7aydRDIQK7Ds7cXho=; b=d473KthXAv9pNrdCWeeHLl40YM
	INtF7iIibdON6pIrHgWFZe2iTnuyg3IZ33R69rw/R/096Wc5rOemy98id8n/RhEwleRwbicxn5fxU
	10+e3RwHLIiEpf2lAHkhZiKSwFNAaMfhQCDa2+HOsN2H7g/7KMt/J3O2+M4b68ENWhVanDgABuD7O
	T3+Hc+P/OFZdo9h+Ioe598w6n8WzG5zr2L1poaqAJ3a7KvXB1sCIixAM6+qdLeup/F/XKHwLU9J9F
	RxQvhSJYu5hrowQOL+amHlKZanRdG6J5fS+TF/JYYKZvnntn6FcfM3iedKHidixxR/pP4mXz2QDaH
	esa7beqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xESJW-00000002aTI-2OQC;
	Wed, 07 Oct 2026 14:08:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xESJU-00000002aSK-15Ho
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 14:08:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B34BC60219;
	Wed,  7 Oct 2026 14:08:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 019261F0089B;
	Wed,  7 Oct 2026 14:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791382087;
	bh=69NaiJVqu5bg+To8yBMQFs2+GW7aydRDIQK7Ds7cXho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IeeiWSyBQQXhV+uIhk7CGTX1fVyyDUKx6PTt6U318ev+VeKcVXv5uUMHUiJrcNIN1
	 3D0cFXpDvV+QrFWsMpGj/x4RgpGma3yJPZ4gv+wfdK4dXlsX4g5ik7fOFX4wbGXEmw
	 WA3XdL21KYOF9fMvHWZS7dp4vyqBoHBmUFBi6SOD+uj1FZE8kHAfXpimfP+2wV6aQj
	 l8OyX2hpVR+GyQ0E2C/4/BwDxQ44IO2Pxf26p81yCPtVKmEEuaW+Zn2GJu2ajG59w3
	 AjGc0wtidHjPZv7xT8zyHaEfBRlbISAZnJZNVA6T/y2LEzewgoMqz8GJgpTI6w7UCI
	 Jpqu8eDLhUhuA==
Date: Wed, 7 Oct 2026 15:08:01 +0100
From: Will Deacon <will@kernel.org>
To: Pranjal Shrivastava <praan@google.com>
Cc: iommu@lists.linux.dev, Joerg Roedel <joro@8bytes.org>,
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	Mostafa Saleh <smostafa@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Daniel Mentz <danielmentz@google.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev
Subject: Re: [PATCH v11 11/16] iommu/arm-smmu-v3: Add CMDQ_PROD_STOP_FLAG to
 gate CMDQ submissions
Message-ID: <asZSQRSYBjbUaaH0@willie-the-truck>
References: <20260929034510.2023173-1-praan@google.com>
 <20260929034510.2023173-12-praan@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929034510.2023173-12-praan@google.com>
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

On Tue, Sep 29, 2026 at 03:45:05AM +0000, Pranjal Shrivastava wrote:
> Introduce a new bit flag, CMDQ_PROD_STOP_FLAG (bit 30), in the command
> queue's producer index to safely gate command submissions during device
> suspension.
> 
> The flag embeds the suspend state directly into the existing global state
> The flag is checked in the cmpxchg loop in arm_smmu_cmdq_issue_cmdlist(),
> which acts as a Point of Commitment, ensuring that no indices are
> reserved or committed once the SMMU begins suspending.

I'm not familiar with the term "Point of Commitment". Is that something
you came up with? Without a general definition, I think I'd prefer to
avoid using it, especially as it sounds like something to do with the
Arm memory system (where we already have architectural terms such as
"Point of Coherency".
 
> This prevents a situation of "abandoned batches" where indices are
> incremented but commands are never written, which would otherwise
> lead to timeout during the drain poll.
> 
> Update queue_inc_prod_n() to preserve this flag during index
> calculations, ensuring that any in-flight commands that successfully
> passed the point of commitment can proceed to completion while the
> flag remains set.
> 
> Suggested-by: Daniel Mentz <danielmentz@google.com>
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Pranjal Shrivastava <praan@google.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 35 +++++++++++++++++++--
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  5 +++
>  2 files changed, 38 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index a123810fac57..7f89e2306942 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -218,7 +218,8 @@ static int queue_sync_prod_in(struct arm_smmu_queue *q)
>  static u32 queue_inc_prod_n(struct arm_smmu_ll_queue *q, int n)
>  {
>  	u32 prod = Q_POS(q, q->prod) + n;
> -	return Q_OVF(q->prod) | Q_POS(q, prod);
> +
> +	return Q_OVF(q->prod) | Q_STOP(q->prod) | Q_POS(q, prod);
>  }
>  
>  static void queue_poll_init(struct arm_smmu_device *smmu,
> @@ -726,13 +727,42 @@ int __arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
>  	do {
>  		u64 old;
>  
> +		/*
> +		 * If the SMMU is suspended/suspending, any new CMDs are elided.
> +		 * This loop is the Point of Commitment. If we haven't cmpxchg'd
> +		 * our new indices yet, we can safely bail. Once the indices are
> +		 * committed, we MUST write valid commands to those slots to
> +		 * avoid indefinite polling in the drain function.
> +		 */
> +		if (Q_STOP(llq.prod)) {
> +			local_irq_restore(flags);
> +			return 0;
> +		}
> +
>  		while (!queue_has_space(&llq, n + sync)) {
>  			local_irq_restore(flags);
> +
> +			/* Avoid waiting for space if the SMMU is suspending */
> +			if (Q_STOP(READ_ONCE(cmdq->q.llq.prod)))
> +				return 0;
> +
>  			if (arm_smmu_cmdq_poll_until_not_full(smmu, cmdq, &llq))
>  				dev_err_ratelimited(smmu->dev, "CMDQ timeout\n");

It's a bit grotty to have the extra READ_ONCE() here. Why not make
arm_smmu_cmdq_poll_until_not_full() return if the stop bit is set?

> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index deefb17e31eb..794b258550dd 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -394,6 +394,11 @@ static inline unsigned int arm_smmu_cdtab_l2_idx(unsigned int ssid)
>  #define CMDQ_ERR_CERROR_ATC_INV_IDX	3
>  
>  #define CMDQ_PROD_OWNED_FLAG		Q_OVERFLOW_FLAG
> +#define CMDQ_PROD_STOP_FLAG		(1U << 30)

I'm unsure about this. Bit 30 of the cmdq prod register is RES0, so it's
plausible that the architecture allocates that bit for something in future.
For example, if the index field was extended, then I think that would
cause problems for the driver.

Do we have to put the stop flag in the producer value, or can it just be
a flag elsewhere in memory?

Will

