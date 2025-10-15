Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D93CCCD190
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 07:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1TpSwPt1VGh7Gk+Fa8nwIUwNB6ReS/Yt278WtCTK9UY=; b=t9khAS1GM8mTAxAY6Fg1NVEvzS
	jsx6gh559JL3c4bHgH4SbW/L5JVTDYIQpQjjH5fnak6ViHvfsCAl/zJaNeGW9gE+Msv0WFySgYV9L
	JIcsI6OpQ2kWKrUAYpDbVMII+yO+Wk4SR3u4R8052iz8e0C9cMzW3r0x0mbJpCU5dFSiqq+tdDQPT
	0YtLOI8KWmdfimdtIDniGqhCF+IkjNKi6x1BHmlOHGTqamIml8ksqjkMEQjjTrJM9N0eeNW+hkOpa
	yxptNYHYZm5AH4BM1lGEPTOawzaS8NtKlGLQQER4WIE4iazilZjpNYdRupOhRtiFd0BZTBKVXIxue
	44oCgy0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8vjl-00000000gcR-3QHu;
	Wed, 15 Oct 2025 07:15:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8vjk-00000000gZa-1lSt;
	Wed, 15 Oct 2025 07:15:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D782861278;
	Wed, 15 Oct 2025 07:15:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BA3EC4CEF8;
	Wed, 15 Oct 2025 07:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760512551;
	bh=7Xfx4Gtt1A7e+sygtsql3O/QaS8Irt67/L0QwGoKAEc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nK9B6WEINI42DCw3YaYez/obN3YwzzHIQjhB8GDDsA+wW/90JxgJAjLEJneKg6dc6
	 TJHMjHi/ep0Kln0JAkLRB3h85TP7Ezv1YGineXiRrjP2R3ZmY0eLX6bje9hdvpcqNv
	 4E3tujP5j3INUo4V1vVqIc/u7f7qc6w7uxqVlNgnB/yu/I07qMIk5IZhPxW1g/8z8G
	 zZX843xDQ0D4LUytcLtTgdpSX24KuJVpv0zmxyrGZ01AjdBiYTY+bmr+s1W6buNsGi
	 qdIGkgOHJGofho1YYSJh8oXpfIYnY1aad+JYi7wzYuTSvSIpkyv2rY7uIDGx15qtnF
	 vQA2W/U/r50Jw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 15 Oct 2025 09:15:08 +0200
Subject: [PATCH net-next 08/12] net: airoha: ppe: Configure SRAM PPE
 entries via the cpu
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-an7583-eth-support-v1-8-064855f05923@kernel.org>
References: <20251015-an7583-eth-support-v1-0-064855f05923@kernel.org>
In-Reply-To: <20251015-an7583-eth-support-v1-0-064855f05923@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
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

Introduce airoha_ppe_foe_commit_sram_entry routine in order to configure
the SRAM PPE entries directly via the CPU instead of using the NPU APIs.
This is a preliminary patch to enable netfilter flowtable hw offload for
AN7583 SoC.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_ppe.c | 30 +++++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index fcfd2d8826a9c2f8f94f1962c2b2a69f67f7f598..0ee2e41489aaa9de9c1e99d242ee0bec11549750 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -662,6 +662,27 @@ static bool airoha_ppe_foe_compare_entry(struct airoha_flow_table_entry *e,
 	return !memcmp(&e->data.d, &hwe->d, len - sizeof(hwe->ib1));
 }
 
+static int airoha_ppe_foe_commit_sram_entry(struct airoha_ppe *ppe, u32 hash)
+{
+	struct airoha_foe_entry *hwe = ppe->foe + hash * sizeof(*hwe);
+	bool ppe2 = hash >= PPE_SRAM_NUM_ENTRIES;
+	u32 *ptr = (u32 *)hwe, val;
+	int i;
+
+	for (i = 0; i < sizeof(*hwe) / 4; i++)
+		airoha_fe_wr(ppe->eth, REG_PPE_RAM_ENTRY(ppe2, i), ptr[i]);
+
+	wmb();
+	airoha_fe_wr(ppe->eth, REG_PPE_RAM_CTRL(ppe2),
+		     FIELD_PREP(PPE_SRAM_CTRL_ENTRY_MASK, hash) |
+		     PPE_SRAM_CTRL_WR_MASK | PPE_SRAM_CTRL_REQ_MASK);
+
+	return read_poll_timeout_atomic(airoha_fe_rr, val,
+					val & PPE_SRAM_CTRL_ACK_MASK,
+					10, 100, false, ppe->eth,
+					REG_PPE_RAM_CTRL(ppe2));
+}
+
 static int airoha_ppe_foe_commit_entry(struct airoha_ppe *ppe,
 				       struct airoha_foe_entry *e,
 				       u32 hash, bool rx_wlan)
@@ -691,13 +712,8 @@ static int airoha_ppe_foe_commit_entry(struct airoha_ppe *ppe,
 	if (!rx_wlan)
 		airoha_ppe_foe_flow_stats_update(ppe, npu, hwe, hash);
 
-	if (hash < sram_num_entries) {
-		dma_addr_t addr = ppe->foe_dma + hash * sizeof(*hwe);
-		bool ppe2 = hash >= PPE_SRAM_NUM_ENTRIES;
-
-		err = npu->ops.ppe_foe_commit_entry(npu, addr, sizeof(*hwe),
-						    hash, ppe2);
-	}
+	if (hash < sram_num_entries)
+		err = airoha_ppe_foe_commit_sram_entry(ppe, hash);
 unlock:
 	rcu_read_unlock();
 

-- 
2.51.0


