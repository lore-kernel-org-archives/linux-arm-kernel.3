Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35796E9B37D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 13:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qBCrNLp+ZJ46EVLn0EtiM2/MYFlqm/MnvkBxoA8lE7U=; b=JteS3f5VDx8CwNWhYTkjeJzsT0
	EbwnJKnsI0sgeGMJiDFN+3mnf3YSOC3WZck3otSmdiDrEzLHuWMIbipGdx3Jzt26i+QHZbLXpJeKK
	PY4ydhLw53KvyM4IF2UaiO7l7n+VYMjqZrHkY/KE/sXVuDjKgjYmKzHfX6kyo5UgAJW8RPeBPETC1
	tNu7zCRM4GAaes2YeUNHcZpGhmD1nfwr4pjf6XkUKl/XMMx120GbWRJgbMdis5S9kG36diKBgFunr
	ms7P0k2KHizHA2cwQ1V68M1VkytsaLrW54H2SXu9krW9UcIMXy+HoUBh+cCk0PDLnUjiFyBgHn2OG
	O90x9ObA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx3Qy-0000000D7zy-14Ya;
	Mon, 02 Mar 2026 13:35:40 +0000
Received: from mail-swedencentralazon11013035.outbound.protection.outlook.com ([52.101.83.35] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx3Qw-0000000D7yZ-1wIH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 13:35:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b3c65r2ZeNEmyJ5rKCD8IHF/BkwRY2nteIk5uuTN11gEiMEROwnvNEhmbjI+Yr+8Jvc1jxoVLuDjxbWFSO6d3UpOAnx2UHavNg1XD6mnYSWP1yKtES62c67W4T42Ur51hijyvEJP11yi8Omgwbq4h/Y0dR1euYCWDJngj/PeqFD/41T5a89r9k59pPDu2JhEq29RK6KpcdvFV1IL7BkkkxGMRiYRlKZYRdGsu+pp+d2Ko4N/zwJwjOLkqO8jayScXI8wHmBWJffwp/FjX9zQtu/3qT/z/b7984XE5R2jCiDmhxLfEFiEHVPlxIeIe8qOPyr6a2/1FvHHD5m4+7xaZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qBCrNLp+ZJ46EVLn0EtiM2/MYFlqm/MnvkBxoA8lE7U=;
 b=vUOx7tNFJPmbb8VaWITinqn6XlQbPwprV+sZdpOGjGMsidFtxqUgQQ9y9KzPAMFmg+FODtiGNpwSYJm5Pcch5DLtgrPjgrtaZ4W18HvotSPgtPi2JoxJhM1m986mxLc+4lUHX0erJ2+fwCFUwoa0jdQY0LvMcBGTRmu/b/lshIpOJgLPOzWvtUGBoHQzbCg58dSKnsCf/lnMVmY3wzJEimDDohHoh6k+S3fsRK+wIF24yL9z2mLzzN6E6mHs561wHXZzzerD/uCyUEsr8HFsAc9cm1jIJOPZkQPAul4QuGUMVy0oZ3E/6qtKHiCDbGPM6wVrLQCwtw3IFkj5BvHaKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qBCrNLp+ZJ46EVLn0EtiM2/MYFlqm/MnvkBxoA8lE7U=;
 b=Dd6+sUPESkRGE5yj7hJ+BW0W1Q/nzxpouD37r/5PtFsCnsxV+KvgY9WfwIB47rlrQ6b6zZbyPt+s+lrVSqJbhC9g7VaYU2iNjoe60WhV/5vJBN5MdRlK59LgP3GFvmbxyWGwRaQK4TZ2pNyPFnGKwkYw2JWlixhoHG27rjDtxsUz4C7YSSnFTVaWc+m1mjQhEF7qXwQoufq9xPrOPYDzPXeV2QtbCi1HQCSusglk4YeVjMJZBEXs8jT92udTn1e4oCR1WDkd4HO0UXpKrqF1FqER2psmufWIu44jiJiFWTLmjo6hsiym4ZMxGhhcebR0f+PMiZUX7lps1WavTHeCYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by VI0PR04MB10758.eurprd04.prod.outlook.com (2603:10a6:800:25c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 13:35:31 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed%3]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 13:35:31 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: Frank.Li@nxp.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	maudspierings@gocontroll.com,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH v2 0/2] imx8mp-frdm: Enhance code readability
