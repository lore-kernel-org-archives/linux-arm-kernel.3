Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F7B10ED664
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 13:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wnGJQEK5OVdQxwZnjCmN3P6+8CcdtDMTzj9JP7NjP8c=; b=eGQu3kcujqn7rKUWBxKHk2M56A
	EOE0y6kn7pqfkwfRnfbIcLgQ9AcUFde3dCtYkVof64E/k1gDO2TujNHS4MVj0ujCA+6W6+ESPBL3R
	2sNKMSgkWXfioJwubaYg5OVCghdoO24DuVgwFRDka8BT+MRo/qySL2LO+gnkwqTBv+0aPMZHhkZMm
	AqP0GGfzCXTspNOMdEgMLHAd04xmmGtYriQouUGYjgGOrua+aMpQ1pO3qS7V2Jx2c55UZrK/pY/D5
	68dZoOJmBJqlLkKY2W46++oE3czxOXBmRqmoTS9cg/gxN1U4SuD5uplMTMm6i3nt9tHhEWIbXJ7hV
	IeOOz7iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w66oa-00000007Nx9-25Kh;
	Fri, 27 Mar 2026 13:01:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w66oU-00000007NuD-3txz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 13:01:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3E7EA44557;
	Fri, 27 Mar 2026 13:01:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7C2AC2BC86;
	Fri, 27 Mar 2026 13:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774616482;
	bh=PwnNb0pQjR9jZ3vJL0puyCjiPOXJLaR8FU0epCCREF4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LB4opcidM9ORtf9hp20k4phhg43fiOTM4TvjsQ3MpAkiNLPnQo9emYUrj70moZHhW
	 COaT7D04kPH3sX8TO89iTmQzGS9rBtfDW2xE+5KfR5KxmrbYG/XAzZOm5PB6ZsgbAZ
	 9KNAD8NOKP2TfjytorS8169plGRLgXWXE0K5k1c7kbBD4FSqCp4opGwj5acgvrK6+h
	 Uua3sEbzMMO7SsnrDr3oSGcDbYxVYlcxk5hnXsE2njGsojiAhJpV3jFcQzlTIvej/i
	 ECuYQZhBgPcnW4LXQXO1CTMieaHBIPHWAxUWfzbDKaA1rlDDsxf+gg7goLFL8bKxZL
	 wrDUdK2PoYs8g==
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
Subject: [PATCH v4 3/3] KVM: arm64: Don't pass host_debug_state to BRBE world-switch routines
Date: Fri, 27 Mar 2026 13:00:46 +0000
Message-ID: <20260327130047.21065-4-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260327130047.21065-1-will@kernel.org>
References: <20260327130047.21065-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_060122_994627_F0C27FA2 
X-CRM114-Status: GOOD (  11.92  )
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
 arch/arm64/kvm/hyp/nvhe/debug-sr.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/debug-sr.c b/arch/arm64/kvm/hyp/nvhe/debug-sr.c
index 84bc80f4e36b..f8904391c125 100644
--- a/arch/arm64/kvm/hyp/nvhe/debug-sr.c
+++ b/arch/arm64/kvm/hyp/nvhe/debug-sr.c
@@ -156,8 +156,10 @@ static void __trace_switch_to_host(void)
 			  *host_data_ptr(host_debug_state.trfcr_el1));
 }
 
-static void __debug_save_brbe(u64 *brbcr_el1)
+static void __debug_save_brbe(void)
 {
+	u64 *brbcr_el1 = host_data_ptr(host_debug_state.brbcr_el1);
+
 	*brbcr_el1 = 0;
 
 	/* Check if the BRBE is enabled */
@@ -173,8 +175,10 @@ static void __debug_save_brbe(u64 *brbcr_el1)
 	write_sysreg_el1(0, SYS_BRBCR);
 }
 
-static void __debug_restore_brbe(u64 brbcr_el1)
+static void __debug_restore_brbe(void)
 {
+	u64 brbcr_el1 = *host_data_ptr(host_debug_state.brbcr_el1);
+
 	if (!brbcr_el1)
 		return;
 
@@ -190,7 +194,7 @@ void __debug_save_host_buffers_nvhe(struct kvm_vcpu *vcpu)
 
 	/* Disable BRBE branch records */
 	if (host_data_test_flag(HAS_BRBE))
-		__debug_save_brbe(host_data_ptr(host_debug_state.brbcr_el1));
+		__debug_save_brbe();
 
 	if (__trace_needs_switch())
 		__trace_switch_to_guest();
@@ -206,7 +210,7 @@ void __debug_restore_host_buffers_nvhe(struct kvm_vcpu *vcpu)
 	if (host_data_test_flag(HAS_SPE))
 		__debug_restore_spe();
 	if (host_data_test_flag(HAS_BRBE))
-		__debug_restore_brbe(*host_data_ptr(host_debug_state.brbcr_el1));
+		__debug_restore_brbe();
 	if (__trace_needs_switch())
 		__trace_switch_to_host();
 }
-- 
2.53.0.1018.g2bb0e51243-goog


