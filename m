Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D45C44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 05:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y+lZgAAesZMWTzy3gYy82mO3ksFiDdoXTNTHRkB30ks=; b=waILFOy4xae52fFp5qFqyjRfEl
	/OvRrR+xcjUD8TZENtVI13NrIEA+wPqm4B5p5PVvRUElDJhAgyvGftkGQwOBTvE6241CXroIB81WY
	mxwaNqPD/J+cK9cvnB92J1eN7mQ0GgKjgFWpQySwzOXUEnI/qiVjZZjKamtd8f7cFW8eStApwlLQp
	T5rgzAcJxmfSuqQA/fF0QZ1CIJJCC+jft53yG3sFY4QljkF/aK4vTgQQEap/pYItRMlUhoTQbmKdB
	Xt5fhU+FdrPllQDjJfQb5EfDVUJVJQUpjNnD7HtqcDGcPuhWWzzgJI1TzPtgQ1r1Gji94JrSMxudP
	Lh3GqLRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjsGf-0000000DoIa-2n3K;
	Wed, 15 Jul 2026 05:34:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjsGZ-0000000DoFR-2UOy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 05:34:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EB0AD339;
	Tue, 14 Jul 2026 22:34:37 -0700 (PDT)
Received: from a079125.blr.arm.com (a079125.arm.com [10.164.21.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 51B653F915;
	Tue, 14 Jul 2026 22:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784093682; bh=N7dBfVaI7343acB0SSAtsxc3PMX1dKExbRDxnREghp8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bl0S0hqs9IXXWEHjjCVDLxRM8UWFJU6CjYBItjLLAwKtip/UTC3HUWo4NWPBawb2h
	 0zybto25wB65R7tUiRHUdLwroi6BFRLXKE8OxlvLti+p2l5I1GgpHwgFGHBeME8Zje
	 ehoR1W3FEdx4hAaMh3xS4VpsOyzxY+tN3tDJi6QE=
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
	Linu Cherian <linu.cherian@arm.com>
Subject: [PATCH v3 3/6] arm64: cpufeature: Extend bbml2_noabort support list
Date: Wed, 15 Jul 2026 11:04:05 +0530
Message-ID: <20260715053408.1950475-4-linu.cherian@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715053408.1950475-1-linu.cherian@arm.com>
References: <20260715053408.1950475-1-linu.cherian@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_223443_723723_B7965E57 
X-CRM114-Status: UNSURE (   8.56  )
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
index 9a22df0c5120..1b804b6c4fe0 100644
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
+		MIDR_REV_RANGE(MIDR_C1_ULTRA, 1, 1, 0xf),
+		MIDR_REV_RANGE(MIDR_C1_PREMIUM, 1, 1, 0xf),
 		{}
 	};
 
-- 
2.43.0


