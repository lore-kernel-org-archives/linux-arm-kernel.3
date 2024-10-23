Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 458F1CFA466
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 20:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XdGFQlJgqaz6ZKv4/Hh+un6TVzl+St19XAqPrHnDz4w=; b=u33E4rWqaYtGVy1dKet0hE+fl+
	9wTfL/j0mJy8orrasV5nIUZ4Y3+CIclnqQW44Ni6o8G9iB6rYYhpqkYhaFbXGSo1pgzS0oJ0spyu5
	Wp1FeP2VOlgMWep9OK7glCXODTqsH4z8l04V+dt2IOKTsQFI2AUWyaFLku0ZS4flKK73y4XIZV9yR
	HUMEaFx63ygFvpNsz889kD7YiDuKvfIlEhR+T4TdQ48lyqHFcEUKODOpXrBHwox7zENZW+qS78yy/
	vhjOO83n7sSi/7qiDneh367DF6P/Zc82BLu73h3hq7MSL9SHNZTNCNPOjUTe747Fg4/Y8nsMMcxh+
	nF6xUnnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3hqo-0000000FogS-1Lw7;
	Wed, 23 Oct 2024 20:21:02 +0000
Received: from mail-vi1eur02on20614.outbound.protection.outlook.com ([2a01:111:f403:2607::614] helo=EUR02-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3hhu-0000000FnF6-2Q9V
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 20:11:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lFlJ4mPT3o7+PPTkoYGaGevcL30vpqxU1t/TMfKoSqt5gUQc4WEqR5gCPL1Z5nQuGxmESOzewR64QDwcOgIm71EdiT5DuEip/1Stc1FP/Vfyi86cw9DmYQN9Mgl2o9Tj9Ag9P/iRnLT81UU42K1wy9vz6HPfJEm11r9GEM7XJI2Tyj7PONIly5jW1B0xWg9Koi+0jFoQKrD9odugRDkg7x1w+M14AfcT0hC7x7aFrL3aFx9W0M8REqe53rxswDf2vzW8c+ap0CLcUSOd6h/NpL1OaUFBrMmw+B2c3HGynxQUtOzMeA+uL1TRq24UJf6GMidqcK5hUkzTjwjhoQJcEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XdGFQlJgqaz6ZKv4/Hh+un6TVzl+St19XAqPrHnDz4w=;
 b=ZyCiLo8w7E5LJlu005O9yOlcVbi9fT0hwk3N7t+8Ie0X8Zl5VbQ7jlOG68KhBARIw1EFrZN5ZgiaChsG9qYJI6Rqi8thtzaSMR+ai0n/8WxAvGGP7aAoIpJlOxNW/dRlbGFopvvP+86Td11ZiHqmueEyuXTzHx+yToQT7lJa/Gyh/koQjCGgUZrveUL57+u8qlAIktrJ5mpAOTJ5D2d8Nz0/ju4sTSpbuWfe3grBk2jva1SO/7hyBT7hgUVUMt5Vr/gr3nJV6rYh3omBuCTQuuNLC+c4+LL5Jn+MFWy3mfYW2UC6bfNcM3WKuM7NOTrrbGqMKWQxHsT7NSSEvjxirA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XdGFQlJgqaz6ZKv4/Hh+un6TVzl+St19XAqPrHnDz4w=;
 b=h4dY6PKt5JGyOEnCFFN73QulqFSJrcIl4o4wzh4RHOWqFgLlVfuaSo18HN+2uzYj36QC7g/RddbNqC0VSf+N6x31aQy0CgFJBuN+xnIJgIEsDxPSBmgGb9Zf0iwomoTFYMJaAk5SxvngdFmyr9JIWtoI5fUTYMXg3iwioNkBbvLUQ+hfgv/ojzdU3l9gCkPnSRi6xnxBAW/l0EpalWW7I0wCpYcoPUPHcy5CgYXmzycNbrGe2FHg9D3PxoPTlQJgUz3bFW8mGLghnROWCMj86BSWbo4GIPKQa8TR3+qjNXg75iZSjNHyJW9+6fS5V2A2QGq/0Mx1iy0iyI9LIla7wA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8944.eurprd04.prod.outlook.com (2603:10a6:102:20f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Wed, 23 Oct
 2024 20:11:44 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.8069.024; Wed, 23 Oct 2024
 20:11:44 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE LAYERSCAPE ARM ARCHITECTURE),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v1 1/1] arm64: dts: layerscape: remove en25s64 and only keep jedec,spi-nor compatible string
