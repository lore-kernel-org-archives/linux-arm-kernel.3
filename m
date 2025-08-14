Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFE5CCA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 00:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JPbnyjEfliIEZ2M5umF/6IDD7Y2QGZ//ehGr6c6MePI=; b=pSPbM5u9X8aNprqQgLkdHXR7UU
	CUvxp1BOsANMVh75E8GHkBJfx+ssZzYtFPCXaYbpnM0K+u12M8BIQ29VxVpEuo8xUZ0By2TmP3Gnw
	2w4VS3MDqu0wRRpFUYNGYZp5ZEqtzwaFPCO01wfflFydXZr5eiL/Vfi/oiP4y6SkDrE/r1e9diqEP
	ePsJSh1VBOCgvO7UV3S1LuJsHy4poYrEzSf5vpiyPzFQknVMTX5y/iBTXf6qqpScnvLptdZY6/6bC
	B8hS7Dw1FjzjV81s+zqCM8J4nQtE14u7J9sF/OH+QsGwq7qGypgfQP7QZgeYaCC6nI2SVfEI2CcsP
	QIYjmZTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umiCJ-00000000sf4-27jp;
	Fri, 15 Aug 2025 00:21:31 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umh7X-00000000lW8-0DJK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 23:12:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lhByrE/r2WAAYDFwDu+ilp+jDKuQtY/2QB3o8gSlwij2gKfo+d48OwMZ5thuqpZGuyzQX7RERSDzvP7QHDD+b5tchcnKYQb9XjYH5q6v9ZLTGobvSPykMatBdwly0buJnk9qAlvGYwpPT3RJ6FmlPxLLjijABHSb32RYrCIbI3koEOhqiKa3JWcUooaN3gZEoS2G0M4MYs8W2/tGGEyoWTkkdnMk9GQjx6d3RZkVqjMmSbAd3PSb6BcDcb11WZoJv530s21BRjssJ4+FgIuh+iTt2m4MoKD6HXPye8kM+5fF+USiCfIDRHE9OupL/PP4VeOUB3fhbZccFzup0NyYMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JPbnyjEfliIEZ2M5umF/6IDD7Y2QGZ//ehGr6c6MePI=;
 b=ANsoLCHRWkrNV7pYw7DdmBSTqfKyRig2MLmZhs4wamRoabIhN65Q+tqCW0KU0IvNlarIhEhKxcyrALEN1OH0IPf4Vbkko29dgG8LuyCTgP514Vs0p8Xc1hKY8mMeHN0e3ObVt204I5aKNpswiUCdPTEq0ICmdjmwWAdh+ytB/P1fVvo/ekZ6jTQhJpYFDsRLhVgc5zpEeNKVCThvdhgkILMIju6L3Sr1qKW1RiUWIJHboGqITCU73kJC0GL06wf5jD4VT1Tja420Qp4BJl6hPvePZ3lhDSZDQCp6qAIkoWlvRJXTTCYTyWfCf/o+PowDJ3/Wat5DaEH4Iva1jR/dsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JPbnyjEfliIEZ2M5umF/6IDD7Y2QGZ//ehGr6c6MePI=;
 b=A+buig92Z9q0dDsPt7NxpzbzGYy5Tuh8Sevq437MGs46xkotjD7WYv/I98Jb7NOLIZ2K5DFznPwXlstjpym6VnVapZ25UhPAI0yfFPMD3kzbkVZVWHNHICBWIqbsAgwPj5rojsXzslayBZI8B3Ws8MPydrPi50uUJM52ZmvQnSF5qchcL8g+qJYaPrfpBDYhnvEafU2GNeYbZZbtWIjYDAkFKctqmyG8GFfsgCMCvNsnRCnONNoq+iDlacZDHCH24CCQaagYrWyjh2sljx8/tvtb7DfzKmYZ39Kxfs0bYo1vR9UIy7a3xJBGB2OhpH+KdkvPUjrbd41eFyqthh9kMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by PA4PR08MB6032.eurprd08.prod.outlook.com (2603:10a6:102:e4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.16; Thu, 14 Aug
 2025 23:12:22 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%4]) with mapi id 15.20.8989.018; Thu, 14 Aug 2025
 23:12:22 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ray Liu <ray.liu@airoha.com>,
	Mark Brown <broonie@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH 04/13] spi: airoha: unify dirmap read/write code
