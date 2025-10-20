Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DF1FCCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 09:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zddQqNi5k9UbRRT8pvkR3McLTmkSnyuPatfHU2rGKQo=; b=SthTQR6NKvzxZzpRxC4oimCv/X
	HUd7c6AVPKODENDtjYpna0EvaEFg5iW/ULD87zeYoXiAfSbl4ZaLMdXatP7dozgXxzdNBAIIk9jPq
	V1gsfw7EQKcicxZeZFXSZkxCvAe+j1AYI0GKctlzFsED/JRo5G4C5MOTgPhMIrZIGzoOwGbYoAbJr
	HHObDy2X2pRB/1PB0t7Q3YGCtzBusNnEysmDWt7Io8+wmTcCqG0DcPz0pFvSJimfFe4KuDSiRNIor
	DdznvUjjR+Cwj4KcpSDv+sOzAMo22BXhJZHqUWRis4pxtjcOo7BbiYgjkqLmGUdEAHhYUrC9Qkt2s
	+vHoGD8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmJq-0000000Cc6b-2TbB;
	Mon, 20 Oct 2025 09:36:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmJm-0000000Cc3d-2u7V
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 09:36:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E210E22C7;
	Mon, 20 Oct 2025 02:36:33 -0700 (PDT)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B857C3F66E;
	Mon, 20 Oct 2025 02:36:40 -0700 (PDT)
From: Ryan Roberts <ryan.roberts@arm.com>
To: stable@vger.kernel.org
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	James Morse <james.morse@arm.com>
Subject: [RESEND PATCH 6.16-6.17 2/2] arm64: errata: Apply workarounds for Neoverse-V3AE
Date: Mon, 20 Oct 2025 10:36:26 +0100
Message-ID: <20251020093628.592682-3-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251020093628.592682-1-ryan.roberts@arm.com>
References: <20251020093628.592682-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_023642_777658_B004EBCE 
X-CRM114-Status: UNSURE (   9.35  )
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

From: Mark Rutland <mark.rutland@arm.com>

[ Upstream commit 0c33aa1804d101c11ba1992504f17a42233f0e11 ]

Neoverse-V3AE is also affected by erratum #3312417, as described in its
Software Developer Errata Notice (SDEN) document:

  Neoverse V3AE (MP172) SDEN v9.0, erratum 3312417
  https://developer.arm.com/documentation/SDEN-2615521/9-0/

Enable the workaround for Neoverse-V3AE, and document this.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: James Morse <james.morse@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
Signed-off-by: Will Deacon <will@kernel.org>
[ Ryan: Trivial backport ]
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 Documentation/arch/arm64/silicon-errata.rst | 2 ++
 arch/arm64/Kconfig                          | 1 +
 arch/arm64/kernel/cpu_errata.c              | 1 +
 3 files changed, 4 insertions(+)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index b18ef4064bc0..a7ec57060f64 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -200,6 +200,8 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Neoverse-V3     | #3312417        | ARM64_ERRATUM_3194386       |
 +----------------+-----------------+-----------------+-----------------------------+
+| ARM            | Neoverse-V3AE   | #3312417        | ARM64_ERRATUM_3194386       |
++----------------+-----------------+-----------------+-----------------------------+
 | ARM            | MMU-500         | #841119,826419  | ARM_SMMU_MMU_500_CPRE_ERRATA|
 |                |                 | #562869,1047329 |                             |
 +----------------+-----------------+-----------------+-----------------------------+
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 393d71124f5d..1503b78f8611 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1137,6 +1137,7 @@ config ARM64_ERRATUM_3194386
 	  * ARM Neoverse-V1 erratum 3324341
 	  * ARM Neoverse V2 erratum 3324336
 	  * ARM Neoverse-V3 erratum 3312417
+	  * ARM Neoverse-V3AE erratum 3312417

 	  On affected cores "MSR SSBS, #0" instructions may not affect
 	  subsequent speculative instructions, which may permit unexepected
diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
index 59d723c9ab8f..21f86c160aab 100644
--- a/arch/arm64/kernel/cpu_errata.c
+++ b/arch/arm64/kernel/cpu_errata.c
@@ -545,6 +545,7 @@ static const struct midr_range erratum_spec_ssbs_list[] = {
 	MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V1),
 	MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V2),
 	MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V3),
+	MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V3AE),
 	{}
 };
 #endif
--
2.43.0