Date: Wed, 23 Oct 2024 16:11:28 -0400
Message-Id: <20241023201129.1382895-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0056.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::31) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB8944:EE_
X-MS-Office365-Filtering-Correlation-Id: a953ae0d-ca3e-4e07-60d4-08dcf39eea25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8sFkdZL70i0lN+92A3i++Y8CBHF7GS72IQfxchkjXC0FJTWiWoo5o1bkU1t/?=
 =?us-ascii?Q?cdI8EmfZm7CG5go7/GiHSeW9ggcGT+JdHYGl9pL8AxDXPWquY+1Y6K6uGX0Z?=
 =?us-ascii?Q?ZKGZjI0E9g/4bntLQdeYAkkc6u2CCKQM8lDcL5rrDeVb7C0wuoBr1q4DIuje?=
 =?us-ascii?Q?2g4HOTps7sETrayPaBVCiP+fuZWIC0oxfb7wrFHZY/oBfniJ4p0GT2jZMTRa?=
 =?us-ascii?Q?qWcGiSnhOnsOYJtgnfXuYHFu7Ow9GPAEgRkQ0j08m8kGyws3/TrOpNr0Ok1C?=
 =?us-ascii?Q?4hJI+loJdBc1PCTfXMY81CZZEna0ticDrkwunJ/idSOlJ/1evM9EuXGRqT2F?=
 =?us-ascii?Q?uFt/5lLsCXd1QQ+y25fkiNV4SIWAajOSh15U8yexFTseO6LgFp0CK3LWrMg7?=
 =?us-ascii?Q?cEQhlV1AkLy4zYtewbiQqJbyTaQNZXfrZKhW3LPfMyKjI7MyTqKT/66u1zts?=
 =?us-ascii?Q?f6MA6PyObqSnPzJqZHZj+cb62qleEGq1LwBBlVnfANDzlnKuXtiUW09Y1+gr?=
 =?us-ascii?Q?TqxO1+vWHofNyd1GsyjmJLILAFr+biCJ3WOtTCgVCGh89XVIRhi9dSEcd3Kl?=
 =?us-ascii?Q?GhZv+Czxb9mM1mEENfWaQClBus1qDwEFDyErQfvW+QuSE8toG6rQd5YtAYvH?=
 =?us-ascii?Q?s5cF9wx2B3PhHQxFqikOtfcbDDLHEr4CDaO6ZaC7C4q3MHGTrmukM8bLqMtB?=
 =?us-ascii?Q?pozU19s9l7anN1/36AhApjRXh69vl/vbTkuc1Pdspe8HIJMpxThi6fV4i8uV?=
 =?us-ascii?Q?SVv/NGBD4NZr4Zj9S4dtn6pTYoFG6+sdrW9mFcOGg6e1S8DnkT8Fq6Xpm00x?=
 =?us-ascii?Q?f5qqoP3GbPiwT9CGHT9XGPVnfQrSWY01BP5Ev4B+OQOHF+nZIWTnmiKqpQv+?=
 =?us-ascii?Q?XlZ1X6aVK6zBZP5dTeaKVYGo+Yh3ErdGzTENRq97NJ7fsAgRrYWJeeZDlq/D?=
 =?us-ascii?Q?RgOJvovEKctixUqr+VrqQ8XTI4/voDmLGV0IybnO+Cd/Jafp0R6sDsYJIALq?=
 =?us-ascii?Q?RyBy99L1AilW8jl0loA3db0zWDcr3BtLN5o9WwOCWVs6LcS5sVAi08viZAIU?=
 =?us-ascii?Q?A0AR8cWeCR5Z5xaIu+vqMOZ7hoOSj1lWrsTenmi1ju4mL2tJ7P2fe6QN1+bu?=
 =?us-ascii?Q?6L317Iu2xVzuxOjQwZSfnpf+1l3B39khRZlMmbliGv6odPuFe6FYF849sf/N?=
 =?us-ascii?Q?XZhgNd+X3bYj1TvyE7LgCfaRXwyUA0BHP84K3z/KafOCHINSjG5bYPFUNhXp?=
 =?us-ascii?Q?XX8FQ/8mdYkM27G7LiYFnXriuzIdju5Cb1IHuxXTcDMIIwmQxeTKy/aLMLuV?=
 =?us-ascii?Q?liKJ20540jZ3Tt9Ljhhkrweq+Zmpo3Hznl3IqNMPyFjAonfUa2wuocA9R/gX?=
 =?us-ascii?Q?nKkrEws=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Zz0EG4dYh8RRE7HcgKQ5exJQIbWfQSq/QipxG5cBUtPPSf7n8xEddiyS2k1r?=
 =?us-ascii?Q?Ucb+6TSG8K//3B7ohza74/NlTaCMR7CHesWvzCr6J2Vj6yn1FZPZM60UtHEy?=
 =?us-ascii?Q?kKfEMWhnLGxcB05sGUylWCRBa/5t+sPv6E7NeS+2Y7q9Z7/36Hg5/ofUV27Y?=
 =?us-ascii?Q?I/U7fjDaOm/uAP+LAzA2cRxOtDzKZVkQeoyfL6nugAF1Hutq94GU62etbtbv?=
 =?us-ascii?Q?7xTDYNIB6HFNdz8+Kx0pzBqGupRa9fPCXD26c3B1fEowdUnJcTyKyE5AxE3/?=
 =?us-ascii?Q?kp9GVncDvmU/zrZHpSE3UnjPp/LFkHMviV6aceeSqRNgff2XO/oVbLTqjv18?=
 =?us-ascii?Q?JSdEbWMrvd07RJBpEsmPOlGwA/GxQviXCXA4M+IB8Q4ENW3t3dnwAhb3SDYP?=
 =?us-ascii?Q?wUZJsNdJQAtND5MBO1Fj/90vlkbD2EsSNJSXjJXvMvDl/u2PAWQeV1fScxcK?=
 =?us-ascii?Q?NeYXVxL5Ldj8mV70f7i3vRWXtK/PfvnaQtKV2cxv/TmerXJM8x1QvFfPyGlB?=
 =?us-ascii?Q?W/M3TinvTTNJDErtRdfyxqTa8EtCytNp5WvRDtRXpFUjAAIYV2rKDVKBALqi?=
 =?us-ascii?Q?s72jDilf/rL1Id59KSnqsu1YIeabt65FFNWDLVicCbuKjzMqIjb18YT53bUk?=
 =?us-ascii?Q?gOT3MaEUNzc5K8rQfdG+Z0ENr6eBhQs7QfrIrTAERrH55A98NIi8QbqPK+ut?=
 =?us-ascii?Q?zBlKBYndIeGWXeyCmSECdMR+OZ71k2yglxE8r3S6Dk7TKC5d7vdxIU5xzA30?=
 =?us-ascii?Q?kk3efbVjwTBYSUlsWq3QLa54BRQpg26Um5q7GvvXeIU3V4zEtqmM1jIanR0t?=
 =?us-ascii?Q?iYQsh/P6vE5OdXISJPWnr1xqH0YdqsyPEZ+TcwqzHjeYlnDvx+6Uk8JeE2Tw?=
 =?us-ascii?Q?b0fz923JQbF0zGVh4epb6PNUOET2DcaovlnwyR70W+LAPQGqXjh0w5A3iqz8?=
 =?us-ascii?Q?S/rv48Qfp5zKTFyRnLWBi4TtMr0ox3RReaVwPfdm2QjWPx5BnZZNja0v3npg?=
 =?us-ascii?Q?535swPm/feslLU962K5LpixmwZmuIHoLA5rmrOTz+GSmC/HyLATLyC5q5QTb?=
 =?us-ascii?Q?lr47692WVt6dm19VWmZEiZimaGmJ8GMDNiznWdpQUVODfVH6wosX9H0e2R+7?=
 =?us-ascii?Q?+805+3CgibQ0lR+wBqGd4h05ODUP2NE6iA39QxJ6y2HzBC8vG1qjXlMn0TJi?=
 =?us-ascii?Q?ZKsrvMyMxQTtEC5xGoGhjHdCq6TMoLYCReYUhrPEZqVuWyv4sknbbNynQ1Eh?=
 =?us-ascii?Q?d/TozpaAAjZAYoKB5hhOwV7KChUdQFBB43jaNm3k4fZNpx0VOZuSqWFZGejt?=
 =?us-ascii?Q?wiRPb6cjNjVS3IlKDo+L0dQDSzROZjOIIeo6I+cptmXVkaL4hP1X7EBWbywH?=
 =?us-ascii?Q?fNVmdqL3BqT6Kzr54PNlmCX2rqiKunaKEAxyyi191fkcF5gBxJbe0A50WKxC?=
 =?us-ascii?Q?CAiiTBRu8N3VZSGHalYofi8KugqNOzhx08SWHNPNa5nPN8etkAqCTKIUcXzz?=
 =?us-ascii?Q?pnHAM7b3lbbfu38TinEcL0ckuf0cbpTL+E2EVAW4gTuQIjLY7/CP8koxse1n?=
 =?us-ascii?Q?0RnHKyo2XiBidDvMl1+MPNqQxZvw2rxS2GL9TcQa?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a953ae0d-ca3e-4e07-60d4-08dcf39eea25
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 20:11:43.9912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HQMiR1Uwp+IHbFcxggt4E7jV6wpc/4tCtMC8jyKbuGn96SjitIAUkhdzF6n3lU7N8sJUMxnIfap1uEthIN1vow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8944
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_131150_701273_82C59B9E 
X-CRM114-Status: GOOD (  12.99  )
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

