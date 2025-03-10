Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C70EEC28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 13:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gH9jE4rme5X5rN/laxchqzPeoIR5PTA4oOj0IUNVpEI=; b=gZMxeoywIJYme1H3Q7ntvddhd7
	2zZLy3t+Nh6YYzuczyzexp+j2f3wLaSyxSRWGdmMAkEk0TPTEaAWzU1D1BT9iLqDVUIsw4BH6DatK
	/tbqdgs6w3FFE+C+IdrbUn8ZGMODN0blovPMnu7CgH8WqeYV1/2G2sqjd/6tOgUOuXP0cdgJUEPJw
	vHcPMwVyLOce32L+JhbY2Sx15BrGhfoep5Ng4507tDvllNy8LikCdvL07BBxE9E8PHZJ/LAZDRPsL
	Fv9ZS96qz6P90yqmWEtxfBXJXcLjoyTzs6nBIVIRHwr8R+bedfElAgpjwAzmLyywWEbWn0U5VDAZs
	7jO1P+KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trcjp-00000002iJi-407j;
	Mon, 10 Mar 2025 13:00:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trcC2-00000002bSr-3MjN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 12:25:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 76D605C632C;
	Mon, 10 Mar 2025 12:22:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E70DC4CEEF;
	Mon, 10 Mar 2025 12:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741609514;
	bh=f9XQRQuULxKzE9X/XvGWnwafyLw7l1Eqzg+ZWKrvZ6w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r1C5CBBvJ0lnXDmq+fkEdQLccWMG17M6AVjrLEA5Xq+BQgXkbwfznqMH1pjmZffV+
	 /jQ9ZRg5INcWWvDI4IOczany+FrInaig04H2lFFEwKQ8IBh/AxXgHGHt15yj8CvJvx
	 BmaAysa19gih6xUTabeMlWaGyQxVWIfqZoj0meeE4AIFqmHBywBlp44yy3g1JbVDkY
	 e0U2gUsmDI6vWNBdZrINqlHN1VNBiCRpalDHmddGtmaQO728zySLEXjS++vBmkZ+VS
	 kWjG0/ZtBHngnP7bdpCMB8K6XXIAMWRnU9ULomDEO7MIMXgBKk+OtNt0veP49qPxOQ
	 2YSb6kKISSexw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1trcC0-00CAea-6V;
	Mon, 10 Mar 2025 12:25:12 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v2 09/23] KVM: arm64: Compute FGT masks from KVM's own FGT tables
Date: Mon, 10 Mar 2025 12:24:51 +0000
Message-Id: <20250310122505.2857610-10-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250310122505.2857610-1-maz@kernel.org>
References: <20250310122505.2857610-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, mark.rutland@arm.com, tabba@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_052514_927761_CE365E47 
X-CRM114-Status: GOOD (  18.07  )
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

In the process of decoupling KVM's view of the FGT bits from the
wider architectural state, use KVM's own FGT tables to build
a synthitic view of what is actually known.

This allows for some checking along the way.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_arm.h  |   4 ++
 arch/arm64/include/asm/kvm_host.h |  14 ++++
 arch/arm64/kvm/emulate-nested.c   | 102 ++++++++++++++++++++++++++++++
 3 files changed, 120 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_arm.h b/arch/arm64/include/asm/kvm_arm.h
index 52bd4abc2a85d..9ff6fda07a68e 100644
--- a/arch/arm64/include/asm/kvm_arm.h
+++ b/arch/arm64/include/asm/kvm_arm.h
@@ -362,6 +362,10 @@
 #define __HAFGRTR_EL2_MASK	(GENMASK(49, 17) | GENMASK(4, 0))
 #define __HAFGRTR_EL2_nMASK	~(__HAFGRTR_EL2_RES0 | __HAFGRTR_EL2_MASK)
 
+/* Because the sysreg file mixes R and W... */
+#define HFGRTR_EL2_RES0		HFGxTR_EL2_RES0
+#define HFGWTR_EL2_RES0		(HFGRTR_EL2_RES0 | __HFGRTR_ONLY_MASK)
+
 /* Similar definitions for HCRX_EL2 */
 #define __HCRX_EL2_RES0         HCRX_EL2_RES0
 #define __HCRX_EL2_MASK		(BIT(6))
diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 3a7ec98ef1238..657fb8243ea63 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -569,6 +569,20 @@ struct kvm_sysreg_masks {
 	} mask[NR_SYS_REGS - __SANITISED_REG_START__];
 };
 
