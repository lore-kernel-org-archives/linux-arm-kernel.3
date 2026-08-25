Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2B12C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 16:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iR2QiG0Sai2JU3flZPc7oLIVw9Px1ZlLeFHfTecvox8=; b=vUKIE7E2VdemUjKLdLW3Gixq1D
	PT3T5mIu8EGWnb2zZJRz5mZ7qf04eTVHd/z5tLHS+NukF6iagU9PAAR0TtBlWrTakOgdLedEYK1FT
	IVOaqCLoJo+J558SnsuZMxoTWWcUZ54V4a9CeuMKb4AtuDXB6qwHZXfr5s2ckZaIZS1Bg+Mc6TO+i
	tmFhA0u7PMmHvI6CY0SetJa7clQUtzcrFkZg1iAeMwgc6y9/QcH/VZQeHKuQ0FwpeKzKUZbhM7bHp
	fuGFlHsaY97D5XKT8mlE0J9K6HvGJLhYJyuVc9LR1pS9zFzeE2IgNV8xcJ/LKRcRj6bUYGnKpePkn
	9FtgT9ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyuES-000000018Cw-0gnl;
	Tue, 25 Aug 2026 16:42:40 +0000
Received: from out-131.mta1.migadu.com ([2001:41d0:203:375::83] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyuEK-0000000189x-0NkT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 16:42:35 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=zQU2cneHWYiXgdAM5Ki7+W+91fket5ATQUH8SgIxbj8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787676150; v=1; x=1788280950;
 b=JeBT/yCId6Nw/f6FxMpE+FJ9DvG61j0vYhq4T1ddN5O92skKQ2/Xas5uIh6bqC2269YRGDIT
 OZupAdBGbry7mKjL8YWmjq/L8j1aqi+wyrtFmP1IbnYDhK5fj2ykyIQwdCLagtJvPMpmITRas3k
 KXFYvJXlgUbcfeqFrJybgelk=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: from claudy.local (2a01:4b00:ad36:1d00:3a05:25ff:fe33:35a9)
	by smtp.migadu.com with ESMTPS id eb5a6faaae912dd9;
	Tue, 25 Aug 2026 16:42:30 +0000
X-Mizu-Trace-ID: eb5a6faaae912dd9
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mark Brown <broonie@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v4 1/2] arm64: Apply overrides to CPU local capabilities
Date: Tue, 25 Aug 2026 17:42:18 +0100
Message-Id: <20260825164219.3347229-2-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260825164219.3347229-1-fuad.tabba@linux.dev>
References: <20260825164219.3347229-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_094232_272697_066BDA49 
X-CRM114-Status: GOOD (  13.92  )
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

From: Suzuki K Poulose <suzuki.poulose@arm.com>

If an override has been applied, make sure we apply that for the
secondary CPUs too, to limit the features.

Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Link: https://lore.kernel.org/all/afc5bd00-28ca-413b-b047-ee53589c285d@arm.com/
Cc: stable@vger.kernel.org
[Fuad: whitespace and comment fixes]
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kernel/cpufeature.c | 42 +++++++++++++++++++++++++++-------
 1 file changed, 34 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 9a22df0c5120f..88b15b5ef2f7f 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -1232,10 +1232,43 @@ void __init init_cpu_features(struct cpuinfo_arm64 *info)
 		init_cpu_ftr_reg(SYS_GMID_EL1, info->reg_gmid);
 }
 
+/*
+ * Sanitise the register fields to clamp the values to the overrides that
+ * have been applied.
+ */
+static u64 override_cpu_ftr_reg(struct arm64_ftr_reg *reg, u64 val)
+{
+	const struct arm64_ftr_bits *ftrp;
+
+	if (!reg || !reg->override->mask)
+		return val;
+
+	for (ftrp = reg->ftr_bits; ftrp->width; ftrp++) {
+		u64 ftr_mask = arm64_ftr_mask(ftrp);
+		s64 ftr_val, ftr_ovr, ftr_safe;
+
+		/* Skip the fields not overridden */
+		if ((ftr_mask & reg->override->mask) != ftr_mask)
+			continue;
+
+		ftr_val = arm64_ftr_value(ftrp, val);
+		ftr_ovr = arm64_ftr_value(ftrp, reg->override->val);
+		ftr_safe = arm64_ftr_safe_value(ftrp, ftr_ovr, ftr_val);
+
+		if (ftr_safe != ftr_val)
+			val = arm64_ftr_set_value(ftrp, val, ftr_safe);
+	}
+
+	return val;
+}
+
 static void update_cpu_ftr_reg(struct arm64_ftr_reg *reg, u64 new)
 {
 	const struct arm64_ftr_bits *ftrp;
 
+	/* Apply the overrides */
+	new = override_cpu_ftr_reg(reg, new);
+
 	for (ftrp = reg->ftr_bits; ftrp->width; ftrp++) {
 		s64 ftr_cur = arm64_ftr_value(ftrp, reg->sys_val);
 		s64 ftr_new = arm64_ftr_value(ftrp, new);
@@ -1539,7 +1572,6 @@ EXPORT_SYMBOL_GPL(read_sanitised_ftr_reg);
  */
 u64 __read_sysreg_by_encoding(u32 sys_id)
 {
-	struct arm64_ftr_reg *regp;
 	u64 val;
 
 	switch (sys_id) {
@@ -1592,13 +1624,7 @@ u64 __read_sysreg_by_encoding(u32 sys_id)
 		return 0;
 	}
 
-	regp  = get_arm64_ftr_reg(sys_id);
-	if (regp) {
-		val &= ~regp->override->mask;
-		val |= (regp->override->val & regp->override->mask);
-	}
-
-	return val;
+	return override_cpu_ftr_reg(get_arm64_ftr_reg(sys_id), val);
 }
 
 #include <linux/irqchip/arm-gic-v3.h>
-- 
2.39.5


