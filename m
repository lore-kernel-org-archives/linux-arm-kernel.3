Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED95D116EA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 10:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3EyhFlD3M23wjn/whMfnvslG4gPHyr7luIO7PKb4Byo=; b=XsLI3lWwGcLKTVEc2389JtCM8c
	8Z7BQ8ulFUi/mKONtg2nhTa4GwudywJKuUqf3XK/JQQ3Cca6sYYAYdIjZqVkFcU2m/5LcLUAa8wed
	g5xsvTAClX0h0d/uBSt5txQxAv3psFVcbuQAn7UX7+D0bZqolz0isAv8N0Yr6ww3UkzCi8WeR9hkt
	CRXCtXr1121ios18vlGTQZTpHin8bnc5mwMaeyZAsaREjFguvEK9oB8yX6tMEoYMGp1k+suDGpFBN
	ALZqwEP4OjEQWNROd3t+7WiQazUOUZGglTg5r5XcgaRne5SoFaOBTVmj15OckAGlsSbh3DLr+YMYv
	xvh0Qnmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOvQv-00000000GaX-0fLn;
	Fri, 28 Nov 2025 10:10:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOvQs-00000000GZi-3tOy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 10:10:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 82EB9176A;
	Fri, 28 Nov 2025 02:10:21 -0800 (PST)
Received: from e140010.arm.com (unknown [10.57.90.76])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 216383F73B;
	Fri, 28 Nov 2025 02:10:18 -0800 (PST)
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	yuzenghui@huawei.com,
	suzuki.poulose@arm.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Subject: [PATCH 2/4] KVM: arm64: at: Use correct HA bit in TCR_EL2 when regime is EL2
Date: Fri, 28 Nov 2025 10:09:44 +0000
Message-ID: <20251128100946.74210-3-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251128100946.74210-1-alexandru.elisei@arm.com>
References: <20251128100946.74210-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_021031_004537_8E0DD722 
X-CRM114-Status: GOOD (  10.02  )
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

According to ARM DDI 0487L.b, the HA bit in TCR_EL2 when the translation
regime is EL2 (or !ELIsInHost(EL2)) is bit 21, not 39.

Fixes: c59ca4b5b0c3 ("KVM: arm64: Implement HW access flag management in stage-1 SW PTW")
Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 arch/arm64/include/asm/kvm_arm.h | 1 +
 arch/arm64/kvm/at.c              | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_arm.h b/arch/arm64/include/asm/kvm_arm.h
index 1da290aeedce..e500600e4b9b 100644
--- a/arch/arm64/include/asm/kvm_arm.h
+++ b/arch/arm64/include/asm/kvm_arm.h
@@ -111,6 +111,7 @@
 #define TCR_EL2_DS		(1UL << 32)
 #define TCR_EL2_RES1		((1U << 31) | (1 << 23))
 #define TCR_EL2_HPD		(1 << 24)
+#define TCR_EL2_HA		(1 << 21)
 #define TCR_EL2_TBI		(1 << 20)
 #define TCR_EL2_PS_SHIFT	16
 #define TCR_EL2_PS_MASK		(7 << TCR_EL2_PS_SHIFT)
diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index d25fef0f66e2..6d41a95f6c60 100644
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@ -346,7 +346,9 @@ static int setup_s1_walk(struct kvm_vcpu *vcpu, struct s1_walk_info *wi,
 
 	wi->baddr &= GENMASK_ULL(wi->max_oa_bits - 1, x);
 
-	wi->ha = tcr & TCR_HA;
+	wi->ha = (wi->regime == TR_EL2 ?
+		  FIELD_GET(TCR_EL2_HA, tcr) :
+		  FIELD_GET(TCR_HA, tcr));
 
 	return 0;
 
-- 
2.43.0


