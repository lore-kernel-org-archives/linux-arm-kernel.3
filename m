Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A52CCF2D4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 01:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DFTQzldlgKRb1IEuUbDhcA/VzS3xT9SWjqU3gr1s+lU=; b=0RqPu42tNR5rt9kPzl2WujNSbK
	mTV4Glzwk0FmS73iw3jAMtIRGy9OBbiXoAYj+NO7UvvwjPzf6cXs94W3W01CtcOCeItiHXDR4eGIg
	5ji30aYvkIgdrSTahskg3hutHgFV/ySdAQWL/LFEjsfCiQpCPscogjmfDRbEMMEwbyzXMuFu+naDd
	8Yr2XFQ2iF24GjRkM4XifZKJNWxrZgSn0rTNHvxk1i1SedEPEuv5mJ9gsJ6tNjHzqx+0JDrNiW8Qb
	X9SJ2s7WHYQ86ZsWyBLOErXTDPhgxsHXdcU8Hp+VUqHCuM2oWrQDQfbUbH7Aljs9TK9FqqIzbqOm9
	RxY19HMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIcMl-00000006PBs-1he7;
	Mon, 19 Oct 2026 01:40:43 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIcMe-00000006P9j-3sMP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 01:40:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MbzshEpBvQS4RNJJPNUk0L3sl0Wq8z+RGmG9BQNDclreV9fdIwn2AlLEA1NnJ2dIwq3sv/XZozZMt5pWqN6ff6XqueEH0lzsvoOak3u9MkBTxpHtjn1Ni7awpBNz6cZCZru9QHGnuQ0/60FYlhmap68mzXpVMhM48BINv4PSrtgiOZ6Nrr4WgNnJIuxL9DsMNplEGY3SMSpApHJBRd8VSPxmh0U6/SY64WT9yEPD+UuGECOVud8L+CiI3zFHWqQBwKlYO1EFF41Q2s05wpts8EnqZMvH/eX1TS+lchyu8TAIwKp/NX5dhw71X+OHFDvbC/uAWzp/LTzTlQoMcgjVlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DFTQzldlgKRb1IEuUbDhcA/VzS3xT9SWjqU3gr1s+lU=;
 b=i2gCU7yUxj0O9lOLqAvciFfN4Al5ucYqKZZuurPpRYyECtymuGezbazSEZQxmLk2CgwsVzubNHwjwGZ+MuJdGFbGaiVuSmqFeMecFfls9P2tfnOj1op9vtR+c9X332xZDSm9v2r4kHAr10HsGlvFWRTrzlyb6hKwuO//otyt+Ohe5RmyCjLNgvTtete9aLJwGszxl3d1Af3TlBaXa/i1NNfmbgR9gTt4vSDQKkDfCjyQjeEq9DD5KC+Pg5qDsf9tQ/d36X1ud/by88foryESHL343sF3uL0VMjsbE4HblQn7nHJjIOOuhx8VhTEemn4eTBTLDKcjTRTJarxsg7TEJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DFTQzldlgKRb1IEuUbDhcA/VzS3xT9SWjqU3gr1s+lU=;
 b=ntZsclz3U/VUDYrbYMhEuGYqLHAmyOSTiR2JhsFFclJHkHol1xVu5WndYyGkyZKlcNe2QSm6UCYMxeOirl7uWpxjaYNHlsMlQ4xCKaOAzIHDym88P2pKH9JOB0uglY4RcG+HoLmEKDQq6zjbN223lPlBfB+ZZ6LYIjRBU/xHxqeabcv++0RKQLyDiBLoxFXatgW3YSZsip+9QTE5kXcu1qDgnGsnYVAjNmPUMuwVTxs9lxKYn6pkoOpkCDW2NoO5Pzgsikt2PND5O7Pc0yLQcBwRviR+k9xFgFFSYrkGdIN0/GLs/B0XIrG+Fe9besZz/7YOLxFnoR04Q1p1q2OG/Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AMBPR04MB528492.eurprd04.prod.outlook.com (2603:10a6:20b:818::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 01:40:31 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0522.013; Mon, 19 Oct 2026
 01:40:31 +0000
Date: Mon, 19 Oct 2026 09:45:10 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v1 1/1] arm64: dts: imx8mn-evk: Pass GPIO_OPEN_DRAIN flag
 on i2c3 GPIOs
