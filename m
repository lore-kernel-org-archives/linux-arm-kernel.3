Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC332E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 06:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZKDOoIIjCiDJLghLlJDBYniUtmgLQ1pIrz/UL3+P8qc=; b=M6+OnWhZcwNeNIaKimCHrhSd96
	yF0phsAfz4zBllhdXnhfvi7hPoeIwdpVbCMUjPLmQezUK7bEmMzF9aqem8f6nQ+UIgpVQGfDYlss1
	SpcRVPQP8FO1K+d86DRcS6uoGVkNh9Be49LWlxf/NVkZ7DcL7A9uC2Y8JFGIHJ/kP1xIOQxYT7ol1
	aU98liJybTwBYgQ/uWw+/4lwcovxgVEgi4AIuOoejH5ADV4jravyrd7xZno6v2HoKhle0XcM9CLEI
	l/KF3bSLPnPoiEKZ+WyEDg8IMqKVmSIQjAgCdyhEmf3S5brHZV5z96f3vpaZ98zrTp5WWmnOQmbKd
	JCipRTHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPcFn-00000009S9j-35zg;
	Mon, 23 Dec 2024 06:49:23 +0000
Received: from mail-db8eur05on20622.outbound.protection.outlook.com ([2a01:111:f403:2614::622] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPc9G-00000009Qi6-2QXb;
	Mon, 23 Dec 2024 06:42:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YQ3d/IonyNJ+8liCfuafLAw3F1xCTjMosg02h4L6t+joeZOvec7bf/CE9X6UbOYZFIK6SlzNkxWskTsUiVDzfXlSCVW67zXfZU/Re4aWxlbjzqNR7Mv/784QAHFOZMlT0bMv7/ts17nrKXix89KfTp09dfs3R/HwZHSICgmOnVwpxKmb6aZibzNPST+YfNrPvW3UlV5p7oycyXwd9yNxf/yuunFeVq9zRC0ikcDcpCYhGU06XS7Dw+IQU8UZmuOkmP3RhhVNs/vaDQGCaOLFwUSW8gdV5f8KwXepvALXQiw8LwAOMyqb/p1Qz31QDNQXkezTTBnLVkPmJqagBZ9BMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZKDOoIIjCiDJLghLlJDBYniUtmgLQ1pIrz/UL3+P8qc=;
 b=Yrl0d8JZS7pKR2qYj0thHU2HpwlUZ1hBqVuRCHsyE376NMcYgcfNv9+CKSjhi0CYK9mCBDJvJY9At4l9AfPMUouLg440PAk2iBU2Sr+owVP/2LLSLr4fXdTs94+MsaY2jQ8KQT2txIgFlCmBjOtf81u2ox3P3ShNxiBwviRt7IgpfGZDEOgtLYG6RdErovKDmvqLnH2P/Y7jOmLt9QlXibieeHWdPsgGxmRIxGjseMj4f53tZhpoctITJFyZ70MuMrXfBqZV18OJkYoAKi85djGxs8TzgO6gvabwxGgiZNImcUEMIlKa0vftyGZ3zEKKau5ro4Zd39dDxhzQi2zGMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZKDOoIIjCiDJLghLlJDBYniUtmgLQ1pIrz/UL3+P8qc=;
 b=ArrSnDmQOjeA9IWfw/dTuPQNlPOdlAPLNl1M0D9AOYN6TkyDFOETa+mPSBCyWtSiDKsuI9yC8rvk9JuOnC9PX0yS7UJULeHvckr42+IluyGVyn/jILfOcGGAfjB6T9AhK6WXdNdi+QOeGX7gfKlq5Bi1Ezah9dJAxJwelIY3R/LinlXCxxmFhhmvn376Ao/y1l09NofdVWSjUb6DPtkWprwkAPlugdv03IBlcHky3QjlHxwrQqCEdnrzzg5fTegVR9iKFr14emZFTmhoJuQ+LRYtyQt+Vs1qR98zRTHhuRsp40ROQdSkp0D/e8GzjIGyiYThprpRk1tCfN5tEhjX0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB7941.eurprd04.prod.outlook.com (2603:10a6:20b:2a6::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.20; Mon, 23 Dec
 2024 06:42:31 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%3]) with mapi id 15.20.8272.013; Mon, 23 Dec 2024
 06:42:31 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	tglx@linutronix.de,
	vkoul@kernel.org,
	kishon@kernel.org,
	aisheng.dong@nxp.com,
	agx@sigxcpu.org,
	u.kleine-koenig@baylibre.com,
	francesco@dolcini.it,
	frank.li@nxp.com,
	dmitry.baryshkov@linaro.org
