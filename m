Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B92CA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 16:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M/MstH2yf2DRt7ZMfWOotv8NrOEYhdb7bl9lXouyXqQ=; b=BORl2W8Jx/K8TxrCmJThr/Y0Gy
	UPGtRv8mOBpLfEyJzhWkx1b8F8Br7/043BgQIVuHMlgt6VI9OUmDGfuwAljMgYtRGSU1jDQQuzKMU
	U8hpe8ION+7M1JElMAlTasrsuYkST5uyF6HlA6YC05q/OgdEAwOviPzQxDKeYgriC3yLDKhU8LskY
	+WkWi3DYGr1LAu9oLxF+lWdoF/y+i1AOM00zX31lmVGUvdF8VtnWG5UpWHsgrI9DANnPYN9q2theM
	h+FCWLJH2GKg72QACYinww6VfL+rbsKepPXW4tGVkWaaG2vybalz0Vp55707U27rQLbpUzQ1WWbUK
	BHCWg/YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBEMW-000000013HE-018Y;
	Mon, 28 Sep 2026 16:37:56 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBEMU-000000013Gf-2ZME
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 16:37:55 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2d3b445a84fso90605ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 09:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790613474; x=1791218274; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M/MstH2yf2DRt7ZMfWOotv8NrOEYhdb7bl9lXouyXqQ=;
        b=Ja36Op2wfPo5e1yEppAwmsc2igh31UjNHK7UWFLD8XxmJxc46UI9tYY843n5kzkKm3
         LPYAkoCwHH4cu7XeyVM6vp6urZuEONfdVP9yDkfApQ31dvNAL5oOQN0VTXVWCUN4Jfcj
         KZhBy6XYsIOJEl4BXYDYKkl3hBTztqCEpRy1jvRWn9vWDTTzdX8yRq2HE4v2kdZaYAiH
         RLixQ1giirpXMLg6kwInSKFUdneP6ZrsIzsZ8fOGH1LmI0y/KNEFxBHwFvUMpTLNqBLt
         LZC8RiCQTTwU7+dVlCtBqXFH1XADCJANPe02pEbFAud4Fa38+Typi3g9M2oWrfpQdlUt
         ViiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790613474; x=1791218274;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M/MstH2yf2DRt7ZMfWOotv8NrOEYhdb7bl9lXouyXqQ=;
        b=Q2nOWg3af230tHQqpfqRL51O1cDFZBv8k24oWHPUDHHKqLambrbiwqYuv+5Uzx8RtJ
         g/Hm7cPa+9HL0cEnjQqYaqYggOajMCSxP1FubAkscXRLuFqSFmPOtys6CChObUu40H6O
         h0D6DLjKc+ADUL1AiNqofglZJ8Des0Z7LmMKeyCvpNnNbOBGO6iYN9gGNIW9iNnzP+9e
         HRFMkcCDSMNsGrcDRcjAjGBbmp7JdTFrWlHM3B8wuMf+tCWh1VGaoo6lgy26MdnB7uJ3
         14UNkyt88vpgGKqII8sjALwVgVPurCMFgIXRFYZVs/YjWPdoTKYbgFzYyH6w7/24BOZi
         BS6A==
X-Forwarded-Encrypted: i=1; AKwUvBzm8Dgora8lQ6ZC1ue+4GkAD4711BRpU5nrwRixyo6JIoHirRUE6bMBeJeQ/1ybrTJA9Wm44PY/GwkviJIFDgRg@lists.infradead.org
X-Gm-Message-State: AFq9FYJdQL7Cid6jVEviZAnfJH29ClEjtRk6bezgMeG1HNtzvkVX2rnL
	mlwRhLlIOHP66iwfu1yVPBbWHp3v5JET37X5LYEhZPPWZH5MhtAZIkzhcfbRB3LNsQ==
X-Gm-Gg: AYBFou0h5rkHqZE9xfGvuZo2YbCXG38D5YS4OvVnRjm31VmpZet0JgRB++lhOrvSTde
	XjrWMxf3Y6mY7cWjHHqJfRIlF22cqZEsl2VGxuN6WJNBkFM/iWmPiaZWV7ov93/KACTlEGDPwyV
	fJcYjKDDNcCvYt7vzX8jaIq6byrmNAXUIbccAfZxAC9Kixx+3rpw4uZLVof+MlyMzGtLKaeUpas
	7BdOZh9bc73s616KnJvsJ218Mg0IQGqubENgIIR0NUOvoRnU+k1bo5LphNtGANBeZhdVsCXzRfF
	rAJHMdZrfErsXXlkRJ8CXfzhukEw0OThVVZnljNw9Pu6dGrymqtGGIIwcpf7E7fGoF9dRguMA2e
	Q9y82/lhyVjPtrLJ+eEq1ly7+QqND5kKO5AbASUHGD1KRFyfxQzMOvT48NMTUMFJIBCXgMZ3itw
	a/bWh9JIyMt9+Guafx7TApw6tJjuM8fOV2gS138hjh5FWIVutCQByAG79E29qAz2JZZgfeEj5+W
	YgSQVveC3eqsI4kAqUoTo4ycMJL304/0A+c
