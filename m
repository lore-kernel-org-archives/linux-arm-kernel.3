Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F404CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 16:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FlRHqIhFldT/P3WJ4jK0htPSdl8EjLN6zWd/GbTbNRM=; b=Ml2cEv8udA9LPJ53m4Vl7J/iRg
	yOi8k61Di+913qy08l4gkpwlOpwxOE5m6ccLC2X6RM2BkoNn/RBoO2mj9y3krAPKgnw02mw0NW6Tt
	AtwtZO5s2Azf9n6gzjpcAuCiqDTM26A/Jbn5FJ2bOqKkkS4SHGFfZpbc7e5RlgTH8AEK5RxvdF3fx
	z3cs4vcrwhGF4w4oHuLma4weLGGQEKGc8qinZND+5uJLp0HbxrAa0K1zPN86AH/+HkSfBY9qnTB19
	Gz4ErDcyV6JY8AXrL11qtU59YLWM3N3JclTShD3JDDVmw96i4cXPnCT0CmvbEY1o3ZjPSB53olmOC
	g0Q0J2xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUS1l-0000000DSCu-16iC;
	Tue, 02 Jun 2026 16:31:41 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUS1i-0000000DSC8-0LYE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 16:31:39 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4891b4934ffso65e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 09:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780417895; x=1781022695; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FlRHqIhFldT/P3WJ4jK0htPSdl8EjLN6zWd/GbTbNRM=;
        b=aXtIcAjGQNEj3flClYQUqZ5uQnh7QcrFnTUvgdxjtQm4yxbHaTBC3m5Q6xPjYBVI4/
         A3fqXKg7GCpiwVONYe1rigsAnv1cfBxDB+WpnqrvRLqDfkV/vdvWH2NzDWFJUTXaDeQY
         nAiWrZGYn4PJVkZKNaN/bVyfwAEpGbn3ADoXs5Nxx//BPHeFWYlNVA/1NxzbdS4fSp/D
         FEZW4N+WTVhniHVM0DvlPkD+UcZwqoviOlwOMpP1acneoV5w+mZm+9dz1TyuWoz4Ipzv
         XU1r1oIktgW5FvFS5p7PCIoU7SSnE3M/cnk5QFoESkB6/5lkUhgquh9VQVrkW/2N6eqH
         qrxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780417895; x=1781022695;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FlRHqIhFldT/P3WJ4jK0htPSdl8EjLN6zWd/GbTbNRM=;
        b=TtHPqHVEsO10krKgr3mohbu8VC9yxeCpLYCMYmpy55pIvvSmRRHyXQoqeCQTcuGi96
         eZ28LfBnvJr8gk+DJ7aR0EwF7+/dsDMjaTsE6+h6jcyGKXKW84ynBS0VHyXOcmupKP8F
         IDrNt7OxaytMI1YdfTVct7wVUfjPwQ1ajDnw7BkGaf5JLqlxpUZyjj8RjLdXTa18HZ0o
         i28q+q5vPreJSj5rvoB37IQQfUn/X9bG0QXDjdyhBJPWOrJgkhpIqaLtAAaTyMx0RAfn
         gwC9rJKyv66UMB/FAo0bC17/snk8W0gAPXOL6lr9+u5uUJkK66GDE5ekpAJhkYbHrJG7
         rYhw==
X-Forwarded-Encrypted: i=1; AFNElJ+ynRtEazUIrEsjd3SzxuxigcUioXbMDhl995ss0nmvJtX1dWAI0qbX7kqhgJ/te0jFeoz+EudbLJQBsLiBq6Vj@lists.infradead.org
X-Gm-Message-State: AOJu0YwQLBQJo94blGtnBSBCJrW610y7c6xgmcQmaT7XQPDr0oOqqv0y
	gL6gJ5dGBtPDqb/duKfQTOx1PiHn91NPd8QTTblvTfIVwN3tXdFihOsgmct0+6PZ7ywAHp/Q2Vo
	Vn/sCqA==
X-Gm-Gg: Acq92OGVYuhKm5qvAjjF2Kt/mAQj4rUlmWUQogmHwMhpI8x6rMWCJntwWgto0vvuNUv
	CfYcYmoTFSrxnAyeAhlZpV4djwBnJCWjNXin+tuSowNA3cKoBibAKMmLD1OphpRE7yg4ByFHw3r
	fsj6//9jBOL6HiD+skzh6cnNKGxs4Oxn2kgJNrmEqVCEAEMTnZ8khR3Wf4evdqYU2Tecr82mYyt
	VOKJjxx7MBd5YrN9MR9+Aen3P38c3EPr8hp822G8+/jXGvhUTmIOxNEIepnihElMX0b4ZwMXZh2
	HGyvwR4dA30Uc9xNZzJH14LzGwlRpGWYrUQVoV8sYzOQc/OyQppLOtS8qKwGfGsF3cQkscL09XL
	fsol7X04KZ1fmfMhrfUc1L6q+w+pc7HK5cxOdBIxSUhwDwebpJww9LpJBps06um+OJsOU2iclJJ
	lNBlcJueBj6ayZSATVUWNWQt/nh2/Y0tBc8GTmfSHZv+w/rl6sr5v+XDb13nqQrtfea/vzLOHk
