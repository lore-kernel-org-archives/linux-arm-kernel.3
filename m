Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA32BD44C51
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 14:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bxQOvp3FO/FV+ivIiwVToR8TzMNrudoK/UpMDqV1B+s=; b=HzjBDvntdpczAEy7ab1uXRb49s
	NNdXXBY9QhkqRGxV8pQN8YZPEBBu8sG6D8iVfErWayyS2/s+XTm7qJjbJ8sUB7VIVhGkeWNyQHn2e
	ks+xmq3Q00CIg0NFLQlBp9hvmcoYTbYx/eddE7IGYm5tHTKe1eoXvoTxXAIbaD8LadyE77xLvrv/t
	xnTGEAItfd0Mlahm+9OJ9Aagj9LJlZKJJRF0yVNV/L+zjOImi3XEppjMXV2Dhhq+C21UAgeyf80K0
	sWhJ8rSSHysSjA/s5UdwLOvn/TAccWNENUpr7jamYgbtnoWjCsYG0ca2usNLa7SKwndkBd/SG1D6H
	LlVYIrPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgOUL-0000000CUwN-26Wv;
	Thu, 15 Jan 2026 14:38:17 +0000
Received: from mail-oa1-f44.google.com ([209.85.160.44])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgOUJ-0000000CUtx-0nZN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 14:38:16 +0000
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-4042f55de3aso640069fac.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 06:38:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768487894; x=1769092694;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bxQOvp3FO/FV+ivIiwVToR8TzMNrudoK/UpMDqV1B+s=;
        b=VFrEMtRnu5JnRLhuage4HDTTxQnObCmZeMAVCYwp3IGbLY6pFmR98INoqgWzeD32Kt
         WXp7Qk/PBN4mz1CsxHJWANugGNlwd5XWoDx/rEJ39XEWRYYz+3g7p4qjtQhzkfDceDOq
         FmKpM78cQTl6y6KyIhVOxQ5Ij+Ds0n8rwySoarDAehP0XDutoZH1UQIH2Dtu1j45VSGA
         FbCFkgg1S/NuU+T4VxtGIQZ143bmpn2VMIoVC/VsE/33qnSM4ZMB5l1U2y5GWxwYhPU6
         rmib9GamPLoLMtjfnix2PH73RCG09vFJqddnIeFv8c6i7jePEY/kYFtHfjq7fTVa/oMx
         eyZg==
X-Forwarded-Encrypted: i=1; AJvYcCWxn0U+IgtwUatqATCY6P1x8dJmYVWszVBonXPiDyISbLOKhuI6mOMURIAs2QKGmZ9UeCbQm9N8jldiAyq1tcj7@lists.infradead.org
X-Gm-Message-State: AOJu0YzwxUpYjghYhfT/sKSXOGmXvm1vf9aZnqTc6kuarlsYoi8D3ccr
	8G/PPOobAU7rSBqrUz1wSPyRFpSxEADrcam8CqVn/IpNqwTTWYZNGXE+
X-Gm-Gg: AY/fxX5xqTSwKZJTjRQl1w5a3gTvarWxSZT6wq0KIcKbft2aldoBynCzeprYljrfNBB
	c3XINZpaH4ZEVLMNtfIk6DUCha8kE+Fu39t7YYay55YgiVqRgktWCfy0N4lVWDSPI344xCYsW4F
	LdT17BZrakBHmZy4o3H4iaZAiB04bGyA1edRmF6WkQURDogEhb4jbdAIYZFpyjrGtdgBoy86os3
	jE9572e09NY02ehL9X2YkYTUhLEKr0WcArHlwfhnnJifUTeHZY7h2N5mH+bo7tkFqieRCzD12MJ
	aP53IRiFQLHOoDJ5166wj4Nkg5hGDUZsR4a/YXgmKCuIwemGsaDDFD5KOPeTyYyrNUg6ef1AzFa
	kij/vzJ5JkE54YBCAamc9pfhURmIXlASOnZ5wZyAfnxsqno500qrEcMF1glBO2oYvDHG+cYgGxo
	TOxg==
X-Received: by 2002:a05:6870:f10c:b0:3f6:1e6:d0dc with SMTP id 586e51a60fabf-404291e9118mr2182430fac.16.1768487893377;
        Thu, 15 Jan 2026 06:38:13 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:5a::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-40414c5d332sm3357458fac.20.2026.01.15.06.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 06:38:12 -0800 (PST)
