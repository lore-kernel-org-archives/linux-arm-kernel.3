Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FF34C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 11:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f10M61XlxnvNY0rHLLPIa1FiknWC/lQAzy6gpUVvXHg=; b=ALNR1xEknrKFmC7a63SZZLOB2W
	n0f7DSH6Ae2UFo/DCLemwquqLCKSv4xTs1Zvr0QW9tkppyj2Zc+dSfifjkgq0slSyj+wA/uVmrUSM
	1AZ5sY4pfUAbzjc32UBylxggxR22B2tgYZyiT/XIOLmmFzfmoaNtSVDCS3agKHaXaPiU6AkQ3GQ1k
	4/KzBde1k6hs2oChysa/yoHie5Yr+hdtL6TKMtdgFGDl83n9B6+YirsRw1XVOaeEPIg39qqxdMpeg
	9SLdyBrBfmA7T7w/xFE/dIq5gLAPBgvrla6IlYFyEMhdDKlFPUu4vL7wwLZXT3nyD5ZHf+r6HwqS+
	qqCeHuKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7v9z-0000000Dvky-1fhy;
	Thu, 24 Apr 2025 11:54:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7tnS-0000000Dfuq-2VnL
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Apr 2025 10:27:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=f10M61XlxnvNY0rHLLPIa1FiknWC/lQAzy6gpUVvXHg=; b=Ht/tW5jO/CO8Why46IURCYFTtD
	sdCQyqFwKhpMybjIbmli8/arZjzrodN2IXZgQn9tFZH0nyzO2l0Qh/8sM2B4GFAoacNgrxpCfVzjA
	zNQiSrmzRi2sOALpJYU0jOUbqx3iLV/L+W/3RaiD/tkEwhD9lVMr7Rg7SYCSMKYP4oY9+m692ZbrW
	i4DnAYyhfuKEF0K2waqdchBPivksuSnC4rEuGVggLU/J1GYnCf8fvzrJfgxJepxIzxSyr0vzyfKno
	2Ks5BaavKUDefLSYs8LQvdqjMhiDtzsXzgZHcpj9BcJa3P3ogCKD9KJ3GYP/Vs2OaPpCPy2uRY/vX
	nQ1fxMJQ==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7tnP-0000000Bjc5-2Mxb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 10:27:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 18093A4BFF3;
	Thu, 24 Apr 2025 10:21:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D1CCC4CEE4;
	Thu, 24 Apr 2025 10:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745490425;
	bh=sVDAwu7zYs5UYmhKsIqu4Xi0KrfAlQzxvPf603/w1qs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NzM267PEMO2IMqbSaEpPxJsVB5eAVB3PjRE0DQnnRhBZcG8xXm+/3b23qQMfoft51
	 nER8G4hqF7RSDaQCrK4/hrNw+BJfOq7EkV3eCoGJu8yRkgUZktUjbxuYbr/n7hZg9e
	 gBZCjOgZOl4nw/3Cc6Lki0f26Eep81WYh0rWLb5fDbqXatP07v81am6DsBkoXS6aCD
	 ib8suaDHL1/ZeJM6rbgH2HJ3kjPHc1lbkLK4SpGLe0hPNUks7t7a/aJUxj7j+xWWeH
	 JiFJ5ksM7HrgOi2VwUMN7nd3RVKaLlqVPsf/LaTU37pc1b9MluP1C66+X7FSTzePAo
	 VDgLVOYpOmapA==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Thu, 24 Apr 2025 12:25:26 +0200
Subject: [PATCH v2 15/22] arm64: Disable GICv5 read/write/instruction traps
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-gicv5-host-v2-15-545edcaf012b@kernel.org>
References: <20250424-gicv5-host-v2-0-545edcaf012b@kernel.org>
In-Reply-To: <20250424-gicv5-host-v2-0-545edcaf012b@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Sascha Bischoff <sascha.bischoff@arm.com>, 
 Timothy Hayes <timothy.hayes@arm.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_112707_998756_82E0FE57 
