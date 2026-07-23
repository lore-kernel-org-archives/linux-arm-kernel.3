Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B4EC4452B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 04:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OKPKliFy8b8vCs5hVCXGr0n+jeLXnyrKWF1uS40Z9hg=; b=qs+BxKBv55+dSv22oriyQVth/e
	1eNdGy2bF5DodQFmyVz/ks+/9r6fzMl8XEQOMtQv7YKsPdjTvtHDB+XheYnchteJv10WPeKJjNTbr
	J29QqJj0Fj/9K1RwTdMqkdMYPYFmC9EOgrQ8l1bwBMuw/p//PHBOKEklSQauABm8PnNz+6f0IXzcH
	3UoH/r01b9VdpIPotq+hWuce/7zdxBx1KvUieuubo84FVDbRZ4TjO0GHHiLUElIZIwM9nxuu1ePCL
	l3YivPjqpJQMhcA2TGpJAPGt6jBDDWSvhMdBtxWf4sDxkW5I3mjGRr3O+CEnDpNuLqoTjzLrD6W/y
	lOwXjg5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmlG9-0000000DPKC-3jG9;
	Thu, 23 Jul 2026 04:42:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmlG4-0000000DPIX-3ktQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 04:42:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5841D176A;
	Wed, 22 Jul 2026 21:42:03 -0700 (PDT)
Received: from a079125.blr.arm.com (a079125.arm.com [10.164.21.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6DF8D3F86F;
	Wed, 22 Jul 2026 21:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784781727; bh=Ub/Ke7o/iRA0q/GkrV8jJkrBXNHgXSXE0eZydwfcJXU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q0hdzI030geCtsf21xEvlecHPw9moEwVzT7n7Tn+YFkn+g/2YpMMEVA/Hcev+ZIhJ
	 AFEmFdOjHUmEBMXMh8OI7e+ZKEbRYMEJRJiUVxorp8/UyWpuowHaGsfPCb8l12bVSp
	 cWP6fzfxDJHl1t3wUV1YTdBbG3Qd2IxLSGFejnEU=
From: Linu Cherian <linu.cherian@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Linu Cherian <linu.cherian@arm.com>,
	Gavin Shan <gshan@redhat.com>
Subject: [PATCH v4 3/6] arm64: cpufeature: Extend bbml2_noabort support list
Date: Thu, 23 Jul 2026 10:10:30 +0530
Message-ID: <20260723044034.2983651-4-linu.cherian@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723044034.2983651-1-linu.cherian@arm.com>
References: <20260723044034.2983651-1-linu.cherian@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_214209_030001_FEE27600 
X-CRM114-Status: UNSURE (   8.48  )
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

Add below cpus to the midr list, which supports
BBML2_NOABORT.

Cortex A520(AE)
Cortex A715
Cortex A720(AE)
Cortex A725
Neoverse N3
C1-Nano
C1-Pro
C1-Ultra
C1-Premium

C1-Ultra and C1-Premium both suffer from erratum 3683289,
where Break-Before-Make must be followed to avoid a livelock.
For both CPUs, the erratum is fixed from r1p1.
Hence we do not enable BBML2_NOABORT for CPU revisions <= r1p0.

The relevant SDENs are:
* C1-Ultra: https://developer.arm.com/documentation/111077/9-00/
* C1-Premium: https://developer.arm.com/documentation/111078/9-00/

Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
Signed-off-by: Linu Cherian <linu.cherian@arm.com>
---
 Documentation/arch/arm64/silicon-errata.rst |  4 ++++
 arch/arm64/kernel/cpufeature.c              | 10 ++++++++++
 2 files changed, 14 insertions(+)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index 014aa1c215a1..57c778446936 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -242,10 +242,14 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Neoverse-V3AE   | #4193784        | ARM64_ERRATUM_4118414       |
 +----------------+-----------------+-----------------+-----------------------------+
+| ARM            | C1-Premium      | #3683289        | N/A                         |
++----------------+-----------------+-----------------+-----------------------------+
 | ARM            | C1-Premium      | #4193780        | ARM64_ERRATUM_4118414       |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | C1-Pro          | #4193714        | ARM64_ERRATUM_4193714       |
 +----------------+-----------------+-----------------+-----------------------------+
+| ARM            | C1-Ultra        | #3683289        | N/A                         |
++----------------+-----------------+-----------------+-----------------------------+
 | ARM            | C1-Ultra        | #4193780        | ARM64_ERRATUM_4118414       |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | MMU-500         | #562869,        | ARM_SMMU_MMU_500_CPRE_ERRATA|
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 9a22df0c5120..98d2cfc2dc90 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2152,6 +2152,16 @@ bool cpu_supports_bbml2_noabort(void)
 		MIDR_ALL_VERSIONS(MIDR_NVIDIA_OLYMPUS),
 		MIDR_ALL_VERSIONS(MIDR_AMPERE1),
 		MIDR_ALL_VERSIONS(MIDR_AMPERE1A),
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_A520AE),
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_A715),
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_A720AE),
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_A725),
+		MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N3),
+		MIDR_ALL_VERSIONS(MIDR_C1_NANO),
+		MIDR_ALL_VERSIONS(MIDR_C1_PRO),
+		/* Erratum 3683289 fixed in r1p1 */
+		MIDR_RANGE(MIDR_C1_ULTRA, 1, 1, 0xf, 0xf),
+		MIDR_RANGE(MIDR_C1_PREMIUM, 1, 1, 0xf, 0xf),
 		{}
 	};
 
-- 
2.43.0