+struct fgt_masks {
+	const char	*str;
+	u64		mask;
+	u64		nmask;
+	u64		res0;
+};
+
+extern struct fgt_masks hfgrtr_masks;
+extern struct fgt_masks hfgwtr_masks;
+extern struct fgt_masks hfgitr_masks;
+extern struct fgt_masks hdfgrtr_masks;
+extern struct fgt_masks hdfgwtr_masks;
+extern struct fgt_masks hafgrtr_masks;
+
 struct kvm_cpu_context {
 	struct user_pt_regs regs;	/* sp = sp_el0 */
 
diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index 607d37bab70b4..bbfe89c37a86e 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -2033,6 +2033,101 @@ static u32 encoding_next(u32 encoding)
 	return sys_reg(op0 + 1, 0, 0, 0, 0);
 }
 
+#define FGT_MASKS(__n, __m)						\
+	struct fgt_masks __n = { .str = #__m, .res0 = __m, }
+
+FGT_MASKS(hfgrtr_masks, HFGRTR_EL2_RES0);
+FGT_MASKS(hfgwtr_masks, HFGWTR_EL2_RES0);
+FGT_MASKS(hfgitr_masks, HFGITR_EL2_RES0);
+FGT_MASKS(hdfgrtr_masks, HDFGRTR_EL2_RES0);
+FGT_MASKS(hdfgwtr_masks, HDFGWTR_EL2_RES0);
+FGT_MASKS(hafgrtr_masks, HAFGRTR_EL2_RES0);
+
+static __init bool aggregate_fgt(union trap_config tc)
+{
+	struct fgt_masks *rmasks, *wmasks;
+
+	switch (tc.fgt) {
+	case HFGxTR_GROUP:
+		rmasks = &hfgrtr_masks;
+		wmasks = &hfgwtr_masks;
+		break;
+	case HDFGRTR_GROUP:
+		rmasks = &hdfgrtr_masks;
+		wmasks = &hdfgwtr_masks;
+		break;
+	case HAFGRTR_GROUP:
+		rmasks = &hafgrtr_masks;
+		wmasks = NULL;
+		break;
+	case HFGITR_GROUP:
+		rmasks = &hfgitr_masks;
+		wmasks = NULL;
+		break;
+	}
+
+	/*
+	 * A bit can be reserved in either the R or W register, but
+	 * not both.
+	 */
+	if ((BIT(tc.bit) & rmasks->res0) &&
+	    (!wmasks || (BIT(tc.bit) & wmasks->res0)))
+		return false;
+
+	if (tc.pol)
+		rmasks->mask |= BIT(tc.bit) & ~rmasks->res0;
+	else
+		rmasks->nmask |= BIT(tc.bit) & ~rmasks->res0;
+
+	if (wmasks) {
+		if (tc.pol)
+			wmasks->mask |= BIT(tc.bit) & ~wmasks->res0;
+		else
+			wmasks->nmask |= BIT(tc.bit) & ~wmasks->res0;
+	}
+
+	return true;
+}
+
+static __init int check_fgt_masks(struct fgt_masks *masks)
+{
+	unsigned long duplicate = masks->mask & masks->nmask;
+	u64 res0 = masks->res0;
+	int ret = 0;
+
+	if (duplicate) {
+		int i;
+
+		for_each_set_bit(i, &duplicate, 64) {
+			kvm_err("%s[%d] bit has both polarities\n",
+				masks->str, i);
+		}
+
+		ret = -EINVAL;
+	}
+
+	masks->res0 = ~(masks->mask | masks->nmask);
+	if (masks->res0 != res0)
+		kvm_info("Implicit %s = %016llx, expecting %016llx\n",
+			 masks->str, masks->res0, res0);
+
+	return ret;
+}
+
+static __init int check_all_fgt_masks(int ret)
+{
+	int err = 0;
+
+	err |= check_fgt_masks(&hfgrtr_masks);
+	err |= check_fgt_masks(&hfgwtr_masks);
+	err |= check_fgt_masks(&hfgitr_masks);
+	err |= check_fgt_masks(&hdfgrtr_masks);
+	err |= check_fgt_masks(&hdfgwtr_masks);
+	err |= check_fgt_masks(&hafgrtr_masks);
+
+	return ret ?: err;
+}
+
 int __init populate_nv_trap_config(void)
 {
 	int ret = 0;
@@ -2097,8 +2192,15 @@ int __init populate_nv_trap_config(void)
 			ret = xa_err(prev);
 			print_nv_trap_error(fgt, "Failed FGT insertion", ret);
 		}
+
+		if (!aggregate_fgt(tc)) {
+			ret = -EINVAL;
+			print_nv_trap_error(fgt, "FGT bit is reserved", ret);
+		}
 	}
 
+	ret = check_all_fgt_masks(ret);
+
 	kvm_info("nv: %ld fine grained trap handlers\n",
 		 ARRAY_SIZE(encoding_to_fgt));
 
-- 
2.39.2


