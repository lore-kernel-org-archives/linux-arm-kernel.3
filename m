Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF82FCD0C0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 06:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vQgr/Jjp3ApT/lbu19qZvUztjyAkB4ugK0PPupDQNwg=; b=eWIj4/s2DlUD+rz+TS35z4f6Bz
	GUa6xV26Z6YkEC5UOcHfMJcjJdf3UrbZE7MrHVy3RZ4HhK+FtgHJhpScJ2uwQ/OnKNX7WYqsZvUW6
	Mo59YK5bbxMjreJg5xkRzD8zd+ahhljXlGUPPm3794hjNVrRZj25CO5rmJgCkpQdO0BZKIrUZJeeB
	etLMhD7Or0N1kXx8P2xGla0P0xUhpZDVKgucQjlq81VS5MIf+VN1OTVF0Pv6jr8ZmlHhO44aGRR14
	L38x9kLPzz4lKMbawMIi6nvpJ75+0Yzf2pHd2gfQkyG95MBId8d5lsPn8JQUaDJNt80sfJ5weKRLy
	9WNOqklw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2kOw-00000007rcv-08Cx;
	Wed, 18 Mar 2026 06:29:06 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2kOt-00000007rZy-3n8w
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 06:29:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WfGIdEOTHIGvp0OFEX9JZdMCTc1rqrc5C7gPRCuQVuLfdknRsqaArWYt9YGUF3sbPE7dBQ4jFSqGYIF3U/NpVma3l9eSHrA0lHyu2vXTE7N9aWtsXNrtp4G5yPfbA5aRHMrmuk6hKKzpQkUQYzQZ9LcEdFZ2WgALfhfNbwLJtwXf77j2bG5GUjDFNI3d1Dk8PyFOqUOsSK7/5wH5t5+9cJxL+o1zqcYn9HyKjNI7yd0UCpvZj08btTzpAP10S3aj+oVU4wqCvKGYKDWA5wHgjfA72DFjqDrOiDXOj1AoLLm2rkrnZmMYj6Jz5HSjVNjh1m4TE5LxrTlGSbqEZ7jGtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vQgr/Jjp3ApT/lbu19qZvUztjyAkB4ugK0PPupDQNwg=;
 b=t9SYS/3AIloU1vkPZFmTgZLVlvPCK5avgRg6hXJgUfb1fMr/jYdwkBJbbkBkVPqJI8OD45ryps0ChW4K5AyjWm3lVbysO3R9k6O0ceXwsT2XW9sNJmziWi+LADeYInnaWPCFvrAEHBr8KcdOLmMCAOuassDpDfNgl8/K2nzQloBMY0NNn15P4/Mcn0nOwxdso+NRVYOd/y2Lo2L6pmoMgD3baXxLANSvtEDuFCK9GF+kN2WRSvy7yRtMAASvJj8Xkr8wsB084PqqyytW9df2x4Xkm9MzpGsU8WY8Q/hUO0Qcn7dkP1n9vnS0H8FLegK/OC5b224rQCfzCzLVWAQsAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vQgr/Jjp3ApT/lbu19qZvUztjyAkB4ugK0PPupDQNwg=;
 b=bWPAIXnGKYPgFZ79+14qUeeDc5fsMqhp3/aO38ICKUu4PAYdkxZLgbf3lByOMBCO9hjaDKJ5gdDskjipZaKgCgkNKK7I0pe2gQfk1+c5cBjWrzmoo71IemYdKmiqGe8lyXzxwl3hkn4Wqu49vnx08L9yHqEokJAs3rCFj17klFZ8Pl8e8OQH3p/nfClZJPr9CBlrobpwJVIYMWZpVX2DqvOog02OSikqYnPNgPFhWK6JDNl8rp0pPBMHFS/6vtmtTnTP3hYQbnBBxS6gp3kbujxQFiMn+tLSVodeXwIKepoSNl/fF4Hq9z99/AB8WYwPDKc1w8hqZMByCM2UXkm/iA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by PA1PR04MB11334.eurprd04.prod.outlook.com
 (2603:10a6:102:4f2::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 06:28:58 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%5]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 06:29:00 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: hongxing.zhu@nxp.com,
	l.stach@pengutronix.de,
	Frank.Li@nxp.com,
	bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: imx@lists.linux.dev,
	kernel@pengutronix.de,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V9 08/13] arm: dts: imx7d: Add Root Port node and PERST property