In jedec,spi-nor.yaml:
  SPI NOR flashes compatible with the JEDEC SFDP standard or which may be
  identified with the READ ID opcode (0x9F) do not deserve a specific
  compatible. They should instead only be matched against the generic
  "jedec,spi-nor" compatible.

en25s64 already in drivers/mtd/spi-nor/eon.c. So remove it safely and fix
below warning:
  arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dtb: flash@2: compatible: 'oneOf' conditional failed, one must be fixed:
        ['en25s64', 'jedec,spi-nor'] is too long

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dts | 2 +-
 arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dts
index bbdf989058ff7..ce59b94d8c228 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dts
@@ -87,7 +87,7 @@ flash@1 {
 	flash@2 {
 		#address-cells = <1>;
 		#size-cells = <1>;
-		compatible = "en25s64", "jedec,spi-nor";
+		compatible = "jedec,spi-nor";
 		spi-cpol;
 		spi-cpha;
 		reg = <2>;
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
index a1d9102ff32be..736722b58e77f 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
@@ -69,7 +69,7 @@ flash@1 {
 	flash@2 {
 		#address-cells = <1>;
 		#size-cells = <1>;
-		compatible = "en25s64", "jedec,spi-nor";
+		compatible = "jedec,spi-nor";
 		spi-cpol;
 		spi-cpha;
 		reg = <2>;
-- 
2.34.1


