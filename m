Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E7B5F46C5A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 16:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=85nfbwqMJvYTwS2fmdxgu6pEYy2764VyacYBeQG6i4c=; b=zD7scma24A13mxKEQ4JpsHxzdH
	j7iHZHoR6ze3DvJ/+7rXQzwVb9pzjsbisGOHKRuATVAQKOdHoOGdwiLodNi/Fm95bjannyUKu2y2x
	KRGHsMDj+2ItCDmIpEQAW4FdNtGzfhcTMvq2rwpTRgMcwLCvsLBY8N21NTLZ1Baq0flmKMObX9jMf
	XCSTROY9QsUGxD4Yx8Hu2OiREwbgzQz6V0EvL40LlbS9KzRLvEK76PeuLLar0ePDXI3cw7cEbB6fN
	PWsbmPzs5fsobyvAgMgCLhcavEe4IrVZMQI2cjc+moqczfA16uGMI1qp62FAijZRmWUyn1L2wbynl
	OZfWbHiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9n6z-00000005KlF-0KWa;
	Mon, 06 Apr 2026 16:47:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9n6v-00000005KkH-2C9y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Apr 2026 16:47:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC47016F3;
	Mon,  6 Apr 2026 09:47:29 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 258A53F7D8;
	Mon,  6 Apr 2026 09:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775494055; bh=+TkEll1g4GPMoDQnUJ+ojaCZea8pptFIoCXOi3JHR/Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pazcLLgEY+txpooJQ2Q2dqL696hUl0qWATrOFtJeOxjQX5loFPlBhHscKu08qaw5c
	 Akoxy7d0q1HRQtp0rag04febeM0q9IzTjCQ7O3wM0YjETgEL9M4L8MLiNhk6HnonkS
	 eKRMN2BN1ydiRUqKtNXB1SWesVmL0db5zBFYbqlU=
From: Wei-Lin Chang <weilin.chang@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: [PATCH 2/2] KVM: arm64: Fallback to a supported value for unsupported guest TGx
Date: Mon,  6 Apr 2026 17:46:18 +0100
Message-ID: <20260406164618.3312473-3-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260406164618.3312473-1-weilin.chang@arm.com>
References: <20260406164618.3312473-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_094737_649925_1E22E3E7 
X-CRM114-Status: GOOD (  15.83  )
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

When KVM derives the translation granule for emulated stage-1 and
stage-2 walks, it decodes TCR/VTCR.TGx and treats the granule as-is.
This is wrong when the guest programs a granule size that is not
advertised in the guest's ID_AA64MMFR0_EL1.TGRAN* fields.
Architecturally, such a value must be treated as an implemented granule
size. Choose an available one while prioritizing PAGE_SIZE.

Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
---
 arch/arm64/kvm/at.c     | 48 ++++++++++++++++++++++++++
 arch/arm64/kvm/nested.c | 75 +++++++++++++++++++++++++++++++----------
 2 files changed, 105 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index ff8ba30e917b..6dd883798f83 100644
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@ -135,6 +135,30 @@ static void compute_s1poe(struct kvm_vcpu *vcpu, struct s1_walk_info *wi)
 	wi->e0poe = (wi->regime != TR_EL2) && (val & TCR2_EL1_E0POE);
 }
 
