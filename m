Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29838C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 13:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oJ7M3uKYtMiuMbu6lqMpsFqdaCXS/eyC9qg8HYtrPQc=; b=p3fqHT3qnvbPGCkCaPE//ZkVlO
	MH9j+/1WGAY02xilC0yGYMyD5hquW3Oi9lEALRg8aS6uyCO5MEAGSMv9StQh8v98Xcy6HKVuFZEsE
	3bQTVR8ql0H9HO4c+4RqZth+KsbadW8xyh4j/In2fgmhfHvsksIrb442hZO7SFY47ZsSSteQT7STg
	mUaCjNsbg7Jiwbfso3Zf2Pg4tMUQ4dTrSkUFv1JYhS6r5Zoa9fGYawkGB65YHSa1uEMM6rfHPjDQe
	YN7z+T+mxkbn9sse1rcxtYV/smjCnusXogicoN+F0Q/+NTUqY6VUUZXLJjThKZVQf6YphC7fVINAx
	jreEnH5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whpHh-00000002f7N-1w5U;
	Thu, 09 Jul 2026 13:59:25 +0000
Received: from mail-koreacentralazon11013027.outbound.protection.outlook.com ([40.107.44.27] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whpHe-00000002f3r-35sQ;
	Thu, 09 Jul 2026 13:59:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S/X7JGvrWF6ug1DJPbFvyhvISrsI32iSt1hCWpPkBlaApLg9ktNHi8FdU6RsbNuwFPrbpFHJqGTdOSVYEd4awFD+DHAscvcpZwwUjbJOPtFSFDK0KGlThT44K4yEcRbsrpRqE+ll+oOUFbLTh/Mq14bOZjaUjx3hlTYNxCrQeKsT9wpiihUoeOGCFW8iq30PYflhuSAT0VRIJ1Xa1X4FouEynS+m0yVYrHkrCTuLwlgoULb/z0snNke+nOO+Xg8xSLndqctH/A+NXnQ7vIsxGmH07ggetXCUWX0oHj7u/qcDO0GAGtXmZpAefPZQvBX0Imynp1Hjusr50Wz3sWWhRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oJ7M3uKYtMiuMbu6lqMpsFqdaCXS/eyC9qg8HYtrPQc=;
 b=qghuTs2VFqX5iEqOApTZghrx49tYNDdNgfNfUcK/VkW0o/1WZlkL9UvMaSc7wK03tsKk8AadSrbJxIMPygv/XK8aWH1fnK4MOY+nVcHGECT3Q7ju0wZUuHVb9zJJqTCgrP99QLX+ZYhPgurtxf1jlvy9IL0OpPOw7XKQu3+QpF9CzHhjQlFtZzq2N29F9MYN1BzgF/KtePHnRmSjFXYCG7TTQXpdSE+B27XZbWCGlOFwILa36YV6cB1QiGSNkZ9iqNSSORcaF3KbkIsljyqBR0C4fapsVb+LR/vbyo86wyFF7MkSojDNagaPM8iq1271DeVsFyRzyk56JfYKbO9qjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oJ7M3uKYtMiuMbu6lqMpsFqdaCXS/eyC9qg8HYtrPQc=;
 b=qo5FK8aeEZu1WTH1eqgjZ00D7apxzepjjXZBjZ5wZb2udjM8vJTVDKuCVfl2vzzOzlpmlh5SjU3AfUV1/IfnrbY0vnMwZesBskHcb4CgxFMZ/HowPtCMlNtXmKWc1oKdF9WGwoy3u4BR8EdOUks5E4Z1mINLU9ZqaXoLOOaDViXX4swX99U2Gc6lR3PPELo8+ytWSPw4NQmhdR3LR51kmZDSOVOlGbsw9C0kwKK4HM4d54n2WGKAHbUj9QZLenzMwJXixDPrUDr7gP0XN1/9CuKipiV7lfl0mZqAQkl7EJrP9RhIPOH0A1jVdQeWemlaNdWBRe9fr1GKwCdpd83TSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by PUZPR06MB5673.apcprd06.prod.outlook.com (2603:1096:301:fb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 13:59:08 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 13:59:08 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Sean Wang <sean.wang@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dmaengine@vger.kernel.org (open list:MEDIATEK DMA DRIVER),
	linux-arm-kernel@lists.infradead.org (moderated list:MEDIATEK DMA DRIVER),
	linux-mediatek@lists.infradead.org (moderated list:MEDIATEK DMA DRIVER),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH 04/26] dmaengine: mediatek-mtk-cqdma: Remove redundant dev_err()/dev_err_probe()
Date: Thu,  9 Jul 2026 21:58:08 +0800
Message-Id: <20260709135846.97972-5-panchuang@vivo.com>
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
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|PUZPR06MB5673:EE_
X-MS-Office365-Filtering-Correlation-Id: 37b98cdf-e51b-4e32-2172-08deddc23eb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|52116014|376014|23010399003|22082099003|18002099003|56012099006|11063799006|38350700014;
X-Microsoft-Antispam-Message-Info: wmtKNl81DRBA3TTxmZCzaft5PHihY43Hms0QCXY6WCp8EB1NXUP4SK1u2ZP8PzvcpEb00xQ+HxLVXa+GSDCderbrF+YQyJL5D+JcFAVUki+gFpPhP1Ch0mQA5EnFPrdPy7xW1AafGyf/bkOZHBRDIDR6JbktnUyBP3BrzeFNs181dsaj0nrcAAAwc0oam55Twk8e5BvK6k59By9Iy3jvRvuij/SqNM3kFVfLG3Hc9JGhDvog0hLj8E/5su767tR7AiEliSdEfFSltr+2ofUPlsbSw/au7VAIumFqzvdoAptm8A1CP1ST2IG56++pse00qZTf80Xir3yFenDqknCqHCR+1VosbA08I/z4cY2npw4FVTIWhbwb5c/1ZaAZ4k3cQzf69pCd0GzDJ0pXsiJMGplws15Qpya0Fl2UZean0YeNjER0Ij/IEQnvgo0dXD3/iNuyR/lYqFyULiTE9ipgdC3clGZlxyLMJ0iUPAKiUj0nxUTm5+d+9hgCIDWgqLApJjpy9fqUzpYlJ4kSY1cDo7WTVBv7pRfiwX7NO3/d7pX2ay0kzmuDwx47FZc1TWa6BBvUMJuuGcJE4QKAAPA1OZEkCbHfwnusr4OZfsd6kOokdMVT1KsMER1EI7hfYMMAUtPwcl/C6kkumjCjsI7TK81jPI9yufsLn9CkntBx9smu9r3YICBxS8ggfjuGs0rQyczfZAFPkH5kMBFMDKfyk2MLoOn96HnsVyXfi7s/AyE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(23010399003)(22082099003)(18002099003)(56012099006)(11063799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QY+5pc7rJ1Xr7ELQ6C29rix8y54I4MXPacBNASUN65u3X0hUxPuTfuSxzDrO?=
 =?us-ascii?Q?jjFjfhxyOVMJueEPeEli/a8f1NMLJKqKi04Yvw2ktou+mCtYawQD7+OGfCOv?=
 =?us-ascii?Q?/wyDhAO5Yo7k7TA8bh273Z/jgB5hPIKyaPTIUoAgnKNnDYVcAzCjzXqh+Xxb?=
 =?us-ascii?Q?vRa7dwp/QmMxV7W5QD7hsUEDZHjSnDhMUuRLNsiORnvQ7AH0UWJV3GHwGJ/0?=
 =?us-ascii?Q?gDMyxiu0p87Cx17JIVu+AmWsVwQimpuoK6mvDFAE6JRfjOcULbegBWqMIv/t?=
 =?us-ascii?Q?q75D0zKyAQuo1gzaGy2pPociOpErMqsaonqNeJWA6PqbbvbOMEYoan9634R9?=
 =?us-ascii?Q?wOUK58tQvTzwj3efn97Cttx4yHxuB9ppO2m3R4hePlqoG+GDpnDR32+XyEnC?=
 =?us-ascii?Q?bE+L6zfuLh5m+4OAY2jNMIPdghWlYqfyAsI7X0Qs0ai6e4dZtRYE/M5SC9sG?=
 =?us-ascii?Q?ralfFoDwSgLu8AsB00duOdyE8mBRryUNJ7ov7urhGU0QshIBVrU3b6psaC3s?=
 =?us-ascii?Q?t9F376I9nbxd+dO6dWE3Vi2WyR/oZiKTP+PINnZW8puJFHBaIxERHNIYDmvE?=
 =?us-ascii?Q?CKFXZoeR2vAznD/M/yosOxN1nl09RXz4LTdPWm2OfTDFGMe0ol6LmSGScuxq?=
 =?us-ascii?Q?iWpQ83Om2U3t+Qzjs+TGAHjzHomzsQ1+FYiw92eISMTzfBCjlS51UckOaL/+?=
 =?us-ascii?Q?7ZxW0MUW1ciprTG2PET+jr3yv/BqlTTYn0vCX6s2Vg1Jk66wSNhMiW5EnkCX?=
 =?us-ascii?Q?KOdegjgDxQesEmLBlRBGT4l829qtTvx+k4hSA4X2XeaoCjSl3XrjG/Ky01lj?=
 =?us-ascii?Q?r3yZ7lu/kS+0WqOxWwasDqqfe6P8Sg745swRcdlkl0GITJEqqa6jyEqFxBek?=
 =?us-ascii?Q?Pn46Wv7GTR0nZRdhxevHjkCb6yDH09qkJnInZyw0xGdKJyM1THEEStpIA8+U?=
 =?us-ascii?Q?UfS8kEKLAsTmWrq6Km3ZTHUFVK42RGP+9mXDuoC9ZjvWXIiuF75EoquVOlDM?=
 =?us-ascii?Q?43yyOaziteatn9JrelfGYzTPFCyx49dUAUloa9XkbHEUnvDIyJ3WJE4g/Gyp?=
 =?us-ascii?Q?zMEikrijU0+/w2donuFWdJIjYlJ5PHHLCjEK+dp1wdAbso5HQT3plGmvM6Ta?=
 =?us-ascii?Q?HIx9qBsd8SPWyoFHy1GVVpY+kyoTPJEMwCLXjWcx85NcnJq2HpqfdksHLiVF?=
 =?us-ascii?Q?9MpAsKBJ43JNc0huHQeokeyNMmOG5dNGkEoj2w//9bBLzeZaf4QECuxF5hlM?=
 =?us-ascii?Q?DrktEGaPzOIW/hr2hTgs7jZlR2uhEfC0t6g9HmkyD6KgXpbJuwWtsnwFHKnx?=
 =?us-ascii?Q?Nz3djEo2li0ZQbmznwEUtHYwequVfR/Ia5GZmXVcgklZl6FP5q9UaQxYmGTF?=
 =?us-ascii?Q?Sd+X5P5f9ZprTgyr/ogXZF28oSh7xmLZ6DfNJRCIQzEcNuGLOqhbzL6HvL6z?=
 =?us-ascii?Q?JgY5fDZb43BulFKl6dl1fqiIL/rrk4qiHKJhMX3R/43XxJ1tW91w2ri9kKiZ?=
 =?us-ascii?Q?5EaNmaUTHczzR+gHWofkvJu2u1IdHJOuv1rTgUehO0Y38tyEf6B62hLTHp4N?=
 =?us-ascii?Q?f96Lienme3ewUyQ5ZOUeF1f8GxqKCH02CbBIv1IV9uV4N+FhmzrFCfN25gJL?=
 =?us-ascii?Q?98lIT6NS+xHz6lpnv6WgEgIxqwezqZ/tuB4KCoaS9MYy5HlfRERJAK+KF2oO?=
 =?us-ascii?Q?bnGNF0l8OkuXAI/nPMq+I6RqOkb2sjvHHIz+KtVxqxd57q811kY6THc+RG6y?=
 =?us-ascii?Q?5Mx7JbWc0w=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37b98cdf-e51b-4e32-2172-08deddc23eb8
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 13:59:08.0471
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QP6SG/xVxrBWVVbSoTkxXBPRxw2cL9TEAGoAmK1dMSA1QfjJIqq7QC3SMNy80TOOP+HgMJ7Ni0RH+/BMV6CDrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5673
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_065922_781478_B6627A49 
X-CRM114-Status: UNSURE (   9.77  )
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
 drivers/dma/mediatek/mtk-cqdma.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/dma/mediatek/mtk-cqdma.c b/drivers/dma/mediatek/mtk-cqdma.c
index 80791e30aec2..4dbe84954de6 100644
--- a/drivers/dma/mediatek/mtk-cqdma.c
+++ b/drivers/dma/mediatek/mtk-cqdma.c
@@ -828,11 +828,8 @@ static int mtk_cqdma_probe(struct platform_device *pdev)
 		err = devm_request_irq(&pdev->dev, cqdma->pc[i]->irq,
 				       mtk_cqdma_irq, 0, dev_name(&pdev->dev),
 				       cqdma);
-		if (err) {
-			dev_err(&pdev->dev,
-				"request_irq failed with err %d\n", err);
+		if (err)
 			return -EINVAL;
-		}
 	}
 
 	/* allocate resource for VCs */
-- 
2.34.1


