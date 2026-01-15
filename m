Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF83D44C5C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 14:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J/FeA4DjIpvihRKqOOPncXjlCgByUn4v1i0+sGL5vbs=; b=FFN7o2TYcE/LdEn9KnvziWwF/T
	En4vMXtp6bW6R80ud2dhdzQRYVxQG7oPfuSDackIlfYttamEvzowV+o8Cc3/uTJiVl/BxBMbEAVMB
	6UT0DbyNGDA8gITecIAzFRmivGYyhBuo+khxcQvyOl7FiKhrIZevpcOMdajdgDO6G3gLsqqENAUsp
	74uPooO6+aOPTBkIAVR1rLTdShqrUEga7BqYvlMQTrlpWhzECuWZ0mwDxiclT7WvQHidLqDCX9LV3
	7ULRmjZhINvIqkkMlzIZIebfBY6B66LuLRiaT0UntaojqPqEIQ05F9pxVdNVaRpDNinn7c4jig6Hr
	vNd/ROhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgOUO-0000000CV1Z-398p;
	Thu, 15 Jan 2026 14:38:20 +0000
Received: from mail-oa1-f47.google.com ([209.85.160.47])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgOUK-0000000CUvG-42R1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 14:38:18 +0000
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-40438a46d7cso380206fac.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 06:38:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768487896; x=1769092696;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J/FeA4DjIpvihRKqOOPncXjlCgByUn4v1i0+sGL5vbs=;
        b=wcy3O8idEiiCD6l39sCEk+4Adt3Jh+h5uXGa9abhojMTuuMUHo5SuDQbSKGN2WLEiq
         CTDppiyZ8w3PA5Ncz/mv+xLPv04QuOXDRaPW6ky3Y5eq9Ej8osGRVnL73IEGeHz+v3Tx
         +n5+LMWqn4Ns8GOdxL0BlcqQPnNaNnMFi7k/diX4k7ugvmxuKd58aJFmkzYLOIzGmFAK
         RhHzoevkLvyQTvtKddPS4TSqAsj5OilhUc/MmJBxCxxsZisV9tLmWEgnnt7GYm4V+qwI
         Ygdr8MqUEE0K8M9bl1be81wQOZDvevbu9ml65203JhomlkTns0+RB6HN/RDkf291QPuc
         L32g==
X-Forwarded-Encrypted: i=1; AJvYcCW+MrzVvuHYLrPxF8eavym1bJkOWpY1on/+B8tM6NEIgqdNR2Z56NUCgS8yGga/mvFTfB024VjSy+smY3f4NNaq@lists.infradead.org
X-Gm-Message-State: AOJu0Yzrlcg6Nkr6Y4/YL2Eqba89Gl1LJiPqaGZSd3QKekJ1jkSaEANQ
	54XpIzXk+Dvh5WJg6v29+uY5klgIRLJYEc/f7e1h0T/Tj8jQYRrzW0d5
X-Gm-Gg: AY/fxX4e9eIwTKDilZU/BUnTzwcQDb/jXJ6x/hzDhgx92Y1L5eokh4EhWJhbmW6O0Cp
	7qAf+xmgzx6lZ0LZzMYSqqWnz0qq4LcJi6QH551X3yq/l85Klr6vX3q9+DIneivu0cWGhS21JAP
	L6fFAzIg+pJh52/36PZ4mFkQyVVvV5r3ToR4epR8TymiVd1x1T0TaOKLvMM+zLUsGwNP58vsx8S
	cQzR5bg6Lu5JqOsUjc7EMNOcoVNYhR2zGhs91afBxPFMgvldcKP0cJSSTDlVvC6Wo4C6l141/pG
	cv4F6eLK9IRTqjwJYpbvyFX3FYR3DxyjZaRtpFEag6sJR6F0K+pJo+VffnVyKookM4xlD7hC0IY
	ghXrj9yyeuKJnTEFXgzfIYfRb5Njl2mlBOQ0FIX0PTEOrVC935h6AYK2t4+yIOL9cJC0rYkN0ty
	5dOQvaqtSvKFeY
X-Received: by 2002:a05:6871:2211:b0:3d4:760f:544b with SMTP id 586e51a60fabf-4040716055bmr4253866fac.46.1768487895761;
        Thu, 15 Jan 2026 06:38:15 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:4a::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4040997ffacsm3714947fac.6.2026.01.15.06.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 06:38:15 -0800 (PST)
