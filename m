Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C26C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 13:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PZaJrPq88QZ6CRpOH5woHf1ciaQrP5kb0n35uKkiAnU=; b=SXqwoj0twNNooWXC0KLoxRcFjX
	TIaBlxE6wU/FKkC4UvAF55cz+wI6eszxGZ3vDnWQ2WXAhFHtLNqViE89dPadQeOemHQKqfuhcSasc
	Nq5Lr85AMZIAXFXgLwQC8yeKuVukZKC0MX5TQktMcjz4u771+gQXSh2GbWZRhz1lK/wWju+rvX8t+
	SC3jL0urQ76qVEYxvXDMbiYHSnBY/80vu37cYx7RWUXM/Bh414YF3MscNb+CJk9iUfeYr99t8bV3D
	odAxGXiGOx4OpLji1L6h8fGJ9wa763XPOrCMlZpJEJCNNiJ73EHsMAOFXoeYoML/9U2Vopil0jt00
	7SNBgP6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8fH3-000000023Uz-2b0A;
	Sat, 26 Apr 2025 13:08:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8eeO-00000001z19-3fz1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Apr 2025 12:28:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E64C24A6F3;
	Sat, 26 Apr 2025 12:28:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9278EC4CEED;
	Sat, 26 Apr 2025 12:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745670536;
	bh=xw/w3V9CUbh6dadR2+rCO1kqsM8ZOa8PQNMsMiGppFE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JRpgkOkwa0G3MtcA04KBNChL9Wj4yXTYAF8cJsTKZ+v6VGeKNW6V5f63aAoFVgydv
	 cbV0nVMQZuaIHPa7W5fxFUF3iAjD77Pxypzp/ubtEpxHU2Bf3+L2DmOnKEqhmZLvdP
	 u/Z+JWA/fj/gp5LoM7t6jIK/gW2ZuQVZqVJlajmLE7+0f1AE/CaB0KwpEQ4KAcl6h1
	 0EGDV+aJzJD+Wdn5zCsiSkdALtbeJ8GR2sL0jbAfwD2QD+lOWl8pmCmx81IxDp97mL
	 lMZhSHZg3WraLcAzaXT0gHINh0mDR86JqJazboqvcMbJMHmioiETUn8X1DvCoWxtug
	 hKXVmypKEn/9w==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1u8eeM-0092VH-Nt;
	Sat, 26 Apr 2025 13:28:54 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH v3 22/42] KVM: arm64: Add description of FGT bits leading to EC!=0x18
Date: Sat, 26 Apr 2025 13:28:16 +0100
Message-Id: <20250426122836.3341523-23-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250426122836.3341523-1-maz@kernel.org>
References: <20250426122836.3341523-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, mark.rutland@arm.com, tabba@google.com, will@kernel.org, catalin.marinas@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_052856_989794_E328FFBB 
X-CRM114-Status: GOOD (  14.08  )
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

The current FTP tables are only concerned with the bits generating
ESR_ELx.EC==0x18. However, we want an exhaustive view of what KVM
really knows about.

So let's add another small table that provides that extra information.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/emulate-nested.c | 36 +++++++++++++++++++++++++++------
 1 file changed, 30 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index 528b33fcfcfd6..c30d970bf81cb 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -1279,16 +1279,21 @@ enum fg_filter_id {
 	__NR_FG_FILTER_IDS__
 };
 
-#define SR_FGF(sr, g, b, p, f)					\
-	{							\
-		.encoding	= sr,				\
-		.end		= sr,				\
-		.tc		= {				\
+#define __FGT(g, b, p, f)					\
+		{						\
 			.fgt = g ## _GROUP,			\
 			.bit = g ## _EL2_ ## b ## _SHIFT,	\
 			.pol = p,				\
 			.fgf = f,				\
-		},						\
+		}
+
+#define FGT(g, b, p)		__FGT(g, b, p, __NO_FGF__)
+
+#define SR_FGF(sr, g, b, p, f)					\
+	{							\
+		.encoding	= sr,				\
+		.end		= sr,				\
+		.tc		= __FGT(g, b, p, f),		\
 		.line = __LINE__,				\
 	}
 
@@ -1989,6 +1994,18 @@ static const struct encoding_to_trap_config encoding_to_fgt[] __initconst = {
 	SR_FGT(SYS_AMEVCNTR0_EL0(0),	HAFGRTR, AMEVCNTR00_EL0, 1),
 };
 
+/*
+ * Additional FGTs that do not fire with ESR_EL2.EC==0x18. This table
+ * isn't used for exception routing, but only as a promise that the
+ * trap is handled somewhere else.
+ */
+static const union trap_config non_0x18_fgt[] __initconst = {
+	FGT(HFGITR, nGCSSTR_EL1, 0),
+	FGT(HFGITR, SVC_EL1, 1),
+	FGT(HFGITR, SVC_EL0, 1),
+	FGT(HFGITR, ERET, 1),
+};
+
 static union trap_config get_trap_config(u32 sysreg)
 {
 	return (union trap_config) {
@@ -2203,6 +2220,13 @@ int __init populate_nv_trap_config(void)
 		}
 	}
 
+	for (int i = 0; i < ARRAY_SIZE(non_0x18_fgt); i++) {
+		if (!aggregate_fgt(non_0x18_fgt[i])) {
+			ret = -EINVAL;
+			kvm_err("non_0x18_fgt[%d] is reserved\n", i);
+		}
+	}
+
 	ret = check_all_fgt_masks(ret);
 
 	kvm_info("nv: %ld fine grained trap handlers\n",
-- 
2.39.2