Date: Wed, 18 Mar 2026 14:29:11 +0800
Message-Id: <20260318062916.2747472-9-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260318062916.2747472-1-sherry.sun@nxp.com>
References: <20260318062916.2747472-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0011.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::19) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|PA1PR04MB11334:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d8ae770-63f8-46b1-7cc4-08de84b7a443
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|7416014|376014|1800799024|52116014|56012099003|18002099003|22082099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info: 0fw7zugoZH3XA9OcZHiSibp4RyaYOdWRmCEEsMIyk3JmokZHWIw4kEYDmTkHKfZ3h8vb9H7uI/7dvr3uR9RuklxhgwJcMKXGluoSmTJ37CAnysdlnSADcL9x9a+YiVnux9VPkK4dn/x+/nc0pkEg9TUt0vbb2NG6sC3QyyKsKJjN0T5NjsKdZXFun/UpIty6+OXSn5gDXYDmcmkrqhGkqBitgirtCtNwBVpAYaNhupM6/AkrJ/b+oepLddgvXU0VAzqJiaK2IIrP0iHMFRL5VXIp8v4YbzhlfXoEUMHxVh0+vYm6zhqBJdZdbUV6D3QRztAhWvgg/M2HVpHYspFHxf+rpx5pG+nM9dPQt9ZtWZJU2yGrKRU3b9RiLm+xow4MD0+GEBR/fdVjgDAg1/STKGPi8K21ad8euYocBi5UFcklsXEbgS2QZHy3yj0QC5jN1YulWM5uoHnVTUPpiZ3K8WT9dUlCMupsmibIMptp/r8TyUh96t2Jryu9LzQ0rulI6aVd4hHj1ugxiMHik1XHEUWif4gGkrkVC2HF5Ot6/XnZVorX45Vvok9D7E91ITDlJIGsvJ6jS2XJK2005ZJ8ccYuH1h4T2e0u8EipL/xlALzR2MWXOgNydodcCmoZQ5sc15vk5W6pCipmATa8Rdv8UE7U8cXjhRz54HL1BGxacYIWVfRHzKcSTLccUobeP0baR+mypOEYTDEgReZo13SBLWQVsvK+K0ua2jZb3lPsmCYOmJ53xolH4L4GTn+xAsP0ZWYYiU/SNFKiKpd/eFiuwwMb/aCnJaDr3PMxf1/rjd377h/Ko6AyijkTqxawvp3
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(7416014)(376014)(1800799024)(52116014)(56012099003)(18002099003)(22082099003)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BL89A3irOHXw6kgFM8HW5vRjeJNmMMZWDs1IUTA1MjbmFDTxsYyANenQlr/D?=
 =?us-ascii?Q?DhuRRjcTrtb45a+ctx0YQN/YWSCOyV/Wm7StszlLiJqVXJC1zwR7RVz7gaOb?=
 =?us-ascii?Q?TMSWS1LqYFLqNUMvDE+aOYoURT/CnCVhg1U9ytftCTXzSlvfHAHa+L6wkQuw?=
 =?us-ascii?Q?vntuqnf7XG5eKT5tUqlpDzLpJQ0Ubtkp9PxG09gSAvdu/U5QDeqm8kaUEKgv?=
 =?us-ascii?Q?dhoG8SLvUgHrEMMh8GpojbldRYhfD1UbcP62duUdVL17urJLvAryDHHz/NBJ?=
 =?us-ascii?Q?XC88UfxhFias/6v60ro0VCwDYlJCSWnqvOFBgTo3ao17+vqs1Pi/VL+FF6lY?=
 =?us-ascii?Q?jLIb5/dWg5NxnyYZo2yVZ31LxqEE+/SG//+xqebieHKEOCjMr2544Yo30vjR?=
 =?us-ascii?Q?NZufUrTAQ/8TeGmVLWbQcA9Ad7KOyh0yQB4zk0L8X9dNv1mNF22mU56j3ioF?=
 =?us-ascii?Q?MT5+rAIE7Es15qkn8Etw4Xd52ggy5EBMXtlYeYujPPS3INSprRaDR9xfoY8+?=
 =?us-ascii?Q?ke6wfCYf0bR/JbQSNXv4TOolKkD2h/owHeYTVxEpVUlHWeBgJsZ2ZbCKnIwr?=
 =?us-ascii?Q?ZjIMcAAHtFWyFc2zx35DPCaiYYrMzQ6zgyqN1IsblhpDk+aSM4ISKBp6tJxn?=
 =?us-ascii?Q?cW1fU6DEoHocbQch6dPdAqsSxYSK4oRcbs4SRLdEyI6VnXha8AK1ggZd18hr?=
 =?us-ascii?Q?x6TCpWtc18jW35lyyYE3C6peLb0CFGQp0PBTCGeEg1W5vQBYQT87EWPlkwzX?=
 =?us-ascii?Q?JpkeOJYwG/4v1KGrBQ7jT1FGDe2db5GjbVoCmnAFTuscO4vr4mXzRJs8QTq7?=
 =?us-ascii?Q?T5OxCHb1eB3kOaxl8Kge7k3m39vVJC3ZHL6Slkqb35kXJotxIx2WgJX5v2v3?=
 =?us-ascii?Q?cuTa9pxxlujrTgCcXvSwohTG3IHujsUjDwqnUOV12XHV0t2hY8nYEU4OJ9mn?=
 =?us-ascii?Q?bij01vbBhJG0KJ9j9MPtehWJjGXa5EYW66h3dxii1+bNs5fZcDL9RKkw7k/a?=
 =?us-ascii?Q?TbdZuV/r/vcLRQMWPoNunED7AfdhvrxaKgpNv35SNrczKA9ufEmgb2t6H1Ga?=
 =?us-ascii?Q?Ca9+Hg+SjiyjX5bg46+jpX+ewfQky3c5hXAblw9XnJ2JMi8S3BaUaO9P/VMb?=
 =?us-ascii?Q?B9uUAUyDGwbS5oF7EnpmQluhviNC6VgIAs2xsUb49s/6TNHvfI4AlIjEpkGS?=
 =?us-ascii?Q?CCbiZ/9DvTQGdDf67QKSTn3C+0FEy47YwzY5vdFscwjrfwacfzDYYz5q5hR1?=
 =?us-ascii?Q?F6IKRjfGxuxnfGZGIdgRRQRhl9rrOa0SriI9zKfzuj5YVRVHXL0HTn1yq1ET?=
 =?us-ascii?Q?iM87emZf72b6YupU6I8ZaegVcvPKKigUgv/8mqoV5IwzEgvgaQEeFKo1rblm?=
 =?us-ascii?Q?1j7yR2QlmJ/oCQWRCPP7RXX9c1PA7g+mpE7zdiImp/7xsWoJWNiEDOzyKmTl?=
 =?us-ascii?Q?Dm3EXebdUkajCSnbNOXTT7Uc1iYifD2/o2EzUrhC39xPn9OUjSDi2oUWSy6M?=
 =?us-ascii?Q?SfuWuy1weaoi4KxYOKf3cOwlDpoStFt+xpJfO5VSNaX4lVZmFkQ0+/APBHpk?=
 =?us-ascii?Q?jhgeVDHiz7AxcWeNpOZHPzFNdEfSRZ18Bl4FuB6OwSMDREPlsZvbHXzAG8mS?=
 =?us-ascii?Q?UoH92uWBZ32pfTqsKJYnm+HHhPZuE7IWZNnGqIA8qgy9k6HbLwvDcNCR5vyS?=
 =?us-ascii?Q?KruZPBU9IxyfMujXUfJ9QV7pffJf1uAFqKcS5e8Z8JfQlAayw+2PehbQrmLK?=
 =?us-ascii?Q?5RDPoLJ5sA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d8ae770-63f8-46b1-7cc4-08de84b7a443
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 06:29:00.3781
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DMWp/AmPJ9ige9WBW1pEtse5jMdf+ptu57cSsBHX+vu4VR4agUW8s/ThtQH6y8eDo/3vjeLpq0BHdnI3QFW74g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11334
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_232903_937322_37E194D9 
X-CRM114-Status: GOOD (  10.64  )
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

