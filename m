Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 448F7C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 15:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R1QMBs42lbf5W8fEMFnZutVKbcHq6PN61OYQJMcui38=; b=aN7nti4O/kdFTcjGLux2netpLS
	EEudX8MbpIFqzI8fKmtyQLotVheowtUQKL55WSe6QQ34isOp+U+rRABJEMt3tVZZx1CBWdTVELyP0
	F1qiCXO8enwTLRJxsqjUYdd0CilK0cJNmmrAjg9tu57lP7LkchxVcvu+YYfGsSghFubZANIXVryXi
	gh98cMoF4x2YO6hRgBMigvvY3/o49uf5fsN56fSRY4a6a55BcowglZTkNkRXGEtVcLPRbDNVpTa0U
	7q9OaK/RGmk9GBZQ7/HIYuGXHGRm5siu7J/KtpxDbRojVmoPJtsZ1581rGYW7xn+GlJLOiyiUAg/E
	QIfh0FAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Jab-000000004Yw-42Fl;
	Sun, 20 Sep 2026 15:36:25 +0000
Received: from mail-japaneastazlp170110002.outbound.protection.outlook.com ([2a01:111:f403:c405::2] helo=TYVP286CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8JaT-000000004UJ-1ZvJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 15:36:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l3gRqvLNXYIBMer6kJxvOZUezyKFqViHf+WElIVhamKBjTcSVLYf0st+N+r8SZYuRjyRBxQekE6izQ5Wq2lqqsySAKf1F3gZAXsU9WTH6vQhletSLgig4eZz7NNjUuyZDS/4tS7ZlJuSb/W3Q9dwgcz+TFdliuob1bYi5axdi3AL/FqJe9kI8Ocj2EwlOrzyjywZlnxyiIRyj1R1GTdWYpX/9D335Hg4SRbFYL8LrDxnQcFxKtziLJ9V0t0X44AVfgN3V0PCZGy+gxBr2Ag+1H+wvyvkNnSJV7P+YFajLbQdNbG2e7VN94gnsbTkKt8wDY++IJTQ2PXxOHkds1R87w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R1QMBs42lbf5W8fEMFnZutVKbcHq6PN61OYQJMcui38=;
 b=ZeHps0IWAXZAMnorXxUfZKUilM0RlIKdiz8WG5c9m1Jp2LXJHfpRYXK5+lAmlz6K20GU/zwm0fotEb3TgIS/HNB6SCDyoiAic8hxBfDApF73vKaKcw2R74lxuyDPeepF63iIy78CZeilGk+Nx+Z15NysvQu2/myq1j916x3CC1M629Uv4GbKDLrOOn+9PzPH8TL8Yksg29QpXQY2sgcKstlQygZzP+BCpsyaMIW5Nf/GjuDdrNHkQv/y3pgKlbq9CC9VpbwieuelVjPzzVKoMcUZXu973Allof2co+HSGnnQa1/pfzimOJ7Dyfe7B4DNRBeOmEA4wv0k3r+eW1YPow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=bootlin.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R1QMBs42lbf5W8fEMFnZutVKbcHq6PN61OYQJMcui38=;
 b=Caxalaz87whSaGAnwpwVEbmoYvnT/280X3rUn/m0Ip4ufLUW7ytzrgb65B3alE2qxcSFl12JzEvUMBKPmw2otdj7k2neVhmOa+wWs91qYeSAUSDJjid/NrhFwhgamjywwqxW55wPrVCO28s3/FT/n1PtzTaQC6AGeKaN7Na8XO4=
Received: from TY4P286CA0069.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:371::11)
 by OS3PR01MB8793.jpnprd01.prod.outlook.com (2603:1096:604:153::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.14; Sun, 20 Sep
 2026 15:36:06 +0000
Received: from TYO1EPF0000501F.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:371:cafe::c) by TY4P286CA0069.outlook.office365.com
 (2603:1096:405:371::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Sun,
 20 Sep 2026 15:36:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay004p.adwin.renesas.com; pr=E
Received: from ejcrelay004p.adwin.renesas.com (8.62.32.50) by
 TYO1EPF0000501F.mail.protection.outlook.com (10.167.240.4) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Sun, 20 Sep 2026 15:36:05 +0000
Received: from vm01.adwin.renesas.com (DEU-5CG20946WF.adwin.renesas.com [10.226.92.22])
	by ejcrelay004p.adwin.renesas.com (Postfix) with ESMTP id 09DDC30000BB;
	Mon, 21 Sep 2026 00:35:59 +0900 (JST)
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
Subject: [PATCH net v5 2/5] net: stmmac: Stop toggling the EDVLP bit
Date: Sun, 20 Sep 2026 15:35:13 +0000
Message-ID: <20260920153516.103461-3-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260920153516.103461-1-ovidiu.panait.rb@renesas.com>
References: <20260920153516.103461-1-ovidiu.panait.rb@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYO1EPF0000501F:EE_|OS3PR01MB8793:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 075475c0-8a89-453c-c132-08df172ce25c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|82310400026|36860700016|921020|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: NCETQQiG/LDWAN0isCi1frBHCu9jr0UzkizyR0yFF3GMFQW31A1OO8CGUO7XWOnIv4fkVp+y34ZeV9jqSMAvHSiclH2i1p6N7kAMLE46ephiuImQIPp545opWcAk+0AcZob/AfzK8YII54fV92ejVZAJ2A3bEF2E3K7E4quDZPumvmr4SPOx25+OxnHkJYv7uteIkme3oy+qe0hPKYtuDB8x9AFcRICe6N57UmrmiVLoKox84aivwTKqXsajeD6iBuYlxlSlW09KRmHQybPKSa40Y+l3ohKCViJJIRrshbTjoY8eYIp+gfHBsaIjyAksGz3/ic5Rg5RzkgCpCPmbhzOsVR3SstYa/4MfAKU9FhmvelRKosK3pMS/heJRb+vKNs9h8Ujhuh13gwoBby5lpPzXICjmrUAbfHvsa+PvJI+JQeMGRob2ZVDzK0dTu4EdmPsEEAYubxYkk5jdF0RpbYSrwQZQEfuvCnp6eksXfYvfLdv+6Eye7j1HNm+vr4pyuZ9ly9GXUHR8b44QMtM0zAyfbjAShmTKTbxMulgikzThI+xx6P6Chv2s5LdMv/GAr1G+CqPqIZ1BZkBpqRD8Mnx3HJHg9LPMA4Y/+qCT2Z1fSKMNENMADvboyFRbz5GU8GkYynig/5QVnHdxv3KH1XSSLyjnDoJSu5F4sQMS+ewo28qqBUxkUTaNZFQT41J+mxemfCBnh+YEn14xWPV+AWMUAJ6+KrPFYn9TdwAr1UZiMAjBaqqejvw6gZGmE/1W
X-Forefront-Antispam-Report: CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay004p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(82310400026)(36860700016)(921020)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: C7RPhhAhjMW4i3cMwY3mCd+JFAO48CxReLAF3mk5xQM/P+QkVaFk296wn6Rmiv5TgH1Y6PqU8LszZ7dpCX0Gm5ghoKUyoa7MevaxsA7r4yA+K2G9ySniGsxycPsZWUOXcU6lSlVgaCkSXHsJZHOp4m+YMWOpdLURaHXU5/4IOTf46bzYiUUCSbgFQW1CSVZMHSocONt+/BTq7OlRteXiYfywOCWS77UOQIp6HAzC1l2Zw1vq77r9TMZBIEjJA/s9xc8fk1uAyS5zv2WPDp6iJUOMy3hHTqNkbgPwxf77nVHtMOG1f1QSWFMRbd5gjD19gRnWnHD1t+JwpKcb2ljc8vO5N1TnH3DTMRDGpnVE7nd5SSjToyuB7p3cGlCgjRFBcIXpweZCZTG14RSo4lWFdGbTwFSGcS3Ux5YZAX4q4MMkdXsxdUO3SU0TzooOvBlv
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2026 15:36:05.3135
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 075475c0-8a89-453c-c132-08df172ce25c
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay004p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TYO1EPF0000501F.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8793
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_083617_419940_8F10A563 
X-CRM114-Status: GOOD (  11.88  )
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

Currently, the double VLAN EDVLP bit is toggled whenever an 802.1ad VLAN
is registered. This bit enables processing of the inner VLAN tag, which
is completely unrelated to S-Tag VLAN handling.

Move EDVLP handling into vlan_set_hw_mode() instead, and keep it always
enabled, so that COE can work for packets with an inner VLAN header.
Add a dedicated callback for dwxlgmac2, as it doesn't implement the
set_hw_vlan_mode callback, like the other cores.

Suggested-by: Joseph Steel <recv.jo@gmail.com>
Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
v5 changes: None.

v4 changes:
- New patch.

 .../net/ethernet/stmicro/stmmac/stmmac_vlan.c | 20 +++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
index 983a90cb9767..200b34588c7f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
@@ -174,19 +174,16 @@ static void vlan_update_hash(struct mac_device_info *hw, u32 hash,
 	if (hash) {
 		value |= VLAN_VTHM | VLAN_ETV;
 		if (is_double) {
-			value |= VLAN_EDVLP;
 			value |= VLAN_ESVL;
 			value |= VLAN_DOVLTC;
 		} else {
-			value &= ~VLAN_EDVLP;
 			value &= ~VLAN_ESVL;
 			value &= ~VLAN_DOVLTC;
 		}
 
 		writel(value, ioaddr + VLAN_TAG);
 	} else {
-		value &= ~(VLAN_VTHM | VLAN_ETV);
-		value &= ~(VLAN_EDVLP | VLAN_ESVL);
+		value &= ~(VLAN_VTHM | VLAN_ETV | VLAN_ESVL);
 		value &= ~VLAN_DOVLTC;
 		value &= ~VLAN_VID;
 
@@ -222,6 +219,7 @@ static void vlan_set_hw_mode(struct mac_device_info *hw)
 	void __iomem *ioaddr = hw->pcsr;
 	u32 value = readl(ioaddr + VLAN_TAG);
 
+	value |= VLAN_EDVLP;
 	value &= ~VLAN_TAG_CTRL_EVLS_MASK;
 
 	if (hw->hw_vlan_en)
@@ -254,11 +252,9 @@ static void dwxgmac2_update_vlan_hash(struct mac_device_info *hw, u32 hash,
 
 		value |= VLAN_VTHM | VLAN_ETV;
 		if (is_double) {
-			value |= VLAN_EDVLP;
 			value |= VLAN_ESVL;
 			value |= VLAN_DOVLTC;
 		} else {
-			value &= ~VLAN_EDVLP;
 			value &= ~VLAN_ESVL;
 			value &= ~VLAN_DOVLTC;
 		}
@@ -274,8 +270,7 @@ static void dwxgmac2_update_vlan_hash(struct mac_device_info *hw, u32 hash,
 
 		value = readl(ioaddr + VLAN_TAG);
 
-		value &= ~(VLAN_VTHM | VLAN_ETV);
-		value &= ~(VLAN_EDVLP | VLAN_ESVL);
+		value &= ~(VLAN_VTHM | VLAN_ETV | VLAN_ESVL);
 		value &= ~VLAN_DOVLTC;
 		value &= ~VLAN_VID;
 
@@ -283,6 +278,14 @@ static void dwxgmac2_update_vlan_hash(struct mac_device_info *hw, u32 hash,
 	}
 }
 
+static void dwxlgmac2_set_hw_vlan_mode(struct mac_device_info *hw)
+{
+	void __iomem *ioaddr = hw->pcsr;
+	u32 value = readl(ioaddr + VLAN_TAG);
+
+	writel(value | VLAN_EDVLP, ioaddr + VLAN_TAG);
+}
+
 const struct stmmac_vlan_ops dwmac_vlan_ops = {
 	.update_vlan_hash = vlan_update_hash,
 	.enable_vlan = vlan_enable,
@@ -296,6 +299,7 @@ const struct stmmac_vlan_ops dwmac_vlan_ops = {
 const struct stmmac_vlan_ops dwxlgmac2_vlan_ops = {
 	.update_vlan_hash = dwxgmac2_update_vlan_hash,
 	.enable_vlan = vlan_enable,
+	.set_hw_vlan_mode = dwxlgmac2_set_hw_vlan_mode,
 };
 
 const struct stmmac_vlan_ops dwxgmac210_vlan_ops = {
-- 
2.34.1


