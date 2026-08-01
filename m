Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63569C55172
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 12:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZngfS6XyoIrIFTVgyICodmyNErU2ZSctmQqK8DYlMcw=; b=oaGFQvgUZ4IzArm08DXXYYdjRN
	Y5MUPVU1E/trPFwhG3hYl5zLK5+PYB0ZowGwYF6VF8I1Kdm5TUV6zps3mfrI4r15NMk4dsKPRnglB
	DKwkc4MTgMa9LmpsIiEt4xK4vO/2jSqHkftpYO5G9UGjbzlb2mmXJgDHGh2CjEHYj2gQ7UAGjCiDj
	30dRmT6FLDKejMkXPz0od0DE8Ah5XcqvXFPeI24DPUlZyml0kzoKUhRXxu526S+AMzy9kuKZKg4c/
	hEkf82vCYRdASyqaljXGpnpfqInpW9KVHmEP40pots9oAYzoOp4hcLnzQjIYj2ZdOy53ZF0emFnaT
	tjD/zt2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq98u-0000000EfBb-0ix4;
	Sat, 01 Aug 2026 12:48:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq98s-0000000EfAb-3hPk
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 12:48:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 951C942BA3;
	Sat,  1 Aug 2026 12:48:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E0F91F00ADB;
	Sat,  1 Aug 2026 12:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785588521;
	bh=ZngfS6XyoIrIFTVgyICodmyNErU2ZSctmQqK8DYlMcw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=opom6ZdibxZjBpqtD6LMwNE7eepoHVSbSMg0iShzyNAgxRqq/OtJtfmakA2AgTwoZ
	 WG4ISGddoU1VBoIGyapn0+dKXSWlGPjhGZjss0o81i+UhgYOkyjvpUiIabEF13cS63
	 PH6mqQ2syNBJvRO/COzj6k7GZqMJmp9X0vLqwdR96mP5EXb70mmYSRDLCSxfxXF5E1
	 nWB3PitDwVbKlpbXhgAMaLBGx02VzfowFN7wY7KewQcpS4EArMmT0pYE+32+xq5A67
	 Db/zJsbGuJm6in2m5jLbgWd0aVo7foRPEqN4ZCjlQAy/JPKJw2/mJvyJN9VtinPsAU
	 rmi7dJ8f1sR7A==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wq98p-0000000BGK2-2gMW;
	Sat, 01 Aug 2026 12:48:39 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Hyunwoo Kim <imv4bel@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/6] KVM: arm64: Handle negative S1 walk levels in VNCR TLB size evaluation
Date: Sat,  1 Aug 2026 13:48:14 +0100
Message-ID: <20260801124818.366274-3-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260801124818.366274-1-maz@kernel.org>
References: <20260801124818.366274-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, imv4bel@gmail.com, stable@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

Computing the effects of a TLB invalidation involves looking at
the size of the mapping cached by the TLB. For S1 mappings such as
VNCR, this is deducted from the combination of the base granule size
and the mapping level.

However, this implies that the S1 MMU is *on*. When the MMU is off,
we indicate this with the level being set to a "creative" value of
-127 (S1_MMU_DISABLED).

This ends-up being misinterpreted by pgshift_level_to_ttl() as it
doesn't handle negative levels at all (the level is immediately cast
to a u8 and only the bottom two bits considered), leading to an
invalidation size of 0. Not helpful.

Tidy-up pgshift_level_to_ttl() to handle these negative levels, and
ttl_to_size() to always return SZ_1G when no valid TTL is present.
This allows the removal of open-coded checks for similar situations.

Note that the check for a negative value not explicitely checking for
S1_MMU_DISABLED is deliberate, so that actual negative levels introduced
with LVA2 and D128 can take the same path if we ever support them.

Fixes: 7270cc9157f47 ("KVM: arm64: nv: Handle VNCR_EL2 invalidation from MMU notifiers")
Reported-by: Hyunwoo Kim <imv4bel@gmail.com>
Link: https://lore.kernel.org/r/ameGoxbn2wzBq2kL@v4bel
Signed-off-by: Marc Zyngier <maz@kernel.org>
Cc: stable@vger.kernel.org
---
 arch/arm64/kvm/nested.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index f3c75954cf36c..035cda256e2a5 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -505,7 +505,7 @@ int kvm_walk_nested_s2(struct kvm_vcpu *vcpu, phys_addr_t gipa,
 	return ret;
 }
 
-static unsigned int ttl_to_size(u8 ttl)
+static unsigned int __ttl_to_size(u8 ttl)
 {
 	int level = ttl & 3;
 	int gran = (ttl >> 2) & 3;
@@ -561,10 +561,22 @@ static unsigned int ttl_to_size(u8 ttl)
 	return max_size;
 }
 
-static u8 pgshift_level_to_ttl(u16 shift, u8 level)
+static unsigned int ttl_to_size(u8 ttl)
+{
+	return __ttl_to_size(ttl) ?: SZ_1G;
+}
+
+static u8 pgshift_level_to_ttl(u16 shift, s8 level)
 {
 	u8 ttl;
 
+	/*
+	 * If we don't have a proper level, fallback to the maximum
+	 * size.
+	 */
+	if (level < 0)
+		return 0;
+
 	switch(shift) {
 	case 12:
 		ttl = TLBI_TTL_TG_4K;
@@ -675,7 +687,11 @@ unsigned long compute_tlb_inval_range(struct kvm_s2_mmu *mmu, u64 val)
 		ttl = get_guest_mapping_ttl(mmu, addr);
 	}
 
-	max_size = ttl_to_size(ttl);
+	/*
+	 * Don't use the default 1GB fallback, as we can adapt to the
+	 * max mapping size we allow at S2.
+	 */
+	max_size = __ttl_to_size(ttl);
 
 	if (!max_size) {
 		/* Compute the maximum extent of the invalidation */
@@ -1124,8 +1140,6 @@ static void compute_s1_tlbi_range(struct kvm_vcpu *vcpu, u32 inst, u64 val,
 	case OP_TLBI_VALE1OSNXS:
 		scope->type = TLBI_VA;
 		scope->size = ttl_to_size(FIELD_GET(TLBI_TTL_MASK, val));
-		if (!scope->size)
-			scope->size = SZ_1G;
 		scope->va = tlbi_va_s1_to_va(val) & ~(scope->size - 1);
 		scope->asid = FIELD_GET(TLBIR_ASID_MASK, val);
 		break;
@@ -1152,8 +1166,6 @@ static void compute_s1_tlbi_range(struct kvm_vcpu *vcpu, u32 inst, u64 val,
 	case OP_TLBI_VAALE1OSNXS:
 		scope->type = TLBI_VAA;
 		scope->size = ttl_to_size(FIELD_GET(TLBI_TTL_MASK, val));
-		if (!scope->size)
-			scope->size = SZ_1G;
 		scope->va = tlbi_va_s1_to_va(val) & ~(scope->size - 1);
 		break;
 	case OP_TLBI_RVAE2:
-- 
2.47.3