+#define _has_tgran(__r, __sz)					\
+	({							\
+		u64 _s1, _mmfr0 = __r;				\
+								\
+		_s1 = SYS_FIELD_GET(ID_AA64MMFR0_EL1,		\
+				    TGRAN##__sz, _mmfr0);	\
+								\
+		_s1 != ID_AA64MMFR0_EL1_TGRAN##__sz##_NI;	\
+	})
+
+static bool has_tgran(u64 mmfr0, unsigned int shift)
+{
+	switch (shift) {
+	case 12:
+		return _has_tgran(mmfr0, 4);
+	case 14:
+		return _has_tgran(mmfr0, 16);
+	case 16:
+		return _has_tgran(mmfr0, 64);
+	default:
+		BUG();
+	}
+}
+
 static unsigned int tg0_to_shift(u64 tg0)
 {
 	switch (tg0) {
@@ -161,8 +185,23 @@ static unsigned int tg1_to_shift(u64 tg1)
 	}
 }
 
+static unsigned int fallback_tgran_shift(u64 mmfr0)
+{
+	if (has_tgran(mmfr0, PAGE_SHIFT))
+		return PAGE_SHIFT;
+	else if (has_tgran(mmfr0, 12))
+		return 12;
+	else if (has_tgran(mmfr0, 14))
+		return 14;
+	else if (has_tgran(mmfr0, 16))
+		return 16;
+	else
+		return PAGE_SHIFT;
+}
+
 static u64 tcr_tg_shift(struct kvm *kvm, u64 tcr, bool upper_range)
 {
+	u64 mmfr0 = kvm_read_vm_id_reg(kvm, SYS_ID_AA64MMFR0_EL1);
 	unsigned int shift;
 
 	/* Someone was silly enough to encode TG0/TG1 differently */
@@ -171,6 +210,15 @@ static u64 tcr_tg_shift(struct kvm *kvm, u64 tcr, bool upper_range)
 	else
 		shift = tg0_to_shift(FIELD_GET(TCR_EL1_TG0_MASK, tcr));
 
+	/*
+	 * If TGx is programmed to an unimplemented value (not advertised in
+	 * ID_AA64MMFR0_EL1), we should treat it as if an implemented value is
+	 * written, as per the architecture. Choose an available one while
+	 * prioritizing PAGE_SIZE.
+	 */
+	if (!has_tgran(mmfr0, shift))
+		return fallback_tgran_shift(mmfr0);
+
 	return shift;
 }
 
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 2bfab3007cb3..64794ba4848d 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -378,6 +378,36 @@ static int walk_nested_s2_pgd(struct kvm_vcpu *vcpu, phys_addr_t ipa,
 	return 0;
 }
 
+#define _has_tgran_2(__r, __sz)						\
+	({								\
+		u64 _s1, _s2, _mmfr0 = __r;				\
+									\
+		_s2 = SYS_FIELD_GET(ID_AA64MMFR0_EL1,			\
+				    TGRAN##__sz##_2, _mmfr0);		\
+									\
+		_s1 = SYS_FIELD_GET(ID_AA64MMFR0_EL1,			\
+				    TGRAN##__sz, _mmfr0);		\
+									\
+		((_s2 != ID_AA64MMFR0_EL1_TGRAN##__sz##_2_NI &&		\
+		  _s2 != ID_AA64MMFR0_EL1_TGRAN##__sz##_2_TGRAN##__sz) || \
+		 (_s2 == ID_AA64MMFR0_EL1_TGRAN##__sz##_2_TGRAN##__sz && \
+		  _s1 != ID_AA64MMFR0_EL1_TGRAN##__sz##_NI));		\
+	})
+
+static bool has_tgran_2(u64 mmfr0, unsigned int shift)
+{
+	switch (shift) {
+	case 12:
+		return _has_tgran_2(mmfr0, 4);
+	case 14:
+		return _has_tgran_2(mmfr0, 16);
+	case 16:
+		return _has_tgran_2(mmfr0, 64);
+	default:
+		BUG();
+	}
+}
+
 static unsigned int tg0_to_shift(u64 tg0)
 {
 	switch (tg0) {
@@ -391,11 +421,35 @@ static unsigned int tg0_to_shift(u64 tg0)
 	}
 }
 
+static unsigned int fallback_tgran2_shift(u64 mmfr0)
+{
+	if (has_tgran_2(mmfr0, PAGE_SHIFT))
+		return PAGE_SHIFT;
+	else if (has_tgran_2(mmfr0, 12))
+		return 12;
+	else if (has_tgran_2(mmfr0, 14))
+		return 14;
+	else if (has_tgran_2(mmfr0, 16))
+		return 16;
+	else
+		return PAGE_SHIFT;
+}
+
 static u64 vtcr_tg0_shift(struct kvm *kvm, u64 vtcr)
 {
+	u64 mmfr0 = kvm_read_vm_id_reg(kvm, SYS_ID_AA64MMFR0_EL1);
 	u64 tg0 = FIELD_GET(VTCR_EL2_TG0_MASK, vtcr);
 	unsigned int shift = tg0_to_shift(tg0);
 
+	/*
+	 * If TGx is programmed to an unimplemented value (not advertised in
+	 * ID_AA64MMFR0_EL1), we should treat it as if an implemented value is
+	 * written, as per the architecture. Choose an available one while
+	 * prioritizing PAGE_SIZE.
+	 */
+	if (!has_tgran_2(mmfr0, shift))
+		return fallback_tgran2_shift(mmfr0);
+
 	return shift;
 }
 
@@ -1516,21 +1570,6 @@ static void kvm_map_l1_vncr(struct kvm_vcpu *vcpu)
 	}
 }
 
-#define has_tgran_2(__r, __sz)						\
-	({								\
-		u64 _s1, _s2, _mmfr0 = __r;				\
-									\
-		_s2 = SYS_FIELD_GET(ID_AA64MMFR0_EL1,			\
-				    TGRAN##__sz##_2, _mmfr0);		\
-									\
-		_s1 = SYS_FIELD_GET(ID_AA64MMFR0_EL1,			\
-				    TGRAN##__sz, _mmfr0);		\
-									\
-		((_s2 != ID_AA64MMFR0_EL1_TGRAN##__sz##_2_NI &&		\
-		  _s2 != ID_AA64MMFR0_EL1_TGRAN##__sz##_2_TGRAN##__sz) || \
-		 (_s2 == ID_AA64MMFR0_EL1_TGRAN##__sz##_2_TGRAN##__sz && \
-		  _s1 != ID_AA64MMFR0_EL1_TGRAN##__sz##_NI));		\
-	})
 /*
  * Our emulated CPU doesn't support all the possible features. For the
  * sake of simplicity (and probably mental sanity), wipe out a number
@@ -1617,15 +1656,15 @@ u64 limit_nv_id_reg(struct kvm *kvm, u32 reg, u64 val)
 		 */
 		switch (PAGE_SIZE) {
 		case SZ_4K:
-			if (has_tgran_2(orig_val, 4))
+			if (_has_tgran_2(orig_val, 4))
 				val |= SYS_FIELD_PREP_ENUM(ID_AA64MMFR0_EL1, TGRAN4_2, IMP);
 			fallthrough;
 		case SZ_16K:
-			if (has_tgran_2(orig_val, 16))
+			if (_has_tgran_2(orig_val, 16))
 				val |= SYS_FIELD_PREP_ENUM(ID_AA64MMFR0_EL1, TGRAN16_2, IMP);
 			fallthrough;
 		case SZ_64K:
-			if (has_tgran_2(orig_val, 64))
+			if (_has_tgran_2(orig_val, 64))
 				val |= SYS_FIELD_PREP_ENUM(ID_AA64MMFR0_EL1, TGRAN64_2, IMP);
 			break;
 		}
-- 
2.43.0


