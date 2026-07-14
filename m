Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB3DCC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 13:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZffwBF6hhGkwheo3CTBU68dVv5rF3zKRAqSeKFNznAQ=; b=ET1YBZD8N+kiSXNPaUNZWVYApY
	CsxaJH/eVisT4XipMZHCI9WdroxeTpPEU7+niLkmJnB1BWEUODIUWG/KQFGF5Rn790BzT4+hieVmZ
	p+VWCeDxbI6WF+FEBA1SFcyM4Zz7dPeJwrxzX6yOmjD4W1k2w3TV+uIixWfbfUk2kskMKEXbGznW7
	JKJlATGij+p9ZX1dmcidxn9EwjZuf557Oq/YXTeq4sRU+el318c9Hy77JwcxvAELI7iUv57wJ+Qfs
	ABjkDeDuI5VNNYYDp/jsM4Go3h0GxZPkBxY6FlMz5GRo5vz6unxSDO5E/6aC4JVbXiD4YAl7LTmDu
	S+rsO8GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjdGP-0000000CBhe-2pmt;
	Tue, 14 Jul 2026 13:33:33 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjdGM-0000000CBgc-1t9m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 13:33:31 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-51c01c79467so295451cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 06:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784036009; x=1784640809; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZffwBF6hhGkwheo3CTBU68dVv5rF3zKRAqSeKFNznAQ=;
        b=iZ1ZrCqh/0oI4OBqzH+TdSO5hMVhhiNma7OYtg8GMib6CKM1QQmcydvEG9/ygN3431
         YyEU1xiiAPyabKUWGf+7KsEA8yUvZ7ixjJNXE0HfmMlx5bzP/He96Sn5MUrve55HLU6G
         q170HReisHSlJggOpEPsVQr+iqw6/Nxcrcxp9GQeVoZ4bplPFkJwRPBVcg0UaKifU2bo
         Em6W6m3MX4nRaBnt+2j8SGYZ1OXepbt7r0C4o1cGtFimuO/0nAtZ1UEgqWirxykQ6Jfd
         s8sbk7GJpLB4ab/soDGbFFErK1eKTruPn/dMh/sKR1+kI5KQmeMnH4nhhQcGKhrCAn3Y
         Z6sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784036009; x=1784640809;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZffwBF6hhGkwheo3CTBU68dVv5rF3zKRAqSeKFNznAQ=;
        b=kv2Ck5nk1lVKRAnUEmg1kS+RfQwp7D1zVr9hiOgGw6Fudlnx2O3uG6biY+b9Xxgea+
         d0wjjV4qILzGoNHseBHqLaAxlmMhJh/0MixFjLNvhdO9svRmyNX00Pp8XG+25+iwRLp8
         rgPjPKHYa+HDw7HmAsJy+xy2BEJbLja3iNioFOBdwWvYlShD/LYdCSOFPVr/Wi0pNG2D
         /9twEXVSYYp8d6Ojrq7xzSFTzqUMm5yxYj1mi9BwI9nPYyA7o5vcoRk1UgLpBzwe5QfM
         Twj+YFUZw7ngrc3jY6Vk2morANR2ynvz0lUJFaeZ/3dnpntcOrRv5OoDsLc7BR3F8tTe
         hLDQ==
X-Forwarded-Encrypted: i=1; AHgh+RpxRVkilOgdXb3UUp8LHTaQpxnRFKJj3wikZ05DqDUFD4CEoa3Dxd6vKbQkad9fe5I4ZhR52Np6NC7mbGJqS9Ei@lists.infradead.org
X-Gm-Message-State: AOJu0YztcmNj1Use0sJAZEHaPRy1RciNmIpRo6elAFp6P5CTTnVVC4uE
	FX3ZdbP1NQieARrF+nZXUq8Z1kGKmkbQDDxXU8zCTWmGCbQuxkci+K9cauLGLclKlg==