Date: Mon,  2 Mar 2026 15:38:03 +0200
Message-ID: <20260302133806.76191-1-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.45.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P191CA0040.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:657::9) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|VI0PR04MB10758:EE_
X-MS-Office365-Filtering-Correlation-Id: 31be0f7d-3c29-4c08-825b-08de786092be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: qk7xhNT+aCAyYG1pCCPORIfeq2U0qkkgDWMReDqJbI+kyur4X+jzYLlRlPgBLTTpd+tLJYc8enapTp7RE5fFvwxYquEIqwyx9uJ6HryuOwtX5QI9jH72kSWF6P3CpT7tAN2rCs5ijpDSbPEgUDgcl2R52fy/EATcpmlEg2XLSXNwnEDNONhcnuRgOWjCEYMzK7u15tR5BqSOMsHvIl1Mwojfhxa5hxSxVHm4/tK7nloUbArMJvsbbPfKllCrVHKaH1B1CwfsLeGSGG25DF95slvE3yO7x6Da68sXXrrkGVEnNAjKhsY35PFHF6l73KvQ7arrPINQfw7LHgmevcQ12Di+YTQ2FlVueNy8+b/U0IiIPicTNRt2nEpyf/mhtb4NXRxiiBMWKcZ60QkJ3kER+ib4QQr3niMY+FfGcnsJNPGFG5CFy1/3hrKcmS0CkRnJVEr1LWTbiRu4aDAalXTWQRdOFj4O9kxLM7X63QvRqibeHLn+KmjoBVFPX6JJaqZbWxYDm74AIs+5TE+9Hev8L4EcGISz0AA+pspcxJQbgT3/rfFDxPYhobSga2Kfziun+46W9ScxL/qtgYMGvkQgRdaQCDzFowPmYSBsubrYB5b22CUMWxAYh1Zoyjntj6BuS0tMuqo1Yp8/JDhotXtg2q0yIoO9GMYs5m7R4uKsfqFcMroAylC0PDgWcQZW5PT5oVy4M5RmR4MqKMEq2tik/pQF/6Jr+Vbi2VMYHI3YVR92eTZGQL8samcGTNWSucJKk2K77N1NmZc0L076zV3H+4WcApC7Ny86nWOZCYGIIFM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7Lqy3FDmEsNllb2a78st0ltSLF5QLN1nsPSdiYeKYVjdRlklPbM7Xo6ZUUAf?=
 =?us-ascii?Q?WkzZp4orO1JwH4SjjiHXhEM4+WlA8r2FA20KkFV+gfHwrDRX2HA0TB/zAw59?=
 =?us-ascii?Q?xlbwSdX4lSOm1c3bPxVZIBKctmVs22rgphmYhLP8bD07u/U7s0sKZei0FTu7?=
 =?us-ascii?Q?2OyM2lwHI/0qZ/zGe/MajfrA3EY5Rb4gNWAMB84W+kLcSZRSgjbLKL7+Fo8D?=
 =?us-ascii?Q?36VfAfa62UyyaVFQhbCYcoPtCMg/w9+9R7AB+cILb8gFUTS6vmCBXSdPXZvb?=
 =?us-ascii?Q?zTVcnkWby7PUxlRTW41gnC2SEOxTZ5Y/Mp9Fuc5T/46rvoLaSNP+4kDSn7eo?=
 =?us-ascii?Q?WdSbvPwE4VP4efeUjoMbiQ4in5znUvxQSP9kHe3cJEJZ+yB9D5AcdZ6Ohqn1?=
 =?us-ascii?Q?rau3JPKpGcxPnocWz37v4FKYJFL8AMP3z3NamfmKn9rWwGe68xfSz1ZQabgL?=
 =?us-ascii?Q?TmJSrygQAsyqJNb4OFSdBklItNS00bzKkF7Q2GeFzNZwOm0Nu8NKdPwwSIjX?=
 =?us-ascii?Q?UT6D2oCsGSDtiQbkBAnRApPX9zO4T2xBig9ay65wQFEADvcC5ATYBE8m9oQ8?=
 =?us-ascii?Q?xCZyVHI0W50/xIIfv3FOYp4LGiC2DVTP18toihLP2VCI01JhTlrIIYMaRg7/?=
 =?us-ascii?Q?tS54dACfS5+0o7ayXNIFriDc5q5CG5oq8TqBELxD+tkTq8NORd7WTWHIptSt?=
 =?us-ascii?Q?W4IJODun51uSsJj7COu+aZ68czQowauOtY/N9cM8isbpRHVD80k6Tb+DIo/G?=
 =?us-ascii?Q?NdXrgOYU3pUsMYfQl4FPbMJyBHnNRHDTfqcaYcHXxZPIwjzL1t6f56SzQOLX?=
 =?us-ascii?Q?SY9iNISMYAK/JnaDT/p8++vghNtzAV00g6szewj9q6Eewb3g9F0xys/CzjNP?=
 =?us-ascii?Q?7+92PRPQhUh3GEd1Uv6f/m5QzBv+adWJyGTV0X9ElXPLwUpp4Drh2x79+xzg?=
 =?us-ascii?Q?GoPOEnJbn0tp6XQefJ+8t++5Kma6Tki6cP6mS+ZiAwR4OpkWHnKui0SW58MZ?=
 =?us-ascii?Q?17sI9nazfzQj1wzYW8p7DYgqKJo8UF/wVJCw4ps4ZvbViMj5GqYIrbIhCPgl?=
 =?us-ascii?Q?mAkTnGGotPFvuq1EWYfa9lp46Aga1MvWr1CZE4q3T8qQHJScz6fa+8u2EjD4?=
 =?us-ascii?Q?rbTRK3CcA04oq/CYEs9Rb3xY4R7PhAIF1tpU4FIJdjVOcyD05zJVc0au6jAK?=
 =?us-ascii?Q?0DMBExCunC/PnLfAN1rPzv6xV1g95KyujjzgitLRa5wi0WcEJFA/Hef1Tm6p?=
 =?us-ascii?Q?GZ9Q/18tA+OQjoEkkr8qLt8o2bcReZ8dDxMoOC2MzIVhTFt0r4HSe+w0lx1N?=
 =?us-ascii?Q?ayuxpGGeGRl2YdEmcQNHXbBrX07g0x8DuEnKhJz61uIsl9tJPJA306hNc73X?=
 =?us-ascii?Q?kZKfyfG8yqbysmiBF2kJK8/wQdN4DYz2GCkwFrnsHNbz/rmeeW6MKHe7P6d5?=
 =?us-ascii?Q?ccNjZWtxMairRDxq4njiXICC493IpS1n5bVGqkATdpzFjOHZNZdfU1TSbpKI?=
 =?us-ascii?Q?zGtTn5v30zW4O5o7RysGTCBkVxAWhABBEL9X4YChqM64npCZQ5P/50NqdFLz?=
 =?us-ascii?Q?rOyiRqQcuqFQi+EbyB13BzbLImIxDSsQLFRpdbnNHEcJR1UX3+0La1rsrmIF?=
 =?us-ascii?Q?sxNaYDkPTVb84X4+eC0ofOL5DWmd264Nb+YDCkYrFqlmeCLHVQbDdAM2ziYI?=
 =?us-ascii?Q?ku9R3MdDWDeethmBPZoH0fzaH2IQNvjRSguAMKHdeoy+vSfbMzGaEM+kJp/H?=
 =?us-ascii?Q?Gk3ywHX6lw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31be0f7d-3c29-4c08-825b-08de786092be
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 13:35:31.0381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b/mutK2lBUajMUcO9VAW5x0KvnCsucwak29XqyO0Ewk9ycbhAnIEqgP2JONq+NtCjggmV81Me/bZGXi9EH+3nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10758
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_053538_525074_FED445E5 
X-CRM114-Status: GOOD (  10.27  )
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

