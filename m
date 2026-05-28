Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 055D1CD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 21:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C15T9rUB0bBkSab054WlEa7OUctxw0eLHuncdw99Sw4=; b=grd0J6SLXevb528PX4E9tAqkZq
	ylcfVMsV+dnKi0EgGIg2wsHnu+1uVTh9vw5056m5MBrQk6AQZJW63kPXyDvFN79IcpFAt2q8o1fWL
	upuVQJ24VeMvLMAjqg+2y29rhsZH2WDEW7dbnpZb5bcROXBFRJQMf+vj3In1jvr9FVMZ2sC6lYSqG
	uj+1fQnNAb97iFjEUlTAWdfnbMOZkJtUk4n6ojHU3iH72rZlqvCE3DTjBv5DVF/ZwL3b+kzwzlCai
	jo1RkbB8IrKfhjQHgtggoCON0mi4GsP6ocCmFSzWewvQ0hP8YnlDbRjd8NotfNTQeCLxHGJYofOCe
	Zc+t5rkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSiAX-00000006Odn-0HdY;
	Thu, 28 May 2026 21:21:33 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSiAU-00000006Od9-0XQT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 21:21:31 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2ba180a022dso1375ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 14:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780003289; x=1780608089; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C15T9rUB0bBkSab054WlEa7OUctxw0eLHuncdw99Sw4=;
        b=DutgsoywnN0MVcl8XE7EW5qYp7ucZBg2C0dnNY8ITeJzvpFG1vh2zP4CRYqKU2HTvn
         9p+r3OR0fXQiAEuLZukJEuGcJu+muSQdZ4g58A2bgt02vNv7xDFmIPEn3Opob1k9+yZo
         cKfsW3uElniAU0ktwMF79CT5Y7DsTot2wcOoHQZh0x7Osdbe4VnlnV0S2AcptgJi2XoK
         JdNgD4oqnD2mZ+yaS7gCp0qsSa8Nd20esLSvaNoWRF79WLLtN2nb6qD3hexhV+3xBpTl
         ag+mSgANNdNMkG6tINpGm1DpcfjaXFfuUC72YMZrtqnrWht3U9dnxoMgnf9jjY4vvxMF
         6djQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780003289; x=1780608089;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C15T9rUB0bBkSab054WlEa7OUctxw0eLHuncdw99Sw4=;
        b=FYoKVI6yfmrqu6Rk8Z4rIntuldMbzWuMxXKzduXDBhznsw6KV29rFLwUeE9eI2NAXG
         ChdYyi7ayLOpVs45cel0CUg3ImPiDFfTYv7UoiHdI0JjcEpHHcXc9JiUCa5Jj3cpyOh9
         ZVJ0XVnJN7OHrhtuqYrpcZBeRRXBr4oe8qZChwgPFFG2WnVEyVPcm8M/G6QtbFiMYIXh
         pWxXkPJBbdlWZ8qGFWESD7axHLPw5wAWrkcdvQ2ATWFrnbt4KTiLck+thUXpPQ4D32is
         dzJ+AGYZbHnv00cpbVgC87sQfRdOhHh6GqPDzp90Dug1s287FzOpmtJA6+3e+5LPNKvk
         UOsA==
X-Forwarded-Encrypted: i=1; AFNElJ/+EDTW352wBpUTBsF+B7DkDFXROfDXmxBJKffAXvsJe/TMJJW6e6QUvptQG2BSqrRPtfzjJJm+RT4nBVEw+Irr@lists.infradead.org
X-Gm-Message-State: AOJu0YypFcNmdz7BLX7xA5B/i3Z3SuPd893p+pvDXpduei+y4TucyJBH
	ikFjzG1gnY3urP1daVxLb4YTh2ZBSremVPCzdy9s89GkL+pMZjg4tIZB2vYu+XilMw==
X-Gm-Gg: Acq92OF+TdxyhE5ZztwhlqkjyXlKVIxP4cVLaAOjqj8/ymGk8ifAas8Nh7vBTCNS++S
	BwOcO1W+ANIcXKoHHGqnd1eIZ94oNDU0+dJz6DpJij0z4aNumzTkjIuUoqt9/meaIjqyzsKYG8v
	ALpKOypqFXEBoQ2eiA2TOLJq5KWaJfW19tZ/hqXWTKuslGBXAGbTyq/uFX1bfRJN/lUZJddANxQ
	achF2g9yIqzYGschuV/vyyu7WkwtyBan16/X0uC8WHN9UlutW6i2NOTk5y3PkHggmelZZXf+hOt
	KTg1g10hKMKFXhSMhPvgi+Zq58aFOi0bxFh67HCI7MHI7sDPjquJ3hdBrVwzDk5u+XEPrim2jYg
	1GbbRKY0mHr+bCLI2Bvp5Vv3hugf3zCijNbFPVuN1RAghsg/av2MeOrpYMzdLHQ74eclAFWFKjP
	+w1DOQgdUD6Cf7+FNAG1gfvZYsrE821ta7zEEeSa4Bs6BpviNsSHOz3cm/j8e2PwrHDgAe
