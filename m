Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5053C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 13:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f10M61XlxnvNY0rHLLPIa1FiknWC/lQAzy6gpUVvXHg=; b=ojDHttStRoMG+r3xkdX1vAwMaK
	Q4ZA7MS/b+TS7dEHMVn1w1BLQxcsW3FzGq73in794tziQ3Tt5yqpZrM0dIKZCVb4e8G1XD953q76X
	f7Tqd5qSlRBQhS21hAPGEvFObh097uls+iZMSvFYjHOTVrXcMCv+i+92yVwyDr3EALO81piZ1yCSK
	6mj9ZQCzkqGm+AT7z6Js5NZm6rvblRoCuWIRSoE2Xo6/c22bD0EPEFgYks9Y1hhIMh7YvMvqYgrUe
	hFHP/qErAN3sNI+GrOOygN36cT6ad9k1E9vLh1ckei9kx6IkvNNfJLP3eZCv106JRap8tf0udTNHX
	X/0OwCrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u28lk-000000045zA-49Oe;
	Tue, 08 Apr 2025 13:13:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u26YS-00000003kJZ-2b91
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 10:51:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A259A4A10C;
	Tue,  8 Apr 2025 10:51:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A539C4CEE7;
	Tue,  8 Apr 2025 10:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744109504;
	bh=sVDAwu7zYs5UYmhKsIqu4Xi0KrfAlQzxvPf603/w1qs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NzskJDRL+zvRKPmHm6Vr3yQh8MiYkr9C4dyMFNcvNScc2hA6FgtNTx+Iazh1kF0c4
	 7Upk9Af0gbZMoWsQob/NhM0PfYF4vyKmim0tkl7n8oJ1THltSbnQI/+05Tk9q+M+mR
	 Njm3htHhK9jxgyY8F+WjZ02ADseeD+T/5xC2BvNCXhthtwzswS7Ljucg5loDwQ6vzX
	 0haifBTxZilEj170vSA85KjlYfSM5dFR+FjLRE3fR3j9YdyR015DTEQ+nVVRduVey8
	 TfkU6E/O8jhpke/H88GxKn7Zik1QJzMxud4zN+DIYHRkHvE40+x02NAxUr5nvfUn3J
	 4X+bt+5GCO2Bg==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 08 Apr 2025 12:50:14 +0200
Subject: [PATCH 15/24] arm64: Disable GICv5 read/write/instruction traps
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gicv5-host-v1-15-1f26db465f8d@kernel.org>
References: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
In-Reply-To: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Sascha Bischoff <sascha.bischoff@arm.com>, 
 Timothy Hayes <timothy.hayes@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_035144_705295_EC5AFBC4 
X-CRM114-Status: UNSURE (   8.64  )
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


