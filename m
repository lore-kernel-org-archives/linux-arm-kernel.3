Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD8A6C43327
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 16:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bio6F01mW1uhzjb2Qp+Xy8h4WP35qzyJOdcn1fRlVDM=; b=Atg4XFqfVnLfnjBhaluNN72WxZ
	R+QNY7Tsymlxrl79Gnq7R6by83hYfGCKmiJPemO0C+oy1T70U/0eakNTWu5/fH1dKIBTuvKoUN+Nu
	BJg1Sb5Ot8hi7lDM4EqmyJKEtA2VowKc/GsANEITFtlLzHpRJ3CfiHMoUTYq6S6wLrj6czCPlPFVJ
	NmAobuv5RV5Svn0IilXr6vlboGRvL1jONB4jik3iKlrF+o0XzlqAOptpfAQutcvj3z+HU2QwRr8RC
	kMVTNP+cXK4ghJNlqo5QJGcAJBdLf8bkCyvEx8ON7mIJH388hTdMSiJGDXjy5PVqsD5UiJUjhaaPE
	Mbzh3RNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weEqU-0000000FDJA-1YSl;
	Mon, 29 Jun 2026 16:28:30 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weEqS-0000000FDIo-1Y31
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 16:28:29 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2c81db32393so104515ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 09:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782750508; x=1783355308; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bio6F01mW1uhzjb2Qp+Xy8h4WP35qzyJOdcn1fRlVDM=;
        b=ubnuVPusc6u7qOCEJCH9Le/6YV38gYFpXerLKfyI44KFfoBkHPKK8VfxQhwHeUafzD
         5ixKVjZ28N/svNqXldc1w+JXMVn0Cz4ZHKziqHk9o438Ydko+NOAjS0Rt+C4VM0ozrRu
         nDi7SswrrG1GBlqyveLXXSrlXh5GhoUgJtyImQaCRPXfzEIsZQwtsX+3/ofyky0DIQkE
         nRw2FtssKGY5qPrWpPRE5f3N9UcB2fLMm2VKzKflJFspv2B8s5C2pN0WTkN0skKdYbEQ
         SlPYK3G9ZnQx8mF1EpLF9NtYtsSeSe/dyvC7fwlyMIPVvVyh/Jy7eHSUOoJGSchN0ttQ
         z/Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782750508; x=1783355308;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bio6F01mW1uhzjb2Qp+Xy8h4WP35qzyJOdcn1fRlVDM=;
        b=QuPgndJv43nwu2nxOKH5TKqZq/AUs4sCv49uoV/RWBJn+CpRiK2Po34ayY9MUq6aFr
         ghmxIjRef4YoZUKAcDO+9brfxKh8xQ/bT8aO6UqDriBEvatXLQtNxtQc3LjmiTy26HA5
         /W4Lx284xN035N0mCl4iZKv35VjwVg+5jQM+4LzapvEsFluLTzId1K+3ZMPMNLDsR6fv
         /9foaqlfjBcW9JcE455+TUewLQTYds5jK73FAXMTsqXp/x1rbPqIH7Ia7SSrC/5/AE2T
         6zhLklwSSagRoN6gtccxnqlPegk3FX12EvkK/ppbUlLEvD7Eds5ZTfwm7SUPWSkeKidU
         ZKGA==
X-Forwarded-Encrypted: i=1; AHgh+Rqkxy8D7kbvmLUT8J+1gMfp6QnzYN695puYC8ABHl9FyG0kEX7sEjr1CJyvDhBxo6utMqsb2VRjHNeLCtI3zkZJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0bmZM9jgJLoTVldD7GSRgBcN7BSaix3Wt07zO0wo5STh3T0yq
	KQahVlYhy+e1zio/S+X/MR9aH+ZfB1WWMuf9U5GH3SPH/6470+nh6KGTewrO/mLlxg==
