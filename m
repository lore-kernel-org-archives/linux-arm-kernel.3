Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD3AC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 19:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sEAeYa5lQ0rcwMSktfey6PB78GVtQgWknQk9cva6fPk=; b=qKcNlsmKe9yBMCYOVGdRBexcLX
	IyyVbNAJgVMgzMNpT81zV1K5+2GsOfowAC/S9/Ar9wHDDQv4xrHhBRvNcDiabkCuYDeAB7ZN5Mdz3
	RTcWxwywC3OvAiz6m2OlbAMWioEEEsXxhwgTm3jR2E1z0nykgaSF3Aehob1AoT7LBjfEVBEl9UBZL
	fuwJF8DfbMPMkLBWvvtuZrvDRH9+TVZGBFr328BsgM5+uR1unQvzarAg52hjNhY8QuGjVpWS0AXXu
	Lt03RzQCWHUdewY2JBoDjuEZhEADiecXoYIgkymKjUjKHRoUWm3/UmeCCNCucvOG5TFSzrW8MmLHu
	qbvJveIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qf6-0000000Fhvh-2wvD;
	Wed, 02 Sep 2026 19:30:20 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qf4-0000000Fhv1-2pfH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 19:30:20 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-5276d598b96so12875141cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 12:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1788377417; x=1788982217; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sEAeYa5lQ0rcwMSktfey6PB78GVtQgWknQk9cva6fPk=;
        b=ixkP2jM9aPolzjECtExjKtl1p3R/yHNTpDRYBghp2eh07Dvf2Ha/abJfXRVtXevgkW
         glHvjmezw7SM5Pa1mC1hWKzMa78sCdyJb1Eb4uLe5b8NjmcPplW32GQAOvyomRR+wWUQ
         Y1UhIcYhxkib5L1husxLA8JcMtSpECt4eWCDFme49zi51NLJ3MEZMzqU2R88k+aLysTH
         Un+EcRQPUJ1Ukemk2JuKxseMu2MA35Hei0imyGZBXu98DcQG4As/IEnE2YBZ2Dz6FM0e
         MDkKz0OJQP4bTevYftCGh4sHp7sXb0shcVVlASboXSXG9NY2hWNyTrGxbH03UEFCYhhy
         c7cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377417; x=1788982217;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sEAeYa5lQ0rcwMSktfey6PB78GVtQgWknQk9cva6fPk=;
        b=sORQrpX10OGH2lAkEYL2R94QzUsRD1+iA+p1tADbhad80x6WCBztJqAyPpgBAe/wg/
         Dj3PwxoHFyUahv+hDG64Tzj5qyXcfsBvyR42vyDv8P4NnCyb0Tj9cPhgaDhXLl0hLpMG
         h6JBRc7FAYsx1tSg4rcv5+LBG1ZZY5A6C8BhjPV3P47RfgccS5FoC2AipxWU+JBLf/7L
         lS8wf1wtgoRQ2wGqtUSjVNqf2csNwdxf87VjOeKmzB9TSgnWhT4jcO2pLmKvK1almD5K
         sxrt9X/dkSrBT8bDa38dwlXIHeGZJufI0q0c+HpGMpYnS8UUhpkW0n+iC3IQ6b80RLF6
         mayA==
X-Forwarded-Encrypted: i=1; AKwUvBylLoPclRI0Kuz16UINcEzkBHT+DxV+Hndg9eCMDtjFycZM427tEiE+C+3b6j4lwZMg8h8kxNCu66GwDsuicAx0@lists.infradead.org
X-Gm-Message-State: AFuF++nuV176wY8MbKreCzIBh6LSX4pm9nOCqNLJYnwTj+RgHiRcurtF
	Iz4EI/wKtTvY+GHTKwhlXPH3dhyyrp6GQ6lIlvmX/GQXgQxLwSq8vvtUbKLfU0VmVKw=
