Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD783E77180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 16:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u4j+iNOuE80b5cF1isLUMFrawlYtjdat+uShb0WBEyY=; b=IYZUTGBOfYjJK1DNP4GshBUWBs
	kUk3JTgHwmdyV1mEVYM3QoqDfFXbntuAUhOnPbl1HvHw1UarqAu0BZj90VsCrWUYJqRoGDQYOOqpN
	K4Ns8RGEDH9AKx/tzsWlbfEOovIqlg6QPu8DFV+LhKAK1xag7ik1fm58FjJJaZcOYUhhfgaf3SOjs
	lC94uWTSFc5LBmFzTDqVSDTzdTIYeIZil6pgieg228uskPYmqyO/sY9wmGTM5qAY5/CaRVpNTZL3b
	d8eyXIbi+bqI7uFMzc/UaesVnwtY6495xom9gDqxPDJSDlK4SCDy/5gFMqS5euoZFI2HtwUaRJPhz
	ziF5wNhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLPDq-0000000FOBB-3r82;
	Wed, 11 Dec 2024 16:05:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLPAz-0000000FNK8-0W2x
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 16:03:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1BEB415A1;
	Wed, 11 Dec 2024 08:03:28 -0800 (PST)
Received: from mazurka.cambridge.arm.com (mazurka.cambridge.arm.com [10.1.196.66])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ED4963F5A1;
	Wed, 11 Dec 2024 08:02:57 -0800 (PST)
From: =?UTF-8?q?Miko=C5=82aj=20Lenczewski?= <miko.lenczewski@arm.com>
To: ryan.roberts@arm.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	corbet@lwn.net,
	maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com
Cc: =?UTF-8?q?Miko=C5=82aj=20Lenczewski?= <miko.lenczewski@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev
Subject: [RESEND RFC PATCH v1 1/5] arm64: Add TLB Conflict Abort Exception handler to KVM
Date: Wed, 11 Dec 2024 16:01:37 +0000
Message-ID: <20241211160218.41404-2-miko.lenczewski@arm.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241211160218.41404-1-miko.lenczewski@arm.com>
References: <20241211160218.41404-1-miko.lenczewski@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_080301_196332_CAF5D93F 
X-CRM114-Status: GOOD (  10.50  )
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

Currently, KVM does not handle the case of a stage 2 TLB conflict abort
exception. The Arm ARM specifies that the worst-case handling of such an
exception requires a `tlbi vmalls12e1`. Perform such an invalidation
when this exception is encountered.

Signed-off-by: Mikołaj Lenczewski <miko.lenczewski@arm.com>
---
 arch/arm64/include/asm/esr.h | 8 ++++++++
 arch/arm64/kvm/mmu.c         | 6 ++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/arm64/include/asm/esr.h b/arch/arm64/include/asm/esr.h
index d1b1a33f9a8b..8a66f81ca291 100644
--- a/arch/arm64/include/asm/esr.h
+++ b/arch/arm64/include/asm/esr.h
@@ -121,6 +121,7 @@
 #define ESR_ELx_FSC_SEA_TTW(n)	(0x14 + (n))
 #define ESR_ELx_FSC_SECC	(0x18)
 #define ESR_ELx_FSC_SECC_TTW(n)	(0x1c + (n))
+#define ESR_ELx_FSC_TLBABT	(0x30)
 
 /* Status codes for individual page table levels */
 #define ESR_ELx_FSC_ACCESS_L(n)	(ESR_ELx_FSC_ACCESS + (n))
@@ -464,6 +465,13 @@ static inline bool esr_fsc_is_access_flag_fault(unsigned long esr)
 	       (esr == ESR_ELx_FSC_ACCESS_L(0));
 }
 
+static inline bool esr_fsc_is_tlb_conflict_abort(unsigned long esr)
+{
+	esr = esr & ESR_ELx_FSC;
+
+	return esr == ESR_ELx_FSC_TLBABT;
+}
+
 /* Indicate whether ESR.EC==0x1A is for an ERETAx instruction */
 static inline bool esr_iss_is_eretax(unsigned long esr)
 {
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index c9d46ad57e52..c8c6f5a97a1b 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1756,6 +1756,12 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 	ipa = fault_ipa = kvm_vcpu_get_fault_ipa(vcpu);
 	is_iabt = kvm_vcpu_trap_is_iabt(vcpu);
 
+	if (esr_fsc_is_tlb_conflict_abort(esr)) {
+		// does a `tlbi vmalls12e1is`
+		__kvm_tlb_flush_vmid(&vcpu->kvm->arch.mmu);
+		return 1;
+	}
+
 	if (esr_fsc_is_translation_fault(esr)) {
 		/* Beyond sanitised PARange (which is the IPA limit) */
 		if (fault_ipa >= BIT_ULL(get_kvm_ipa_limit())) {
-- 
2.45.2


