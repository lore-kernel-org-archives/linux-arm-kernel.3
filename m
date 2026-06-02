Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF350C5DF71
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 06:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sYd3amg0E6+q9+HAfqzMshV6/sBvgCSxshzNIgfKNSA=; b=RkXla570lYfyCiGphzzCLcmdzq
	eMTzDdRuHUR0V0CfxWN4YXOrk6PEGMECvFGUA2FfjswALEcjSNEq+HMKTMa1EY0NtvVfQeJQd4+bA
	TsudMokQwMAFZehJ68Iot6BDhFgLmxHzxd6AsRmk/zfcW0I6ijwb1YnNf7g+REw9QODu0Do2Yj+0c
	IKiZr60M/WF5HPN+5BtbM2KOOZC1L6oMIaEWeO4Vfj5i9r1OpVwknhFUQXNjYFTAqj2H9uYbJszZo
	m+u3hNdRC4NV3Ho6wyF6Au67jzrml7VaQMHMTg5qPf3Ci+ctUHqmCJ6lswt68F63gv/YTLTZ8obmH
	METn67wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUIVh-0000000CNtQ-10Tg;
	Tue, 02 Jun 2026 06:21:57 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUIVe-0000000CNt1-1LG0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 06:21:55 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2bf22c18ad3so515ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 23:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780381313; x=1780986113; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sYd3amg0E6+q9+HAfqzMshV6/sBvgCSxshzNIgfKNSA=;
        b=MFHj1tub6SnxvjdtQHXFGZ3KJJBlUKBtWdzLIWYjV/OjbypLKQq1wuDN8OUpEfMz+H
         y46MFJccWKbkQ86bqok4qdvb1mzrM1e8B5jDOCS1eDcdjRzqLQp9CZ4JwVX44Aduhphn
         Ll2SjgYnrFCF818/DU/UkKARvqS+u1q+x390FnPMASmGhNQDcnbuvXh9Gm1J1ljPe3Tt
         VZdbUPskPi9YmtocegrTsqkzDW8IiN4e0hnBCDdsB9Ni6zCbRNdSSvRnIX7RIT+DQN5L
         ZVJHsImyami5tLfrviY8FTgJg6kpAG/KWXIbG6/GWZ5gMZRCNl4swPdazmUjpOl3Su4R
         S73g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780381313; x=1780986113;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sYd3amg0E6+q9+HAfqzMshV6/sBvgCSxshzNIgfKNSA=;
        b=L8DAdVVQrpM1k1p5Jqt51ednt2nrXNCdq7bWbuyEKVUszdICIHEGXE3XPTCOoKjvaK
         p6mbXtJ2RjcKGVaERnChJJMkz+eGXs2eRWVnv+AOOYqEgZKXHWnkOIkiSX5UwMG2wUWM
         mhplxCvVjJTalBemPm8/3e/XcEU3flS/x9G3kd8ja7ACToLPUReZkST6nQKZqgGKpbtx
         +q79QDsRvWtwYX/mDTgvG+/LJKiChlthaiwUtAS8RNKLGMFn0zyvCHZ5itO8X0zMlVNU
         3X1Z/biqL3CLv3Z2puWZ9dSLlrGQ32rFP+fcJ8ELbAJ8oASRuW3T56uAvyNgU05Zwa+5
         oXIg==
X-Forwarded-Encrypted: i=1; AFNElJ/9RXeLGz7pyjDn4gDNdUmyIbq18geqyhqJXIJ8M/p0MOCJw0e+0k9bJascjIpFmoJdeTAzqWhcJ3fpNQvF0fny@lists.infradead.org
X-Gm-Message-State: AOJu0Yxxxh+w8BrTVNeVE4ANRbA4NY0dWCrCpMrRyhqQdNDSNR81dyjR
	FKlx0P/g4siL8bd+fouAk2raUXoesATtl3YTHpV4J9GHRPv6vWFe/vxSKvftJNiIig==
