Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A210ACE8D4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 16:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Td+29bAsiPGDtSyd4ftr4bBPzaVx1IbBnZ4QdMKmOY=; b=pBT4+I7yyqeMfYrmgqfsqB8qma
	tBkyjqLj2lShi3/nqPKz4sb/QM74JPPeHMClVsvFiEpGbBnQPIQTOmE1UdVcwHjssYFEWmPCiRozL
	zcjV49HCfsVsYPdYVYyz52x8PSAJmEAfkHF0SZLHCSgKe1P7TEXE8q1ZfpjbdnX0l8LhqxbrngQMc
	zz5BBdKXE6SNBgiC0Xx/G06ozApa3ZRB6NXQNN5knGwkaOu24GzqHlxHHnRNi0DVWcl4Z1sfYSVT1
	kTajXos1WzVp2g4UHueuf9HywwnppLVbGUUx5oSJZUTrqUsBh1mzUp1qLJjuy7vw+sobv5x8SJGYB
	SP3wQc2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwL0-0000000Cf1i-2aRl;
	Fri, 14 Nov 2025 16:07:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwKs-0000000CexM-2VQS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 16:07:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3F9EC1AC1;
	Fri, 14 Nov 2025 08:07:34 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B51F73F5A1;
	Fri, 14 Nov 2025 08:07:39 -0800 (PST)
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
Subject: [RFC PATCH v6 03/35] KVM: arm64: Add CONFIG_KVM_ARM_SPE Kconfig option
Date: Fri, 14 Nov 2025 16:06:44 +0000
Message-ID: <20251114160717.163230-4-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251114160717.163230-1-alexandru.elisei@arm.com>
References: <20251114160717.163230-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_080742_676382_D1826F9D 
X-CRM114-Status: UNSURE (   8.68  )
X-CRM114-Notice: Please train this message.
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

Add a new configuration option that will be used for KVM SPE emulation.
CONFIG_KVM_ARM_SPE depends on the SPE driver being builtin because:

1. The SPE driver maintains a cpumask of physical CPUs that support SPE,
   and that will be used by KVM to emulate SPE on heterogeneous systems.

2. KVM will rely on the SPE driver enabling the SPE interrupt at the GIC
   level.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 arch/arm64/kvm/Kconfig | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
index 4f803fd1c99a..31388b5b2655 100644
--- a/arch/arm64/kvm/Kconfig
+++ b/arch/arm64/kvm/Kconfig
@@ -83,4 +83,12 @@ config PTDUMP_STAGE2_DEBUGFS
 
 	  If in doubt, say N.
 
+config KVM_ARM_SPE
+	bool
+	depends on KVM && ARM_SPE_PMU=y
+	default n
+	help
+	  Adds support for Statistical Profiling Extension (SPE) in virtual
+	  machines.
+
 endif # VIRTUALIZATION
-- 
2.51.2


