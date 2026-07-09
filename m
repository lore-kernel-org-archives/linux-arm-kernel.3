Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E8CAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 13:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RZkqCetdAyYo7YTMQ+FmLyPOJsXeWVq2ghxWaM3o6Zc=; b=SZg92etblceTDqXIwrhSHCEi1J
	KCvKGybfJqtkJfAkV5yPRGholCbVIVhFW50Ge2MsYep+pkTz86yDP/maDM/9DNJnpszBDijF5HxDH
	XOANetsRxupEbWmJ8HXvoMmv+0zv+4nXJz08VTep7Wr2at5s3kAdylG9kkO2xfQ6K7tfGKMsztqFX
	3AbvuS6+IpQ/auNUQyDdqgQ39ovVOrV8XHej0UBZfQmboa2NvCIH8POBaWYkbwNBwdBxCDovmkr3c
	gmpiFVTnIEUEG3ztvx2tY7Cnt3/RDTqVNPNRM4Pt36M+LOMP1cHZ45O5iKiPd++TEmUfMwkyTj6ez
	DYwm1Heg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whpI4-00000002fTI-3nC6;
	Thu, 09 Jul 2026 13:59:48 +0000
Received: from mail-koreacentralazon11013062.outbound.protection.outlook.com ([40.107.44.62] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whpI0-00000002fPi-24lQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 13:59:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mV/+TI6ZvAS8Lk4ZLV5H2HJVuwJhFXVdRSquDJd4GUlBLrGE0+91zkWcrr+wGa1Vb/+Ok50GtyfbBBWReUsqNlOyN4qnNXool3Jg5jAYz7Z8/sxo4L1FSOMvmM36ce++IvxVyeKvgEjUXXntDP+kQx7/89smvtVrb+MeWJ+sFLkU/lAXTlb3rbVUL/e8o19vfeoqbBrBwRdrKJ0Kzy+GM7okDpmsEfTmXY8lhjpg5zQ78dH0abwJgQGX19SJrVNUoRMXKNf7cE4wwGX19c/KYWT59up7jfyQQG3XZWcQQCu8UNelR2RcKsMnpHVqQ1y+7ww+uNLukkWOv1Guhr4ODg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RZkqCetdAyYo7YTMQ+FmLyPOJsXeWVq2ghxWaM3o6Zc=;
 b=iAfw6U0F2QkylP+uONSJuYAoQ+e9pnzdtPWsfrG69TG8YaV6d4NrE6mNuSXM15MSA4V/+ITEG4KUYKJtCWuEhdsgNoIOoavdVtQKgt65QrOpb4Weiakv1NBYHJoe3qTzdiYOA6s60JmK2V4PATSFAuC3BARlkunOTeSCMNzCW/V5ViGqueEA8hJArvQXZGQAuaLuPYGqzi5Iqzg2/7bzY3Q+r+5Out5euPha7z6fi37q8ux+3CNdtf7iHYXsWpBSJX4+Zp6DHsnNhTL5OyiVHYRZfQhPEh8JAYkz3UFXlrimFOIQqBRuYBoOpHShwSBCopE5mddrpdDCr6jQfuOJxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RZkqCetdAyYo7YTMQ+FmLyPOJsXeWVq2ghxWaM3o6Zc=;
 b=PZsoNAM5E5LAfneRMZzvc4PEA/Vog94bt9WSaBG1glKUBaI8uoq9dPsMV1SgohqIdHon+vXwIxjatRcX+c8+mgtaQVQRPXD+67w4BQgSBIyPWkDF/E1NQcOK6n4UjL0Qh959rvXhvIWHiLek/X/DQn5BGYnhkPUm0mE1dhm3sekfRy6SA0Szm9JoFyQd5WuYhh2gTzVxxHxo0V/XBCugKOg84TRmz8FvfYNY9GiFqea0vjDeIvk7SkZ3WBaY8vbcHbMEq0JIkhmamge08zZP0HrbercjXHdWOL2yy4lhdQLf/aesC7xDVd74+5RhmiKh51wPPUMnLWWioSN9F/tufA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by SE2PPF271E4F3E3.apcprd06.prod.outlook.com (2603:1096:108:1::7c8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Thu, 9 Jul 2026
 13:59:39 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 13:59:38 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STI ARCHITECTURE),
	dmaengine@vger.kernel.org (open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH 17/26] dmaengine: st_fdma: Remove redundant dev_err()/dev_err_probe()
Date: Thu,  9 Jul 2026 21:58:21 +0800
Message-Id: <20260709135846.97972-18-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260709135846.97972-1-panchuang@vivo.com>
References: <20260709135846.97972-1-panchuang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0073.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::11) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|SE2PPF271E4F3E3:EE_
X-MS-Office365-Filtering-Correlation-Id: 7933145a-a034-412f-9a66-08deddc2511c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|52116014|38350700014|18002099003|11063799006|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info: K0x1JvXVqDmJ1YEBxeZMZoponOvyjeF0BpHUd3DKH3ipM6egEx99ejTf9JE81WAGirEB1SSWotBvKiZOEYn3B5gAYdiSY3ZgsMR29JLQ5GfiWN1S0txZ5529W5MEkYa77S1Mev4dlXSNnO8htNV7Fn0/CFxE27uq2KVn5mAIB5T1Z0xDsdCscD4IifBIbHHFvIiqEYSwgb89KRu3BuNDwAkaQEZXg9KT1UlCzecXhjw+BVTwTedYSlgkazlGAHYMd7KCtblKjCrG2EWvV20jcsRlOcoc1XJ6iXg+op2wUUSu6nAXUX0PVqXPsGsNjQ6vKApWIayefJF+XbBSr940g8p4MxK7N/WoWbSsX6sE9IJXFfI+dhmdjH31xzLWzAMlAjogmDxgPjehKOvi1kXe9Ab5EdSKTaH2DOvRURmnnwBWrrP8MBN2UU46wlEYDFBm/9sbtCT6ih5QU5Nf4KD2+bnKYjpm/TNy5pB/YNKc9z7LDx4BkFTm7zbnm85WJ1GXNZDwHwOIKHB2YBFCbVjdqllxgeBlxEzae1WW/ZHBh9pzaVq4JtNaoZE/HavSGPPAxO27d2qnlH+RjEqWDDyjctni3IQ2NpRZHwSYCyveBbx0/N/N6Tu8TAL0htGzEOa2QlcXw7j9bR2vObgNNX5jXFCU9PF+JYXb7K/DlGAM/CqoFth8b6xz4EHA8/sVloxafOdPJIllEdyKKF4xVO788ijCYWjLHhM4Gw8eIJrV42M=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(52116014)(38350700014)(18002099003)(11063799006)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M04PS+42+dOzQElDLjiT9mCfk1sNjqllPceG36L3+oDG7ulQySsizqlO/xJA?=
 =?us-ascii?Q?XFxnFozi3uoiAKc015xKtJnNJ6o9IjGDqVEhFnOSsP0J80+ZRCHJs8rvNpj4?=
 =?us-ascii?Q?sMkS8x/O5cUP9WdHLgI/pq5sZsYP1QKfnwxryxHj8bPQrOOU5lM5Cs3dm0Xk?=
 =?us-ascii?Q?XWCA3VAyKErS9D5+zvQEHDwa3JAKdYHGiGbkcZQybk+HppftP8Z0FEI3tX0D?=
 =?us-ascii?Q?nKd6VpFOS52ly0GvJHoQXH4jAH55wbQGA00QBkqd/oZX4NwJJoNGvwSPj/N3?=
 =?us-ascii?Q?zq93O5a4vnlBeZ/9qPPH4f5cGmAWgwA6UcJBbFd0ihAB/JVUPABSOM4XJJLd?=
 =?us-ascii?Q?dN0gR5LNKqfL5WnqRPVtw6rbE62edjapCksKwLaZl5gYDxCLpCA0MfYqxWTX?=
 =?us-ascii?Q?87ijpTObQUL4K2fWeTY8hBu1/YLj5X7R3en6PmWxqRUs3+zzQ878n01gtfWL?=
 =?us-ascii?Q?pp/dvhJ3Pjt91a8vo5/c0E/ho53tJ7KK++mQJKmmL5CbSoh28oUpMN57FG5v?=
 =?us-ascii?Q?A/7VxHzbHSP4j6U1bxaxrf1fnoj4T6H1C05M2JdmH0MyderrHJlYOphtuwzU?=
 =?us-ascii?Q?TP4pBEGCjry87APjH+PKPtV6im6EtqBsTLZ8r7nhhI0sbI1+qY61ziZ94g9l?=
 =?us-ascii?Q?lb2KfhJFa+CBVara6gNl1MkfVEvaCtgwtlMwULA7ZkHgpQZAzZpe7KhLltnR?=
 =?us-ascii?Q?TFKJCu9dv79sQOxSL7C0PwopHrslBOofJ95M0gtreUfRhp5Pps1GNBh/HWIG?=
 =?us-ascii?Q?PW8wZ8NK9zT+9LLbo73DGWaANgpcoMwEa8dS3rJQ+djAehg9yIblRsMD4m9j?=
 =?us-ascii?Q?jH+L/ztmTHf3+uvlsvYoQqK5m8CTQ5ac861mLmJKdUh9xQD/a7/Z+6x+q21E?=
 =?us-ascii?Q?6U56x+rBrkp//veXDBtwUW6HEXuKqhFMU1z5FgZ96KAWhQMYiwEaxZw4yIt+?=
 =?us-ascii?Q?CKYFF6VxD0YUwwh/EACt2m5l4ZSN+amj1p6YEqH5DOyFcnx+arZ8ue6PyJ5c?=
 =?us-ascii?Q?l5N5j5VQM4seT9NvKKRzqUG4ofWCEfw+aVogqBRMYKosM9eYSBFW2+Cdd+rC?=
 =?us-ascii?Q?07rQhODWDm25NUwKZO4z04F1m4ZS4y4cEUJD+5y9/0alSTOYE6RozaYZZRsI?=
 =?us-ascii?Q?+XYe01MzjkGEqP/QOF6rg5zf3zTv0FZPB5CybIpaeseZSOE6uizbS4RcZ2wq?=
 =?us-ascii?Q?n3N04SnOlzNbyc4SIgLvFgkoaH/0nPeeeS7N9kT2wp6do1iibVI6U53gavvO?=
 =?us-ascii?Q?ZFs0Oty7rUo+cAq/PHuVoGFWzNy4k28pUIvc3zF2aSSxaueU7kJezJBit1wx?=
 =?us-ascii?Q?H8tdioQrq7+09LxY4Ub0Nh0rKUPZm3vytSUwp6RgWTMMJUXgIEtauZlDywSf?=
 =?us-ascii?Q?eWqx6RW8qI//4KeLQfqlOV0guBdPHv2oh6wV/dd+acnmd5zb9boPeLxjrdiI?=
 =?us-ascii?Q?Gop7Ji7P50gny4rholt+ngSmZ4vp7DQWYoLJ2ruyWX2lCASKvAjaOHEQGfvB?=
 =?us-ascii?Q?7uxJqprtYW/RVtWaF1ywUlYHJK4IaY8sEMbRzGhcFqsX7sMCbjj2KcZM1s5d?=
 =?us-ascii?Q?w7tHRnSMHqePKC8ie/DnQvu6k83FCZXPXYwAUWlMv9Uogh2tywGKZlMaQTNA?=
 =?us-ascii?Q?M9joBpF/FtxMWzRKU3Bl3lhPiAA9QDPjEFI8f2ArtupoFBGJqkUgq/6PX3yK?=
 =?us-ascii?Q?5Ve0Cp23VUBIfjucHK8PfyIRUD5VjBiPAacqFU/3L8OszIztcb0wP360BQTl?=
 =?us-ascii?Q?m4Xyiyme9g=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7933145a-a034-412f-9a66-08deddc2511c
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 13:59:38.9164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b7hAX41IV/g2Nn40cbz9KB5ip/Ro1v9905ZoF9jvufTeIgq3STvyBEE41NsuRsObvml2bvICuNSV3GaryXoUQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2PPF271E4F3E3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_065944_539981_74996960 
X-CRM114-Status: UNSURE (   9.57  )
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

The devm_request_irq() now automatically logs detailed error messages on
failure. This eliminates the need for driver-specific dev_err() and
dev_err_probe() calls that previously printed generic messages.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/dma/st_fdma.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/dma/st_fdma.c b/drivers/dma/st_fdma.c
index d9547017f3bd..05a2642601e6 100644
--- a/drivers/dma/st_fdma.c
+++ b/drivers/dma/st_fdma.c
@@ -771,10 +771,8 @@ static int st_fdma_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(&pdev->dev, fdev->irq, st_fdma_irq_handler, 0,
 			       dev_name(&pdev->dev), fdev);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to request irq (%d)\n", ret);
+	if (ret)
 		goto err;
-	}
 
 	fdev->slim_rproc = st_slim_rproc_alloc(pdev, fdev->fw_name);
 	if (IS_ERR(fdev->slim_rproc)) {
-- 
2.34.1


