Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7047CCF2D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 08:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QNi/4g2rcbVBYZWdEY3YYi0+ZnogZXZN5660dVgk0m4=; b=b/is18SL1y/EvNzVA8u2cnwxpO
	YDCAoUhBUM+a9ghW4P3z6a/Fnm72YEgBWd6JrXTXRBCL9siMWcnyx2fLAfMC/4b/U+fkJw/GpU4UI
	bcEcRJMaqqeE85WcswQgVKUYhMUYDpavn6htWY97Ylv/kSCP0ydjY3MxBcJy0g2fykr+JEKJCTz+/
	pHKDkKZlyW+94fQ3dV7nZgjkY9cf6NbO15bqyg7kGF/cjb6sG9YkeaCPDDdqoqsa0sGnrYvkX0H1q
	SeT7OGlzyfqypqSVT60ZXJxRqfavvopWoniXqq2yeryxpVGsPAPpcXxZxEVVvycNAjg7nN1Nw8dc6
	DSYgP+eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIijZ-00000006s4U-05Kt;
	Mon, 19 Oct 2026 08:28:41 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIijX-00000006s48-1IVy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 08:28:40 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2e9f6a16afcso18735ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 01:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792398518; x=1793003318; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QNi/4g2rcbVBYZWdEY3YYi0+ZnogZXZN5660dVgk0m4=;
        b=Ukw4qJokOlt7JTEcPfPaMCR8qI6jwgr/bRW/MFUQXYsK6y5ZtsNwRdkYh00C/yX0Nd
         fVk+wxNvWSeG+uFWgVoFR8kLFdcnyoK6xAnYYdxwpMyS/bcGPqHm2/lMfBV1JZphidun
         fv1UF5PqYpvEwThFGet5Z99XS8KbI0EEfD4SKLoYAgQH0IOYLI9JUgJ3QB+WMmBpkLYo
         IkHecqe4xb6tQJk5CFULskXkA6VHMdFvz7Y76vgR9bGDt68OBnTyAkZiysJ+FPBJzqAn
         0DnURToR0QntYIXrlqOQZTJupsxz6L0ZEmfZJW642aTJapDaB083rM2QS/3gk8OlQidA
         POgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792398518; x=1793003318;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QNi/4g2rcbVBYZWdEY3YYi0+ZnogZXZN5660dVgk0m4=;
        b=aq9nR2c/322AceVdBFWEyb9xeGWBkga/2Hbr627l+QVJFbe97+KXfSJeV3fTFB9CUq
         BfF/2Qpz5a3wl4IQP1jPeoadeP0lW485r14X9me7DhMpaikVclkhFmE5P8NYD2CDul1t
         31OfKgBYxhLL3qLbb13IdwxDDzw9Q3WKtBm85gvEIEBXlrPHXiALFVXoMEHDQW09wxjW
         pHI/X+fm/MpZLM1NwkvZmed/e7t+E2pKvxGW7Y77E89d+5sgDueQkVVtXBtfzTxUSUyT
         WSgHnoTrEUy5qGA3V+jG1V8PvpeeS+q9itmcIcpgjVx8xIV3GtQ36akj3xQXDMC/8VKD
         kLIQ==
X-Forwarded-Encrypted: i=1; AKwUvBzyEYqQN5xwzGcxExcI6WsYnAbAgXxHEEjQlU8mEwNcmqzXvGxqORBIEtteJ7pXN+Be313rMoz1kkuzbhFP6rVg@lists.infradead.org
X-Gm-Message-State: AFq9FYIGqzq/POS+akFwTtVBA57UJTYMQ8vPGP379nQhXNCza50Pq3vo
	sfVtRkVNPl+4cW74BsCe6dycIAxARoaZVHZXh0cBtksNsw9Z9PhJQN9v8rv9/blDtw==
X-Gm-Gg: AYBFou1SuYpWiur6QE/yqCPOd0K30ERvTAnF3ncF7kJKx8YE0/ZvVAXAO+48YNM9KPa
	s1IPVm/JG3yAhzJBYrEDBPhwBjErGwpvjVqMiaEtZ9qE1bYull4u2I62g7EPh9nj8uZzhHhf+GI
	MihZoyE3AU6Vw1gdDkylHGyS8a0gzh4y/kdnfKC6jBqJte/mtEROMP8cnp+PQzrHzQXhkBMFhvt
	iUrywxPViuUK1ZGRWL7nCBRg+ugzHQGucvdO+SsCxnaRe5JyEQZ6MN9U0R8Uy9+2sxkQtmWn52w
	OvN00sKCPT4NDciWgD43zwQegLog3Ei5XFkXonL2OzVTIuVR5u3SnqPNtWxIx13VNexg0v2cGJ5
	yVmetb2zrExz+H9pE4+dCRKA3MD/NykKBzMPV+EHt4wP745PGG5YCHKE/KFYt0NtwvlfyTG1Oxn
	hiFymDrsH7idQz5nE/pf/AcQKCQXVHC5S5GLbT3k5+DyolK1Okj/BiW7wSyAHM078v9EdX0EsJ+
	GeKb0LLh+Dkb77XTotzxApCXmYsPPQz7S/j
X-Received: by 2002:a17:903:1a10:b0:2df:8e89:3bff with SMTP id d9443c01a7336-2e9b334381emr6523115ad.17.1792398517740;
        Mon, 19 Oct 2026 01:28:37 -0700 (PDT)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc4872861sm16015390a91.7.2026.10.19.01.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 01:28:37 -0700 (PDT)
