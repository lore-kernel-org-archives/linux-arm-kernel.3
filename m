Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C6A6CA5FA3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 18:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S6xtdmPyxZgVCGy2Ldjj48nQ82FMLqqca6Mq7V23FWM=; b=BOhyGZMvnuZQ/rUcavu5QNiyHi
	g699XjmXryHi0rib3aL4GC3yJYSqpdw0qO1jW6Rp5IG226BBBZZX6bMW62iW2OVDObgDraHeh4fEW
	mnWoMUh5MHKJRdNk85yv4L81PrjZCpS1H5dSnt62unetLS7dTQI71rrbhktF3+YQSF/296WOsTs1i
	/dFxrypDhTOhOTg0lbewdBPZrd91SLXUAM3u/P9Dy6Jdoe7xJQbUZA2YhRGej/U0A013v5RR7lODv
	acKk8mDCaozY+tHgw9QbRpBlOw3FEwn31O2y762OmXLsB1fhPhElNZBpIR+fiBodPtRQgr6N/G0b0
	QxqQqZJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBG2t-00000001JTQ-2wja;
	Mon, 28 Sep 2026 18:25:47 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBG2q-00000001JSl-42KG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 18:25:46 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2d3b445a84fso8405ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 11:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790619944; x=1791224744; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S6xtdmPyxZgVCGy2Ldjj48nQ82FMLqqca6Mq7V23FWM=;
        b=ndfZHRpQJvl7N0PMJlMkxoU5xFeXkFcziusMWFX1yEZkcojixwMN7rx19yaotxPip9
         m+UD9A8sd8v2kNW3EyPxXCrCYd+wwFqGc2aUVN5+mq7IjF2jlDEmHq3QCXww4KGc1fcx
         TznJOmuX/iDK4kTxex4iMPjGOw2IulQgqOufUVo5AtqAIy+aI84XZJJZt97UgjMOeXO6
         On0Fb8Ag2ZSNcMaQDQjpz9vD5WCmlUpIcuY+A47ExKD/oVWe0DzYaVu/+ciDCPH9sCHA
         04Z5BFBOMa2kzopugHgcIdZ1atPqUJZOndADcFbL2i6HVg8R2zgJAM8lNm02qFvYmWm2
         z+tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790619944; x=1791224744;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S6xtdmPyxZgVCGy2Ldjj48nQ82FMLqqca6Mq7V23FWM=;
        b=TiCjOQW1djkZ9ws8adynOharuH9BqbqHD0eIg1IQV+RKSmfTlYB6YP7faDXCltGycf
         tSvUl+mHweJ+GgOZoF+sSmY1w9SdpLJAutFOiwRBg6s7ccnq+dsai27tmqb+IPd8NoDY
         1scFwlMtwk1GXZ4Ow1S+5/ykjrWCGfG3YBy86tVwMCtInLC5mDzLeIX1rDyrSuBWiu8a
         I+bo3Oy/++qt0Oljy3SGWuuj8/eE0pcTlrAjvU6KoMDI39BAuW8eZc74mnsjd4DE9knq
         yb0dWKIbgnxeBd4lTys4joesWjCBGchXAwXCjUixlkYI6lHVz92kxLAdUNE8y+iLwtbz
         2hNg==
X-Forwarded-Encrypted: i=1; AKwUvBzwCZWNurUa7NqvZ4ircro6wjm5ZMxvzZHhMJdNa9Qtekdh7lLTdYnPEBu6kkExJcuOlLt58I7KRyQ7Ex+5cuy2@lists.infradead.org
X-Gm-Message-State: AFq9FYLG5KNZsbKBQbGN7HcaPpyI7naogNQXHs09LCbshvygoIc14aY5
	a1+C8U4Tjs4E9Nsq2JOk3C7pd7UX3L+D38w+9f/YzZ61N00236smn5MwhQse2bbTrg==
