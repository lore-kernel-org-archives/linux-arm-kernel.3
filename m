Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E74CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 17:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1koqH0E0qJmiPIFwnSdrCnYxju+8bSv0nXlAqye8tFQ=; b=LDqe+JDUrt9DgrD8dNReGelQBP
	9livTg4drWGfIf/AqboNeB0CWwsMRxfxvn18ySM1tl+DqDHWUd/Y16x+m7aavAK8sxM6tIwuzqfGw
	gf5D7dh0+QDjpioaGCHyutipMcv6Hi9HAzdR/CoY3+U6zu7bQROPgAB7qMVIsGnLQp8Yd5OscLsRr
	RNndzVKUasAmaKsp4PPMX3Qgqp6vl7y0f1nubWLOWgr5Ee4KAiJHI/JguERsOJWbRlXH2h8uxt8Gr
	Re5WSaENZ3nuuR/2w5TYPKzmfKp9Wq+F5LoySZpZn3f35s8Oo1Y8ejkrLt+nClzC8F2in1hN5cjgc
	QidbvOXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uprdj-000000056H0-0cTf;
	Sat, 23 Aug 2025 17:02:51 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upqgc-00000004xm0-2nsE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Aug 2025 16:01:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qsifHz1YMkBUJCP4cg/dwK1uNHfvDk2mjTi1/r2pZO9O9zNGMBL3A5THjsRl3nUk78H1NOmaRtUMStrbh/h2e87ZvST/mWojyCnVJL3z+tkF38/1YoI/FlOK4BpY9a25aS7VwIa3F5n7IbkjeuoYZjsm0z6JnDZ/C6WM9idXwBLIMgF6Sje+vAwA5SBgaj6LFvX8c4A/gdTHi4wFnb+DrHYxWowpkhNPHI/r9vN8DduUU6H3H7tO045mLiJN3/iiK8SnDSkWV/NQczQ1Gls2e6aInC64UJ5ZeLbkNvxgPIVhnhKCrH/fLB6UhSubVyMhLm6+EIq/urIsv33DKRivFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1koqH0E0qJmiPIFwnSdrCnYxju+8bSv0nXlAqye8tFQ=;
 b=Q4eJ6gLg6r95akTiQUU5mQS2lQpLpW1cKznttHqSMp6351w+c/GC/DJePsdOIvgOMczRSyhY5AudOAyYY9RF52/U3xRMuF2h/bw9qkWI0zPK5Ez3vCEIs+MH5nmLx37Nqp/ukmmMu4enY0ZTv2vUCxnhJFPP3lFHiIQrgiFM08T1oVqZkE+hztpbTEWi7NGpTZ6RcCVGFolCFLtp1d5frppNoVtbj46IwTse3RNey7ecFvW7PjDPQS20a+KJbQYpJCIxr/cErsAVPYZYquewQV0F4zYTc6PwjSZjLGcL4RSOn5n7336NzLvRUTuGSwhC0VMmtFtKdit4YY4o9XoSeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1koqH0E0qJmiPIFwnSdrCnYxju+8bSv0nXlAqye8tFQ=;
 b=r1yOQg/65nsaRgzFzAITtZIXeBHQan2oZ16dU04dDCaiJuHTRSJcac1KdUCByZNjnbHTNPR/dWyxkDLsHAQbSF/68oOD6bVwn8u5RsDZYI9dZzo++A8UgaE9RaYNmeCV7yk1SRhCRvTq+XOPzZOFgObx8H8tap+M8dapZRjjgWjkEU6hwh2r4FxaJpn/Tsil6mCMTZwsb5TCCQ+xU1EaG+lzhGOrrCRTL66bEx13Ho0MZ4cJP/nrvxr2eKvM1AzVGcyZJ+Dpqs0/lrhYTF1JtMcn9cJvUD83cghzF9rcTxTr/OZjBHJ5uegwm3hJgAxjS729Eg7qn9u//tDf+f3o6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by PAXPR08MB6399.eurprd08.prod.outlook.com (2603:10a6:102:158::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Sat, 23 Aug
 2025 16:01:37 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%4]) with mapi id 15.20.9031.018; Sat, 23 Aug 2025
 16:01:36 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ray Liu <ray.liu@airoha.com>,
	Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v5 12/13] spi: airoha: avoid reading flash page settings from SNFI registers during driver startup