Subject: [PATCH v7 06/19] dt-bindings: display: imx: Add i.MX8qxp Display Controller command sequencer
Date: Mon, 23 Dec 2024 14:41:34 +0800
Message-Id: <20241223064147.3961652-7-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241223064147.3961652-1-victor.liu@nxp.com>
References: <20241223064147.3961652-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0008.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::19) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB7941:EE_
X-MS-Office365-Filtering-Correlation-Id: c14c2216-7d2b-46f2-de1c-08dd231cf9bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ClZU3VCWwM0vSqSjPVHvm5milyYw9bly6wVzJlweWkYh8Vka7e+fC4zW04Wj?=
 =?us-ascii?Q?T749XpwRO7u2IlTXAh9S5sEb3YTmV/Z3OKbuUAIfamRhSQxgak/aZhYEEH6j?=
 =?us-ascii?Q?O01BDx5XEW2f5pH9VfbrP3tvvW/QyEwvUH7EABZprB3Z8zMy/GxYlkB8gsnl?=
 =?us-ascii?Q?kFkYEZGTdymbYO0M8QuBacSkk3J0qGou+xSspqnncYULZpquT8LUr44MbP1Q?=
 =?us-ascii?Q?r01EEoupBL7np5RENsooSZvcVe4hLY79aCoh4b889K/cvOCvLvyXL4P4I+sK?=
 =?us-ascii?Q?E959VWckrKCEziaaK3HX6lBpypzGZzvVaueaNfVbv0R8T5Az8Y6B5GMnShW2?=
 =?us-ascii?Q?1APdlPTsg5P1p8alseazVDJ6mSw6HnlyQwEIXbiZ4UldBAUjWtFEYFv1QEWS?=
 =?us-ascii?Q?75cw2X+QSIwcKm9oeqd7q1ozwobIsngjy6A5n4gqQnSTgfHdY98vnTRGuw2Z?=
 =?us-ascii?Q?cmWrf/AXFZxXi/XEMV/TKmqwaaiCJU88wrdmgW/r7t713HqDJR6jbvf5pZ06?=
 =?us-ascii?Q?1qENus9VK4F7TyHfbZFu86ht1djoOVAiW8Cqxw43vXolHfk5UbEEeD/BPMf+?=
 =?us-ascii?Q?DO/qBpVo6sye7mJxVfpNtPNx78hUtjJO1VQAb89TV5z3ev7BIWbZq8sbg28g?=
 =?us-ascii?Q?WO2TYda3ayRKJ41Yf7ejqhIb6n4iSmKIaty0ZgYKnh7ycJc9JnxLPwO+DRVY?=
 =?us-ascii?Q?ZPCbhMfwkD2G5iLSXZc1vIHSFJjD009m3eu87aV17ZEbZ7IZ31cD7/COOmEw?=
 =?us-ascii?Q?Em+Cde/cf1JWQOtQv7xHfJlIVXLG8EsiYs2vli3TY02rHrHA0ohqQk+5lz0e?=
 =?us-ascii?Q?eiD3aUqxUxL3x0/nZPwDt43P3GrsZ9uQFlkpHwZHL3ShT2NPXG1FmvHDQ9Kp?=
 =?us-ascii?Q?IQLU4PjFJ/MxwL9rx0p8vFqc/o3xzyUv5zLIRuY/AzBq9lWvFOttgr9Ue2pE?=
 =?us-ascii?Q?YL2m58D0FHStV6vbpFVCf9xrakkbfAk8rv4qKwDsUjZhoSNEnP97HOc6UPrj?=
 =?us-ascii?Q?Vzws6DU24VhLyL1YHnq+EDibj2GL3xwIPKLQeBasJfJ2zZr3iSrO8ONYr8NN?=
 =?us-ascii?Q?tB5wOs9bm7PhAS29og1sz0QHfFGGi1KbxdEdTHZbxjm78y6O5GQnL7MFIqnb?=
 =?us-ascii?Q?i58CmGQZUZMuUTEpqqjBrs9mhgA8h6xSj3VlsI5RTq1XkracTrU62/CZHEE/?=
 =?us-ascii?Q?G2ls1pU6LhhHEt5HWBAHT75S0wbAfSlwsszEFlvkuwlPp7ZMZJxC0FhFHMQl?=
 =?us-ascii?Q?d2v0XCVk1/b3zpXlf26Vu0CobtosZLrzAhS1iZ8Eh5zbJTVQxMCfxQJ20maL?=
 =?us-ascii?Q?eiGJQg/CRqcliymoZKS4rXo30+THjo9L/RZ2t298f0fHQLFkQCJQNlKFKbhD?=
 =?us-ascii?Q?Jqs1aY23jdv8353zePeUrdaPa6Ev?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7046.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a6fkL4wPBVuqMFT7IVvOw4wdghCPUxeGxIPH2B4Az9ODr1+LdRfWLig6mdQY?=
 =?us-ascii?Q?alfq1MSSQNcrXfMXCP4VgBqwsCGLiXiGQ8ejSM/f7hYn/P2icAFrmbvPyIoM?=
 =?us-ascii?Q?As8wCtlOsZKEqtbqnEaRPAMPnheaGL6kDuzCituXsJwTszwPwSaNqG150o9A?=
 =?us-ascii?Q?MsAyrtGxdLl5+Cs5StcGIK2OLW2ixxYVeBYopRHnVbtyXvD7YYqZVzi58KIA?=
 =?us-ascii?Q?RyzIgHHvBua6FSPq0zf0gQMkFDpm/8cJtVecfs/F4Kfnf3fDrco6CiQ4ArZv?=
 =?us-ascii?Q?CptfrkhoiOjyfoqVTwV7WAwziyCJpfySKM6GLlJtmGf/93vE1lWJlNj44j4n?=
 =?us-ascii?Q?hwogyTbIhVPu/b7uo8US9ozJ2Ha5pdD9yIuaQ+T+QyuChwAkkK4gaZr6CT2O?=
 =?us-ascii?Q?R1Ud7g3Xcv8cfBeBSRafPT2MuR0NM+G5NyJy9Uq2ROvrLCA98uoO8M3oZwkX?=
 =?us-ascii?Q?2nA4H466Xah/aev7YldqUmKt+Bx+8VoXPJcWj+3a13w04l0dWAEmxq565nVT?=
 =?us-ascii?Q?gzO69q2Ekl/k1mbIXHntSHX2SdxoePo4q33YtagiM6sGtvkjQV5n0+t0eSxu?=
 =?us-ascii?Q?Tj5kf7Vks8KwM/OVeF2PFw+CDZ1pPnmvNRNBKnEnVbbmsTUK8ix3utM1GqC0?=
 =?us-ascii?Q?LSvNzpEEOGWUXMb4SnLdwd4bpZAxwIp+Sjhn0Nk3nif7a6Qdd8aiG1vJlKVx?=
 =?us-ascii?Q?MI2t/uxKVfvazoAjhX/rhQyRt1ILwc7+9uSKBFsCoTeml6zSjqTDsuqyB9YS?=
 =?us-ascii?Q?AHf4s8ZU8J9BUNdIJyo4A9dzX13zoH/QzJ8lKqIu0eQ8vwpnFVJWTBkMU1PA?=
 =?us-ascii?Q?9tNY5XkRdYVk5/ZyubVq44ulQyuUi4OolnUjS6rGtmOtJgEpAmhySXIQvc+3?=
 =?us-ascii?Q?XKe3nzizDJEz48v4VWVblWdxjJgUzp9A0Z+Qhffpv0SM5W5Eh0QuSkrQDmlY?=
 =?us-ascii?Q?MAzpOzIj8svEZLtdG1r+/A0cLdcxmUJEO+MKHwVTNXAYk/ZCBDxUDr5qqXLl?=
 =?us-ascii?Q?L6pd2ThADTNNprR4rsR4CYzG08j/aVxGQy9+e+jEjL3IQjI1mjwRe3L/UXob?=
 =?us-ascii?Q?X6iHHVxkIvRSj/bo+ehVS8qXSawRpjNhzEPpQ1teiaxIsHnfJLx/JIjV+62U?=
 =?us-ascii?Q?IFvuAx0miQHP1wMhZ3rw3BPCw1aNFF53UTRb6SZdnsg7uxPFtw3eX/lO6r4w?=
 =?us-ascii?Q?pqaPefXe1zX/x9/X1ysFR2O7Nfb86VGzOmFywKKHMBijD+Rm6BFdUsDOdKm7?=
 =?us-ascii?Q?WwX4tTJ+cCWBZIXVb4CPUQRfNagHfIJgp4mOyyhhgAtwqrysW0QI2PtGs9EL?=
 =?us-ascii?Q?ctUdfMXEp/3eSJR0r169UXGpl/WYpDSpUPZaVZqPR5CIkDadlUsq0/dGxvpK?=
 =?us-ascii?Q?Yc/FygjIcyP+ZJqB+0qnb59hC8WDVlRwJjlhszsoPFpEqCCIlNEutuiyB4jE?=
 =?us-ascii?Q?4LBOw8zDiUBmNntrak13chC+QXBbTVraWBQAIAmDuYlB+ZtTUxkqaN6wmGWW?=
 =?us-ascii?Q?R7j/hy5IRyMmSnSiteEOiCFJ6MGDGVe9+fZcIdSb7bAChZWE7g72GKDoOfXy?=
 =?us-ascii?Q?PPnVeExZOo5gYDPlZJxUS7NKHzWxHpgjS5c8gTQA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c14c2216-7d2b-46f2-de1c-08dd231cf9bb
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2024 06:42:31.3468
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nk9uwUGEMw3PfPiqZ+dN9irwRP5FyYZXNDllO0kIENsgYnWGWeYmHXEsMwaK6s3CszUCGeorTtRyo4TXddfr5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7941
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_224238_636904_82804967 
X-CRM114-Status: GOOD (  13.00  )
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

