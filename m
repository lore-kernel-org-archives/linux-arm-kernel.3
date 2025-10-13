Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00ED0CCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 14:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NStrg+1SeDrSzuNnEfQAGij3kZKTJpsZrAPfTOncUQE=; b=QX51yZK77i2d0nwD7INaChBi12
	GXInlSA0YZtU0mdJ4MQO3439MXj9ETtLYzxHgKI9hi//yDXCIn365MAD98L27GWqlW6K+w7WlJPvU
	Kavf47UE6FigzaEK3yGFK/sBtKCXhrQqlhf0PQIElK2mEggHOCxYY1VlNbFS8mOd8CLipv7EZXNWu
	KrJy2nD3xOR75yWz7gLspimWknKmkq7B1sA0UUol8BAqurK/MCkqxTgCFr2+TkvG2MyuyM7l6JE9d
	XnvUfvGFR11Twm6OB77EYyqN2lMxqTwGsbXbUHPT3wZHJVoBblXYe+UUA2Z3TxZsF74bZXMauR3Ce
	fEv8Ps7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JYm-0000000DOne-0eXf;
	Mon, 13 Oct 2025 14:30:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JYk-0000000DOmb-1yeO;
	Mon, 13 Oct 2025 14:29:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1B0C14067B;
	Mon, 13 Oct 2025 14:29:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 986F6C4CEFE;
	Mon, 13 Oct 2025 14:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760365798;
	bh=C38NliXvvb6uR3UBVTpdAevmxNu5WA07aZHQC+FR338=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nkvWaaKSqQs9P5RMopsoSbKSny1SCQc+6CI+/jI3f278qO2EbRlqglFl+VpNGB4dA
	 tO/AKYcU++WDUrJaB8yE9oNyaTF0X06XJASrSUM6/OsmZCzlFW2mnUZOfCmPOX6qy/
	 oMKFT0R9qR99l4ZW+xl4/HBCKae5vy4EPVhhnI+j20St+q53kOheYJ/u0hH9eyElls
	 iE49G1pCWvNyT34jMUgu7afgrvKWAJaDLJW6ZElOElNw3r2eecc9JstPEIaAczNzhs
	 ZdIeV9w7R9sUcWiiNwZA6sD//Ed5opkh/WNoXfiLGnMEpCrJSAWk0EmZmNimv5k8aM
	 bvtGsM8AMX/Bw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 13 Oct 2025 16:29:41 +0200
Subject: [PATCH net-next 1/2] net: airoha: Add missing stats to
 ethtool_eth_mac_stats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-airoha-ethtool-improvements-v1-1-fdd1c6fc9be1@kernel.org>
References: <20251013-airoha-ethtool-improvements-v1-0-fdd1c6fc9be1@kernel.org>
In-Reply-To: <20251013-airoha-ethtool-improvements-v1-0-fdd1c6fc9be1@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_072958_535124_2732DB8C 
X-CRM114-Status: UNSURE (   8.10  )
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

Add the following stats to ethtool ethtool_eth_mac_stats stats:
- FramesTransmittedOK
- OctetsTransmittedOK
- FramesReceivedOK
- OctetsReceivedOK

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 833dd911980b3f698bd7e5f9fd9e2ce131dd5222..2fe1f39558b80926439cc2f765eb5057464dd76e 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -2022,8 +2022,12 @@ static void airoha_ethtool_get_mac_stats(struct net_device *dev,
 	airoha_update_hw_stats(port);
 	do {
 		start = u64_stats_fetch_begin(&port->stats.syncp);
+		stats->FramesTransmittedOK = port->stats.tx_ok_pkts;
+		stats->OctetsTransmittedOK = port->stats.tx_ok_bytes;
 		stats->MulticastFramesXmittedOK = port->stats.tx_multicast;
 		stats->BroadcastFramesXmittedOK = port->stats.tx_broadcast;
+		stats->FramesReceivedOK = port->stats.rx_ok_pkts;
+		stats->OctetsReceivedOK = port->stats.rx_ok_bytes;
 		stats->BroadcastFramesReceivedOK = port->stats.rx_broadcast;
 	} while (u64_stats_fetch_retry(&port->stats.syncp, start));
 }

-- 
2.51.0


