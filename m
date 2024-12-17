Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BCFFE77184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 15:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NzgfnWrd8Ok0AaW095dBj61O+smV0OmH0m6FsR0c72k=; b=RH+4dElOW4Bm+26B7fYwg0by6z
	OoKJRL8m5QUgSha2G9KWTjwtK6U7MNA/SrOen9Nih8LkRD1RjntRyPsxTXhsJVbdd3YUOhlvI+TJO
	1+jb/kn4Euonb5G4jwGdatSPMQc6SHuIJyjj0eG/kO8SIYxjiy8emAXmi6A9zJ1lr7WWpsGwVbaCO
	ok+lZqzcBySL6A1jQgTQ0nzpMVvKhNZ2W15vqMee6MTHQwXncO6IEh2jfPa5c8OonYMwcnqo52WQw
	KXyDMn6wTMJgxE6uVaf4C9oM1Te71fVgLOCLeqSMJk9VdluBsY1rmZ87w0xxflXJ6hB5ehErqbzAF
	+Bbyl9/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNZKy-0000000DvNo-1nh9;
	Tue, 17 Dec 2024 15:18:16 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNZGv-0000000DuRP-3w5f
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 15:14:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 87642A419F0;
	Tue, 17 Dec 2024 15:12:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5FA8C4CEDE;
	Tue, 17 Dec 2024 15:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734448444;
	bh=irvSisWdAInReDQ60ym0hyaAWo7RRhDjgjlmicXlLCQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eL1wHKf0Q6rm2O4yjwjsQMTTftYww5bf3gOUhVMyTDpr0qAacbcPFY1xjba7HHLT+
	 WK+fdfzFw2usOnKpYVrXwzWHdV0CQnckcKBa34aMS2J/e5xqPXfBilAgBZY46CGp9G
	 C/20AVpCii2exKKnVUG2qeFqO8LKoOVWl5h/FERIVzSkhnQ330Hv0gWmDrQPp4rWZl
	 LkNTFmWBkzRSczvyhlIbxghXSaLsA4PMuW0YbwREQoXPzCYJTf6MoHZr3XHlxMY4A/
	 6uhJXi2xENHwFIKjpSq/S9HaMSN9OT2TE4i1isXxX5/byE+dYg4boLqGn3+RFihoxH
	 7jMP/2YPfu9wg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tNZGt-004bWV-2N;
	Tue, 17 Dec 2024 15:14:03 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Eric Auger <eauger@redhat.com>,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
Subject: [PATCH 03/16] arm64: sysreg: Add layout for ICH_MISR_EL2
Date: Tue, 17 Dec 2024 15:13:18 +0000
Message-Id: <20241217151331.934077-4-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241217151331.934077-1-maz@kernel.org>
References: <20241217151331.934077-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, andre.przywara@arm.com, eauger@redhat.com, gankulkarni@os.amperecomputing.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_071406_116775_2D781CD7 
X-CRM114-Status: UNSURE (   9.06  )
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


