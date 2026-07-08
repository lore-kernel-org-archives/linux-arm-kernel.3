Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC1BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 14:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tJvkWmMCZw4+Q94DJgPkkjGsAqUnTgkBD2aW/HV3vDw=; b=IaPAdZv/D+kVyOYjiDlbRx6y0G
	/GlFe3idUB7avEh/YOaaXYyBPOP98sGXEaOcpR4RxuqHGb055YDW7GUGeH6fHaInYHb0isIidf/FJ
	PmeJB9+nsgCPdLMmMH0HnVp0R2EJxOmmphUqHyPwHnpQKezkgs9tVsso5lsI4mimJpTTE4zqN3mwF
	VwrG2LFhniS8fkCHcE3K2Y1CSsqx4+wgIoQgLEHfvPZ28VWZs/mnWf/OFjluH8pOGkpthWENdBHBv
	o1bgNN/co60ftq2pxh9WJB7IzEJ/RjOgKzA+2Db5fSjPJ/5+2Jj3qprDL4wIFj4V91R7/K8+VAdry
	qM2fGfaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whTVW-0000000HNQO-1FAa;
	Wed, 08 Jul 2026 14:44:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whTVT-0000000HNOW-3aZY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 14:44:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C03091CDD;
	Wed,  8 Jul 2026 07:44:06 -0700 (PDT)
Received: from a079125.blr.arm.com (a079125.arm.com [10.164.21.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3F99E3F7B4;
	Wed,  8 Jul 2026 07:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783521851; bh=kjnZjOq+RtvVG2hcTHukAT6MqEUW3lbPzlZiIiqamXI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hNbaSHlQsAKrannmLmVNYMBeOwIV1LOXksUyJTwJNTg4t+UgkX2swJvTrYPdTOCNs
	 MkSCpuViyagywpQPIE6DM0FpfDB+/A7D0M/GcCScfn/rAMskHcz1bspN4tTATltDEF
	 vlhjfq1jd5ZirYQklgvf/6BgXl531BJX6hskniVY=
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
Subject: [PATCH v2 3/6] arm64: cpufeature: Extend bbml2_noabort support list
Date: Wed,  8 Jul 2026 20:13:28 +0530
Message-ID: <20260708144331.679816-4-linu.cherian@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708144331.679816-1-linu.cherian@arm.com>
References: <20260708144331.679816-1-linu.cherian@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_074411_941814_A7B6DA55 
X-CRM114-Status: UNSURE (   8.42  )
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
 arch/arm64/kernel/cpufeature.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 9a22df0c5120..adcabea80fcb 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2152,6 +2152,15 @@ bool cpu_supports_bbml2_noabort(void)
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
+		MIDR_REV_RANGE(MIDR_C1_ULTRA, 1, 1, 0xf),
+		MIDR_REV_RANGE(MIDR_C1_PREMIUM, 1, 1, 0xf),
 		{}
 	};
 
-- 
2.43.0


