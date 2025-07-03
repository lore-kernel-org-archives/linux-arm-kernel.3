Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A887AC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 17:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZyBqVSoupq82KbFVVt6LJyI9rbtpg1wvjlbr52oP/Zs=; b=G1zsNAfj4SMBymqaeSnH0xbq3E
	6SZHe+Eefnm5cv4VCH1Rx/GXcwRZCp7gOYW/eLjh4FfWAAu0IGQ/ZZM5TUQ3UNDmtUDeKL0DhVbsV
	T4keLZeSHBKPb/EXh7Map287tPrg9NV2GhyvrQE7/a0Sg0+Jh/2J6RipQdpoFnv4jt6xcxAqdCrWG
	lY9FZK2EjCRKk+X+i7/rl3Z4P0bWJgeMCDxY1KYVesrg3jdgO3NbpC/8a/Gr7TPloRkPmAf+yf89+
	rl5bhGPP917bqle7ZqxwptfZU2EV3/WlwCEEebsXcODTgE5icRJUzwrWcRJJZosNip4ugf3nGoOjN
	8RY8ocvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXNaS-0000000C6tK-29oj;
	Thu, 03 Jul 2025 17:19:04 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXLCZ-0000000BiRT-0D9p
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 14:46:16 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-237f18108d2so205875ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 07:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751553973; x=1752158773; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZyBqVSoupq82KbFVVt6LJyI9rbtpg1wvjlbr52oP/Zs=;
        b=JPYmdEt62qgnk3OiyWE9HIgdr32lrVwqlhpL20c87sdvx1PGOZ55zpcv6wJmCmcibx
         mGo2dEouMFyrmKMQVsxRDC5FthUnH0lDMOnNsa4wxi/srMCFn7RLTYtLDX+YVT6xS5OG
         Ype94C+Xxu6FkdoCDQ7SmCKVyzLSyQ8j/Kv74XGgx1KwKxYFP71h+s3WPf/0K8/+pcs6
         4/68be1QGuKYofUif2f/18iiDqXviRMZfDVvrxSk3iBmiyUYEc1gnORFLEwmFWqjgJrp
         LCw9hfyfkCZ8iHperJS90+N4cnJDYwdZyV3mngYz5sIfQEmR2VIpPx6Y1J5doxRxCOjk
         30GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751553973; x=1752158773;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZyBqVSoupq82KbFVVt6LJyI9rbtpg1wvjlbr52oP/Zs=;
        b=AQ7/Wge2ZEITMQ9SGV1ogyluRWc8eCSNbvlfWADoCMSAd2o3chPGnrMLNnnBvhNNja
         LzGqoZFtr7FarvUuTKNeESB06QpsaDkZxI5YhCfnpc8KmN4cd/PgKl3OWp41gjPLugGQ
         K4ydXJExXYWIBxS5zddW2t+vD04pnBzOLdquZ6eCrhdLOKxSQq9BV4b69u7p3rEFOlb3
         h6SccLvLMQdNR/ModIcG8UFyPaRIc7/mF/WQ7AIaolXfSx57dbviWi+MFb6jZeyTWyJI
         Fklo88YfLxf1y15Q37Mw78UZwiqNrRXcN8eN+03P+jSPxXT+/Lp+V28OPpog+7S0NhTx
         +8/Q==
X-Forwarded-Encrypted: i=1; AJvYcCV5iriZJaLBYWz25LRxJqNdU6yqYxGTPq14mKk3Xxe2ly9YZtyrJBXZVwahgyf5xr7CHiR4QGdAF694q3+8A6+G@lists.infradead.org
X-Gm-Message-State: AOJu0YzFKa2SON4n9/hyF0LLuRClYFZqIQmP51VoVYHOI0ZBMZHhgA5p
	QYVsw8gcK4suYngd4Bc3PamER/aX4rKh1ZfVeiuEJ4zMuvk/MENpISkWAHZe3D7Isg==
X-Gm-Gg: ASbGncsMJJNDaKZk6lU7GriGQ3FOoqcVM9VjKoKr9mQLwY/so1sx7rmyse3wbc8QJAB
	iv1qYSAz7IdyzmSb66It+ALvzf2ZFmjqYVMeoQsKIcVc+fohPyYkqpfTcYV/UZBKoPYBOYXAcVD
	dJUIyo+x29qi0SHv4T1vNF88gmVg5pOzfg6bqQ6Mc1+UmSgkM+pm3UHmcQnBr1pBcJ8yv1cvZGF
	HnBibd5KMKH3R6RT87a251/RXIjODRUOfTFbIODt9BBA2hjx4DRzioPWUB5qcSuEpsdh48zCJ1/
	EJ5V+MkFZCqUHvyvNl9B1lHOb84CC5/xhdr9ZfJ8d77PVnJW/gVlXevmCWHc5MQhsTNHSojIKbh
	3rv8Nlf+dhMRYnuPtGfhkd7We+ZL1iYM=
X-Google-Smtp-Source: AGHT+IE+IjimVm/cNBTQKKRIynsqnkmviMOQfy4mliRYK2mww3VHnjujL8mKkHcoqxy9cwNV6ZMlng==
X-Received: by 2002:a17:902:c941:b0:22c:3cda:df11 with SMTP id d9443c01a7336-23c79b3ab97mr3276285ad.10.1751553972827;
        Thu, 03 Jul 2025 07:46:12 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2e39d4sm158508935ad.18.2025.07.03.07.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 07:46:12 -0700 (PDT)
