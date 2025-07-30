Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36935C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 13:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3EcuaBfQB7dyV6rR19GJbMxkDUyxHyRwjKX86ZGQUNY=; b=nNqQsDXHFOOTBFTLBvptEHmQwv
	6d3w1GGYGgDaAd1I6qdE2AkFNbblieOdaRLGR4kG719UzjvY1zly+kgBHcd9ERp5OcLxyGuzjtDsk
	1L+MRp6Bt1qImoebidfEUmUGOq150pF3nD+4it/K/dcpj4Y2mcZvXI4B+M8LodImOrjpPZjBfCxu1
	eA9csjOYGO7ZziF0swU9f+DGbjdUgkWUF4IMvVN9iPDuX0shY7/lg0Nw1PC4uOOKV3f2HOa/+U6W9
	hNidG1WbAtmvPcVWR2a/Klhrptn2ETzt85ztFx95545gfvtaQiiklaYpH+yRlFJ/m1GNQZQVFpS5e
	I3DWj2Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh6Xz-00000001Yl0-3CBt;
	Wed, 30 Jul 2025 13:08:43 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh6PY-00000001XY1-0kR6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 13:00:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tDLVJB1MnKY1XWohDUJE5BqH0FszUtXt8o9JozGIOV1glcrZ5BtzeYjGDPiJEaNY9RYsceyeg8cp+fAycdbpJixeA9mDUgqfsy19i0b4NO0pIWYeyfJpTnopDgrIDrUQDwhWrKsUQMUXR+V+UWrjMTA594Ngy7RxyiHUw3LoPG9kXMzIv2viMfuDDuNfACc4arXawR6b333i6Ynwuprla8QUfi6W9xiehxH6p7Tl1cxrYY5wvHqLnG9FNBIwLSQfPUYIP7qocf7SZpQ/FXR+JHuQA7UQhrhRrdkp+bB7DgRNZAaimwcioTRC08t+8dV0gl4T3RENIkCaxF7hJUQzqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3EcuaBfQB7dyV6rR19GJbMxkDUyxHyRwjKX86ZGQUNY=;
 b=RyGqLUyhzGXHwtKgkZf1aRdNMYyjSTSESV7i/j59lXO1DAKa8TxiSPoBPysxXn8MKFYZ0N357ge6qVaJ3a/Hb3tghNlU4mQp0Mphv6JyY5/1y3pul1D25TLvMTv4P2bqlj7RcX6VI6jxCw6jHTKDk8BWja8arfTPplbgmgBSuDFlFnTsoibbe8xCSVOa3IRGemI33QPNjSU3HxJIxLoiJM2uMGabjsHgEYMMb+LejvP5e9kJZBkJmWdFmyTQfUHfP0+Jo7fwNOwXXv0z9scfLF70f75F0/G+ipB5Zs4BF/dMNS17Qztk/nA7y/Q/Exr1v1Ins3/MuYusq7/RIelR5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3EcuaBfQB7dyV6rR19GJbMxkDUyxHyRwjKX86ZGQUNY=;
 b=YcylIyN9wop3d0Ydc3rElpfP40NtJG0wO3PE0Y7kEqHZMslzAHJHEkPmTBVUssr3OPxyuHj34rVRCaEjBuqcKj5eMEs9MLlKhHsDDeI3uLlg20M89pW/v+Va4Zvk3SUkOJ/tZEUPsvD7cf4heJLw2miXGmWTCDoTZCmVXiaPgViCawh5MLxY/1eQ9apBMF4rSeSB0g07gby+FPjiLsCDiUKpjt4oxQxmY6jG2aucbxLRNk580QXnQFJXm4o56sI6jQJ26MNWN156slW2Lj7IqE76hVfMjUCV61CPjpIQFENYMWM1kpCwxkfWGOpbBR0Xfui0dKyfT+GEzXWkwv41yw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com (2603:10a6:150:26::19)
 by AM9PR04MB8763.eurprd04.prod.outlook.com (2603:10a6:20b:40a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.12; Wed, 30 Jul
 2025 12:59:39 +0000
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442]) by GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442%5]) with mapi id 15.20.8989.011; Wed, 30 Jul 2025
 12:59:39 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] clk: imx95-blk-ctl: Save platform data in imx95_blk_ctl structure
