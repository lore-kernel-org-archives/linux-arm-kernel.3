Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5301EC5DF8C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 17:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M8eD4UIPV5wBKpRLtXpX3q1xKOOi8y5FH6csbtIBhIw=; b=It4/MmRuOCdpUwmpz4PCdKcX2O
	UPX0SZJ61CmYKvVnHS+lhuj68xY0SGTWrg8e+fsURCLPxfP8VekzS0k06CcLY+32AjLC1RBUzYvxm
	ImjgiwRNyBZrKAl1MFYcu0XN9RU9zetQ/sHJi6glwl15ym6Gm/I3H4msFTNrxPZ4SWtAxAcwEKt5f
	/LeoyMafQ7Ga7uVxpUPU9wFux3lBfJoVycfHmJIKEPRHEe1jimr4Ry8TSS4iRKtgUrjW/6j25PT8d
	ANoEkPeykLTMoynYTl3cuTN8GM81UqwUnd9llMQIpjE4d7Kd4eEPCQRiiFryNd3T1bnBS3BhZJvje
	r2wMWnNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxSlF-0000000DsJy-3Mo0;
	Fri, 21 Aug 2026 17:10:33 +0000
Received: from mail-japaneastazlp170100000.outbound.protection.outlook.com ([2a01:111:f403:c405::] helo=TY3P286CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxSl5-0000000DsGd-3Vd9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 17:10:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nRLfRRQX4YtBHgJhJGxMsrfBRBMANaaDokyCKpAmemiICNRQDL1RBn/YY2UqY0wS2xrp0O84NMxG9bpqNjMIs+bVEPcEim5ZQ4w00XfejeATbVRj0kP5lzL5eoZW3B2jgXh//uMJtznMXIkdKjjrqYwAc/CU5j6OW4G7oJj62/bjv3JLykxUM4S7ODZZG/x85Nbi7C/HG6b4BITZ0+r8mA/ZQ1GYcfzkBcvwvRg5CGN0DogqQnHspFOtwip8Aqsb/O7RSiuTNF8M6OQqKGWCTM8Z+al6D9pJALhhvWw9sZk273lDOXPdtDRvISUly6BhMVi3I6Qw2j+iqiX6YYzWeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M8eD4UIPV5wBKpRLtXpX3q1xKOOi8y5FH6csbtIBhIw=;
 b=qVrVXCEZriGdsSgxpyET8m+Xixdv8w5RLHfrTwZ+8SemysKScK/0vcwV6bRpL6PKLXR27cVBQhpPaXGTNMYEGLlXouyDjoC6VQnk3C20t40M5Ip0uczrrOXFMLip/9f0h6qoUi2sFwCpDLAcTHlKHens5dtgrAn9rQxSqjMqX5SopXIlstcNBIF4lSrKktDDpAY3BSwDackbx8Lr0VSksiH89f2k8hY4rifu1ZnWCRztbz4U3NzqfDGh4/WmmdriX+v0vQosvYAHDAdSSwJmzaACdcsj2un9pyDIDSqOS67EDBXO6Kt8ah1KZY0KhYVLJIA+RNQbud9s3h3H0g3Q2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=bootlin.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M8eD4UIPV5wBKpRLtXpX3q1xKOOi8y5FH6csbtIBhIw=;
 b=aPdMZ2I4QSD7iJKzftpopI7+0V3WCU2VFjZMIbBNxhxRQlZuO4FVUrXDrEZklu49Spbw7/pyR3k96IvTnHQKFh+h7hEyH58Snm6IJ+pvLzBydvV1z44hTcDoBeEhFEeOUjZ2iA7GX4Mo2/7WqnXPCFNn5zxRb/Z1686Gpea7YDc=
Received: from TYCP286CA0255.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:456::15)
 by TYYPR01MB15106.jpnprd01.prod.outlook.com (2603:1096:405:1a1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 17:10:16 +0000
Received: from TY2PEPF00005621.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456:cafe::5f) by TYCP286CA0255.outlook.office365.com
 (2603:1096:400:456::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.11 via Frontend Transport; Fri,
 21 Aug 2026 17:10:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 TY2PEPF00005621.mail.protection.outlook.com (10.167.240.52) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.3
 via Frontend Transport; Fri, 21 Aug 2026 17:10:14 +0000
Received: from vm01.adwin.renesas.com (DEU-5CG20946WF.adwin.renesas.com [10.226.92.76])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id 3118730001F6;
	Sat, 22 Aug 2026 02:10:08 +0900 (JST)
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
	yi.fang.gan@intel.com,
	jun.ann.lai@intel.com
Cc: linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Subject: [PATCH net v2 1/6] net: stmmac: Remove VLAN perfect matching dead code
Date: Fri, 21 Aug 2026 17:09:54 +0000
Message-ID: <20260821170959.79708-2-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821170959.79708-1-ovidiu.panait.rb@renesas.com>
References: <20260821170959.79708-1-ovidiu.panait.rb@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF00005621:EE_|TYYPR01MB15106:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e1a8b1be-f8ef-4ee9-6b99-08deffa71153
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|7416014|23010399003|36860700016|1800799024|921020|18002099003|22082099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: sIHgBtSxbJ/2Z9hlDCQAm3+P/i28l4WiMB7uLaOtkuBD9nnErVk/3JU10Ud+RQcsSf4AU4F60WQerC/5r5ekI55ZUGIkIbmIyUS8RYbf3RU8muRXBC5y7jRZMUmHn/UauyztOOAIlmS80N+n0J6squXiDdwByg+I7Kvo5mgaB7RAPYdQkz3IrCMX1rcUNcuA22wRq3n6RqU4cgn47fwJ5wMpAVVF2O4dMb0TSCfARnZbIvxx6InyVR0bB0zpI65vVqwGEUjtA2ob3lTKFtlOhIpNorhtfLBBkDlWFK8SjG4YvYpO5FwzpuQuTrYdbHxYevA/LOVtozwL/pTYRy7lFhBy3qiyuZsJXMfzY3vNqHXe/SITzktdX23Q1PrBfvpw96uFuoIGQf4J1xpVqx2sdpk3rlfBsTYL7WzI8+7cf44XNobbigRVyOEadg7wRzwlX1PbJNyRMH74mWaSISe/PL/t6w39VLF28oziB4uL3pgLS3/oS5IG4lNKUQAjmiu3kW2zp/vMq3VxOvwivs3rDbhM6MXSxQGNzkNxUyHeIScDUv0zgd4mU/0PBFte7NSjOmgYK947Hmorb/PEIgosF20jXlzqVwmRNMugOseOrNqCfLABYt6aKBFWYlPD/sfsAW6VNhYkKuyO+rkVym6BrNa7Ifc2xX00VZTaQPkmMYU+qmThf1zBiJWsVaRQs43RoinkwUHIdCxfvM0myDjI67w9fka41qasyO57PCWlSYLdFN0qAXPr5SjbOTQ9kg5W
X-Forefront-Antispam-Report: CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(23010399003)(36860700016)(1800799024)(921020)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: dXe4tPlV485sPWfW7gk9lnQH2my4GgCj/oc4AcR+ypXAX4oM12oZuR+ekAYKtYtTI9wCG54T3XiyyoBE5/9TZvQePia84O+6TgTofd6jm68Wq/4SqLhPWZz4gaXFxeZ2660yc42YnTEYB5JtbmM9lhaKsQQ0UsnEP+aGK8wmuw6rVkjkqnUXijDKmhh3ADMhsLNOkd/ygL1tFTRTDp/oyjjgaOAZTFM4cUSKPUSD91Swi83L968pft0XcS+z/30ksKE3+1OXm/DRoJFqtQw8NLoEiEqDwL5npMB/v08nhAoEpSFvKi0nYvfEdqhTePwrF6ufogNVAN2Ri7Gf/45iS5bZ/4hrSG6gYrKALOYBbO9Pnqs4M/P74XRNa3l3CB+60bPT0gpmRje+ItT9xd/xqeXPeaSfvEcBNfMoDTrDM8iOFEsuNJm6rp4WXqBPFTNx
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 17:10:14.7981
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1a8b1be-f8ef-4ee9-6b99-08deffa71153
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF00005621.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB15106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_101025_440411_AB48BF5C 
X-CRM114-Status: GOOD (  15.79  )
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
---
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


