Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76639FED9FD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 18:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HgVkZGEC2oWOnT8ea1yuqgmK8uNnvZiAhHg5AY06ZSk=; b=nVvNQN1tqsW9sjOHqyEwAHtu17
	lg5mVrY8ZP7K8oC4ucJXcC2gzS/5m31M/lcCyIw0WJlbi3b3kuB6ocwPY0TY7Ly3G5+yHSt2a4jKC
	/vHoIe683gUMEcQpKFaqToeRkLYC5bTjMtoyIWeKkFa/HvTt4g2Kz4Kuitmi/1AME2INJyq5CjqPC
	/0gkFVMIElMrj2QjX1ObOLq23XZ+HLb4XNftAjOygrSiWQIOEBpnn3dypY4hT6/6lDpTgQcfYfGeG
	oYZkC7Do788MAUp2+GD3s2lDo2AiroRRpgtWGN0SQkMpXOFCoOYXbzaTZH67cNdSzO2cowU/pJEMv
	0sINv3CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Ylt-00000006zvg-0T7i;
	Tue, 17 Mar 2026 18:04:01 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Ylp-00000006zth-3Yxf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 18:03:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wftHgAt+TZkLzrjhb923pyC8UveA9RTyjvLQrLudzo3v+qNx0nqtpFW3wi9XnXEoF7pWS/GKDoEXC9zkDZn3EDVi1umgTfPt16EF9IlexAX5U1LFMHe5gvD1qkfgQdW4Lf8i82Dd3vEMXMnQYHiEyeC9LEYN9+KPWZwGZF68VG13F2UWJPhjQi1GZSPseX5Ut2xXNpz3FBgceE6bBN+cf14iIiaubpe88tJ5bLNMHSFNxFcTHkOxgsqJBUBnmzeglrvXAsW8qIbg1s9xaPcKq/bFhGa/BehvkAu3qpXe8RWmk2rTz2sf/RgtZG6Dyw9mewrQBWorqoNEGILOASbNzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HgVkZGEC2oWOnT8ea1yuqgmK8uNnvZiAhHg5AY06ZSk=;
 b=TmALQK9Agzfy8NddRQaTjzWzqnC9VKBGXbgud8/CKeGvO0D5DCHErqT6tWPdnehFVjr3uw13TKe0guLJbuW8yF4m09wqd6knWztrZMdy3Kw5HG5m4MATANezxVB7ANWP7d3PDqaGvuRiiyIxjhVPI4A8+8QJJv6V/LHZgksQcOgtYp0zuWavxgrLWzBLaW1B0r+E2hkIH33h+4eaTnZF7FR9OfPnSB5UN72ZuVFTZlOxDHFozreMnNj8jkHoC2yI1vQb/7BCjEw8LIEoixOEsZESsnr0aj/IqyeJwQbx9fsbjyCvHkuL4a5I+nKC0ggaidIequymW7KLhupQv9YmmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HgVkZGEC2oWOnT8ea1yuqgmK8uNnvZiAhHg5AY06ZSk=;
 b=YmT3LjiTjYC1eHFpEVKjhY1inV2xCqfBj+4yRkXyzTI+qhOYCDlL43HWQ5V/d8kpEoD25E6PS0nvLKIoWoRIHvvywYnzEjzMP1czwoFB/PUV+og/7n23+c0fSzIsljuxCD52sSCF5SDEVZxsnq9/Qa+13u8PBI+xD2SACarKzd96yOyMjY2vXSfmZudRTWwT4VtSkLBM7WlKq7nq9DNv4pHy51pW7tpQM8wHcURIUOcG/QytNDF/kD8i4dHCIIa76jIzUkEHUGFcSork7peXWei4f4Lamkv/BcRNvTXJM7dJSNGxhihboASw5pNEOVhpA+rH4rcUwgCAfWv11+Yckw==
Received: from AS4P195CA0010.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:5e2::20)
 by DU0PR10MB7976.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:404::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Tue, 17 Mar
 2026 18:03:50 +0000