X-Gm-Gg: AYBFou1TkYUrxrCCJR0mhrzdNbjlSCejAstzHUwFmJCHTOTs9RrvToP7x0OPb+FmvMb
	l7/jtDXJW9/fJhUd/3M8IHGKsNzhng/qcB4JMf48Crw8e1nMtkUWLZmU02fuUy/ZIsBX8tOYmRc
	Rx57kEhcJ91BDlLxuh8LrN+63RvSEIAGqWIEIrauQcK6Q+Zt8cY2qp/9PQh6ipg7rUYnEK5horb
	A85zNncyseBgsysbk0GU1Zo+pjyHImTuUkKSZHOrlUS+u9AIiXZAW/BFu+2jULuLbR3+G4teG8g
	KhQPzOEfBaRjQeiIgl76K7R3EwK0E/WATuv7mPbNWZtqNME63XZXE2RNVWU+rQSeAye8IYsrZhF
	7bHv/n3IA+32NZf4yJMIXQESDF3X6sLxThn0XkBKnr8aYr8sk9C1Ubc80u86NKXS5Xppb7szUAa
	o1HV1QvfTMPSv2oCjaMVBS5HbCHtKY7XyXm4WaGxchAXNRJQ64Bh83Y5Rp11cxY/gjW82r1XW2S
	h9OiwaFjJIsU3voHCnOkmmiLSGKlf6edAKPqwjLJsI3kJjapatPCKEl
X-Received: by 2002:a05:622a:4113:b0:51c:2135:b00a with SMTP id d75a77b69052e-53036d7218fmr97850401cf.40.1788377416278;
        Wed, 02 Sep 2026 12:30:16 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9eec8099sm25200306d6.30.2026.09.02.12.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:30:15 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x1qf0-0000000Ez4Y-3Ck6;
	Wed, 02 Sep 2026 16:30:14 -0300
Date: Wed, 2 Sep 2026 16:30:14 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Nicolin Chen <nicolinc@nvidia.com>, linux-coco@lists.linux.dev,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Alexey Kardashevskiy <aik@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Joerg Roedel <joro@8bytes.org>, Jonathan Cameron <jic23@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Pranjal Shrivastava <praan@google.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Will Deacon <will@kernel.org>, Xu Yilun <yilun.xu@linux.intel.com>
Subject: Re: [RFC PATCH v4 03/16] iommu/arm-smmu-v3: Add initial pSMMU realm
 viommu plumbing
Message-ID: <20260902193014.GF2890729@ziepe.ca>
References: <20260427085344.941627-1-aneesh.kumar@kernel.org>
 <20260427085344.941627-4-aneesh.kumar@kernel.org>
 <apM6dOHcEI2ztWS0@nvidia.com>
 <yq5a8q5lz5yn.fsf@kernel.org>
 <yq5aecfdnv4i.fsf@kernel.org>
 <20260901143445.GC56830@ziepe.ca>
 <yq5a8q5kkoz3.fsf@kernel.org>
 <20260902121700.GC2890729@ziepe.ca>
 <yq5aik4nztdt.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5aik4nztdt.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_123018_732405_D2F3F869 
X-CRM114-Status: GOOD (  21.48  )
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

On Wed, Sep 02, 2026 at 06:45:42PM +0530, Aneesh Kumar K.V wrote:

> To reiterate, for this configuration:
> 
> - The viommu will use a stage-1 bypass configuration.
> - A new IOMMU_VIOMMU_TYPE_ARM_REALM_SMMUV3 type will create the viommu.
>   The psmmu will be activated at this point to avoid creating psmmu
>   objects early. We will reference-count it to ensure that the same
>   psmmu is shared across realm guests.
> - Creating a vdevice will invoke SMC_RMI_PSMMU_ST_L2_CREATE.
> 
> I am unclear about the vdev_create suggestion. Creating a vdevice
> requires an RD, which is created later in the flow above. How do you
> suggest linking vdevice_alloc to vdev_create?

I was thinking we'd make sure the KVM is associated with the viommu
and/or possibly the S2 domain. That was always sort of broadly the
idea in this space. There are several topics unrelated to CC that
needed this.
In any case, when you create the iommufd viommu you should also do
VSMMU_CREATE which needs the RD. It seems reasonable to assume the RD
is available during vdevice create.