X-Gm-Gg: AfdE7cl34auQG8day02sxA8mSdr6MeZL6H5IMNgcthKNkwg+ejv9LsAoCCUiSHKsSzu
	0rhjYwIsj0TVzyktUDHXrJbgBdfcOvw5farr1QmVESP5u8Tv1U81ka/6lANmPo1RkD2fi9Hx0Yj
	z6vhdOvpVecjs4/hoECQUEg4qxkNKBSbv3XJ6MHUMf0DuSIKt7Gmc3GmsHlGYWPoT2ggtcc6cE/
	SulidgFKQK+/E2ArtXUJWtpWfgGMOFZ2lyWRaaArb69WP3/P4QZ9xTruPXcmA+8lzjnbkrSC2Xs
	6+NqdduTW/Z7qyBgYUu/rx8kLt+954L8njelQhKhkwELA0Lxcu4H2BqowpthuPWPv0FggY6QMWJ
	fDCWrp5XF5wTLK4JyEvYXUghoBPf8SIeT7Vm4aShBndKbG5nPe52ICDc7dFiCDd+DvLFT3Zhqo/
	SsdaPhM0RaA8ISc3+VcyqHcoDKw6j2nbLRnL1Sxls3jes0K2M=
X-Received: by 2002:a05:622a:4d:b0:51c:ba4f:9d19 with SMTP id d75a77b69052e-51d7bd752e0mr14354651cf.19.1784036008463;
        Tue, 14 Jul 2026 06:33:28 -0700 (PDT)
Received: from google.com (10.129.124.34.bc.googleusercontent.com. [34.124.129.10])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-973a671434bsm3864983241.3.2026.07.14.06.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 06:33:27 -0700 (PDT)
Date: Tue, 14 Jul 2026 13:33:21 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Robin Murphy <robin.murphy@arm.com>, joro@8bytes.org,
	David Woodhouse <dwmw2@infradead.org>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/5] iommu/arm-smmu-v3-iommufd: Convert cache
 invalidation to the core array loop
Message-ID: <alY6oVdehDZeeriF@google.com>
References: <cover.1783539724.git.nicolinc@nvidia.com>
 <e21c0adeb86fcb82238b1f9d29f7ba7ae423ea47.1783539724.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e21c0adeb86fcb82238b1f9d29f7ba7ae423ea47.1783539724.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_063330_531832_D3A5D68A 
X-CRM114-Status: GOOD (  20.03  )
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

On Wed, Jul 08, 2026 at 12:44:19PM -0700, Nicolin Chen wrote:
> arm_vsmmu_cache_invalidate() allocated a buffer for the entire user request
> array, walked the array converting each of the commands, and issued those
> converted commands to the cmdq in CMDQ_BATCH_ENTRIES sized chunks, carrying
> the sub-array bookkeeping all on its own.
> 
> The iommufd core now iterates the invalidation array and re-invokes the op
> with the not-yet-handled sub-array, so the driver only has to proceed with
> a single chunk per call.
> 
> Instead of a per-array allocation, use a fixed on-stack batch to copy from
> the userspace array. If the copy fails due to nonzero padding (VMM violates
> the ABI), fail the entire batch.
> 
> Convert the whole batch before issuing any of it: a malformed command is a
> userspace bug, so the first illegal command fails the batch as a unit,
> issuing nothing and leaving array->entry_num at zero, the same way the copy
> above bails on nonzero padding. A batch that converts cleanly is issued in
> full, so the op returns either a handled count with no error or zero with
> an error.
> 
> A zero-length array now returns success once the data type gets validated,
> matching the documented probe behavior, rather than the -EINVAL that the
> full-array copy helper would previously return.
> 
> This also fixes two long-standing bugs:
>  1) On a conversion failure the old code reported commands that it had
>     converted but not yet issued, so user space advanced its consumer
>     index past invalidations that never reached the cmdq.
>  2) A zero-length array was rejected with -EINVAL, although the uAPI
>     documents it as a valid request that only probes the data type.
> 
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