Date: Sat, 23 Aug 2025 19:01:15 +0300
Message-ID: <20250823160116.3762730-13-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250823160116.3762730-1-mikhail.kshevetskiy@iopsys.eu>
References: <20250823001626.3641935-1-mikhail.kshevetskiy@iopsys.eu>
 <20250823160116.3762730-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF00007568.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::3e6) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|PAXPR08MB6399:EE_
X-MS-Office365-Filtering-Correlation-Id: b5ed22de-0d92-4cdd-20fd-08dde25e56c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+klBfyNbOmGU0kzfzsa8+Y/lno/b7pJ3obJGDtbG4s4laQAqqIAkMvNTBWnn?=
 =?us-ascii?Q?apYXi5J6b7bcGiNqrvdHN8pXDkAb5d1k8r2QURmjsLhVvFrmpJdfkZGnycBh?=
 =?us-ascii?Q?lXLHjB7DG4ojFepJA/FREu7m/hs/iGZ9rZaHMLulzRAMp3Xz4V2c0jNP0wK9?=
 =?us-ascii?Q?pEvVEW3KIOJrfEGbPKzGJtx3FtRKv1zTRKdm38l7o0qShH8AzXDW6KCOrUsX?=
 =?us-ascii?Q?BcvzbqP6zwFw5yVmUSnV54kRTUmK2mSKuvYcrwfeAIPaSLQ01oPnSUnc93+6?=
 =?us-ascii?Q?suy0zzzRVb8ae9e6+H6n6EAxEQiSH9uvwcsLF+hdi3MvllVn8lagvpCcIxJj?=
 =?us-ascii?Q?AidbWCnOoGVFMFSQ3CkqyI5y6FVcKJkJXdfbGcBUqBXZhxa7uyHNs1oKnjWx?=
 =?us-ascii?Q?DLH+7fEmT5InDhbYnLHyoYsNpBJuhyuLSVRfs2WoX5TjvGOJWRWwbkoPCks7?=
 =?us-ascii?Q?gDrWlbJZM9VXU2l78RxZ1KJDXo5/H2rVQvMIR7dleyLFKVDyJ/b/tGYC6PFb?=
 =?us-ascii?Q?cuvFuiwcWRJcidqhk0StMiUp9Vg/eRPyG9mTb4fBx+nknOyGMSJ1onOTSfDS?=
 =?us-ascii?Q?q0sLMON9QXEzwn2sJgF1qz95RI1QkgKDq/aT9Z/FYEmaaxVRjj1qBR5waffl?=
 =?us-ascii?Q?0yGNAd3lvrOeK9OjNSeeswF8QYt/MY4s4VrokPXMj0jS6UrM2kkfyAMHzjzK?=
 =?us-ascii?Q?yQ2R/s5sCVI/W4lT1dsJKKcEyEz1fs1apEJZZcarIVCXfdYp315o70a8FDPP?=
 =?us-ascii?Q?S15Nd3Oas80PkeM6l5ub6EhCmlFTGmOBuP9qkfi/XUGxMSS0PHo5Qk4t/swr?=
 =?us-ascii?Q?5RC8nkg/AQdzHTAESS2Oyd4/1pR0of9AzfsQJ+l4qB4i8kLPQhoNC2BcSErp?=
 =?us-ascii?Q?90bVPSK4aBZmyknCjattzD8NJhafTR7sxwTDPb597b6jWdiNnp/I675+ASgT?=
 =?us-ascii?Q?Bcc9Z1XCr8NsYa6PmXn8322pQZ68wejlXVz3udWhLPqsd2M5ml24rV6gFbIf?=
 =?us-ascii?Q?xt+A2jvJ5Ya05YNCBYEQSvI2n279sctlO51hmLWDvoV3y9DKY6IdTn7vXIcO?=
 =?us-ascii?Q?a+W2/X1VKncoOB1/m3JaqVYr2xSoiW9kmIkHR7sFnRnZmxUHiGaY2Pr3lb3e?=
 =?us-ascii?Q?+sBEvIp1Kwil/spnm46VrCaCQTno/TD5aeochjLv1dUB150VO8H+qII6Vg5/?=
 =?us-ascii?Q?wtrxwy45fNRE5OPN4u0lHXWE8SgR/ASczFxQxOpmjrtBrEJPj4BsnS2OwDxA?=
 =?us-ascii?Q?oRfBuBQb0x/8+kjpdTrRw1tWmA9s5xvZepTlSE37VeVFm2qOAF7W5gmRj24/?=
 =?us-ascii?Q?WzF5gxqgpe/LLrqTPgRnYtJh4cSvv95JShHctBQFoA/1XWEv3oO1AcKqSc5r?=
 =?us-ascii?Q?vQg5VYg5yLhOpzDMfcQqPJOzji6+chZqJgo1D0OZnsQPSWpYo12p2qviXUfM?=
 =?us-ascii?Q?Pan0/MYZM46oV11WQWA7uXSV/gBJnO7cUAENGkbFczsJZxRKhh/pSw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A4MQgh5kj2wYU4VVRrkTzAwEZYl0iOuTK+Wx4dYC3EnHOPc5SJwtbtSH8hAE?=
 =?us-ascii?Q?ybrHBDrNkizEjtTE/ehsPGiPEwR7pBOFfv0pESQt88N/uN34GRrDNHzXBbGb?=
 =?us-ascii?Q?EslH1oNvw9YKRwxdq6tZLNlRLj0TkstEb+jeH0B9xnFCVdI+zvdN+cG5EZGC?=
 =?us-ascii?Q?gFyw6d3jxZYtWEPbh8hTl9gZgp/7rIEVynOp/llipxrA+D63QDL15WGmbChM?=
 =?us-ascii?Q?CSR8KBHmoPIpUE/2Hn7fDzu5Yh5NXZfxVLs2k8ucJuaMdIRKnaxnuxK4Xn9u?=
 =?us-ascii?Q?OkFI34wTSdcUyt5MKbkEk3oiXyQ4IFdFWX0piWjPRsMuZHqEcg++T9JCd8Md?=
 =?us-ascii?Q?yYVr9KDWctWgAs/rbLiI9dd8uA+v5olh0VX0w5VhlM2xYswVxHUWy/EMIbuO?=
 =?us-ascii?Q?KCr5keDojJtIy1iMvAuO+2X3nU+BGldzHE0w5VnovK3OFLNvZ+Bil3jMrTR0?=
 =?us-ascii?Q?lgjtAFnh4EoJ/sZJZF9934vnnr0/gdDKVPgeFi7uMr8L1yLV2yzpVAipdR95?=
 =?us-ascii?Q?GgQiNxdjxXs9bSNGdTIA9T18aw8Hq2knOwYJhgpqurify8zW8OgdnNQdILZJ?=
 =?us-ascii?Q?dBF0xH2Qq490nyhV2aWPat0fAYGYFC/Dol8r4JjIqI3v3lHQ0REUDuRIwHj2?=
 =?us-ascii?Q?Xxodfp3Mc4gaARTaYCYpBoMZjSSYbeyCewVaJLl37X2Wg9AHN/hg1Ya7eOjn?=
 =?us-ascii?Q?Pxxx/RkxwumRPyBl7NAIQFjnjbNL1Qx9SanZozfx5DlNXLkXVAl9LAS5w+eE?=
 =?us-ascii?Q?3RiJzCXFFOFTuJivCRySxcLNrwuevWCOi/G6h1t8gKt/dGeI5QwxpMTlEaK1?=
 =?us-ascii?Q?O4egzsfZoqOCbKo+1iq+zNAuV7k05hcZTx/GMfExD7DoiKjkHv21xOVNy/R5?=
 =?us-ascii?Q?wQqwnopUhfn4OYG7eNeGqgSSiKs14QjzI9lXPGeEZbP0W2m9BmuW6QAQ/HC3?=
 =?us-ascii?Q?iGC98QUvt5FBscZsYWdq3Okautmh/4Y5EIH3UX9XgCCeSgEuSHDZUado+UET?=
 =?us-ascii?Q?jRD9UExHo8dZD1Fdsndg1KZ6iyto+zvp6nDaSK7+XpZtASko6vhg9xTbVeH8?=
 =?us-ascii?Q?GYaliwqILb54lePb4oN+6Ju3AeiBHqbX/v01Aw4rAqC3xyPYJGhNtTODGXWH?=
 =?us-ascii?Q?5Dr2zaq732GMG+0WwWuYCMtLwUs5VqvEMNogOq6W5vvIcXpiUj+Rw0DYVSzc?=
 =?us-ascii?Q?2Krmr+GG9z3wzNTXjXbvhMc2zvSackAYYTqDhECUUELht/ddwA755cVT9EQj?=
 =?us-ascii?Q?78S4fDaV2jhlaiMU/aKLxxoCHObg0CTfLEmD1maRSO9Ma/FB61LzfocnMGQb?=
 =?us-ascii?Q?EKnRcBgNhJLbbLmJugZ1ZuBFoJGcm0K0SorcFlLXpEE7NO05wX8v0MbKwliB?=
 =?us-ascii?Q?HGEDoAjsX/tgdlHqehVmnA1QEht6hGhFjI8egNPvfxAVOuIX2TbIFU8G/i6z?=
 =?us-ascii?Q?lpGvwDvkuiBVeOHwVr+LFqfIJ6CxNadLHpEo6nrTCdZdVA5Uh3m83vyyPKOv?=
 =?us-ascii?Q?z6Yi4fKYoAOr1evyrbOQZnhXMOtKUJksjSTbtVuf+5YpbERn7XnRYtYcj4uX?=
 =?us-ascii?Q?skxk06Xj64ftDWmpor7QsekEXbLQvtoHTD2qgiBUD2zUGX9ytZ2yDPts8Ns/?=
 =?us-ascii?Q?7PfNN7nkH4qq5ewYLqqeL+k=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: b5ed22de-0d92-4cdd-20fd-08dde25e56c8
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2025 16:01:36.8809
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5G0FlaUAp8RtfCVmKLx6R979Wbl6TKAAEDDQ2FE3qSu8gogW/XEdaRU0S5RQFLHLEUgUhQifpODdo7MXfBKm2SsvnF20VC2aofiR+PLD4bE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6399
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_090146_711429_3813B61E 
X-CRM114-Status: GOOD (  15.76  )
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

