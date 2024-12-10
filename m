Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 591C2E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 06:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PlEbWrhhl7dDGAz5xqWy/Ql8EDfe3uqhKvhXYi5+AX4=; b=NaWEiMLnSoCaFaURB9c0zmh8MG
	YgTGxYuhKNuRuPJKng/aojvu+37b/ZpN5txH0Y7/lqJBPppHRyY7IjUXLI+uOAGBFyOF2ITYtFKWq
	PLR2Eq27cN5hLNZGjmfne8u05JQhDOy/wUUGiavZn26VKHezzhE89ujHqETalZuDX85FIowtbX/zK
	F2Cl67+ZQIY5TZC0zrIs19OJNmhaVFge2Iyv0u3XhwcmJfNrZVuXEZa/tSRpuNU3/nbhDLg8Fa1LH
	Xfj5QtSHAd676s5cP8lsi3/++EOPMUDeiczbkE2i429slUgAn9Zrk2vBJbDOp/mUVZXNq13Ij2BLc
	zdOH4WGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKtb8-0000000AOjr-22lQ;
	Tue, 10 Dec 2024 06:19:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKtDZ-0000000AKEq-39i9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 05:55:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7788E113E;
	Mon,  9 Dec 2024 21:56:01 -0800 (PST)
Received: from a077893.arm.com (unknown [10.163.48.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D76293F58B;
	Mon,  9 Dec 2024 21:55:29 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	maz@kernel.org
Cc: ryan.roberts@arm.com,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH V2 24/46] arm64/sysreg: Add register fields for SPMCR_EL0
Date: Tue, 10 Dec 2024 11:22:49 +0530
Message-Id: <20241210055311.780688-25-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241210055311.780688-1-anshuman.khandual@arm.com>
References: <20241210055311.780688-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_215533_830438_3ACE1754 
X-CRM114-Status: UNSURE (   6.88  )
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

This adds register fields for SPMCR_EL0 as per the definitions based
on DDI0601 2024-09.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/tools/sysreg | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 7db912a81bbd..34323fe73188 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -165,6 +165,19 @@ Sysreg	PMCCNTSVR_EL1	2	0	14	11	7
 Field	63:0	CCNT
 EndSysreg
 
+Sysreg	SPMCR_EL0	2	3	9	12	0
+Res0	63:12
+Field	11	TR0
+Field	10	HDBG
+Field	9	FZ0
+Field	8	NA
+Res0	7:5
+Field	4	EX
+Res0	3:2
+Field	1	P
+Field	0	E
+EndSysreg
+
 Sysreg	SPMSCR_EL1	2	7	9	14	7
 Field	63:32	IMP_DEF
 Field	31	RAO
-- 
2.25.1


