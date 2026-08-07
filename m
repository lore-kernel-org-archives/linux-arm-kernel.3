Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0CDEC2A09B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 13:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t2KLTVN1wsWNe+E8uRUEshEKDgyFtFtDRIVpXgpfgow=; b=4qaZAapTExMbK7Kg3Ulw6ZKrHz
	P+3mgU5FilPQMAMxA6mJefk77g10GMLQY534J8d6qOd1xRfpSx66KyCkL0cDJ17MgSTQE5cpPw+9G
	b0bJlQfKjqMf4Yz4oAT5dL/2AUrIfYeE8aiQHOE94q7zYQwWGuWNoPtS+Rl5aw7rsIwfTY1mSBhEy
	vgvT2dpmD3WwTClljLDezVBwcJHtibR7TJXC3HN30M/q6NWbjT/KxsSTr7pzmanDh1MJhq3Rh3Znm
	bgOOPpLIR/QZ32RdkzNssMhY0YrdLDt5NbhdDQv8Tae01CEV5/8T88Eprq79gxPzrjkzaP1H3J1Od
	J1nGRFUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsKgx-00000008905-1j9N;
	Fri, 07 Aug 2026 13:32:55 +0000
Received: from mail-australiaeastazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c40d::1] helo=SY8PR01CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsKgu-000000088yO-2SEw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 13:32:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rRoa6mabcAvUto5uhAR4j+MBjRHonvRL485tTEdoAMFy7GL53OwK5w+c7+zz758OJexlpAL+Dx1ztm5zWY0MarsVE3VrErFu29LVby8Sv5aVdsnT0R9rbOfSeditxhUuP75QosRbKy14CNkiU+uqguhwLQk7bcmYwryplZulkkmFczFLZ97djypqgIKQQDqLvr5V+pjxA0wh0/pXRhHeCFbKUWrOVzzc/mpzPZ0T6MyUUmQgj2sITYi+rvX5mnSKOGkMFjyf4lNz1+9ojvTf3/tr8TORKF9aKpbeLBlQ6Nhb0eXyuzjaTiKB03+fViVwgVnNvke+gbNdk7n0D5F6Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t2KLTVN1wsWNe+E8uRUEshEKDgyFtFtDRIVpXgpfgow=;
 b=eQYdUKcJSVWkJ33lA2QqUxTw7ZL7CLQcxRcRygrZqofiBoj0S6SVTOj4WOM2pYxZ2rlSgflnvVmTwX59MsMacJvULmC8bgrHcbdpcAf1WNQqOG73T/OVyjjiuESNSDryFmsJFsa3K2NMnCznsrqRZRG5YDwAUMweJ4TfgK2+jZWCILgyETOr/pwQBMxbuciRrH4mexbDSc4GBD9LeiPoK2d988SJARJ5cxfPfPgaYDoOFrsL3EFMM+M1/7hXW9CiYS8wQM5RlnxUhVjTZjzI05+SzWUI5e0pOYZ+FWOK+kYo3vVqOE6sd9/JpcIBnsMWr33X4kIqFDm8TZDwYfk/vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=heitbaum.com; dmarc=pass action=none header.from=heitbaum.com;
 dkim=pass header.d=heitbaum.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=heitbaum.com;
Received: from SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:279::22)
 by SY7P282MB3978.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:1ed::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.24; Fri, 7 Aug
 2026 13:32:27 +0000