Date: Fri, 15 Aug 2025 02:12:01 +0300
Message-ID: <20250814231210.4174427-5-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250814231210.4174427-1-mikhail.kshevetskiy@iopsys.eu>
References: <20250814231210.4174427-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0190.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::15) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|PA4PR08MB6032:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a858c80-b1e0-4c65-c66e-08dddb8805f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?p5Hvl9n0wRocC12NRxFGuejayPss9zMBCd/2wxo3i7a6s5RAfY7jUs0/AJaE?=
 =?us-ascii?Q?tbNYnI+Z/3IxscCpmGJGKZLzuBVpFXyPNaxA8ZJaTFgjGEDN4fH9TZ2iyY7R?=
 =?us-ascii?Q?krgRhqcl8uqy2CEljowpIZILcJUlEbF9UkxbMRWXbRCx/zWKlfWStRMtY4VC?=
 =?us-ascii?Q?XN2irZcRsa1f7pzQ9nyAhoI33V9qWFaZMqsBCSQOe9P1RGrGpgPDVbyjDXFS?=
 =?us-ascii?Q?ZPCQDQH1//7YMPuArQjBxckJOuF7zH8d2dLrhJvvuzQ9pGgEDwPRzlfuiKzp?=
 =?us-ascii?Q?BQP1NiX7PhmIXHQvg29KtqXmai+qCthqG00M/S0+7c7d59FDvPS5h4nWivge?=
 =?us-ascii?Q?fAEugbqyE2uNL5PfOLTHINbuG1bdFLGkv1IaCUKvOSUHGFVXq7sNl4i1sPgu?=
 =?us-ascii?Q?m/P1d9ixbhNSa3PiIgZUKO2/hKEvr4N7At18DAxKB0fzPUU0su5B9FMAkqRc?=
 =?us-ascii?Q?qiAj8fz52I3zD8c2AMFKGTdf3QTsGfPJx5PIcW7ywylsoyU6NYVa3grurND9?=
 =?us-ascii?Q?0t1j+gi4uJuP9cSKA8Zj6iUJlxxhfQ/C3ceHzlIiNFfWr15Rz/O3m/d/E4C4?=
 =?us-ascii?Q?em4DPioK2kpeP7ldTv4CcUzMJul0iEai3DcEF826TGnbSyiemlK2pDzBxZqN?=
 =?us-ascii?Q?jx6mmYp+jqCrBEUfdrU23YpUr7VMbOHvkLz3E5owgi/uxCBQ5TiKSZKlFtjn?=
 =?us-ascii?Q?ijlIN1RxaUyN5R8AD/oa9pWaE1kVTRt239gV7+cIOE3ypiVRif11CwGp+kIr?=
 =?us-ascii?Q?nC6aNQTV7FOsQTDyp4xl+Dh2oY0fZxGgapYFtF0ju7tx/18xlNLWqSpW08az?=
 =?us-ascii?Q?S/a8fDf3lUJQDP3aLk096r07VOuQY2GaJvomnfV46UImcFoblEem1/iWRdJQ?=
 =?us-ascii?Q?gl9SXTKOwC1eYA9BKb6TFDXIj4wUNeTXsm0LEXiL+RWsSNXJl6H90Rxko4jG?=
 =?us-ascii?Q?o76xzbN3RBXdighMoAfNSaM5UtOHOKenvM93uNgSFlMkb9u2rYHsiS15I2F8?=
 =?us-ascii?Q?lrk+BguiQ1Q0O/GivccY9W2fj/RDQPwXrFMi0EexedME0dpXq1Veym5jcSPf?=
 =?us-ascii?Q?xYgUHHE1UbhCrVD18M0ViTIo5Ka7YYdkI7k6QXtP0NI9KBBB5HozAAQ2+BOe?=
 =?us-ascii?Q?+EUflvDDWMevctJ1Wyjdj62lLECFZMKPmtI73Xb3OEkVT5OAjrUr7pZ7YnD3?=
 =?us-ascii?Q?UwGxZWgby1lqysrJsjGRddw7Iv0rn3x0WxreQlBGI+ChWk6yQ0fJ33UqXSWY?=
 =?us-ascii?Q?0FP1U3SylFpyI8F7ffZzXCAkUUqwUfM3drNaba9OTtEpLKAjTHxCuAdf3fP+?=
 =?us-ascii?Q?tEKs0wPST+TMpPBF7RlmKvci8Qu+JQ/T/QIXf+/SrAHViFS2bd94VJG36bcI?=
 =?us-ascii?Q?hVTuV5x0DryKnszIdya7inu+pZQEtk12PcTfz1DEhmZqpafTStyo6PsnGKFX?=
 =?us-ascii?Q?Jqd4R6WlG3USdB066YhvV69LX2U6tf1WRoL+UAGKMW8iPfrVKoiKIQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fHYaBn2qHPHnz+kN/aL3wnHXwSQaVsqo9eBMUdaO8fmvdm4GqmZt3tsVmSvZ?=
 =?us-ascii?Q?aFIFEGQxvHXJ5ks2cBzcYrkbDvZmx5ru1HIryyQ1qmdropcZiU/hjAWot5m4?=
 =?us-ascii?Q?v0mVSrT5eYJ410kqAApnAEyTAmTwGjAJhB9YVZdp5v96DxObbTUvOBGSAJoe?=
 =?us-ascii?Q?3wbNMo57REWm23dSfRZempLw/iHrU++hHnyaoKGUNXY225hAaZSfEkhiLmdV?=
 =?us-ascii?Q?+0tWTmssdZLINsQUhsWennWlO6tx4e+8h+S05y6Zhx6VzCZGoEqPRXS3ij1J?=
 =?us-ascii?Q?HkMGdMFjaW2++3zCz1wjxM3s9WMD9BC4G1fsEXq4ndETzg1Km84edo9aI1QX?=
 =?us-ascii?Q?uCqdmB90Kc/4W8dSSwI+6ARwyFCapso5pMn9SjjDNR4nlCAgqTTIYC3eBxSa?=
 =?us-ascii?Q?L+ZYCNhA6HvvrDWe+cPDJE18mNMwZ6PBfGknKQUtoI56XqeDPAuX09DIS9H8?=
 =?us-ascii?Q?GkGoOyTOgfHwgHTjAAFVG6lo3lkdto1WUmBCzeDU06L0f0ZlJKQajTwaMseR?=
 =?us-ascii?Q?7zxaZ09b3wTrJ4JWdinrSbZkpnkelGZs+v6kOsey9MD9JdAEfHZMdpOlQpzo?=
 =?us-ascii?Q?+nfD+Ka0AEcx7phFE3/57cw2qfdzcSU2zKZLFX+lB0mBqqkNPLIHLh+7FgKe?=
 =?us-ascii?Q?g6wq9xLoPtXhiOmFirnPoF1mQBKLcPy1ikovbBKfzVrDaHHAeX4fUDKgdPTT?=
 =?us-ascii?Q?SA3tuzaI/PzWYHhyCCrOsH46jZhhKwoNYvcJj5+A2Ub1bcDZKrZ9OkE+C31a?=
 =?us-ascii?Q?jbt2A4C1nCB+bUEisEM99kvvlvkyWL/vQkonvaObSkNxzgXMk4QLBLx34o/z?=
 =?us-ascii?Q?hl/RaZXt91wkQ06qUz3rh0pfnKks+u1DQyNQJ/c5FzyL/Hs4qSGSfdEBY3Bq?=
 =?us-ascii?Q?yfllFAXnXcSqz3I/TYs4BNSoMjMpgANuIT0AfhFABJ7JwBA1UYYBS07f9YjT?=
 =?us-ascii?Q?vHPC3RBzcytYwyFGg/jhEwwVZs0GWjA8AyKF3S7cCUo0g6KooxpRLJkVZF8F?=
 =?us-ascii?Q?dGC9LqLzzOXWjRVVv5ok3vpm8ADTsCYFAMXihRFb6tK2PLhX+UHN2onxoh5O?=
 =?us-ascii?Q?h3pkPbPVfgwJX6JLlHlGK/o0Dy/0fFnZxEMlmWui9+GAEfpqVKkDB53h6hAL?=
 =?us-ascii?Q?T1BOv32/jrElLFqTfx9vdGysKVucTZ1BA7bRzc0YYgEUwk+64GglEyBMKqYV?=
 =?us-ascii?Q?5YBhyS0Xnw6+OJ6g/QUneH+aU4CiyzkabQybL2mz2AXRwvHzeskJfW7z7qEZ?=
 =?us-ascii?Q?5Io9+Necxf8Ja/QBvpjJPO2SCEISjwMnM+POojdvwkc/zZiQ2WCVqAdkmHf3?=
 =?us-ascii?Q?kr7+I5so3V3AHbjaG0BV+qDFU/us7r5fXy4NINdTPwGOTs//LsUghz/Pl0Ni?=
 =?us-ascii?Q?9kx61GBmFJMR3tIh4v3DMXDYrG9ptpvDFmd8HNQAr9a2gvN1PleZZt/wVqJ7?=
 =?us-ascii?Q?ka15fl3mdttIFHw8xJ2AoKeEk2tGhRkgTfYR7EmHLKtSMrXC2p2ms+tNPBOz?=
 =?us-ascii?Q?DRhrMEu97ZgTAy9lIJXeJT/mUNZx8pCuqao/ulXNJgWGmz4Au0AdSO+Z5B4J?=
 =?us-ascii?Q?nZXiUxWXcUZ1ktLYHPXqPQTKfBMOIIFgRXr+XNJB2+D4PF7XLWW78jnZDZ9S?=
 =?us-ascii?Q?QA=3D=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a858c80-b1e0-4c65-c66e-08dddb8805f5
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 23:12:21.9906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: coyUyEI4Ewhiak0FhDKCYOaPmbnoksOXCFkBVfCSFv01Hld7Mkp2VFCKl/h7eGCF6uAi6pbPN6tbb4B2cqlNk1iWukq5D6mnw7o8kVXLr4Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_161231_091918_F11A699D 
X-CRM114-Status: GOOD (  13.24  )
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

