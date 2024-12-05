Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5C98E7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 15:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=slhXHLrcA4lnMI4mcoJ78dsh1V1y/MQiAPdO/CifUdE=; b=WMMrVXgKR4y/rkJ+lBdS3OTKEf
	BQOFPD4/sZCh4bSWYEk95qcZSpUJIJtem8IJghCLNvyqfTy1O/v2UjWPVLCtbYHDAcFRjlAkbu6zU
	K0siDllJSomypHlXsRjkMbkE9CWbuLtxogKdSZihVWN0E30YIQ240pgRtO4lQAmS3TXwyQrAVfkby
	5lsUsHpexfgKAeqnXA0iu6/WV2TWqvvG1glcJi3xDgqRsPvpdYRU5AAsUYPGRWL9H75n/Lf+NQER5
	wF1h9OiqTGuNp1p4KP4OPgr9aTXaob3SwtvDYXd4rZIOnHz7zI/T4Nh3ReturYf0UHHKo7b2Qrqy2
	MRgX+RvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJDSv-0000000GSpc-165c;
	Thu, 05 Dec 2024 15:08:29 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJDO3-0000000GRjY-0zfL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 15:03:28 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-434a195814fso8678875e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 07:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733411005; x=1734015805; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=slhXHLrcA4lnMI4mcoJ78dsh1V1y/MQiAPdO/CifUdE=;
        b=nKD542odnw3o3r5+GTwBwtJxb99tdGmzjCU/AmBDAskq0NDIT9JFkSZNtf3NYLJGXD
         CljvD8RY5CdDEoaX4pcFH+leHWEuVLcdqe+i7ZJj8aCFQTtbkq2sAA+4G4woTT2YrTAG
         eSnRXCPIqezbnc3Txt57ygl6GxMtztM3HnvOIR+CPlGuc5Hrrl3D7JDE+SRYg89NIme6
         o/AYh9M31f0o1+v9vbLL2+CkOCgHI6GSmI/e6OC32e6t6W607sVheX94OMoYol7wG8xT
         TBWa8bUpPUHvWETa1oRyWs8+i+HBwEUa1jCFVN3Ec6vi9eb0hMsa3wh8WfmE9BVAGb6w
         /N/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733411005; x=1734015805;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=slhXHLrcA4lnMI4mcoJ78dsh1V1y/MQiAPdO/CifUdE=;
        b=ny2Om4mYXcgbMTzmT9bfbDSJ7rx80nh/wULCaiTY3We8L14iApAT7ANvNrCYQAuGTB
         CwyzyN0STfizAHvN0c4LUoNtH+0WuX+/ac3E3JWkKslN5FCnASAw5IiM73SCeOL29Ez8
         CUPzsu6vGrVb1KpGSH9EMIVsXgsijSgOqWKnHWvsND9mXiCOvzpieovLDFALXEfFv655
         27Lg+nW18wqJeH9pPuMPgWggh9MHUYvmtxTLO+23JN8tpfIbjYsYevePZm7E1OAaUcfr
         ZsYzM/pmptRxMqMvbbThVAeWtic4f4eulKyXAok6+aR8aBCEZ6nmKsUL452LE5+8sb/x
         vYXA==
X-Gm-Message-State: AOJu0YzdllKDW2MheyV7S4dffyiuSUrUZmTbunUYz1Ey8IYQtRxq065J
	aPIlSG24pNyiFlCmVUAJb5DG5QnFK6ysxCthvmhIxLdn16c3EeLIXr3VzCW9PXgMu3EFjZM2iag
	qgwVfHsQAnEJQxX61zJ+z2KlkhIuGDpLv0K2AgMGQBYW3hyVflmowLMRnb9kWb+4e8cIHxuqPnY
	6hywIhagxrW9nwZjUj2Kq2xCtfhK7BKPm6Br7yXHHw
X-Google-Smtp-Source: AGHT+IErGDMyoNEYHKdtQJ6HM76Rh0wVhjISU3TsZyJvd34+AxRKANhdtUS2dFF3NpSngDONw8BYuky4
X-Received: from wmap8.prod.google.com ([2002:a7b:cc88:0:b0:434:a98d:6a1c])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:138a:b0:431:52da:9d67
 with SMTP id 5b1f17b1804b1-434d09b1831mr105644975e9.3.1733411005512; Thu, 05
 Dec 2024 07:03:25 -0800 (PST)
Date: Thu,  5 Dec 2024 16:02:34 +0100
In-Reply-To: <20241205150229.3510177-8-ardb+git@google.com>
Mime-Version: 1.0
References: <20241205150229.3510177-8-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=4048; i=ardb@kernel.org;
 h=from:subject; bh=VbEZrG51fuTH0v9uDoNKILnxrXNsrpIhK9DKU+UIPRo=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIT3wQE+L6sedXZ5yJg+VTgT9CFzu0uz17I6W0Jk+Jc6Oc
 8ZhR7M7SlkYxDgYZMUUWQRm/3238/REqVrnWbIwc1iZQIYwcHEKwEQW8zL84dq2VW6meKX7c+ao
 P7npe27eN/73/uBeCT2mUPWAeUcf8zD8Mz73zqPWPsxO9D2LcpuNSq7+lCXyvFcXHt99L+Yt975 NzAA=
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241205150229.3510177-12-ardb+git@google.com>
Subject: [PATCH v2 4/6] arm64/kvm: Avoid invalid physical addresses to signal
 owner updates
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Kees Cook <keescook@chromium.org>, 
	Quentin Perret <qperret@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_070327_275249_285E2843 