X-Received: by 2002:a17:902:db02:b0:2bf:1153:54a0 with SMTP id d9443c01a7336-2bf20d4f08dmr142715ad.23.1780003288783;
        Thu, 28 May 2026 14:21:28 -0700 (PDT)
Received: from google.com (44.234.124.34.bc.googleusercontent.com. [34.124.234.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf1e7e3d93sm2247895ad.39.2026.05.28.14.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 14:21:28 -0700 (PDT)
Date: Thu, 28 May 2026 21:21:22 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>,
	Daniel Mentz <danielmentz@google.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 08/11] iommu/arm-smmu-v3: Implement pm_runtime &
 system sleep ops
Message-ID: <ahix0vUm03lxDwAC@google.com>
References: <20260527221407.1756491-1-praan@google.com>
 <20260527221407.1756491-9-praan@google.com>
 <ahiaApzK1/nBwr2R@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ahiaApzK1/nBwr2R@Asurada-Nvidia>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_142130_170947_8B6391AC 
X-CRM114-Status: GOOD (  28.02  )
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

On Thu, May 28, 2026 at 12:39:46PM -0700, Nicolin Chen wrote:
> On Wed, May 27, 2026 at 10:14:04PM +0000, Pranjal Shrivastava wrote:
> > +/* Runtime PM helpers */
> > +__maybe_unused static int arm_smmu_rpm_get(struct arm_smmu_device *smmu)
> > +{
> > +	int ret;
> > +
> > +	if (pm_runtime_enabled(smmu->dev)) {
> > +		ret = pm_runtime_resume_and_get(smmu->dev);
> > +		if (ret < 0) {
> > +			dev_err(smmu->dev, "failed to resume device: %d\n", ret);
> > +			return ret;
> > +		}
> > +	}
> > +
> > +	return 0;
> 
> Nit: ret is used within the first if.
> 
> Yet, I wouldn't like it to move. So, maybe do an early return:
> 
> 	if (!pm_runtime_enabled(smmu->dev))
> 		return 0;
> 

Ack. I'll add an early return.

> > +__maybe_unused static void arm_smmu_rpm_put(struct arm_smmu_device *smmu)
> > +{
> > +	int ret;
> > +
> > +	if (pm_runtime_enabled(smmu->dev)) {
> > +		ret = pm_runtime_put_autosuspend(smmu->dev);
> > +		if (ret < 0)
> > +			dev_err(smmu->dev, "failed to suspend device: %d\n", ret);
> > +	}
> > +}
> 
> Ditto
> 

Same here.

> > +
> > +static inline u32 arm_smmu_cmdq_owner_prod_idx(struct arm_smmu_cmdq *cmdq)
> > +{
> > +	return atomic_read(&cmdq->owner_prod) & CMDQ_PROD_IDX_MASK;
> > +}
> > +
> >  static void parse_driver_options(struct arm_smmu_device *smmu)
> >  {
> >  	int i = 0;
> > @@ -789,7 +822,8 @@ int arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
> >  		/* b. Stop gathering work by clearing the owned flag */
> >  		prod = atomic_fetch_andnot_relaxed(CMDQ_PROD_OWNED_FLAG,
> >  						   &cmdq->q.llq.atomic.prod);
> > -		prod &= ~CMDQ_PROD_OWNED_FLAG;
> > +		/* Strip all metadata flags */
> > +		prod &= CMDQ_PROD_IDX_MASK;
> 
> Should its prior atomic_fetch_andnot_relaxed() call do something
> about the CMDQ_PROD_STOP_FLAG as well?

Umm.. No, the atomic_fetch_andnot_relaxed() call must leave the STOP_FLAG.
This block is the owner-publish phase, which occurs *after* the Point of
Commitment. If a submission successfully reserved its indices before the
gate closed, it shall be allowed to finish.

If the owner thread cleared the STOP_FLAG here in the global memory, it
would prematurely re-open the gate, allowing new racing submissions to 
leak in during the suspend sequence. 

The algorithm works mainly because the RPM callbacks are the only ones
that are allowed to manipulate this flag.

> 
> > +/*
> > + * Lockless pre-check to elide invalidations if SMMU is suspended.
> > + * Races with concurrent suspend are benign: the cmpxchg loop in
> > + * arm_smmu_cmdq_issue_cmdlist() acts as the true commit point.
> > + * If we lose the race, that loop observes Q_STOP == 1 and safely
> > + * drops the command. If we win, the suspend thread waits for us.
> > + */
> > +static inline bool arm_smmu_can_elide(struct arm_smmu_device *smmu)
> > +{
> > +	return !!Q_STOP(READ_ONCE(smmu->cmdq.q.llq.prod));
> > +}
> 
> arm_smmu_cmdq_can_elide()

Nice name! I'll update it.

> 
> Should it handle a secondary_cmdq?

No, I don't think we need to check secondary queues here. The STOP_FLAG
being set on the primary CMDQ during the suspend should suffice to 
indicate the entire SMMU's power state. That's why the function takes in
the smmu ptr and not the cmdq.

Altough, thanks for discussing this, I noticed that while rebasing I
missed the elision check at one place: arm_smmu_write_ste()
I'll take add a check in that too in the next version.

Did you have another scenario / use-case in mind where this might not
work?

Thanks,
Praan