From: Breno Leitao <leitao@debian.org>
Date: Thu, 15 Jan 2026 06:37:50 -0800
Subject: [PATCH net-next 3/9] net: mediatek: convert to use
 .get_rx_ring_count
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-grxring_big_v2-v1-3-b3e1b58bced5@debian.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1572; i=leitao@debian.org;
 h=from:subject:message-id; bh=dAvRCGWtWrgyCIbjzXr78wi4bL8QADGL+zFdAiYR2bc=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBpaPvRK7lb2WvUAPqaQKV1+ODpLebJeMp5bYV+Z
 NGd9H0VU2uJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaWj70QAKCRA1o5Of/Hh3
 bSgUD/94DPM5bKVosd7hSCjQw9XhbrFa34AvpHooSQCwpmP0Abk5I+Rh+hYzUDUq0QQV/wSU95b
 CJ6l2SNhGUWoWw3CrFPm80hM6b3RIl6KN0aAsDiaVWMUrbN+KNbT3yEZp73aIHS8o/OxNFuVzmo
 Yuaz7rZ9ekX+FvaUabuLH/dFnmrMGQ5r0AYhTBGOMn5mMtab0Rx7SidFT5AWsXJGb5SSu4S6AVM
 ROPo81FwQsyWgssFN9PiKK19CzyjkMsmSag/Bwi/h50v7tjlNZO+WCcrcFhCQfchKXz2+Plk/0C
 xDGaZ5E90LuNVi916p4rNFr8qc3x8uza4tF9RdurlbPNtKVxbQe6vaFyD2iwpo3p14/XQu+tbk+
 nrJmVj7ro9woJ1ukGdJ2WQEppydsccRtXmOpCuYFPwFfKjigX2c5SVumJtB2W5JUtWRfOXDF3oF
 4HVB/iPaNvLUgH5TzULt6Z3DNCh8d26NSPGspqxMsWndDHfZOjcG6ywIDyI78FCG2fvihxNpGc3
 Ed3ljL/dQPx0Y/nEdviEtGnaD1/d3fBTy3KwjAqIstvw8FEqLPPtLomDZHeyhaO7gB0zmRCH+1h
 Et4JOHjw0ZttjoVW83jemJG1OUmKM06SyamadYHRvSfaaW6aPAvPQQ/sDuW8WlsSRrTiLcICFNK
 fjUU/Z4OqxvNkzg==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_063817_008297_F5FBB14F 
X-CRM114-Status: GOOD (  13.33  )
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
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index e68997a29191..99abec2198d0 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -4625,18 +4625,20 @@ static void mtk_get_ethtool_stats(struct net_device *dev,
 	} while (u64_stats_fetch_retry(&hwstats->syncp, start));
 }
 
+static u32 mtk_get_rx_ring_count(struct net_device *dev)
+{
+	if (dev->hw_features & NETIF_F_LRO)
+		return MTK_MAX_RX_RING_NUM;
+
+	return 0;
+}
+
 static int mtk_get_rxnfc(struct net_device *dev, struct ethtool_rxnfc *cmd,
 			 u32 *rule_locs)
 {
 	int ret = -EOPNOTSUPP;
 
 	switch (cmd->cmd) {
-	case ETHTOOL_GRXRINGS:
-		if (dev->hw_features & NETIF_F_LRO) {
-			cmd->data = MTK_MAX_RX_RING_NUM;
-			ret = 0;
-		}
-		break;
 	case ETHTOOL_GRXCLSRLCNT:
 		if (dev->hw_features & NETIF_F_LRO) {
 			struct mtk_mac *mac = netdev_priv(dev);
@@ -4741,6 +4743,7 @@ static const struct ethtool_ops mtk_ethtool_ops = {
 	.set_pauseparam		= mtk_set_pauseparam,
 	.get_rxnfc		= mtk_get_rxnfc,
 	.set_rxnfc		= mtk_set_rxnfc,
+	.get_rx_ring_count	= mtk_get_rx_ring_count,
 	.get_eee		= mtk_get_eee,
 	.set_eee		= mtk_set_eee,
 };

-- 
2.47.3


