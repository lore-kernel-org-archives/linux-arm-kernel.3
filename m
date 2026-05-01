Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C9ECCD3427
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 23:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0EsURogbOPKpg8drcyEWAVgfC0pd4ptQ5D4S5ByX0ig=; b=tPUSl5pi+9GgHpjM/BPlfyzzIE
	xTjQuJVdW1Tri8hqU1bzM4McZkiq6B0Lc+gT41F5fv+TmVIWiCPimO/Xxs8jnKldOk63RG/gdCC0j
	SEseC/zO4vrcD/Jj9g0D33TY1H5Q0xjbVnXeVmARJr9wnl69LSA5ZY8NHzpkhQnv2ZZx3zF7smi2F
	Qasx0LKoxUD8LEOq1E5J6otyW3Eyh+TbtqjiajyLIF+ndOdOAufNljbayyqgHQ2v8CSl8IPQTcw66
	ZtDHnVxCw7uVqvD0p0ebW05mbkUWwuFPMZozQVKBae8QzMtNs7Ey96ty8Pnh2rDTb6cGkSnKYMZ+C
	ZbgHrxDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIxL8-00000007pDb-3WNg;
	Fri, 01 May 2026 23:32:10 +0000
Received: from mail-westus3azon11011020.outbound.protection.outlook.com ([40.107.208.20] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIxL6-00000007pCS-0wy8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 23:32:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LJ562eYrPvL1ChSzZnAstyGPefC+pbsTAxoOHGwmxv533S9/SntkCStWYaaNBC0AB6m/WbIdY4cEtJiVLPNkA6WB7a2trn2GF+7iYp9bW9tvExbx3jugOqVCn/oUeuZCse98QPL+JDTPsgcHilcsnWUVz7lnqRKkOfALvFbCox9WY6sQk4phF1687nw/5NIvyVQqGhkWHLNOZKr7m6zvMJCPu+xnWlVlBAsOqEWKmDtaC26ZjMcNQ+C525ldWbx23enr8gClRhgZCv7chkqWGu0Vu3oRgyKqKv4oG2JtfP/W+FZYI22OKqtUgp5QrUnbAo8A+YLh0YEaJKREq1mDpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0EsURogbOPKpg8drcyEWAVgfC0pd4ptQ5D4S5ByX0ig=;
 b=mXzDxnwsQOROpJD8oa/zLCpbVDeQhQpav2IYVnZ39ut3VYJ8RLyvFXDZZimksRgOmXekeyVcjgvihXzpquKvm2DTH1gYrpLTKSCGt62PHvJt61L3IXUAkGAONDHSiU7T/gH0zn74ViKLS/wttKyjrNz/xIgDxVZCrW3C+yMh5PAJ2U4SamugWEOOSdfqs1oarOOgqVMZkyyZA9aVwjUK7DzLYS0VGNIAELzrCjDFp7wzo+SLJ+V90pPSOStV4cJ5DnGXD5v6pqSahDQ5AQ3Tr1iHDywMmwRzKahxIGkaFdI8z1cMHYpPuGdf9/ZLBY3LaPBn3P/ze7si/O8HhEH5Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0EsURogbOPKpg8drcyEWAVgfC0pd4ptQ5D4S5ByX0ig=;
 b=ouudGSY4WSEtjXwolhdBG5QAXkWArq2yp1xQFEPnXTpcjaADjV9TJ6nvvSx0g2XERYGOqmIH0qEx2omYZpXUdCX2lyo2xyBp1HE0U4z5BxL4c3TOhQOoilDL/D192PlK4PcOlxwFRkFSQL4rEZbw8Oqy95PGW72H1LIQAIKGtqQ=
Received: from CH2PR17CA0015.namprd17.prod.outlook.com (2603:10b6:610:53::25)
 by DM4PR10MB7508.namprd10.prod.outlook.com (2603:10b6:8:17d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.22; Fri, 1 May
 2026 23:31:54 +0000
Received: from CH3PEPF0000000E.namprd04.prod.outlook.com
 (2603:10b6:610:53:cafe::cb) by CH2PR17CA0015.outlook.office365.com
 (2603:10b6:610:53::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.23 via Frontend Transport; Fri,
 1 May 2026 23:31:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH3PEPF0000000E.mail.protection.outlook.com (10.167.244.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Fri, 1 May 2026 23:31:52 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 1 May
 2026 18:31:49 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 1 May
 2026 18:31:48 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 1 May 2026 18:31:48 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 641NVmOM4174732;
	Fri, 1 May 2026 18:31:48 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>, Bryan Brattlof
	<bb@ti.com>
Subject: [PATCH 1/2] dt-bindings: arm: ti: Add am62l3-badge
Date: Fri, 1 May 2026 18:31:47 -0500
Message-ID: <20260501233148.4180391-2-jm@ti.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260501233148.4180391-1-jm@ti.com>
References: <20260501233148.4180391-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000E:EE_|DM4PR10MB7508:EE_
X-MS-Office365-Filtering-Correlation-Id: 50b1f715-cd99-4f30-96b9-08dea7d9d2f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: qe6gHCuVl9tMbXeF9C9fYy2O4cDC3M+e9nOC9ZOZw+zP/wiusXzqn3NY+qbglj+EXYh0BoQ9k/2fxoYsJo08TNEptswUVzD3QOET5tNoRCtqjVmB2+qNJkDWQdfOoz6NkzWmgU0+mJqoO1hfR1teV8/SUTKmOuv+iw726B4lOWKU8WfOHgxTqXcvrSprcsaiMScFueJrthKM04HzunzAIo8eEfMtuaAn+KrvRq9HoBtOdClkxbkUUmF82a/0UME67x9u2RrtaUuaOcWhfiU4/nMJ5zyss7Hg7FThL/jZdIqR/OFgJ58jBa7myarwmPuyr2bZ2XdJhncqNC4tB6oBxEEvMDfyOgBt0gTf8ohd6bK9cq8+G/bv3X0bs35580XVoK8+70WaAIPMRAYummklufb/qQJwc1HpKlYVTcsDYn/ocRTZbkFQohx0e4Uwcued2GF2vJbhAO26wNRdmwez3BjxxwRZFim8kS1r0SBe8RuHNBeYnhEDrnUZ+KUIiCUnHbh6cICmWL2G5ebQkFNy2NGL85eL52SGWPzm/v2668y6s3O/lLWZFM64ndbjzD0k03l6Q6H82sPIfeSIMJYzuB2IHNudCHBzI19qfUEEfX3N7Bt/pUAwqy6Uco1qScKOldUj11ArjmOxWFbnPrH9AKCWUt4sKaM120MaE1qKcdbxSKvlP7kBzTVJ+NmrahNz
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: fbvjFoy9+HMSOmQdrYwUSnwHRyNG7mbayAZuJi4hif/DV6gI5g7aJ316XzJN+fptsMBmgpIzHt67lsholA/+fFitJCimGa9MfGXX5d+d/b6aXZNlCZNt3Y4wj7RRcBDIf68tO48onoln/a/SmEdNS5RHzfC1NseckZ3VrbsLSPQEB3gZaAuVTGc+VFVrqoAlboJWjbHNi0yPW6ReRBCglgEH5ppjd13XetnKZ23XtdcH0QzR+K9A+8AwVGSClWUMeg7uR2lIk82jVkN9ucHzYuuGONBHWMJGHENUbLNjswi9Jhc9AeWlKJTn+dPB5ZypdORjJotd3G2J4B22nPb2aMD4VAFNL14WojEcBzxyTmOppiMGUwsRmVwWLsnVOyA0BBB7zYAbpeLlCmFpS90Lc0dBfy1ryglcq9LlgrgWi55UKu6ywz0Z/D3ms8/jhRPJ
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2026 23:31:52.1013
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50b1f715-cd99-4f30-96b9-08dea7d9d2f0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF0000000E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7508
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_163208_348177_8FCA2F2D 
X-CRM114-Status: UNSURE (   7.89  )
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

This board is based on ti,am62l3

https://beagleboard.org/
https://github.com/beagleboard/BeagleBadge

Signed-off-by: Judith Mendez <jm@ti.com>
---
 Documentation/devicetree/bindings/arm/ti/k3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index 2a6a9441c23d..7a1f7cc06c47 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -40,6 +40,7 @@ properties:
       - description: K3 AM62L3 SoC and Boards
         items:
           - enum:
+              - beagle,am62l3-badge
               - ti,am62l3-evm
           - const: ti,am62l3
 
-- 
2.53.0


