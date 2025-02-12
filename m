Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48FF8C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 06:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dYy7nG1QPt71ocXmaGOtu33ba5dvMFSO35bM0gjFPfo=; b=tWxcR97drlqO+Nacon9+SMSdK9
	NI/yoHBnzrO7T5YP02/14uogOzwkX38v57YL87dTrvUh60Z1canBTAoKYatDWK7xzCXo+X6Eii3DO
	eebG5aduokDFjzP/WapKUoyyeLSkLc5lBOpkdBITUyCd480irT6LAMRid4PP5ZV/3YJRxLYiZn1De
	LUqZJhIp44IHGrktkuT9FaTBKhrMPpmkV/fnG+JVH/E7H9TeSSvqiAwnkzA+i/yso5xDrJHOfVgWT
	OvgDdJKYiAQyzgY66gDY7pSwyA9i+bTmkp3/hiTF+WpPengbEEdiARDZ8H5eTfBzmRCoy++tV2vo1
	HsvimTWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti6fe-00000006QXC-11UO;
	Wed, 12 Feb 2025 06:56:30 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti6bZ-00000006PwQ-2i7A;
	Wed, 12 Feb 2025 06:52:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 83542A410E0;
	Wed, 12 Feb 2025 06:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40045C4CEDF;
	Wed, 12 Feb 2025 06:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739343136;
	bh=oNuvzrX0ScmnFLsPRD7UuqsTQ2lVnZz8AOiY3gY+NZs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iS47+CZiIjvI+nlWbAE37Zd4ChrRWym+nToPuDtYNeXBfYWg9VqhmNOAH9jCRQbSv
	 Novnyz7ViJoZUlQ0J1QHdgMyXB3vsi/6ortYFNBSG6LWN8hvNnjSCWVCt7MB5xvI7r
	 t1zS8VU7ZdQXHuY/5OF23qrcspKRzcEsmwS7LXWJqXYx/yDR1ib7LZE/hp7d9WJ45q
	 1hemK6W6LWcSfMQg8wx+Q4uhbRF+gunxJpTky0uk40oVB4hFqM2ckK6mKuiUqSIqvk
	 WzcbPFZ3tPMm0RqSCB1X2Mc94+gUJPfFUbGTVw6XoxuckB+RPqYehi9hQ8c5PzhI4p
	 QeLWoVWnmCzrg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 12 Feb 2025 07:51:48 +0100
Subject: [PATCH net-next 2/2] net: airoha: Enable TSO/Scatter Gather for
 LAN port
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-airoha-fix-tso-v1-2-1652558a79b4@kernel.org>
References: <20250212-airoha-fix-tso-v1-0-1652558a79b4@kernel.org>
In-Reply-To: <20250212-airoha-fix-tso-v1-0-1652558a79b4@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_225217_756329_E0FC7F05 
X-CRM114-Status: UNSURE (   7.63  )
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

Set net_device vlan_features in order to enable TSO and Scatter Gather
for DSA user ports.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/airoha_eth.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/mediatek/airoha_eth.c b/drivers/net/ethernet/mediatek/airoha_eth.c
index aa5f220ddbcf9ca5bee1173114294cb3aec701c9..321e5d15198c5ec6a0764be418aa447e8d9e4512 100644
--- a/drivers/net/ethernet/mediatek/airoha_eth.c
+++ b/drivers/net/ethernet/mediatek/airoha_eth.c
@@ -3188,6 +3188,7 @@ static int airoha_alloc_gdm_port(struct airoha_eth *eth, struct device_node *np)
 			   NETIF_F_SG | NETIF_F_TSO |
 			   NETIF_F_HW_TC;
 	dev->features |= dev->hw_features;
+	dev->vlan_features = dev->hw_features;
 	dev->dev.of_node = np;
 	dev->irq = qdma->irq;
 	SET_NETDEV_DEV(dev, eth->dev);

-- 
2.48.1


