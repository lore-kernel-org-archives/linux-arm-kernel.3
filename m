Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC52C5DF9A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 16:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+AQN/LmEjkXl9+Kd6JfWcg0tzy6nTxkHPIhw9kTWg+8=; b=TpOC1zhUnX2KBdPsbY+wJBbHNj
	jCmgzV40ppgJKYmuy0GEnTmHUl5g6kE3aEESmJoE7dUsm0MIF6op85PFQQcuSV3/Hw60ip9Yvq90J
	647sX7cLCcYazcB0n0jZF/YLrc5C5YmrfAavIoDfWPA8Ij+zZUAIgPSzsa4GX+Bj5fn+/gqZPY785
	zy7JFZ5NuTDCyEi/lQ/4IaS+BB7LkF866/t+AR0V7hP1wS/vkF2xNfxzb8cduM4xi6xtZ7qSCVjQn
	ztPgRaY154xaBOebNMfp1e1wUWyN2zCJphFU/0hJAk6p2AziQ2BZk1gEVpd0AhHl1YMJAlI1nTJBI
	zpBktz6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxS3T-0000000DoVQ-1M8E;
	Fri, 21 Aug 2026 16:25:19 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxS1s-0000000DndL-2yqu;
	Fri, 21 Aug 2026 16:23:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K8AuoJFDUruHF56v8YToRdI7ATADUM9xQbtuMcaqjS0bKhNoE1YvIWK/FxTTy835eWOSCpKr4FtBzdimH0e/zfe2wtIUEKZmBtMULoL2IShZsbc173+WrBxNeE7cq/8PnfTaW4EVY5ZTPiaCkmVes+GiMEyrS4bNaZe58XM+NAlAQWouNAc+ohPpHu7PVtkbEvqaUtzX/0MM+gQ6GOoRMismpTWT3HABUDNWDZ2YYJqF8MCKwgTPVEhiQ64CWkJviqBiDKNPMiuOTA8m2iGnQsvCrG1SI4lte5l1BPintAXAuPoy+OkIz0N237YV8LjwZyx0dSdY8U2vk5PR14lVNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+AQN/LmEjkXl9+Kd6JfWcg0tzy6nTxkHPIhw9kTWg+8=;
 b=aKo/BM1h5Our8wr4++A4Ni8VOKlxxiSC2IKIJfKVKm0PXY30cG7uMLnyjpI3ipWMsvqXsRagUeO81ye4xy9VQ/9TZP+OaBofziten9F/tG6i1koQU6kydLji49B+3rX2dKEPC1vRZVtdBBL7o6ZNaFBP09X2ZJorvRgCumuR7SfFroS+MFp4F9/f8W1ipX2LyAmWEIMpzslarZnemVO3MWmZjcddl3Q0b+JuTnXjG5gyUVpHMLVjO99wSIGLZg620NKh1grhAKo8q1hGRsVdRSD3HorunNqMN1fSyMyheJsk8/VNSr+6tDQ61eq3QHKpeXJbrYclIi3r4wWjv5KoyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+AQN/LmEjkXl9+Kd6JfWcg0tzy6nTxkHPIhw9kTWg+8=;
 b=joo6P6s9Xg/9zOXXoxxfzWhlpgN2BVnG+FpWTyjfqS0v+NNdikU6fWOysMY7YaLONZ5pVE0YTugjL4RHTaPrdZIANLiWg2qH8Y2tRrKlvRUZqyERxQ2RCwAOJoLzyp47VJqTAeRPwtlu///NN4CXRauzCt/wMsM8Oc6Uoo/N+uCy9adIXMyE/P9xomxyb4srkKl/oQE76g8vaIImt2DImMpihhVTt8pivC57ITTLtj3MtEMMz0LpSXrgNy15xzIxCQgJwff7ki8fuKO96Xkg1WtBw5RWOHKw3n+dnrX/cYYGe6qVv/Eb13cSxTQtXrGbKqSB5py5JMSDiI2nXPEaOQ==