[There is an aside here I will mention: several other use cases need
this idea of an "external" domain where the HWPT would be created but
not controlled by iommufd or the iommu subsystem. Xen and Hyperv for
example. There is probably some merit in thinking more about exactly
what the nested parent domain should be for this viommu, but it isn't
critical.]

> From the RMM's perspective, the sequence is as follows:
>
> viommu alloc
>
> [   rmm ] SMC_RMI_PSMMU_ACTIVATE            2b400000 8819bb000 > RMI_INCOMPLETE 0 10008
> [   rmm ]       SMC_RMI_OP_MEM_DONATE       0 881bac098 1 > RMI_INCOMPLETE 2 10004
> [   rmm ]       SMC_RMI_OP_MEM_DONATE       0 881bac098 1 > RMI_INCOMPLETE 1 10004
> [   rmm ]       SMC_RMI_OP_MEM_DONATE       0 881bac098 1 > RMI_INCOMPLETE 1 0
> [   rmm ] L1 StrTab: PA 0x881baa000 VA 0x80003c0000 size 0x2000
> [   rmm ] CMDQ: PA 0x88066a000 VA 0x80003c2000
> [   rmm ] EVTQ: PA 0x8815c5000 VA 0x80003c3000
> [   rmm ] PSMMU 0x2b400000 activated
> [   rmm ]       SMC_RMI_OP_CONTINUE         0 0 > RMI_SUCCESS 0 0
>
> [   rmm ] SMC_RMI_PSMMU_ST_L2_CREATE        2b400000 300 > RMI_INCOMPLETE 0 10004
> [   rmm ]       SMC_RMI_OP_MEM_DONATE       0 881bac098 1 > RMI_INCOMPLETE 1 0
> [   rmm ] smmu->strtab_base[12] 0x0 @0x80003c0060
> [   rmm ] L1STD[12] 0x8819bb007 for SID 0x300: L2 table VA 0x80003d0000 PA 0x8819bb000
> [   rmm ]       SMC_RMI_OP_CONTINUE         0 0 > RMI_SUCCESS 0 0

What was this one for during viommu alloc?

> vdevice alloc
> 
> [   rmm ] SMC_RMI_PSMMU_ST_L2_CREATE        2b400000 200 > RMI_INCOMPLETE 0 10004
> [   rmm ]       SMC_RMI_OP_MEM_DONATE       0 882648098 1 > RMI_INCOMPLETE 1 0
> [   rmm ] smmu->strtab_base[8] 0x0 @0x80003c0040
> [   rmm ] L1STD[8] 0x882506007 for SID 0x200: L2 table VA 0x80003cc000 PA 0x882506000
> [   rmm ]       SMC_RMI_OP_CONTINUE         0 0 > RMI_SUCCESS 0 0
> 
> RD gets allocated here
> 
> [   rmm ] SMC_RMI_REALM_CREATE              881b03000 8819a1000 > RMI_INCOMPLETE 0 24
> [   rmm ]       SMC_RMI_OP_MEM_DONATE       0 881605098 9 > RMI_INCOMPLETE 9 0
> [   rmm ]       SMC_RMI_OP_CONTINUE         0 0 > RMI_SUCCESS 0 0

Why? The VMM needs to create the kvm before starting the iommu stuff.

I would expect that KVM knows it is going to a realm very early on? I
had assumed the RD would also be created early by KVM?

What triggers RD creation? Why can't the VMM do it earlier?

Your followup said:
  - The realm is created during viommu allocation, ensuring that the
    vSMMU can be created here.

Do you mean the SMMUv3 driver triggers RD creation? That feels
wrong. Did you mean the VMM just does it earlier?

The draft in the next message looks promising, did you discover any
other gotchas when exploring it?

When you repost this can you take some care to explain the general
idea of this modelling in the commit messages so AMD and Intel can
confirm they can use it for both their non-viommu and viommu cases?

Thanks,
Jason

