Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2531CCA9ED2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 08:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Oj94s/a3s+iclXHYEYuEhpKirP0ZL8mxufI2elU6JU=; b=0N6rD0R6Uit4oQfu03cPzekzUj
	G4lyWOass1tTj0dQrRRuA7tmIP0GnOf+IPfs1SmNIcX75Iq/a/rFKV9QrRLFstgORCCt/q3E7zIk7
	IlYpw38eMZhvR+aL34p/dKUtuaG8TKQx1mH2/S+fTmk8+GwzqHWjFQMAecmlpoTHVXsF8nd9HaNph
	kiUn9KYPUE7yEi4IGX+5la7zaCinCgC0aCLH2hs2BVDokwTZ5efKZMa3+uQsPk96zGOq0FOSFzCE3
	ak8PUrf+9yEWZSM7D1b+7qxRcTFTGs9zt6EmgS5INQYjR9+KnDVu2Nqb8zquCFkLx1QHHk7MhRpc7
	4DNXibGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGB2w-00000009tf3-2O4t;
	Mon, 12 Oct 2026 08:06:10 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGB2R-00000009tYh-4916;
	Mon, 12 Oct 2026 08:05:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wA4rdJIbIfDibABFeNo2zsn0IUIwqNEvrjCo/WHaDpBUbjbDbZ0FuvOxAgID+PIRTGwNwcSDAl7ZtkmnLMgOqB5k7qv2k8XYgKeU8RubyBw1h7wa+sbba+iuyYvlt5+ygHaQpZlCpiF0ltZVt/BKZohm5unnE7NcCkqH07NNnKvVYZqOJ7waFg/eifClsOFFPxWkrVzEM8q+qqnfJJtHlW6ypwrEYySDudo36k2kyf+wsSecGq3/LMtd/1YbhUZM0PVb/ralUzeblBNk6cG7oeRMpCqNF+kJV8tiNIxoxN1mcvVarKzazFpR4+5fvubJxSrc7QGSODGNptZltSxNLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Oj94s/a3s+iclXHYEYuEhpKirP0ZL8mxufI2elU6JU=;
 b=Fcy1xkhnZq7EXwOMNTCmxg+2M3jVcPni9A2IWQLyZ84MJ7qpiNssvFXEhSrrTG49v5er8OUj35OsMrLgS98v1TYMfyJvSqB4vHhRR0A87ohnQ0V39e/Xv2nj2ZPH293LfpQrO6W4JfphYiVrwPyEKa5miItRg6WWh2xOeMmAImgaB8x8nylKQGZkFdbLCbWmbVFrkPIdgZe2izX2DOE5Lpy/hh5X+mC5muUXekE5eOWfmcIlOHukzokeZxeghUcJdEyus+2lRaNcvD56wbLIY1HAQUKgmoYmYnxiBH3lcUKZgIjRR0+roQRgYv+kfWpHsFyIiUB/ih3quastjIb24Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from OS7PR01CA0101.jpnprd01.prod.outlook.com (2603:1096:604:256::20)
 by TYZPR06MB5639.apcprd06.prod.outlook.com (2603:1096:400:28d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 08:05:20 +0000
Received: from OSA0EPF000000CA.apcprd02.prod.outlook.com
 (2603:1096:604:256:cafe::78) by OS7PR01CA0101.outlook.office365.com
 (2603:1096:604:256::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Mon, 12
 Oct 2026 08:05:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CA.mail.protection.outlook.com (10.167.240.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 12 Oct 2026 08:05:20 +0000
Received: from localhost.localdomain (unknown [172.16.64.56])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 176E7427E3AC;
	Mon, 12 Oct 2026 16:05:18 +0800 (CST)
From: Luo Liu <Luo.Liu@cixtech.com>
To: vkoul@kernel.org,
	neil.armstrong@linaro.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gary.yang@cixtech.com,
	fugang.duan@cixtech.com,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: cix-kernel-upstream@cixtech.com,
	p.zabel@pengutronix.de,
	linux-kernel@vger.kernel.org,
	Luo.Liu@cixtech.com,
	Wuyi.Shen@cixtech.com,
	EastLake.Yang@cixtech.com
Subject: [PATCH 1/3] dt-bindings: phy: Add CIX Sky1 DP PHY
Date: Mon, 12 Oct 2026 16:05:15 +0800
Message-Id: <20261012080517.566920-2-Luo.Liu@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261012080517.566920-1-Luo.Liu@cixtech.com>
References: <20261012080517.566920-1-Luo.Liu@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CA:EE_|TYZPR06MB5639:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 377aaca3-f0d1-4c6f-c606-08df28378f97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|36860700016|82310400026|42112799006|376014|7416014|10067099003|3023799007|261009223027099003|921020|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: cIjJKzjmlD5uMgZ50zNr7Q4BK/V6xFEYOtXa/j4QMxwZo0SHE4/6sMbgjYX/2aI8a1NUvTgZK5WV6mbkcSn73j5tDOKZnrxeaS5Oj2dc3ZWhWWGhI70j2c47OHBMOwLHvx+O/IkihwsdTXXMRuVERMCdlIEmLy1Of1IC03OmxAMnjm0KEg6irODGXDYeApDSH+BCFhGStPQuuntYtk7WdUIXvySgNt4ZL60gflTtX3RDyga5XOdXcLqc7NWsfSjxhU0V3TXa+7+BNtxnZZd0FTDpxG8BeMmKme5Jqokmb3xV3sR456M0MU3v2kAnqGTZfaTCFQjGRzBQB/gYhA26ia1qTRWuzUwU50T1dzhx08WdRYwZExqQPs5TMJCUAiy2jMZMIPOKyo8sYqG0ocSlg9e6IMhh+22R6k+xYrevszMeVlGik6K4/Z6aRT2xqTmfQHsC5UmPLfXnmKwgIm5yvooN40qsVy/xw6puMt1BgwDmNa8C2SeiMrVSEwG9hNCbzd3zBRti77hEJlRYHgezHugiC8eq4r/sItl/uNrDgbRWDA5oY8sBSe+qp7V2oW3HkscQrFsc5Q0Bq3H/1dejN70C4uQnDpo853bzqUR2EqPCI/J5P5aGNL8Lcv7xU9JCKQI3h163suCx9DJPp7QYLiqzjErdy/9KLMD827NCNur/GdYVrQNHUKYAkW6d9UTD
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(36860700016)(82310400026)(42112799006)(376014)(7416014)(10067099003)(3023799007)(261009223027099003)(921020)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: x4zll4OwnlP7KtE75FGrV1KTddxoeGHhrm3p4Z8w9mZfmYLZ0jEwrM0YnCRCoXq+w7PN34tcULuw7WM2SLq6HH23AD50Ru+ZRBIeMGa65aSUgIGwZE/hs//rxj72ahxpcd4HxICm8kM4XkT2H3hKsr2j/+iO56B8Crb8H/XAlW6tDhoau36xI2ozKo2NzG4I7f59sRa6Ne5V2q5Ri3GorqYjWxd19SiJnJRMJ4EwKxMYxtDKD3r/Rg3JOGt2p18jTOf55Tcy2qEH3qFu0hyiTOOOQ3SYmF8DrhiTkT9huHKpR7yDpjf/zmWWmKz8dBZmPWfCwvkT7Ydnn651Y2QkFgU57JuiBW6uno7XvvgRDOuTjQKvlVIKoU11eq376fqNRuCE5LEW5vy6MfBzSmf8qqnBWSrlQkxN8AdU0DnzM7kkw8HqvnwSXSKAFbu+HTmz
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 08:05:20.5047
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 377aaca3-f0d1-4c6f-c606-08df28378f97
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000CA.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5639
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_010542_264458_77CF228C 
X-CRM114-Status: GOOD (  14.27  )
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

Document the dedicated DisplayPort PHY on CIX Sky1, including the
optional cix,external-dp board property for external connector swing.
Add a MAINTAINERS entry for the binding and driver.

Signed-off-by: Luo Liu <Luo.Liu@cixtech.com>
---
 .../bindings/phy/cix,sky1-dp-phy.yaml         | 53 +++++++++++++++++++
 MAINTAINERS                                   |  8 +++
 2 files changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/cix,sky1-dp-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/cix,sky1-dp-phy.yaml b/Documentation/devicetree/bindings/phy/cix,sky1-dp-phy.yaml
new file mode 100644
index 000000000000..c6914cab74e0
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/cix,sky1-dp-phy.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/cix,sky1-dp-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: CIX Sky1 DisplayPort PHY
+
+maintainers:
+  - Luo Liu <Luo.Liu@cixtech.com>
+
+description:
+  The CIX Sky1 DP PHY provides the PMA/CDB register interface for the
+  dedicated DisplayPort instance on CIX Sky1.
+
+properties:
+  compatible:
+    const: cix,sky1-dp-phy
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+  resets:
+    maxItems: 1
+    description: PHY hardware reset
+
+  cix,external-dp:
+    type: boolean
+    description:
+      Use voltage swing values suitable for an external DisplayPort
+      connector instead of the default low-voltage values.
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/reset/cix,sky1-s5-system-control.h>
+
+    phy@1414c000 {
+        compatible = "cix,sky1-dp-phy";
+        reg = <0x1414c000 0x4000>;
+        resets = <&s5_syscon SKY1_DP_PHY_RST_N>;
+        #phy-cells = <0>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 3a19da74d00c..b46d0f4220a9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6360,6 +6360,14 @@ M:	Satish Kharat <satishkh@cisco.com>
 S:	Supported
 F:	drivers/infiniband/hw/usnic/
 
+CIX SKY1 DISPLAYPORT PHY DRIVER
+M:	Luo Liu <Luo.Liu@cixtech.com>
+R:	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>
+L:	linux-phy@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/phy/cix,sky1-dp-phy.yaml
+F:	drivers/phy/cix/
+
 CLANG CONTEXT ANALYSIS
 M:	Marco Elver <elver@google.com>
 R:	Bart Van Assche <bvanassche@acm.org>
-- 
2.25.1