Received: from AM3PEPF0000A792.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e2:cafe::8) by AS4P195CA0010.outlook.office365.com
 (2603:10a6:20b:5e2::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Tue,
 17 Mar 2026 18:03:46 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM3PEPF0000A792.mail.protection.outlook.com (10.167.16.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 18:03:50 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 17 Mar
 2026 19:06:08 +0100
Received: from localhost (10.252.21.194) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 17 Mar
 2026 19:03:49 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Jens Wiklander <jens.wiklander@linaro.org>,
	"Rob Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	"Conor Dooley" <conor+dt@kernel.org>, Sumit Garg <sumit.garg@kernel.org>
CC: <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-remoteproc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <op-tee@lists.trustedfirmware.org>,
	<devicetree@vger.kernel.org>, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v21 1/6] dt-bindings: firmware: Add TEE remoteproc service binding
Date: Tue, 17 Mar 2026 19:03:22 +0100
Message-ID: <20260317180329.1207625-2-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317180329.1207625-1-arnaud.pouliquen@foss.st.com>
References: <20260317180329.1207625-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.252.21.194]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A792:EE_|DU0PR10MB7976:EE_
X-MS-Office365-Filtering-Correlation-Id: be1990c6-437b-4927-0430-08de844f8af5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|376014|7416014|82310400026|56012099003|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: HsGf+XFUzNpZaTvxvrYvFxz7p2di0VRdWBPfh/a6X4BA0pStohS387ivZpsSMt72zyX1DPShQ7SgzGDuy0puWfUMBNn2tv2pQvVKp/iZgbPZyiwZvgat+NmHNa7+f6VoVaRby65ph3jeQITQqvnO8pA8jpOkpvogBEO8wMp8lgemS6Jn/CDkFPrRW7Gq+U+J5zADwAK35rWg2Petb91ohjAN1jLur8eFmYWbKN1tltL1jXZXIcsuT1GMvzDDDIBvfONPZdaM+PTiuhMTP+W2n8WkjAakRoJRbGy/5Ayc/QGHKX+rs6AmsMo0gGwoQ7nPm84GsjEfSwPW9ZUigJP+z+NWRgMY8CggcCKto++bV1YMTE/2Ra2Rdf4szM6d2l3AumS2cbpVitNJyExXlWSTP/b5d7gnUadrjscRQ61Iwx3oDlmOVHtPk34Gri02ctHBkYL7867loZdaqIWTSRoU7J//3+vZfsj2tKBuJ+c/gj4X0NrYdVXvKaRRLgjS6sEedNlJUgZVWxzYtOTCrfUjrujXWmHhyiw7XK1NSgUQanWYV2qmN68xnpZ3DRln913HSNuQhMPobAZDdsh4HjmGCuhS+KLMmeg2/JAUeMviMEuiM15iH7/OhieZ4L+PW95iNxcBmYEbUzv77s4AwIm2Nj5HelSHyYqeZn3+s8o3aPB3JRgPvS/FLR1kDHeIdL6Kj54WQGqji+oiFaHe+BUxmlZEKwPSvCXnC9KHPU95Pos=
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(7416014)(82310400026)(56012099003)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 98fHLjLRqvWH6SnLaEDQrB/1w9aF8p+nN++OcIB0pO+SnpRb7Q7fLTfWkyAK0IpX95c49T65NgF/h696qRw8Tyw9NeDP80NuhSi71JGLQrsjM+OoLi3jj3wmOPvbuQwDP3EMl3wiXMrhLP/my1YLpPtaBENpPL1bhaackmE4iOKbhkJWNhhHaBM2UIU/tSN9otq8tzJqwo43QRQMTDFhWMNWthVLTIIThoNfuAfnBzmgFAeTEn2WpmkbeR0ThGKKcQtbIukBwCpvsfaR3acOGmx+pVb52Nr6HzZnTNurdkEi+J4d6fw9FDiSAk16D0WxvSNWCklnLIpou71m5g3mOKFrvTH5EmosxgRvAGv3qqve4RcBttJ5P1/Vbs9Rq9F14m2KKVAnLq8l10/d0EOX2P4UuFU7XTfIV9/In4N+nlxLvtxDZEgF5gbjEGh364FG
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 18:03:50.0945
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be1990c6-437b-4927-0430-08de844f8af5
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A792.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7976
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_110357_886693_BC72FBD1 
X-CRM114-Status: GOOD (  14.07  )
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

Add a device tree binding for the TEE-based remote processor control
service implemented as an OP-TEE Trusted Application identified by
UUID 80a4c275-0a47-4905-8285-1486a9771a08.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
v21 update:
- rename compatible to exactly match with the TEE UUID
- the remoteproc device driver is no more declared as a child,
  but use phandle as done for the SCMI.
- remove linaro,optee-tz bindings update are now useless.
---
 .../bindings/remoteproc/remoteproc-tee.yaml   | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/remoteproc-tee.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/remoteproc-tee.yaml b/Documentation/devicetree/bindings/remoteproc/remoteproc-tee.yaml
new file mode 100644
index 000000000000..e7bf135136bf
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/remoteproc-tee.yaml
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/remoteproc-tee.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TEE Remote Processor Control Service (UUID 80a4c275-0a47-4905-8285-1486a9771a08)
+
+maintainers:
+  - Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
+
+description: |
+  Node describing a TEE-based remote processor control service implemented as
+  a Trusted Application identified by UUID 80a4c275-0a47-4905-8285-1486a9771a08.
+
+  This binding is intended to define the interface  for remoteproc services
+  implemented as TAs running in a TEE, and is used by the a remoteproc driver
+  to bind to such a service and control a remote processor through it.
+
+properties:
+  compatible:
+    const: 80a4c275-0a47-4905-8285-1486a9771a08
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    firmware {
+        tee_rproc: optee-rproc {
+            compatible = "80a4c275-0a47-4905-8285-1486a9771a08";
+        };
+    };
+...
-- 
2.43.0


