Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 341AEF3381D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 09:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZOop34XvF8oQhw3JkP3QzlUkHvVRjO9aSMUgV+TCrBk=; b=ciaY48VDUBjieJzby72wQkh9Kt
	pTLeb2Ctot2Bm3OzIB3CwyzfX3W1OdtTOOvwWfJtjC7VRDTl1Gj+EU2u4DbAADe23D7/z2wTIiz/J
	2qTejNKVEBqvjrw1cWSaz7aDdLBrZsMMDjFqZS5+I59PigoFbX7QzB2rmO0ibpKy8+9E5lS9vpC3l
	FgLPs8mxErtFU5K8jZbYV/HTrKQ90sNxhLOl5gT20DTgGwm4aa8/RT/1KAiG7Qvuj5+awauALb49g
	7jdc2aGFHnQBfQaAmMjVYG5mr4AGTXsJxBvrZmaUSOxdEQ5oA8TqOAk3JjqfT4dpOo1o+1Gn5ujTM
	RQd+95aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2QPD-00000005ndW-03eg;
	Tue, 17 Mar 2026 09:08:03 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2QP6-00000005nXL-0Tfe;
	Tue, 17 Mar 2026 09:08:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=otsYtP3P+8akK6LiiqaAwHFe0rxZK/Fwg1k6iOxZ+T+XIAqoSvKRB7YATsEhGiUHsovjagoGND/j/sNzILQ/Ccx3WdEOQfy+O7EoKWmzkczmlNWCBjXPgJkgKsUPkCMI9upbKpI4lSubVe7efsNyU22hvHThzApAarxDC9mJ32c/klYTIjWnwU+rZVNaLjdWYXq7PEbOxURWTspCTs1pUHeYkDmWuHKuKqqTKQpaW7Mc2PQru5qYptOct8vEGZ0UFw4+tRFcUwRIeLWXFjmNKUEUadxehRNPjRLzEwfTGfiSYhJiUcVJx4UQy4lOTn/Wp+4WpUHlyXFbMsB9m7zKUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZOop34XvF8oQhw3JkP3QzlUkHvVRjO9aSMUgV+TCrBk=;
 b=Dxk66AZcgmFtCdK22zbDxWbCpqvOQzLFrq2wVVM9EBzaARm9D1u5mD/qHXYy6V4BM1RbC5+q74gMo/4dQFSwKxzuz7vSYOynBeL0CYNdUrbgu4XjPzXjJodNGhsQDpGUfUPJXHo2nUkejjTe4fyLqBgXMn3hDRaGo2KghsE53LISPAbZcGbUX2zpxIzmsnhbXGhhMwpSgvVt+hFMrkWL5dceKlP646nhIlLEclnsMwUqnUu7cBTFzjNMJmmZGlF+HhVMdmZvWunvA4MZ13RGpaLINz3uWlVHzQ66u9kX+DoTU5RdukGGuSMtvYPvfUWaUdALPgEoja2GEfxX6/r76g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wesion.com; dmarc=pass action=none header.from=wesion.com;
 dkim=pass header.d=wesion.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wesion.com;