The spinand driver do 3 type of dirmap requests:
 * read/write whole flash page without oob
   (offs = 0, len = page_size)
 * read/write whole flash page including oob
   (offs = 0, len = page_size + oob_size)
 * read/write oob area only
   (offs = page_size, len = oob_size)

The trick is:
 * read/write a single "sector"
 * set a custom sector size equal to offs + len. It's a bit safer to
   rounded up "sector size" value 64.
 * set the transfer length equal to custom sector size

And it works!

Thus we can remove a dirty hack that reads flash page settings from
SNFI registers during driver startup. Also airoha_snand_adjust_op_size()
function becomes unnecessary.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/spi/spi-airoha-snfi.c | 115 ++--------------------------------
 1 file changed, 5 insertions(+), 110 deletions(-)

diff --git a/drivers/spi/spi-airoha-snfi.c b/drivers/spi/spi-airoha-snfi.c
index babf7b958dc3..437ab6745b1a 100644
--- a/drivers/spi/spi-airoha-snfi.c
+++ b/drivers/spi/spi-airoha-snfi.c
@@ -223,13 +223,6 @@ struct airoha_snand_ctrl {
 	struct regmap *regmap_ctrl;
 	struct regmap *regmap_nfi;
 	struct clk *spi_clk;
-
-	struct {
-		size_t page_size;
-		size_t sec_size;
-		u8 sec_num;
-		u8 spare_size;
-	} nfi_cfg;
 };
 
 static int airoha_snand_set_fifo_op(struct airoha_snand_ctrl *as_ctrl,
@@ -490,55 +483,6 @@ static int airoha_snand_nfi_init(struct airoha_snand_ctrl *as_ctrl)
 				  SPI_NFI_ALL_IRQ_EN, SPI_NFI_AHB_DONE_EN);
 }
 
