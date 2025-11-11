Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF57CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 14:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D9PvuG8wQq+wwgY2Z6CKpr9vIJIsacXAL3vmiUmjcIw=; b=w9QyyXPZDAhurwCdFfR85AGaEj
	I5xADszXFMKRL0aEuTXnRC53jmfa/3Z5HSuaNecf6DpDB1ybyEO4LtAdNqOIvIzmuwdGkIQxNBFn9
	7c7h5l7DawzqF5p/6YKrHY5TdPqf8ahFeO1RaS/JiahfxStTPSxrhbavWD/t1gsaQ9XM40eJph7qD
	y+sbbryxsrtlMkbkEPZ+HVQjNgxySJYSwdU/Ej22ymyY4wtV1v+zDQ3whQlhVQs0UyG37k9uG93oL
	VcHuXrl9uDmj3dYYUA84QIJOTT4DK6GwvqBUZHtLL9C+e+M5IHeZBrxVoc1ec/KTyU7Rkiohq1kyt
	8Wl/lAhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIpS7-00000007KHz-2kJr;
	Tue, 11 Nov 2025 14:34:35 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIpS4-00000007KGj-0xHi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 14:34:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dW7vVka0Ys/2AMXtEgm2FL8XLzNdeGRDPG1wibDU+EI2PXNAg+gtBMrX3jDQJVDwKYSQxadOgle2cr9YmRbOo87pBirYebITeNXJvQtJlAc25I0TmZGR+zS1VPFti+ETqRIUMHUAKt4XuLiKbDLnbiv18GCXkWEpv4K3tOZwaFjyXJx+6BOQuZoANrOu4bgA/WXdOA8a7HSUxFMC+SbX6ju+c0iMyDLZZFEbw3LuAr8DVGz5zTsyM77d19SqMaDNtagsAve41sClypB6Y6d/wWPvucR9xzkpohNlPzRqxjqmnsueLEMiaBvSsOvN64wWcNXXcAunUuBB7zZ8AjuDxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D9PvuG8wQq+wwgY2Z6CKpr9vIJIsacXAL3vmiUmjcIw=;
 b=py8HHHFFLmEYqw3At1ntpVAs8FEeN2Cm6SMZKsO4BR+RuAAL8DwcqrhFjxDORA3hG83FA2YgVmhou25CPmTsPYFqSZNKAF8IGWrp/QaUjp5N03z34M5TgxV71jRj1EFFekWK3pqKSmyzvVHqDD8TjO8AAy40g+8E9punBlOiPjtMyNc1JJW/YoT3BNQ7ZLrFZ3viYmyfILU7Oq32a0uAdvFyEdgxV2XwO/Kw12uNIwM5WM14k+ou+v4/HEAHLrOZn1+1FQt12kpXs4c3FsXmtPkGEhQIDc7g+TakaVgtcFmLvgbT+3njHbPmXFSQwrY1ERWloZqZPqJJbiT+MQh/8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=kernel.org smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D9PvuG8wQq+wwgY2Z6CKpr9vIJIsacXAL3vmiUmjcIw=;
 b=NwQSVguSpGEmbg86g7/mQuxq7MnyiNPZrWKmM23iyp943I8BQx4C9xsyH1M8JICqmOXZzxS5hkIpS6fLJ7ut4jXP/d4DTlWtRdrp9lIcBsUuqlW+SISaytDmupp9GfLTajmcBAMR9fxe+inUHNcWhbjN3kKZFh80copInJ26IoJThTFWcAHkx+n3BrO3hxnCXloiH9R1ryzAeRLG3fIt2gJ2EcxBQegCHyS5+r1S400xc/iLmV2iG/xcn0mKoJJdN7Ew2hM3oe+6HUX1avsVmXJDuF/s9/cExl0GuBn9snKAmfJ97jmFJJYAQFXuvxTGJtkLWg1gNRd/KxzlGT49gg==