X-Received: by 2002:a05:600c:5716:b0:490:b0f1:3422 with SMTP id 5b1f17b1804b1-490b11655c0mr1634475e9.10.1780417894903;
        Tue, 02 Jun 2026 09:31:34 -0700 (PDT)
Received: from google.com (203.80.140.34.bc.googleusercontent.com. [34.140.80.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b29f49b8sm50555595e9.15.2026.06.02.09.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 09:31:34 -0700 (PDT)
Date: Tue, 2 Jun 2026 16:31:29 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Ashish Mhetre <amhetre@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca,
	nicolinc@nvidia.com, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 0/3] iommu/arm-smmu-v3: Tegra264 invalidation
 workaround
Message-ID: <ah8FYa0hdkkAFQVp@google.com>
References: <20260601104845.995005-1-amhetre@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601104845.995005-1-amhetre@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_093138_181843_6E99B27A 
X-CRM114-Status: GOOD (  24.15  )
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

On Mon, Jun 01, 2026 at 10:48:42AM +0000, Ashish Mhetre wrote:
> Nvidia Tegra264 SMMUs are affected by an erratum where a TLB entry can
> survive an invalidation that races with concurrent traffic targeting
> the same entry. The hardware-recommended software workaround is to
> issue every CFGI/TLBI command (each followed by CMD_SYNC) twice. The
> second issue must execute only after the first issue's CMD_SYNC has
> completed, giving the sequence:

This seems quite intrusive, will the TLB entry survive if you push a
full invalidation instead?

Thanks,
Mostafa

> 
>     TLBI/CFGI ... CMD_SYNC TLBI/CFGI ... CMD_SYNC
> 
> ATC_INV is not affected and must not be doubled.
> 
> This series implements the workaround by hooking the duplication into
> arm_smmu_cmdq_issue_cmdlist(), the single chokepoint that every
> synchronous CMDQ submission flows through.
> 
> Patch 1 is a preparatory refactor that factors the existing batch
> force-sync conditions out of arm_smmu_cmdq_batch_add_cmd_p() into a
> new arm_smmu_cmdq_batch_force_sync() helper. No functional change.
> 
> Patch 2 detects affected instances using the existing
> "nvidia,tegra264-smmu" compatible string, exposes the condition via a
> new ARM_SMMU_OPT_TLBI_TWICE option bit, and adds a static-inline
> arm_smmu_cmd_needs_tlbi_twice() classifier in arm-smmu-v3.h so that
> both the in-tree CMDQ path and the iommufd VSMMU path can share a
> single predicate.
> 
> Patch 3 wires the workaround in. arm_smmu_cmdq_issue_cmdlist() becomes
> a thin wrapper that re-issues a synced cmdlist a second time when the
> first command needs doubling. The Tegra264 condition is added to
> arm_smmu_cmdq_batch_force_sync() so a full batch carrying CFGI/TLBI
> commands flushes with sync=true and is then doubled. The iommufd
> VSMMU path (arm_vsmmu_cache_invalidate()) is also taught to split the
> user-supplied batch at every "needs doubling" / "doesn't need
> doubling" transition via a new arm_vsmmu_can_batch_cmd() predicate,
> since that path can otherwise mix CFGI/TLBI with ATC_INV in a single
> submission.
> 

> The series is based on Jason Gunthorpe's "Remove SMMUv3
> struct arm_smmu_cmdq_ent" series [1], specifically commit 13428b0bf794
> ("iommu/arm-smmu-v3: Directly encode TLBI commands") which is the
> final patch of that series in linux-next.
> 
> [1] https://lore.kernel.org/all/177919957385.1012282.14787407041669291032.b4-ty@kernel.org/
> 
> Changes since v2:
> - Add new prep patch 1/3 that factors the existing force-sync
>   conditions into arm_smmu_cmdq_batch_force_sync() (from Nicolin).
> - Move arm_smmu_cmd_needs_tlbi_twice() to arm-smmu-v3.h as static
>   inline taking (smmu, cmd*) and folding in the option check.
> - Plug the Tegra264 condition into arm_smmu_cmdq_batch_force_sync()
>   instead of carrying a separate need_sync in batch_add_cmd_p().
> - Fix iommufd batching: arm_vsmmu_cache_invalidate() can mix
>   CFGI/TLBI with ATC_INV in one batch. Split at the boundary via a
>   new arm_vsmmu_can_batch_cmd() predicate.
> - Patch 2 wording: "next patch wires" -> "a subsequent change will
>   wire".
> 
> v2: https://lore.kernel.org/all/20260529140830.629738-1-amhetre@nvidia.com/
> 
> 
> Nicolin Chen (1):
>   iommu/arm-smmu-v3: Factor out CMDQ batch force-sync conditions
> 
> Ashish Mhetre (2):
>   iommu/arm-smmu-v3: Detect Tegra264 erratum
>   iommu/arm-smmu-v3: Issue CFGI/TLBI twice on Tegra264
> 
>  .../arm/arm-smmu-v3/arm-smmu-v3-iommufd.c     | 23 ++++++-
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 66 +++++++++++++++----
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   | 40 +++++++++++
>  3 files changed, 117 insertions(+), 12 deletions(-)
> 
> 
> base-commit: 13428b0bf7947098daf9a1db14a74d33eb1b5079
> -- 
> 2.50.1
> 
> 

