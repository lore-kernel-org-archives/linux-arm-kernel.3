Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0848C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 15:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DJ8jzAfJImIZ1eFRsY+R34UkOdbIYdfUDMJDfWp7fvc=; b=1pHzfs3Ed9qpp+1XaMo39Hbsnt
	0dG/3juRT+ZDzQZobE8Rwag4EA8a07wPhdaAf8JakTmMDDgl4Gfy7EurDajfk5GH6gr9d4YugtN3z
	vWW1SLBKwBj3vG9DnJb4dsXAdYtw4vEh/hvQgX88FgvutsWWmg23m3Gw1cpecALBZjOMrPheOSavQ
	TDfLUCdYqlY1F2vF4OPhQrdUVUoiurqLvVO5/3jNMtpjr4aXhZA4P0RZRlCp72V5ByAkZ40tNnce2
	2QEVWqcdu/26tOgZEBgXWpc9x6lPuTFREGo50hATzABC8zF215f4X2wsD3VfvFTQo6iK3Iz8shQiF
	8dNwhD+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Jao-000000004fu-336m;
	Sun, 20 Sep 2026 15:36:38 +0000
Received: from mail-japaneastazlp170110002.outbound.protection.outlook.com ([2a01:111:f403:c405::2] helo=TYVP286CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Jae-000000004a4-0pc5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 15:36:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ucQuJslh2+5DjPJu7Br0e9YU8jXkKF/xMIzWAoRE5gDsgNEkWFgyBY8ulyFmK4aefU8RntRfsCnFv+rzGPwnlCZ3Wh1MoanNcqRdLCg29mYgsXFgTwF4ogMuSicbJgWc1XlmHs026mjg32cEuoaB4f5gwjRNUWGJDAO0ukNCcoPAhrEhHmZt5N2/OAZqe1a/528HUxEDbxd4PK28lmTGtws4f2U3UCKnJII0tPzrYZ2orQF3NjlkvI8otT2fFHtWOAI9NscJy4OANtOthfx58QdTa+VRdVqK1rjhbdEJajnC5TBYOIfo8wNpJ7Gck24IRG4lKuk2DPHHpCmXAi8l4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DJ8jzAfJImIZ1eFRsY+R34UkOdbIYdfUDMJDfWp7fvc=;
 b=G/tC6jyCYFjSzR+qMkE8JuTmaMsMFCA5Hrw9ZeqIgwzEtDTsVgIR7JYKWWvyYC6ITZTqY+V61sTL7IOpW9hcjNIlcaSNae4AdNhQr1l8abHdJuuDO5RnB3deZiJCS56VnXlzuIk7efd/K7icuFFFg5EXWrZxeKtT/G1p1Oz4QzvKtZ8dfN9O3JnqJhgkFqzajV2Zat1lZzcsTOPBJpTzmP1bmTyz/XKWAZWxYpyHnaVPxkwXnzSgtvBoGSBwhIMk/anC7S6cg+1MRCWRU8ONdusA1ELO3SEWnEhc63dUC5KiI5hr9BaTrErMIlewrniEesEu0SRfRSSQPTKfeHKE3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=bootlin.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DJ8jzAfJImIZ1eFRsY+R34UkOdbIYdfUDMJDfWp7fvc=;
 b=A7X6hoEvjqv5tjqofSzLCnCydF39grf08ch9qgxvoQljyWRZ+rajY6PhtiTLmYCxABpzHPTMnBk5XsB2DjsYw1CG+PvlFsJN9dv1usWZ18eBglG4eTEqwdmzYvr4ZSkJ3lqkIelHXQA0gpGchO9Yvlu/b7vpnFpaW8Mgms+GxMU=
Received: from OS3P286CA0058.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:200::16)
 by TYCPR01MB8756.jpnprd01.prod.outlook.com (2603:1096:400:10f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Sun, 20 Sep
 2026 15:36:24 +0000
Received: from OS1PEPF0000D20E.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:200:cafe::9b) by OS3P286CA0058.outlook.office365.com
 (2603:1096:604:200::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Sun,
 20 Sep 2026 15:36:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay004p.adwin.renesas.com; pr=E
Received: from ejcrelay004p.adwin.renesas.com (8.62.32.50) by
 OS1PEPF0000D20E.mail.protection.outlook.com (10.167.240.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Sun, 20 Sep 2026 15:36:22 +0000
Received: from vm01.adwin.renesas.com (DEU-5CG20946WF.adwin.renesas.com [10.226.92.22])
	by ejcrelay004p.adwin.renesas.com (Postfix) with ESMTP id 54EF430000BA;
	Mon, 21 Sep 2026 00:36:17 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: maxime.chevallier@bootlin.com,
	recv.jo@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	joabreu@synopsys.com,
	jun.ann.lai@intel.com,
	yi.fang.gan@intel.com
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Subject: [PATCH net v5 5/5] net: stmmac: Disable S-Tag processing on dwmac4
Date: Sun, 20 Sep 2026 15:35:16 +0000
Message-ID: <20260920153516.103461-6-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260920153516.103461-1-ovidiu.panait.rb@renesas.com>
References: <20260920153516.103461-1-ovidiu.panait.rb@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS1PEPF0000D20E:EE_|TYCPR01MB8756:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e3f9e7ff-7e7b-4f04-6394-08df172cecbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|7416014|376014|1800799024|23010399003|10067099003|56012099006|3023799007|18002099003|22082099003|11063799006|921020;
X-Microsoft-Antispam-Message-Info: Cxj0rPYCiRH0OMY7CVepQy4VLMmMMotJp6rGL46oj7GtqdVyJVXFmUk/an3BEGYnfLNMBezq3Tku6tHkJEUQN+JvF3gEWaWDv/xmaXkzkM6tKwNVnI7Klnt4dabjFzQjz1hG4v28LBodH7gk6rBGSkcO8htdiOIpDaYJunH2eEJdR5ZW/gUIMPcnko4HI0A4wivnWPb5LsAlysaZNBW+15c95WH2rVXIXWD12p6kXC//XOL+dmTbWWlQz4nni/U/nY1aLPWVu+BjKIE24M6Jah2Yw84k9H55+Y0HxN+EXFeCvMFigsyCUCe5umGRJDAMoQx0EA3GqAllYrUSscisznz93Ji4xTNCstu/Wpro1dX36egPYnOUaAXi7hyb1X+zTvw2HBGm7+I7ryc60CRSafolUBB4D8l8MfCRy8CHwGDcEpXwlqUKaI+9s3XST/OgMRfXd02NWHTTsCXaBJAvzmSrClVPEZDgX2bqYY2yHqi4WgjDXUX5PzGHD2xIdWJ7DkbDeHBTagvFnnXpxPjeNU/QLv44KAlPoNkp6og/Xv0byE3OWZzgOE9cAR+9f9HbnanNu49KHVGv67O/3t6gI2SMAOBYzHE7t1q4T+P99dF0UZ8lu0xQ5WTRjKcRzXLw4AA9i7VVJt009QlKOX0RvDCzlQ1Qyf2YkisJhIucjgCaKl3o8/ukWoYfo9ovp/aA1chTgiIrOzUCmxqQlHpviFtrKo1L663uf6pIZLdQXs7gi93QhMeOo9+tZuGl2t8b
X-Forefront-Antispam-Report: CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay004p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(7416014)(376014)(1800799024)(23010399003)(10067099003)(56012099006)(3023799007)(18002099003)(22082099003)(11063799006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: FJGrnQtSYFClD3JXOMvhzq9B4mKmd5VokP3sgkslCSCXaR7+HFJTr3gWjLW2ffq8sstCa0u5aqcD7qO/o1p63dek6KegS91eL0jNT/P6mNvo9nWy0V+xU/SWyZG0FS4ijEyn21YP9PhpX7io4j9aYYdkqhvIkDYiqi4RN5YJHcKoR7HjJZp36XjdSnNUy2DzdIipkLMBv295hdIS4jtmGmZ3ZV9duj3Gz5Glwhce/qd3q8pDUC8G2rPBcox/+ZrSMfabEVgf3ScrYXJICWjIUh05tZT0RrCuQrdCa89D77rKP1bQ+fB8ME7JWbzrbVING5r1eR7UWUBMWgGj7tv0TmtJwYca8DYwlNmjIut05PsfaQSn4/kD4gFElqAQgtBRarcTYHACyzQT7A3+vyCvoCQN8cESswDmQhj/hSyT8bmdVoTEnCT3SYVqw6R5ChFD
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2026 15:36:22.6962
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3f9e7ff-7e7b-4f04-6394-08df172cecbb
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay004p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: OS1PEPF0000D20E.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8756
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_083628_249661_9DDD056A 
X-CRM114-Status: GOOD (  14.95  )
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

Currently, hardware VLAN stripping is broken for 802.1ad tags. vlan_rx_hw()
hardcodes ETH_P_8021Q when putting the hardware tag into the skb, rather
than using the actual protocol from the packet. Because of this, packets
that contain a 802.1ad outer tag are incorrectly passed up the stack as
having an 802.1Q tag. This causes QinQ ping between two hosts to fail.

vlan_rx_hw() is shared by dwxgmac2 and dwmac4: on dwxgmac2 the tag type
is available in the RDES3 write-back descriptor (the ET_LT field), so the
outer tag type can be determined based on that info. However, dwmac4
doesn't seem to provide the tag type. The Length/Type field in RDES3 only
indicates whether the packet is single or double-tagged, not which tag
type was stripped.

Since dwmac4 cannot report the stripped tag type, it cannot support
hardware S-Tag stripping correctly. Therefore, restrict the
NETIF_F_HW_VLAN_STAG_RX and NETIF_F_HW_VLAN_STAG_FILTER advertisement
to dwxgmac2 only.

With this, 802.1ad tags are left in place and handled by the software
VLAN path.

Fixes: 750011e239a5 ("net: stmmac: Add support for HW-accelerated VLAN stripping")
Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
v5 changes:
- Rebased on top of latest changes.
- Added Reviewed-by tag from Maxime.

v4 changes:
- Dropped all "double VLAN" references from the commit title/message.
- Rebased on top of the S-VLAN rework.

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index c06eed76e3d9..e812a9c206ea 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -6208,7 +6208,7 @@ static netdev_features_t stmmac_fix_features(struct net_device *dev,
 	if (priv->plat->bugged_jumbo && (dev->mtu > ETH_DATA_LEN))
 		features &= ~NETIF_F_CSUM_MASK;
 
-	if (dwmac_is_xmac(priv->plat->core_type)) {
+	if (priv->plat->core_type == DWMAC_CORE_XGMAC) {
 		if (features & NETIF_F_HW_VLAN_CTAG_RX)
 			features |= NETIF_F_HW_VLAN_STAG_RX;
 		else
@@ -7987,14 +7987,18 @@ static int __stmmac_dvr_probe(struct device *device,
 	ndev->watchdog_timeo = msecs_to_jiffies(watchdog);
 #ifdef STMMAC_VLAN_TAG_USED
 	/* Both mac100 and gmac support receive VLAN tag detection */
-	ndev->features |= NETIF_F_HW_VLAN_CTAG_RX | NETIF_F_HW_VLAN_STAG_RX;
+	ndev->features |= NETIF_F_HW_VLAN_CTAG_RX;
+	if (priv->plat->core_type == DWMAC_CORE_XGMAC)
+		ndev->features |= NETIF_F_HW_VLAN_STAG_RX;
+
 	if (dwmac_is_xmac(priv->plat->core_type)) {
 		ndev->hw_features |= NETIF_F_HW_VLAN_CTAG_RX;
 		priv->hw->hw_vlan_en = true;
 	}
 	if (priv->dma_cap.vlhash) {
 		ndev->features |= NETIF_F_HW_VLAN_CTAG_FILTER;
-		ndev->features |= NETIF_F_HW_VLAN_STAG_FILTER;
+		if (priv->plat->core_type == DWMAC_CORE_XGMAC)
+			ndev->features |= NETIF_F_HW_VLAN_STAG_FILTER;
 	}
 	if (priv->dma_cap.vlins)
 		ndev->features |= NETIF_F_HW_VLAN_CTAG_TX;
-- 
2.34.1


