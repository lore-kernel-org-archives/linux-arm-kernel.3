Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 833AAC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 13:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=slhW2rwIj+qGJeGkrjjjkYkQ2pUTlvWcMIJ8rz3jURE=; b=I6UCNMYu3jrAORXbRoDKqh7Hjj
	mboMUWIO1wQA5LMMEFA5qmD5itnjBtmkL+fhnuOiAAIYeVF7Bxln9NWYLLcA5bhKp2yzbtG0wwdXJ
	jeW4GItK8na7MnBqlmzYT7pCpsnKX6zojLvLPG87LFmqMvCmZCRifjGAiRYjoQR/PY3ro1jWQj7Gq
	SryqI9qgOgHELfrJTlS1CFsLZDs30/3/vP5L87IcdSjoTBjoqeqzNVA1CwR8YQEaOkUM2CUYXhor2
	RQHkjFIGztZFq2AT1f2s93cKAUP75ht+OuNz0IeFck7JfosSUxVIPnuU+e+ze4tuRqU2jCRKcW2yz
	HDDSb1fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trczt-00000002lEd-3oIU;
	Mon, 10 Mar 2025 13:16:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trcC5-00000002bTz-11nB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 12:25:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 404785C6306;
	Mon, 10 Mar 2025 12:23:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5240C4CEEF;
	Mon, 10 Mar 2025 12:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741609516;
	bh=VqanVys6U0Zgtoq6VTrmGdkaMMXAYFhbvoCeIw8qE9Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U38UHe9LqXiWa99e/lij2DHBiKOWyQ9+X0ZYUnS7TiAO+2AsnXOsU34bcwFYSyQSC
	 Lf4Lgf8KSuYFs459f5e9DENX3UAfLvnJ1548IjGzBASV8EQSW1d15hPbkxgqnyc4X4
	 V3shbsBu4lOUj5PhdFFX8kDw8db7AyvuwFZ5Q9Ej28JSGYecsnRB7A6T9BhXfNget2
	 RffF1noDHR56rbFgUtLrDGNBFctRLkEmejWZuNR3C0efhOAy71igEZxxwZpspcYOIZ
	 iDjLWfZqJGphTjkqVLdYRoNQE70OmptHKIzZVELtpSDRk0Fr6fngUc3FkXJw1RoyJR
	 oHwCstJLRtcAw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1trcC3-00CAea-2t;
	Mon, 10 Mar 2025 12:25:15 +0000
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
Subject: [PATCH v2 19/23] KVM: arm64: Validate FGT register descriptions against RES0 masks
Date: Mon, 10 Mar 2025 12:25:01 +0000
Message-Id: <20250310122505.2857610-20-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20250310_052517_382461_9232ED0D 
X-CRM114-Status: GOOD (  14.23  )
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

In order to point out to the unsuspecting KVM hacker that they
are missing something somewhere, validate that the known FGT bits
do not intersect with the corresponding RES0 mask, as computed at
boot time.

THis check is also performed at boot time, ensuring that there is
no runtime overhead.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h |  1 +
 arch/arm64/kvm/config.c           | 29 +++++++++++++++++++++++++++++
 arch/arm64/kvm/sys_regs.c         |  2 ++
 3 files changed, 32 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index fa046a9ad8264..c98f7eed68142 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1565,5 +1565,6 @@ void kvm_set_vm_id_reg(struct kvm *kvm, u32 reg, u64 val);
 	(kvm_has_feat((k), ID_AA64MMFR3_EL1, S1POE, IMP))
 
 void compute_fgu(struct kvm *kvm, enum fgt_group_id fgt);
+void check_feature_map(void);
 
 #endif /* __ARM64_KVM_HOST_H__ */
diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index e38da17445926..d39f1f14e3dc4 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -494,6 +494,35 @@ static struct reg_bits_to_feat_map hafgrtr_feat_map[] = {
 		   FEAT_AMUv1),
 };
 
+static void __init check_feat_map(struct reg_bits_to_feat_map *map,
+				  int map_size, u64 res0, const char *str)
+{
+	u64 mask = 0;
+
+	for (int i = 0; i < map_size; i++)
+		mask |= map[i].bits;
+
+	if (mask != ~res0)
+		kvm_err("Undefined %s behaviour, bits %016llx\n",
+			str, mask ^ ~res0);
+}
+
+void __init check_feature_map(void)
+{
+	check_feat_map(hfgrtr_feat_map, ARRAY_SIZE(hfgrtr_feat_map),
+		       hfgrtr_masks.res0, hfgrtr_masks.str);
+	check_feat_map(hfgwtr_feat_map, ARRAY_SIZE(hfgwtr_feat_map),
+		       hfgwtr_masks.res0, hfgwtr_masks.str);
+	check_feat_map(hfgitr_feat_map, ARRAY_SIZE(hfgitr_feat_map),
+		       hfgitr_masks.res0, hfgitr_masks.str);
+	check_feat_map(hdfgrtr_feat_map, ARRAY_SIZE(hdfgrtr_feat_map),
+		       hdfgrtr_masks.res0, hdfgrtr_masks.str);
+	check_feat_map(hdfgwtr_feat_map, ARRAY_SIZE(hdfgwtr_feat_map),
+		       hdfgwtr_masks.res0, hdfgwtr_masks.str);
+	check_feat_map(hafgrtr_feat_map, ARRAY_SIZE(hafgrtr_feat_map),
+		       hafgrtr_masks.res0, hafgrtr_masks.str);
+}
+
 static bool idreg_feat_match(struct kvm *kvm, struct reg_bits_to_feat_map *map)
 {
 	u64 regval = kvm->arch.id_regs[map->regidx];
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index d3990ceaa59c2..89fc07c57e438 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -5058,6 +5058,8 @@ int __init kvm_sys_reg_table_init(void)
 
 	ret = populate_nv_trap_config();
 
+	check_feature_map();
+
 	for (i = 0; !ret && i < ARRAY_SIZE(sys_reg_descs); i++)
 		ret = populate_sysreg_config(sys_reg_descs + i, i);
 
-- 
2.39.2


