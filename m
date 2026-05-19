Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B711CCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 14:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dHaz1qcofpb0p8LeTttGRwJDhLLxhNbYkdT0EuGuR40=; b=jCE5AGKQgICVKBAWmWUyhbqWhq
	UUPTXXldk9MkvuZoUcrkUQMG1kz1o70LtUvcQJnimWWwVl+/fb1Pberg50MQytm1H56Rw1uZRYFI7
	V+BkAqjsrU9p3YVFqWzNfxQnL6ZP8giAb4E2IsxusprEop5oVZHlN/ejl9UCdwPxOJYydlMdIpU84
	NxSItIb4dSMRCNADLnNPHNwX9lTNVD8cUdkWwxmXB5I84njgJ1f1NGpWwGMJav0Drq1u/0rJOqiJ3
	u/CqiQ5t8nE7LuyzbNQ4eI8HYqT0NQYZDVsTzSgg+R19z3re/OeqUyDux2ulBO0Uyi1fvpaaGMK+L
	EvtCNhJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPLN2-00000001ooJ-1J45;
	Tue, 19 May 2026 14:24:32 +0000
Received: from mail-northcentralusazon11012067.outbound.protection.outlook.com ([40.107.200.67] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPLMy-00000001olh-0n1G
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 14:24:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kq1UTNH1zdI+6emPyg23FzPoS3WUbpWzeckLCJoY0vRFOF5nBFejd+HE9HKwSmeUcheB1E6G7Z9Kj1ocMRNKSYyCZbGdXcPCfPXMtjCW+4tLK9Zy7RBxBGACGwB645ed95CWHI3ZZFk51MDXlF3vbBIA86Wy11G7sqi7bQpQXxZ0hd872AZwbxVilbUkgAiNprUp/06/HOsd4/jh89uHfWNP7ISt2borwC17hQZqOhqd2++EdtzcHXUdDwt6ZM8utctSzavi3P70FdVHTx97nNOzFU+BHuApepAa4ivAlQP0Bv5hLUSXmUgn9lYkKkg4IyjBHSCYcQ+w7pAVj/sC6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dHaz1qcofpb0p8LeTttGRwJDhLLxhNbYkdT0EuGuR40=;
 b=upygdtb+jboxrlu79KkqUUTBKSYnjdhK+RuOKXj95F0WcoVKgCu3M0uni65RpbZYhf+CRQ/4nlIiIk7Uqeo3z4ztmTxht8oA1tG4O/zsUJ7cjXKngpvMzN16UsycGgCzxOzObryPLSU3pdguC0WvH9CFZdesoMyohMUgfHk43YZ53hmMKgLu3M5LGMY3gc4z2NpLOj2bIySnnYx2UOwhctxZY+V7OO4RV/6k/qk0plohml/wvR1fcTg70sW/n2WRHzuN2BJd91Pxz7YrzBx1MVK08qgGe4mTlVPXzio/HJtRh1UmPuU3nA4Tth04FAo8iVXE3Kxb1Wj91aCQY53NGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dHaz1qcofpb0p8LeTttGRwJDhLLxhNbYkdT0EuGuR40=;
 b=QuN8s6uNVh3aJsHm4YCX+suf/aSp6coNgSTRkbjUaBb2eNNR9q1dI63jMKagc3y6Hqz0fo1+u2MfwV6PDY5VzKphpMgt1jS38O/7OfYXLAp6EcHfL3wj78iX+a8R07RUlAbMUDhzxTK+tegBwFNjOEbDVYwZAoFmwuovPXO/g+c=
Received: from BN9PR03CA0186.namprd03.prod.outlook.com (2603:10b6:408:f9::11)
 by MN0PR10MB6007.namprd10.prod.outlook.com (2603:10b6:208:3c9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.21; Tue, 19 May
 2026 14:24:21 +0000
Received: from MN1PEPF0000F0DF.namprd04.prod.outlook.com
 (2603:10b6:408:f9:cafe::ba) by BN9PR03CA0186.outlook.office365.com
 (2603:10b6:408:f9::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.14 via Frontend Transport; Tue, 19
 May 2026 14:24:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MN1PEPF0000F0DF.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Tue, 19 May 2026 14:24:21 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 19 May
 2026 09:23:50 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 19 May
 2026 09:23:50 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 19 May 2026 09:23:50 -0500
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64JENgoU4183406;
	Tue, 19 May 2026 09:23:47 -0500
From: Moteen Shah <m-shah@ti.com>
To: <krzk+dt@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
	<nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>, <gehariprasath@ti.com>,
	<y-abhilashchandra@ti.com>, <m-shah@ti.com>
Subject: [PATCH v4 1/2] dt-bindings: ti: Update audio-refclk binding and j721e system controller
Date: Tue, 19 May 2026 19:53:40 +0530
Message-ID: <20260519142341.2531948-2-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260519142341.2531948-1-m-shah@ti.com>
References: <20260519142341.2531948-1-m-shah@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DF:EE_|MN0PR10MB6007:EE_
X-MS-Office365-Filtering-Correlation-Id: 0de75999-1c4d-4b7f-a630-08deb5b251d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|22082099003|56012099003|18002099003|3023799003;
X-Microsoft-Antispam-Message-Info: t99ubpHnikmd8hWgP1Yy79TDO8y4wl2eeswUpw6loAPKjA+v7SYtZzMF9Lcm8GX6j+lop7bPlNPUGLs0UJ1RLvgJuHa1/G1paY0cMpKoqOGB9FmCQQbxqyTQHnqlJnnTSjlKgllSwQ456JrgYLkCGZy1MnGs+kZfaO4+zhvN1A36MIt+E/gO0wiuMrXmFlLmbodY5uAP45jq5gQMco3u5uVbQuIlJ2agnZzx6NokxB5a2ReIRXsnSK5xS4pn1/kcV0dS11+buJ388OPPnZod3el2hZFbxTDvR44gM02Yew8y4b5FviZVDHNp+8/lZWBcglbDsFXBrr20pkbO28Zw+HVzSpy9eAgbFcnB3vClyfdgvQhauo0Wnp3geiyo4kit9tEDEgEPuMYqPIZI7t9FzRYvAbuDiB5Yf6Vaxh8/yJd9DqugmXzgT9X/BFRi68Y3Wm86FatjPtDFZEq1CeY5Mtq9+7vjmQzk4foH3Lcztf4ikmKzMK7d1weFN4DHx+P3b5XF+HmjtOUD0IXCjkZp2EqlvFsijoYqs+DOU81jcbvFScCtSq5oygg5eloW+Hp1w6aAGqMiWcJr0X7bpR+VOJTobyPcNn3tdl5d71ZD2gh5pHp6o13gND/Kp/PMU9DrQ+grPP1cbzawpux5ICMQKPDvNyQd8OSp4HUywUmNF0SntlMF/oEx6dIqOjzpzv4CYsLbLiYnBVZnhdRgTfaI/gDjtFElGru2868jKLiWmCk=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(22082099003)(56012099003)(18002099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: n9oWbBxjG3Gy3RJZVCOEaRY07QRNxE15FcC8yH9g2RZDefOQZ1Se8Z8I+FD4h0hYS8bigkNj6jmvN6Qwb0Ra7sFgHrhYSVomjCvxSe13i+ChqsGQsdAcMl/xPNSdk+DK1oCJhJ2HewA4dXGhQHVgupx9U/0AnfFEqEkUQXyd+eBut9pwYlRjbqQBQZcipCYXd/hO/cZRLXBY38DiFnlynAa+vAQFpCtEf/6AJ/m2Km7UWD3ZWG3XwhkQFDWULOG7VWJNZrn4LUZOQZqnlOOilWWeFVdh+N/FJmrNRX4hzoZf3cftswd2kptTUFy1gi3v+QNQIpNYrk/IGoat+WBwe2F6QjkxFVk2fkk2eW7owjFJD9LfHxGfEwD7RgQ0VJR0DbqPKW6EMuZoq1Dc9DpKpAzqdRuk1BEWzPnbL6NpDLgT1KUpBXcJhi4LTNzf+JyT
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 14:24:21.3441
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0de75999-1c4d-4b7f-a630-08deb5b251d0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR10MB6007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_072428_235062_F8362EEA 
X-CRM114-Status: UNSURE (   9.67  )
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

Add ti,j721s2-audio-refclk as a supported compatible string in the
ti,am62-audio-refclk binding. J721S2 uses the same audio reference
clock IP block first introduced on AM62. Per writing-bindings
guidelines, the J721S2-specific compatible is added as the primary
string with ti,am62-audio-refclk as the fallback.

Also extend the ti,j721e-system-controller clock-controller@ child
pattern to accept audio-refclk schemas alongside ehrpwm-tbclk via a
oneOf constraint, fixing the alphanumerical ordering of $refs.

Signed-off-by: Moteen Shah <m-shah@ti.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/clock/ti,am62-audio-refclk.yaml   | 8 ++++++--
 .../bindings/soc/ti/ti,j721e-system-controller.yaml       | 6 ++++--
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/ti,am62-audio-refclk.yaml b/Documentation/devicetree/bindings/clock/ti,am62-audio-refclk.yaml
index b2e40bd39a3a..6c8fb0793070 100644
--- a/Documentation/devicetree/bindings/clock/ti,am62-audio-refclk.yaml
+++ b/Documentation/devicetree/bindings/clock/ti,am62-audio-refclk.yaml
@@ -11,8 +11,12 @@ maintainers:
 
 properties:
   compatible:
-    items:
-      - const: ti,am62-audio-refclk
+    oneOf:
+      - items:
+          - const: ti,am62-audio-refclk
+      - items:
+          - const: ti,j721s2-audio-refclk
+          - const: ti,am62-audio-refclk
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
index f3bd0be3b279..364be49f8c7c 100644
--- a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
+++ b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
@@ -53,9 +53,11 @@ patternProperties:
 
   "^clock-controller@[0-9a-f]+$":
     type: object
-    $ref: /schemas/clock/ti,am654-ehrpwm-tbclk.yaml#
+    oneOf:
+      - $ref: /schemas/clock/ti,am62-audio-refclk.yaml#
+      - $ref: /schemas/clock/ti,am654-ehrpwm-tbclk.yaml#
     description:
-      Clock provider for TI EHRPWM nodes.
+      Clock provider for TI EHRPWM or Audio Reference Clock nodes.
 
   "phy@[0-9a-f]+$":
     type: object
-- 
2.34.1


