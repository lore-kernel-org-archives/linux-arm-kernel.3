Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D97EACD342C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 03:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HkGrvwSYcZPcDfC0pfw0bv9JB93chWUpKKjmghSlYXg=; b=Ya76Q07dbGB7OJV8yJh59tWg11
	v6zLjF94C6A+5SutEXvbKFyX5zY+uZVwAaIpwRl5DqPPUau8CdwZOPloDUfGR2AOUjovWfYUnAzlH
	+SBJ+GSI3tJEwhjNFWO1ZUwe4ObqeojdMVT/z0g6eu86yI5skcM0hx14mrCENQa39vrrh436HpWmk
	lSrFBiZw0WU9KmrKcI+3XGsrzSklVnGABGvEJGxXfahqOe08YiwHGCArizPEq1RLpl00TEAa92uRz
	BU0RX4Dfsj8IsYZUBMjbTT341zeMb0oUkROswPXShhG+7qcNzcS/eoc3NEqqg9TiD35dcCvGiPYjb
	XPqR++wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKpXF-00000002e9R-3nsD;
	Thu, 07 May 2026 03:36:25 +0000
Received: from mail-koreacentralazon11023074.outbound.protection.outlook.com ([40.107.44.74] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKpXE-00000002e86-2ObT;
	Thu, 07 May 2026 03:36:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kvkL3nMbiixsKpMVMde2xcMxsPo84qLGrenPUmj4UCt8yHbTE7fmJj4Oc5nJ9WPU6/s+mmtPdxkFDMsQ/0mGAQJEO2If+/493/MdZTOK8fmD64MO1k97G4k5KtHhiuQ197Do6zcOzySXKSWCn6UGRPaIw/T3pY5El9SUgNSet2ewoekVyhRe/WZ4Rl4BAVuFbQk8rl2BsNTVCfIdFn1IcY7DpA9IlWFAwPPFDUjPQS+R3fT8QNDb0ymcoWlj4p//ubLhk6myIhnqUmZcyphK759KgvwMluOs2YHbhCGYcPjAqzAYwt+BZp3M99HQBsGQ+lQed9PFIhTlFBGmge/Z6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HkGrvwSYcZPcDfC0pfw0bv9JB93chWUpKKjmghSlYXg=;
 b=RBpiD4FEBWMqGKJZgSX17tcJASBi+AykKCja6KnGrF04Q++gbsFUlRUAwiY5aVC0v77zSaZ4wbaOc/OnJjAd9B2I36JNELo0Oo930FyzImpR2opRaA1GPs+dDbLwMLwMpbC6fZf0iBvSWZ3fg0YFIHQE0UNpDyJ9S3Ld3wVDYPtv0X2xzUSAl5ghjYJv0mX/ZGkoI4Oq9PgowljhkHZ9iGZci4gwxTcbfBHVJA+88RR9+e+h0+IqjPGbISdZwmusRM56Q8ZAfOUgtKM/X7+r7Iq+4y4DOsmxMGKD2Rz6/or1eJW+Zdp3fNf6kz4f+zH/98C1pNHjlOPtfVqdl8/wCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wesion.com; dmarc=pass action=none header.from=wesion.com;
 dkim=pass header.d=wesion.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wesion.com;
Received: from JH0PR03MB8617.apcprd03.prod.outlook.com (2603:1096:990:91::14)
 by SE3PR03MB9965.apcprd03.prod.outlook.com (2603:1096:101:32d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.12; Thu, 7 May
 2026 03:36:10 +0000
Received: from JH0PR03MB8617.apcprd03.prod.outlook.com
 ([fe80::28d:6503:f51c:11b7]) by JH0PR03MB8617.apcprd03.prod.outlook.com
 ([fe80::28d:6503:f51c:11b7%5]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 03:36:09 +0000
From: Gray Huang <gray.huang@wesion.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	nick@khadas.com,
	Gray Huang <gray.huang@wesion.com>
Subject: [PATCH v3 0/2] arm64: dts: rockchip: Add peripheral support for Khadas Edge 2L
Date: Thu,  7 May 2026 11:35:39 +0800
Message-Id: <20260507033541.2576335-1-gray.huang@wesion.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0028.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:5::8)
 To JH0PR03MB8617.apcprd03.prod.outlook.com (2603:1096:990:91::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: JH0PR03MB8617:EE_|SE3PR03MB9965:EE_
X-MS-Office365-Filtering-Correlation-Id: 097bb0c4-55fb-459a-2ec9-08deabe9c767
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|52116014|18002099003|38350700014|3023799003|56012099003;
X-Microsoft-Antispam-Message-Info: vBVNCEMjIe/aKatl1qIQt/eAJbHQDgGFkHMb2XVGXNHT7XSOk/BVVULWz8DUr9Hen2DGP5mBdyeJRL4QbCtOgCBl/YgEFmt33M9lOsQaTJV7nu7OTHPldnQDfz6HyU6q3umaWc5I/WPZuDCmNdv8Zd6labgersyY8ynZvcljmdX+sBh5iQCp3e9jooZ8JgkXfyHJM5GSvVcE4khUz5FjX3c5KQPHHbzI5m3LdQgsX5UsQFZCAb6ghYPMxGc+7D55zrLtps6UQyuYUlKnOKO02XSsUPdokJEtD6z0GtGIENsoFh3hGcS9uvplLtVUiDUeq4zBzn5TZYT88Emzj/FEKj0dwHkxgB7NwMq8yTzx7krdL5/GK5VN+fgi5etswkNzugwt7uyEiIEeHWErkZosJ6azITBV010lrbFV4ueA0dx+PI3A5mL5SyBRhODZgqtKchxVs+RvPMJdgO7IrgC+Z1rJJ3YUspXfe5uJxoh0a6VDSqpy3nptYdFacCNOHnFXz3tA62HQ/yQrlzpN2Ld1ZJtMsOcOoSWM5NrnV97Iw95uytD/XgA+nt+bFD+FhsrkUR15l8Py8s/Ds7AMc+69eyhqK7mEjN9cHVQQDwV0tEBWTCdKek9il2FoCXWLsYN06NJvQCqx+Jkq+t+Wc7+k+I1/ADBGwtuku7AKGnNEYGGVj+qKzMFUfssc5hwWBehz7pYzQ4fJeQXfGS6WH2yC3Cf0OYax0EDZixSopUS/nSg1ZhnbQxVMITeokTNo/PPP
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR03MB8617.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(18002099003)(38350700014)(3023799003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QBbBmfwFImztEzmGeXh+cNELKQbBnAIrGuvFmGRMFZkxRsUUiyXd/ilhLujL?=
 =?us-ascii?Q?60i6c6VUKpZbrdcdoeOtmK8Pawn6JJZUZVp/l9qpHn7o811hTWYMiwlcaYI1?=
 =?us-ascii?Q?29PUnkGpPbVL9yw7zxkZYdwT+9mukdQI8O9o40m6v1+3hhW8jAK0QPORRUtV?=
 =?us-ascii?Q?a6qe3ouGvNsVaqdUjc50dAUi/juLCDk12yhkiPQmdjFgYWBWpP8T8kQIdz4K?=
 =?us-ascii?Q?ANYMyJ5D6DRo5I3uzQ0fT/SjYuL9vnLrMb2e7Fi+UxbFY2hjMp6DOehtCZ9z?=
 =?us-ascii?Q?tRmot+0hApjsKQgRoZq/BlEi+p3bHrfpzoOM9RPgMWriintSIbzZAJDoe7y5?=
 =?us-ascii?Q?X5fOsRMLHKRFs7WNpoLR1jRCQuLISl6pSiXrAeP67UqK26+LZcX79Zx3y22s?=
 =?us-ascii?Q?Ziv+A9p2nweJE20lG3Uul0pOSWZMGbKUTTMefZqw5SJ4nNHDaw4gaBokzcTk?=
 =?us-ascii?Q?GTVZfUeE9VMOMRkl3c3ueEwQg6AQY0+F57iTd6fotAL9KXnomClUq2HYq9rJ?=
 =?us-ascii?Q?ie9EMuNCCpdlGJosYW7Y9mSTzBnpjNlC4dZcFgCvlXOTag49LvH1sCSiFpXH?=
 =?us-ascii?Q?YaD4OPTsGddQ0VwFBeSVk7/4s+1x+dLfgu+NHv8FN2solAN5QzP1Mcpq9SZR?=
 =?us-ascii?Q?i4jhBMRIVBFUuzr2Zy4FmdQHX/L0TMAYNQKYCnHEeX1IRV8SBqYj9fdP/SJm?=
 =?us-ascii?Q?T0ZP78JPxZszUaa91OiqaDp7uFzbA5i/P80Wn0fkWBmOc/aGJyLq/KEQkXds?=
 =?us-ascii?Q?LPRJbhvEQZnI6MTljtAXs4BlHMll/+00vDxV072yWS6JqzLfcMawwVrDYlDj?=
 =?us-ascii?Q?fIhLS7kHP5sw/KMx0ZTyA5UrjOUOJEMrG9f+mV9QjLESqaBhlFi1BiLANbTD?=
 =?us-ascii?Q?O8RUoQLEZZNZ7g/Ga1lsLVDq7bDM4In58Plp5c3I25Etro0k2aHRVC1vRpEx?=
 =?us-ascii?Q?JsUcfIQlPVD+BQiOBKbOBZKuwx/A34N+ocyC0diOOK+2MVv8Y1hOZAlby9F1?=
 =?us-ascii?Q?0Pu/cprkmqCyePnUCvYxU8ZPeg6hGGX6uKmGViO1m764HHtDh0SQx3mCc47L?=
 =?us-ascii?Q?gfY+I3jJ77wVJ0y8VOFHY3vukhX+VttHvzebvwMQuu55on6sXNQCgVOXMAwE?=
 =?us-ascii?Q?9s8cVfgQGSM7vvDTNsC/LOrmBg/LcsRHg2O04JghKyuD/L3TF0g5r56l/G5V?=
 =?us-ascii?Q?69qQyPJh22/VB4dYiEe7rp0UH6eBSBajtg54u4xkiqFGcSBTYZU56MNXFXPP?=
 =?us-ascii?Q?RuHW+nb8tsQrMXQ9UJ29ZPTdaiBXM6JYPfsboMBhpYo/xZ48FBCjBR7RINhG?=
 =?us-ascii?Q?og6yiFAHqZPQzGq3K1lT7mtJ2IdxHzDLwdHErFZkFrJd5M3EOlLz24MikYrP?=
 =?us-ascii?Q?mPE3mlwAoNAlnbBSfH9qXjPogH+uFPAcqZQS+gt9eZMqGTyYL1oH/4GWNfXA?=
 =?us-ascii?Q?Ra16wbbkr/+S6uGTjFAIZSdyaGE2bg+l1J76dwbUg3j5uDBynlZWlsW52OAZ?=
 =?us-ascii?Q?0woYQy/92UBMsH9lUYO+beiBAd/qvkf7eXJn7GS1poP2FVrgBzrbJrG94qop?=
 =?us-ascii?Q?2J9WbxvSNNtnBpWS1/qyPpEFr0bXi8Ww7jMYHc/JOH2aishBkZqNRflw9+ro?=
 =?us-ascii?Q?QRI/gZz1g+xJU7N1NguhQ+Xk03EKy7AJz8yEEfjlajk85CMH+5gM+kGKI3+/?=
 =?us-ascii?Q?ph61gS40cxhBMxpfc+5Ga/lCXz+0cK/Mv9KNlxsDuWi2r+pz/0RxJya3i0wb?=
 =?us-ascii?Q?m2LLOWpH3Q=3D=3D?=
X-OriginatorOrg: wesion.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 097bb0c4-55fb-459a-2ec9-08deabe9c767
X-MS-Exchange-CrossTenant-AuthSource: JH0PR03MB8617.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 03:36:09.7324
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mReYBMygH1LqmhGsfLBdkERC6WTcVe8oljQAJDbArFFJ11bcK2gkQ50kFPSKW7Ythtj64qTj13x5Q/W1k4PN8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR03MB9965
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_203624_617073_74E11350 
X-CRM114-Status: GOOD (  11.79  )
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

This patch series adds support for several key peripherals to the
Khadas Edge 2L board, which is based on the Rockchip RK3576 SoC.

These patches build upon the basic board support that was previously
applied to the rockchip tree. This series enables essential
functionalities including power management, RTC, wireless connectivity,
graphics, display output, and USB support.

Summary of changes:
- Enable USB 3.0 Host and USB 2.0 (via internal hub).
- Enable Bluetooth (UART5) for the Ampak module.

Changes in v2:
- Split the former AP6275P wireless patch into separate HYM8563 RTC and
  AP6275P Wi-Fi patches.
- Reorder DTS override nodes to follow the requested placement and
  alphabetical grouping.

Changes in v3:
- This series now only contains the remaining USB and Bluetooth patches.
  Rebase on top of the latest for-next branch.
- The previous patches in the series (PMIC, RTC, Wi-Fi, GPU, HDMI) have
  already been applied.
- link to v2: https://patchwork.kernel.org/project/linux-rockchip/cover/20260429063712.2150938-1-gray.huang@wesion.com/


Gray Huang (2):
  arm64: dts: rockchip: Enable USB for Khadas Edge 2L
  arm64: dts: rockchip: Add Bluetooth support for Khadas Edge 2L

 .../dts/rockchip/rk3576-khadas-edge-2l.dts    | 82 +++++++++++++++++++
 1 file changed, 82 insertions(+)

-- 
2.34.1