Received: from AM0PR02CA0139.eurprd02.prod.outlook.com (2603:10a6:20b:28d::6)
 by PA1PPF497BDD234.EURP195.PROD.OUTLOOK.COM (2603:10a6:108:1::1cf) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 14:34:23 +0000
Received: from AMS0EPF000001B7.eurprd05.prod.outlook.com
 (2603:10a6:20b:28d:cafe::e5) by AM0PR02CA0139.outlook.office365.com
 (2603:10a6:20b:28d::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.15 via Frontend Transport; Tue,
 11 Nov 2025 14:34:23 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AMS0EPF000001B7.mail.protection.outlook.com (10.167.16.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Tue, 11 Nov 2025 14:34:22 +0000
Received: from llp-varakala.phytec.de (172.25.32.223) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 11 Nov
 2025 15:34:22 +0100
From: Yashwanth Varakala <y.varakala@phytec.de>
To: <shawnguo@kernel.org>, <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
	<festevam@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<upstream@lists.phytec.de>, <peng.fan@nxp.com>, <y.varakala@phytec.de>
Subject: [PATCH 0/2] Add and Update display overlays for libra
Date: Tue, 11 Nov 2025 15:34:05 +0100
Message-ID: <20251111143407.24657-1-y.varakala@phytec.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.32.223]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B7:EE_|PA1PPF497BDD234:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f9706dc-46c1-410c-4add-08de212f683f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SlMr+d3bEvlr9D4rb4uejMz/A5xLaFl7b/cFtYLaZfVT/n1c28rrWt9yl1f8?=
 =?us-ascii?Q?K7AzPtQDQZyroGug61g17AjxqpHSTZhzOsG3g3KK4gt+G+ZbCPAb/Xu987Xo?=
 =?us-ascii?Q?ELwU7PM6O1DH/T9+bfNH6MuVvp+bA5bTU/3FAaBgKhwb4i/hBJZBNV5R2Exf?=
 =?us-ascii?Q?cEX11maSAkIvrsIaYCF4kNVh0WJAR4YUaD+7aW2DQbKYPAwEtujP4B8qrHGj?=
 =?us-ascii?Q?fnLpmQk4Ii92pH4SoX3DskljCpm9MVApHfG6i5NZbm73ZkXNJR8ARztjbobv?=
 =?us-ascii?Q?Ff3qC2MgkVtFdYg1gi/Z7cYs0UL/8scxYye+FPZOxsYkT8CtkKbAUnj4toTe?=
 =?us-ascii?Q?pYh4t2GU9FWVm7xtMQIUFopCWyRKhONs0zIoBmW2Ml6ZI3J9zlTxjKDE4lxX?=
 =?us-ascii?Q?imjxbusS4hEG+DPEJCNSsL1qeleKpzVyBacrtRkjWclEpfLv3JJC0hXtBvgg?=
 =?us-ascii?Q?hf3aXLq0XqXxnRMh0d4XT5WVzd3k97p0dbYC4T2Os74KaVsW+FChkjRhBZB1?=
 =?us-ascii?Q?8PNGvjhxT72P2MVu213/9kZwr0RMwOC/JbypYKdLPlqVLnzqJ7v0WFtimzJs?=
 =?us-ascii?Q?vUhwj2ruMM4xRFUu2zsWyHXQvruAnJVnR700A9KBWoGJu8OxTJpx+ynLzqK+?=
 =?us-ascii?Q?cP/MOjH5cdVgj1V4DuQywBQrXE9ScHXtmkRGMvit0kd3x9XhAImrsTnH08ip?=
 =?us-ascii?Q?h4aMwy8iNp5D2CaH0HYMdrj+sj7VUd77MdY00utIoML6Y/AnGeItjOcMkS2G?=
 =?us-ascii?Q?herjSvuH2/zoLcnua6rNnBDkhMmQZdqgj3FvjcP3koYO1mIHdWI0KqcBuPCl?=
 =?us-ascii?Q?IvWHIHTOX8TfmhPlHd5gcd2HgoNQr2iGCxA/UQlAZjtnlJ42KZBx07bog3bY?=
 =?us-ascii?Q?p62rR6LFsxs20/wOctpjL+ZjEH8pO078VFgIMelQQdO2ic5+NTzChFzfje3E?=
 =?us-ascii?Q?GPgWVgig2k92ufnqy1at7BOAlSZWzMkPN0oJFsoupCkXCHwPG77akRA1UacG?=
 =?us-ascii?Q?5kCKp7t+BuK9pjQhNfPNErjLamO13wowIUNrDVqxaK5pLAErvM0K2ces39LZ?=
 =?us-ascii?Q?hAmvqkLdia764kBw/43grTWF863r7SZf0NsIGVvVfV1Ky8Yk1LLZ8ra47hso?=
 =?us-ascii?Q?5RpqHeZVLOIi5e22JxfXPF2ldGr5aRu2zqFvn5OLhjOz0x5EJepGSi0n2OmP?=
 =?us-ascii?Q?TLcovd2V5jJCfEgeZuhp+0k+QD2A3DodMMvoP/Oi7lRtTmJ9g9noCzygDIiG?=
 =?us-ascii?Q?LOkRQV/nTWeDPbSmX8WeI66IHzDWSo4i9m56xnRP3Rmfl5MAKNOdgZKCU8H+?=
 =?us-ascii?Q?ocX/HcndzY9fXmxlqhsUgGzmC8oNPa/ctthzMxo9IXr5X9t0zR6NqMAQ2V3D?=
 =?us-ascii?Q?XST1kzUsxIVZyCSD3ii2i5x5ibrN+fupw4aIYPJB5l/W/Rt1LCA+lhU1iKMe?=
 =?us-ascii?Q?r/xKj7rKezRQ0A+EYEh0pgBC6UN+SDRAHM20/Tcwig3AEyZ/XLaSgE0Vc2mL?=
 =?us-ascii?Q?79fHcwZwtgDJcT1AH38xkkrhrtwyTgloQLOb2gcklbLK783yKZpYlDKj9jJF?=
 =?us-ascii?Q?Z5wVI9sdC//5+upRBNc=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 14:34:22.8915
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f9706dc-46c1-410c-4add-08de212f683f
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001B7.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PPF497BDD234
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_063432_573788_FA78C048 
X-CRM114-Status: UNSURE (   8.56  )
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

Add ph128800t006-zhc01 multimedia dispaly overlay for the onboard imx8mp
libra. Update panel node naming style in etml1010g3dra onboard dispaly
overlay.

Also add the PEB-AV-10 expansion board overlay that can support audio
without the display.

Update panel and backlight node naming style of the i.MX8MP Libra RDK
devicetree.

Yashwanth Varakala (2):
  arm64: dts: imx8mp libra: add and update display overlays
  arm64: dts: imx8mp libra: add peb-av-10 expansion board overlay

 arch/arm64/boot/dts/freescale/Makefile        |  11 +-
 ...8mp-libra-rdk-fpsc-lvds-etml1010g3dra.dtso |   2 +-
 .../imx8mp-libra-rdk-fpsc-lvds-peb-av-10.dtsi | 196 ++++++++++++++++++
 .../imx8mp-libra-rdk-fpsc-lvds-peb-av-10.dtso |   9 +
 ...ibra-rdk-fpsc-lvds-ph128800t006-zhc01.dtso |  44 ++++
 .../dts/freescale/imx8mp-libra-rdk-fpsc.dts   |   4 +-
 6 files changed, 261 insertions(+), 5 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc-lvds-peb-av-10.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc-lvds-peb-av-10.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc-lvds-ph128800t006-zhc01.dtso

--
2.34.1