X-Received: by 2002:a17:902:e884:b0:2d6:3c22:994e with SMTP id d9443c01a7336-2dfa976fec0mr5954175ad.11.1790613472819;
        Mon, 28 Sep 2026 09:37:52 -0700 (PDT)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87fea78fedbsm4448464b3a.23.2026.09.28.09.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 09:37:52 -0700 (PDT)
Date: Mon, 28 Sep 2026 16:37:44 +0000
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
Subject: Re: [PATCH v7 4/9] iommu/arm-smmu-v3: Optimize range invalidation
 for latency
Message-ID: <arqX2OC71JneElBJ@google.com>
References: <0-v7-e84261bbe7cd+2ea80b-smmu_tlbi_jgg@nvidia.com>
 <4-v7-e84261bbe7cd+2ea80b-smmu_tlbi_jgg@nvidia.com>
 <arpohmaJTPEEI7mi@google.com>
 <20260928135007.GA1616761@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928135007.GA1616761@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_093754_657242_9D6C9072 
X-CRM114-Status: GOOD (  31.89  )
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

On Mon, Sep 28, 2026 at 10:50:07AM -0300, Jason Gunthorpe wrote:
> On Mon, Sep 28, 2026 at 01:15:50PM +0000, Pranjal Shrivastava wrote:
> > > -/* Used by non INV_TYPE_ATS* invalidations */
> > > -static void arm_smmu_inv_to_cmdq_batch(struct arm_smmu_inv *inv,
> > > +/*
> > > + * One TLBI command per IOTLB entry, assuming the entries are all at least
> > > + * iopte_granule sized. Returns false if too many commands would be needed which
> > > + * indicates too high a latency. The threshold is similar to MAX_DVM_OPS in
> > > + * arch/arm64/include/asm/tlbflush.h for the 4k PAGE_SIZE.
> > > + */
> > > +static bool arm_smmu_cmdq_batch_add_single(struct arm_smmu_device *smmu,
> > > +					   struct arm_smmu_cmdq_batch *cmds,
> > > +					   struct arm_smmu_cmd *cmd,
> > > +					   struct arm_smmu_tlbi *tlbi)
> > > +{
> > > +	unsigned long num_ops = tlbi->size / tlbi->iopte_size;
> > > +	unsigned long iova = tlbi->iova;
> > > +	unsigned long i;
> > > +
> > > +	if (!num_ops || num_ops > 512)
> > > +		return false;
> > > +
> > 
> > Should this be ">= 512"? The old arm_smmu_inv_size_too_big() and
> > arm64's __flush_tlb_range_limit_excess() both fall back to a full
> > invalidation at exactly 512:
> > 
> >         return pages >= (MAX_DVM_OPS * stride) >> PAGE_SHIFT;
> > 
> > 512 is what a walk flush could generate. For example, when 
> > __arm_lpae_unmap() frees a last-level table on a 4K granule,
> > it calls io_pgtable_tlb_flush_walk(iova, SZ_2M, SZ_4K), hence,
> > num_ops == 512.
> > 
> > Before this patch that was a single TLBI_NH_ASID/TLBI_S12_VMALL, now
> > it becomes 512 VA TLBIs + CMD_SYNC for every 2M table freed on a
> > non-RIL SMMU. The same check carries into arm_smmu_tlbi_calc_single()
> > later in the series.
> 
> I had set it deliberately like that so that a table flush would issue
> singles. That is largely based around the feedback from before that we
> shouldn't over invalidate.
> 
> We've been insensitive to that issue in the past, and I'm going to
> argue the >= of today's code is a bug as it effectively made alot of
> iopgtable actions turn into new full invalidations, while originally
> they were range bound singles.
> 
> So I view this choice as a return to the historical behavior before we
> started to fix the soft lockup issues. I guess it crept it during one
> of the refactorings where we merged the SVA limitation into the main
> flow.
> 

Makes sense, thanks. I checked and before the invs rework the only cap
was CMDQ_MAX_TLBI_OPS in the SVA notifier; the io-pgtable path issued
singles without any limit.


> Granted I didn't notice this detail that the current code was 511 not
> 512, I will add a remark to the commit message:
[...]
>     The current code switches at 511, but this turns every table removal
>     into a full invalidation. Change to 512 to try to minimize the amount
>     of full invalidation.

Nit: that holds for a 4K granule. With 16K/64K a table removal is still
a full invalidation (2048/8192 ops), and the limit there actually drops
from 2047/8191 to 512, so it may be worth incorporating in the remark too.

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

