Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BFE8C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 16:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I1glEjn3Vicew24sw+6aw3oZ6QxHJJbj38sCRZ1pUms=; b=JQeHRO+I6DMVHYG4WvnrnSeIXI
	7zygdo3Nzb4sAPf7ebdA9cQl4hYqKqlyl+ySzdT4LxyGytuh2CNuD1CZGgdVzK3y99Lv+ZWqDLTYn
	EEj42aAva8NopGG5R4mXxy6UD1g5+rrR9t38+qZE36Xc4Ukipu1zYoxW8kByCIgf0iCrYvIuXL2UF
	PVEeSmQiLMWnv5y/11W18Nc3s+L8xDtn8t08H+4TYMynNKzEDBLdlVBaJ8xa/iiHkII4o07QW2kvY
	e78GnLsXQZR2UW+O1+aXG1gI6ctVE46DWpTxFtDUC28ZzJrLp/Na0tLxux+/14ipsz5qEsjvRo+Yt
	nEvwIiXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x29yd-000000006lZ-1LJ0;
	Thu, 03 Sep 2026 16:07:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x29yQ-00000000674-3TkO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 16:07:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 278391F60;
	Thu,  3 Sep 2026 09:07:30 -0700 (PDT)
Received: from e140010.cambridge.arm.com (e140010.arm.com [10.2.213.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1DD4F3F673;
	Thu,  3 Sep 2026 09:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788451653; bh=U+rws8ncwi/1wkVpb63POq0o8EKKy0KoxPOz8nkpieE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Liev/w0Iu/6EmrygmtTnUunzJIhWUHrQ2R5os86hWdDuXxaUMjtKdfi/IPYqwTiOp
	 agQw37H3yDq+Jzydau7AEG78scr7kUz5Rv94aLD3/+/rWZ1S5NTRM+w8UKsRfgJjnV
	 zcJwwxxnHKgNAz2zAPLlUSwKSiUuOEBqPbs4lq1I=
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
Subject: [RFC PATCH v7 28/28] KVM: arm64: Allow the creation of a SPE enabled VM
Date: Thu,  3 Sep 2026 17:06:23 +0100
Message-ID: <20260903160623.315525-29-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903160623.315525-1-alexandru.elisei@arm.com>
References: <20260903160623.315525-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_090734_935047_5927F373 
X-CRM114-Status: GOOD (  11.06  )
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

Everything is in place, allow userspace to enable SPE for a virtual
machine.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 arch/arm64/include/asm/kvm_host.h | 2 +-
 arch/arm64/kvm/Kconfig            | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index ff77f6ac3adf..32b30ffdcf77 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -40,7 +40,7 @@
 
 #define KVM_MAX_VCPUS VGIC_V3_MAX_CPUS
 
-#define KVM_VCPU_MAX_FEATURES 10
+#define KVM_VCPU_MAX_FEATURES 11
 #define KVM_VCPU_VALID_FEATURES	(BIT(KVM_VCPU_MAX_FEATURES) - 1)
 
 #define KVM_REQ_SLEEP \
diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
index 2bc8e34c538d..a285b18eb1cc 100644
--- a/arch/arm64/kvm/Kconfig
+++ b/arch/arm64/kvm/Kconfig
@@ -106,9 +106,9 @@ endif # NVHE_EL2_DEBUG
 
 
 config KVM_ARM_SPE
-	bool
+	bool "Support SPE in guest"
 	depends on KVM && ARM_SPE_PMU
-	default n
+	default y
 	help
 	  Adds support for Statistical Profiling Extension (SPE) in virtual
 	  machines.
-- 
2.43.0