Received: from DU7PR01CA0025.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::15) by VI1PR10MB3248.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:136::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 16:23:34 +0000
Received: from DB1PEPF000509F7.eurprd02.prod.outlook.com
 (2603:10a6:10:50e:cafe::22) by DU7PR01CA0025.outlook.office365.com
 (2603:10a6:10:50e::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.11 via Frontend Transport; Fri,
 21 Aug 2026 16:23:34 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509F7.mail.protection.outlook.com (10.167.242.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Fri, 21 Aug 2026 16:23:34 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 18:28:34 +0200
Received: from localhost (10.48.86.251) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 18:23:33 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Date: Fri, 21 Aug 2026 18:23:23 +0200
Subject: [PATCH 12/16] dt-bindings: phy: stm32: adapt usb2phy as syscon
 child on stm32mp25
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260821-ucpd-host-fusb340-v7-2-rfc-v1-12-c5e27cbc0795@foss.st.com>
References: <20260821-ucpd-host-fusb340-v7-2-rfc-v1-0-c5e27cbc0795@foss.st.com>
In-Reply-To: <20260821-ucpd-host-fusb340-v7-2-rfc-v1-0-c5e27cbc0795@foss.st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Christian Bruel <christian.bruel@foss.st.com>, Fabrice
 Gasnier <fabrice.gasnier@foss.st.com>, Heikki Krogerus
	<heikki.krogerus@linux.intel.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Liam
 Girdwood" <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Srinivas
 Kandagatla" <srini@kernel.org>, Marek Vasut <marex@nabladev.com>, Vinod Koul
	<vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Pankaj Dev
	<pankaj.dev@st.com>, Marek Vasut <marex@nabladev.com>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-phy@lists.infradead.org>
X-Mailer: b4 0.16.0
X-Originating-IP: [10.48.86.251]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F7:EE_|VI1PR10MB3248:EE_
X-MS-Office365-Filtering-Correlation-Id: a88b99a2-f8b3-41d7-fff8-08deffa08c48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|36860700016|23010399003|1800799024|82310400026|6133799003|56012099006|3023799007|10067099003|11063799006|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info: ip4HFVx7OOPQNepAD+1punN4kDp6E5BDRb0O96WszxEw9ACW6UfTJ7jJwPfdN1kjjgey/0oXphYs3aMztWydTg/zjFkC0W8KAe4mCKILJJwooBCcODx4Xl8W4czDEcuLZ14Ki+Y+lHRYE5mUzg8gfThBVwZUjqxCPXLyfODZqiyyf2I4pmvcv4Cti6FCoFnQBAZOtWVyo7YQDxCNfYKZvi7syvBdTfU3lWgWpDH9uilGyFt9O6aHm2zhEqXwqJs7CFhthSJs205NhSzkxhCezsDPhNpVQKAHVP9wKZ+pbDAK6KEUvrmlC6EknhCPEzR563pn604XNb5lzWoTUyqVNPCnfEGNMXwm4g/zGCYR8TAFbBgtzUwYIwICM/kd27wvM/eTdigAudJ4sFreTMTsoesrOgqh66uKXM+rnZUELRIrum9rFz5KOxlurfcQbGdeOs4UtmcwroySy75SCnaKtOLIglkQpm+LoOPRNswMKtJNIzoR1h5dG+qTPYFnYYMvdtpksin98GCZa1fc8C0p4zh7aDeGQakjuQVLq/phH8rUztjZIMCYrZGn2Nl2+xGNydFUc6h9OzWyu7BP995U5rXBFvF+DNVC5+TmodV0beFoLcVZ4nOChS7RbDsr15EwWHshxdNORw5wWJOMly1pKnwYKe/6IUOcaP4RHWFoTaCBLYHLkywpIL/az4i/1MM8aXMOKN8WW5Jj5TfYOJ5EJ7NDy4Yg4mCUWICucnuhzzPw3oL5ft9uWob2pC38cpMI
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(23010399003)(1800799024)(82310400026)(6133799003)(56012099006)(3023799007)(10067099003)(11063799006)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: d2IYHxjI3oQTUATc4aYwB69kISYCiT62rBt2rK6N1xLYsKtiTQvJVPScRx3tk/YbBG/uLGAQakDtRXHe4qEBUFlsLpwMvJgfD9KkzoV+/wr4NAEt33Qr7G3kfaWfKCWRWE6ymzftBdiWygde3pFtz9e9GDwvl3Ipa6zdC+rD9CKma00Ud1nonnkt6gGSXQoat8f/u/lypLTwWqGonUm1BxXXZsyVC3aGZk28pQnURvY6mN7oQDomBfrr+62K5684UhhMS3RiqJWuTNnzAZUX8ttJ5Ymo3c/sJPzR7Q2gujqoK2D5C1vO+7rX/CBapoq7XJeGZq1xU8WPTJ7yIbDsquBKd2dHPGSq8VNwHaD38KbLyY71fRlkQk2O2nFw8Cm0xxtiydfVsRWEQvGhhUCFqvZ4KAfWRgGY3WpYLdrdTgWgTh9mGQMoxwQbr5Rogwco
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 16:23:34.5475
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a88b99a2-f8b3-41d7-fff8-08deffa08c48
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F7.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3248
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_092340_763632_0327F958 
X-CRM114-Status: GOOD (  10.68  )
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

Adapt stm32-usb2phy since transition to syscon child node on stm32mp25.
This is a temporary update, as it depends on Marek's series [1]. This
should be dropped in later series revision.
It's a precursor to validate further DT addition on USB and Type-C.

Allow usb2phy to be a child node with reg and unit address.
It replaces the st,syscfg phandle.
Also adapt the example, e.g. stm32mp25-usb2phy1 address, clock and reset.

[1] https://lore.kernel.org/linux-phy/20260816213849.1044073-2-marex@nabladev.com/

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 .../devicetree/bindings/phy/st,stm32-usb2phy.yaml    | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/st,stm32-usb2phy.yaml b/Documentation/devicetree/bindings/phy/st,stm32-usb2phy.yaml
index ab6c943af9a2..3e8f57a46db3 100644
--- a/Documentation/devicetree/bindings/phy/st,stm32-usb2phy.yaml
+++ b/Documentation/devicetree/bindings/phy/st,stm32-usb2phy.yaml
@@ -23,6 +23,8 @@ properties:
       - st,stm32mp25-usb2phy1
       - st,stm32mp25-usb2phy2
 
+  reg: true
+
   "#phy-cells":
     const: 0
 
@@ -35,24 +37,16 @@ properties:
   vdd33-supply:
     description: Phandle to regulator providing 3V3 power supply to the USB2 HS PHY
 
-  st,syscfg:
-    $ref: /schemas/types.yaml#/definitions/phandle-array
-    description: Phandle to system configuration controller.
-    items:
-      - items:
-          - description: phandle to syscfg
-          - description: USB2PHY control offset within syscfg
-
   "#clock-cells":
     const: 1
 
 required:
   - compatible
+  - reg
   - "#clock-cells"
   - "#phy-cells"
   - clocks
   - resets
-  - st,syscfg
   - vdd33-supply
 
 additionalProperties: false
@@ -62,12 +56,12 @@ examples:
     #include <dt-bindings/clock/st,stm32mp25-rcc.h>
     #include <dt-bindings/reset/st,stm32mp25-rcc.h>
 
-    usb2_phy2: usb-phy {
+    usb2_phy2: phy@2400 {
         compatible = "st,stm32mp25-usb2phy1";
+        reg = <0x2400 0x24>;
         #clock-cells = <1>;
         #phy-cells = <0>;
-        clocks = <&rcc CK_KER_USB2PHY2>;
-        resets = <&rcc USB2PHY2_R>;
-        st,syscfg = <&syscfg 0x2800>;
+        clocks = <&rcc CK_KER_USB2PHY1>;
+        resets = <&rcc USB2PHY1_R>;
         vdd33-supply = <&vdd33usb>;
     };

-- 
2.43.0


