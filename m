Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD55BD44C5A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 14:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y5CcBKd+oHd389nAO0f8lXHf2tMCfoqnx1fCEDJhaMY=; b=Z6wQrANjUBxPBn9geBwM10EdWk
	VXh41O41dUP3wQJ1swhNufg/0DAuAm67H/E9JzmrZpQkhtsZ6g8Dh0tYpbiN44W8tshPMYUDCOwgH
	M7otGYfgI1MY/IhY7wHHLcK+3m0jnO7TokPeJBV+ruO96iyEk5No8UTlq2RMQHHMfGUpjNIwumGII
	ZF1z35+ai6dpcH2NEEaWnQD/38eGAyps1yf5xtGjBiU05vXq733uPxcgr3C4CBmD8QCNYKD4nX/nw
	h0xDnnqejGstUZX7qDiRlZ2q6kZGS2rMt7tuXSZ27pPZG7FvzI1lVt8G/U+P7wxkLZ4KGnHlCy7F2
	zUr8D89A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgOUX-0000000CVAV-1DhU;
	Thu, 15 Jan 2026 14:38:29 +0000
Received: from mail-ot1-f44.google.com ([209.85.210.44])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgOUO-0000000CUzl-0gnw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 14:38:21 +0000
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7c76f65feb5so782981a34.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 06:38:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768487899; x=1769092699;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y5CcBKd+oHd389nAO0f8lXHf2tMCfoqnx1fCEDJhaMY=;
        b=KWMn81m/BBom5QbBqPvppUjJXwfxJLlSXbLh1h2RIdrCCH7k90wudnwr0BEeEwnznP
         vKRBxe8pRMjWcEOIo44cGJJgBfCyttga/+cVMgkQ8gu/Dtg8AviWOlYYC3lXl4cpiitQ
         xvMsXFNnW3Qua58dBNCqO8rIrf/Q9bAKFT2dLuS17k27fEHwWTGR+dO08YwhqtU9ZPqV
         C/r3AoXmCkz4xb85e3HgsUrxStz2pMIyb1z5cufRAey2Byne94sEV9TzkkAklxwTD68p
         JofLwjwnOpvCZnWbmHCvl1dap87+OVLD71LvKyNdgrTCZsV+4XnM66NIzh1fIutnMSX8
         eJpA==
X-Forwarded-Encrypted: i=1; AJvYcCWPQezFf8gNWjAbjCdsqz6P1WzbIISdIz0LAEWZ0x78MOKkez46bzd4cvsrzsvaPs76IIIQZISyPc0l3PoZbb87@lists.infradead.org
X-Gm-Message-State: AOJu0YzQYPfO/wzanr4+pl1CC7QBaOLv6okDuXkdJJUiCSzCNMYawFq4
	poI2Z1jYE9WmugHgJqze4zW1CEoTJsDxxyggNQyMg4K0WuhXqXm/ns2LFvhrgQ==
X-Gm-Gg: AY/fxX7KMUCFMpGJHECVgk9bXm3fjKgQHcN9nHX2MNueeLPwkUtGpKvfx4XOR/cWLyO
	ZH6s/H+2XD2EVbdjO6PSi0/CC7SBXy4stSysYvyK8qhxoZXdMdLvcwh1tagZlLikMG6dfmxBz7L
	5vXsM3fRr/83HTrlAhKCHqP0N7/P/zWcuXWefdTi+kf5D40lXrrk4pv1TsJyd4tGAfcPIpIPIVf
	2Sgr4E/+Czo2uu5s6HCE+xGq5ERdSGzaXVAkoQh4nM9isBLrEZ68ipwUtOQmASekmUcxSxLWUWh
	Wq/ZXBPUa3jSRIosipTnAMFY/OX0sH0zOo2blr0h2prpMlD0gi9eMBcwfN2rP3tqucdBSChgqIv
	Y/gDNJsycIHkoC6lHnx3zgjQ40HcCInkoPqXNELSmiB9773FXIj4bksz3Ds9pjzjW7ugzrgZtdA
	SdzEyyVJssa4sG
X-Received: by 2002:a05:6830:3143:b0:7c7:59a1:48d7 with SMTP id 46e09a7af769-7cfc8a7b0a9mr5415119a34.2.1768487899275;
        Thu, 15 Jan 2026 06:38:19 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:49::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7cfcc8428fesm3470134a34.0.2026.01.15.06.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 06:38:18 -0800 (PST)
