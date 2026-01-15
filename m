Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 283DED44C51
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 14:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a/GYuhAPyxh2VtKR9ECrwYwGFXjwcnfw71zewQTg4IU=; b=XJICwUPnYCfXqkKKOKFzaeFesC
	xmKEG/Tqcncpzy3K8T0ccJyPl2ZgSbqHUXF5eagqZnoYk9wDj45WUeyYh9pGkytBc32C9g8N6XOfk
	qD9BH3K8F6qDLdomORvqWfCGHpIJqii0o3h8bA0e1PNJnF5KtEipb/plDqXD9/F0S513el8n6ryD2
	DxN09sNhGF1itRGK18apLQ9VBRySeC0QIEDAORotSEJk6tmyheTlyEex0KQnfNrOwSjCSVMCV518x
	LX0+hynq+vE3lRv2hPhrQssv9UAjZLu2HGksw3FBifhcIfIClIC01bzQ+SAS0nsPzp5xNAqGNYyiY
	hftYpoYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgOUh-0000000CVQD-3Msl;
	Thu, 15 Jan 2026 14:38:39 +0000
Received: from mail-oa1-f42.google.com ([209.85.160.42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgOUR-0000000CV5I-23k7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 14:38:27 +0000
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-3ffc3d389a8so669169fac.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 06:38:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768487903; x=1769092703;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a/GYuhAPyxh2VtKR9ECrwYwGFXjwcnfw71zewQTg4IU=;
        b=mw0murtGZqEZRSgneu00EAx56kANTqxvUkbXBKcyHbjXsVcaS1GIZHXdJ6yFjKSKd8
         YTgqgQiy+Ny2qtLrfdlnpBp7DIyVNLhGvZAZ0uxKSys3W/RfcojZKncB8gorC9a9ZaYW
         osXsRMOsSQLgJtc1fGIrjX8/tPhyj5N/t4ZV51S2iEsLXGPoGb/OoWQXgiYQPXm3/Uyi
         HC9AyrdFuqG3143nX0ttFauiMlqk0YDQNJB9pUFxuCj+aZDxqTDZPvDYcbA46IkL0xbC
         PC/zV3CM1VpR6KB6XZytUav1Mx4PoTNp8rOwKY00g9wtZ01dyEyn/qKR0fPTM1PngiLM
         V7eg==
X-Forwarded-Encrypted: i=1; AJvYcCVOapvlbhA18bovQ6MNxVjEP2vN8a4GkviMLU+qo++oCjGgrIZ6pqbsQoFsRt+9+bPEbxm+YOaWT8zxSvi5waOW@lists.infradead.org
X-Gm-Message-State: AOJu0Yzm0hFXx3ALZ3N7/4w7YX9T0Vv5N4Yl9mQVuYtlW/2gyiTVV3z5
	Igtmrod6qFcdjk3+cOEOOGnGBRwwP/ly40Iztr8R/QbeRGQ3bsDrsqUi
X-Gm-Gg: AY/fxX6/gXeCzgPiDCm4Vc/1X6wrYYrqHbxLeNIFUExMmM9dfBK5S0ik7X//HAQYioy
	l/p9BkRKUHNdejQdqvyCuLIRuQkpYqKJX4Wp8lBa1Vidr+EgVDEV86nQ+XOlck7AkloPal598c0
	dPi2YZUN4dZoy2TDjPh2whJVLyngqZ2PXJ5sgIzkC7SAh2w6noe8n/HNxF96TB8+dGTOpPvFCNc
	Axc9+E+VeTss/PqeYF5LHfpQdN4XC8hFHDsPtZ+Ef05f0AtgtJKk+VLiz38DQx0Lat2/AHR0gyy
	rsr0VcxigNYCk7nJFa2/LKmsfrvAX2bDVCVHLLn7Sq+veu4a+xYyZWOba8KQfrC07JrDg5DcaMt
	0Ow3gRRExEKjm9U0ncKQvafYYyvutrLWAbRtfeRIbSOV4/axHuvkhGlVz/2GgxkR1EZM8g2zRdB
	Cr659VXRKnBV4=
X-Received: by 2002:a05:6870:864b:b0:3f6:2118:2d37 with SMTP id 586e51a60fabf-40407155e60mr4009310fac.42.1768487902673;
        Thu, 15 Jan 2026 06:38:22 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:3::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4041a20051csm3187622fac.17.2026.01.15.06.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 06:38:22 -0800 (PST)
From: Breno Leitao <leitao@debian.org>
Date: Thu, 15 Jan 2026 06:37:56 -0800
Subject: [PATCH net-next 9/9] net: txgbe: convert to use .get_rx_ring_count
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-grxring_big_v2-v1-9-b3e1b58bced5@debian.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1635; i=leitao@debian.org;
 h=from:subject:message-id; bh=iHjMCRl1osOPGeWzfnK2KNM/9EoiAxwpcSWI+XP02wM=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBpaPvS2jwDA4B5OVdm2pYfwE5wwEoA1TjfN+vFk
 Oq4iqdDPU6JAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaWj70gAKCRA1o5Of/Hh3
 baEtD/0e4jxGdtSnXlNdd3Ym+AmQnqmw+uQARxVH3fvJRkHoecl3Hzt6HnkNMpJ2bHcL+Ykuo+2
 bqDVJi17xCAxz/JJ+E5uhNl7rq1nzJiOdALOcbtS+q0vaAqaZANFIQTUTAtwvr8Vcykq8fnNkr0
 2xiADYMIU5s+WuQsMpxl097cT8oXChiukHlT6HsJ222668dm5nRiPA0evqv/2pWsVDaAywkAi6x
 aeiwdgG4iQxbfanDh2VKer1hvyDYRelxSgXXwz9N4xwcSk8Wfz5aDDHNrzSYqDMGdS+E+kjPat0
 t4kMwgKvDihLCIWfhFIASs4E9SQRkuqb8Jl9NPamj3g0kSm4VqPztopV3u/iPeb9hidjshOk1GS
 qxDrEiy97dK97aot5HKc9ujq+XVUI/Q51g0H3img2C95IaK5r7LWia1OALMEcV2cBy/rbsNPfas
 K0QBWLVLDq2PqiUc25Jxy+TG+ctt4emx4tKPDjc0Pe1pk1H3Tgi06WXLVavvwsW9ksgo8O7Sf6a
 Db19Wi8PouSxa3fu+u38JygBavrl/AFKs1l0aVN5h73ufNH1bOfS1xHmgvxnchF0HmnRm3G+CHb
 KvdDaYueCtvOsJYb1eivSnDKOoF+M7LQRcakwSN6tgiUiFJI8r9TH1aKmpkYtvWyA4rRbcHIk/q
 pdghbi7qVDQhMoQ==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_063823_541289_DC05FA51 
X-CRM114-Status: GOOD (  13.07  )
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

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 drivers/net/ethernet/wangxun/txgbe/txgbe_ethtool.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/wangxun/txgbe/txgbe_ethtool.c b/drivers/net/ethernet/wangxun/txgbe/txgbe_ethtool.c
index f3cb00109529..59d758acccf0 100644
--- a/drivers/net/ethernet/wangxun/txgbe/txgbe_ethtool.c
+++ b/drivers/net/ethernet/wangxun/txgbe/txgbe_ethtool.c
@@ -193,6 +193,13 @@ static int txgbe_get_ethtool_fdir_all(struct txgbe *txgbe,
 	return 0;
 }
 
+static u32 txgbe_get_rx_ring_count(struct net_device *dev)
+{
+	struct wx *wx = netdev_priv(dev);
+
+	return wx->num_rx_queues;
+}
+
 static int txgbe_get_rxnfc(struct net_device *dev, struct ethtool_rxnfc *cmd,
 			   u32 *rule_locs)
 {
@@ -201,10 +208,6 @@ static int txgbe_get_rxnfc(struct net_device *dev, struct ethtool_rxnfc *cmd,
 	int ret = -EOPNOTSUPP;
 
 	switch (cmd->cmd) {
-	case ETHTOOL_GRXRINGS:
-		cmd->data = wx->num_rx_queues;
-		ret = 0;
-		break;
 	case ETHTOOL_GRXCLSRLCNT:
 		cmd->rule_cnt = txgbe->fdir_filter_count;
 		ret = 0;
@@ -587,6 +590,7 @@ static const struct ethtool_ops txgbe_ethtool_ops = {
 	.set_channels		= txgbe_set_channels,
 	.get_rxnfc		= txgbe_get_rxnfc,
 	.set_rxnfc		= txgbe_set_rxnfc,
+	.get_rx_ring_count	= txgbe_get_rx_ring_count,
 	.get_rxfh_fields	= wx_get_rxfh_fields,
 	.set_rxfh_fields	= wx_set_rxfh_fields,
 	.get_rxfh_indir_size	= wx_rss_indir_size,

-- 
2.47.3


