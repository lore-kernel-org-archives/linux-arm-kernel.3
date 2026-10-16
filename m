Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4278FCCA46C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 15:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CAcFOFYOXs7YknRY+6lqof59CdVZrKe86Bt0XTEgua8=; b=SkRvzIT15SLtrA/87FL6uqLbYY
	W14mlSb1aTQRFFX3ub2WFFeMkx3toecD8c4trEi1DFj0eeuXO0lMhvj8nUKpTPmGfDkU4Ud6bW/g7
	4/6a8s/Npi9PLhWG2PKpCbmzmzuvOCQEfdT6yP//VN350w/EeHQBuzcTBiHQZ0Pq4ZfS1bPhxTtg5
	NolcuZG3J6ncyfcDEjHriZk7vp4RmIVyxCLpSJ1fzRxyisKA9oor4xNaUb2mPwYhBGeTsMf1U3xZz
	W+GCBDi8VSbFNhmIPYpIak1oyoepN1afy1JQLSkKRlCeQtpTNQtOSHfV3ye+GXd8y7dSIII2SIrW0
	CQNU0Jyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHjpH-00000003GxF-25Sd;
	Fri, 16 Oct 2026 15:26:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHjpA-00000003Gtn-1gYX
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 15:26:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=CAcFOFYOXs7YknRY+6lqof59CdVZrKe86Bt0XTEgua8=; b=mFozU4Nn4uTM2VNUnBnDuSFlr8
	CXAomp+fq3ftOAg/PljU+9pIUfWTMqAlTQWas/X6Tmas1n0vbOTmH/GvRNP0K+ST686aX8UM/y0nx
	BVfm2VGiFe6Zgv9Fx/h/nNBFOLet2fN2bzVnhJqD3HkjrS1dVvAqnMBCGTTtlk7u5cc75bcf5nghM
	iyjutdjj0g2lsUSs6gImy2+8OifaTEtS30rafLTo0ydslUj3AwcA41WfLJd+RkbYrYcaXRE8rUeFO
	rP6EqOS7RPoDCneZWZT44I2cU26AIx9DRLh5f2VtN1flVEaTcV5XAzpMGBJLLOlnSXGJzXvDSATha
	JgeZR9ng==;
Received: from mail-northeuropeazhn150110001.outbound.protection.outlook.com ([2a01:111:f403:da00::1] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHjp5-00000001faZ-2zXY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 15:26:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nJwqmt0SlyY4XJ3wWsDmZl2eOQQnWYZpVaasBozgzxiGpA0dcPqYYo2qAuCGl+6CPjHwZhz+8SgQpKQuN4idWZ9K3ASb0iyKSA7/gEsjRkO1Rob/IYd+WP9Nh4rd1LbRwqNR4p+UKXilZ+M4zrAgBpbrUs8w4UwZkhqeLwxC0FGF/Blq1IK0tFpc6cy7v8A8uyHIEE3HTJGwKP1Mt+bfOrNPRjYSedBfwL2DZ+ezU6bIl3I+kK9Xb26zJ5ca3HmtUSyQQYiwfIaayGd09n1kJFGgyFiHAugiKRcGNWdhxEGhWYOYXnzByxFLIBM1v3f20ug/cCrzwlTyTzRpiHYzeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CAcFOFYOXs7YknRY+6lqof59CdVZrKe86Bt0XTEgua8=;
 b=UPeCAbt1q4GHw+It4YbMgMm2fgd9wy084Oq+AjSd/Osp/ZJI+CglmXUMedQVhFvO/IMsAQGL/B1JGfSayfsLjGtq9JPaRe2T46UxfMr54mSHTF55OI2i3SG1opoyrYjCBV0/zbcUgmAlRMT816jz6kt1gRnRNtyGif0zsyBd94ln5zs98P7WzQrS1s630KqxyHWvE29K757IrJzHpACIEagFpnbOfRD226h83q6Kg8uiSOi3xYYhqEdhlCLrLRHm3k5fFdWF1KCoZU+zk71h5f9DX464hpqP4lgoHdEYTVC/ccMYMDiOt2cCJ0Hj15KsoBBUz9Amr1o92Wn0V7uM/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CAcFOFYOXs7YknRY+6lqof59CdVZrKe86Bt0XTEgua8=;
 b=NAHt4swIQPDC7invGTdhNI4pF/Cck72j+VIAUACP4TfZb4pZauA1/mjiZjt0g+X56TF4tuWi06Xqn3yG0YZYOQ1Y5EOu9nuaNHHF8Z5/7vNGMh9fW0gMl/J8RsH27Tv/wNZNqeft+DKF1QyAcswr5pa+MLCO90FYrlDepa7njw9oNu89zCkg0YUBHSuVH7TlbuBodhwIyqxB8inT9iHDQHNCMLRX/nd+wQcyKevaVNiEQGWH1dP+HbfBLw2Wsfg+bZYiLYBrw+70KOCICJ47lSq3EjsMAnGX5Z/zeBWQnpMA/z/fUOmjzxF8811lMIfvY9aGpMC2DgMjyW0nQRDOEA==
Received: from AS9PR0301CA0038.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::9) by PA1PR10MB9733.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:566::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Fri, 16 Oct
 2026 15:26:13 +0000
