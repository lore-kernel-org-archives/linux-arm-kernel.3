Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C51DC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 16:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h3m12KdqvLdOYCeeOW1IC7fta/r0Kp5AgvKtb2vRw+c=; b=FEs1P/W57uuosvTm3ifvdkTgI2
	zLgVhT3L4kicVB3FcIv3UtTV0J0kv5YmrKlSMTH+PCHetHdZfjFdOd46ypeAdKV4KajEYKfvrEvmE
	q2CUuDErIugSy+4WBNLqKLVzXeMdKKhyN9qOtqOPOn8CO7HvokoVlIHCEzJ9ObcRKOy7y/V1aQ3o1
	K0B3rkZhDW/jsn5ZjvX3ZKb6HRUVn6VAMEku4tPkOX2VieIY3QHgky8O2eiQW4qV74xE+udcDkwch
	YUaWMIqjlnBmiKdYS71iEXxcBt0KAWOuppF0KCiRPhsf/9os1k613naU00+l48OG3b5dTVFsCV343
	nLA9i/fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x29yX-000000006ck-2pe8;
	Thu, 03 Sep 2026 16:07:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x29yK-000000005ys-0IIP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 16:07:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EEC5E1FC4;
	Thu,  3 Sep 2026 09:07:23 -0700 (PDT)
