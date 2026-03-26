Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB5AD10A62DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 14:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rqog5MfkKQeGmcCN10CIsegGgEw99YLjHXah1EGevUE=; b=2Hp/eNU8YXf2XeQemDAMfBePGd
	qvILK5pFI2GwOk1fRVL26Tv9CB8p8XAtbtSQK3X56VD2gY0FyYmwh+lE0mvNxeUpbRgj76yre8LEt
	IJDDnhsOeBvNB/6/BzqGCKtOKFbI+qfsUCY92Mc4XmSnFWpI1QRoWixrJeE2MfhxAzAm0UR3KEmlp
	JDk30H06j5S0n6yuJq0FkSMfUKa7yuw/9MU1jH3TdwcSiuNDKsFhAkwousVqnPRJlFZQ88B9FpziE
	kwYdW0miKdLhI7PDXD5x6xKZ7/V5AZ/moM4UvPqJsPz65oY+iLKdsPBU8n+Oonz2oOg/h6dL+K6YE
	+XnjslQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5lRr-00000005cEs-46Xt;
	Thu, 26 Mar 2026 14:12:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5lRm-00000005cDS-3rFX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 14:12:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9F733403D9;
	Thu, 26 Mar 2026 14:12:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F5CFC116C6;
	Thu, 26 Mar 2026 14:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774534350;
	bh=StaDbNBzF2YpHyypvAqrXBhu70KT7B2dbT9ZMMYZa9Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jNLAs4NSIz9eXn2I4JWari9HKyf1CIYDNU2v+Sxvfyjz/CYY16GXTNLnW9+P8N+4c
	 S/tTV3STo1aDwv0RVpmS2UhCZVlTSj8Mk4cb4hOEtRnuPZo/AcWbiz8iWoWp6YBN7X
	 W9+HU+WXuUhlm9yQ4D04q62KiSDViqZfFozlj3KPyXBuwMYlH9vY8WzBog/7pFgBXq
	 XJ/NdH3sxJVJxZU3J75riQy2bdLbrS3BhZSYEQPtwqLg3D/Dwpk4sig4dHRV2/Oc9R
	 hWuMfB3/J8rF+AQiuv4fab1UGqHF/eRWgKnDHOs327KJerxnYRWrjqD0cN9EvM5DbW
	 MRsmHuCUEUk1Q==
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
Subject: [PATCH v3 3/3] KVM: arm64: Don't pass host_debug_state to BRBE world-switch routines
Date: Thu, 26 Mar 2026 14:12:13 +0000
Message-ID: <20260326141214.18990-4-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260326141214.18990-1-will@kernel.org>
References: <20260326141214.18990-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_071230_975100_E909877F 
X-CRM114-Status: GOOD (  12.33  )
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
Tested-by: Fuad Tabba <tabba@google.com>
Reviewed-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kvm/hyp/nvhe/debug-sr.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/debug-sr.c b/arch/arm64/kvm/hyp/nvhe/debug-sr.c
index 84bc80f4e36b..50413171bd1a 100644
--- a/arch/arm64/kvm/hyp/nvhe/debug-sr.c
+++ b/arch/arm64/kvm/hyp/nvhe/debug-sr.c
@@ -156,9 +156,9 @@ static void __trace_switch_to_host(void)
 			  *host_data_ptr(host_debug_state.trfcr_el1));
 }
 
-static void __debug_save_brbe(u64 *brbcr_el1)
+static void __debug_save_brbe(void)
 {
-	*brbcr_el1 = 0;
+	u64 *brbcr_el1 = host_data_ptr(host_debug_state.brbcr_el1);
 
 	/* Check if the BRBE is enabled */
 	if (!(read_sysreg_el1(SYS_BRBCR) & (BRBCR_ELx_E0BRE | BRBCR_ELx_ExBRE)))
@@ -173,8 +173,10 @@ static void __debug_save_brbe(u64 *brbcr_el1)
 	write_sysreg_el1(0, SYS_BRBCR);
 }
 
-static void __debug_restore_brbe(u64 brbcr_el1)
+static void __debug_restore_brbe(void)
 {
+	u64 brbcr_el1 = *host_data_ptr(host_debug_state.brbcr_el1);
+
 	if (!brbcr_el1)
 		return;
 
@@ -190,7 +192,7 @@ void __debug_save_host_buffers_nvhe(struct kvm_vcpu *vcpu)
 
 	/* Disable BRBE branch records */
 	if (host_data_test_flag(HAS_BRBE))
-		__debug_save_brbe(host_data_ptr(host_debug_state.brbcr_el1));
+		__debug_save_brbe();
 
 	if (__trace_needs_switch())
 		__trace_switch_to_guest();
@@ -206,7 +208,7 @@ void __debug_restore_host_buffers_nvhe(struct kvm_vcpu *vcpu)
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