Received: from AM2PEPF00070CF7.eurprd02.prod.outlook.com
 (2603:10a6:20b:469:cafe::4a) by AS9PR0301CA0038.outlook.office365.com
 (2603:10a6:20b:469::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Fri, 16
 Oct 2026 15:26:13 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM2PEPF00070CF7.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Fri, 16 Oct 2026 15:26:13 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 16 Oct
 2026 17:26:40 +0200
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 16 Oct
 2026 17:26:12 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Fri, 16 Oct 2026 17:26:04 +0200
Subject: [PATCH v3 2/3] dt-bindings: arm: stm32: allow TAMP nvram child
 node for syscon
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261016-upstream_nvram_reworked-v3-2-f65908490cf7@foss.st.com>
References: <20261016-upstream_nvram_reworked-v3-0-f65908490cf7@foss.st.com>
In-Reply-To: <20261016-upstream_nvram_reworked-v3-0-f65908490cf7@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>, Srinivas Kandagatla
	<srini@kernel.org>
CC: Simeon Marijon <simeon.marijon@foss.st.com>,
	<linux-stm32@st-md-mailman.stormreply.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.16.0
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF00070CF7:EE_|PA1PR10MB9733:EE_
X-MS-Office365-Filtering-Correlation-Id: fb69f994-1bd3-4d6c-5849-08df2b99d08d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|34020700016|82310400026|376014|36860700016|1800799024|6133799003|10067099003|18002099003|22082099003|11063799006|261009223027099003|56012099006|12100799066;
X-Microsoft-Antispam-Message-Info: 1EMJrUTZheXeGW0VM6dkhD378DbXUDbatl18Pz6xgrDMwIPd2NFsxs0Pz67SmH5slJLTB7Ft6JURy1LniM5XhSk3JutWRMHAbBk3uNBl28BzjeMHIthd2+VxLgaz5ox5YrfNawGS+4mWRKp5swxNwh9+ms4tvRfEuI5YfIGatCdZxnvjeXsTiuD0XD41geB55lXnNApTCxpHLc7VFMvdVlHOpEhkOeR0UWTujcdaXTGicqMsy0t04Hv4JkCa1h7Vpoy51hU63wFnmjSEpxTrLr7yq3VzaQ3AOHfihfImXECw5l0KH+qCOZvn2NhHceFy3VuiTg8p8rWAt8sdslDMMR8PeO1xBapuEhqr1et39TrKFsWLzhjnIvC7H2shtrooUEJgVCNfT95LaZ/ewlvRAQ22GbNZqLGjy3kmDLHJIVpUQtB7VRtJRX7ShnoVXNiUEORcQUheOZSTMOgYTDNApZESR2pyhcQoOc1zjhYihyF7Cjtvt4eluAEfYjrDm/hFH6um/rFkubEgLv9dQwWreLGnn3dQZhaordSCTWHzdkFdBwBeo28kffDxO+zKGPBYWcZOQ3QPyE5EOWD20bVxLedTuNLZRryha2ackX6ktW4k7H6vipHSVclIVVoJbxQzt3oRJQ4Y5vmdN98tF/x7Q6xxQ9zWKbTsEaiEOSonGj8In4tUKGl0VXWugW27bJydYdYg7FOx/djYZ5ikXHt6yw==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(34020700016)(82310400026)(376014)(36860700016)(1800799024)(6133799003)(10067099003)(18002099003)(22082099003)(11063799006)(261009223027099003)(56012099006)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: f7rsJDRvx6NPP319VJpoEwxVyprOT5lBZVlHp0J1g0bwBPKXZnD+iaH+MDM4QLD5kJqK6rkgSDZaFnU8z1iF6iOBTIVMyrES87xLG4f4TPfLuFkJ6RzUAfWcYuxcJsShJAR/36WRgfWctqrQm+BkDWXPUfk/HQxRBL3/xYQiuqr2C0aEwpiGS2nwS5VrXQvLJXkmnnWDaQfxTCYNEADsvvjxkPc+qb9gh9Ofh6fP/GhoCqA3UUVZATxTET4uOoITEPY7IbmO2X/oIBS1sj9tgrhPP+n2KajHI5DPkP7AF2HEZOieEjuMDiC+bIEyk+AXO8Il1/Gops7HY1+/vGa5Fz/Kzr+fAd+kaw6FjFhH3EkQCh04zFtDD7jMLP4udoylcqKE4UAy08m/m0upTO8gIOHmnWURZ44WTn9b6nN+AZKDv9v0iNzMpnKKwDrtkH0y
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 15:26:13.8043
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb69f994-1bd3-4d6c-5849-08df2b99d08d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF00070CF7.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR10MB9733
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_162619_910530_CF3D2A3A 
X-CRM114-Status: UNSURE (   9.76  )
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

The STM32 TAMP node (compatible "st,stm32-tamp", "syscon", "simple-mfd")
exposes its backup registers through an nvram child node described by
nvmem/st,stm32-tamp-nvram.yaml. That requires the TAMP node to carry
"#address-cells", "#size-cells", "ranges" and an "nvram@..." child.

st,stm32-syscon.yaml uses "additionalProperties: false" and only allowed
reg/clocks/#clock-cells, so wiring the nvram provider into the DTSI made
"make dtbs_check" fail on every STM32MP TAMP node:

  tamp@5c00a000 (st,stm32-tamp): '#address-cells', '#size-cells',
  'nvram@5c00a100', 'ranges' do not match any of the regexes:
  '^pinctrl-[0-9]+$'

Allow the addressing properties and the nvram child, gated on the
st,stm32-tamp compatible so the other syscon variants stay strict.
"#size-cells" may be 1 or 2: the STM32MP21 soc bus uses two size cells
(an empty "ranges" requires the node to match its parent) while the
other STM32MP SoCs use one.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 .../bindings/arm/stm32/st,stm32-syscon.yaml        | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
index 95d2319afe23..1aeb54867db2 100644
--- a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
@@ -39,6 +39,23 @@ properties:
   "#clock-cells":
     const: 0
 
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    enum: [1, 2]
+
+  ranges: true
+
+patternProperties:
+  "^nvram@[0-9a-f]+$":
+    type: object
+    description:
+      TAMP backup registers exposed as an NVMEM provider. See
+      nvmem/st,stm32-tamp-nvram.yaml.
+    required:
+      - compatible
+
 required:
   - compatible
   - reg
@@ -61,6 +78,19 @@ allOf:
     then:
       required:
         - "#clock-cells"
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: st,stm32-tamp
+    then:
+      properties:
+        "#address-cells": false
+        "#size-cells": false
+        ranges: false
+      patternProperties:
+        "^nvram@[0-9a-f]+$": false
 
 additionalProperties: false
 

-- 
2.43.0