i.MX8qxp Display Controller contains a command sequencer is designed to
autonomously process command lists.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v7:
* No change.

v6:
* No change.

v5:
* No change.

v4:
* Replace "fsl,iram" property with standard "sram" property. (Rob)

v3:
* New patch. (Rob)

 .../imx/fsl,imx8qxp-dc-command-sequencer.yaml | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-command-sequencer.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-command-sequencer.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-command-sequencer.yaml
new file mode 100644
index 000000000000..27118f4c0d28
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-command-sequencer.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-command-sequencer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Command Sequencer
+
+description: |
+  The Command Sequencer is designed to autonomously process command lists.
+  By that it can load setups into the DC configuration and synchronize to
+  hardware events.  This releases a system's CPU from workload, because it
+  does not need to wait for certain events.  Also it simplifies SW architecture,
+  because no interrupt handlers are required.  Setups are read via AXI bus,
+  while write access to configuration registers occurs directly via an internal
+  bus.  This saves bandwidth for the AXI interconnect and improves the system
+  architecture in terms of safety aspects.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-command-sequencer
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 5
+
+  interrupt-names:
+    items:
+      - const: error
+      - const: sw0
+      - const: sw1
+      - const: sw2
+      - const: sw3
+
+  sram:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle pointing to the mmio-sram device node
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+  - interrupt-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8-lpcg.h>
+
+    command-sequencer@56180400 {
+        compatible = "fsl,imx8qxp-dc-command-sequencer";
+        reg = <0x56180400 0x1a4>;
+        clocks = <&dc0_lpcg IMX_LPCG_CLK_5>;
+        interrupt-parent = <&dc0_intc>;
+        interrupts = <36>, <37>, <38>, <39>, <40>;
+        interrupt-names = "error", "sw0", "sw1", "sw2", "sw3";
+    };
-- 
2.34.1