Makes dirmap writing looks similar to dirmap reading. Just a minor
refactoring, no behavior change is expected.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/spi/spi-airoha-snfi.c | 43 +++++++++++++++++++++--------------
 1 file changed, 26 insertions(+), 17 deletions(-)

diff --git a/drivers/spi/spi-airoha-snfi.c b/drivers/spi/spi-airoha-snfi.c
index 049dbb406779..eb39401b3fb3 100644
--- a/drivers/spi/spi-airoha-snfi.c
+++ b/drivers/spi/spi-airoha-snfi.c
@@ -664,6 +664,8 @@ static ssize_t airoha_snand_dirmap_read(struct spi_mem_dirmap_desc *desc,
 	u32 val, rd_mode;
 	int err;
 
+	as_ctrl = spi_controller_get_devdata(spi->controller);
+
 	switch (op->cmd.opcode) {
 	case SPI_NAND_OP_READ_FROM_CACHE_DUAL:
 		rd_mode = 1;
@@ -676,7 +678,6 @@ static ssize_t airoha_snand_dirmap_read(struct spi_mem_dirmap_desc *desc,
 		break;
 	}
 
-	as_ctrl = spi_controller_get_devdata(spi->controller);
 	err = airoha_snand_set_mode(as_ctrl, SPI_MODE_DMA);
 	if (err < 0)
 		return err;
@@ -795,36 +796,45 @@ static ssize_t airoha_snand_dirmap_read(struct spi_mem_dirmap_desc *desc,
 static ssize_t airoha_snand_dirmap_write(struct spi_mem_dirmap_desc *desc,
 					 u64 offs, size_t len, const void *buf)
 {
-	struct spi_mem_op *op = &desc->info.op_tmpl;
 	struct spi_device *spi = desc->mem->spi;
 	u8 *txrx_buf = spi_get_ctldata(spi);
 	struct airoha_snand_ctrl *as_ctrl;
 	dma_addr_t dma_addr;
-	u32 wr_mode, val;
+	u32 wr_mode, val, opcode;
 	int err;
 
 	as_ctrl = spi_controller_get_devdata(spi->controller);
 
+	opcode = desc->info.op_tmpl.cmd.opcode;
+	switch (opcode) {
+	case SPI_NAND_OP_PROGRAM_LOAD_SINGLE:
+	case SPI_NAND_OP_PROGRAM_LOAD_RAMDOM_SINGLE:
+		wr_mode = 0;
+		break;
+	case SPI_NAND_OP_PROGRAM_LOAD_QUAD:
+	case SPI_NAND_OP_PROGRAM_LOAD_RAMDON_QUAD:
+		wr_mode = 2;
+		break;
+	default:
+		/* unknown opcode */
+		return -EOPNOTSUPP;
+	}
+
 	memcpy(txrx_buf + offs, buf, len);
-	dma_addr = dma_map_single(as_ctrl->dev, txrx_buf, SPI_NAND_CACHE_SIZE,
-				  DMA_TO_DEVICE);
-	err = dma_mapping_error(as_ctrl->dev, dma_addr);
-	if (err)
-		return err;
 
 	err = airoha_snand_set_mode(as_ctrl, SPI_MODE_DMA);
 	if (err < 0)
-		goto error_dma_unmap;
+		return err;
 
 	err = airoha_snand_nfi_config(as_ctrl);
 	if (err)
-		goto error_dma_unmap;
+		return err;
 
-	if (op->cmd.opcode == SPI_NAND_OP_PROGRAM_LOAD_QUAD ||
-	    op->cmd.opcode == SPI_NAND_OP_PROGRAM_LOAD_RAMDON_QUAD)
-		wr_mode = BIT(1);
-	else
-		wr_mode = 0;
+	dma_addr = dma_map_single(as_ctrl->dev, txrx_buf, SPI_NAND_CACHE_SIZE,
+				  DMA_TO_DEVICE);
+	err = dma_mapping_error(as_ctrl->dev, dma_addr);
+	if (err)
+		return err;
 
 	err = regmap_write(as_ctrl->regmap_nfi, REG_SPI_NFI_STRADDR,
 			   dma_addr);
@@ -840,8 +850,7 @@ static ssize_t airoha_snand_dirmap_write(struct spi_mem_dirmap_desc *desc,
 		goto error_dma_unmap;
 
 	err = regmap_write(as_ctrl->regmap_nfi, REG_SPI_NFI_PG_CTL1,
-			   FIELD_PREP(SPI_NFI_PG_LOAD_CMD,
-				      op->cmd.opcode));
+			   FIELD_PREP(SPI_NFI_PG_LOAD_CMD, opcode));
 	if (err)
 		goto error_dma_unmap;
 
-- 
2.50.1


