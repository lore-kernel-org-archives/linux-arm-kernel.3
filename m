Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED646E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 02:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zZ5k1osf5EbubUYg4rkwQALGJLEvbLE+AxMFRYrGLG4=; b=AGdCAxdOc+fGeUBmfUEdZSlCcS
	PBg0oWP8uiN0ginwIvMeoIQO5iFI37qqootpdCXH3d2wZg2IWO1lXJa8QcJ/u2MaUYng3hHq1+lXu
	8SgKiuwyOYhSYXIOInUeD2nqt6DSiTsS6XPyGRl1o1tg5MZUMsYepx0ueqFHJ0rNJu6Unh3VsgPr4
	mAAR1NfX/yICm/HdEBg/FwgVHGYS0iujwIICcH+gDGDV6TRWJXu3Zf89KkLaQoR8AsFxss5DcikQY
	lzomw7LPMqwDetP2DEshUgImb25a2AldxjddJOQW/kKqecVVZERleqrOzlNmuPOgI9Qbvu6VX3y6h
	keqwq+lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tS5Nz-00000004KKP-0VJG;
	Mon, 30 Dec 2024 02:20:03 +0000
Received: from mail-vi1eur02on20631.outbound.protection.outlook.com ([2a01:111:f403:2607::631] helo=EUR02-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tS5H8-00000004IjP-0vc4;
	Mon, 30 Dec 2024 02:12:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dMkrrXa407xRn0Ev8XRiXoQmsNEovIWSUaXzFNE3yDg6epEeKIe02chG8drobNhvoztSN8yO3yTv1DWrwXB3NXBVByWFVaY//P90d41KBr5PIo6CUZBqlle5GM5FT0QHUX6TGz/tIgy2ywetdAvuU4V8HAePsJ02syDT+UxukcGD6LBvtZMc/KSbAa09mPnxrn1tmMxSIXZkNfwQDMGShWhnsFzPG/Z+izdJOsgh6uuF45+FMMsxAsETCbB+A/9tQiBO7fAfvBalg0MMYHrJplE9ibYNACu53m7dF5Imb6eoPppUAFv2RUEmJKCHvlzVDjNBJlUNUr7X0nnN23tJTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zZ5k1osf5EbubUYg4rkwQALGJLEvbLE+AxMFRYrGLG4=;
 b=uRT5kF+74HpVjW18KiWoJBf+VdA3FH+jfHqEpW//L7eUeczPbkFbbB+0zVEznzAyj26zwEazrs8Biy8Q9zgU3dGZ00vggsiRIYdWqVuQ+4Pvr6oo6LnxLEF4hZmaALfJcgfXCpr2dbOF+kBMQfAHXNTjg+iAp0JKyalkE9tj6F1aqDzJFqHTSGTtm0AjdFKbSmS2phGsdxE7IoYMA3xCEXCKyxMSFJUWkVvY1ayaGj7ZIpknR0UjXMIbmlNNBOUYXXyzLsyJEHpuU4vH5oRWl4Q51VyVeNNjPN3f5Esx+VczTNE/vMK4EShmO3yimAAYV9wZfg+qQN6BbMYpgU2GNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zZ5k1osf5EbubUYg4rkwQALGJLEvbLE+AxMFRYrGLG4=;
 b=oUZh1EW25JEtk2IhVRC1HxHCks7KP7/qzn9zbYbGyQCgttq4ISarMkk2+UWra22K6wOk0ByvYZocz05SQVxaIXRsqM/XpCIvPxFHmasfXmJr+Y3TGIebQt7FsL5HC1mrsCvsC2Q3hjzjW4rCE9HKngikvKK+em1gjRjIgZ5lZhrp8UkgcDpvFjuReMkyYTrVxVR3Gl+4Esa0NWcBTu5HtavuNxNxID3ZU5WgL/+hfX7aOeiJDWhPbpnhpH2/cpMH6ilxG8axipCCaP9wgWGCpHd3E/5Dmcxdz0n9lvXpx6sFq+L/aqoLfpm3ropBzKC6lbSA1pTRsjCBlyk2CGzqXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DUZPR04MB9821.eurprd04.prod.outlook.com (2603:10a6:10:4b1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.19; Mon, 30 Dec
 2024 02:12:50 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8293.000; Mon, 30 Dec 2024
 02:12:50 +0000
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
Subject: [PATCH v8 06/19] dt-bindings: display: imx: Add i.MX8qxp Display Controller command sequencer
Date: Mon, 30 Dec 2024 10:11:54 +0800
Message-Id: <20241230021207.220144-7-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241230021207.220144-1-victor.liu@nxp.com>
References: <20241230021207.220144-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: JH0PR01CA0066.apcprd01.prod.exchangelabs.com
 (2603:1096:990:57::10) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DUZPR04MB9821:EE_
X-MS-Office365-Filtering-Correlation-Id: 076db296-1014-4401-18c0-08dd287775f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?y6xgiqPfbQK2xWZKdKLr3C7DJEJyQu04p/tz0PmAmVSWfTblQmaY+LXgUqdW?=
 =?us-ascii?Q?oIwF/mSCt5uT4ZiY0EoMm8uXdf6o7euNMZl+2cYvV9Jh1DnsnXCSTSouKKWo?=
 =?us-ascii?Q?jnlMHmQh87+mrUoW6W7GbDb8sdotheUWMQGHNAWN54WOd8WwGqINOz+p/qQr?=
 =?us-ascii?Q?tiamuyukN02JKOFjKGqP5nZ+Jw3aVrqH1BG82f06XqT7JAjPaR7wP4uyUT7d?=
 =?us-ascii?Q?l9OcTpS1DRO9f1XYxsbWgo0/H0lxm+7Lr4xZf5pSBp1YaMlZBcZEBTjFFSC4?=
 =?us-ascii?Q?dWW9gFiMKGILUbABGnaXQmWqbBteSF2qJRBS5gu+N2jnsDfmKNEUY6grgj/B?=
 =?us-ascii?Q?EI1COz7ZTJ9GR+yi/nGjqoBsumHxkTP46Hii3tzeX0wmEMlpiI8cZpj/Gubn?=
 =?us-ascii?Q?e4+CmQmnEnDbyX/j+RfDDR7Hh7lRXrIIFk54zNEMNadHCijSw6inElA2+A8X?=
 =?us-ascii?Q?soRbZcX6g+MZjmx8VrcKp/BEtqMRWKz6w+7xUApoOL71IZ1+OFkUyga7gxuT?=
 =?us-ascii?Q?Fm3lVM8bQSZX16RpKHsCSCHgdLVINrzcNo4zxV6PYcqyDAsubFaf8VrCke9D?=
 =?us-ascii?Q?VtTtEXtQpToAoMTNumu1CJpIjLAWXXbxadr3Chvlp12KmnqaQxxp6bdJenJi?=
 =?us-ascii?Q?6oBWf5Aul8hNMWdyGOJtXgH1t1CxuEwDed9hg52vKWbirainm7teqmUaWo7a?=
 =?us-ascii?Q?qvgB7eL+4Urf7BTJPQywep4DaRQ8irYZGQ11HkE1mHECNpY1TWSSM2Glm2/p?=
 =?us-ascii?Q?hPoP17/AnT9oI7FdVJHz+eb2hNc8wyjOBNU9CBnQAuPo3yANCwdqSgONh4Hi?=
 =?us-ascii?Q?2Y7IrS93NkAR4OZg9bFHSFNDbt35DJwCNmsQ8Mq5OWuHya4QYJ1oN1kqxNlp?=
 =?us-ascii?Q?IfQDHmWcP5LXHVH4xlfEzU34J8lwOf2pHMnyKzYkGtf8mElN163N6bn6/i4e?=
 =?us-ascii?Q?jZ0iSNqoqvHgic4qBXnfQOtgluYv9CP6vAH+E0hxwDpXsBgmSDqQhN/VAOoa?=
 =?us-ascii?Q?+U/2N8oUvjyzIxQf1/6SL/O0JzhUYMug55rzhIhMuO40IvQPy/sdMbH6zyTC?=
 =?us-ascii?Q?+EeP9NQ/1GW1lk6rNKa9AAa/UcO1DuDrrODVS+D5oKecLCIibtIewYoPBkL5?=
 =?us-ascii?Q?c6QYitAQp8V9Fji/11hMTtxrQQH0K3WDhLtNyEwljzn3+V0Z0Al/f2RbjvC6?=
 =?us-ascii?Q?e5tvs2Eu8TNSZz+AJNYYuI3CjT6wEONTtGSBunC1y/27nvmQwQIw4EU6Rwg2?=
 =?us-ascii?Q?EPBP22pyFYsJRWy+JVO3BPvZOg4oGKMxmvvstvqe9Oaf+RknC/3lVfTZag6f?=
 =?us-ascii?Q?mhRmrq+wizFa1hy8xCpFUHaY5WfYt9tNsOc3b0oRlOoOKsFRDRvMlC+j2eLb?=
 =?us-ascii?Q?QmSTDDyZ2RX2apIHqIYL44NbKqyo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7046.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XCU97mHUU47i0Y2UahMrpwOxdUy1m4lsSKuuJXxKqFwkm2EHzTuxYSw4K059?=
 =?us-ascii?Q?MWFQ5i7pyBllKZP4BMfxkKxQrWPu1FszBsPoFIkk4Nl529avlyGbbfauD06I?=
 =?us-ascii?Q?bIVGFq7cOCYPg4s6+mq4Fw47atpR+dwGnFcYdoRvZlHzz6uwx6vOUwjGkaIi?=
 =?us-ascii?Q?nvNu3EZMHy8rwZjr9G0Qt545sUIlvXB03QNV6FTepKIwTrQWxfT8zqwJJi90?=
 =?us-ascii?Q?MO9WQogHR9mSFrYFT9ro9Nt4T8/+7nBUfYI+pQ2zDfKrSd5+l3wHJ28D9C/l?=
 =?us-ascii?Q?ZRYHO1NxAGZWLKkMr208tA2Ms8i/voZ/MeqAze4+uz9Jago4MtIH4NbvAa1D?=
 =?us-ascii?Q?M30q78nQux5B5m7L2ssR3b/hQR9btYo4gk5RAGMWbrnf8yEL6bBzy9q/93iX?=
 =?us-ascii?Q?jhiFU2QYFwDcJROm9lhq6YM3xXt9QkggyQWI8GCbDEF6CZo1CO7wc1k1pzkS?=
 =?us-ascii?Q?y/4Z5Sn42UoooM68PIQlOs6izu49YOUnzaW4F8joDyaVizpLEqfJP8xDzlJ9?=
 =?us-ascii?Q?Y2ImXJQP/L+MDocclfXSjFWDH0kbFI7ZweK7PkKMz39Gih9FGoxgW9V3xJvB?=
 =?us-ascii?Q?8NqrFmW8eHIC26Q7JMtD1zLLdjD6Ro010HWdGCQObVpXdF/czOHzvA02oPpN?=
 =?us-ascii?Q?p8E2dcV27W/z8vHYGMrFP4Y3LLuKmgbOe0GBEPJI40aHF4wZLaoTDnEBZEuH?=
 =?us-ascii?Q?TV+uubBI2kqMk7YHdKXrfD7H+WcALjX/hPp3YN0noEQ6tCBiX65p7YdxZ8hW?=
 =?us-ascii?Q?w9MjieD6Lm6x8A6ixf4ZCpMch/Xb3TmuDMG9eyMRgOeDL1vlvI4mll3R9Los?=
 =?us-ascii?Q?4ksCu6+IZVfDJN9IWDYGp56FO48FgEmRB/39jL5zQf+gwoznF5rwDHqPBKVH?=
 =?us-ascii?Q?FiQQKyJrHDMnjf7lQ7z9VsfMr1pIh2FxVBLd2nXFm/iJe1NdLKRH79kyoUnr?=
 =?us-ascii?Q?cBdMY+ebLv/ynjCuZZncjeIO4OwiSXjqdrvG2BssbTZx7mtJmYSPn2fHKTkR?=
 =?us-ascii?Q?9nQWUcVt9f34rJHFNUP/vhFygAAiGsUeVRnAfMVmnrS8GIQC7tGdysxXH0Q5?=
 =?us-ascii?Q?BeIaxOx8tKzTxH738fhJnvW9baxJqeFwt/RJksz6JCbOzqhJ8KMC7cwKtFbF?=
 =?us-ascii?Q?YVIw0yZWF/lsOY1gwdBpLG8f8byCN19587BLjZtku9jIVRJ57vZ97XBqUIHp?=
 =?us-ascii?Q?DUhKfZRYS8xFOze3iamq0Q34tAcDgcnnbuya80ST67IRakZmdYLXWLcsADpR?=
 =?us-ascii?Q?mgjICZSCft9kyNJgJFW9NESSzo1bT1jqHS7bHWW7Bf17Y5Wzx14bHVRZPtQR?=
 =?us-ascii?Q?31etHwprgao2hwj0yGSOK1bQmH/Qr38ohuCc36v/u0VxWEEyDZKCV9/n3KFF?=
 =?us-ascii?Q?EGWVm1rpUy2ZE0oNtNlejHiWczAzyPtgeYfU90JzdGhbOxHLbHjeKpNliT7A?=
 =?us-ascii?Q?6WDyOZsrbWdYDQ3FCQ135WNj8IkOkDLoPFVC9rFTnMRXILh2RNe2Rm8TmtEx?=
 =?us-ascii?Q?45aQBNpuPZSVKsxTM2tg0BY/3w/8PDJQ9No3zblCuewGS3cch+hi+Ss4TOL9?=
 =?us-ascii?Q?6n9x00P49W7H/sqBf9i3T1vBJxf+4HDBgEbOZ+yi?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 076db296-1014-4401-18c0-08dd287775f5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2024 02:12:50.3519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S7Sx4Uu1DYM0q42WUEDuHAfN74++AOK90+gwDqFJo+vi2k2YdubxAtzOWj9f1/521NwJNaHQ/IGz4jNOROXYzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9821
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_181258_266693_870537E2 
X-CRM114-Status: GOOD (  13.55  )
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
v8:
* No change.

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


