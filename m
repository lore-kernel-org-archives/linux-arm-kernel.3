Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81CB210398B2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 21:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9aowQhL0QIZwKB36zTQiyPapSENcsSVgB7YaU5blX9M=; b=A+Zr+u4YHtkKnXPiGiTM1CoM72
	n57usMnaa8BPhYXpU0HPVuAfeHH6iSNgHVSTNhOqgkNc8DNoh9zeM520DkmvvVba3PcQ9gizMmh/D
	+BjiOtpHgVRcIkrvxPlReTCzFxFSsBcrWCLMc1NjLFSClTawNHZt0yrsinFV2kQifEZ4qaezzau3E
	9JveOjgadcUucSkPs1doygyayQoBY/VXlXnRJBzh7QbusM2XXkyJVDNgaIuAM3VYL/gQmDdMUgc/5
	TTKuZ2SCgBvkTlzZdBccadISi48zbtF86BeU00cQhiWXA04OIVX9EBHkukSyGZ2gFSs9aKMknmzFm
	FTpopEFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw5I2-00000009AqX-2CQb;
	Fri, 27 Feb 2026 21:22:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw5Hu-00000009AnR-2enk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 21:22:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5858544464;
	Fri, 27 Feb 2026 21:22:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8E85C19425;
	Fri, 27 Feb 2026 21:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772227338;
	bh=KZV5/gKKt/L2LiLu9lL0s0Maw3uWjGsBz31crUz8LE4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oB++lCILHj7wQr1AjKDw/drBtOs3M/ntyeK/knYp6ZjHnvvqw6IrOnn3uixkkyyG3
	 Mgaj+EMxWUYBcaIxNRdqOhCT+MSmyYmYsv/YaEQQzjmgfilc/O9v5zI7esP95P09SH
	 /TOMFmCAzEWQ3kUlod2QrktV+VG0AP3diseEwKzTQbu0190oZO+7w7XJT89aHe8EHW
	 0qqp+W6u7RVVo7QTsgSfKcig33vx1bCW/QFnGlRZl0cQFDpXed+BKkBvCxiMrGlIKP
	 mV02b1d2zOrI0GwChG123CFewkEeGvJnJJgXKBgtxgQJrYnP3rx1tKKMIlBD6zd6/0
	 ANpUdZPiqSrMw==
From: Will Deacon <will@kernel.org>
To: kvmarm@lists.linux.dev
Cc: mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Yabin Cui <yabinc@google.com>
Subject: [PATCH v2 3/3] KVM: arm64: Don't pass host_debug_state to BRBE world-switch routines
Date: Fri, 27 Feb 2026 21:21:35 +0000
Message-ID: <20260227212136.7660-4-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260227212136.7660-1-will@kernel.org>
References: <20260227212136.7660-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_132219_861055_537A8798 
X-CRM114-Status: GOOD (  12.37  )
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

Now that the SPE and BRBE nVHE world-switch routines operate on the
host_debug_state directly, tweak the BRBE code to do the same for
consistency.

This is purely cosmetic.

Cc: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>
Cc: James Clark <james.clark@linaro.org>
Cc: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Fuad Tabba <tabba@google.com>
Cc: Alexandru Elisei <alexandru.elisei@arm.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kvm/hyp/nvhe/debug-sr.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/debug-sr.c b/arch/arm64/kvm/hyp/nvhe/debug-sr.c
index 75158a9cd06a..06ae122a7761 100644
--- a/arch/arm64/kvm/hyp/nvhe/debug-sr.c
+++ b/arch/arm64/kvm/hyp/nvhe/debug-sr.c
@@ -158,9 +158,9 @@ static void __trace_switch_to_host(void)
 			  *host_data_ptr(host_debug_state.trfcr_el1));
 }
 
-static void __debug_save_brbe(u64 *brbcr_el1)
+static void __debug_save_brbe(void)
 {
-	*brbcr_el1 = 0;
+	u64 *brbcr_el1 = host_data_ptr(host_debug_state.brbcr_el1);
 
 	/* Check if the BRBE is enabled */
 	if (!(read_sysreg_el1(SYS_BRBCR) & (BRBCR_ELx_E0BRE | BRBCR_ELx_ExBRE)))
@@ -175,8 +175,10 @@ static void __debug_save_brbe(u64 *brbcr_el1)
 	write_sysreg_el1(0, SYS_BRBCR);
 }
 
-static void __debug_restore_brbe(u64 brbcr_el1)
+static void __debug_restore_brbe(void)
 {
+	u64 brbcr_el1 = *host_data_ptr(host_debug_state.brbcr_el1);
+
 	if (!brbcr_el1)
 		return;
 
@@ -192,7 +194,7 @@ void __debug_save_host_buffers_nvhe(struct kvm_vcpu *vcpu)
 
 	/* Disable BRBE branch records */
 	if (host_data_test_flag(HAS_BRBE))
-		__debug_save_brbe(host_data_ptr(host_debug_state.brbcr_el1));
+		__debug_save_brbe();
 
 	if (__trace_needs_switch())
 		__trace_switch_to_guest();
@@ -208,7 +210,7 @@ void __debug_restore_host_buffers_nvhe(struct kvm_vcpu *vcpu)
 	if (host_data_test_flag(HAS_SPE))
 		__debug_restore_spe();
 	if (host_data_test_flag(HAS_BRBE))
-		__debug_restore_brbe(*host_data_ptr(host_debug_state.brbcr_el1));
+		__debug_restore_brbe();
 	if (__trace_needs_switch())
 		__trace_switch_to_host();
 }
-- 
2.53.0.473.g4a7958ca14-goog