X-Gm-Gg: AfdE7cmnKvQESSAliSW67Jqboo1R2jVEeOhXNkt1g5W9PfOLPy3yuEzsXBM3JfkCKh4
	wbe/yLkYHTFG2fxpf5Csf1cWpKm1Aqa3YmH0CtEJSsAS+VAudPsnTUsFklXlMzQAyG6tjbhg/DF
	udgdLBHuZ6+CLlim5xrjCQ+fdPOpY4qcAGr3ZbQWCqdHB4BOMcBpe+bgUU+OI+nF72ipDsna2nj
	UckwR9co1elSSJizFYefs0h0jYBCdGHn8L6/nZEvzRPh0LMxQHDoSuY4/JN2hei/kP3r5dAK0Qe
	v3HUXE2U2y72W68qHBUbvfLRKOnaOFItOKhxFFzLLgUrHxjGqR8seGH11u5ea3Jaxg1bRhooWlF
	nQc49DcNWHRfGYwDyzD4gtNVlLvoJAyz6tNxbE6jJuCRGM7xzH5+28bpY2Cwrr1Mi/vmz3N1U0T
	sGfKUrDajTCYrbj+Wxpw8/99/+6pHH59zO/l+3AHvpTB9mtB4=
X-Received: by 2002:a17:902:fdaf:b0:2c7:debf:2146 with SMTP id d9443c01a7336-2ca2cf9c2c1mr251595ad.9.1782750507162;
        Mon, 29 Jun 2026 09:28:27 -0700 (PDT)
Received: from google.com (10.129.124.34.bc.googleusercontent.com. [34.124.129.10])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38052f4789dsm10213a91.14.2026.06.29.09.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 09:28:26 -0700 (PDT)
Date: Mon, 29 Jun 2026 16:28:20 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, jgg@nvidia.com, joro@8bytes.org,
	kees@kernel.org, baolu.lu@linux.intel.com, kevin.tian@intel.com,
	miko.lenczewski@arm.com, smostafa@google.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	jamien@nvidia.com
Subject: Re: [PATCH rc v6 6/7] iommu/arm-smmu-v3: Skip RMR bypass for kdump
 adoption
Message-ID: <akKdJFx7zhWtpjBT@google.com>
References: <cover.1779265413.git.nicolinc@nvidia.com>
 <88e75018e94adc2eb3db8c1fd97c3cc738c170bb.1779265413.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88e75018e94adc2eb3db8c1fd97c3cc738c170bb.1779265413.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_092828_408253_B7B9E5D2 
X-CRM114-Status: GOOD (  15.77  )
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

On Wed, May 20, 2026 at 10:03:23AM -0700, Nicolin Chen wrote:
> RMR bypass STEs are installed during SMMUv3 probe for StreamIDs listed by
> IORT RMR nodes. A normal boot switches the driver to a fresh stream table
> whose initial STEs abort, so those RMR SIDs need bypass entries before it
> becomes live. This preserves firmware/guest-owned traffic, including vSMMU
> guest MSI cases built around RMR-described SIDs.
> 
> ARM_SMMU_OPT_KDUMP_ADOPT is the opposite case: the driver keeps SMMUEN set
> and adopts the crashed kernel's stream table, so RMR SIDs already have the
> only translation state known to be safe for active in-flight DMA. Replacing
> an adopted STE with bypass can turn translated DMA into physical DMA, then
> point it at the wrong memory.
> 
> arm_smmu_make_bypass_ste() also rewrites the STE in place after clearing it
> first. While the table is live, a concurrent hardware STE fetch can observe
> V=0 or mixed old/new state.
> 
> Leaving the adopted STE unmodified keeps the kdump kernel using the crashed
> kernel's translation. That gives the endpoint driver a chance to probe and
> quiesce the device.
> 
> If the old STE was already abort or invalid, installing bypass would create
> new DMA permission; leaving it alone is a safer failure mode. Later domain
> setup still gets the RMR direct mappings through the reserved-region path.
> 
> Fixes: b63b3439b856 ("iommu/arm-smmu-v3: Abort all transactions if SMMU is enabled in kdump kernel")
> Cc: stable@vger.kernel.org # v6.12+
> Assisted-by: Codex:gpt-5.5
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
 
Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