X-CRM114-Status: UNSURE (   8.69  )
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
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/el2_setup.h | 45 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
index ebceaae3c749b84395c9c5eccf0caf874697ad11..1e362bb3b042d51fff15a7c2abc73842930b275a 100644
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
+	mov	x0, #(1 << ICH_HFGITR_EL2_GICRCDNMIA_SHIFT	| \
+		      1 << ICH_HFGITR_EL2_GICRCDIA_SHIFT	| \
+		      1 << ICH_HFGITR_EL2_GICCDDI_SHIFT		| \
+		      1 << ICH_HFGITR_EL2_GICCDEOI_SHIFT	| \
+		      1 << ICH_HFGITR_EL2_GICCDHM_SHIFT		| \
+		      1 << ICH_HFGITR_EL2_GICCRDRCFG_SHIFT	| \
+		      1 << ICH_HFGITR_EL2_GICCDPEND_SHIFT	| \
+		      1 << ICH_HFGITR_EL2_GICCDAFF_SHIFT	| \
+		      1 << ICH_HFGITR_EL2_GICCDPRI_SHIFT	| \
+		      1 << ICH_HFGITR_EL2_GICCDDIS_SHIFT	| \
+		      1 << ICH_HFGITR_EL2_GICCDEN_SHIFT)
+	msr_s	SYS_ICH_HFGITR_EL2, x0		// Disable instruction traps
+	mov_q	x0, (1 << ICH_HFGRTR_EL2_ICC_PPI_ACTIVERn_EL1_SHIFT	| \
+		     1 << ICH_HFGRTR_EL2_ICC_PPI_PRIORITYRn_EL1_SHIFT	| \
+		     1 << ICH_HFGRTR_EL2_ICC_PPI_PENDRn_EL1_SHIFT	| \
+		     1 << ICH_HFGRTR_EL2_ICC_PPI_ENABLERn_EL1_SHIFT	| \
+		     1 << ICH_HFGRTR_EL2_ICC_PPI_HMRn_EL1_SHIFT		| \
+		     1 << ICH_HFGRTR_EL2_ICC_IAFFIDR_EL1_SHIFT		| \
+		     1 << ICH_HFGRTR_EL2_ICC_ICSR_EL1_SHIFT		| \
+		     1 << ICH_HFGRTR_EL2_ICC_PCR_EL1_SHIFT		| \
+		     1 << ICH_HFGRTR_EL2_ICC_HPPIR_EL1_SHIFT		| \
+		     1 << ICH_HFGRTR_EL2_ICC_HAPR_EL1_SHIFT		| \
+		     1 << ICH_HFGRTR_EL2_ICC_CR0_EL1_SHIFT		| \
+		     1 << ICH_HFGRTR_EL2_ICC_IDRn_EL1_SHIFT		| \
+		     1 << ICH_HFGRTR_EL2_ICC_APR_EL1_SHIFT)
+	msr_s	SYS_ICH_HFGRTR_EL2, x0		// Disable reg read traps
+	mov_q	x0, (1 << ICH_HFGWTR_EL2_ICC_PPI_ACTIVERn_EL1_SHIFT	| \
+		     1 << ICH_HFGWTR_EL2_ICC_PPI_PRIORITYRn_EL1_SHIFT	| \
+		     1 << ICH_HFGWTR_EL2_ICC_PPI_PENDRn_EL1_SHIFT	| \
+		     1 << ICH_HFGWTR_EL2_ICC_PPI_ENABLERn_EL1_SHIFT	| \
+		     1 << ICH_HFGWTR_EL2_ICC_ICSR_EL1_SHIFT		| \
+		     1 << ICH_HFGWTR_EL2_ICC_PCR_EL1_SHIFT		| \
+		     1 << ICH_HFGWTR_EL2_ICC_CR0_EL1_SHIFT		| \
+		     1 << ICH_HFGWTR_EL2_ICC_APR_EL1_SHIFT)
+	msr_s	SYS_ICH_HFGWTR_EL2, x0		// Disable reg write traps
+.Lskip_gicv5_\@:
+.endm
+
 .macro __init_el2_hstr
 	msr	hstr_el2, xzr			// Disable CP15 traps to EL2
 .endm
@@ -323,6 +367,7 @@
 	__init_el2_lor
 	__init_el2_stage2
 	__init_el2_gicv3
+	__init_el2_gicv5
 	__init_el2_hstr
 	__init_el2_mpam
 	__init_el2_nvhe_idregs

-- 
2.48.0


