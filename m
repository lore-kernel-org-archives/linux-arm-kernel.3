Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 863EECF9C51
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 17:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wPyGHPRna034ITPTV713t2J/PPtNcyhRa6/5XVynKOg=; b=jCfK0wRjr45dczhh4sAhAPOaKT
	yknuXuInyysRmJWFRmGTBbvtqIqjqbI8c9UX6GCXNQENHJXjbq2h71eBhEcZzt4srPc78eC6OhDgV
	13V9EBgD6T3to/yrdvZ8J192N1Wr24MelTFNW5YOMshTDtaO3pEt2M4FT6YSYTyaDVtyWQUCLiF9d
	ES+jtBOSFRsD+BwR9c8DFk4htnmChd9iFPDKIS+/n366sE5mBthkxJQtGhoFEKmBkovo2kKyhMldw
	V6x+odU5E9FsfkYlrxKyZYlFG5qThpn2Q1qUCA6x9dTpAXwhgw0bSBfImG72KKIDGGGo9+B2is0RQ
	zDoZnaPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8QR-000000076RP-2fSj;
	Thu, 20 Nov 2025 17:26:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8Q1-000000075bE-2oaW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 17:26:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8C6BA44431;
	Thu, 20 Nov 2025 17:26:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70B1AC19423;
	Thu, 20 Nov 2025 17:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763659565;
	bh=74pgP/bZ5hdtuI7lcrAtWgPxkfi9NnSDOfGi5xsnYtE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hjjmK8AL/kUUOVQaTVLq+uMe210mLkKEF700wRqoNfj7MRrKoB5fhI+TN1whVPxFW
	 cFKjaPihe0J1Qo6PGYraMVOAm2U0YrfnVQRUqYQMzGzZBq3tYhw2c1nAUkDXV24Nm1
	 isBX31Cd0T5ZDpCyyWTyDH+JKtNsTys0oZ847KfPK+Z0vMe6nOva+CJmDSXZXZAqCz
	 L7UQ5p8U+KHyHeqnB+fiTQcvDvl+T6fxZ7zBERv+W85jnQodt/HnXIG65EoHMDURr0
	 yJBgy/T2BYBpN8fdsCvcsMxNK2JupeKBB4Em7QndY/nml3TPka9xG5zAZTBDpxtU51
	 UB1DzVeY5TJQg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vM8Pz-00000006y6g-2sMg;
	Thu, 20 Nov 2025 17:26:03 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v4 40/49] KVM: arm64: selftests: gic_v3: Add irq group setting helper
Date: Thu, 20 Nov 2025 17:25:30 +0000
Message-ID: <20251120172540.2267180-41-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251120172540.2267180-1-maz@kernel.org>
References: <20251120172540.2267180-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, christoffer.dall@arm.com, tabba@google.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_092605_776171_DD953846 
X-CRM114-Status: GOOD (  11.44  )
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

Being able to set the group of an interrupt is pretty useful.
Add such a helper.

Tested-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 tools/testing/selftests/kvm/include/arm64/gic.h   |  1 +
 tools/testing/selftests/kvm/lib/arm64/gic.c       |  6 ++++++
 .../testing/selftests/kvm/lib/arm64/gic_private.h |  1 +
 tools/testing/selftests/kvm/lib/arm64/gic_v3.c    | 15 +++++++++++++++
 4 files changed, 23 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/arm64/gic.h b/tools/testing/selftests/kvm/include/arm64/gic.h
index baeb3c859389d..cc7a7f34ed377 100644
--- a/tools/testing/selftests/kvm/include/arm64/gic.h
+++ b/tools/testing/selftests/kvm/include/arm64/gic.h
@@ -57,6 +57,7 @@ void gic_irq_set_pending(unsigned int intid);
 void gic_irq_clear_pending(unsigned int intid);
 bool gic_irq_get_pending(unsigned int intid);
 void gic_irq_set_config(unsigned int intid, bool is_edge);
+void gic_irq_set_group(unsigned int intid, bool group);
 
 void gic_rdist_enable_lpis(vm_paddr_t cfg_table, size_t cfg_table_size,
 			   vm_paddr_t pend_table);
diff --git a/tools/testing/selftests/kvm/lib/arm64/gic.c b/tools/testing/selftests/kvm/lib/arm64/gic.c
index 7abbf8866512a..b023868fe0b82 100644
--- a/tools/testing/selftests/kvm/lib/arm64/gic.c
+++ b/tools/testing/selftests/kvm/lib/arm64/gic.c
@@ -155,3 +155,9 @@ void gic_irq_set_config(unsigned int intid, bool is_edge)
 	GUEST_ASSERT(gic_common_ops);
 	gic_common_ops->gic_irq_set_config(intid, is_edge);
 }
+
+void gic_irq_set_group(unsigned int intid, bool group)
+{
+	GUEST_ASSERT(gic_common_ops);
+	gic_common_ops->gic_irq_set_group(intid, group);
+}
diff --git a/tools/testing/selftests/kvm/lib/arm64/gic_private.h b/tools/testing/selftests/kvm/lib/arm64/gic_private.h
index d24e9ecc96c6d..b6a7e30c3eb1f 100644
--- a/tools/testing/selftests/kvm/lib/arm64/gic_private.h
+++ b/tools/testing/selftests/kvm/lib/arm64/gic_private.h
@@ -25,6 +25,7 @@ struct gic_common_ops {
 	void (*gic_irq_clear_pending)(uint32_t intid);
 	bool (*gic_irq_get_pending)(uint32_t intid);
 	void (*gic_irq_set_config)(uint32_t intid, bool is_edge);
+	void (*gic_irq_set_group)(uint32_t intid, bool group);
 };
 
 extern const struct gic_common_ops gicv3_ops;
diff --git a/tools/testing/selftests/kvm/lib/arm64/gic_v3.c b/tools/testing/selftests/kvm/lib/arm64/gic_v3.c
index 66d05506f78b1..3e4e1a6a4f7c3 100644
--- a/tools/testing/selftests/kvm/lib/arm64/gic_v3.c
+++ b/tools/testing/selftests/kvm/lib/arm64/gic_v3.c
@@ -293,6 +293,20 @@ static void gicv3_enable_redist(volatile void *redist_base)
 	}
 }
 
+static void gicv3_set_group(uint32_t intid, bool grp)
+{
+	uint32_t cpu_or_dist;
+	uint32_t val;
+
+	cpu_or_dist = (get_intid_range(intid) == SPI_RANGE) ? DIST_BIT : guest_get_vcpuid();
+	val = gicv3_reg_readl(cpu_or_dist, GICD_IGROUPR + (intid / 32) * 4);
+	if (grp)
+		val |= BIT(intid % 32);
+	else
+		val &= ~BIT(intid % 32);
+	gicv3_reg_writel(cpu_or_dist, GICD_IGROUPR + (intid / 32) * 4, val);
+}
+
 static void gicv3_cpu_init(unsigned int cpu)
 {
 	volatile void *sgi_base;
@@ -400,6 +414,7 @@ const struct gic_common_ops gicv3_ops = {
 	.gic_irq_clear_pending = gicv3_irq_clear_pending,
 	.gic_irq_get_pending = gicv3_irq_get_pending,
 	.gic_irq_set_config = gicv3_irq_set_config,
+	.gic_irq_set_group = gicv3_set_group,
 };
 
 void gic_rdist_enable_lpis(vm_paddr_t cfg_table, size_t cfg_table_size,
-- 
2.47.3