Message-ID: <atV2JqYfeDfjaTtJ@shlinux89>
References: <20261015081149.5919-1-stefano.r@variscite.com>
 <atDWGbi62U8sISS2@shlinux89>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atDWGbi62U8sISS2@shlinux89>
X-ClientProxiedBy: SI2PR06CA0014.apcprd06.prod.outlook.com
 (2603:1096:4:186::11) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AMBPR04MB528492:EE_
X-MS-Office365-Filtering-Correlation-Id: 88eb4be7-6102-4a4c-2d8e-08df2d81f5ca
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|19092799006|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: uAPt/SFLg/UYx1hFFcd1WksZgNB7uCziZtkQXzokUENviq5yfcKsQOdd1/oCGfsDsdfdGKXje07wEWfbj7xTpq8mxv1QSxQgq7c4sk0JhMYoWrv+g670X+q18EMXbow2iD7z29GEYkzPPIgVBcLaUeIUYaRPjPfzrxM9zlWkjkCAlSF2lNvHB76rsR9FKxGiYdSamv0GjD6O89BdrH2en3domTrvqKZ4t+879zpb1NL0bwLXc/X7q1xd/N8B6bFMsHNx8qQEMz/MPY27rkSBno6SmKGyirnoGKdD3si55nVgU4qzixQYoYDEO/PqLW+TvJiTzCK15rThPrqBd05WJWgd88pTysX9r2Cl2SmBcEWTNgMbQhdg5g8kaEpBONIygMZ3A1zUldF2/d3GAlQ2xHX3i3IWSnYS93xomOxs1APK38Pfb6HTCwnw90tMiNRuOTy6MTgjUqnV/9XPIW93tR8fxTzfJJpgF1rzUzIcLfAomi6v0gYQDReuszoskop0vKX2iVxewc//bAy4+f/GA1Fa7DB4iWIQcNDelzjsYiN3q+lu9+h2gj7IQxgA4aUwRRfnfGPxOwuDPwSUSOvFTxsLW4PAi4K+sgcOV8EplszuCT90LPXsYnooCXyHSWQ5jph2ShNs94TEg4KcacaL/DQIzRgDeyw6+8M/A5V/Uzo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(19092799006)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vW7BWgqgzNhmjdqkw09JpNRNt4WJl+HzPyzJWvNv1l/8USODYTfIsW459KlF?=
 =?us-ascii?Q?FIU9RGLGrPQi/zE0Cyv07ItlKuJG0L/86O6oqjRivvtvWnqsb52NBX3DM5PR?=
 =?us-ascii?Q?v3FtncaecuE92PAyvQONyWG2w434OdDfFzpHrbF0xgtENaGIRJ/+sYOU1J53?=
 =?us-ascii?Q?FWRi0rnYNaZJtiZWj9q6k9d3AQqFtgirVV0FnBw+8QAqJu7oPGCi/V4n6Cxl?=
 =?us-ascii?Q?3fyR9A+AE7ybVZtaF+KEfMlxq+cL5OnEvZQmyYYv6OBUdDqxtzmc1u1PW2OA?=
 =?us-ascii?Q?hEA4/K40Gha5SCiQMxlYZkR05QL4pNJKfNOfZOp3Anw5eLQZozbzQjNu5mbN?=
 =?us-ascii?Q?bkeykXM0akEDhT0LT8QZkaS3LltGVidSUagiUif3d6MGpsCs0BCoCidR8+fK?=
 =?us-ascii?Q?VF9XZPUILSf58/2/KlHi9ptqzEpwf53c3NpalV26tHdVzzy/TgedCgLytj9/?=
 =?us-ascii?Q?O3ZICE6eSVWAxfU2xb4tXfz/g7VeeK5BfX74S3T7nhgHM+qVuaTpegSJWgT2?=
 =?us-ascii?Q?tZFgmguLLAh3+2x9HS6p0b8egLdEWFyv9nqEoSwWUTnpnCda4LwliLwbAJDB?=
 =?us-ascii?Q?myNyScslDpjYc+MWl9wn9SZLdwTCARDTja65wkHG1GCZUTvX1olszk8mEBis?=
 =?us-ascii?Q?WE54234ERGbYFhPhJ6frLR+f6gVzG3zyE8Rn7VlD0fOfLfaQ9swczWaDUfq6?=
 =?us-ascii?Q?PhT5umUb7XEfhKmIigSk1dBNIQIT1EYBW8t1LCVOWiVupbSoSSMYzI9pHFDp?=
 =?us-ascii?Q?4FXzVxKphSqdi8Opgyx/gb6AH47pH7mz/GxI+AincLLiOUw9ZChaVyOwvndi?=
 =?us-ascii?Q?lTDAbAuD4R8dCQsbZOEIuYOLaxj7anc2H6ZFVcwVl8R8yChMVXR5f3D/9hM4?=
 =?us-ascii?Q?eWLjb1muMFTlijPJ1cyU9Dlk1h+NQ9zeWAxLFOidvumSBlTKQEqPl8Wc42mi?=
 =?us-ascii?Q?1X5sa4QxSfM9qoakYKHcnJ+dkx7vxYfSxaSK60cFnkN6KPCOhMXJfLXQ2hBL?=
 =?us-ascii?Q?ZZvXX/QsN5pQv9fMq9RlnHJFjlbvI3iIXq2xLh9BbF0s7CwU2kEKX5l6J+L2?=
 =?us-ascii?Q?SsN3ftLGApS2aDMmS/jT43+zTOLPRLatGUnDtQGBD4DsIDtnUEFBxMnWUOwd?=
 =?us-ascii?Q?U/b3ACI2nmbSeIMlMVwhj2lBoyCsx0LB8AtJe33UMrean8pMT+A1pXnRLz2f?=
 =?us-ascii?Q?XUVrIm+KozLFxQZA0608+04eVuPcV5JjTvrliIoa8t+1n7aROCfYLvEeomuR?=
 =?us-ascii?Q?5cuYFzxKQs/YFFPAiyKm6rDtB/9RmWB334PK4x+N0Fwgdxjq+RVlmGhcBvQn?=
 =?us-ascii?Q?H1k++e8RbjOq4W8uZOWDI92A2wVMULiOa6KxOWlFqcj51QpOOcuh+Ncob78o?=
 =?us-ascii?Q?fJRmmqAW+jjZTlUlDjOZKjf4NDVFsQV+v0jc75wN+inoF6PqyWYLCKMTDZOt?=
 =?us-ascii?Q?exS0msiYrB0lDungjo+Zpj/fooAhiGEweUdJmH1oXgT1YE8Nc5je8I2w7HKo?=
 =?us-ascii?Q?rN3UsZ+UQwqSmqfLSIgEWTqR+jvd43/eE4NIOOcYWBZWR8TZgf7iC/X/WDGm?=
 =?us-ascii?Q?KoSRtS96+uPBPdNuRAVtuap13RqgjPoaflSfVp8YKTQ/mI8VGT0qBSoOegYV?=
 =?us-ascii?Q?7Clo0uCocH3IlJIXC7xk4g84/7BaCE1Ce/J8zjbqJIdECd9PKPWKcHDbjt2i?=
 =?us-ascii?Q?g28LRSXLp0/s45R2B49k8JA9clqrx2y4d/XBt1oOIgf0vsXHgSuf3eu6rh1X?=
 =?us-ascii?Q?403oV4MIxCCW3wG9YeB6zbRbBmiGAD4CzIjLp5Cd77HM+yn1zO+3?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88eb4be7-6102-4a4c-2d8e-08df2d81f5ca
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 01:40:31.0316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e2DdDsKv5PQ/kpzjg5aPchE7h8ia81epGx4JVrURynUJSWzInZ+3G6keT/qjqnP3M35wMZa0wESTxpWIWtWha6MuQzAqZRQOa8QLFLpEC10hDREDyZFJ7gdKgtLlbNfC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB528492
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_184036_994468_33B52A05 
X-CRM114-Status: UNSURE (   8.68  )
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

On Thu, Oct 15, 2026 at 09:33:13PM +0800, Peng Fan wrote:
>On Thu, Oct 15, 2026 at 10:11:49AM +0200, Stefano Radaelli wrote:
>>From: Stefano Radaelli <stefano.r@variscite.com>
>>
>>scl-gpios and sda-gpios need GPIO_OPEN_DRAIN flag, otherwise the
>>following run-time warning is seen:
>>
>>gpio-146 (scl): enforced open drain please flag it properly in DT/ACPI DSDT/board file
>>
>>Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
>
>Acked-by: Peng Fan <peng.fan@nxp.com>

After reading the gpiolib and i2c-core-base code, it is ok to just
set the flag for scl/sda-gpios. It is not a must update PAD
with ODE for Linux.

Reviewed-by: Peng Fan <peng.fan@nxp.com>

