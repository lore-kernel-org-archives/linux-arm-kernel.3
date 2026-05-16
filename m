Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE5E4CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 May 2026 18:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tSzt5JOEdaw5HwcafWuwFmNIniGDfgvRT456op0NNFk=; b=fMsLpOtP3lrQTpoVu3TUsxzmBG
	A28VT3io7Illi0T2HXSs0+zv6YyPgXtK8/uhJRydbfnI3SPXIqrvqXgOSEefV/M7tQNL+JzD0CETm
	lX7t731bXaNLc6NnJ5UCPlj38D0L1/7eonl89Z0SXsgIgwpIh8cKCrXXJg/jA5fBwqodlFJ7NIMkt
	beYFilbe4lcct3rPH0I4llSUWtTMGwZk2Fd2z5p5aXOtPdIjhkjzyQoewSNK7vJyV6RC3/DVgDyY6
	4uMJT8WMs7gS23fm/7F1SzLQttOkm4XPDdPcqzkhX6vybydJYLWePal42BYmbF5FEdK8NB4MdEj8N
	9NgsTyXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOJnC-0000000BCYf-32p8;
	Sat, 16 May 2026 18:31:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOJn5-0000000BCR0-2eRn
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 May 2026 18:31:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 820292D91;
	Sat, 16 May 2026 11:31:04 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 145AD3F85F;
	Sat, 16 May 2026 11:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778956269; bh=waACEwaOCU9Q56/CgdQoWvYngZ8Q6B/c8GIndLVbAcQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sKa08AsosCe81z3+QYLy0GKotDrI/oTc9yFQYA2Qcwvib+5EX/jkNhQoyOe+D0VM7
	 9X6BjsHACpnmO+kQL9qjViOAQZLBVxNVL011lFr/tNqddm77JgVUNmiKvAmpZMVR0p
	 yFoVIuP4YtbbcCTjUa0QMp3Skyq/pxxJI+y68qfY=
From: Wei-Lin Chang <weilin.chang@arm.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Itaru Kitayama <itaru.kitayama@fujitsu.com>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: [PATCH v3 7/9] KVM: arm64: selftests: shadow_stage2: Check supported stage-2 granule size
Date: Sat, 16 May 2026 19:30:01 +0100
Message-ID: <20260516183003.799058-8-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260516183003.799058-1-weilin.chang@arm.com>
References: <20260516183003.799058-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_113111_793664_B53158A9 
X-CRM114-Status: GOOD (  13.04  )
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

When selecting a granule size for stage-2, the supported stage-2 granule
size must be checked. Add the check. For simplicity, we check whether
the guest stage-1 granule size is supported for stage-2, and skip the
test otherwise.

Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
---
 .../selftests/kvm/arm64/shadow_stage2.c       |  8 +++++
 .../selftests/kvm/include/arm64/nested.h      |  1 +
 .../testing/selftests/kvm/lib/arm64/nested.c  | 30 +++++++++++++++++++
 3 files changed, 39 insertions(+)

diff --git a/tools/testing/selftests/kvm/arm64/shadow_stage2.c b/tools/testing/selftests/kvm/arm64/shadow_stage2.c
index 1ad510a38654..c5332b8b5683 100644
--- a/tools/testing/selftests/kvm/arm64/shadow_stage2.c
+++ b/tools/testing/selftests/kvm/arm64/shadow_stage2.c
@@ -14,6 +14,8 @@
 #define L2FAILED	(0x1)
 #define L2SYNC		(0x2)
 
+#define TGRAN2NOSUP	(0x3)
+
 /* Used for L2 stack and guest S2 page tables. */
 #define L2_PAGE_POOL_ADDR	(0x80000000)
 #define L2_PAGE_POOL_NPAGES	(512)
@@ -53,6 +55,7 @@ static void guest_code(void)
 	int ret, i = 0;
 	gpa_t l2_pc, l2_stack_top;
 	struct page_pool pp;
+	u64 mmfr0 = read_sysreg(id_aa64mmfr0_el1);
 
 	GUEST_ASSERT_EQ(get_current_el(), 2);
 	GUEST_PRINTF("vEL2 entry\n");
@@ -62,6 +65,9 @@ static void guest_code(void)
 	pp.current = L2_PAGE_POOL_ADDR;
 	pp.page_size = get_page_size();
 
+	if (!has_tgran_2(mmfr0, pp.page_size))
+		GUEST_SYNC1(TGRAN2NOSUP);
+
 	l2_stack_top = alloc_page(&pp) + pp.page_size;
 	l2_pc = ucall_translate_to_gpa(l2_guest_code);
 
@@ -119,6 +125,8 @@ int main(void)
 			}
 			if (uc.args[0] == L2SYNC)
 				pr_info("L2SYNC, L1 info: %ld, L2 info: %ld\n", uc.args[1], uc.args[2]);
+			if (uc.args[0] == TGRAN2NOSUP)
+				ksft_exit_skip("Guest page size not supported as guest stage-2 page size!\n");
 			break;
 		case UCALL_PRINTF:
 			pr_info("[L1] %s", uc.buffer);
diff --git a/tools/testing/selftests/kvm/include/arm64/nested.h b/tools/testing/selftests/kvm/include/arm64/nested.h
index 8e7d7738b381..fc59fabff12d 100644
--- a/tools/testing/selftests/kvm/include/arm64/nested.h
+++ b/tools/testing/selftests/kvm/include/arm64/nested.h
@@ -55,6 +55,7 @@ struct page_pool {
 
 size_t get_page_size(void);
 gpa_t alloc_page(struct page_pool *pp);
+bool has_tgran_2(u64 mmfr0, size_t size);
 void prepare_hyp(void);
 void init_vcpu(struct vcpu *vcpu, gpa_t l2_pc, gpa_t l2_stack_top);
 int run_l2(struct vcpu *vcpu, struct hyp_data *hyp_data);
diff --git a/tools/testing/selftests/kvm/lib/arm64/nested.c b/tools/testing/selftests/kvm/lib/arm64/nested.c
index 7f47e340f00d..cda41f355263 100644
--- a/tools/testing/selftests/kvm/lib/arm64/nested.c
+++ b/tools/testing/selftests/kvm/lib/arm64/nested.c
@@ -9,6 +9,36 @@
 #include <asm/sysreg.h>
 #include <linux/sizes.h>
 
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
+bool has_tgran_2(u64 mmfr0, size_t size)
+{
+	switch (size) {
+	case SZ_4K:
+		return _has_tgran_2(mmfr0, 4);
+	case SZ_16K:
+		return _has_tgran_2(mmfr0, 16);
+	case SZ_64K:
+		return _has_tgran_2(mmfr0, 64);
+	default:
+		return false;
+	}
+}
+
 size_t get_page_size(void)
 {
 	u64 tcr_el1 = read_sysreg(tcr_el1);
-- 
2.43.0