Received: from JH0PR03MB8617.apcprd03.prod.outlook.com (2603:1096:990:91::14)
 by SEZPR03MB8663.apcprd03.prod.outlook.com (2603:1096:101:22a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.22; Tue, 17 Mar
 2026 09:07:49 +0000
Received: from JH0PR03MB8617.apcprd03.prod.outlook.com
 ([fe80::28d:6503:f51c:11b7]) by JH0PR03MB8617.apcprd03.prod.outlook.com
 ([fe80::28d:6503:f51c:11b7%4]) with mapi id 15.20.9700.022; Tue, 17 Mar 2026
 09:07:48 +0000
From: Gray Huang <gray.huang@wesion.com>
To: heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	naoki@radxa.com,
	jonas@kwiboo.se,
	chaoyi.chen@rock-chips.com,
	i@chainsx.cn,
	michael.opdenacker@rootcommit.com,
	inindev@gmail.com,
	quentin.schulz@cherry.de,
	andrew@lunn.ch,
	alchark@gmail.com,
	pbrobinson@gmail.com,
	nick@khadas.com,
	Gray Huang <gray.huang@wesion.com>
Subject: [PATCH v2 0/2] arm64: dts: rockchip: Add initial support for Khadas Edge 2L
Date: Tue, 17 Mar 2026 17:07:29 +0800
Message-Id: <20260317090731.600787-1-gray.huang@wesion.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0222.apcprd06.prod.outlook.com
 (2603:1096:4:68::30) To JH0PR03MB8617.apcprd03.prod.outlook.com
 (2603:1096:990:91::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: JH0PR03MB8617:EE_|SEZPR03MB8663:EE_
X-MS-Office365-Filtering-Correlation-Id: 871af607-5ad0-4fe9-5306-08de8404a92c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: xSReS/GyDmeIcmkrHNI2RReqqR1yKXkhnJo4Zr7aIuo/kRQk2w0Tn4pEHYTIWBf5Gov5Q1ZWLekcXRfbPShH77ASytXmM4PVjS+32JWa8gUfmd5wQpGNnz6NUNhair9puslWwsBT+KuOru109dvrOIQBrUNXp1NgpCOTaLa4xmNwrgrUC+c7oJzjaJy7fFSlHw7x3AB+JY8pzZbIOhOwh9d9tXK4ldRpZvhNSullL/ZMQcQs+WZC5+ARbE4+6lnoqMowUlH4XnVozD/FHLLidpxacwI+m3c0hWqAlTOh2Fr3VgICQ/3ji6ZFTNsqGbN/d1y5mze6zYc9NEFni5Ri1bt1tLSkWAzhgbB011Bs5Ozfvll8i5xFTA99SYoYIUVFM0vnBbs0NYf50WGbuQ2rO0M+JqhhH1ln+5Lnt2+NFZg2iDtRnanWBuxKWx6YugyaFGUTyKvrNUrBxY/DZoo1373eDZTl6b8LDt1LTUOHdJPRTeV9X44exvEbIh1AD44c3JLVJqmNCld53gt3vixiRyhRdISs54RDht5uEtb1VC7RWPTE8zz58oL3k/UIMFd1d1DbHGrWZrM90QzzZbeNW5kXoBs1BWcT4ZIESvrzNQEGv0v+BGm+xG5p/tpm8J29RSM04GnQ9s7pLrh2SDlfYhpuRjU2w/s5LxxvcKBURDGretUi6MWe0/HOIvOj78shLlSOhy7/zQVkHCDFiUHmYXrFIX3gRHOzeTa/kIN74QH6IiUyrLu6pDiZlKZOu5JsBH5K2QEv1l1iOHC28kfzHUka+eMXLVrfmsgTeKWIX9k=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR03MB8617.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3eVOoaHbUNKTZ/GdvGal5pxUla5XoTfS6BPihU2hYHHMG1gJ1kjA5xamFqbF?=
 =?us-ascii?Q?U/R411cJ682hKGwNaqbWUfdFbDvInuOdSrqjotd+MzIn/eD/y4GuoCxPF5la?=
 =?us-ascii?Q?9qImP+l1IOi5QZopa/jmWz06hRlkScmbvrCDaBSnFB4X2zzQzrSOjzoL75qR?=
 =?us-ascii?Q?whEPDetUkM4MHKGT23PbN7aVhK5eeXhzQD2KoeTHTaHotB8+3eTqyNBFrX2a?=
 =?us-ascii?Q?XyWmVrY3QX7uyGP/cPogF+ToUm51li4oP8vIwSS1d47kyD6Ady5IGv8a94k5?=
 =?us-ascii?Q?u/BGbSXKa2XKx69Pgr9EIgt14GWYYHxcCaKKIVRBRpC8FSOPRvihdgnTtB3j?=
 =?us-ascii?Q?Am+s8100Gy2Eo3lDM8wQGE+kYiuw8UVxWacUJWTFpzbzMiObUzOlFqx8x/YV?=
 =?us-ascii?Q?JS2L5d2Kn6jOaViWSBihzfyMS3B9jhqUFN6XT+EikKzcijoczEfJHKO11vRD?=
 =?us-ascii?Q?4krlEUxdqvJ8A//nZrzyHQobO1uA8CDMPFJFDMBKAK3pseUgSkZW1iHOs8TP?=
 =?us-ascii?Q?AepH1FHhCJUquRYLyZNLOivdlwaYKgoJtDWJyyrrpbyqpqiyVCxxGLfHGMol?=
 =?us-ascii?Q?cCgZNYCNT+X70HUudyl1pILJoG18SfTF1ywGNOSlzXWFAXwPW89tI6fIz+iL?=
 =?us-ascii?Q?LC0yhHT/0hruwYbFIMvmrelVixvm1Y2LXgeaVE9wPOTRob76ENA8JW5S/kJj?=
 =?us-ascii?Q?1FhN5VOzzwDUT+fO4kEKiWKaXd5LzGVfi7x4eeTwg3pxTd3FxHml4RqYmCA8?=
 =?us-ascii?Q?R93dzNjnzAlibkIXDzrq9sc5ejnlSmbNT+E9A7cXGzkVgXVYc5O677P9HMtD?=
 =?us-ascii?Q?QzmvWFqXwMwvhsLlhDUKi/0haKJSVeAA0yGm2hM+3OsmQyDdkZmltf+cV+1G?=
 =?us-ascii?Q?XI/ExnHcRDqcEtPivf81/Peiwg7ZosV7/2H2Wt3oOGl9AJ5Ey9rtwkL41y0U?=
 =?us-ascii?Q?LtBU627N1/VM0p6lzAycWFSPUT0mKf1PY+lrtjbk3sNgNHBfTaTeCbsGyNGX?=
 =?us-ascii?Q?DRsnkc1UyWHD+tjnV6tUtcQbH9SDUF74JvBPOe4DuGKUnP5L37rf/WZD3Ur5?=
 =?us-ascii?Q?SvsO4EgZhoWUNTdgJXyvQEViZ9RnZCWeblwrcQDbVTxy747anOyHBY59uy7o?=
 =?us-ascii?Q?jspwPpqpGqNGYpdl6H2b6xW/noMw4G1a80bqcJJBHWMPsvUEN1K3QuWRlDpO?=
 =?us-ascii?Q?VmAm25mc4XxNd4fWoFIduMcO9K1abQaUWF0QyE8RXVb4vQ9zLwwaHA6qpA+z?=
 =?us-ascii?Q?fsehUJor1Gdk8/fiqyORCHQdPI7xeXsDmuya44o3zTKHPSNl/W3Oxjo+pUOL?=
 =?us-ascii?Q?UNqOrKxmfsxzakLR1FwGzZyIRLErYZyTSFoM+y4GPbvuIFVpOYEm2fqVKE0Y?=
 =?us-ascii?Q?Bdjnicy1GxQWHOTYnTycbY+hX7Vw6e9o46I4Cml5qGXofsWP4r2Bii1x42t1?=
 =?us-ascii?Q?Jx4OK4ZMbOOW1f5d1rn9BuToVUuymD5YkAhUzxcbXO/dZmOdF42Ya6sE2lBF?=
 =?us-ascii?Q?zEWDGiFqkG9qzG73/EFD6TgyhwiFbvyCqbPrNYZtKwQh4wyXs3/2PUvxyyrp?=
 =?us-ascii?Q?N2oRILrFnOD3kupCr3GyNuwHGxacAMrsCpDpWLwjYb60rgnmVziCAVu/VuB8?=
 =?us-ascii?Q?MWhZ4uvIwr4g2QJ1JjPtvvhFxypjaZSUkI4ObqY/njMWqvlpddgyAON6cl2u?=
 =?us-ascii?Q?llQ95+lK//QYxkW/LjBQnzaSxJgjI3T9fgUaI0+u3/esCHqmlaZ1YYZuxnfY?=
 =?us-ascii?Q?KVI1ZzX8RQ=3D=3D?=
X-OriginatorOrg: wesion.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 871af607-5ad0-4fe9-5306-08de8404a92c
X-MS-Exchange-CrossTenant-AuthSource: JH0PR03MB8617.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 09:07:48.8944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iMNnIebDITmCIbiJ2UOXV7FEoWYkNtfBiGZyR/eOExKjtrB6dFwh9tuo6yFbJUdZiVUFKaMsVu1GxUFrNtmMWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8663
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_020756_167196_0C9EC15D 
X-CRM114-Status: GOOD (  11.07  )
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

This patch series adds initial basic support for the Khadas Edge 2L board,
which is based on the Rockchip RK3576 SoC.

To keep the initial review process simple and easy, this series only 
enables the bare minimum peripherals required to boot the board to a shell:
- UART (for serial console)
- eMMC (for root filesystem)

Support for other rich peripherals (such as PCIe Wi-Fi, USB, HDMI, 
microSD, etc.) will be submitted in subsequent patch series once this 
base is merged.

Changes from v1 at [1]:
- dt-bindings: Removed marketing language from the commit message.
- arm64: dts: Rewrote the commit message to use the imperative mood.

[1] https://patchwork.kernel.org/project/linux-rockchip/cover/20260317040248.267154-1-gray.huang@wesion.com/

Gray Huang (2):
  dt-bindings: arm: rockchip: Add Khadas Edge 2L board
  arm64: dts: rockchip: Add Khadas Edge 2L board

 .../devicetree/bindings/arm/rockchip.yaml     |  5 +++
 arch/arm64/boot/dts/rockchip/Makefile         |  1 +
 .../dts/rockchip/rk3576-khadas-edge-2l.dts    | 34 +++++++++++++++++++
 3 files changed, 40 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts

-- 
2.34.1


