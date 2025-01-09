Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E6DE77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 18:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oYQq0YiOeQQciTclQrTj/xClxkR1FT7moAWDxNGUsWM=; b=ZVoycdTitzfXUQO3oJoYFWLG2z
	Ci155DcdMBYb7tRBKgAiMgQIYZwf1chkPibz8cFauDH/SHckmHJlob+x6V1V9K6hhErSdibyzcUST
	1+6rAE8pzRod/PEHfI+oj2pTveIgP2ADe/rvMYLfefPmEuXR5qlmP8kdBW4DnkqK9NGYI9cgEKNIX
	scG7gM356VpwppLqIILPEJYHrj4e0ojhw5lMknm5A6PXLnd3WJfIT7zIoxCghjo2NKXDZNiGBtb02
	BE4hbT4kHPT08KkLnOIcq7rmCrXurWaBk//5YtIZ2aikPHskeMqqaDGEs/ezNxuM77b50X1wQ7+4z
	jDPH856w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVxWC-0000000D13J-43EU;
	Thu, 09 Jan 2025 18:44:32 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVxQY-0000000Czhf-2M2X
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 18:38:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1736447922; x=1767983922;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=v7GYtFPyZViNkQDmJDnHFq7M6Py30knW0IeoNMAUuog=;
  b=ZmSqFI00K9sBu1YlLxRblWJLjjNF4+8FkcbWi+wn2Lo5V3a6mAaA00mS
   GOtEwhxUEfRm3iWJ5CgEXNYXVFNlYgbnoux7vuTQDLAD8838/La8owm0d
   qacR6mfhgZpCSH8G5PTw4X0qQhyGnZA50zoiS2fQsgWj68LpgzzM9nOYl
   wEhkd7pW8BKez2TpZppl6VT/Qo5NvKspU5ZzW3/OSSby7gH2lwCw+gsvr
   00Pp6Xjknffg54sKs4Xr2biXUjQqO6gkqVYSri0Cpm3SMryv4bWmZK86v
   AI5s8OSOCCnuyc2HHmqaReHy+wrVnFwfmJ/H/kRKiz2dxPmqvupQZON1u
   Q==;
X-CSE-ConnectionGUID: EEpZxm35SCOeNwgRklSfsQ==
X-CSE-MsgGUID: 7usoUu3MTqeXlqJjbnqndQ==
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; 
   d="scan'208";a="36007573"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Jan 2025 11:38:40 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 Jan 2025 11:38:18 -0700
Received: from DEN-DL-M70577.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 9 Jan 2025 11:38:15 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Thu, 9 Jan 2025 19:37:56 +0100
Subject: [PATCH net-next 4/6] net: sparx5: move SKB consumption to xmit()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250109-sparx5-lan969x-switch-driver-5-v1-4-13d6d8451e63@microchip.com>
References: <20250109-sparx5-lan969x-switch-driver-5-v1-0-13d6d8451e63@microchip.com>
In-Reply-To: <20250109-sparx5-lan969x-switch-driver-5-v1-0-13d6d8451e63@microchip.com>
To: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Andrew Lunn
	<andrew+netdev@lunn.ch>, Lars Povlsen <lars.povlsen@microchip.com>, "Steen
 Hegelund" <Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>,
	Richard Cochran <richardcochran@gmail.com>,
	<jensemil.schulzostergaard@microchip.com>, <horatiu.vultur@microchip.com>,
	<jacob.e.keller@intel.com>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
X-Mailer: b4 0.14-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_103842_676059_4B6B1C8D 
X-CRM114-Status: GOOD (  10.98  )
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

Currently, SKB's are consumed in sparx5_port_xmit_impl(), if the FDMA
xmit() function returns NETDEV_TX_OK. In a following commit, we will ops
out the xmit() function for lan969x support, and since lan969x is going
to consume SKB's asynchronously, in the NAPI poll loop, we cannot
consume SKB's in sparx5_port_xmit_impl() anymore. Therefore, move the
call of dev_consume_skb_any() to the xmit() function.

Reviewed-by: Steen Hegelund <Steen.Hegelund@microchip.com>
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c   | 2 ++
 drivers/net/ethernet/microchip/sparx5/sparx5_packet.c | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c b/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c
index fdae62f557ce..cb78acd356d2 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c
@@ -239,6 +239,8 @@ int sparx5_fdma_xmit(struct sparx5 *sparx5, u32 *ifh, struct sk_buff *skb)
 
 	sparx5_fdma_reload(sparx5, fdma);
 
+	dev_consume_skb_any(skb);
+
 	return NETDEV_TX_OK;
 }
 
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_packet.c b/drivers/net/ethernet/microchip/sparx5/sparx5_packet.c
index b6f635d85820..e776fa0845c6 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_packet.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_packet.c
@@ -272,7 +272,6 @@ netdev_tx_t sparx5_port_xmit_impl(struct sk_buff *skb, struct net_device *dev)
 	    SPARX5_SKB_CB(skb)->rew_op == IFH_REW_OP_TWO_STEP_PTP)
 		return NETDEV_TX_OK;
 
-	dev_consume_skb_any(skb);
 	return NETDEV_TX_OK;
 drop:
 	stats->tx_dropped++;

-- 
2.34.1


