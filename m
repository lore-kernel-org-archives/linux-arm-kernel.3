Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE982C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 12:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=J4R+3pU08OkX3gKtctWPVhTGZmgj7VlZ1diX4X8BMsk=; b=20OE8KiXmF4S9Iy/hlcgPrR4aw
	kAcenuV/kdAohtc5vbVyBxiykVbnQ8r/OLNRCrYRdWUb2Eyysi5yJU5rBjX2g961ex8DNlD/6/BGH
	T8UfScsaY99yK8ZmzHsI+fSxixjd4/9xrtBg7S8nQyI7YrjM1oQy/Rc3uy5A50Tx7nVTaWMq+4TzJ
	VAw/6X6hfXkCbUtibJBotMw4dnnc6wzDJicKI2RlPwLcGPFDg6MiG1WM5q0Uk06L8yEWk34R+/Sku
	pD0pAPs+vWSs0wGb+NgkbrCIFEcNEX7ZqJ8mPAt6VWdYKe9GuB6a5X3nMRZJ+9tJ+1sMKiSFx1cgZ
	IYG+y6Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugMYB-0000000EOEm-2t3a;
	Mon, 28 Jul 2025 12:01:51 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugMUw-0000000ENhv-17jL;
	Mon, 28 Jul 2025 11:58:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 51984A54CC6;
	Mon, 28 Jul 2025 11:58:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D697C4CEF8;
	Mon, 28 Jul 2025 11:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753703908;
	bh=i7aKOq5KQVfB2/q14tophkJxPE1KTHjxLov6PFKAuzw=;
	h=From:Date:Subject:To:Cc:From;
	b=UiGFFLRXph6DIdO80VKAEFr2r6lwmFgP4INSrr85ATz85g79zqF06Rx5g03sDaGVU
	 L0Sqmb0Na8c0PN/ylDtMv7CEuixYli5AI70nU37zR0mneU4ZoxIvL/KbSddUBvKAo+
	 nECOR9/VZf1Wr77gN7+KYaQxpcHA3vfqVh9MnO6XAMxBnKcb3cLgG9pjtQv3WiWimA
	 NS+vhowSnmqMzmFYkMG4l7ZOcyNthPkXqLJgxaF9ZV7m2b07DezwEJKj52Mdj8BwJR
	 x5jxgsme08NjPMBzs5cuV/muESj8VaPzUoWHnXKtF8hb/LLwJvFN966vXYXNC2U+O9
	 FG2ierM9a/5AQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 28 Jul 2025 13:58:08 +0200
Subject: [PATCH net] net: airoha: Fix PPE table access in
 airoha_ppe_debugfs_foe_show()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250728-airoha_ppe_foe_get_entry_locked-v1-1-8630ec73f3d1@kernel.org>
X-B4-Tracking: v=1; b=H4sIAM9lh2gC/x3NQQqDMBBG4avIrA2kwaL1KkWGqL86VJIwkdIi3
 r2hy2/z3kkZKsjUVycp3pIlhoJbXdG0+bDCyFxMzrq7bV1nvGjcPKcEXiJ4xcEIh355j9MLs2k
 tGowj8OgaKpWkWOTzPzyH6/oBWBGJdXEAAAA=
X-Change-ID: 20250728-airoha_ppe_foe_get_entry_locked-70e4ebbee984
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_045830_461901_06879D31 
X-CRM114-Status: GOOD (  11.99  )
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

In order to avoid any possible race we need to hold the ppe_lock
spinlock accessing the hw PPE table. airoha_ppe_foe_get_entry routine is
always executed holding ppe_lock except in airoha_ppe_debugfs_foe_show
routine. Fix the problem introducing airoha_ppe_foe_get_entry_locked
routine.

Fixes: 3fe15c640f380 ("net: airoha: Introduce PPE debugfs support")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.h         |  4 ++--
 drivers/net/ethernet/airoha/airoha_ppe.c         | 18 ++++++++++++++++--
 drivers/net/ethernet/airoha/airoha_ppe_debugfs.c |  2 +-
 3 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index a970b789cf232c316e5ea27b0146493bf91c3767..cf33d731ad0db43bca8463fde76673b39a4f6796 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -615,8 +615,8 @@ int airoha_ppe_setup_tc_block_cb(struct net_device *dev, void *type_data);
 int airoha_ppe_init(struct airoha_eth *eth);
 void airoha_ppe_deinit(struct airoha_eth *eth);
 void airoha_ppe_init_upd_mem(struct airoha_gdm_port *port);
-struct airoha_foe_entry *airoha_ppe_foe_get_entry(struct airoha_ppe *ppe,
-						  u32 hash);
+struct airoha_foe_entry *
+airoha_ppe_foe_get_entry_locked(struct airoha_ppe *ppe, u32 hash);
 void airoha_ppe_foe_entry_get_stats(struct airoha_ppe *ppe, u32 hash,
 				    struct airoha_foe_stats64 *stats);
 
diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index 0e217acfc5ef748453b020e5713ace1910abc4a8..4dbf2bf187d02e3e8b9d2b966036c3aa58c867b1 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -498,9 +498,11 @@ static void airoha_ppe_foe_flow_stats_update(struct airoha_ppe *ppe,
 		FIELD_PREP(AIROHA_FOE_IB2_NBQ, nbq);
 }
 
-struct airoha_foe_entry *airoha_ppe_foe_get_entry(struct airoha_ppe *ppe,
-						  u32 hash)
+static struct airoha_foe_entry *
+airoha_ppe_foe_get_entry(struct airoha_ppe *ppe, u32 hash)
 {
+	lockdep_assert_held(&ppe_lock);
+
 	if (hash < PPE_SRAM_NUM_ENTRIES) {
 		u32 *hwe = ppe->foe + hash * sizeof(struct airoha_foe_entry);
 		struct airoha_eth *eth = ppe->eth;
@@ -527,6 +529,18 @@ struct airoha_foe_entry *airoha_ppe_foe_get_entry(struct airoha_ppe *ppe,
 	return ppe->foe + hash * sizeof(struct airoha_foe_entry);
 }
 
+struct airoha_foe_entry *
+airoha_ppe_foe_get_entry_locked(struct airoha_ppe *ppe, u32 hash)
+{
+	struct airoha_foe_entry *hwe;
+
+	spin_lock_bh(&ppe_lock);
+	hwe = airoha_ppe_foe_get_entry(ppe, hash);
+	spin_unlock_bh(&ppe_lock);
+
+	return hwe;
+}
+
 static bool airoha_ppe_foe_compare_entry(struct airoha_flow_table_entry *e,
 					 struct airoha_foe_entry *hwe)
 {
diff --git a/drivers/net/ethernet/airoha/airoha_ppe_debugfs.c b/drivers/net/ethernet/airoha/airoha_ppe_debugfs.c
index 05a756233f6a44fa51d1c57dd39d89c8ea488054..992bf2e9598414ee3f1f126be3f451e486b26640 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe_debugfs.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe_debugfs.c
@@ -67,7 +67,7 @@ static int airoha_ppe_debugfs_foe_show(struct seq_file *m, void *private,
 		u32 type, state, ib2, data;
 		bool ipv6 = false;
 
-		hwe = airoha_ppe_foe_get_entry(ppe, i);
+		hwe = airoha_ppe_foe_get_entry_locked(ppe, i);
 		if (!hwe)
 			continue;
 

---
base-commit: afd8c2c9e2e29c6c7705635bea2960593976dacc
change-id: 20250728-airoha_ppe_foe_get_entry_locked-70e4ebbee984

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


