Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB01CD8CA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 10:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DBExo35kVAhTgBDgBLcpNG1azzDJ2+8gwo4xe9LiNUo=; b=nE/WramjpVOKkDlx3X86BY7aX5
	FmkOoWIsxA1kYRHzCpdYD2LdnBGbpNj9Wo+C4negOwIcPi4l13u7WPBwGlVQiqiBYLAhePy2XblMK
	w9X1ZO1I3MAoa7pkaHuX0rkRCeDS/XAkqOdhyS47IwQBIQM2YQke2qY91xb3XeMgf4ARar/q4oSej
	3xtpFJkAn5AuRxHAQEE62eU18HO18lqBwxnODC/hEpnbLkmhhimLju0Rdn6wq3iH2DwfnjeOw6XUD
	Kzx5GEE3Gs1gzz/K82ZwV5ZKhOb/r0WNpICm0drR104AN6WhdOXTdEGhb4/byfprQB0eNcREBJ8ga
	TFYLhjPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWtRt-00000005JPo-1Jqi;
	Tue, 09 Jun 2026 10:12:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWtRn-00000005JML-1P2h
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 10:12:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 35EC32681;
	Tue,  9 Jun 2026 03:12:33 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3C1E03FDBD;
	Tue,  9 Jun 2026 03:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780999958; bh=K85VRd7iHvlD2uM2Bemj/TDFiVHLkpRfamulvwZPKRQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O9/V2Xh3fsSggwns9g3v8EaBralqBeZ+49Ycp3ngiB502lpXWu0BhmvcAHjtA7o1a
	 NubGtRrAdHVvMl3/qAnHyhx9mQryZcK9bZeNsqH+W+xDY5xrB5bYa+A+bFKmiSJ8ZW
	 pT/FCy/LCa7OKq2P1yHvjzeWVYg4fBSv8pE9ez4o=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	mark.rutland@arm.com,
	will@kernel.org
Subject: [PATCH 1/3] arm64: cputype: Add C1-Ultra definitions
Date: Tue,  9 Jun 2026 11:12:01 +0100
Message-Id: <20260609101203.1512409-2-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260609101203.1512409-1-mark.rutland@arm.com>
References: <20260609101203.1512409-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_031239_417915_B99117B9 
X-CRM114-Status: UNSURE (   9.47  )
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

Add cputype definitions for C1-Ultra. These will be used for errata
detection in subsequent patches.

These values can be found in the C1-Ultra TRM:

  https://developer.arm.com/documentation/108014/0100/

... in section A.5.1 ("MIDR_EL1, Main ID Register").

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/cputype.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/include/asm/cputype.h b/arch/arm64/include/asm/cputype.h
index 7b518e81dd15b..3e223a7781866 100644
--- a/arch/arm64/include/asm/cputype.h
+++ b/arch/arm64/include/asm/cputype.h
@@ -97,6 +97,7 @@
 #define ARM_CPU_PART_CORTEX_X925	0xD85
 #define ARM_CPU_PART_CORTEX_A725	0xD87
 #define ARM_CPU_PART_CORTEX_A720AE	0xD89
+#define ARM_CPU_PART_C1_ULTRA		0xD8C
 #define ARM_CPU_PART_NEOVERSE_N3	0xD8E
 #define ARM_CPU_PART_C1_PRO		0xD8B
 
@@ -189,6 +190,7 @@
 #define MIDR_CORTEX_X925 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_X925)
 #define MIDR_CORTEX_A725 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A725)
 #define MIDR_CORTEX_A720AE MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A720AE)
+#define MIDR_C1_ULTRA MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_C1_ULTRA)
 #define MIDR_NEOVERSE_N3 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_NEOVERSE_N3)
 #define MIDR_C1_PRO MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_C1_PRO)
 #define MIDR_THUNDERX	MIDR_CPU_MODEL(ARM_CPU_IMP_CAVIUM, CAVIUM_CPU_PART_THUNDERX)
-- 
2.30.2


