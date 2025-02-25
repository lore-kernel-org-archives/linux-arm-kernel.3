Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B97C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 18:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kzZPwS+0OSiBGJdEXWvJFNaLRU3jzdcwxGBemC/KgK4=; b=oTlGwVIn2gtowsR3c9Nx6/pyNl
	CAde19oFYWiX7Z86Irou9FUiYTIOxeAqj+buk1FLSC0poBh1y9/4uA1TZiKsH4yBv0EV13I6mvNiN
	qS/3ncbWfew5C73Q3mh10aRC84a1X6MoLih0EVHnAaZ5DNKNDzIlfaw9Mb8YbBJtLW4iwGfb9AsIS
	x2kEe5h8IlWJeg2aiv8R7MmOjmxYKHw43H8UcpD+AS5jf+f9iUi/FMcyAC3Hiyz3tBNGxQABZvUpe
	iz4LlhzTbpnoUXsYyXXG5DU93tG2A7y9bkvZ56Li2hcdX5efKaGlH0wryczm6ddR+kKPVz513Vku3
	dPAjvVPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmzO4-00000000qjk-3kgc;
	Tue, 25 Feb 2025 18:10:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmykd-00000000eA7-1WPc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 17:29:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D8FFD612BF;
	Tue, 25 Feb 2025 17:29:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7183FC4CEDD;
	Tue, 25 Feb 2025 17:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740504586;
	bh=yuFlDaL+lICxdp2tle8fmEhBUnWIS+5Z4d11toXNzuA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BkywAXEHE+vXVsJO8cTN+uazJApsc5KRhQlVX7lPa2dFPqVNu2vGKtxcow1GVV5Cg
	 prluah5FAkTD1Th87m7x9ytzEp2g+xU7svlXR3yL2+8IeZoI7yH6yWkGO2sDFvFP9p
	 72I+4Qcoana3Svzygo+AvAWM/21DFs/eM9CLvX40uDgRJUAlCKy1IIi13vwieOCyL5
	 rMd0IetCSibR6N8Wop4r6mcgttuDenMAYreLL2gmmydC6h7vKKW3aXZz986fnVWW4l
	 raIoL6er8hEJRLf92GxwQBHujlihfgWfjadJpuUKJwfap9bcPjvmRHe8uLDmkwlnCc
	 6XYISfjL6DQaA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tmyka-007rKs-B5;
	Tue, 25 Feb 2025 17:29:44 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Eric Auger <eric.auger@redhat.com>
Subject: [PATCH v4 03/16] arm64: sysreg: Add layout for ICH_MISR_EL2
Date: Tue, 25 Feb 2025 17:29:17 +0000
Message-Id: <20250225172930.1850838-4-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250225172930.1850838-1-maz@kernel.org>
References: <20250225172930.1850838-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, andre.przywara@arm.com, eric.auger@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

The ICH_MISR_EL2-related macros are missing a number of status
bits that we are about to handle. Take this opportunity to fully
describe the layout of that register as part of the automatic
generation infrastructure.

Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/sysreg.h       |  5 -----
 arch/arm64/tools/sysreg               | 12 ++++++++++++
 tools/arch/arm64/include/asm/sysreg.h |  5 -----
 3 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index b59b2c680e977..9511f3faac462 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -562,7 +562,6 @@
 
 #define SYS_ICH_VSEIR_EL2		sys_reg(3, 4, 12, 9, 4)
 #define SYS_ICC_SRE_EL2			sys_reg(3, 4, 12, 9, 5)
-#define SYS_ICH_MISR_EL2		sys_reg(3, 4, 12, 11, 2)
 #define SYS_ICH_EISR_EL2		sys_reg(3, 4, 12, 11, 3)
 #define SYS_ICH_ELRSR_EL2		sys_reg(3, 4, 12, 11, 5)
 #define SYS_ICH_VMCR_EL2		sys_reg(3, 4, 12, 11, 7)
@@ -983,10 +982,6 @@
 #define SYS_MPIDR_SAFE_VAL	(BIT(31))
 
 /* GIC Hypervisor interface registers */
-/* ICH_MISR_EL2 bit definitions */
-#define ICH_MISR_EOI		(1 << 0)
-#define ICH_MISR_U		(1 << 1)
-
 /* ICH_LR*_EL2 bit definitions */
 #define ICH_LR_VIRTUAL_ID_MASK	((1ULL << 32) - 1)
 
diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 3e82a072eb493..2c63662c1a489 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -3071,6 +3071,18 @@ Res0	17:5
 Field	4:0	ListRegs
 EndSysreg
 
+Sysreg	ICH_MISR_EL2	3	4	12	11	2
+Res0	63:8
+Field	7	VGrp1D
+Field	6	VGrp1E
+Field	5	VGrp0D
+Field	4	VGrp0E
+Field	3	NP
+Field	2	LRENP
+Field	1	U
+Field	0	EOI
+EndSysreg
+
 Sysreg	CONTEXTIDR_EL2	3	4	13	0	1
 Fields	CONTEXTIDR_ELx
 EndSysreg
diff --git a/tools/arch/arm64/include/asm/sysreg.h b/tools/arch/arm64/include/asm/sysreg.h
index 5d9d7e394b254..b6c5ece4fdee7 100644
--- a/tools/arch/arm64/include/asm/sysreg.h
+++ b/tools/arch/arm64/include/asm/sysreg.h
@@ -558,7 +558,6 @@
 
 #define SYS_ICH_VSEIR_EL2		sys_reg(3, 4, 12, 9, 4)
 #define SYS_ICC_SRE_EL2			sys_reg(3, 4, 12, 9, 5)
-#define SYS_ICH_MISR_EL2		sys_reg(3, 4, 12, 11, 2)
 #define SYS_ICH_EISR_EL2		sys_reg(3, 4, 12, 11, 3)
 #define SYS_ICH_ELRSR_EL2		sys_reg(3, 4, 12, 11, 5)
 #define SYS_ICH_VMCR_EL2		sys_reg(3, 4, 12, 11, 7)
@@ -979,10 +978,6 @@
 #define SYS_MPIDR_SAFE_VAL	(BIT(31))
 
 /* GIC Hypervisor interface registers */
-/* ICH_MISR_EL2 bit definitions */
-#define ICH_MISR_EOI		(1 << 0)
-#define ICH_MISR_U		(1 << 1)
-
 /* ICH_LR*_EL2 bit definitions */
 #define ICH_LR_VIRTUAL_ID_MASK	((1ULL << 32) - 1)
 
-- 
2.39.2


