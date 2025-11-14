Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BAB6CE8D51
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 16:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WTpPGsCBl8yUbistziTlNy+Y0tDqzOkRqUOHR4fXQF4=; b=z/TeXscqAaxIow74aAxgRt83CF
	Stq5bzQmWGrpvCZEBMu53DLuaGiCx1Syx0MzF6a7wx6DUq06PVGvkRqXrB1Yk84H9nsLRqqk8FTuP
	YiJ3MvdpTAkHAxN3JLheVQ0+JPJ1x5ZxVR1EnZX+y0PjjD+dde33VRU1mnZbqOb1a8588DKndEJIV
	r0lorp5GMuV0nPiL0tiqwJWma5N3mD7lBp0zBmPlyoR004ag2cJEYBsMMFbldyKCtPePHoCGU1qjQ
	Bzzlt8/jvobz4Jpt37GcNbo10RYKg6Hsy3MLPbUGgTmhO8Yo7VHGu390emlQBMqv0O9sUnHpizzd3
	5vQVmhvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwMC-0000000CgP8-2vnW;
	Fri, 14 Nov 2025 16:09:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwLy-0000000Cg4M-0nct
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 14 Nov 2025 16:08:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=WTpPGsCBl8yUbistziTlNy+Y0tDqzOkRqUOHR4fXQF4=; b=OignNNQzHVHkn1RdU/Klv3FsMM
	H7Fx9R2S3bwJTTUCnULcIbvLrN+U09/m65iuQltyZgG/XTAta1D7podXvJwzxPwJ3d7j+i8vbIAoE
	z8P7uGWKawj9eeamHjAw0C1ujNM2yPlaPQOdVyxV3vZ0UFY8OdJ3hvvx3ZAaUHYt9uH8rswxk43Sd
	U2loKxmW0BDRY8prBVvhwbSnEGbQXuTQb8P8Vfh3RbxnrIUOaax90GYfn/OyQZ7N/J2DLM89EL6gz
	kA5C6pMSZgKz2D3zaJyR5SPw1xDUq8u89hfLtkjQZTvWXhq/bUWAaV5zGNApGTWq+38BoRia0T6oM
	JtqZgQUg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvUF-00000002veQ-15hl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 15:13:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4837919F6;
	Fri, 14 Nov 2025 08:08:37 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BF63A3F5A1;
	Fri, 14 Nov 2025 08:08:42 -0800 (PST)
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: james.clark@linaro.org,
	mark.rutland@arm.com,
	james.morse@arm.com
Subject: [RFC PATCH v6 28/35] KVM: arm64: at: Use callback for reading descriptor
Date: Fri, 14 Nov 2025 16:07:09 +0000
Message-ID: <20251114160717.163230-29-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251114160717.163230-1-alexandru.elisei@arm.com>
References: <20251114160717.163230-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_151319_664981_EF73469C 
X-CRM114-Status: GOOD (  12.34  )
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

Allow callers of __kvm_translate_va() to use a custom defined function for
reading the translation table descriptor from guest memory. This will be
useful for SPE virtualization, where the translation tables must also be
mapped at stage 2 for the entire duration of the guest profiling session.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 arch/arm64/include/asm/kvm_nested.h |  6 ++++++
 arch/arm64/kvm/at.c                 | 17 +++++++++++++----
 arch/arm64/kvm/nested.c             |  7 ++++---
 3 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_nested.h b/arch/arm64/include/asm/kvm_nested.h
index f7c06a840963..e9a73ea74f24 100644
--- a/arch/arm64/include/asm/kvm_nested.h
+++ b/arch/arm64/include/asm/kvm_nested.h
@@ -284,6 +284,11 @@ static inline unsigned int ps_to_output_size(unsigned int ps, bool pa52bit)
 	}
 }
 
+typedef int (*read_desc_fn)(struct kvm_vcpu *, gpa_t, void *, unsigned long);
+
+int kvm_vcpu_read_desc(struct kvm_vcpu *vcpu, gpa_t gpa, void *desc,
+		       unsigned long len);
+
 enum trans_regime {
 	TR_EL10,
 	TR_EL20,
@@ -305,6 +310,7 @@ struct s1_walk_filter {
 
 struct s1_walk_info {
 	struct s1_walk_filter	*filter;
+	read_desc_fn		read_desc;
 	u64	     		baddr;
 	enum trans_regime	regime;
 	unsigned int		max_oa_bits;
diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index be26d5aa668c..e1df4278d5d5 100644
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@ -110,6 +110,12 @@ static u64 effective_tcr2(struct kvm_vcpu *vcpu, enum trans_regime regime)
 	return vcpu_read_sys_reg(vcpu, TCR2_EL2);
 }
 
+int kvm_vcpu_read_desc(struct kvm_vcpu *vcpu, gpa_t gpa, void *desc,
+		       unsigned long len)
+{
+	return kvm_read_guest(vcpu->kvm, gpa, desc, len);
+}
+
 static bool s1pie_enabled(struct kvm_vcpu *vcpu, enum trans_regime regime)
 {
 	if (!kvm_has_s1pie(vcpu->kvm))
@@ -142,6 +148,9 @@ static int setup_s1_walk(struct kvm_vcpu *vcpu, struct s1_walk_info *wi,
 	unsigned int stride, x;
 	bool va55, tbi, lva;
 
+	if (!wi->read_desc)
+		return -EINVAL;
+
 	va55 = va & BIT(55);
 
 	if (vcpu_has_nv(vcpu)) {
@@ -414,7 +423,7 @@ static int walk_s1(struct kvm_vcpu *vcpu, struct s1_walk_info *wi,
 				return ret;
 		}
 
-		ret = kvm_read_guest(vcpu->kvm, ipa, &desc, sizeof(desc));
+		ret = wi->read_desc(vcpu, ipa, &desc, sizeof(desc));
 		if (ret) {
 			fail_s1_walk(wr, ESR_ELx_FSC_SEA_TTW(level), false);
 			return ret;
@@ -1542,9 +1551,9 @@ void __kvm_at_s12(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
 }
 
 /*
- * Translate a VA for a given EL in a given translation regime, with
- * or without PAN. This requires wi->{regime, as_el0, pan} to be
- * set. The rest of the wi and wr should be 0-initialised.
+ * Translate a VA for a given EL in a given translation regime, with or without
+ * PAN. This requires wi->{read_desc, regime, as_el0, pan} to be set. The rest
+ * of the wi and wr should be 0-initialised.
  */
 int __kvm_translate_va(struct kvm_vcpu *vcpu, struct s1_walk_info *wi,
 		       struct s1_walk_result *wr, u64 va)
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index f04cda40545b..92e94bb96bcc 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1196,9 +1196,10 @@ static int kvm_translate_vncr(struct kvm_vcpu *vcpu, bool *is_gmem)
 		invalidate_vncr(vt);
 
 		vt->wi = (struct s1_walk_info) {
-			.regime	= TR_EL20,
-			.as_el0	= false,
-			.pan	= false,
+			.read_desc	= kvm_vcpu_read_desc,
+			.regime		= TR_EL20,
+			.as_el0		= false,
+			.pan		= false,
 		};
 		vt->wr = (struct s1_walk_result){};
 	}
-- 
2.51.2