Since describing the PCIe PERST# property under Host Bridge node is now
deprecated, it is recommended to add it to the Root Port node, so
creating the Root Port node and add the reset-gpios property in Root
Port.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts |  5 +++++
 arch/arm/boot/dts/nxp/imx/imx7d.dtsi    | 11 +++++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts b/arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts
index a370e868cafe..0046b276b8b9 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts
@@ -456,10 +456,15 @@ display_out: endpoint {
 };
 
 &pcie {
+	/* This property is deprecated, use reset-gpios from the Root Port node. */
 	reset-gpio = <&extended_io 1 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
+&pcie_port0 {
+	reset-gpios = <&extended_io 1 GPIO_ACTIVE_LOW>;
+};
+
 &reg_1p0d {
 	vin-supply = <&sw2_reg>;
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d.dtsi b/arch/arm/boot/dts/nxp/imx/imx7d.dtsi
index d961c61a93af..3c5c1f2c1460 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7d.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7d.dtsi
@@ -155,6 +155,17 @@ pcie: pcie@33800000 {
 			reset-names = "pciephy", "apps", "turnoff";
 			fsl,imx7d-pcie-phy = <&pcie_phy>;
 			status = "disabled";
+
+			pcie_port0: pcie@0 {
+				compatible = "pciclass,0604";
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
 		};
 	};
 };
-- 
2.37.1


