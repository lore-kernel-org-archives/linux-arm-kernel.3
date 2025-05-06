Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96AEDC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 15:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LBUmsXJQ5Q85GV6UWA3QUGY4VIWfDhXCrRT7lcuJORc=; b=38BWXVcQQVqSjzqzb4eh5V7CaV
	F8R/i+FEfD18hCRvU0oIYql5yEr+0xjQrg/HMopLMCV+ABkzvCqD99DKlRHwSjmyWuSyay7jOtr4P
	UOvGJUoimYJaXd03Kw2IwWnmxARZ3W5Pu9VquOOytAk+NVyZuMV5W7tgQNKV4KawJ/7mlYhnIPI9G
	eChILU5GP6NQ7FhoxXvWDRk1dwG0AoWh7MtIiBz/ocbfeJYWKimUkMEwR39IYRLIkm4bYOeeUxdhP
	MudvWa+IULcRciLbS0+cAiOgR+FUWEAfYfeuNUrkCDnvK1uRBpjQMjPmtkA5eJFLjv6zQZdVfmOnh
	1x8/5qTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCKWt-0000000CXma-0jG2;
	Tue, 06 May 2025 15:48:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCHMA-0000000BtaX-2Spr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 12:25:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4F01D49B82;
	Tue,  6 May 2025 12:25:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F1B6C4CEEE;
	Tue,  6 May 2025 12:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746534306;
	bh=gRWN4/WxQNgzKjCuCmcZKjoQVmfMZVTNU54WEek8EP4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EHZHs+9dVLolSMYcjh0g1FsSEzoa2/wxNl//whlVTNpE+Y5748T+TOuLOgvPqjjz0
	 NsBF+q6c6hGPU7MSOnUFMFq6b3uP70XSGLrMVTwtYrAO4/OI688eYCYGfuE0Aepb5U
	 /j5y6ij1uRK0q5XjI3V0wVgJOmQRfBlUHe1iCG6Wh2b4yDNZyR9K53ou+IUcCIAsfY
	 Z9pcZENwv5eU8WnivOgfKxjMI2BRHpEdPk7N2rPhVVXSMwPHxwqwdwcw4I+wolYqeI
	 gv7c+WiY662+Jef9VX5EYIMPvIak53v9cAVdvR4PkW7Quz5m7I9DUvsD90q+gSsiOD
	 RKC+L+hR90QVw==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 06 May 2025 14:23:44 +0200
Subject: [PATCH v3 15/25] arm64: Disable GICv5 read/write/instruction traps
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-gicv5-host-v3-15-6edd5a92fd09@kernel.org>
References: <20250506-gicv5-host-v3-0-6edd5a92fd09@kernel.org>
In-Reply-To: <20250506-gicv5-host-v3-0-6edd5a92fd09@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Sascha Bischoff <sascha.bischoff@arm.com>, 
 Timothy Hayes <timothy.hayes@arm.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Mark Rutland <mark.rutland@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_052506_671104_6C2ABC1C 
X-CRM114-Status: UNSURE (   9.21  )
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
index ebceaae3c749b84395c9c5eccf0caf874697ad11..109b72b657d2fbb6d39e0446c10d1b62e0a780b3 100644
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
+		      ICH_HFGITR_EL2_GICCRDRCFG		| \
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


