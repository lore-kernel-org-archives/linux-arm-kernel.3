Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7983EC36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 14:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mIQI4wwqmLAOPRWcmi090IBe48vdN2BWk6jfA22fdf4=; b=IIJPFKpx609FZ3ZhO0bMOFdebQ
	7Y3o/dso9xnrLsizAJcgTpCJHta/PDDyy4cuTcneu0RQfgmVQVEw+iAurMmgtHgo/uB5nKIYG+Mx8
	WVNNcEp88uDDYK3eLGzf6fyQIWLt0KvP1oD7wgDqIe4XN7SUsDDGwJTHngb71SsW13K+hLOo4A7qo
	mzYq08T+x0RxvV/S9SbsaAlFYxI/oQ83Rb7KLXu6Fce7r6ZmmNdHOSpof82beZWMlp93NhnbdDcOV
	MGfLXORKJ1YFWrMxMMoF4W2Pf9RYcD3L9SOUClfFlTV5+nNbT1ynnrQ6J10VjFM6ngfR4VBfpYInD
	dqUggIag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2WGC-00000007QST-2NZW;
	Wed, 09 Apr 2025 14:18:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Vc8-00000007Jn4-2saV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 13:37:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 67A9C5C4CE4;
	Wed,  9 Apr 2025 13:34:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38C86C4CEE3;
	Wed,  9 Apr 2025 13:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744205831;
	bh=UlHnIINK3hXAnc8dnyHTZc+hOC/0RUhg2HMmsTBNBvQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ILIPoAv/k7LqaCUhdE9DT97eKEnh8gzljrWqTZUEgt0Zqrm26HXMPSSMaHBp8g58D
	 VWtvrXZTpUiTYt50lvqCct3gyKyXfqeNckgRPROtWqSfpEEczJgwVuDXRCdFbNMcXm
	 cqNLqTSAK9Gsuvo9NfAecngtROsehcrPMbKvAfZ0MdmRAh2xiCEC9vTAE2MhQOw2nu
	 Uw6XFf+iXXOtt4bj4cPwimB/7bw9CVluBI+xYZ6Soige28t6Pih25LtEHuPsY/K9qC
	 tE0w+jXQJDZh/z/rydjNp3R5Ae7yVWlQH3t6ZO3GKwOJVtGr8M760vpBN04ATZdCyO
	 ya6oReDMOGCjw==
Date: Wed, 9 Apr 2025 15:37:04 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 22/24] irqchip/gic-v5: Add GICv5 ITS support
Message-ID: <Z/Z4AFYNQmxTApYi@lpieralisi>
References: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
 <20250408-gicv5-host-v1-22-1f26db465f8d@kernel.org>
 <87tt6xtwnp.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87tt6xtwnp.ffs@tglx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_063712_768587_7C30F58D 
X-CRM114-Status: GOOD (  13.35  )
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

On Wed, Apr 09, 2025 at 01:13:46PM +0200, Thomas Gleixner wrote:
> On Tue, Apr 08 2025 at 12:50, Lorenzo Pieralisi wrote:
> >  
> > +void gicv5_irs_syncr(void)
> > +{
> > +	u32 syncr;
> > +	u32 statusr;
> > +	int ret;
> > +	struct gicv5_irs_chip_data *irs_data;
> > +
> > +	irs_data = list_first_entry_or_null(&irs_nodes,
> > +					    struct gicv5_irs_chip_data, entry);
> > +	if (WARN_ON(!irs_data))
> > +		return;
> > +
> > +	syncr = FIELD_PREP(GICV5_IRS_SYNCR_SYNC, 1);
> > +	irs_writel(irs_data, syncr, GICV5_IRS_SYNCR);
> > +
> > +	ret = readl_relaxed_poll_timeout_atomic(
> > +			irs_data->irs_base + GICV5_IRS_SYNC_STATUSR, statusr,
> > +			FIELD_GET(GICV5_IRS_SYNC_STATUSR_IDLE, statusr), 1,
> > +			USEC_PER_SEC);
> > +
> > +	if (ret == -ETIMEDOUT)
> > +		pr_err_ratelimited("SYNCR timeout...\n");
> 
> This timeout poll thing looks very familiar by now. Third variant :)
> 
> > +static int gicv5_its_wait_for_invalidation(struct gicv5_its_chip_data *its)
> > +{
> > +	int ret;
> > +	u32 statusr;
> > +
> > +	ret = readl_relaxed_poll_timeout_atomic(
> > +			its->its_base + GICV5_ITS_STATUSR, statusr,
> > +			FIELD_GET(GICV5_ITS_STATUSR_IDLE, statusr), 1,
> > +			USEC_PER_SEC);
> > +
> > +	if (ret == -ETIMEDOUT)
> > +		pr_err_ratelimited("STATUSR timeout...\n");
> > +
> > +	return ret;
> > +}
> 
> And number four follows suit :)
> 
> > +
> > +static void gicv5_its_syncr(struct gicv5_its_chip_data *its,
> > +			    struct gicv5_its_dev *its_dev)
> > +{
> > +	int ret;
> > +	u64 syncr;
> > +	u32 statusr;
> > +
> > +	syncr = FIELD_PREP(GICV5_ITS_SYNCR_SYNC, 1) |
> > +		FIELD_PREP(GICV5_ITS_SYNCR_DEVICEID, its_dev->device_id);
> > +
> > +	its_writeq(its, syncr, GICV5_ITS_SYNCR);
> > +
> > +	ret = readl_relaxed_poll_timeout_atomic(
> > +			its->its_base + GICV5_ITS_SYNC_STATUSR, statusr,
> > +			FIELD_GET(GICV5_ITS_SYNC_STATUSR_IDLE, statusr), 1,
> > +			USEC_PER_SEC);
> > +
> > +	if (ret == -ETIMEDOUT)
> > +		pr_err_ratelimited("SYNCR timeout...\n");
> > +}
> 
> Along with #5 

No question about it, I will consolidate them as much as I can, I
noticed while implementing them then focused on getting the driver
functionality in place and forgot to create a single function,
apologies.

Thanks,
Lorenzo

