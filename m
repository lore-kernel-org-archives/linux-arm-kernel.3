Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3444CCD194
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 10:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kKyjGiyd7indH53/JCj/Agdp6vht+UmUXB46TuKzHAg=; b=OONhxpKnNuF2AiOfDTe5/qmGEf
	SBV/RjugOPJtFPW25Axr3bxQnx9A/3GfCfuZL1GRhaI9ogIYxlBXtKAeKGK1V68K+KMdJgA98yu4B
	363xON2Nipl7dFVlP9NkENpfKf8GuVdaHIlej2xxIp23TotR+MwkdkwMQzDhaNSm9V/AR9HefxmIp
	vpl9pTiYcst9Y9lAHIvGz8IZkgjltYL5iD/LTombzZkP3QK+cyZqw3+U+Dk3SusUczaU0xKt/KTS3
	90QQBFynmlKWYYqxX3YdhSrXHP+y3PwqSvxP1be7ECK6Y4xf2h53UhH9lapzulYHrJk80ChyvTI5p
	k6sjtvVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9LEO-00000004QJS-1tEn;
	Thu, 16 Oct 2025 10:29:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9LEF-00000004Q7k-1ftx;
	Thu, 16 Oct 2025 10:29:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BC8AF63EB9;
	Thu, 16 Oct 2025 10:29:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1597CC4CEF9;
	Thu, 16 Oct 2025 10:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760610542;
	bh=2hNyNS6XgkjccYANXlv5LduUzRd2LBIUmU8MlMuX+94=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=is4hDyEifiBZhX1q9qu4NFgRnxQuuQiFogwQq0UM9woOUxn9dlLzvPXpR1KrVhzT4
	 QwIdYdZykCDTyYJOKcEVYoL/GXpSEoaWOon2dWexXGSfNhzLfXDT1wKaTzfGkqeSb9
	 eYGL9TYzBe1kr6WdJ5wzV88Lx+r2SZolG5N8t6pexNx2r5lh1mv7pmby/gcgUDjKaJ
	 qwPkO/cA8g/6hFekFbK2xex/2kLEURJinjQ/TCaVwuUAWBbTzipWoMEsj5YoGQ21t5
	 fN2J6kFNDff4O21OQjI+Kh/lu0G/758Hu4bxTK+ueeoi6Wjd3ho2bzD/Wn3gHeAqSE
	 2F9Bp7Ou9r3AQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 16 Oct 2025 12:28:23 +0200
Subject: [PATCH net-next v2 09/13] net: airoha: ppe: Flush PPE SRAM table
 during PPE setup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-an7583-eth-support-v2-9-ea6e7e9acbdb@kernel.org>
References: <20251016-an7583-eth-support-v2-0-ea6e7e9acbdb@kernel.org>
In-Reply-To: <20251016-an7583-eth-support-v2-0-ea6e7e9acbdb@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, Simon Horman <horms@kernel.org>
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

Rely on airoha_ppe_foe_commit_sram_entry routine to flush SRAM PPE table
entries. This patch allow moving PPE SRAM flush during PPE setup and
avoid dumping uninitialized values via the debugfs if no entries are
offloaded yet.

Reviewed-by: Simon Horman <horms@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_ppe.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index 46755bc60a8e822b296e188c061c45eae0b88cb5..4b038673cefe20b47c42dd1419c05b57d4d6c64d 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -1291,18 +1291,22 @@ static int airoha_ppe_flow_offload_cmd(struct airoha_eth *eth,
 	return -EOPNOTSUPP;
 }
 
-static int airoha_ppe_flush_sram_entries(struct airoha_ppe *ppe,
-					 struct airoha_npu *npu)
+static int airoha_ppe_flush_sram_entries(struct airoha_ppe *ppe)
 {
 	u32 sram_num_entries = airoha_ppe_get_total_sram_num_entries(ppe);
 	struct airoha_foe_entry *hwe = ppe->foe;
-	int i;
+	int i, err = 0;
+
+	for (i = 0; i < sram_num_entries; i++) {
+		int err;
 
-	for (i = 0; i < PPE_SRAM_NUM_ENTRIES; i++)
 		memset(&hwe[i], 0, sizeof(*hwe));
+		err = airoha_ppe_foe_commit_sram_entry(ppe, i);
+		if (err)
+			break;
+	}
 
-	return npu->ops.ppe_flush_sram_entries(npu, ppe->foe_dma,
-					       sram_num_entries);
+	return err;
 }
 
 static struct airoha_npu *airoha_ppe_npu_get(struct airoha_eth *eth)
@@ -1339,10 +1343,6 @@ static int airoha_ppe_offload_setup(struct airoha_eth *eth)
 	}
 
 	airoha_ppe_hw_init(ppe);
-	err = airoha_ppe_flush_sram_entries(ppe, npu);
-	if (err)
-		goto error_npu_put;
-
 	airoha_ppe_foe_flow_stats_reset(ppe, npu);
 
 	rcu_assign_pointer(eth->npu, npu);
@@ -1513,6 +1513,10 @@ int airoha_ppe_init(struct airoha_eth *eth)
 	if (!ppe->foe_check_time)
 		return -ENOMEM;
 
+	err = airoha_ppe_flush_sram_entries(ppe);
+	if (err)
+		return err;
+
 	err = rhashtable_init(&eth->flow_table, &airoha_flow_table_params);
 	if (err)
 		return err;

-- 
2.51.0