From: Breno Leitao <leitao@debian.org>
Date: Thu, 15 Jan 2026 06:37:53 -0800
Subject: [PATCH net-next 6/9] net: xgbe: convert to use .get_rx_ring_count
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-grxring_big_v2-v1-6-b3e1b58bced5@debian.org>
References: <20260115-grxring_big_v2-v1-0-b3e1b58bced5@debian.org>
In-Reply-To: <20260115-grxring_big_v2-v1-0-b3e1b58bced5@debian.org>
To: Ajit Khaparde <ajit.khaparde@broadcom.com>, 
 Sriharsha Basavapatna <sriharsha.basavapatna@broadcom.com>, 
 Somnath Kotur <somnath.kotur@broadcom.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shay Agroskin <shayagr@amazon.com>, Arthur Kiyanovski <akiyano@amazon.com>, 
 David Arinzon <darinzon@amazon.com>, Saeed Bishara <saeedb@amazon.com>, 
 Bryan Whitehead <bryan.whitehead@microchip.com>, 
 UNGLinuxDriver@microchip.com, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Raju Rangoju <Raju.Rangoju@amd.com>, 
 Potnuri Bharat Teja <bharat@chelsio.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Jiawen Wu <jiawenwu@trustnetic.com>, 
 Mengyuan Lou <mengyuanlou@net-swift.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1681; i=leitao@debian.org;
 h=from:subject:message-id; bh=ODthTtJ6u9CDqhtIsZr1IcNyVtvAQXiNPRpZYOcZgN0=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBpaPvSl1WBMCgycevY3sZ6KOF/eZNfSYtIvURYg
 xosFId6dAeJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaWj70gAKCRA1o5Of/Hh3
 bWs4EACw6OGGyvcIE93XAIfzg2CzJAI+6roCgCWsaka2YS45lxnXlbwqOUaG7IadxMkwZrlSPq5
 rZMbwhDnOfMfUj43ZHlAygHa22r3zGiNJlcc/aM58ao5yPNWj1t1K3snMLIrQu6vTnyposuMiyK
 cMSUnGE/YP5/Ak0GbPeDfxXvqDtkYKr7SIqHmTAXkJe14K9/ZVTQ4CViC1u+Rn3t1vu7R5kkyoD
 7tKutYVDqZvnFs0nrlVfuyCbGFwHGXyAtvLpzLk+7UBDFdlc47m8SoutLl48uKJFkpS5rzU3rIz
 7IRKwmOLyfc3OVyHMXRdlnRwJF1/LQmobFacLu6Y6cXjp5N0jvWZk+LtjfZhNeE0DNuzzs0KkDh
 npJBQfK61w/DNZVFKXuYvYHnlaBS2m9IrR9xhsZLqci5CAieOtQP+fmtMaKrnxeHeLJHIBov/0x
 Lo5Yy830q1kUDPSN8/ACV3Xdi4dP0KYZvupaEd2V6B0t1xsuq6tLh6kxKAchFRzGGTMGvXPGm22
 UNf3YWv7yGO07RsSahj8ov6UiDOx1GXjeb3JTFcKqU9DDVftbu45pCJ0dyj2kFn2QlH9yrBFjum
 6meVsAd5N2aKR20VPTfOLRMH0sIxloQw+e0LS17La28WyUdk54LQ0o4UvboqD5gO7RWEQW4Qf4n
 TRZv1QA516MJtEA==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_063820_224301_91AA9933 
X-CRM114-Status: GOOD (  12.75  )
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

Use the newly introduced .get_rx_ring_count ethtool ops callback instead
of handling ETHTOOL_GRXRINGS directly in .get_rxnfc().

Since ETHTOOL_GRXRINGS was the only command handled by xgbe_get_rxnfc(),
remove the function entirely.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 drivers/net/ethernet/amd/xgbe/xgbe-ethtool.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/amd/xgbe/xgbe-ethtool.c b/drivers/net/ethernet/amd/xgbe/xgbe-ethtool.c
index 0d19b09497a0..8ebf0de7a01b 100644
--- a/drivers/net/ethernet/amd/xgbe/xgbe-ethtool.c
+++ b/drivers/net/ethernet/amd/xgbe/xgbe-ethtool.c
@@ -414,20 +414,11 @@ static int xgbe_set_coalesce(struct net_device *netdev,
 	return 0;
 }
 
-static int xgbe_get_rxnfc(struct net_device *netdev,
-			  struct ethtool_rxnfc *rxnfc, u32 *rule_locs)
+static u32 xgbe_get_rx_ring_count(struct net_device *netdev)
 {
 	struct xgbe_prv_data *pdata = netdev_priv(netdev);
 
-	switch (rxnfc->cmd) {
-	case ETHTOOL_GRXRINGS:
-		rxnfc->data = pdata->rx_ring_count;
-		break;
-	default:
-		return -EOPNOTSUPP;
-	}
-
-	return 0;
+	return pdata->rx_ring_count;
 }
 
 static u32 xgbe_get_rxfh_key_size(struct net_device *netdev)
@@ -752,7 +743,7 @@ static const struct ethtool_ops xgbe_ethtool_ops = {
 	.get_strings = xgbe_get_strings,
 	.get_ethtool_stats = xgbe_get_ethtool_stats,
 	.get_sset_count = xgbe_get_sset_count,
-	.get_rxnfc = xgbe_get_rxnfc,
+	.get_rx_ring_count = xgbe_get_rx_ring_count,
 	.get_rxfh_key_size = xgbe_get_rxfh_key_size,
 	.get_rxfh_indir_size = xgbe_get_rxfh_indir_size,
 	.get_rxfh = xgbe_get_rxfh,

-- 
2.47.3