Date: Wed, 30 Jul 2025 15:59:30 +0300
Message-Id: <20250730125932.357379-2-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250730125932.357379-1-laurentiu.palcu@oss.nxp.com>
References: <20250730125932.357379-1-laurentiu.palcu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM9P192CA0010.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::15) To GV1PR04MB9135.eurprd04.prod.outlook.com
 (2603:10a6:150:26::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9135:EE_|AM9PR04MB8763:EE_
X-MS-Office365-Filtering-Correlation-Id: a87c9c24-a537-45d4-4652-08ddcf68f16a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|19092799006|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?i7qiCpXyhXq4gRso6InEVi1og3njASJByFQvzFnde1iusXUr61i4va5uWFOU?=
 =?us-ascii?Q?Ubv8YWKiubhjOcOfM0/Rmdz9ZoqIRCAB1hK8fAz0nkwM1y6yKQPtOwOIf7Mu?=
 =?us-ascii?Q?9acJYiDhBh4h9rQ/CLhB2tv6KXXmD2FXxyeT1Vr2olc5JhkoAKOybnecrbFN?=
 =?us-ascii?Q?qQaeXjlAVSGE5KI+uXTLCpCZINz6ocUVjC7NXSL11bGtGX+2b2CkLzS6wDsj?=
 =?us-ascii?Q?UEZ8L2kOtTdfOiwiyqWz5I7NgSGeeTb6rbZ+BM9/yw5jPdQ/lxKxiPhvHSqb?=
 =?us-ascii?Q?egzME1oI0JTRTJRNtk/EeeLG4eAbCmpzEPmijj3XiiVd1X3LXtIjdjZj3VJ4?=
 =?us-ascii?Q?v+sY7opEXbmhLzEXh4rQmsKzO6yRG9p59QvNNEJjEUHD1MnJ/8mt6BxjwrC7?=
 =?us-ascii?Q?qtd6xSKhSRKokyIhN8/IaCkZp48fNjeFKukqTfoCczw1Nekad/YNIbpPBR09?=
 =?us-ascii?Q?KxW3L2X0VmezoFpJkMc6+O4kWtcNY/icO6pi/3c16T4yacs6KN2WbQrLyF8Q?=
 =?us-ascii?Q?JkMoJqiUK7YvkqARAHsl77wZWqOsVtASk2q+6rZ6d9Jf6g0UASmKpfW8sHPC?=
 =?us-ascii?Q?5DIvj7Z2WC9wc4M46eDJL+GEkaFyR0ScM9OilAV8tN0UazHZk6xzuyPpEWsH?=
 =?us-ascii?Q?uqRW5bd5zLNt9fxSHZd0bLQmBGQCLc1x8W2N0Ak5SbSc9MUw9kITcJNpILF5?=
 =?us-ascii?Q?53/hOzT4is2XqpMpr5gxM5auEKKbe0+KpEW2Ae3QO/dUMFEvqA1Su8QXxSpI?=
 =?us-ascii?Q?PoYX7J5KSxxvRNx3BY+wvsU3Gr9BqmDgpkR7YX0U8VtADX5D5aq+W3R/bM+5?=
 =?us-ascii?Q?Ih7jsAJzEpBzyXppNBNwoukFO6DLjiU5a1e5vhPGkv2oWlyi7VHhZ6FcI18u?=
 =?us-ascii?Q?m1uMAjsHT33+YSO92tbEcEKoX0KLPENCvkaw4jQyhr/LF1u+EjR02yiKDZ+f?=
 =?us-ascii?Q?JWq3BDO0t7fLoxyfXWEaxZeSwhOZq291NfPEdADxEjNNJUt3xBvSJfIzGvVv?=
 =?us-ascii?Q?6hSql+S95DJvyZy5Gu/qOwVLEBpRk21zS93VcQ197ViRpVTj+TyxDxeaEBXA?=
 =?us-ascii?Q?I1O/5T15sc577gWexLS78LtyTeBzQPJ0sAHENQAQwYi7tGv58qfLN36LbXz8?=
 =?us-ascii?Q?3tV4DnXa3tyDqSODOJxnRyWMZy1h5tAby84T8rB+fj2TNY2Tt1jd2IBdq5bV?=
 =?us-ascii?Q?T2CWNG56hEg5BygkFbbpy5dQ+D9Q1NUOKA7jjD+KdvNXiB0nbjMk/qsYTZ4S?=
 =?us-ascii?Q?t9ns18+1CKYdVVXO2L72CbRDJYXzQnPi2wEmIYOwTYdn4O7Ph2EgOEYXGFJs?=
 =?us-ascii?Q?rSd6Y27QiH8w1n6vMZ/JnK4UDFHaR5WsKB8fVSkDtNdzYXmatdPgFYVs8eda?=
 =?us-ascii?Q?67RmibBn18kPBYkgMVwm7KAi/J0Tms9W3cIRJmVRHN00EREfcYPqtaEVnTtH?=
 =?us-ascii?Q?nBWbbhRjiyc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB9135.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(19092799006)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q+AsWoliDh3cggDGk4NgluNZwqZoeRiFJLFe4vbJhtJ/la1cyUuicUU5izqI?=
 =?us-ascii?Q?VcNJZ6v+2z29U9lgRxfibYJG8uojZDs/woYWbWwRjoCDPeMudd2tPvMhXBKW?=
 =?us-ascii?Q?12iFdNhdGeI8nRkDHRfWQ8dmEzqUTKLrSMRRk3ZTAh9jdYE6J55PsvSkxpKO?=
 =?us-ascii?Q?MJ5rZEpygzzItQShnaKJfRvTDSdNO8PtD46JJ6gYQVlYPiNBuF8/E8ERBh5l?=
 =?us-ascii?Q?KLxuS1GIOQZtq6XRc/Ltm5/6nh5juBGDWiiWDqPefBpP8gQKBywJyfqQbLai?=
 =?us-ascii?Q?Im4aes+Z8g+xsncwnf5svM465u60K0INetAXpxPsVJ3xee8FMiotG/vss/rr?=
 =?us-ascii?Q?mrExlNH0/GEJE4RrMC3ZyY7c7o7a6OqlOOaSzF8hoYAvDFbjvh0VWCYwUzNd?=
 =?us-ascii?Q?Q/fmdf1aCJ4wxuv+WKU1Jqmkul2ydmsayjCUFfwbbvIsVzMwrqPDEycR2bCa?=
 =?us-ascii?Q?WCop2ulJTN9iuEpPzxTrg5vKpUjz0y7VmwPP7sEyjyFnCYduZjq1/LCHMoZz?=
 =?us-ascii?Q?okBNTIhMNRJPZL+wojZQ/E2jR7v6Fw5eFA4Sbd+oESMBV/X3kk1RQKYP9xpL?=
 =?us-ascii?Q?UF2X1EokXiOkoPJyoJ8wpG1aZV1LwDyHn/mAHMYSohfht0kE5hIE5I67/pO9?=
 =?us-ascii?Q?coHjkMJwdKxAPQUFNqunO+zozL2kUdy9kYs8vt8fI1Q1MazMW3vnS4+bONeI?=
 =?us-ascii?Q?kCk3wjC0ZAoEl3mxm++DDzHvccIhijtTqYcvu7VYyBHnNSoFpwWXR3ZmsrPt?=
 =?us-ascii?Q?5L6UFpIpf1GztXxksS8blJMVZzLJeazPaV2uQasJWNWUjoFiGKlx3oC8Z4Id?=
 =?us-ascii?Q?Zv/I2ZdO7A2iupmy4DEATERLvQTJWQRun13BUIhWKcYSxZ8QLAlcPKB2IHN6?=
 =?us-ascii?Q?itJWYNk2Mkohc0DEmlTL54hETj6vHQo1CVoziir2QHVoPIs0vpwU2nJ77Hvb?=
 =?us-ascii?Q?mSZLxE6rDPfMwyc497xpr63BAaDdX6dD/tkSowS+jm6+LGQm7WVPcWWWQOiM?=
 =?us-ascii?Q?SmgGM6W1vu9N8ZpQWxPOKWv40+tqVHenr5iK+x8GkGx7B9vFfqwYt8Xd8xFp?=
 =?us-ascii?Q?0CZknwwm8uL8POqhdfpKDSFOnMrq9TJm98V/Xqdjc2PNsTwF8siouwspt1Av?=
 =?us-ascii?Q?r+M5AE9ydcsw7/cCUPVzmbKV2lxdZ9IOdXGa8RDTSOg8GwaR815jvFL1Fz9R?=
 =?us-ascii?Q?8G/ZUzE19LLNKToqXqP+FEVJUs0gYhRHdw/54LA/Bc8O2By+2m0t5pyV60WA?=
 =?us-ascii?Q?DacG8KM6QMlX2EMOJEhWgjSVmYluRn+nS3PLA/4rZr1/mjMuHgL4i4EI2g/R?=
 =?us-ascii?Q?5T3p0C5GtyxlY5WqgjN4IExOneF8OV5wbwsAeFByQQ7M2dchQ3tfXI5J7T5P?=
 =?us-ascii?Q?veWMyoaBsJzdCzu0ffeZlgpe+SOBmS8AMzWxUxp5YdTYOj5u0whSObM9c5mn?=
 =?us-ascii?Q?86lE9LxiDtDCnQ7LOK0+xMjaeuypZqvc3wEJUs1ezwecnql5Kam0OUgSObvs?=
 =?us-ascii?Q?FO2vxEYpYSTbcTFtrt3FvzGoZkiV9gIjQDviT6PTdTClfiLPqY4+rSgDDB5y?=
 =?us-ascii?Q?Df1FY0076P5Hswir4RrVGksmJHLSCcNL0Umw9JLUmdqy40MXG42NeQiv3Y5Q?=
 =?us-ascii?Q?WA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a87c9c24-a537-45d4-4652-08ddcf68f16a
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 12:59:39.2496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LFo85hOpr+ayq1JYGS3c7BNI1BFa4qUGaV6DWoeNfwtX3lve1E3FP3tpr/eRx9UQMpjpRexDwukGkPEJhFv1Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8763
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_060000_229399_131BDCE0 
X-CRM114-Status: GOOD (  18.09  )
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

Add a platform data (pdata) member to struct imx95_blk_ctl to store the
result of of_device_get_match_data() during probe to avoid redundant
calls in suspend and resume functions.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
 drivers/clk/imx/clk-imx95-blk-ctl.c | 36 +++++++++++------------------
 1 file changed, 13 insertions(+), 23 deletions(-)

diff --git a/drivers/clk/imx/clk-imx95-blk-ctl.c b/drivers/clk/imx/clk-imx95-blk-ctl.c
index 7e88877a62451..c72debaf3a60b 100644
--- a/drivers/clk/imx/clk-imx95-blk-ctl.c
+++ b/drivers/clk/imx/clk-imx95-blk-ctl.c
@@ -36,6 +36,7 @@ struct imx95_blk_ctl {
 	void __iomem *base;
 	/* clock gate register */
 	u32 clk_reg_restore;
+	const struct imx95_blk_ctl_dev_data *pdata;
 };
 
 struct imx95_blk_ctl_clk_dev_data {
@@ -349,7 +350,6 @@ static const struct imx95_blk_ctl_dev_data imx94_dispmix_csr_dev_data = {
 static int imx95_bc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	const struct imx95_blk_ctl_dev_data *bc_data;
 	struct imx95_blk_ctl *bc;
 	struct clk_hw_onecell_data *clk_hw_data;
 	struct clk_hw **hws;
@@ -379,25 +379,25 @@ static int imx95_bc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	bc_data = of_device_get_match_data(dev);
-	if (!bc_data)
+	bc->pdata = of_device_get_match_data(dev);
+	if (!bc->pdata)
 		return devm_of_platform_populate(dev);
 
-	clk_hw_data = devm_kzalloc(dev, struct_size(clk_hw_data, hws, bc_data->num_clks),
+	clk_hw_data = devm_kzalloc(dev, struct_size(clk_hw_data, hws, bc->pdata->num_clks),
 				   GFP_KERNEL);
 	if (!clk_hw_data)
 		return -ENOMEM;
 
-	if (bc_data->rpm_enabled) {
+	if (bc->pdata->rpm_enabled) {
 		devm_pm_runtime_enable(&pdev->dev);
 		pm_runtime_resume_and_get(&pdev->dev);
 	}
 
-	clk_hw_data->num = bc_data->num_clks;
+	clk_hw_data->num = bc->pdata->num_clks;
 	hws = clk_hw_data->hws;
 
-	for (i = 0; i < bc_data->num_clks; i++) {
-		const struct imx95_blk_ctl_clk_dev_data *data = &bc_data->clk_dev_data[i];
+	for (i = 0; i < bc->pdata->num_clks; i++) {
+		const struct imx95_blk_ctl_clk_dev_data *data = &bc->pdata->clk_dev_data[i];
 		void __iomem *reg = base + data->reg;
 
 		if (data->type == CLK_MUX) {
@@ -439,7 +439,7 @@ static int imx95_bc_probe(struct platform_device *pdev)
 	return 0;
 
 cleanup:
-	for (i = 0; i < bc_data->num_clks; i++) {
+	for (i = 0; i < bc->pdata->num_clks; i++) {
 		if (IS_ERR_OR_NULL(hws[i]))
 			continue;
 		clk_hw_unregister(hws[i]);
@@ -469,14 +469,9 @@ static int imx95_bc_runtime_resume(struct device *dev)
 static int imx95_bc_suspend(struct device *dev)
 {
 	struct imx95_blk_ctl *bc = dev_get_drvdata(dev);
-	const struct imx95_blk_ctl_dev_data *bc_data;
 	int ret;
 
-	bc_data = of_device_get_match_data(dev);
-	if (!bc_data)
-		return 0;
-
-	if (bc_data->rpm_enabled) {
+	if (bc->pdata->rpm_enabled) {
 		ret = pm_runtime_get_sync(bc->dev);
 		if (ret < 0) {
 			pm_runtime_put_noidle(bc->dev);
@@ -484,7 +479,7 @@ static int imx95_bc_suspend(struct device *dev)
 		}
 	}
 
-	bc->clk_reg_restore = readl(bc->base + bc_data->clk_reg_offset);
+	bc->clk_reg_restore = readl(bc->base + bc->pdata->clk_reg_offset);
 
 	return 0;
 }
@@ -492,15 +487,10 @@ static int imx95_bc_suspend(struct device *dev)
 static int imx95_bc_resume(struct device *dev)
 {
 	struct imx95_blk_ctl *bc = dev_get_drvdata(dev);
-	const struct imx95_blk_ctl_dev_data *bc_data;
-
-	bc_data = of_device_get_match_data(dev);
-	if (!bc_data)
-		return 0;
 
-	writel(bc->clk_reg_restore, bc->base + bc_data->clk_reg_offset);
+	writel(bc->clk_reg_restore, bc->base + bc->pdata->clk_reg_offset);
 
-	if (bc_data->rpm_enabled)
+	if (bc->pdata->rpm_enabled)
 		pm_runtime_put(bc->dev);
 
 	return 0;
-- 
2.46.1


