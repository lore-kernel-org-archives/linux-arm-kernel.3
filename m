Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B13C54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 09:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zy9/6gNOLHqXQWipPdS69eP+Kmz+zBhH2QuHKEz3Sic=; b=IiabCx/QxTssxeoI4LidLD9uKe
	gwmfTX2yfSI9RCtWc2rk28tnaSVVhyQ2uHPKizUja9uHMLEgXk2FtF4/Au33VYAFnsHJOuXwcJ+wj
	mktr8IbQHuxx4v3Y1Qu28xY7WQn4XORV9lrMOolUx1z1SMCGsadf7uj3Pl2aw94KMECiFDxd9RlZK
	a7oBQi4za1knIwXpHTUvy1zYFl6yJ1f8LEXozOzZNpnUw3mmOi8YoE0loZ2PldJUw3vhP92KpkV/9
	g5ntbQU72mQb9ZGJOWrZUPUGgf72KTE8MvqK5xmMaDm8Y28lG2wK5vfMDUDy4sQ8qxvV44m19TjB5
	QYkPgzFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp0xS-00000007R5p-3pzd;
	Wed, 29 Jul 2026 09:52:14 +0000
Received: from mail-japanwestazhn15010017.outbound.protection.outlook.com ([52.102.194.17] helo=OS0P286CU011.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp0xL-00000007R1b-3cwg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 09:52:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wmPEM/zupQj59e7yesQQCdYKin+5fhTc56O27Ya0kDT4WMfoTu9D1RxwHC+kXEdPLij4I/3xrpbJAfCoh0m0lBD0lEzHhZgNY0SNag1MIwNAJnrEFyONyu6Te7QP61cJ0k3f8nWM2HguWCBfd24mbzZ06ct4jvZjjbH+4tg4JAa2Dx3e5S6TtYwZeQyZETHO+nF+q3EAKfK0EIdXxtLfOYhIKmU1GBu7qllI8/7syxcfRXMhPOSV69fsyHBF1AM89CTKkGG++iJMX0UY1waGn/B8w7/czd03fQyFTatvnz/58tYHsl+QQQWy8/O7Hl9ZtvO85HXdNnmz9miTWjtplg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zy9/6gNOLHqXQWipPdS69eP+Kmz+zBhH2QuHKEz3Sic=;
 b=j09zzJN8spWHpWqrUAyb+Y+J9GHbSUbWyVDyT3v56NRk6Lija4X3nWMeiKdG0UvLR5Auz9GUqQYWwJfKuB529OfnmOq7PZPkEUqFnqdZvGtvGWV57+0kUSRMDMCVPFKGOB0NOS/dIHLEVimOaGjdNjNxtcqJY1hrn8mIWr/ulwUj1cOQ3twOH2LVTVhGDzwspM5966IsOiLqZMWwOj3noRjk1q8dboLWD6vG15HtBh5sZZeaDfiV0BP/IKyYc1npAnGWYds1gtXdUkY1rC0G3zBqYs4Zf8eMn3eZRKLTDs2DiG7npAled+MYqiLcm9M/MhOTn4M6v2QM9+dVttsg5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=altera.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zy9/6gNOLHqXQWipPdS69eP+Kmz+zBhH2QuHKEz3Sic=;
 b=JbV80vWvFi+S9IXNUs4AumUlEtoM4nVuBYphO+vMnA4YoH2iU9lhaHl7eDl1G4/aIA1i3PxdF5ob9tQJtI/2cYVny94n4ssgoD25cKYWmRzy7sXDAwaQKypQDQOtkIFdFvJCCzudhctrtGKkh6MzdAtyl/RB5q00IXddRlfw2SM=
Received: from OS3PR01CA0039.jpnprd01.prod.outlook.com (2603:1096:604:dd::8)
 by TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 09:52:03 +0000
Received: from OS3PEPF0000003E.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:dd:cafe::13) by OS3PR01CA0039.outlook.office365.com
 (2603:1096:604:dd::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.12 via Frontend Transport; Wed,
 29 Jul 2026 09:52:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 OS3PEPF0000003E.mail.protection.outlook.com (10.167.240.7) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.5
 via Frontend Transport; Wed, 29 Jul 2026 09:52:03 +0000
Received: from vm01.adwin.renesas.com (DEU-5CG20946WF.adwin.renesas.com [10.226.92.40])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id 9C246300027E;
	Wed, 29 Jul 2026 18:51:55 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: maxime.chevallier@bootlin.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	joabreu@synopsys.com,
	jun.ann.lai@intel.com,
	yi.fang.gan@intel.com,
	boon.khai.ng@altera.com,
	matthew.gerlach@altera.com
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Subject: [PATCH net 5/5] net: stmmac: Fix double VLAN stripping on dwxgmac2
Date: Wed, 29 Jul 2026 09:51:09 +0000
Message-ID: <20260729095110.164157-6-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729095110.164157-1-ovidiu.panait.rb@renesas.com>
References: <20260729095110.164157-1-ovidiu.panait.rb@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PEPF0000003E:EE_|TYCPR01MB11332:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: bb2febf0-28b1-4d02-cc0f-08deed570ae2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|34020700016|82310400026|23010399003|376014|36860700016|1800799024|921020|6133799003|56012099006|11063799006|10067099003|22082099003|18002099003|12100799066;
X-Microsoft-Antispam-Message-Info: TLrjHHpO7nPQJ+vjckyF+r9ZFAR1q2OllL4OJUL9OIyC5jHLWAXl1yA5sWujM4SUjI6cX2SDjC5VBtZ4Lv8gcoiRCMVIRYNEDh3j0BmNWnjTAoluOsCa874/i9pVYjTgj37zt9HEy5ck4qoZRqei8SiQ86SjWjuwxwnHQZ7UNdAcC5FsmqkxB1MYdYdTULRb11t9taUj73rnCzr2yVTf7h+chux/sILDMqHjPOQoTWM3yV/YuSjyy26O8v0w7/vdvLKQ9GCWfmRTfB9FagLA1ND6tXeywJCDW/ZAYYC4Repu6hPKp2wEjh0s75W7CrueaP1D3ciaOD/lLnGuzf5ND6tD5WT308BPIA1iMZQ57BIbZJFLilNoiPyqc70T2v7An+28k20cWny7lTmR7pTFqe605yxcg08iXe9r8ha6RQcp4yQyJYN9eByt+wAJXtnLMtVmD7GahBfdImvIk8g+YWYciHwYuEPIxL/DnCsCthBmdH3uVvhoKeM0ojomQiJQqW8elaf6a29Xan4cxrdLuMeTEpmTBwqQG5eWyyakhSIWnrNfL4ob5xBAqeEbSys5knd/FTMnZhDoKYmBJJlNTCd9lWSNJGHEokOw4j22RXrRYsNyIddeZ3RSD5i5+fVcMJWCB4t/3g05WuGFv6aZFAjKk7Bzaapaf7VGe62ikwHj4fdhi+vyJwVkNtdZRgA6MxDXJmAOEy2T/4cgb4R/zrhwOfQP3POIKsvfSmgC8lYHSvxlxz3K0WnwGtRO70qR
X-Forefront-Antispam-Report: CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(34020700016)(82310400026)(23010399003)(376014)(36860700016)(1800799024)(921020)(6133799003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: SoBvhGvJ4cMLOQJd9GbVFTZxTh6VNAReuo6cQShXJdYs/WPTAUNatw8YQr8NS8/+IOLIJWiE/RuLon0lNG1xJqQ/6xOYZK1aIqZtuc0hnvimt2V1zidJYLRBVHJNjCFkKcIolPwYgam2oMJktnII4XHEW56CQmAg7Z8d9yT1panAhcLCo1l+4T3Mt2P9KBF1KRGf9mVmE+8GmBYTfaD3gM5ML4P6Nh/fMR5ld0ppQglbPZiUwlhgPk+DsKwvF0k+5nopOmVBkOLr/H2F4Rxt73JaQsBIwy+iBTQajbMkjClO9te4qhNKRW+SklsDsXdmbTh3HRvshbLlk9K7bXBxvND5qvaI1chCO6ocbE+ul0XIrLwwNfffeNO0J3dAqfqNkowsLOBUHrYF1V/cDp/WKOLY689oLPfzv8jU/Hu/WSMVY3Kx57l6K6L3m3uGJnxO
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 09:52:03.3108
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb2febf0-28b1-4d02-cc0f-08deed570ae2
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: OS3PEPF0000003E.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11332
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_025207_906165_6998982C 
X-CRM114-Status: GOOD (  16.21  )
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

Currently, vlan_rx_hw() hardcodes ETH_P_8021Q when passing stripped
VLAN tags up the stack. If the MAC strips an 802.1ad outer tag, it is
incorrectly reported as an 802.1Q tag, breaking QinQ.

Fix this by adding a new get_rx_vlan_type() descriptor op so the driver
can read the actual type of the stripped tag. Implement this for dwxgmac2
only, which exposes the outer tag type in the RDES3 descriptor.

dwmac4 does not expose the tag type in the descriptor, so it does not
implement the op and keeps the ETH_P_8021Q fallback, as before.

Fixes: 534df0c1724b ("net: stmmac: dwxgmac2: Add support for HW-accelerated VLAN stripping")
Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
 .../net/ethernet/stmicro/stmmac/dwxgmac2_descs.c  | 15 +++++++++++++++
 drivers/net/ethernet/stmicro/stmmac/hwif.h        |  2 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c |  6 +++++-
 3 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
index 6719ac6e395b..4fbd2442d918 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
@@ -61,6 +61,20 @@ static void dwxgmac2_set_rx_owner(struct dma_desc *p, int disable_rx_ic)
 	p->des3 |= cpu_to_le32(flags);
 }
 
+static u16 dwxgmac2_wrback_get_rx_vlan_type(struct dma_desc *p)
+{
+	u32 et_lt = FIELD_GET(XGMAC_RDES3_ET_LT, le32_to_cpu(p->des3));
+
+	switch (et_lt) {
+	case XGMAC_ET_LT_VLAN_STAG:
+	case XGMAC_ET_LT_DVLAN_STAG_STAG:
+	case XGMAC_ET_LT_DVLAN_STAG_CTAG:
+		return ETH_P_8021AD;
+	default:
+		return ETH_P_8021Q;
+	}
+}
+
 static u16 dwxgmac2_wrback_get_rx_vlan_tci(struct dma_desc *p)
 {
 	return le32_to_cpu(p->des0) & XGMAC_RDES0_VLAN_TAG_MASK;
@@ -350,6 +364,7 @@ const struct stmmac_desc_ops dwxgmac210_desc_ops = {
 	.rx_status = dwxgmac2_get_rx_status,
 	.set_tx_owner = dwxgmac2_set_tx_owner,
 	.set_rx_owner = dwxgmac2_set_rx_owner,
+	.get_rx_vlan_type = dwxgmac2_wrback_get_rx_vlan_type,
 	.get_rx_vlan_tci = dwxgmac2_wrback_get_rx_vlan_tci,
 	.get_rx_vlan_valid = dwxgmac2_wrback_get_rx_vlan_valid,
 	.get_rx_frame_len = dwxgmac2_get_rx_frame_len,
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 66837caafa84..eb6aacc0dfbc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -56,6 +56,8 @@ struct stmmac_desc_ops {
 	/* Clear interrupt on tx frame completion. When this bit is
 	 * set an interrupt happens as soon as the frame is transmitted */
 	void (*set_tx_ic)(struct dma_desc *p);
+	/* Get the VLAN tag type of the descriptor */
+	u16 (*get_rx_vlan_type)(struct dma_desc *p);
 	/* Get the tag of the descriptor */
 	u16 (*get_rx_vlan_tci)(struct dma_desc *p);
 	/* Get the valid status of descriptor */
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
index 9b5b3f11f699..4bb639c717f8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
@@ -212,8 +212,12 @@ static void vlan_rx_hw(struct mac_device_info *hw,
 {
 	if (hw->desc->get_rx_vlan_valid(rx_desc)) {
 		u16 vid = hw->desc->get_rx_vlan_tci(rx_desc);
+		u16 type = ETH_P_8021Q;
 
-		__vlan_hwaccel_put_tag(skb, htons(ETH_P_8021Q), vid);
+		if (hw->desc->get_rx_vlan_type)
+			type = hw->desc->get_rx_vlan_type(rx_desc);
+
+		__vlan_hwaccel_put_tag(skb, htons(type), vid);
 	}
 }
 
-- 
2.34.1


