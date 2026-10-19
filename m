Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C098CCF2D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 08:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3jzjsLtJTWVbyke5K19uxcbpg8sweyOiagkfvb9qFUQ=; b=l1Q3X3+WxyVawDF9SXx/J31BRy
	Xmpyce91yozwpFHs4MicdzWRKKPlxqQFoUqbgYmAREqCRSM3FXfEbDb+tSr7NKy2QZ4bT7P0smD/r
	H1IGEYEMm4Tl/rq20dZTZGN+kWRCnT1qxYSEIecsghzIIGipsrQ7dDMC6oF7UumIIsjY7OO1Lymod
	2KeeT15FSKe07x9excZl/FUDA7mUwrwru7wz1WVsAsmWIO2fQRQYSU7Ii5zHB+G1ZSJ2LwupRWBrN
	dHlC7+JuBIwL7e6xLf0xhLlC/EKMQZDQZwMQYLcKypef8wDN6xnwtN4GMVhvZ6dkWSH/8oMFs6mcV
	hhQpWtwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIifa-00000006ran-35Je;
	Mon, 19 Oct 2026 08:24:34 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIifY-00000006raS-1Or7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 08:24:33 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2e9f6a16afcso18095ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 01:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792398271; x=1793003071; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3jzjsLtJTWVbyke5K19uxcbpg8sweyOiagkfvb9qFUQ=;
        b=PTICtOvG4iMoCpEGJ2bXm6Q4oOBismyBwbiCbbO5ZHf31pGNkp3PUvIKSX2DJKvulb
         OpB6o93lQ3RDAWM75O+en1RcaBq4ZhcQoBOM8rnLGiPSui/oJcJhHZVj42ql9aeiggo9
         0lLlTqkT0/cbelkgOkCCNOYLshiVWXDmbN4RfOJPFfxIsqAC6YU9iOlXl8zja2RAf1Ih
         VUWrD6VyE6n17ByeT8gfDW5zvC7cMrepVfw8mo53BdrQ/LrG+muYxFL/TiGDJt22TjZN
         AGGHfmRGyaT9vMGAHvLrWJTCgxWX9vqfKGA2m6GGWTOiCi31LeiBCoFkGvjE+6FnBVOU
         kBvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792398271; x=1793003071;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3jzjsLtJTWVbyke5K19uxcbpg8sweyOiagkfvb9qFUQ=;
        b=vAOVzCatEaITClfOEJx7jLGbeYoekeBuR/xYO2lWt0Y/QOKZeXHpu7WozzaF9xs67f
         X64oa9lj/y7vkg+bEFKaaIEFOcKpBLF04uRp9vyi63WPXhxjLQBahIDsNCqquzCADQsX
         ZiboHDRxQYAhVqLAOCUe/qwJLSTNLHlbdyQcn+YmV9+V07RJFLdW9bZ9Xb0jROpgIB8G
         3ijuYgu8c0KFwX49Eo9NAEAZtTzNTPSonsJ09g8Ht3k0E5kkcw6o+BCsYQ+j1aBNPakg
         a/Ubt6VYuQS1yRqTjnSYDrDiq1kVB+h65yju7NRVDT21dlgVqS4DvuZ5doijcogVnXeq
         OHwg==
X-Forwarded-Encrypted: i=1; AKwUvBwuoGiYqy5IvYR+RmUsVQBuxpK8pOTUmv8weLqdeWgRkdMLGxV4wtXxrj0G1ww1JPeRyWQiw4DE70IQm8owjubp@lists.infradead.org
X-Gm-Message-State: AFq9FYLtDeZqnuLnzbZihH1UBfRxEq3ULIT/MbtOUFQb9TzUXU6OsTAO
	CR3NpFAldf1NIg+X7kAv/ftrghMSMsekY4IELsJ45us47VHm8YNyUxzOi1DfEV2eHA==
X-Gm-Gg: AYBFou1Na+nrQe0nbuYYGR1rMO3JLAYYI6HuMMNOjCdVI8pYd5IN32CtMTObiTtW8Pv
	o+HJl/vj7OPiNmGhYDtcfyNcRzeBfVOY8o0XUWq6eMOD/6DWFYWD6LZav5EnD3g7x+h0Qdbvxlq
	Q4BNqNwq+gV/uj37whv38TkfmvflE05pasi9MYv79eE8pktITVt3oeZCojoC5iikzVB58UUCPO4
	Fnm8yuuOnS5vaxDFyEZR7gGsRC8KF3abRKE7RsptteQCQcVxRmm/xLbqblDFpG7vkoTCPXwm52u
	AtdCacX1Td8ii0peTrClIhUwywWj4yT+7mzZ2P6cZn9Qbo4CVKOLAnFCY4nwW5vpNvg+WauV/9k
	463qi3ysj8wUTSQrlDbmWYmTnfWHG2JwAr/6aoG6R6QJMBqp3E/l6gp291SSwMxP6qRQUID44QG
	YE1hUlcPei3boUzGi64pDEk3Ymzfc8rFsl8uAbHjANLrypJxuTa/O7t4dspkbBEkFZYGZFZ8njh
	pwuv9QnQLSUzQBJLlSeCNa0Z2SQw+ONK9MMG8gGMDDTR/wW2gmfHdSPdzDqlb5S4VEQ6b16pMQU
	QoM5W5aILVc0AON5HQ==
X-Received: by 2002:a17:903:1967:b0:2d5:db38:8010 with SMTP id d9443c01a7336-2e9b332b4d8mr6656035ad.15.1792398269918;
        Mon, 19 Oct 2026 01:24:29 -0700 (PDT)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc963f36asm8219762a91.0.2026.10.19.01.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 01:24:29 -0700 (PDT)
