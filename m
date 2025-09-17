Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4976CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 14:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6cTDt7/pvvSQDG/mqt6OVOO1THqIEchYEguo+kT8474=; b=JEVSyaut1GLyoOTPN5ocqTPlhz
	0OWhG4oVux2ZaMceaNt79OkFDjXoJVmlZ7ukUWfY2bAO+awXMZFiK6Vrbd86RgzkwActrkhK4zJ5A
	WbStSvwKt+hshZqzJRspZWb0U7ji7OMZrG0NWXHn9IxOgLwTNZL4VyAM6wPRzlKDV9ngeofKt9hnC
	gGPzCwtkA7zGsQDHUTGwrYqbnNqe/RP87whBAwb4stU5vAZtWVCla0hd+U4eaOSRi59/89dKtnfeD
	yo8AWZ09YFRQLCa1Eyj9atz/ntYCQ89u+0CGUkkBYb7010OUEUB3HkXI+rajKqK2VXVSAailU0MfW
	h0LnOFBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uytaZ-0000000CShn-3gpK;
	Wed, 17 Sep 2025 14:56:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uytaR-0000000CSZE-36tc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 14:56:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E05F3267F;
	Wed, 17 Sep 2025 07:56:38 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 98C6C3F66E;
	Wed, 17 Sep 2025 07:56:43 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	broonie@kernel.org,
	oliver.upton@linux.dev,
	anshuman.khandual@arm.com,
	robh@kernel.org,
	james.morse@arm.com,
	mark.rutland@arm.com,
	joey.gouly@arm.com,
	Dave.Martin@arm.com,
	ahmed.genidi@arm.com,
	kevin.brodsky@arm.com,
	scott@os.amperecomputing.com,
	mbenes@suse.cz,
	james.clark@linaro.org,
	frederic@kernel.org,
	rafael@kernel.org,
	pavel@kernel.org,
	ryan.roberts@arm.com,
	suzuki.poulose@arm.com,
	maz@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v5 6/6] docs: arm64: Document booting requirements for FEAT_SCTLR2
Date: Wed, 17 Sep 2025 15:56:18 +0100
Message-Id: <20250917145618.1232329-7-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250917145618.1232329-1-yeoreum.yun@arm.com>
References: <20250917145618.1232329-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_075647_826649_17001CF2 
X-CRM114-Status: UNSURE (   9.83  )
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

From: Dave Martin <Dave.Martin@arm.com>

Support for FEAT_SCTLR2 imposes some requirments on the configuration
of traps at exception levels above the level at which the kernel is
booted.

Document them.

For now, don't document requirements on the initial state of SCTLR2_ELx
at the kernel boot exception level.  The general wording under "System
registers" appiles.  (SCTLR_ELx is similarly undocumented.)

Signed-off-by: Dave Martin <Dave.Martin@arm.com>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 Documentation/arch/arm64/booting.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/arch/arm64/booting.rst
index 2f666a7c303c..e8fe1b2023a9 100644
--- a/Documentation/arch/arm64/booting.rst
+++ b/Documentation/arch/arm64/booting.rst
@@ -545,6 +545,16 @@ Before jumping into the kernel, the following conditions must be met:
 
    - MDCR_EL3.TPM (bit 6) must be initialized to 0b0
 
+  For CPUs with the SCTLR2_ELx registers (FEAT_SCTLR2):
+
+  - If EL3 is present:
+
+    - SCR_EL3.SCTLR2En (bit 44) must be initialised to 0b1.
+
+  - If the kernel is entered at EL1 and EL2 is present:
+
+    - HCRX_EL2.SCTLR2En (bit 15) must be initialised to 0b1.
+
 The requirements described above for CPU mode, caches, MMUs, architected
 timers, coherency and system registers apply to all CPUs.  All CPUs must
 enter the kernel in the same exception level.  Where the values documented
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


