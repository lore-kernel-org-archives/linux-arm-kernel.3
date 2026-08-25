Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C96C61DBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 16:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yNCjUhefoBpAluzPAVyMabIzwWCLiuDCKhXuni5gct4=; b=pFJorRJKQCfUtDGIJVuKNtQqFr
	ueSILzAsgXKSI5X2wqcN1d4aZtjZLv81C3+kAQTOCL5EsrnX3i9kL8A8k5JY/HiXDDT7+0rouq9Ip
	jeKE0JgwVaMLzpYKsOkoSapTEzSrO8Z56neuea2Oyda0KpsdwgZ/FYnTjPUV2JlbMrAFjXM/uYY4w
	4T8PZs3d/xxPdRQbabh2U74WO07Yskk4zRWxflmg2sv+vcxGjAP3yN5FgNcSrQAEM2UwahiG6u8Y0
	N3yTMl5GeAZF3FzVbV4AMhHFDuIcwCRuvl4BPEODdNii6skB+G84EkINo8drBBT4UnfnnTY5yK9Xh
	cdSQLIsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyuI8-000000018t3-3P1Q;
	Tue, 25 Aug 2026 16:46:28 +0000
Received: from mail-japanwestazon11011016.outbound.protection.outlook.com ([40.107.74.16] helo=OS0P286CU010.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyuI0-000000018r2-49xc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 16:46:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lY6a3UT/JgIb5oWrBiTK084koG2D/VRGrNU8VDKEdJFguKtv9hgyw+awdY3VDfzDdaCjP/agXmWuXsRgSLu5rT/Wi0Q8j9wnSMG85mgxkzegFLTpTX1byCz7O8rYrm/XtWjEOcFpw3xfk6+9wStqNsSNE9T3t6hgIWsBJpnKC9pWahmLKAkZh0ymLz+Ck4G7F/3P6lA/MamTz63HcFa/WJBwnM96XR+mZzT3gkQec2geMPQqfKLGudi9cevgqy/17F+AfraIFJXuc/wSWjy5WHcn0YOTJXssTaJiUXCA8kfHSJVBSb0AfSQgLz4Na5lA9z9iANYQfXDaLwrdAhDKwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yNCjUhefoBpAluzPAVyMabIzwWCLiuDCKhXuni5gct4=;
 b=WnwzqytpADBnX9aJAfBl4t53fSlF3CVwCgrGakCSruZ316HbaIMSzPtDpNzoXr/tNO/xENdZk+s0xQ/1fQJgU6VUjtFAQ5TIEzA4Ru3z6ZnCtEO3V2YXVSBKhahTP1nT+MWBtXvOPxp0YSbqoJ+7PoO5jfhqkQ7OPlpQTKk2PJ4iSgc6xf/t+Jj2VU+6yK9yIhM/LctWPFV94+WfReEDiFnIiedVmtYrUKUtT/KTXd4IMz3ST6rE4B0GUt49UENJa5mieIih2NMil76+tJ6RL6V3vEJXy8tNmhv9Z1+9FSPKuahNETi9b/d9euidZcFTHJhdqFgXREQelIa/neVoqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=bootlin.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yNCjUhefoBpAluzPAVyMabIzwWCLiuDCKhXuni5gct4=;
 b=WZc0O3rGFy5i1QQ1LJytGYJ9WZJY5LUqQs6a09s4W+tkj3cbwYQKJetNIsbfJ6YmWUOCKyV/NtggrMXvZZgKy7vSBpdp0ORrFrspLyKJ365zHX4CxUXf+3/WL7PSdOGmBlS6kR5ad45lkfu+zteRZgxsB2gZHM4qd8Ln4zpfxOw=
Received: from OS0P286CA0135.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:16b::20)
 by TY4PR01MB17209.jpnprd01.prod.outlook.com (2603:1096:405:334::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 16:46:13 +0000
Received: from OS1PEPF0000D216.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:16b:cafe::86) by OS0P286CA0135.outlook.office365.com
 (2603:1096:604:16b::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.7 via Frontend Transport; Tue, 25
 Aug 2026 16:46:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 OS1PEPF0000D216.mail.protection.outlook.com (10.167.240.23) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.3
 via Frontend Transport; Tue, 25 Aug 2026 16:46:12 +0000
Received: from vm01.adwin.renesas.com (DEU-5CG20946WF.adwin.renesas.com [10.226.92.185])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id 525C330001CB;
	Wed, 26 Aug 2026 01:46:06 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: maxime.chevallier@bootlin.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	shuah@kernel.org,
	joabreu@synopsys.com,
	jun.ann.lai@intel.com,
	yi.fang.gan@intel.com
Cc: linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Subject: [PATCH net v3 1/5] net: stmmac: Remove VLAN perfect matching dead code
Date: Tue, 25 Aug 2026 16:45:18 +0000
Message-ID: <20260825164522.4244-2-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825164522.4244-1-ovidiu.panait.rb@renesas.com>
References: <20260825164522.4244-1-ovidiu.panait.rb@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS1PEPF0000D216:EE_|TY4PR01MB17209:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 695bef9b-70bf-495f-6b1a-08df02c85f1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|23010399003|36860700016|7416014|1800799024|376014|921020|11063799006|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: hbOJjgd19VR19P+Qg7Y65Zr3x5bAE8ikpe6p+zilpID0/c8buaZ0YeLXxtue4aGtCsa3xCtF9xfpPXBQQb8Ghn26t+3pBreb24rfmNaOk5flek/pBO8sHZhtyMUDfO0DmhUFVoed0Xg5ua9rWTAwrqhS+yYIzQDkYyQ/uBjJMJRUuhKWMKzyOYi8rLexgW4yiQx+jzmbhs4A0pwoxRQC1O8jTMRvgu43zzefiPY/Bx1LcCkQz1pbeH3Ax5z9KQnJZ7u9MzH5PldzcXbBMjkDfy/YtnOu3RDHOP1rjldILU3PUoUCwQhGsDYkZtnscUHAVgDV4vFz2WUj27i70Nwj85FtF2eY/vVRrajg5+Q3G7eKEHBHiBVrNrMD05yTq66Yz/FlLOSMH2ZuvtFdecs0MmLC5uFqEVRUHOpa8CZu73WHLIMPi2Hx3r7I2cSZzoaio7JAwCTlD50AhZ/VCreD2ky6nhCwVQYNuh4urRE161sPuzhIexgIv1nFTeR/po7PHTLr3cW2YTntZMbWCCJcTz0bfdOGpInz/c5taH1+x9NIGGCr3GFl97LqfL9iAZZZ/DpSE8DPUagWGVvVi3U+s/IOdq3G50KgfnICHPjsDO8e8hGPIAqEqnl9jyA6NsDgqXKDgx5Z+DqYm19VyMKNm3ByO75YBytC7govJBOtSgVQPNx3sf6QUCPCn8PKi5f0d6K6GAmnN/XRFLXqPGD0NQBjtMobaFgj4aLLm6eznM6xqpUFOtRTA7KFHdbuo83H
X-Forefront-Antispam-Report: CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(7416014)(1800799024)(376014)(921020)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: eNx+g/BVxbKX55N2GWAEWMWj3CxMgCVFufREHpnK7Jtiv10wWqHuuztw/ymXAbFOnmoUmQe5BfN86cJy/NvRJ0GJxtCWjQ5WWJq0PhW44zipLopQaLzGPj4R8U4RYAFtH9RRg8dgHTgV202HOmVkB7x39nU0HiDKLobGzYsCL2Zv/a+BlCZ2tS4yaj3V1VB24+qROFMvNHZcBtdh2sYvjMh5V7xfVSblvOMJ+mbg9of1Ch3A1TdjZOCmKpBXyAFc4JRbpcqYWVBvEBcvvS9F9/4G6efTqEN6b1tS0ENnr3KhPnltO5VOFSgCOH/5JAOkVMALce9qn3OoVQ9ksxkhah4GPvwvSubN7zMMzzjjke5fx+NJGmqcmrJjlUQDwmQSVq6MvNQCpddBE0dSB5EgFWsonX/NEfyVHMpIlmLDS0TE770vyBxdPjv5oTecSFzt
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 16:46:12.1868
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 695bef9b-70bf-495f-6b1a-08df02c85f1f
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: OS1PEPF0000D216.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB17209
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_094621_036743_FB83EC76 
X-CRM114-Status: GOOD (  15.56  )
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

stmmac_vlan_update() falls back to "perfect matching" when the VLAN hash
filter is unavailable (!priv->dma_cap.vlhash). This fallback has been
unreachable in normal operation since its introduction in
commit c7ab0b8088d7 ("net: stmmac: Fallback to VLAN Perfect filtering if
HASH is not available") because the NETIF_F_HW_VLAN_{CTAG,STAG}_FILTER
features are advertised only when priv->dma_cap.vlhash is true.

The fallback is also duplicating the code in vlan_add_hw_rx_fltr(), which
is always available since stmmac_get_num_vlan() returns at least 1.

Therefore, remove it.

Fixes: c7ab0b8088d7 ("net: stmmac: Fallback to VLAN Perfect filtering if HASH is not available")
Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
v3 changes:
- Added "Reviewed-by" tag from Maxime.

v2 changes: None.

 drivers/net/ethernet/stmicro/stmmac/hwif.h    |  2 +-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 13 +-----
 .../net/ethernet/stmicro/stmmac/stmmac_vlan.c | 41 +------------------
 3 files changed, 4 insertions(+), 52 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 04dafec021b4..6f26dbf95ce1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -633,7 +633,7 @@ struct stmmac_est_ops {
 struct stmmac_vlan_ops {
 	/* VLAN */
 	void (*update_vlan_hash)(struct mac_device_info *hw, u32 hash,
-				 u16 perfect_match, bool is_double);
+				 bool is_double);
 	void (*enable_vlan)(struct mac_device_info *hw, u32 type);
 	void (*rx_hw_vlan)(struct mac_device_info *hw, struct dma_desc *rx_desc,
 			   struct sk_buff *skb);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index b2b7d0242dd3..16fe56a1f617 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -6809,29 +6809,18 @@ static u32 stmmac_vid_crc32_le(__le16 vid_le)
 static int stmmac_vlan_update(struct stmmac_priv *priv, bool is_double)
 {
 	u32 crc, hash = 0;
-	u16 pmatch = 0;
-	int count = 0;
 	u16 vid = 0;
 
 	for_each_set_bit(vid, priv->active_vlans, VLAN_N_VID) {
 		__le16 vid_le = cpu_to_le16(vid);
 		crc = bitrev32(~stmmac_vid_crc32_le(vid_le)) >> 28;
 		hash |= (1 << crc);
-		count++;
-	}
-
-	if (!priv->dma_cap.vlhash) {
-		if (count > 2) /* VID = 0 always passes filter */
-			return -EOPNOTSUPP;
-
-		pmatch = vid;
-		hash = 0;
 	}
 
 	if (!netif_running(priv->dev))
 		return 0;
 
-	return stmmac_update_vlan_hash(priv, priv->hw, hash, pmatch, is_double);
+	return stmmac_update_vlan_hash(priv, priv->hw, hash, is_double);
 }
 
 /* FIXME: This may need RXC to be running, but it may be called with BH
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
index e24efe3bfedb..983a90cb9767 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
@@ -162,7 +162,7 @@ static void vlan_restore_hw_rx_fltr(struct net_device *dev,
 }
 
 static void vlan_update_hash(struct mac_device_info *hw, u32 hash,
-			     u16 perfect_match, bool is_double)
+			     bool is_double)
 {
 	void __iomem *ioaddr = hw->pcsr;
 	u32 value;
@@ -184,20 +184,6 @@ static void vlan_update_hash(struct mac_device_info *hw, u32 hash,
 		}
 
 		writel(value, ioaddr + VLAN_TAG);
-	} else if (perfect_match) {
-		u32 value = VLAN_ETV;
-
-		if (is_double) {
-			value |= VLAN_EDVLP;
-			value |= VLAN_ESVL;
-			value |= VLAN_DOVLTC;
-		} else {
-			value &= ~VLAN_EDVLP;
-			value &= ~VLAN_ESVL;
-			value &= ~VLAN_DOVLTC;
-		}
-
-		writel(value | perfect_match, ioaddr + VLAN_TAG);
 	} else {
 		value &= ~(VLAN_VTHM | VLAN_ETV);
 		value &= ~(VLAN_EDVLP | VLAN_ESVL);
@@ -251,7 +237,7 @@ static void vlan_set_hw_mode(struct mac_device_info *hw)
 }
 
 static void dwxgmac2_update_vlan_hash(struct mac_device_info *hw, u32 hash,
-				      u16 perfect_match, bool is_double)
+				      bool is_double)
 {
 	void __iomem *ioaddr = hw->pcsr;
 
@@ -279,29 +265,6 @@ static void dwxgmac2_update_vlan_hash(struct mac_device_info *hw, u32 hash,
 
 		value &= ~VLAN_VID;
 		writel(value, ioaddr + VLAN_TAG);
-	} else if (perfect_match) {
-		u32 value = readl(ioaddr + XGMAC_PACKET_FILTER);
-
-		value |= XGMAC_FILTER_VTFE;
-
-		writel(value, ioaddr + XGMAC_PACKET_FILTER);
-
-		value = readl(ioaddr + VLAN_TAG);
-
-		value &= ~VLAN_VTHM;
-		value |= VLAN_ETV;
-		if (is_double) {
-			value |= VLAN_EDVLP;
-			value |= VLAN_ESVL;
-			value |= VLAN_DOVLTC;
-		} else {
-			value &= ~VLAN_EDVLP;
-			value &= ~VLAN_ESVL;
-			value &= ~VLAN_DOVLTC;
-		}
-
-		value &= ~VLAN_VID;
-		writel(value | perfect_match, ioaddr + VLAN_TAG);
 	} else {
 		u32 value = readl(ioaddr + XGMAC_PACKET_FILTER);
 
-- 
2.34.1


