Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88E1CCD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 02:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sXycU8aB+IeLgYk6NarTMIjJWMgo0K5o9nfzH85MrcE=; b=SjdWW7GDhQP062KaxmK4RlZd4J
	JV2WR2BFsdjkERjK2mOH8sVS9VVe8RnGM2aCeQSsxvytH1Xv9s09ZlnjzuKFiexZrm+fkLoUsXkSp
	tGAYJkveH2eWnV0RoRHLnbeG/L2haPqGJhDQoaB0/PGu/fuseGQmwtutWr0VtchLP6gr70qT7m3s+
	FNRAr3U/tEaAcZX2oUIv1kuhFePBrsa2FkRjXEWd+JDNOnVhnyqvhl8pm0PMBb1mTiu/SACTxYXLg
	dLCm7Hb7zR0DIf3AmvkHQ3qy6MBK+O76N01dTDbTvvPr3hx3Ba8d777QQDsamnaUZpS3/6oUSp/rz
	8ijq75OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMzen-00000000xnN-24ox;
	Wed, 13 May 2026 02:49:09 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMzek-00000000xlg-1CfE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 02:49:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JrBdf40Sw2WehN3M8JFGLmZSRjwg0ryasjIJjQIAGP6y96WbD1FmCB71kSLBNuP4P3jeRsGXwCJz7ny6FLGsfOJuHXE8pBxC29uR5WrN2ZLAgxEGI+JmxjOfUmZD2W3OsIHdlDVdu5jo1VZW4nrMqdy/6Q7bZ90vzsBErVywc2IM5u7aeOJ2axPnRgBxttDeZwc74bTImPgHoe10LfteYz49+tTU/DSSLiOylxB72sWpQBvqFT/Ko6BJ0t4OQRa8uEKNSc3oIM8a8XMs1KSxzDZ5one3tYxk511WgyEiW2n+pXU3ehofpY+snjuNhPVc6Zdqs6aHQ2XpyxmfLn7PxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sXycU8aB+IeLgYk6NarTMIjJWMgo0K5o9nfzH85MrcE=;
 b=olgw8+fYtyFdZ+ueH76a6x/gBbo65T5l19lXpwqAPpgMs27PoSdU+V9/WanNeCeCyhMFp+omtmsvUW2BnoY7XKZS/WaPSV0ujRyl/c3AkO39r7Wa6lDqIBE2tyMfYSOTg9//dHwr4aEKtnLqHUKz5+rKMKkg8vVEbxtaT+y/FeUpNO2J//Q/gqep8cwbP+N85tcgN/0TNlPBipUHHcKe3/7sGkHmtnwz2rocxH65W+Xpfz1AIfgNvcpcCYFt95tOLs5LndVKueR6ZUswRgdAFY8z0ZapyQu74jfsUJXjm9lUMSuWNtQzHZzuFPEdI96Lj69hZDcm2Y8owJjNuj1BvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sXycU8aB+IeLgYk6NarTMIjJWMgo0K5o9nfzH85MrcE=;
 b=oKEa1s9jm7BeQmKVXM/u0ssKkhBgtvLSGRnQEvE4ueGm+Iq1DxWS9Ncq6qvCZFmv7caBw9s0pfSLn6V+qoeGnS6dVc7hUYWjLoPg2XqmytVRvPVOFuXm0yU4+u+MZdpR6sxqsH6R9M2dMW9s9lnjkevu3VY1NqXoT7hOmf82k1V3FX2XuvONrHkFd40IbJGtaMi98xePFtrn5YBptL0RFjJg4uIlxyUI6CBdvKOG41hc5VZy2IwhE/VgMFrGjvwNAlFlm7ZltTSSsUs8qK62h7QtWEaC/MSqj+BKbWTUgnmcgYRXOaNquf1zAELHhU5oj1IMS9b/FMR6SkRvmP3Xdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12008.eurprd04.prod.outlook.com
 (2603:10a6:800:317::15) by DB9PR04MB9867.eurprd04.prod.outlook.com
 (2603:10a6:10:4c0::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 02:49:04 +0000
Received: from VI0PR04MB12008.eurprd04.prod.outlook.com
 ([fe80::3e42:1e5:5955:d68a]) by VI0PR04MB12008.eurprd04.prod.outlook.com
 ([fe80::3e42:1e5:5955:d68a%5]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 02:49:04 +0000
From: Richard Zhu <hongxing.zhu@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	bhelgaas@google.com,
	frank.li@nxp.com,
	l.stach@pengutronix.de,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v4 1/3] dt-bindings: PCI: imx6q-pcie: Add intr, aer and pme interrupts
Date: Wed, 13 May 2026 10:50:59 +0800
Message-Id: <20260513025101.1498104-2-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260513025101.1498104-1-hongxing.zhu@nxp.com>
References: <20260513025101.1498104-1-hongxing.zhu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0009.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::18) To VI0PR04MB12008.eurprd04.prod.outlook.com
 (2603:10a6:800:317::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12008:EE_|DB9PR04MB9867:EE_
X-MS-Office365-Filtering-Correlation-Id: d9da3099-4ed1-4187-3d7a-08deb09a31d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|19092799006|921020|38350700014|11063799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: K4iyeIhVq1xOEG2cgjikxn9ri0KkWN3LbjTfdaWfpU6LjXEVN1cJoQw+P7mMGjtUj2Y1H4a30ht/9SWBR9Dw+SLhDb2qBSMt6mhWwk7LOuYhg/JTOJpuxdHVT3X5aFNgVTbtHnXnmeAoq9HJ7IreSuJypQ4tb/zf2w/XVJDaUa7WWQHHnYgNTMMRyAGbH12m/V3oSIwX6SF8bqUTs7gXAXiaSxuO7fpytNdP+g904dl++3uxel4Dev4e/0Xuu6HN2uCshdb3tKaq/ckHJgfKGjPYfx2bPW7+PfkW7fbmdqKmUvetGPfPMhqRf6q/Y4j/RApulv2DiH62HmZ8sIgGRrwvUQw2H1VD48A3Uv83806JDbRbmlimoo/QhmpWTJns3dboIJI024Tb9ik8VCWI4KyFAD+xDZgDzOuAPVNSQUVGgvMw0C1YUbn4pdhovHavurb4ZUG2gzKlDFWQ8bQJwcBzY/eIET7MuzAk+IewiBu7Ce5kVFMq5uvGohI1ONuovwP0ql4JjDEbpO/ivFr0N67X+wkFN7zhPP/3+xou2Yx8T7Mk4SI6uPWHV/FkP9xl6Kbn/nb8x31Rh5IHzzEXCOBxGUthn5Qu9g210X49qypPeKO532oXfmcP1NxfjNe3qf5rQWsMxB6yi8IxgnJH9ePi7gh+P/7doA+lSLe7rU46X8lhNI0iek3rciCelJouBQL38Md7OBihLjoBvvv3X2KQsmKmItSv22vPgTUOvsuuL7Iy8T8L9PZWuXIUUX5i2S3d9d5skLQIsHbYgsEtug==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12008.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(19092799006)(921020)(38350700014)(11063799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lxF1dnaV0Pn5QI/KVpZvAtlUsxcUNWrCUWDci1fDnoIdyigJiu3+t/bwzzya?=
 =?us-ascii?Q?XFeBUy+E3c4hP42QbmUNRvtVX6nqIzdgcD4KEGtsfgccCkwTEz6ff4CjFCb3?=
 =?us-ascii?Q?ffTrxjWPldzMo13xKUxFavYukuODxqxBGyu9knUdX0+445i3dMF56AQGO71W?=
 =?us-ascii?Q?Ox9lVG5pIzybzXoh+9PLQlx12I25N9Q96DKs4mpCAL81HPNarD/mqvpd4MBB?=
 =?us-ascii?Q?BtxR2iXutl8WJEZACRRlXwGSbY3U5dxjbj9tMcxTSAOcGW1hoDxQxVvQiHPm?=
 =?us-ascii?Q?Ty93X6bJFMhaSJPFHMaHj8CJRAIGNVvvS4wzgGUuH8zW+gYjSrtBr0qra4NG?=
 =?us-ascii?Q?m2LxqSBw4A6NTRVsYdPMLXrcpQ/YakpqRCfT3pPaxtdIUhQvUJyS42SOx4HE?=
 =?us-ascii?Q?47QhJGFRPIVCtpGmWsk1WSWpMXIERGJxmAY9M0d22pqdk4bfx3JljBa+ez4f?=
 =?us-ascii?Q?Ch5wMMMnBk8d9M6maj4zqMo7CFq/4ve5BbsUa7bsQ+4wHz3UW6+12g6hWl90?=
 =?us-ascii?Q?JSDEvm4/HhMc96MtrMUO+FnuPHx3AAi23PPN9I4YER+gS2ZPn5nB6DvpBpKS?=
 =?us-ascii?Q?Jec5szXqDbLHULegf4JFw/ST0oGGzgldTsZoaZ/RRys8H0lMhUgPUGOXq5q0?=
 =?us-ascii?Q?D8OQ4tXy4jMb1oFZOo5T/PWJ/opaIzKKzlHBxbvgzXDg1YN50R2EcXluJ8+O?=
 =?us-ascii?Q?xOSkwnEoTLTfZFpi9yha3kxKJrOtV+zHfudZaqhleJfnOucrznbP+RLILdMo?=
 =?us-ascii?Q?NjgO7bV7C/Mmr+IYrPzjJTHtkw2rsUHFB3zJsJMTut4te+Vztu7jHEIw6QGs?=
 =?us-ascii?Q?WxH9poo3GwoykafpDfHQLat226cE91cUvJ2V2uyvJdJkaZkucYxnXOekvSxL?=
 =?us-ascii?Q?SSAcGsKKuAIKwT0FdbbF6VWfgJdfKfMDt5oqaSSlXCoKUm/Iq8Aw7kTAtGnx?=
 =?us-ascii?Q?RrfZkupQ8eit2w5B8cnQY5mwRa57T/HHJcLYcRviYRK2JJeovclZqY/C9seZ?=
 =?us-ascii?Q?ROX4wrqEBPGJLy1DuOrK6jgddK7cKeO2Aseawr3RiRWyR3P9q4OVVtjAYZtc?=
 =?us-ascii?Q?/LTJjaRNC5wPYXbH+AaMN4zUlNwhas2TV43zwxgRH5h7OZflvHP6TTeNO14r?=
 =?us-ascii?Q?GGrCDp+1zwj/rmYtkiuAtOjKBs7FfyWrPOs15BZQ5sOgbQzLZqMVeqhh2X4r?=
 =?us-ascii?Q?FH9Z/79CU9xgqnucuQP5aWecXjMvds1jycIAJX/ZizzlpGAUjhye+MSZ+Kv+?=
 =?us-ascii?Q?ICLTzY2XgEUYQiUmfgTzmzVR0g+Y7rMsUZ6U3Oc77prLBzQgtoAs2csUS+iX?=
 =?us-ascii?Q?yKHsxalul1hcjVyULKiBH04mZFnbphaJoUokxMCoqWovOEp2DtMw0cjpdSlu?=
 =?us-ascii?Q?17sEc44lFbYQFwtLQSzNSjPwD66lgvhtinZU+ljb1rK33fLUoLbor/Ug0LnS?=
 =?us-ascii?Q?Uz6WzWYKpupb/XAqgst7UxEyxCD0+hxj/kpCTr+kWWXPzJOYQZ27c+5ppKx7?=
 =?us-ascii?Q?YeNak9W0o1oz293c44l4y9s6NUUl3tt6RGE5L+5NTv7tjtn36CGWu0EbWpaz?=
 =?us-ascii?Q?47OdbrP2F3A658r9WPXbPl09FEbF09yPPq5kTTc47pleCnI89+rfCGok73ht?=
 =?us-ascii?Q?xHwyxDMP5vMAv11dnTRi/aguFSDhacahTm8rPzn9ELurbM5sit3i5tul8KNT?=
 =?us-ascii?Q?py2fc9gz3iHq2TIKEvzNVEC031X65vkN1wuFA2UMSRD7Kh/ghjqyGCu7uz9a?=
 =?us-ascii?Q?gul1T8QHYQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9da3099-4ed1-4187-3d7a-08deb09a31d5
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12008.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 02:49:04.1989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gVu3eXbu7e48Bo3Rccm5yItCe7V4zvFoWZsZt8Pb5BvxitDyzz0u85XMQoSiOQrisfCOH97M+eJbBE/8Xq1DRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9867
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_194906_326341_4B7D3430 
X-CRM114-Status: UNSURE (   9.34  )
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

Add optional interrupt entries to the i.MX6Q PCIe binding to support
event-based interrupt handling:

- intr: General controller events and link state changes
- aer: Advanced Error Reporting events
- pme: Power Management Events

These interrupts enable proper handling of AER, PME, and other
controller-specific events when supported by the hardware.

Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
index 9d1349855b42..cf709132ff1e 100644
--- a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
@@ -58,12 +58,18 @@ properties:
     items:
       - description: builtin MSI controller.
       - description: builtin DMA controller.
+      - description: PCIe event interrupt.
+      - description: builtin AER SPI standalone interrupt line.
+      - description: builtin PME SPI standalone interrupt line.
 
   interrupt-names:
     minItems: 1
     items:
       - const: msi
       - const: dma
+      - const: intr
+      - const: aer
+      - const: pme
 
   reset-gpio:
     description: Should specify the GPIO for controlling the PCI bus device

base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
prerequisite-patch-id: b47e314ffa7c4d406797ecd88b943068a814fb9e
prerequisite-patch-id: af0a125aaa64bd3f6fcf55825d967ad6c4339716
prerequisite-patch-id: 6f434b1e2c82ec8da9b502c4287171babc53dcaf
prerequisite-patch-id: 9c6e0e10a650652f14a346a9f0ff824d53c530d1
prerequisite-patch-id: 0bddec7b62daafe2877ca92766d8b35e8c41dfe1
prerequisite-patch-id: 277480331fcb80aeee5848afa1eee4532c4a1646
prerequisite-patch-id: 9ce151e05ca8ff8e66e3b2ef37114c89dae9dbea
-- 
2.37.1