Date: Thu, 3 Jul 2025 14:46:03 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, kevin.tian@intel.com,
	corbet@lwn.net, will@kernel.org, bagasdotme@gmail.com,
	robin.murphy@arm.com, joro@8bytes.org, thierry.reding@gmail.com,
	vdumpa@nvidia.com, jonathanh@nvidia.com, shuah@kernel.org,
	jsnitsel@redhat.com, nathan@kernel.org, peterz@infradead.org,
	yi.l.liu@intel.com, mshavit@google.com, zhangzekun11@huawei.com,
	iommu@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org, linux-kselftest@vger.kernel.org,
	patches@lists.linux.dev, mochs@nvidia.com, alok.a.tiwari@oracle.com,
	vasant.hegde@amd.com, dwmw2@infradead.org, baolu.lu@linux.intel.com
Subject: Re: [PATCH v7 27/28] iommu/tegra241-cmdqv: Add user-space use support
Message-ID: <aGaXqwzfLwsgCH6n@google.com>
References: <aGQ_F7Qx3scbbA-J@google.com>
 <aGRDtYRXFLoT+PrI@Asurada-Nvidia>
 <aGRIctg4T6cQECx4@google.com>
 <aGRcPSwaJkTeUrMx@Asurada-Nvidia>
 <aGRmaOORg-YDfncY@google.com>
 <aGRozoIDIlgl9H9x@Asurada-Nvidia>
 <aGR55PUBnwb8qT8U@google.com>
 <aGSBTpY0nkdp2TTL@Asurada-Nvidia>
 <aGSNmf5Q82xEbDpX@google.com>
 <20250702180541.GD1139770@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702180541.GD1139770@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_074615_106204_6B16156E 
X-CRM114-Status: GOOD (  35.58  )
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

On Wed, Jul 02, 2025 at 03:05:41PM -0300, Jason Gunthorpe wrote:
> On Wed, Jul 02, 2025 at 01:38:33AM +0000, Pranjal Shrivastava wrote:
> > On Tue, Jul 01, 2025 at 05:46:06PM -0700, Nicolin Chen wrote:
> > > On Wed, Jul 02, 2025 at 12:14:28AM +0000, Pranjal Shrivastava wrote:
> > > > Thus, coming back to the two initial points:
> > > > 
> > > > 1) Issuing "non-invalidation" commands through .cache_invalidate could
> > > >    be confusing, I'm not asking to change the op name here, but if we
> > > >    plan to label it, let's label them as "Trapped commands" OR
> > > >    "non-accelerated" commands as you suggested.
> > > 
> > > VCMDQ only accelerates limited invalidation commands, not all of
> > > them: STE cache invalidation and CD cache invalidation commands
> > > still go down to that op.
> > > 
> > 
> > Right, I'm just saying the "other" non-accelerated commands that are
> > NOT invalidations also go down that op. So, if we add a comment, let's 
> > not call them "non-invalidation" commands.
> 
> There are no non-invalidation commands:
> 
> static int arm_vsmmu_convert_user_cmd(struct arm_vsmmu *vsmmu,
> 				      struct arm_vsmmu_invalidation_cmd *cmd)
> {
> 	switch (cmd->cmd[0] & CMDQ_0_OP) {
> 	case CMDQ_OP_TLBI_NSNH_ALL:
> 	case CMDQ_OP_TLBI_NH_VA:
> 	case CMDQ_OP_TLBI_NH_VAA:
> 	case CMDQ_OP_TLBI_NH_ALL:
> 	case CMDQ_OP_TLBI_NH_ASID:
> 	case CMDQ_OP_ATC_INV:
> 	case CMDQ_OP_CFGI_CD:
> 	case CMDQ_OP_CFGI_CD_ALL:
> 
> Those are only invalidations.
> 
> CD invalidation can't go through the vCMDQ path.
> 

Right.. I was however hoping we'd also trap commands like CMD_PRI_RESP
and CMD_RESUME...I'm not sure if they should be accelerated via CMDQV..
I guess I'll need to look and understand a little more if they are..

> > > > 2) The "FIXME" confusion: The comment in arm_vsmmu_cache_invalidate
> > > >    mentions we'd like to "fix" the issuing of commands through the main
> > > >    cmdq and instead like to group by "type", if that "type" is the queue
> > > >    type (which I assume it is because IOMMU_TYPE has to be arm-smmu-v3),
> > > 
> > > I recall that FIXME is noted by Jason at that time. And it should
> > > be interpreted as "group by opcode", IIUIC.
> > 
> > I see.. I misunderstood that..
> 
> Yes, we could use the vCMDQ in the SMMU driver for invalidations which
> would give some minor locking advantage. But it is not really
> important to anyone.
> 

Alright, I see. Makes sense. Thanks for the clarification.

> > > The thing is that for a host kernel that enabled in-kernel VCMDQs,
> > > those trapped user commands can be just issued to the smmu->cmdq
> > > or a vcmdq (picked via the get_secondary_cmdq impl_op).
> > 
> > Ohh.. so maybe some sort of a load balancing thing?
> 
> The goal of the SMMU driver when it detects CMDQV support is to route
> all supported invalidations to CMDQV queues and then balance those
> queues across CPUs to reduce lock contention.
> 

I see.. that makes sense.. so it's a relatively small gain (but a nice
one). Thanks for clarifying!

> Jason

Praan

