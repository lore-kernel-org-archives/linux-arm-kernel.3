Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A0C106ACE6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 19:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vHjn70swDdWLLv2zCNEtQPoHvvD+r5yGSKfMbd2+X74=; b=od7ZTAsp5L2vLD6x2Vi3RRGUIa
	h6kzSUdhoGqq1I/uhyscSvFvOAQkicGYXpTA9ZqpskecenwkltC36ljobesBGXSCuns2uiqgcpBMq
	QnYDRomCsnv5tYx3lGxvYCRocfivp0xCNuU6A4o3ApuwV5kwc99FTbjLnrCyqAnL3J1UmV4RkH59g
	JGkUbxwocbdwSo1vGdQMZMaVNQOAqePzySQ+ykbNhqTbIUNuN1cwkWGtNfXxAaUHmvh/eZP16jfYN
	WBwcCEZXFB4So3qN9e3V+XAvkYx+tEGwtMy6+0YCH2QvCeJrXXtaA/uyJk0IQoBIMLoiwkDtQM4Lb
	lzLj8Ltg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0lk1-0000000F6eT-1XYI;
	Thu, 12 Mar 2026 19:30:41 +0000
Received: from mail-norwayeastazon11013017.outbound.protection.outlook.com ([40.107.159.17] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ljx-0000000F6Zu-12aB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 19:30:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=thiuhz2Zfb03U9G7T/NO2pZpOc6fH0VDv5w8vwBwoROEY8DRar1ZI3DEZpt+zKvhA3n/IasXomYPIHfM2+mtSNfNg9RjhRAaGa9KU6mH4wWcg/JgdZ/c3oke+FaaTr783+UT9IVc1WSqGlpbNBTp5r+yUeiwCq6Yg3CU2Z4sAROM4TdlHZsbIJ/XZEVUsXvc6JlfFxVQwAdKwGq+ChEGHgcdZQF4+FnFoPe+PJT2mZjiafH6agWo+041bH9zZRCxi6jDwYK+uBoSRXKA8NVsoyqpv4DGEkCVFdPtDpDnvrZ2XZdpucSHp9DJLAWOpuXzi4RYJ7dvakrj3UcJ7sBgWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vHjn70swDdWLLv2zCNEtQPoHvvD+r5yGSKfMbd2+X74=;
 b=YxWkdcVPtPlJTkW+qSWX3JlQtKC1MY1GoIOvWJH4/2fZaVzEWOOeu+awEvBAQQzwoLVRTyQTm9JRH/3MfDQgChUroEEgB1X5lDY/d/9m0oTl9CWUZoG0P6AYEmlekDok9DL0ndAzgOovW4MOiLJw6jnpVjti+Q85xPFbMAwBdftRcXFqE9Dblt1/RTMkwLzSZbwITNAFhOaByOrASy6GpWpCiU+T/7ieEIRDkRC+FwbmKGhvMf9k5uVVvcp00/vrv/w10a1hBdyfncJTMbectQf+OEd0x5/IiSIT/iaRRM3CWv34IM12SP3b6bGK37dsv2q1syl1BANPRKZ0tUwWYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vHjn70swDdWLLv2zCNEtQPoHvvD+r5yGSKfMbd2+X74=;
 b=WKbBfHZbVAYnFYosSKNoPtTyAg1sYza0A0XeC4Qhfxs4sX5eg6uZ/00c+yjJbQFyLqQeMj8ShjA/sO/l/h8+Gt8JnNT97I/jkuLxGQMAK81kkdAoIa0Uy2l46oaX8vayJpTI+qdETdzEfLtPlt4TjYxSZ4zffgj4VNkQK1uYi7OQeCDuE9oc4kOE/5Sys8ucLtFwNGmKm93n0kvYtghy8U+9JPZsIkyIsLDX4N7jCcewln+y7inTsV8uM7nzSJuSvU5cyOCQO6SzxsvNOxr4y5ZXwDoWt4uioWEcHj8PBZR3VIQRnofDKEXKjKw/xxtSvUxmkHO98eGmAs0SD/0YFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by PR3PR04MB7468.eurprd04.prod.outlook.com (2603:10a6:102:8d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Thu, 12 Mar
 2026 19:30:28 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9700.013; Thu, 12 Mar 2026
 19:30:31 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	arnaud.pouliquen@foss.st.com
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com
Subject: [PATCH v11 2/5] dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode support
Date: Thu, 12 Mar 2026 14:29:54 -0500
Message-ID: <20260312192957.1978329-3-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260312192957.1978329-1-shenwei.wang@nxp.com>
References: <20260312192957.1978329-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA1PR03CA0004.namprd03.prod.outlook.com
 (2603:10b6:806:2d3::8) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|PR3PR04MB7468:EE_
X-MS-Office365-Filtering-Correlation-Id: 63f20c70-f8d6-4f01-2b84-08de806dd31a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|19092799006|52116014|7416014|376014|921020|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: /9qQqT6lyBhL6EeI/JHlmv2dhc92Gn3hkr6MVPF34pbqlLKwy0QXKhyFeJVUYBtjAD/xNPVRzCIPfuVwCjlNpygCHyf0tGp/idEUQSHwMwB8ZXc/hzKgXUgV4pn/ZKyRHmRe/xfbPV+R3kb93UFRARkJyRVC2i/HIYq9Cll0/DK5mFOEUb2TbNHlk+h7iYsBbpS2iEA6x1cGajOffSmXKxg5A0phIlPG2OHPY5LoOsEqX+aBFi4KN+jDXkFD0mgMZkogx9ewQfbh3IBb4ilftgWTgaPETYoDuRN3OZRzaqjhBwT3je/mHlPYvR7OJEjOaUBVyxFcjlRLpCKTJlX8RI5WOgguxm5nLQLETQdH8cgUDOUYSwHdkNhbd7iaQwUUNtPbayfea22ZlnRhXW4NYwjBH297Zt3VS9SpX9/P9St3kbI2BDhV1Zr9z/GSVDetf4fzQobrn2gosj5N4oE5HV7zJaBuXXY+i3EGrnhgQn3dmfm4VNOhTwJb2aSVg5ZFPKYQZ3dOr5AFcPbB1sklz4mCC6nFHMDddYlXwgGeC6C10D00Wy6d12f+aBJIObHnF0I1D77/9/BT8CiM0ntP0ZmsQchFEBzeBY8q35NaDdqouh2VGOIawIvzZDF+RmnOfXJZ3WqBx8k1cSgMvh5ENPzGaD6LfuVEaOOLtkSF2KtxgN+n8eSwqhrdYq7rWasM5YNmHg0OIn8eMARRfxvoZylMVDZYC67wFhWFvo37Mbj6gBzT1HFLU320Pfardg89pFmQ85O5+BsxQZ3Rri9CDg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(7416014)(376014)(921020)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zraCrI5OC56C7OUmJbjs5pGMVT8Fe1R7kMOHfkwzYXai47DLdBOi3HVzD3cx?=
 =?us-ascii?Q?6M51vSGigX0Sy1VMyMgsla/jSlk/A2FeLvZ9bpkVzOK3vIP5VuN+qHye7qOs?=
 =?us-ascii?Q?pS666ftsPst0xMea+NwKN0Dn9MuEwgblYZP6Vp7nXoRTSU6FRSKZN2hpOLPo?=
 =?us-ascii?Q?OiNGy8KDL6wk4VFKRKkFgKqA6Q2F62f2or/tELp2rubpA8fzRRoCeAGy0HbI?=
 =?us-ascii?Q?PBbvDjdDcdq7Jyiw+eoaQLsUF1oX21WCeO/J+Qb6ybUSQrtU1z0fkv6z+r+V?=
 =?us-ascii?Q?5CmKteL+UdwkklAPNNXqwtSv/JyFY/xqip4pIgPusV+JAKe6dmOkAxUMjsIU?=
 =?us-ascii?Q?gtFVW2dQCravldUC+Byfzy1EAE9Ofb/Ij0kXWaGykfRboWP5+NrM/Rt716wv?=
 =?us-ascii?Q?io6xdd0fYkBtf9qEyKOdVlmdNtsTA2cS3nkAy4BRp9o3HW2asSSE6V/eUzG+?=
 =?us-ascii?Q?cwqbkfeITy90m2PAC+n7z/1FeRtM/Z6ayYXXE9ogPMddo92U26GjZ4A3kJ1Q?=
 =?us-ascii?Q?KT9M9YD1pFRqN2mmSe2TUw6DjcnS09aWNq5AD1JONj62ajiBqaR38C+D0KF6?=
 =?us-ascii?Q?y68+irg9hWRD/BevvuqILFFTIGJIp1X1zUuLgnzweUNjvQO08+thUzjZyxXK?=
 =?us-ascii?Q?z3uf+eWdLsVEvwf43I/bsSKk/TX0/uI0ISLc2OJTwiUKtYoUcGXD4ziWm6MW?=
 =?us-ascii?Q?ppxYhiQIP7H/VMws5aJXo+kjuZy5xIhBgRJYmYO/YqzXpMuiKiAZ0wUmrpM4?=
 =?us-ascii?Q?wc79z8Rel84xLjln+zwG3lpTJLY7XPxBNlJGM0oobzs7jO8kM5u7McBZRUGj?=
 =?us-ascii?Q?llt8dtXDQRwUbfTbhj8PxlgKdKHsG/tIXJAACU/aCaDrpMbJE/BXHak0ljJ7?=
 =?us-ascii?Q?OzFLQNs6HQzeIMh9USqItJTImU/qBfOh0i+gep2ruB84cXkbPGzWnaxr67tE?=
 =?us-ascii?Q?6Mihvi6kVqPSZiIDplLTw7Inmlhfzl8jCpUC+DW5lJxF9LvUlG1zWRKHkB2H?=
 =?us-ascii?Q?Lxyv3hwrWpMM/JL7zuDBmgwccHZ3i9m/TJZxHv1A+PbbF3QLRaHwA8jHT2A4?=
 =?us-ascii?Q?jm+iwKIJWK394KvlpQlIOekzTt4o6r++VroKhtsTCLkbvNlihfme91mVWL6V?=
 =?us-ascii?Q?VVjapkDN95MhxXczz524CQhFMmfddLcinqcKV9+1sTikZqS//x0AC+boK1Zr?=
 =?us-ascii?Q?SbZkEm0yvTfrE+4Kgvu3HZzwvaaccEPA6IRjieAvZYOaK7O919ewytQz5NAn?=
 =?us-ascii?Q?X/BLDlgOp7abPfxeqiAbSz5WLzFI2/Yh5QFRh8h50IuDo0t08pAkzi7Bgc1W?=
 =?us-ascii?Q?SrrQ+hC60dApIJ88QyhkfWQ9w1sHFckTcVo/SOJD3uk2AbPnVG2zSFhVXKm+?=
 =?us-ascii?Q?tThJ0e4seN1PauyPLgTXBibO2B1GB18188eXNPyFoKAUsM9SMTCHZ9FYHvF4?=
 =?us-ascii?Q?zp5ePGgBHWqrUORnyPQ1ZeNvlMhZmsmGdUSRMHMJ2VlHFm2qFRmtIAVjU8TE?=
 =?us-ascii?Q?CAqvypXj08COUwdVMCUMe1EZEUAadUnT+twl9wI6Oc5b/c7GgcYB1EOho3NU?=
 =?us-ascii?Q?0SPTG/8OPFmwlCkB5+WRaEKiyiAfPhUtD1BhAtVt+AAAK8FE8bNrDNfkDdHM?=
 =?us-ascii?Q?51f7QxR58vCREYhabYHGz/+//71bfi3vQigD9ZXDVMkRQAUrWUUqOd+z7Bb8?=
 =?us-ascii?Q?QjgXTd1LuihSKfk/kd3hUxH88J5EeMaoUhyEohTNMeKUOGnzqjVHVMBTf0mJ?=
 =?us-ascii?Q?PesI0rQMBQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63f20c70-f8d6-4f01-2b84-08de806dd31a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 19:30:31.6672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qakaEug1onog+clX5louR9SNXjTHNhV1EbgD07qGzNWVHblAH6uIagP9QzNuU8qcKG2poF75iXDMMpxdOkC95Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7468
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_123037_282431_D738D842 
X-CRM114-Status: GOOD (  18.13  )
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

Remote processors may announce multiple GPIO controllers over an RPMSG
channel. These GPIO controllers may require corresponding device tree
nodes, especially when acting as providers, to supply phandles for their
consumers.

Define an RPMSG node to work as a container for a group of RPMSG channels
under the imx_rproc node. Each subnode within "rpmsg" represents an
individual RPMSG channel. The name of each subnode corresponds to the
channel name as defined by the remote processor.

All remote devices associated with a given channel are defined as child
nodes under the corresponding channel node.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 .../devicetree/bindings/gpio/gpio-rpmsg.yaml  | 55 +++++++++++++++++++
 .../bindings/remoteproc/fsl,imx-rproc.yaml    | 53 ++++++++++++++++++
 2 files changed, 108 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml

diff --git a/Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml b/Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
new file mode 100644
index 000000000000..6c78b6850321
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/gpio-rpmsg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic RPMSG GPIO Controller
+
+maintainers:
+  - Shenwei Wang <shenwei.wang@nxp.com>
+
+description:
+  On an AMP platform, some GPIO controllers are exposed by the remote processor
+  through the RPMSG bus. The RPMSG GPIO transport protocol defines the packet
+  structure and communication flow between Linux and the remote firmware. Those
+  controllers are managed via this transport protocol. For more details of the
+  protocol, check the document below.
+  Documentation/driver-api/gpio/gpio-rpmsg.rst
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - fsl,rpmsg-gpio
+          - const: rpmsg-gpio
+      - const: rpmsg-gpio
+
+  reg:
+    description:
+      The reg property represents the index of the GPIO controllers. Since
+      the driver manages controllers on a remote system, this index tells
+      the remote system which controller to operate.
+    maxItems: 1
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-controller: true
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - "#gpio-cells"
+  - "#interrupt-cells"
+
+allOf:
+  - $ref: /schemas/gpio/gpio.yaml#
+
+unevaluatedProperties: false
diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index ce8ec0119469..88281ffc18ca 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -85,6 +85,34 @@ properties:
       This property is to specify the resource id of the remote processor in SoC
       which supports SCFW
 
+  rpmsg:
+    type: object
+    additionalProperties: false
+    description:
+      Represents the RPMSG bus between Linux and the remote system. Contains
+      a group of RPMSG channel devices running on the bus.
+
+    properties:
+      rpmsg-io-channel:
+        type: object
+        additionalProperties: false
+        properties:
+          '#address-cells':
+            const: 1
+
+          '#size-cells':
+            const: 0
+
+        patternProperties:
+          "gpio@[0-9a-f]+$":
+            type: object
+            $ref: /schemas/gpio/gpio-rpmsg.yaml#
+            unevaluatedProperties: false
+
+        required:
+          - '#address-cells'
+          - '#size-cells'
+
 required:
   - compatible
 
@@ -147,5 +175,30 @@ examples:
                 &mu 3 1>;
       memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>, <&rsc_table>;
       syscon = <&src>;
+
+      rpmsg {
+        rpmsg-io-channel {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          gpio@0 {
+            compatible = "rpmsg-gpio";
+            reg = <0>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            #interrupt-cells = <2>;
+            interrupt-controller;
+          };
+
+          gpio@1 {
+            compatible = "rpmsg-gpio";
+            reg = <1>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            #interrupt-cells = <2>;
+            interrupt-controller;
+          };
+        };
+      };
     };
 ...
-- 
2.43.0


