Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B728CC9833F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 11:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AHgrG2jneIj+c6tmDkqbazBsM333la4Thr0x2hp0ezw=; b=3m8gM6FFp9a6xNWy1NO5bMqek2
	TJCS6DPB5xY67kbzEIGP/3FWFzXTen6SX/ngcu1xMpnGjvXtf+sgRJYl8Q8zeSba5DGfxKLp9wOp7
	9Vs1wnLgh5idzKHAbrxTPaTwaetbG25Xu1p2YicFbT3/ZrbPWxXljkIQ+OvhLROhhRkI5iOoIxiK9
	jLJsg8XYtlLVlv3EdvsbGMP0VpQVwTrtcPbZdTO1lLOk2NuJmi9Y/69+sTwbuQqdqpSh6xa2lDdfo
	SUBtR97St70a7aeO+RId0Em21llG5hVV5r8lr8OCZnGVdys3rrAk6T/gSnQWku92KV7cMsVRcJKTl
	ZJT7jP1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB9e6-00000000TYl-2hQJ;
	Mon, 28 Sep 2026 11:35:46 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB9da-00000000TTB-1sdG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 11:35:15 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2d8fd7a3f38so67715ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 04:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790595313; x=1791200113; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AHgrG2jneIj+c6tmDkqbazBsM333la4Thr0x2hp0ezw=;
        b=Xf17uS85+hwcddoL+2sJZKKOa5fjrac2oPDEjyWhAhAw5Y1d7QoqaOg0l/mVBGi5Iy
         KOTYIW2A+FR7sSRqJuq20kAs2uuDy9paVWi5udBQuB39i4ukeCRNc0Zws7fhRQddiw9L
         iuzzZeiFbDk766/NG27AZhmlErSdEoJd+tyIsVg7m2a4vTK1i2YBWMNAqke/iCjImHIg
         VVODDCt8LeDJIS7VAGLsLm5h4C3aDzK8TndPcbRiluoX5DaWqs8TN+3MV10Cw21HaO1w
         HGuQi5aPsqXf0CLZxp4Qo3nQyG6+5XXusml86qysUMdiBv4OC0EPULucSa9/QQA9oGwm
         ZGHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790595313; x=1791200113;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AHgrG2jneIj+c6tmDkqbazBsM333la4Thr0x2hp0ezw=;
        b=vrvP/smF+pVsqZk73+mSPL4SF/lWwGsnkyHiTmF+l7JrA51sQi5LImLI/w5RApmbNL
         HjVtyslHqjQbNFzDStiIC9sGjdeDqNKp2F4bHm+dz/jUbn4P9TtMIDEEarrWFiOnQgWc
         2TT/FYlm+f3LJEGeOutobCQIb/aEgrz8/eK7942MsrmPtSe7Il2Lb703JEiqgjnRm02M
         IBAkcSpkz95DTyGXKI6hhFNI/qJQoEM5DWVcuQztHRZoiXwxdK7NYMqt53xQPPtjnDfz
         992N1giDbzVcK846OPRUkm7otzoqarbhXL1WZZxHZiR27tPolVC4OPTlDDr6FLaemGaq
         SCMg==
X-Forwarded-Encrypted: i=1; AKwUvBxNQ2RKXbfdmfrhmC54yl1F+TMcH+DcW9WrkW+42tXoz2kbzPJY12WZg7bZjl1fEk6/ejm9+SZy0D5noDCZyO0g@lists.infradead.org
X-Gm-Message-State: AFq9FYLkAgElmHg9aNTwJCa+V3qHBEftI1s2bI5uz8yr14fNoTf6Ikrb
	4hM+5irtGavtMDIuBNNCjhRx8hoGErUAFUNYQQ+CTvvwTacXV1LDoko3mAg9/0CmOg==