Received: from e140010.cambridge.arm.com (e140010.arm.com [10.2.213.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C6A3D3F673;
	Thu,  3 Sep 2026 09:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788451647; bh=pFtVEZ2dhq5smjJX4KiK2ggzIgj0EsmQQlo0I05g5Vc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Cclb8IAxJYcTBznChszZY9BsNWNZGkaQFyqm8nr1EZ8pJ53k665yKYHcVHqy4eZmW
	 EKqqfGwbBGOF989Nt7eV2VyuttIVcKIl0u8QJvJB3U8urkC3vQ6a4PZj/xxkkDnXi6
	 AQx7htBRVBDKML7vol5EvWVWcmTJlK5ZJmKq3huI=
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: maz@kernel.org,
	oupton@kernel.org,
	fuad.tabba@linux.dev,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	will@kernel.org,
	mark.rutland@arm.com,
	linux-perf-users@vger.kernel.org,
	catalin.marinas@arm.com,
	james.clark@linaro.org
Cc: James Morse <james.morse@arm.com>
Subject: [RFC PATCH v7 25/28] KVM: arm64: at: Use callback for reading descriptor
Date: Thu,  3 Sep 2026 17:06:20 +0100
Message-ID: <20260903160623.315525-26-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903160623.315525-1-alexandru.elisei@arm.com>
References: <20260903160623.315525-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_090728_183401_A00A2FFC 
X-CRM114-Status: GOOD (  16.19  )
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

Allow callers of __kvm_translate_va() to use a custom function for reading
the translation table descriptor from guest memory. This will be useful for
handling stage 2 faults reported by SPE, to map the stage 1 translation
tables at stage 2.

Suggested-by: James Morse <james.morse@arm.com>
Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 arch/arm64/include/asm/kvm_nested.h |  7 +++++++
 arch/arm64/kvm/at.c                 | 22 ++++++++++++++--------
 arch/arm64/kvm/nested.c             |  7 ++++---
 3 files changed, 25 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_nested.h b/arch/arm64/include/asm/kvm_nested.h
index 1ed708335809..d812137dcd9e 100644
--- a/arch/arm64/include/asm/kvm_nested.h
+++ b/arch/arm64/include/asm/kvm_nested.h
@@ -350,8 +350,15 @@ struct s1_walk_filter {
 	void	*priv;
 };
 
+typedef int (*read_desc_fn)(struct kvm_vcpu *, u64, u64 *,
+			    struct s1_walk_info *);
+
+int kvm_vcpu_read_s1_desc(struct kvm_vcpu *vcpu, u64 pa, u64 *desc,
+			  struct s1_walk_info *wi);
+
 struct s1_walk_info {
 	struct s1_walk_filter	*filter;
+	read_desc_fn		read_s1_desc;
 	u64	     		baddr;
 	enum trans_regime	regime;
 	unsigned int		max_oa_bits;
diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index 0926426b8798..6e77beced96c 100644
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@ -224,6 +224,9 @@ static int setup_s1_walk(struct kvm_vcpu *vcpu, struct s1_walk_info *wi,
 	unsigned int stride, x;
 	bool va55, tbi, lva, upper_range;
 
+	if (!wi->read_s1_desc)
+		return -EINVAL;
+
 	va55 = va & BIT(55);
 	upper_range = va55 && wi->regime != TR_EL2;
 
@@ -427,8 +430,8 @@ static int setup_s1_walk(struct kvm_vcpu *vcpu, struct s1_walk_info *wi,
 	return -EFAULT;
 }
 
-static int kvm_read_s1_desc(struct kvm_vcpu *vcpu, u64 pa, u64 *desc,
-			    struct s1_walk_info *wi)
+int kvm_vcpu_read_s1_desc(struct kvm_vcpu *vcpu, u64 pa, u64 *desc,
+			  struct s1_walk_info *wi)
 {
 	u64 val;
 	int r;
@@ -513,7 +516,7 @@ static int walk_s1(struct kvm_vcpu *vcpu, struct s1_walk_info *wi,
 				return ret;
 		}
 
-		ret = kvm_read_s1_desc(vcpu, ipa, &desc, wi);
+		ret = wi->read_s1_desc(vcpu, ipa, &desc, wi);
 		if (ret) {
 			fail_s1_walk(wr, ESR_ELx_FSC_SEA_TTW(level), false);
 			return ret;
@@ -1324,6 +1327,7 @@ static int handle_at_slow(struct kvm_vcpu *vcpu, u32 op, u64 vaddr, u64 *par)
 	bool perm_fail = false;
 	int ret, idx;
 
+	wi.read_s1_desc = kvm_vcpu_read_s1_desc;
 	wi.regime = compute_translation_regime(vcpu, op);
 	wi.as_el0 = (op == OP_AT_S1E0R || op == OP_AT_S1E0W);
 	wi.pan = (op == OP_AT_S1E1RP || op == OP_AT_S1E1WP) &&
@@ -1657,9 +1661,10 @@ int __kvm_at_s12(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
 }
 
 /*
- * Translate a VA for a given EL in a given translation regime, with
- * or without PAN. This requires wi->{regime, as_el0, pan} to be
- * set. The rest of the wi and wr should be 0-initialised.
+ * Translate a VA for a given EL in a given translation regime, with or without
+ * PAN. This requires wi->{regime, as_el0, pan, read_s1_desc} to be set.
+ * Setting wi->filter is optional. The rest of the wi and wr should be
+ * 0-initialised.
  */
 int __kvm_translate_va(struct kvm_vcpu *vcpu, struct s1_walk_info *wi,
 		       struct s1_walk_result *wr, u64 va)
@@ -1716,8 +1721,9 @@ int __kvm_find_s1_desc_level(struct kvm_vcpu *vcpu, u64 va, u64 ipa, int *level)
 			.fn	= match_s1_desc,
 			.priv	= &dm,
 		},
-		.as_el0	= false,
-		.pan	= false,
+		.read_s1_desc	= kvm_vcpu_read_s1_desc,
+		.as_el0		= false,
+		.pan		= false,
 	};
 	struct s1_walk_result wr = {};
 	int ret;
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 17123f0b6dab..e3e71628f8c5 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1435,9 +1435,10 @@ static int kvm_translate_vncr(struct kvm_vcpu *vcpu, bool *is_gmem)
 			invalidate_vncr(vcpu->kvm, vt);
 
 		vt->wi = (struct s1_walk_info) {
-			.regime	= TR_EL20,
-			.as_el0	= false,
-			.pan	= false,
+			.read_s1_desc	= kvm_vcpu_read_s1_desc,
+			.regime		= TR_EL20,
+			.as_el0		= false,
+			.pan		= false,
 		};
 		vt->wr = (struct s1_walk_result){};
 	}
-- 
2.43.0