X-Gm-Gg: Acq92OGVcuQnXj5xtLIO7Lf6KbZi5QwXaJrqEIuikD2aJ2LwXqDD0zPUnaYU8Kcop29
	xPikkZd5zIG1gSEOtKzm0K4yOT1S1SMxXD7Xwpy2DrMJNILq2+sOxwCFNnOalHwAD+oPHbTWfkC
	7q8JdjzB7cQuT2VmCy+j5tHaTWLZjc9RvIQYJYEGV0pgbA64hMz+LX8UYOi0pZIpFVyTYeyYxiN
	szh+AaC54WHlgWh1yAmPvUJ6O4SuIIaFoCh4YffVexmKzzQx0q8fnbDROdIe/WcoK/x9lPSxlHd
	iGrkwgVLk5hU9Yb9u04pv87GCEBWJaBO++Ytabs5XlJ0ngdhGgEvQbt4jomU8kTUerc32ge5fee
	I9tOemrXw946SPHYJMjCEwT0WhLT/Q/ccSCXE95kLoasQgqvXyX4OS7S44YDktRic+Sj4mYz8Uc
	Z5L6QZ9kkI7pzEwLmKov6WEqf5lFfaHir4J6dnIAnt+bZvIBvxU5RZc4k55KbtBSfjwG32NoQ+q
	FbFyzmrCQ==
X-Received: by 2002:a17:903:3846:b0:2bf:3741:5b76 with SMTP id d9443c01a7336-2c1129aa450mr1509075ad.3.1780381312701;
        Mon, 01 Jun 2026 23:21:52 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842498819e3sm6575263b3a.34.2026.06.01.23.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 23:21:51 -0700 (PDT)
Date: Tue, 2 Jun 2026 06:21:45 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>,
	Daniel Mentz <danielmentz@google.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 08/12] iommu/tegra241-cmdqv: Add a helper to quiesce
 VCMDQs
Message-ID: <ah52eZh0DJ8LFL0x@google.com>
References: <20260601215909.3958732-1-praan@google.com>
 <20260601215909.3958732-9-praan@google.com>
 <ah4gYCgSO1bBOUTj@Asurada-Nvidia>
 <ah5QB0Hfpi9wZMLY@google.com>
 <ah5xRRn0IjdWiF8F@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ah5xRRn0IjdWiF8F@Asurada-Nvidia>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_232154_579564_3712FC75 
X-CRM114-Status: GOOD (  22.18  )
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

On Mon, Jun 01, 2026 at 10:59:33PM -0700, Nicolin Chen wrote:
> On Tue, Jun 02, 2026 at 03:37:43AM +0000, Pranjal Shrivastava wrote:
> > On Mon, Jun 01, 2026 at 05:14:24PM -0700, Nicolin Chen wrote:
> > > On Mon, Jun 01, 2026 at 09:59:05PM +0000, Pranjal Shrivastava wrote:
> > > > @@ -887,7 +887,7 @@ struct arm_smmu_impl_ops {
> > > >  	size_t (*get_viommu_size)(enum iommu_viommu_type viommu_type);
> > > >  	int (*vsmmu_init)(struct arm_vsmmu *vsmmu,
> > > >  			  const struct iommu_user_data *user_data);
> > > > -	int (*drain_queues)(struct arm_smmu_device *smmu);
> > > > +	int (*quiesce_and_drain_queues)(struct arm_smmu_device *smmu);
> > > 
> > > Hmm? What's the point in PATCH-3 adding drain_queues then?
> > 
> > Well, you suggested in the previous version that STOP_FLAG needs to be
> > set for the secondary CMDQs too
> > 
> > All we're doing here is renaming this function as it also sets the
> > STOP_FLAG on impl-specific CMDQs now. We can still call it drain_queues
> > if you prefer not renaming this.
> > 
> > On the other hand, we can add a dedicated queisce_queues() op too that's
> > called before draining queues. I found that to be unnecessary as I'd rather
> > have one impl-specific op handle everything for impl-specific queues.
> 
> The renaming is very confusing... I'd leave it as drain_queues.

Ack.

> 
> Arguably,
> 	atomic_or(CMDQ_PROD_STOP_FLAG, &vcmdq->cmdq.q.llq.atomic.prod);
> could be even stuffed into tegra241_cmdqv_drain_vintf0_lvcmdqs(),
> where there is a for loop already.

That would be slow IMO, because we'd set the the STOP_FLAG on ONE queue,
then wait for it to drain and repeat this pattern for all vCMDQs.
Ideally, we should set the STOP_FLAG on all vCMDQs first and then wait
for them to drain.

Thanks,
Praan

