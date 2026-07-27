Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6772BC531C9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 16:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DgrRLhpZSK6Izvy9wC/OSvwPYaLpWx3DeYUDgz9uc04=; b=lRLdwksr9GMg9/jxsVZclwpQtf
	duQIUQcsdMqq5KfEXfdN90S1J/pi2kqW3ydjbeqyBMtHnqrMi+FcONmkKQkBL82+gOVXFetupVDG2
	mFMxBiAee2tEmIvkltlhErVdrxn90431pFo0R5q03lN986zat9J9jTvfJVdYdE+Sn+o6KnLjxpJTG
	0fflNsCepYjJ6U8xjjau9hrhlRDLPZR5uCrvCVt4ogwYMW2dXuntYa33wABRXAHS528bigy+qrpAa
	WcPA1rioykxo3K1cTz+oiNbhtyodurOumlp/IVBt+rAee+SelGCALGBgl6mHr0K/OloNjHEVBnO8N
	05KyW9XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woO9j-00000003JXF-3jgc;
	Mon, 27 Jul 2026 16:26:19 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woO9g-00000003JW8-3BKe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 16:26:18 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-38deea72eebso3301739a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 09:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785169575; x=1785774375; darn=lists.infradead.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DgrRLhpZSK6Izvy9wC/OSvwPYaLpWx3DeYUDgz9uc04=;
        b=I0cJhBXXqHWMW5ght3VBrHDDAV72yWmI/mbxEvfQU0oilHVwjQDm9Kz5AtdVTQyNj6
         c7G6v8C4ubIxAaAJLpehqkJemgSc0C2ylbxn4aXzRLptUA1LwtLZJBh9FI+8AEExSaYh
         8zjaw4WNhzIvkhEGW03i9NEcfjmeG1vHmlFwEw8wBaL6R+DAOfDz0gpNeBuzYFv04AqK
         on7TUxcfTjJCOyWz4zvPEzKeU+UzkjgNcRPDbb+5txezOROUiHIjtvVNW8g8rjiGxNf5
         onl6Ma+Jp8M5Onhn8efsuEFLWwu7GOafHZD5lwPlllMejk/3FVus2LKMvPSi2QV9tCRc
         jb+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785169575; x=1785774375;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DgrRLhpZSK6Izvy9wC/OSvwPYaLpWx3DeYUDgz9uc04=;
        b=QT9QuFny6Xx43D75BGv1CT3u8bOr8H3GTCoA5IacVD7FEp8BU/Es6FjLoTf1itKeLb
         2bnYqpDnTkOn7mArFgsYG3p/4UHRI8rSrSKMkjQ8y6LPl6wjeUyUjhjl7fyoeG77LpML
         65Mck4iRSMzBNaRyYnlw5YfhFEEa7KRaRhhMQOMYe347fsW+Hch29MlzauhYm8aUTKGk
         npS6iqo99CsOwY1tYue8/B6zFW3y0OgWykAOz4yLPDzxpV7g69tTvRWrdvK0XV3/T/hg
         mk/KfDTU2/3LWn/3AO+T+DVLnEq2o5pmFiSGF7Dw8SXxuhmOguE1IO6qSVOIxZLU855n
         k07A==
X-Gm-Message-State: AOJu0YysvoZrsJZH4cENT4CUA3wlCuLRVnlkp5ghQK17Ijx/D5tb49h7
	ALk9hnk4yCmpmdyG0ce+BZQ7PcsVZO3hRVB3z4X621uF99Zy0ED3u+wh
X-Gm-Gg: AR+sD13QP3CYgqFRUhpeJbWLy9tkqFmyykUv9Lp5OppFZB+svrMQMGs4DRN0nS10U9B
	hCkM3PFQx27uPYZJE02iduZapRpJQ/kH54ynGqP4e0kedD4nr9qDiBTha58Q6arQRg+84s9t70X
	PC6kOxOvGgPl3lFzwa0J2R7Ff9PccZjhOMCtlBr2WbVvhPW+58GM5e882n6WPzkSbXGN4NWZI5Y
	S8TR/9bE9wLko4Xf97OlfLAPXwNz3Qcw07fzbK6SvEj5kUa5tSeStBI77tn/t/5HLrTeX0pkU6v
	eqlgcb1AZU2nSNEkMzXem1SHVoOx46tKC8I9GnivThSxvCKHQ1Mp5VrvS496i1dsB37IXNbliTG
	PcEIvvda54xZZfoirsEjC+KcbdqFDz5ykEaMXI40SLMx/bJQi9RefLbYRsQv6grp5lS722IPvFV
	EA6zNW6a1N+IlRPUjGUiMR5Q==
X-Received: by 2002:a17:90b:390c:b0:37f:eafd:3505 with SMTP id 98e67ed59e1d1-38f293cf360mr8125929a91.6.1785169575425;
        Mon, 27 Jul 2026 09:26:15 -0700 (PDT)