-static int airoha_snand_nfi_config(struct airoha_snand_ctrl *as_ctrl)
-{
-	int err;
-	u32 val;
-
-	err = regmap_write(as_ctrl->regmap_nfi, REG_SPI_NFI_CON,
-			   SPI_NFI_FIFO_FLUSH | SPI_NFI_RST);
-	if (err)
-		return err;
-
-	/* auto FDM */
-	err = regmap_clear_bits(as_ctrl->regmap_nfi, REG_SPI_NFI_CNFG,
-				SPI_NFI_AUTO_FDM_EN);
-	if (err)
-		return err;
-
-	/* HW ECC */
-	err = regmap_clear_bits(as_ctrl->regmap_nfi, REG_SPI_NFI_CNFG,
-				SPI_NFI_HW_ECC_EN);
-	if (err)
-		return err;
-
-	/* DMA Burst */
-	err = regmap_set_bits(as_ctrl->regmap_nfi, REG_SPI_NFI_CNFG,
-			      SPI_NFI_DMA_BURST_EN);
-	if (err)
-		return err;
-
-	/* sec num */
-	val = FIELD_PREP(SPI_NFI_SEC_NUM, 1);
-	err = regmap_update_bits(as_ctrl->regmap_nfi, REG_SPI_NFI_CON,
-				 SPI_NFI_SEC_NUM, val);
-	if (err)
-		return err;
-
-	/* enable cust sec size */
-	err = regmap_set_bits(as_ctrl->regmap_nfi, REG_SPI_NFI_SECCUS_SIZE,
-			      SPI_NFI_CUS_SEC_SIZE_EN);
-	if (err)
-		return err;
-
-	/* set cust sec size */
-	val = FIELD_PREP(SPI_NFI_CUS_SEC_SIZE,
-			 as_ctrl->nfi_cfg.sec_size * as_ctrl->nfi_cfg.sec_num);
-	return regmap_update_bits(as_ctrl->regmap_nfi,
-				  REG_SPI_NFI_SECCUS_SIZE,
-				  SPI_NFI_CUS_SEC_SIZE, val);
-}
-
 static bool airoha_snand_is_page_ops(const struct spi_mem_op *op)
 {
 	if (op->addr.nbytes != 2)
@@ -571,26 +515,6 @@ static bool airoha_snand_is_page_ops(const struct spi_mem_op *op)
 	}
 }
 