Enhance the readability of IOMUXC_SW_PAD_CTL_PAD configuration by using
symbolic macros instead of magic values.

First patch makes MX8MP_I2C_DEFAULT independent of DS so it can be
re-used in multiple places.

Second patch makes uses on the macros introduce with:
31ff1060175c458 ("arm64: dts: imx8mp: Add pinctrl config definitions")
in order to make code easier to read and understand.

Changes since v1:
   * v1: https://lore.kernel.org/imx/20260227130242.1702329-1-daniel.baluta@nxp.com/
   * remove RFC tag as seems v1 got positive feedback
   * add R-b tag from Maud for patch 1/2
   * update commit message for patch 2/2 as suggested by Frank
   * Use existing macro instead of introducing MX8MP_NAND_DATA_DEFAULT
     as suggested by Maud and Frank

Daniel Baluta (2):
  arm64: dts: imx8mp: Make MX8MP_I2C_DEFAULT independent on drive
    strength
  arm64: dts: imx8mp-frdm: Use symbolic macros for IOMUXC_SW_PAD_CTL_PAD

 arch/arm64/boot/dts/freescale/imx8mp-frdm.dts | 132 +++++++++++-------
 .../arm64/boot/dts/freescale/imx8mp-pinfunc.h |   2 +-
 .../imx8mp-tx8p-ml81-moduline-display-106.dts |  16 +--
 .../boot/dts/freescale/imx8mp-tx8p-ml81.dtsi  |   8 +-
 4 files changed, 97 insertions(+), 61 deletions(-)

-- 
2.45.2


