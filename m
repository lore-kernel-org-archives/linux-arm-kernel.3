Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD937C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 11:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QM/7rAJCrokPda8kEIQXRIEPqUSZQyuRxq56PgEC3Bw=; b=lqy6YEjA2mqlNctEdqG1/Ob8GK
	BQY/LJ2X+yEUsNol0JpxQZMhUM/UwsJPzq9YQWOxS8GF9UvEJZZRfO/Gp4JAnJksQIMUGQEalWYRt
	Bz+kPCgnUrjC2jRAVHFIsblZpZu3HyN4w8jgu0zBDh7Ygex0DyG45d7zD9is/BFaAZG1+7O1CPKsV
	V+oa9p6aF77AlI/8UAV9xnaYyfsE7dqA/3Bq57wng8oL/s31jsoqPhFs4lWTUaoFw9L24oibyOlKY
	DvbfsVB4K0udOOkAzuY6HRPmO69dcRgtks60iQ9B+bL2iuYROhN8nV9KDvBMLkHI/Zu9RJVIjYifl
	RwOmD+cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXHl1-0000000B6Zt-2pMU;
	Thu, 03 Jul 2025 11:05:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXH9I-0000000Az3J-3D6e
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 10:26:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 429275C4842;
	Thu,  3 Jul 2025 10:26:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23B74C4CEF1;
	Thu,  3 Jul 2025 10:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751538395;
	bh=Y65mBpXFKRIuLxSiQ3O5ySwIbzcmgFcyV0yOBjwW2no=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pJYXo/gxULIqpEH/981iAckpVHnjkIfWnFdqccNZE0jZ4KXtVw96F2tEQOrJv0D2D
	 UlxEbqTe5Gr/tSiVUDo+kjcFwMgizxl1eDAG1YUkyf6LnNH/hXa+9yd1qX1w58lrWU
	 fY50f+/b3o/iFBS3OuwCDydB2hF/yshS1B/utDwm9XKVeSR6dvm3gHJIXzM2yK9qic
	 tsdUEtKSXtDcqiLuZNDqYbzJil0PUjrQlwffXDMv48gtaH39y9xf4oOPTG3v9qQezf
	 OPpQ/qSfJ0lhH+nMvCFFkpCiYT8arUZtGUuyZp50Z4ZdzeUl2wdSah2QMk5L3G/Ke9
	 8kY94dgQMeZ2Q==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Thu, 03 Jul 2025 12:25:05 +0200
Subject: [PATCH v7 15/31] arm64: Disable GICv5 read/write/instruction traps
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-gicv5-host-v7-15-12e71f1b3528@kernel.org>
References: <20250703-gicv5-host-v7-0-12e71f1b3528@kernel.org>
In-Reply-To: <20250703-gicv5-host-v7-0-12e71f1b3528@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Sascha Bischoff <sascha.bischoff@arm.com>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 Timothy Hayes <timothy.hayes@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Mark Rutland <mark.rutland@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-pci@vger.kernel.org, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.15-dev-6f78e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_032636_895864_78483826 
X-CRM114-Status: UNSURE (   9.02  )
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

GICv5 trap configuration registers value is UNKNOWN at reset.

Initialize GICv5 EL2 trap configuration registers to prevent
trapping GICv5 instruction/register access upon entering the
kernel.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Reviewed-by: Marc Zyngier <maz@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/el2_setup.h | 45 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
index ba5df0df02a4..54abcb13e51f 100644
--- a/arch/arm64/include/asm/el2_setup.h
+++ b/arch/arm64/include/asm/el2_setup.h
@@ -165,6 +165,50 @@
 .Lskip_gicv3_\@:
 .endm
 
+/* GICv5 system register access */
+.macro __init_el2_gicv5
+	mrs_s	x0, SYS_ID_AA64PFR2_EL1
+	ubfx	x0, x0, #ID_AA64PFR2_EL1_GCIE_SHIFT, #4
+	cbz	x0, .Lskip_gicv5_\@
+
+	mov	x0, #(ICH_HFGITR_EL2_GICRCDNMIA		| \
+		      ICH_HFGITR_EL2_GICRCDIA		| \
+		      ICH_HFGITR_EL2_GICCDDI		| \
+		      ICH_HFGITR_EL2_GICCDEOI		| \
+		      ICH_HFGITR_EL2_GICCDHM		| \
+		      ICH_HFGITR_EL2_GICCDRCFG		| \
+		      ICH_HFGITR_EL2_GICCDPEND		| \
+		      ICH_HFGITR_EL2_GICCDAFF		| \
+		      ICH_HFGITR_EL2_GICCDPRI		| \
+		      ICH_HFGITR_EL2_GICCDDIS		| \
+		      ICH_HFGITR_EL2_GICCDEN)
+	msr_s	SYS_ICH_HFGITR_EL2, x0		// Disable instruction traps
+	mov_q	x0, (ICH_HFGRTR_EL2_ICC_PPI_ACTIVERn_EL1	| \
+		     ICH_HFGRTR_EL2_ICC_PPI_PRIORITYRn_EL1	| \
+		     ICH_HFGRTR_EL2_ICC_PPI_PENDRn_EL1		| \
+		     ICH_HFGRTR_EL2_ICC_PPI_ENABLERn_EL1	| \
+		     ICH_HFGRTR_EL2_ICC_PPI_HMRn_EL1		| \
+		     ICH_HFGRTR_EL2_ICC_IAFFIDR_EL1		| \
+		     ICH_HFGRTR_EL2_ICC_ICSR_EL1		| \
+		     ICH_HFGRTR_EL2_ICC_PCR_EL1			| \
+		     ICH_HFGRTR_EL2_ICC_HPPIR_EL1		| \
+		     ICH_HFGRTR_EL2_ICC_HAPR_EL1		| \
+		     ICH_HFGRTR_EL2_ICC_CR0_EL1			| \
+		     ICH_HFGRTR_EL2_ICC_IDRn_EL1		| \
+		     ICH_HFGRTR_EL2_ICC_APR_EL1)
+	msr_s	SYS_ICH_HFGRTR_EL2, x0		// Disable reg read traps
+	mov_q	x0, (ICH_HFGWTR_EL2_ICC_PPI_ACTIVERn_EL1	| \
+		     ICH_HFGWTR_EL2_ICC_PPI_PRIORITYRn_EL1	| \
+		     ICH_HFGWTR_EL2_ICC_PPI_PENDRn_EL1		| \
+		     ICH_HFGWTR_EL2_ICC_PPI_ENABLERn_EL1	| \
+		     ICH_HFGWTR_EL2_ICC_ICSR_EL1		| \
+		     ICH_HFGWTR_EL2_ICC_PCR_EL1			| \
+		     ICH_HFGWTR_EL2_ICC_CR0_EL1			| \
+		     ICH_HFGWTR_EL2_ICC_APR_EL1)
+	msr_s	SYS_ICH_HFGWTR_EL2, x0		// Disable reg write traps
+.Lskip_gicv5_\@:
+.endm
+
 .macro __init_el2_hstr
 	msr	hstr_el2, xzr			// Disable CP15 traps to EL2
 .endm
@@ -314,6 +358,7 @@
 	__init_el2_lor
 	__init_el2_stage2
 	__init_el2_gicv3
+	__init_el2_gicv5
 	__init_el2_hstr
 	__init_el2_nvhe_idregs
 	__init_el2_cptr

-- 
2.48.0