Received: from v4bel ([58.123.110.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f64117003sm81826a91.6.2026.07.27.09.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 09:26:14 -0700 (PDT)
Date: Tue, 28 Jul 2026 01:26:11 +0900
From: Hyunwoo Kim <imv4bel@gmail.com>
To: maz@kernel.org, oupton@kernel.org, tabba@google.com, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	imv4bel@gmail.com
Subject: [PATCH] KVM: arm64: nv: Don't skip VNCR invalidation when the TLB
 size is unknown
Message-ID: <ameGoxbn2wzBq2kL@v4bel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_092616_800320_76894A2E 
X-CRM114-Status: GOOD (  19.32  )
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

ttl_to_size() returns 0 when no size is defined for the (granule, level)
pair. That is the case for level 0 with 4kB pages, and for levels 0 and 1
with 16kB and 64kB pages. For a VNCR pseudo-TLB this happens when the
guest runs with SCTLR_EL2.M cleared, because __kvm_translate_va() returns
success with wr->level left at S1_MMU_DISABLED, and that s8 value becomes
level 1 as it goes through the u8 parameter of pgshift_level_to_ttl(). The
size is then 0 if the guest has TCR_EL2.TG0 set to 16kB or 64kB.

kvm_invalidate_vncr_ipa() and invalidate_vncr_va() feed that 0 straight
into the range computation. When the size is 0 the alignment mask is 0 as
well, both ends of the range collapse to 0, and the first comparison, the
one that decides there is no overlap, is always true. As a result the
pseudo-TLB is skipped whatever range the caller asks for, including the
full IPA range passed by kvm_nested_s2_wp() and kvm_nested_s2_unmap().

kvm_nested_s2_unmap() is called from kvm_unmap_gfn_range(). A guest that
meets the above conditions therefore keeps its VNCR fixmap mapping across
an MMU notifier that reclaims the page, and still holds a writable EL2
alias of that page once it has been freed and reallocated for something
else.

compute_tlb_inval_range() and compute_s1_tlbi_range() already treat a size
of 0 as "no size information" and fall back to a conservative value. Apply
the same principle here, folding the range computation into a helper that
reports an overlap when the size is unknown. This also removes the
computation that was duplicated between the two functions. The result of
the test is unchanged for a non-zero size.

Fixes: ebb2d8fd81b8 ("KVM: arm64: nv: Fix incorrect VNCR invalidation range calculation")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>
---
 arch/arm64/kvm/nested.c | 39 ++++++++++++++++++++-------------------
 1 file changed, 20 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index dfb96edbdc43c6..3ac8789b458f39 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -985,6 +985,21 @@ static void invalidate_vncr(struct vncr_tlb *vt)
 		clear_fixmap(vncr_fixmap(vt->cpu));
 }
 
+static bool vncr_tlb_intersects(struct vncr_tlb *vt, u64 addr,
+				u64 start, u64 end)
+{
+	u64 size, tlb_start, tlb_end;
+
+	size = ttl_to_size(pgshift_level_to_ttl(vt->wi.pgshift, vt->wr.level));
+	if (!size)
+		return true;
+
+	tlb_start = addr & ~(size - 1);
+	tlb_end = tlb_start + size;
+
+	return !(tlb_end <= start || tlb_start >= end);
+}
+
 /*
  * VNCR TLB invalidation occurs from MMU notifiers or TLBI instructions, and
  * either can race against a vcpu not being onlined yet (no pseudo-TLB
@@ -1008,14 +1023,7 @@ static void kvm_invalidate_vncr_ipa(struct kvm *kvm, u64 start, u64 end)
 		return;
 
 	kvm_for_each_vncr_tlb(i, vcpu, vt, kvm) {
-		u64 ipa_start, ipa_end, ipa_size;
-
-		ipa_size = ttl_to_size(pgshift_level_to_ttl(vt->wi.pgshift,
-							    vt->wr.level));
-		ipa_start = vt->wr.pa & ~(ipa_size - 1);
-		ipa_end = ipa_start + ipa_size;
-
-		if (ipa_end <= start || ipa_start >= end)
+		if (!vncr_tlb_intersects(vt, vt->wr.pa, start, end))
 			continue;
 
 		invalidate_vncr(vt);
@@ -1045,28 +1053,21 @@ static void invalidate_vncr_va(struct kvm *kvm,
 	lockdep_assert_held_write(&kvm->mmu_lock);
 
 	kvm_for_each_vncr_tlb(i, vcpu, vt, kvm) {
-		u64 va_start, va_end, va_size;
-
-		va_size = ttl_to_size(pgshift_level_to_ttl(vt->wi.pgshift,
-							   vt->wr.level));
-		va_start = vt->gva & ~(va_size - 1);
-		va_end = va_start + va_size;
-
 		switch (scope->type) {
 		case TLBI_ALL:
 			break;
 
 		case TLBI_VA:
-			if (va_end <= scope->va ||
-			    va_start >= (scope->va + scope->size))
+			if (!vncr_tlb_intersects(vt, vt->gva, scope->va,
+						 scope->va + scope->size))
 				continue;
 			if (vt->wr.nG && vt->wr.asid != scope->asid)
 				continue;
 			break;
 
 		case TLBI_VAA:
-			if (va_end <= scope->va ||
-			    va_start >= (scope->va + scope->size))
+			if (!vncr_tlb_intersects(vt, vt->gva, scope->va,
+						 scope->va + scope->size))
 				continue;
 			break;
 
-- 
2.43.0