X-Gm-Gg: AYBFou1BA1Lj6GUL6Oe04SxblB8Bao3xC5S76xynkHTp6wew19r/xi29G8XxZGqEWAG
	VHXKzaACXYgdMmvYCJD8I3quIIAK6oIN4z7ANv/ZC/lzEMcqwbr5omHTtujIgw86ffubJCze6Zb
	9L/4CBy7/l4qXmPOuuitqu6/NpnWiWrC84WZWUnqGCWJGudAi+dJzom84sqzWRZt7NRLB7K9QPq
	czfFrXNEww+sx/kRmS/aWdnxTr4GgjAqkEJr073tzbS5LsGdTrO8YBkXyn7bmJ0yeCJcaiONMgk
	W2LjYfU95u+NM+BPr45o9eCzNA/cQaFCzyCPs9D3EZDws1S4yCVlLywyIvNGhKG4m8Lk0p9s810
	axXL1ZcT2AVVmztatYpdK1BDKfg9LJHyWnua1oeVJybyBXouXiZJmx/TD1oSSneJ8aqEimxGKzq
	3NJ9vnw1YV/OIf3UGOI8uECqY7foNm0mjAYNlg8Z9PJHKIEpWzRu5blFEOhcMj289kXCkcPw9Lp
	4cl1wB9wdgfRO6IoFtcGhmLw44QitSUiYzw
X-Received: by 2002:a17:902:e892:b0:2c7:9e6a:1a8d with SMTP id d9443c01a7336-2dfa62274fcmr6365335ad.12.1790595312887;
        Mon, 28 Sep 2026 04:35:12 -0700 (PDT)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913dbc34sm39183265ad.13.2026.09.28.04.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 04:35:12 -0700 (PDT)
Date: Mon, 28 Sep 2026 11:35:04 +0000
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
Subject: Re: [PATCH v7 1/9] iommu/arm-smmu-v3: Handle ARM erratum for CONT
 under invalidation with SVA
Message-ID: <arpQ6KINJE4velBl@google.com>
References: <0-v7-e84261bbe7cd+2ea80b-smmu_tlbi_jgg@nvidia.com>
 <1-v7-e84261bbe7cd+2ea80b-smmu_tlbi_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1-v7-e84261bbe7cd+2ea80b-smmu_tlbi_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_043514_502211_15EE1F6E 
X-CRM114-Status: GOOD (  25.74  )
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

On Mon, Sep 21, 2026 at 08:55:09PM -0300, Jason Gunthorpe wrote:
> The erratum (MMU-700: #3777127, S3: #3673557) deals with under
> invalidation of a CONT PTE grouping in the SMMU. The recommended work
> around is to use a range invalidation that spans the entire CONT. The only
> user of CONT in the kernel right now is through SVA sharing a CPU page
> table that contains a CONT created by the mm.
> 
> Previously it was thought that this errata was dealt with because the
> driver always uses range invalidation. However, there is a subtle detail
> in the errata that the invalidation range must fully enclose the entire
> CONT for it to work.
> 
> It seems that two sequential range invalidations, with a split point
> falling inside a CONT grouping, will not prevent the errata.
> 
> The SMMU's range invalidation generation algorithm does not produce a
> single invalidation for a single SVA invalidation request, nor does the mm
> carefully align the SVA invalidation ranges to accommodate the splitting
> of the invalidation into several ranges.
> 
> Thus, when processing a SVA invalidation, the range invalidation splitting
> routine can generate a range invalidation that is split in the middle of
> the CONT and risk under invalidation from this errata. This condition
> could be triggered by a malicious userspace manipulating the TLB gathers
> via mmap/mprotect/munmap.
> 
> Update the errata list to the include the S3 variation, detect the IOMMUs
> that have it, and then have SVA invalidations use a simplified version of
> the over invalidation algorithm from the tlbi rework series. This ensures
> that a single range invalidation is issued for a single MMU notifier
> callback and now the range invalidation is guarenteed to cover any posible
> CONT.
> 
> Future work to add CONT to iommu_domain page tables should either use this
> one-invalidate/one-range invalidation algorithm or disable CONT support in
> the iommu_domain.
> 
> Cc: stable@vger.kernel.org
> Cc: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
> Fixes: 3f1ce8e85ee0 ("iommu/arm-smmu-v3: Share process page tables")
> Reviewed-by: Mostafa Saleh <smostafa@google.com>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  Documentation/arch/arm64/silicon-errata.rst   |  3 +-
>  .../iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c   |  7 ++
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 91 +++++++++++++++----
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  5 +
>  4 files changed, 88 insertions(+), 18 deletions(-)
> 

Reviewed-by: Pranjal Shrivastava <peaan@google.com>

Thanks,
Praan