Received: from SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 ([fe80::21b6:91f8:614d:1fdd]) by SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 ([fe80::21b6:91f8:614d:1fdd%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 13:32:27 +0000
Date: Fri, 7 Aug 2026 13:32:09 +0000
From: Rudi Heitbaum <rudi@heitbaum.com>
To: imx@lists.linux.dev
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	rudi@heitbaum.com
Subject: [PATCH 4/5] arm64: dts: imx8mq-phanbell: Mux the 32 kHz reference
 clock pad
Message-ID: <53e03c00c4c03c2f73d8012a602fca6031a52dfe.1786107926.git.rudi@heitbaum.com>
References: <cover.1786107925.git.rudi@heitbaum.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1786107925.git.rudi@heitbaum.com>
X-ClientProxiedBy: MEWP282CA0120.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:1d4::17) To SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:279::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY7P282MB4909:EE_|SY7P282MB3978:EE_
X-MS-Office365-Filtering-Correlation-Id: afb94cd8-b1e8-4a61-56a5-08def4885273
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|5023799004|6133799003|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: BTbURVabBuLWKDC6S8ZG2Hp7Qkzp+WU+58V6uHZ3MBuh3/hYtA3pVVL68QJTO+DIL3nz2gPyTSDl56zqKzxzZUVi24WuEJQOj1dZ0mUAwQkgTA0wrWHxJxa7ydOOrilSX3UWqsXCW5oJx+vtYwGNXGRSZxtkhVo90yHLeS6R3RozE+8gbqtblCZ8cBzL0KNaMJE8Gz9FJu9kCDP1Y5DMmEz9uphoYXEXHuCe5zG4dZrE3T5S57bW+8h+4LlYJxoCwQ5l3ZLlnm4R5vGIU7HIZIlmdQIGuVb/oEyFTmRgapPovNTM08ByCExu/gNkR5+pU208NF0GhtNwWWtmr4aMck5oVdNPHgG3+YfvrKgBTnnDSen5BeZUxv23dJJwki0GjVKJetIZ1Mb1UBAJv296wQDRQtxQyWNk8tGLS0YFeEHhOTvYEM3qz14vqs8QHZwSnlhhhAhNvgG/ZRoDOvupt9z3I6cBoFuWcLGiQSS0EaE3A0KTjihjHCQ1w15ivQrCMAsb9v0+ta+iVbo0GQfBv9B6i7bEHExO5t4PmLFNITKxFyhueYqZ3myu0kfkPdUVlrSyszvmJUeO+iOuK0yXTb8DwSVbCyvy1LzpJ5DBKmKAbZLzMq88meEzC04r5F8W0ZD6tREB5lDsVHeNRsHgtoGPJBfBRnZDCZ294Ifv72M=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(5023799004)(6133799003)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qIA36RkZgrQ9OUu31oDKw8UKkxky/DfXBHZOegIes8gmZzV3zyZRyd/l5NjO?=
 =?us-ascii?Q?WPoxfsigu2G2+1PB1tPp4B2zWDmedG5I8NFBcoE1AmdPrCC9qafm3FOEtZwe?=
 =?us-ascii?Q?76VJKMuVaxqJ9atwcpTsJ3G5Fo6J8V4RbhbFO+V9Fpn6i6uLua+sGupxvJV/?=
 =?us-ascii?Q?Rnc6cobsMQkBTr/iS5stVaVWRWpLIFtfRkcs9amCB6Kehjjo5tfJ+r4DRHm3?=
 =?us-ascii?Q?zYF8hbiTJ9XrEeI2rCaRfVTofjPym+6Uz56AYT3jkTibIhuZ7CcVkQ279nPe?=
 =?us-ascii?Q?z5QQSixUcj/lM4Bh3/8gxY4eaX80zWq4Y+XuPsZRJ+BvnMpWsWaZ92L68xCv?=
 =?us-ascii?Q?uXUcDemrNj7FJ+f/Dumq5CllDoSbVAe16cfNK5CFscZm7P/S+lpqybVFHps+?=
 =?us-ascii?Q?XPh2VeBiKiJs69x9Sz8RV/cYarfzKowfQhrvvU07kmdsyKD7/ft7KUrFqsCE?=
 =?us-ascii?Q?eEKBm214CUbckOpKgRvErz2+VChxV/yYO0WTV73dhadFNB22L9BizAuhZq5r?=
 =?us-ascii?Q?dSx34zxx3kWg9/G2nTHorNXD3yPYiSBl1cODD8SE62bIkSgXCnnWigWC8Lok?=
 =?us-ascii?Q?eA828Hnue5RlHHqkeAPCgcey3KC7gCGxgChOvwp4gZ9gZsUAd/jIwollkoZt?=
 =?us-ascii?Q?oH9eVPt3nvMXaA+rat6R8FBLqcVJV8zdQBMg4ETQgKB3jibnCaMCE7vlLRZ1?=
 =?us-ascii?Q?tZcK68G3JcLBaVR0n7h3JUR5seZOI+WPfWLrmAmSKNbQzlsuZ6DvWQkAxPsI?=
 =?us-ascii?Q?8Jot+9EJPCK7e+uWsYvpf5lar9YmEzRnf4lJJHq3e0ElcpZI28R7etGyxrmT?=
 =?us-ascii?Q?ZQ6cfgumnnVqDrmMQZ5HGPCGLYh4q9pleS+/Wqtq8jYa1D92/F90D2LiqI/y?=
 =?us-ascii?Q?6It4IE2ii/J3S6sfdBYFJkYUlY8wGLg1X6SO63JENZ70qJnLPtDBYUEyfn7C?=
 =?us-ascii?Q?RkJbuBbheKUgcw9t6K1JIfcj8x/MDwOe81BQael1uW6jkCFe8Blosj/0smFU?=
 =?us-ascii?Q?R3xxRWERp7T26FZw7/f3mR7p599cd3+3KmNPnRa1tqqrra8mJFrZD4SkrSaj?=
 =?us-ascii?Q?yG+ohnqFPN1giA9F/oXzoxQFMsccuc3BbAtwbsDwt9CmHLad9xgIOsKDcTb1?=
 =?us-ascii?Q?pzcvVMlInOeZ88DLRT/QpdegHtVEhYLZATgNeRtaUkAWtneqzRW6m1ABSYp/?=
 =?us-ascii?Q?x6xQycEsp0jg4Jch3oBW/0klfgNR5E2lKJ2P8B0Y9BqW8yCkGiYBPTZmX+Pz?=
 =?us-ascii?Q?vD+36iXH8Rm3KnQpE2ZTN++MG5nBLO3xl7f0dQOMLTWVSwdGtzukFSVVxptd?=
 =?us-ascii?Q?YKTvkRWPPwwKd1IxQyyyryicpTcEuMJXDNTwY+GV2tBEOUdwOvDBP4g+iVDI?=
 =?us-ascii?Q?2jG3uOqa1Rd41B5vMY9ycyg+smGcBRSTfv3DDkmYsm9Siu5f0IJtgbGIfQiN?=
 =?us-ascii?Q?oQAfGyKhBI57WiLzBFQQNhqPZmxKsG/161uS6sIE7t4tOWjkKncrNk3q+5Yf?=
 =?us-ascii?Q?k1ijvrjkvqyt0oTB7VnjKHiAXlKQyEn+tfUVjVuCywa7cE0DttZZ+SV41G6r?=
 =?us-ascii?Q?0vOrDpRq8RTCV/p5nLa4i6S3RVzUkDsxhBxqVWYzGpkb3et+i6SrB+GVXgsa?=
 =?us-ascii?Q?SoCeJKCs0m0gtRNU653Pi8CXPWuDSupB6AmzvBVb8Xd9VUEIlJkrZNit1HEW?=
 =?us-ascii?Q?sTxxjd/xaYl+cHKcWnl9Sm9qk95jH0qQZyRRuWiehA76pJHM?=
X-OriginatorOrg: heitbaum.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afb94cd8-b1e8-4a61-56a5-08def4885273
X-MS-Exchange-CrossTenant-AuthSource: SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 13:32:27.0069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 35ffebb5-7282-4da6-8519-efab29b0108e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mkjowJCXUozcRXggfn50Yy5iKwZBPCAFoiUupo155HZGR6RChLimEtLk2Enh1xhorppENdSpY7nvP9WM0pMC0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY7P282MB3978
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_063252_628723_5D4BE949 
X-CRM114-Status: UNSURE (   9.70  )
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

Mux GPIO1_IO00 as the ANAMIX 32.768 kHz reference input rather than leave
it in its GPIO reset function. Nothing claims the pad as a consumer, so it
goes in a hog group.

The vendor devicetree hogs ten further pins alongside it, none of which has
a consumer anywhere in the tree. Those only set pad configuration on pins
the kernel does not otherwise touch, so they are left out.

Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
---
 arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts b/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts
index 58f7276eb557..2d134eefb765 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts
@@ -348,6 +348,9 @@ &wdog1 {
 };
 
 &iomuxc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hog>;
+
 	pinctrl_fec1: fec1grp {
 		fsl,pins = <
 			MX8MQ_IOMUXC_ENET_MDC_ENET1_MDC			0x3
@@ -374,6 +377,12 @@ MX8MQ_IOMUXC_NAND_CLE_GPIO3_IO5			0x16
 		>;
 	};
 
+	pinctrl_hog: hoggrp {
+		fsl,pins = <
+			MX8MQ_IOMUXC_GPIO1_IO00_ANAMIX_REF_CLK_32K	0x05
+		>;
+	};
+
 	pinctrl_i2c1: i2c1grp {
 		fsl,pins = <
 			MX8MQ_IOMUXC_I2C1_SCL_I2C1_SCL			0x4000007f
-- 
2.53.0