X-Gm-Gg: AYBFou00F/czO/H+cR4d2VIXsfosdEW4hi0M8KQucQaGuLx6VQfaBSAa79JuyvBfKpp
	bo4ODWVSfAp31BMo1OKoeFSr98MboKvfBUlbd8tLemZJzNpTAmrWkVUFYxJbrFPjasoKIhBAMhY
	SqlI4Hq0tgAZ55B88YWjKCnjFu/FpmQLjovcL26Rr8Bpzrqsc9VnA3rSrHdmZrDKjHsNrDhGb99
	JEs7IrIGpr6c+90ycQtZ4AOkUXR8s3dEc7aEz5bIiprVnFthjQUWhPx9tH8LX9b5d1PjYyku2Nh
	crP9ZcZxXzFg3as/EvMjB0HIVVA+wXG5QF6/AqLaSAB2vKsxXpktATmxBMY8v1abmUQI6FMa5lf
	042u5Q3+kxIrCqqyApvUmWO4lsY4EfSgqdLOapesCTFPkAOUSSU5IeJOqNPXEk8pZUOozldWIHk
	B8SRbbJTqyk+SVCfirFYe62Bu+PYLizWVAwanrrDXZjlJUyXZ5eszaF9xCUNi82BroH2IaYVXQp
	nCFNMqS8DH8AMfYx3Rg1XNFHq7762ego4Nq
X-Received: by 2002:a17:903:3a8b:b0:2cf:9ec1:ea6e with SMTP id d9443c01a7336-2e2c600c613mr28065ad.8.1790619943076;
        Mon, 28 Sep 2026 11:25:43 -0700 (PDT)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a49858c123sm831538a91.3.2026.09.28.11.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 11:25:42 -0700 (PDT)
Date: Mon, 28 Sep 2026 18:25:34 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, iommu@lists.linux.dev,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Will Deacon <will@kernel.org>, David Matlack <dmatlack@google.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	Samiullah Khawaja <skhawaja@google.com>,
	Mostafa Saleh <smostafa@google.com>, stable@vger.kernel.org,
	Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Subject: Re: [PATCH v7 8/9] iommu/arm-smmu-v3: Change how the tlbi describes
 the invalidation
Message-ID: <arqxHgwVXcS5PIJZ@google.com>
References: <0-v7-e84261bbe7cd+2ea80b-smmu_tlbi_jgg@nvidia.com>
 <8-v7-e84261bbe7cd+2ea80b-smmu_tlbi_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8-v7-e84261bbe7cd+2ea80b-smmu_tlbi_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_112545_004956_DFB93B1B 
X-CRM114-Status: GOOD (  25.56  )
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

On Mon, Sep 21, 2026 at 08:55:16PM -0300, Jason Gunthorpe wrote:
> The range-invalidation logic has long had a FIXME that there is not enough
> information to properly compute the range invalidation. There is also
> subtly not enough information to properly compute the single stride
> either.
> 
> Change tlbi to use the information format that iommupt is going to use for
> ARM. This prepares the invalidation code to support iommupt and fixes two
> small limitations with the current code.
> 
> iommupt is designed to accumulate all invalidation into a single gather,
> then the iommu driver should issue a small number of commands to execute
> the gather to control invalidation latency. This is in contrast to
> io-pgtable-arm.c which generates many gather flushes and direct walk cache
> flushes as it progresses.
> 
> To accommodate this the gather will accumulate "damage" in bitmaps, one
> for leaf changes and one for table changes. This is enough information for
> SMMUv3 to compute the proper stride for single invalidation and to
> generate ideal hints for range invalidation.
> 
> Change the inner workings of the tlbi process to directly use this
> new-style gather description with the idea that the iommupt conversion
> will just direct assign the gather fields to the tlbi.
> 
> Rework the three places creating the tlbi to express their needs in
> terms of the new bitmaps.
>
> 1) Simple iotlb invalidation always gets a single range of leaf
>    levels, so it can set a single leaf bit
> 
> 2) Walk invalidation is expected to clear the table and all the leaves it
>    could contain. Set a single table bit and all the leaf bits.
> 
>    There is a weakness in the existing io-pgtable where it double
>    invalidates the leaves, once through the arm_smmu_tlb_inv_walk() then
>    again through the gather. Since these are separate operations they are
>    not capped by the invalidation count limits and a single unmap may end
>    up doing thousands of tlbi commands. Eventually converting to iommupt's
>    gather only approach will correct this.
> 
> 3) SVA invalidation has no idea what the MM did, so it will set all
>    the bits in the bitmaps.
> 
>    This corrects another weakness where the range-invalidation logic
>    was generating hints assuming the #2 rules which isn't correct
>    for SVA.
> 
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

