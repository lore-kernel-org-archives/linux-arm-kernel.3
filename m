Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C68FEE4ED
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 11:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NecDxDW2+KlFt3y2eG8Gf1PUq/8JxfMru1S4VheYteU=; b=gfHvbm+BCFSiBm42QZ52Oej7UQ
	dNa/cMGxOebdpuEyDaGMK/Dh0f7VtwYHZDiqCvmdiecwOxP1i/D92/q4/DH+zIRuqfxKug4nJ9l/f
	sNkExORSs5rMO52/RFIUbiQw9lQ1Ep6eXTRa6jphx67/cV1u8E8JdbQIMXPROvBjdVmqQC7IsxjJg
	r0wyOMYIJ/MTvz4uEJCtIR48JLtct5nij485XDTXc77MMbvopVPJvyNQGNJmwOYImM8MJCnwfYych
	qDxACnPDFPw7SGnq5oS4H4U0VARQJJosMJrpHwPCzwIYpViMosEmOWa2A+rn+JYmYV9BdwIqYtaUz
	k4W1AXAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwIYc-00000009nEA-26iv;
	Sat, 28 Feb 2026 11:32:26 +0000
Received: from mail-centralusazon11010042.outbound.protection.outlook.com ([52.101.61.42] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwIYV-00000009nCI-0cxO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 11:32:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=resaYEzBzvh+FqDHZJVA/1rPr6BykHIU7OMKkxHWBIHwA8DNC+J+eC+UV8vv+sjZKyoWg2yNb1VR3snKyw0RGDf2lQxY/L+1anGfx9efqRt82365qmsX0lDG4lUt3TLwaBqywC58C3wpXcf1JUnwHVnWwJmDFQr8Hhxm3cfepZOnPnVOBd2wNla6LwVhsAe5GRuehOcrbBbV067fStCF04aHtMqxGINAdHNE/Nm23YaLHZtS4eXRvziwzn8/WwlOLpDQrRmmTwUGbINmxky2iDUnNTHKhn0s2+BHgc8fC074FbKUzojIsCXCBZ0B30GFBxwbBOPtZn1NCtJ7xTwnbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NecDxDW2+KlFt3y2eG8Gf1PUq/8JxfMru1S4VheYteU=;
 b=gM6EYh4WOrZFfmmuUJH/uJXDhWKq3dMk5PUv9Hi0Vwn4EP5R509djnSTsYeJFa9yVhQFgk2AlfDFXonY5aReCP0nXYFDmGx6PsEO/YI/v0GS2yRELlFLPgEXcKoE89OsTIdb0rOEP7Hp7ljbJqq7FZMdq6eG4gY7SBsJWQl5urQGAIBT8TrAtZUNzt4+4Tz5vtQ8zfVZJY/8lFZtlmcR2ik5CSVD3G+Fr09RhUY3dwfpV2A0AtCgF2fiSMQiWrgkOaefvxIOIsT5uxupNB+ToGs7OWfQRn9yXiJc16qC7Ewkqx/OeqWbWMNMwFsk5f7d2Aw2WMEqt0ZFap6VIWaDew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NecDxDW2+KlFt3y2eG8Gf1PUq/8JxfMru1S4VheYteU=;
 b=UGVn/RK0GfRKfmZPRXn0MCfGx3JN+pu0wVgwtRrnbDA3G7Q+jCVFvaxdfD37lrujVAHKzEhWMwFTIQ0PpK+iUfOo/6lY5aop/X9fPl8hPpENrXYBNWLi+Nk4EAAeCVZq2IdyF3uxVIFePrR3PautNF3T2g6w9rNmWWJ+nc0hyms=
Received: from PH3PEPF000040A3.namprd05.prod.outlook.com (2603:10b6:518:1::57)
 by BN0PR10MB4919.namprd10.prod.outlook.com (2603:10b6:408:129::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.18; Sat, 28 Feb
 2026 11:32:15 +0000
Received: from CY4PEPF0000EE32.namprd05.prod.outlook.com
 (2a01:111:f403:f912::2) by PH3PEPF000040A3.outlook.office365.com
 (2603:1036:903:49::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.15 via Frontend Transport; Sat,
 28 Feb 2026 11:32:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000EE32.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Sat, 28 Feb 2026 11:32:14 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sat, 28 Feb
 2026 05:32:14 -0600
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sat, 28 Feb
 2026 05:32:14 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sat, 28 Feb 2026 05:32:14 -0600
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61SBWEEK315424;
	Sat, 28 Feb 2026 05:32:14 -0600
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 61SBWC9X005196;
	Sat, 28 Feb 2026 05:32:13 -0600
From: Meghana Malladi <m-malladi@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>
CC: <conor+dt@kernel.org>, <krzk+dt@kernel.org>, <robh@kernel.org>,
	<kristo@kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<netdev@vger.kernel.org>, <srk@ti.com>, Roger Quadros <rogerq@kernel.org>,
	<danishanwar@ti.com>, <m-malladi@ti.com>
Subject: [PATCH v2 2/2] arm64: defconfig: Enable DP83TG720 PHY driver
Date: Sat, 28 Feb 2026 17:02:03 +0530
Message-ID: <20260228113203.498839-3-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260228113203.498839-1-m-malladi@ti.com>
References: <20260228113203.498839-1-m-malladi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE32:EE_|BN0PR10MB4919:EE_
X-MS-Office365-Filtering-Correlation-Id: e83f298a-a2c8-44e4-7a1f-08de76bd05a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|34020700016|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: NPUXtdGhzQ5vZUWSYaEYX3Ko0tWVrfxYzBT8Rd/jpoUEdL/FNInu6tktMEEdNbZXswBBM3Xy2wTPgakzOT8U558tFAgToDh/URv5lKJE8HxGPsm3JcZ5f+PHQdLgZZOLQXSwFvOOzN5j/B//O+EuhVzoaYTIJsyp9sF/jWCxQAZeWTGzUh5oq9hRH7qz5wh2hHIggkZoSyt6TNFSiym9KW7kZqYZX6MD/ZLauqEzafOu3CXOcH236BUxkAmqwpW/l5OEyditizXULA/VSMoh4DH2sPdqigYE5AgcB43spBuiQlNbiNuaR6YlJQ/5p0uWoRnrEBaE1+TjkfWH5oUzEUi2KyW0AVtmqwcmILehAjKFm5/xS4F+2dOsL1k+eWyz3CP1JtntQaY17HDjPZ20eScM/PU1z3/56v3X1SffW8uicMRfACAzo5FCFJgY9hnnQfrCKqTay36HhftW15kBPg1k9TYrDmf7geccR1Nf3ljB8WXKDxCilorrYMdoDwGtUGY8k8fkrGA8Kl89bsvru7Xgxkj7M75se0Mo0qJN9EZV9CMtUifWh56K1ldInoRHuvP4EB6j8QUctY8TfpDhgo2MAQiycRsbEMt+D7bdRW7pUh8Vg+1UZKW2JDntHMRUH4s6rqqQEybceKfopnGCwJIpipHptJD40DitS51KECCEo4lwoe+AavgY8KKsFyM4hrDbBAAsV/g18KFg31b75s0F7NKptefvzeKk4UqckCHg1WP3nLKSg6kIJYfeKsrsPu4KM99kfU4v597fnoaQKw==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(34020700016)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: CcLWSpOiyal5W4ji7RInVcz/CgkLkEPy4Wy29nBo3Qh7MWPXXBiksMGNScCJiSTLbsIDkDw/ac6Zw1Vt5ZZMMUG90kZUMoqLodcZCXdV8DxhnUF6gSi27oOgj3piYxyCWwlcEeyCAA94YRXxdmPeIRtxAKUctxTK/Rym7Jk3OSvf/RRoOzlt2NZ4ptjLptdc6umlaGgLDLiVKtPBTPV8bdHChE7AKbpyzGmQrl0wy6ontpENz/HO0g/ZeeLft3ZtWLy8K521u4+cxTaU5o6n+yLZcrdEWgOIozA4NDcwYGpF38Mgk3vqrBuY1PtHi7zqIyezPircpQdeZczy9o06OI6WfENMHB/z7HzW3m5UkMo8BQpfDzPoNOXM8SNgCwfZuGLB6tSLI7saWu+Xpb3eqdg9MNx5Z4IZOjj1ItiACLJy7XYYqvWpzQ2RsKrWoFld
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2026 11:32:14.7895
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e83f298a-a2c8-44e4-7a1f-08de76bd05a5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE32.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4919
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_033219_188630_9CED2CA6 
X-CRM114-Status: UNSURE (   8.61  )
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

Enable DP83TG720 PHY driver as a module to support TI's DP83TG720
1000BASE-T1 Automotive Ethernet PHY. This is required for the
DP83TG720-IND-SPE-EVM daughter card used with AM642 EVM ICSSG0
interface.

Signed-off-by: Meghana Malladi <m-malladi@ti.com>
---

v1: https://lore.kernel.org/all/20260226185448.2167189-1-m-malladi@ti.com/
v2-v1:
- Post this patch along with corresponding DTS patch as suggested by
  Krzysztof Kozlowski <krzk@kernel.org>

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index b67d5b1fc45b..3b88df2ca5e1 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -420,6 +420,7 @@ CONFIG_REALTEK_PHY=y
 CONFIG_ROCKCHIP_PHY=y
 CONFIG_DP83867_PHY=y
 CONFIG_DP83869_PHY=m
+CONFIG_DP83TG720_PHY=m
 CONFIG_DP83TD510_PHY=y
 CONFIG_VITESSE_PHY=y
 CONFIG_XILINX_GMII2RGMII=m
-- 
2.43.0


