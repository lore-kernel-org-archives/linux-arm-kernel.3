Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B90D3E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jan 2025 17:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NzgfnWrd8Ok0AaW095dBj61O+smV0OmH0m6FsR0c72k=; b=yIVb/MPDJdFzhQ0RBxkcGj42mo
	k7SAXXFFOzDOgJKM9vo38X+LzyQ6SyIBWZRbn42JK7VMx6kG7iuSthG5x+cMHLoV0r97nFHq8XFqr
	siZ5IA3DZYCkRp6+Dhz2JeDxgpYHx4s38TZdhusvY9OgC8qEzp0ZaABigjLwRw7nhm673t+OjX+33
	Buhh7AnxNaDk2RwmXZwzJbqCLsqfv3zPsv03h3sTjPs+3NFYuxUWOUQKFYwf0uiMtxDvDotYGTdPi
	igkIWtLDl94iWjvagPKnFZ1L535ajXo3GV/QBFitzJTy9plAW65qG0MjwwcU6ZhDD9c+CIIIrhdOF
	vSyMqoGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tX1Vz-000000038Xo-0FTh;
	Sun, 12 Jan 2025 17:12:43 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tX1SG-000000037eu-2br8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jan 2025 17:08:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1F4F8A4091C;
	Sun, 12 Jan 2025 17:07:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02F28C4CEE0;
	Sun, 12 Jan 2025 17:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736701731;
	bh=irvSisWdAInReDQ60ym0hyaAWo7RRhDjgjlmicXlLCQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QlhOf7f8FK6GPUU7CsV5bWrCvZMjP+yQcTYqWH/rWUDAUVZLyduNLk5oB97a1Shxv
	 DVMENmBD3P7Kdq1A5fFFqjRwPgRZ5MSOo7yNA/ls892nAifR2KUfjAjmIi3QO2N3DV
	 5P6UyEs7LDEpfBunEtjJf/BvvOAAZGhjEqFmEkP/Mj58Jznq5jfcij8fzRD03q6P3i
	 DFc8yUD9s822glF3BAFo6V36iktGowieXyF7Uhs3Jpt1A5iY+h+cZ1iPby/UnSGyNU
	 hfi4TxpLQpLuEkcAN3nQHBqcfFDlhJiPiIrwjadcoZyMvO3Dvj0Ber2CvP4gxPrl3I
	 JrmDcgn7JVdgw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tX1SD-00BNxR-6t;
	Sun, 12 Jan 2025 17:08:49 +0000
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
Subject: [PATCH v2 03/17] arm64: sysreg: Add layout for ICH_MISR_EL2
Date: Sun, 12 Jan 2025 17:08:31 +0000
Message-Id: <20250112170845.1181891-4-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250112170845.1181891-1-maz@kernel.org>
References: <20250112170845.1181891-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, andre.przywara@arm.com, eric.auger@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_090852_827043_C32B617C 
X-CRM114-Status: UNSURE (   9.62  )
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

The ICH_MISR_EL2-related macros are missing a number of status
bits that we are about to handle. Take this opportunity to fully
describe the layout of that register as part of the automatic
generation infrastructure.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/sysreg.h       |  5 -----
 arch/arm64/tools/sysreg               | 12 ++++++++++++
 tools/arch/arm64/include/asm/sysreg.h |  5 -----
 3 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index cf74ebcd46d95..815e9b0bdff27 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -561,7 +561,6 @@
 
 #define SYS_ICH_VSEIR_EL2		sys_reg(3, 4, 12, 9, 4)
 #define SYS_ICC_SRE_EL2			sys_reg(3, 4, 12, 9, 5)
-#define SYS_ICH_MISR_EL2		sys_reg(3, 4, 12, 11, 2)
 #define SYS_ICH_EISR_EL2		sys_reg(3, 4, 12, 11, 3)
 #define SYS_ICH_ELRSR_EL2		sys_reg(3, 4, 12, 11, 5)
 #define SYS_ICH_VMCR_EL2		sys_reg(3, 4, 12, 11, 7)
@@ -991,10 +990,6 @@
 #define TRFCR_ELx_E0TRE			BIT(0)
 
 /* GIC Hypervisor interface registers */
-/* ICH_MISR_EL2 bit definitions */
-#define ICH_MISR_EOI		(1 << 0)
-#define ICH_MISR_U		(1 << 1)
-
 /* ICH_LR*_EL2 bit definitions */
 #define ICH_LR_VIRTUAL_ID_MASK	((1ULL << 32) - 1)
 
diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index f5927d345eea3..a601231a088d7 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2974,6 +2974,18 @@ Res0	17:5
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
index f43e303d31d25..0169bd3137caf 100644
--- a/tools/arch/arm64/include/asm/sysreg.h
+++ b/tools/arch/arm64/include/asm/sysreg.h
@@ -420,7 +420,6 @@
 
 #define SYS_ICH_VSEIR_EL2		sys_reg(3, 4, 12, 9, 4)
 #define SYS_ICC_SRE_EL2			sys_reg(3, 4, 12, 9, 5)
-#define SYS_ICH_MISR_EL2		sys_reg(3, 4, 12, 11, 2)
 #define SYS_ICH_EISR_EL2		sys_reg(3, 4, 12, 11, 3)
 #define SYS_ICH_ELRSR_EL2		sys_reg(3, 4, 12, 11, 5)
 #define SYS_ICH_VMCR_EL2		sys_reg(3, 4, 12, 11, 7)
@@ -634,10 +633,6 @@
 #define TRFCR_ELx_E0TRE			BIT(0)
 
 /* GIC Hypervisor interface registers */
-/* ICH_MISR_EL2 bit definitions */
-#define ICH_MISR_EOI		(1 << 0)
-#define ICH_MISR_U		(1 << 1)
-
 /* ICH_LR*_EL2 bit definitions */
 #define ICH_LR_VIRTUAL_ID_MASK	((1ULL << 32) - 1)
 
-- 
2.39.2