Date: Mon, 19 Oct 2026 08:28:29 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Will Deacon <will@kernel.org>, iommu@lists.linux.dev,
	Joerg Roedel <joro@8bytes.org>, Jason Gunthorpe <jgg@ziepe.ca>,
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
Message-ID: <atXUrdEeHHAnKhBk@google.com>
References: <20260929034510.2023173-1-praan@google.com>
 <20260929034510.2023173-12-praan@google.com>
 <asZSQRSYBjbUaaH0@willie-the-truck>
 <370a947c-601b-434c-befd-4896ed523ced@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <370a947c-601b-434c-befd-4896ed523ced@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_012839_379048_CB637F12 
X-CRM114-Status: GOOD (  49.31  )
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

On Tue, Oct 13, 2026 at 12:35:40PM +0100, Robin Murphy wrote:
> On 07/10/2026 3:08 pm, Will Deacon wrote:
> > On Tue, Sep 29, 2026 at 03:45:05AM +0000, Pranjal Shrivastava wrote:
> > > Introduce a new bit flag, CMDQ_PROD_STOP_FLAG (bit 30), in the command
> > > queue's producer index to safely gate command submissions during device
> > > suspension.
> > > 
> > > The flag embeds the suspend state directly into the existing global state
> > > The flag is checked in the cmpxchg loop in arm_smmu_cmdq_issue_cmdlist(),
> > > which acts as a Point of Commitment, ensuring that no indices are
> > > reserved or committed once the SMMU begins suspending.
> > 
> > I'm not familiar with the term "Point of Commitment". Is that something
> > you came up with? Without a general definition, I think I'd prefer to
> > avoid using it, especially as it sounds like something to do with the
> > Arm memory system (where we already have architectural terms such as
> > "Point of Coherency".
> > > This prevents a situation of "abandoned batches" where indices are
> > > incremented but commands are never written, which would otherwise
> > > lead to timeout during the drain poll.
> > > 
> > > Update queue_inc_prod_n() to preserve this flag during index
> > > calculations, ensuring that any in-flight commands that successfully
> > > passed the point of commitment can proceed to completion while the
> > > flag remains set.
> > > 
> > > Suggested-by: Daniel Mentz <danielmentz@google.com>
> > > Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> > > Signed-off-by: Pranjal Shrivastava <praan@google.com>
> > > ---
> > >   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 35 +++++++++++++++++++--
> > >   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  5 +++
> > >   2 files changed, 38 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > > index a123810fac57..7f89e2306942 100644
> > > --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > > +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > > @@ -218,7 +218,8 @@ static int queue_sync_prod_in(struct arm_smmu_queue *q)
> > >   static u32 queue_inc_prod_n(struct arm_smmu_ll_queue *q, int n)
> > >   {
> > >   	u32 prod = Q_POS(q, q->prod) + n;
> > > -	return Q_OVF(q->prod) | Q_POS(q, prod);
> > > +
> > > +	return Q_OVF(q->prod) | Q_STOP(q->prod) | Q_POS(q, prod);
> > >   }
> > >   static void queue_poll_init(struct arm_smmu_device *smmu,
> > > @@ -726,13 +727,42 @@ int __arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
> > >   	do {
> > >   		u64 old;
> > > +		/*
> > > +		 * If the SMMU is suspended/suspending, any new CMDs are elided.
> > > +		 * This loop is the Point of Commitment. If we haven't cmpxchg'd
> > > +		 * our new indices yet, we can safely bail. Once the indices are
> > > +		 * committed, we MUST write valid commands to those slots to
> > > +		 * avoid indefinite polling in the drain function.
> > > +		 */
> > > +		if (Q_STOP(llq.prod)) {
> > > +			local_irq_restore(flags);
> > > +			return 0;
> > > +		}
> > > +
> > >   		while (!queue_has_space(&llq, n + sync)) {
> > >   			local_irq_restore(flags);
> > > +
> > > +			/* Avoid waiting for space if the SMMU is suspending */
> > > +			if (Q_STOP(READ_ONCE(cmdq->q.llq.prod)))
> > > +				return 0;
> > > +
> > >   			if (arm_smmu_cmdq_poll_until_not_full(smmu, cmdq, &llq))
> > >   				dev_err_ratelimited(smmu->dev, "CMDQ timeout\n");
> > 
> > It's a bit grotty to have the extra READ_ONCE() here. Why not make
> > arm_smmu_cmdq_poll_until_not_full() return if the stop bit is set?
> > 
> > > diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> > > index deefb17e31eb..794b258550dd 100644
> > > --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> > > +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> > > @@ -394,6 +394,11 @@ static inline unsigned int arm_smmu_cdtab_l2_idx(unsigned int ssid)
> > >   #define CMDQ_ERR_CERROR_ATC_INV_IDX	3
> > >   #define CMDQ_PROD_OWNED_FLAG		Q_OVERFLOW_FLAG
> > > +#define CMDQ_PROD_STOP_FLAG		(1U << 30)
> > 
> > I'm unsure about this. Bit 30 of the cmdq prod register is RES0, so it's
> > plausible that the architecture allocates that bit for something in future.
> > For example, if the index field was extended, then I think that would
> > cause problems for the driver.
> > 
> > Do we have to put the stop flag in the producer value, or can it just be
> > a flag elsewhere in memory?
> 
> Logically, it feels like this should happen earlier in the process anyway -
> if we're entering a state where we don't want to accept _any_ new command
> submissions, then surely arm_smmu_get_cmdq() should just start saying "No,
> there is no valid queue to submit this command." to everything?
> 

We can do that as well, but it can only be an early-out.. the STOP_FLAG
may not be set when arm_smmu_get_cmdq() looks at it, but get set right
after, before we reserve our slots in arm_smmu_cmdq_issue_cmdlist(). So
we'd still need the check at the point where we actually commit, i.e.
the cmpxchg on llq.prod.

Thanks,
Praan