From: Breno Leitao <leitao@debian.org>
Date: Thu, 15 Jan 2026 06:37:48 -0800
Subject: [PATCH net-next 1/9] net: benet: convert to use .get_rx_ring_count
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-grxring_big_v2-v1-1-b3e1b58bced5@debian.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2204; i=leitao@debian.org;
 h=from:subject:message-id; bh=ho090fN91gnMOR0nUR4Y+EcFIXlQvnkEfyY6PgYidL0=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBpaPvREfl1vVTFd9VCzNZLXGv4qdGXI1B9s775w
 CRZVlDxz92JAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaWj70QAKCRA1o5Of/Hh3
 bRjCEACa04xXzzhEph5wulMAMymz5V6/MzKrLa6K9yiJeFzArG7sXYRape5HeOReDq/e1HtKQOD
 U5MlsKbmvFNXwZ0RU3HbBarbRX/r71YAnp2Zi+LoQVbMmifAyizczt9GzkEnWCVMKtvrd4M0Gpz
 NKSJQVdwgwAXY7LucPNj7NgoP7eOpYo7uL5iWWlDWb5ZueFIkU3eNQhPUmQFm9hdke9eGtZBif0
 qRND+fwHDtZt/96hhvbByIcXEuK54DdcIa2UsGU45hQYBSfSauFX0dOuwkI4PIwpVpfIsA73ZF3
 QHj2c1fD5a1B+Op7EEgmkUkBOnr2VXcB3nupJr42Q0lF0hQ2Kb/+V0o8ZqUstXEHhOFL8/cXHtc
 l1s36gb4ruqXR4UVMgHIY2/YvCJ1kVBwmU4n0Y7iPkPH2AuYACRrH4sveEATGszfob5/Yj8DFxJ
 QbRzhTDaXCMTCPcgBLOwTpJOXmqwPRvI3Ml2OwpHl+xxw8YEM/HrGy3+7Rgc5n7HERJp4knxX6u
 lr5QlKFLr1F11yTZdvdTrfamoTW1d/xJnZ2lu+74x70tKhKzv/6WycPoiG0RPm8BL0Wvi7ylid1
 AaM5Q7zzsvcp88wLuZ7mZvtsX6k8Mtou08w2vVmA1wxAFiNysONe64i/DYxl9+AS98kdSD/LFv9
 7Ro847D2vuFjy1w==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_063815_236960_5F17DA91 
X-CRM114-Status: GOOD (  13.26  )
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

Since ETHTOOL_GRXRINGS was the only command handled by be_get_rxnfc(),
remove the function entirely.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 drivers/net/ethernet/emulex/benet/be_ethtool.c | 31 +++++++-------------------
 1 file changed, 8 insertions(+), 23 deletions(-)

diff --git a/drivers/net/ethernet/emulex/benet/be_ethtool.c b/drivers/net/ethernet/emulex/benet/be_ethtool.c
index f9216326bdfe..4717a1dacbe2 100644
--- a/drivers/net/ethernet/emulex/benet/be_ethtool.c
+++ b/drivers/net/ethernet/emulex/benet/be_ethtool.c
@@ -1073,6 +1073,13 @@ static void be_set_msg_level(struct net_device *netdev, u32 level)
 	adapter->msg_enable = level;
 }
 
+static u32 be_get_rx_ring_count(struct net_device *netdev)
+{
+	struct be_adapter *adapter = netdev_priv(netdev);
+
+	return adapter->num_rx_qs;
+}
+
 static int be_get_rxfh_fields(struct net_device *netdev,
 			      struct ethtool_rxfh_fields *cmd)
 {
@@ -1117,28 +1124,6 @@ static int be_get_rxfh_fields(struct net_device *netdev,
 	return 0;
 }
 
-static int be_get_rxnfc(struct net_device *netdev, struct ethtool_rxnfc *cmd,
-			u32 *rule_locs)
-{
-	struct be_adapter *adapter = netdev_priv(netdev);
-
-	if (!be_multi_rxq(adapter)) {
-		dev_info(&adapter->pdev->dev,
-			 "ethtool::get_rxnfc: RX flow hashing is disabled\n");
-		return -EINVAL;
-	}
-
-	switch (cmd->cmd) {
-	case ETHTOOL_GRXRINGS:
-		cmd->data = adapter->num_rx_qs;
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
 static int be_set_rxfh_fields(struct net_device *netdev,
 			      const struct ethtool_rxfh_fields *cmd,
 			      struct netlink_ext_ack *extack)
@@ -1441,7 +1426,7 @@ const struct ethtool_ops be_ethtool_ops = {
 	.get_ethtool_stats = be_get_ethtool_stats,
 	.flash_device = be_do_flash,
 	.self_test = be_self_test,
-	.get_rxnfc = be_get_rxnfc,
+	.get_rx_ring_count = be_get_rx_ring_count,
 	.get_rxfh_fields = be_get_rxfh_fields,
 	.set_rxfh_fields = be_set_rxfh_fields,
 	.get_rxfh_indir_size = be_get_rxfh_indir_size,

-- 
2.47.3