Date: Mon, 19 Oct 2026 08:24:21 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Will Deacon <will@kernel.org>
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
Message-ID: <atXTtaxz0z-U-XSJ@google.com>
References: <20260929034510.2023173-1-praan@google.com>
 <20260929034510.2023173-12-praan@google.com>
 <asZSQRSYBjbUaaH0@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asZSQRSYBjbUaaH0@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_012432_400879_B0362F3E 
X-CRM114-Status: GOOD (  45.50  )
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

On Wed, Oct 07, 2026 at 03:08:01PM +0100, Will Deacon wrote:
> On Tue, Sep 29, 2026 at 03:45:05AM +0000, Pranjal Shrivastava wrote:
> > Introduce a new bit flag, CMDQ_PROD_STOP_FLAG (bit 30), in the command
> > queue's producer index to safely gate command submissions during device
> > suspension.
> > 
> > The flag embeds the suspend state directly into the existing global state
> > The flag is checked in the cmpxchg loop in arm_smmu_cmdq_issue_cmdlist(),
> > which acts as a Point of Commitment, ensuring that no indices are
> > reserved or committed once the SMMU begins suspending.
> 
> I'm not familiar with the term "Point of Commitment". Is that something
> you came up with? Without a general definition, I think I'd prefer to
> avoid using it, especially as it sounds like something to do with the
> Arm memory system (where we already have architectural terms such as
> "Point of Coherency".
>  
> > This prevents a situation of "abandoned batches" where indices are
> > incremented but commands are never written, which would otherwise
> > lead to timeout during the drain poll.
> > 
> > Update queue_inc_prod_n() to preserve this flag during index
> > calculations, ensuring that any in-flight commands that successfully
> > passed the point of commitment can proceed to completion while the
> > flag remains set.
> > 
> > Suggested-by: Daniel Mentz <danielmentz@google.com>
> > Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> > Signed-off-by: Pranjal Shrivastava <praan@google.com>
> > ---
> >  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 35 +++++++++++++++++++--
> >  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  5 +++
> >  2 files changed, 38 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > index a123810fac57..7f89e2306942 100644
> > --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > @@ -218,7 +218,8 @@ static int queue_sync_prod_in(struct arm_smmu_queue *q)
> >  static u32 queue_inc_prod_n(struct arm_smmu_ll_queue *q, int n)
> >  {
> >  	u32 prod = Q_POS(q, q->prod) + n;
> > -	return Q_OVF(q->prod) | Q_POS(q, prod);
> > +
> > +	return Q_OVF(q->prod) | Q_STOP(q->prod) | Q_POS(q, prod);
> >  }
> >  
> >  static void queue_poll_init(struct arm_smmu_device *smmu,
> > @@ -726,13 +727,42 @@ int __arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
> >  	do {
> >  		u64 old;
> >  
> > +		/*
> > +		 * If the SMMU is suspended/suspending, any new CMDs are elided.
> > +		 * This loop is the Point of Commitment. If we haven't cmpxchg'd
> > +		 * our new indices yet, we can safely bail. Once the indices are
> > +		 * committed, we MUST write valid commands to those slots to
> > +		 * avoid indefinite polling in the drain function.
> > +		 */
> > +		if (Q_STOP(llq.prod)) {
> > +			local_irq_restore(flags);
> > +			return 0;
> > +		}
> > +
> >  		while (!queue_has_space(&llq, n + sync)) {
> >  			local_irq_restore(flags);
> > +
> > +			/* Avoid waiting for space if the SMMU is suspending */
> > +			if (Q_STOP(READ_ONCE(cmdq->q.llq.prod)))
> > +				return 0;
> > +
> >  			if (arm_smmu_cmdq_poll_until_not_full(smmu, cmdq, &llq))
> >  				dev_err_ratelimited(smmu->dev, "CMDQ timeout\n");
> 
> It's a bit grotty to have the extra READ_ONCE() here. Why not make
> arm_smmu_cmdq_poll_until_not_full() return if the stop bit is set?
> 

Sure, it already refreshes llq on every iteration, so I'll make it bail
out on Q_STOP(llq->prod) and have the caller loop on !Q_STOP(llq.prod) &&
!queue_has_space(), leaving a single STOP check right before the cmpxchg.

> > diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> > index deefb17e31eb..794b258550dd 100644
> > --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> > +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> > @@ -394,6 +394,11 @@ static inline unsigned int arm_smmu_cdtab_l2_idx(unsigned int ssid)
> >  #define CMDQ_ERR_CERROR_ATC_INV_IDX	3
> >  
> >  #define CMDQ_PROD_OWNED_FLAG		Q_OVERFLOW_FLAG
> > +#define CMDQ_PROD_STOP_FLAG		(1U << 30)
> 
> I'm unsure about this. Bit 30 of the cmdq prod register is RES0, so it's
> plausible that the architecture allocates that bit for something in future.
> For example, if the index field was extended, then I think that would
> cause problems for the driver.
> 
> Do we have to put the stop flag in the producer value, or can it just be
> a flag elsewhere in memory?
> 

Fair point, but the flag is SW-only, i.e. it's always stripped via
CMDQ_PROD_IDX_MASK before anything reaches the HW and only ever tested
via Q_STOP(). It's the same deal as CMDQ_PROD_OWNED_FLAG, which already
uses bit 31 (also RES0 in SMMU_CMDQ_PROD, IHI0070 section 6.3.27) as a
SW-only marker in llq.prod.

Keeping it in prod is what makes the check + slot reservation atomic in
the cmpxchg.. with a separate flag, a CPU could check it, then suspend 
sets it and samples the target, and the CPU would still reserve slots 
beyond that target.

Thanks,
Praan

