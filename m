Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D366EE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 06:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C4fnMVeHImd2EeInHsu6g1jtacj8i4FjQo3/j7nzBL4=; b=opYUj+GmmYeTT2lcUiGspxyveL
	B4NTwqvmr8GhAhtmoWjjWbeGLtVzeCEPqzKkM/jGTCbWyTqmkjY502UXALBUNLLuYQv8d3p+5hlPV
	lzRMDv0CRdk6hKIjEWxDTf4vwphhDbe1sH5P42eOSVcT0Gyy9JAhrHlsrMAO2JTyjw9egyhyiPblA
	v4oKUm4CLkit2Fvmt/rCQR/suTQOeuDagJO6reyvr4uxNtn9+c0jVhoyjUlXO5vLi54U9RLQcrcqw
	O8BsxIXFsLR9E3pLJeI2XiBfo720X4Urf28Unmimc7gb5hV8rETGtje0WdW1rUBxW4a+L4rmR82be
	daJXS1Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKtuY-0000000AS4a-05kG;
	Tue, 10 Dec 2024 06:39:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKtEv-0000000AKh6-3kOx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 05:56:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9FD1E113E;
	Mon,  9 Dec 2024 21:57:25 -0800 (PST)
Received: from a077893.arm.com (unknown [10.163.48.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6E6123F58B;
	Mon,  9 Dec 2024 21:56:53 -0800 (PST)
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
Subject: [PATCH V2 43/46] arm64/sysreg: Add remaining debug registers affected by HDFGxTR2_EL2
Date: Tue, 10 Dec 2024 11:23:08 +0530
Message-Id: <20241210055311.780688-44-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241210055311.780688-1-anshuman.khandual@arm.com>
References: <20241210055311.780688-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_215657_985990_FE8F7E95 
X-CRM114-Status: UNSURE (   8.01  )
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

The HDFGxTR2_EL2 registers trap a set of debug and trace related registers.
Almost all of those register encodings have been added in the tools sysreg
format. Let's also add all the remaining encodings which are formula based
(and only that, because we really don't care about what these registers
actually do at this stage).

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/include/asm/sysreg.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index b8303a83c0bf..d1e3737a8ff8 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -270,6 +270,12 @@
 #define SYS_TRCVMIDCCTLR1		sys_reg(2, 1, 3, 3, 2)
 #define SYS_TRCVMIDCVR(m)		sys_reg(2, 1, 3, ((m & 7) << 1), 1)
 
+#define SYS_SPMEVCNTR_EL0(m)		sys_reg(2, 3, 14, (0 | (m >> 3)), (m & 7))
+#define SYS_SPMEVTYPER_EL0(m)		sys_reg(2, 3, 14, (2 | (m >> 3)), (m & 7))
+#define SYS_SPMEVFILTR_EL0(m)		sys_reg(2, 3, 14, (4 | (m >> 3)), (m & 7))
+#define SYS_SPMEVFILT2R_EL0(m)		sys_reg(2, 3, 14, (6 | (m >> 3)), (m & 7))
+#define SYS_PMEVCNTSVR_EL1(m)		sys_reg(2, 0, 14, (8 | (m >> 3)), (m & 7))
+
 /* ETM */
 #define SYS_TRCOSLAR			sys_reg(2, 1, 1, 0, 4)
 
-- 
2.25.1