-static int airoha_snand_adjust_op_size(struct spi_mem *mem,
-				       struct spi_mem_op *op)
-{
-	size_t max_len;
-
-	if (airoha_snand_is_page_ops(op)) {
-		struct airoha_snand_ctrl *as_ctrl;
-
-		as_ctrl = spi_controller_get_devdata(mem->spi->controller);
-		max_len = as_ctrl->nfi_cfg.sec_size;
-		max_len += as_ctrl->nfi_cfg.spare_size;
-		max_len *= as_ctrl->nfi_cfg.sec_num;
-
-		if (op->data.nbytes > max_len)
-			op->data.nbytes = max_len;
-	}
-
-	return 0;
-}
-
 static bool airoha_snand_supports_op(struct spi_mem *mem,
 				     const struct spi_mem_op *op)
 {
@@ -641,7 +565,8 @@ static ssize_t airoha_snand_dirmap_read(struct spi_mem_dirmap_desc *desc,
 
 	as_ctrl = spi_controller_get_devdata(spi->controller);
 
-	bytes = as_ctrl->nfi_cfg.sec_num * as_ctrl->nfi_cfg.sec_size;
+	/* minimum oob size is 64 */
+	bytes = round_up(offs + len, 64);
 
 	/*
 	 * DUALIO and QUADIO opcodes are not supported by the spi controller,
@@ -833,7 +758,8 @@ static ssize_t airoha_snand_dirmap_write(struct spi_mem_dirmap_desc *desc,
 
 	as_ctrl = spi_controller_get_devdata(spi->controller);
 
-	bytes = as_ctrl->nfi_cfg.sec_num * as_ctrl->nfi_cfg.sec_size;
+	/* minimum oob size is 64 */
+	bytes = round_up(offs + len, 64);
 
 	opcode = desc->info.op_tmpl.cmd.opcode;
 	switch (opcode) {
@@ -1076,7 +1002,6 @@ static int airoha_snand_exec_op(struct spi_mem *mem,
 }
 
 static const struct spi_controller_mem_ops airoha_snand_mem_ops = {
-	.adjust_op_size = airoha_snand_adjust_op_size,
 	.supports_op = airoha_snand_supports_op,
 	.exec_op = airoha_snand_exec_op,
 	.dirmap_create = airoha_snand_dirmap_create,
@@ -1101,36 +1026,6 @@ static int airoha_snand_setup(struct spi_device *spi)
 	return 0;
 }
 
-static int airoha_snand_nfi_setup(struct airoha_snand_ctrl *as_ctrl)
-{
-	u32 val, sec_size, sec_num;
-	int err;
-
-	err = regmap_read(as_ctrl->regmap_nfi, REG_SPI_NFI_CON, &val);
-	if (err)
-		return err;
-
-	sec_num = FIELD_GET(SPI_NFI_SEC_NUM, val);
-
-	err = regmap_read(as_ctrl->regmap_nfi, REG_SPI_NFI_SECCUS_SIZE, &val);
-	if (err)
-		return err;
-
-	sec_size = FIELD_GET(SPI_NFI_CUS_SEC_SIZE, val);
-
-	/* init default value */
-	as_ctrl->nfi_cfg.sec_size = sec_size;
-	as_ctrl->nfi_cfg.sec_num = sec_num;
-	as_ctrl->nfi_cfg.page_size = round_down(sec_size * sec_num, 1024);
-	as_ctrl->nfi_cfg.spare_size = 16;
-
-	err = airoha_snand_nfi_init(as_ctrl);
-	if (err)
-		return err;
-
-	return airoha_snand_nfi_config(as_ctrl);
-}
-
 static const struct regmap_config spi_ctrl_regmap_config = {
 	.name		= "ctrl",
 	.reg_bits	= 32,
@@ -1204,7 +1099,7 @@ static int airoha_snand_probe(struct platform_device *pdev)
 	ctrl->setup = airoha_snand_setup;
 	device_set_node(&ctrl->dev, dev_fwnode(dev));
 
-	err = airoha_snand_nfi_setup(as_ctrl);
+	err = airoha_snand_nfi_init(as_ctrl);
 	if (err)
 		return err;
 
-- 
2.50.1


