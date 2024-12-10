Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4F3EE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 06:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c/bh+GPntvNhxZ64qx6RpCWUPgCcnkgb7PxlqD4UxHI=; b=1LaT+vSv5lrbic6N5tdXonpuT+
	BzsQqaNzL7wISVF6bgDpJP1auE9J0VzZ3WpaSIXhAFAp0kh1hgHIMfxu+dAyUttHTeBIxHyONC43B
	NLol9PyCeKXHQBzuJ6bJQr7tkF9g9s1ONHKZFaButWoHpV+trdTCxrXCwU89o6h1zq0MkKpOTOc/m
	SPjT9SjQdQvfgfsCqzarRbfr8Hxfs0PAt2TobQwGew1OMbZWkUrpE30JS2pGyTvc6/hI5i/87Lycr
	add2YpLYQy5YClLAFTxnWbjReDZXHMxrCoAAlopRahn6zJsEbbNW5o2Jnf5O0kCaQ4QaJp9ZzL3Xn
	OxF90MAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKtTw-0000000ANav-3BpS;
	Tue, 10 Dec 2024 06:12:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKtCl-0000000AK1A-1mCd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 05:54:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2A550113E;
	Mon,  9 Dec 2024 21:55:11 -0800 (PST)
Received: from a077893.arm.com (unknown [10.163.48.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 126B03F58B;
	Mon,  9 Dec 2024 21:54:38 -0800 (PST)
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
Subject: [PATCH V2 17/46] arm64/sysreg: Add register fields for PMECR_EL1
Date: Tue, 10 Dec 2024 11:22:42 +0530
Message-Id: <20241210055311.780688-18-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241210055311.780688-1-anshuman.khandual@arm.com>
References: <20241210055311.780688-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_215443_582315_FE6A36B9 
X-CRM114-Status: UNSURE (   6.01  )
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

This adds register fields for PMECR_EL1 as per the definitions based
on DDI0601 2024-09.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/tools/sysreg | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index ff09da6c0b1e..214ad6da1dff 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2349,6 +2349,21 @@ Res0	63:5
 Field	4:0	SEL
 EndSysreg
 
+Sysreg	PMECR_EL1	3	0	9	14	5
+Res0	63:5
+UnsignedEnum	4:3	SSE
+	0b00	DISABLED
+	0b10	ENABLED_PROHIBITED
+	0b11	ENABLED_ALLOWED
+EndEnum
+Field	2	KPME
+UnsignedEnum	1:0	PMEE
+	0b00	PMUIRQ_E_PMU_D
+	0b10	PMUIRQ_D_PMU_D
+	0b11	PMUIRQ_D_PMU_E
+EndEnum
+EndSysreg
+
 Sysreg	PMIAR_EL1	3	0	9	14	7
 Field	63:0 ADDRESS
 EndSysreg
-- 
2.25.1