X-CRM114-Status: GOOD (  19.46  )
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

From: Ard Biesheuvel <ardb@kernel.org>

The pKVM stage2 mapping code relies on an invalid physical address to
signal to the internal API that only the owner_id fields of descriptors
should be updated, and these are stored in the high bits of invalid
descriptors covering memory that has been donated to protected guests,
and is therefore unmapped from the host stage-2 page tables.

Given that these invalid PAs are never stored into the descriptors, it
is better to rely on an explicit flag, to clarify the API and to avoid
confusion regarding whether or not the output address of a descriptor
can ever be invalid to begin with (which is not the case with LPA2).

That removes a dependency on the logic that reasons about the maximum PA
range, which differs on LPA2 capable CPUs based on whether LPA2 is
enabled or not, and will be further clarified in subsequent patches.

Cc: Quentin Perret <qperret@google.com>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/kvm/hyp/pgtable.c | 33 ++++++--------------
 1 file changed, 10 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 40bd55966540..0569e1d97c38 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -35,14 +35,6 @@ static bool kvm_pgtable_walk_skip_cmo(const struct kvm_pgtable_visit_ctx *ctx)
 	return unlikely(ctx->flags & KVM_PGTABLE_WALK_SKIP_CMO);
 }
 
-static bool kvm_phys_is_valid(u64 phys)
-{
-	u64 parange_max = kvm_get_parange_max();
-	u8 shift = id_aa64mmfr0_parange_to_phys_shift(parange_max);
-
-	return phys < BIT(shift);
-}
-
 static bool kvm_block_mapping_supported(const struct kvm_pgtable_visit_ctx *ctx, u64 phys)
 {
 	u64 granule = kvm_granule_size(ctx->level);
@@ -53,7 +45,7 @@ static bool kvm_block_mapping_supported(const struct kvm_pgtable_visit_ctx *ctx,
 	if (granule > (ctx->end - ctx->addr))
 		return false;
 
-	if (kvm_phys_is_valid(phys) && !IS_ALIGNED(phys, granule))
+	if (!IS_ALIGNED(phys, granule))
 		return false;
 
 	return IS_ALIGNED(ctx->addr, granule);
@@ -587,6 +579,9 @@ struct stage2_map_data {
 
 	/* Force mappings to page granularity */
 	bool				force_pte;
+
+	/* Walk should update owner_id only */
+	bool				owner_update;
 };
 
 u64 kvm_get_vtcr(u64 mmfr0, u64 mmfr1, u32 phys_shift)
@@ -885,18 +880,7 @@ static u64 stage2_map_walker_phys_addr(const struct kvm_pgtable_visit_ctx *ctx,
 {
 	u64 phys = data->phys;
 
-	/*
-	 * Stage-2 walks to update ownership data are communicated to the map
-	 * walker using an invalid PA. Avoid offsetting an already invalid PA,
-	 * which could overflow and make the address valid again.
-	 */
-	if (!kvm_phys_is_valid(phys))
-		return phys;
-
-	/*
-	 * Otherwise, work out the correct PA based on how far the walk has
-	 * gotten.
-	 */
+	/* Work out the correct PA based on how far the walk has gotten */
 	return phys + (ctx->addr - ctx->start);
 }
 
@@ -908,6 +892,9 @@ static bool stage2_leaf_mapping_allowed(const struct kvm_pgtable_visit_ctx *ctx,
 	if (data->force_pte && ctx->level < KVM_PGTABLE_LAST_LEVEL)
 		return false;
 
+	if (data->owner_update && ctx->level == KVM_PGTABLE_LAST_LEVEL)
+		return true;
+
 	return kvm_block_mapping_supported(ctx, phys);
 }
 
@@ -923,7 +910,7 @@ static int stage2_map_walker_try_leaf(const struct kvm_pgtable_visit_ctx *ctx,
 	if (!stage2_leaf_mapping_allowed(ctx, data))
 		return -E2BIG;
 
-	if (kvm_phys_is_valid(phys))
+	if (!data->owner_update)
 		new = kvm_init_valid_leaf_pte(phys, data->attr, ctx->level);
 	else
 		new = kvm_init_invalid_leaf_owner(data->owner_id);
@@ -1085,11 +1072,11 @@ int kvm_pgtable_stage2_set_owner(struct kvm_pgtable *pgt, u64 addr, u64 size,
 {
 	int ret;
 	struct stage2_map_data map_data = {
-		.phys		= KVM_PHYS_INVALID,
 		.mmu		= pgt->mmu,
 		.memcache	= mc,
 		.owner_id	= owner_id,
 		.force_pte	= true,
+		.owner_update	= true,
 	};
 	struct kvm_pgtable_walker walker = {
 		.cb		= stage2_map_walker,
-- 
2.47.0.338.g60cca15819-goog


