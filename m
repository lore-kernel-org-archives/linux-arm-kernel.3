Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B1EC44507
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 14:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rEv+eGpOr9G9Z1/z4b89EdAa3gHWDW9PHgDZOmGZMvk=; b=CEN7s+SrqYtGc21qtIC4saPS1j
	O0RQVkZCL0jii46A7EORLqAEb24jw+x0N7ik1dastZELmffM36UYQbqPgQElDnZpVp37YB6gbYXcK
	o19WXKLsfsPiilvGXutArPSKH5Kbf0QqnVOfzs0tZmojW2+dIP7/l4/RjiNljRX1oWXXYokDntW0z
	d4zJActvYMFq7dyFDADtjmTXE3Whnwh+SkrUihD4eLy1I/Mr/nE/mxMOWghbHAhL26Auzo8kDwHhD
	owHVh/aw7Ji4GbP6xBOQ7WURhL0h9/onVWXqOvf8rY9S7u32kOhswvVJvDTAfeWXZMdaTAM2Io5qe
	Xoj7Zx+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whpID-00000002feU-35SA;
	Thu, 09 Jul 2026 13:59:57 +0000
Received: from mail-koreacentralazon11013062.outbound.protection.outlook.com ([40.107.44.62] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whpI8-00000002fPi-3Vt7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 13:59:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ix2wUBwIS+UXa0ccJZNVGgeX/lYqA6Aa8VC9+OZCG0nVkLIu6wwA6Do1YxEmY91xUQNMfv/YyUSCj3Dx3ETSOwP+nt1yOflxOTVL4ol9RgZT8HCFay/RJjwLTRKaRkhqAkl+amyw8/IFFpxym8i7r3i04zLrNnMUtWkBsofS3IrJFufr6Noxr5btTrZiDg4ATjv5X17dwEgzt3tmxqY7u5xc25q5Y/CGY16MaHzz4T5xKf16iZWrRng/2kmSHOL4YK72BN0r/NPLqtL/2X2Ax9M/aU58SdsGFa9a+K9tT8al208tdltTV+YDfmK2qmmKCjJRSLwwWTx9wwFpd9e/Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rEv+eGpOr9G9Z1/z4b89EdAa3gHWDW9PHgDZOmGZMvk=;
 b=gBSB9SiP/Z80S7i1gaWbQT6uub7m/AcQBxK7MLOt5MFXY1r781Ie2cqQP2tRSrT/8QGjv+Ki9J/gHI6WdTvsY4z06+w7DnR1myoTyCimTWWzo061WBR1H5IN+F00PajMLtwuLpuMb7XgrQIoOTeo+VwZJLuhsv/Ibq/ypx5HotKdxGMEvr8kKmKQ+bQ6Pfe7Us8Htz+CcxEeaqlaQqYMrrNTp4l1xjAG31WbvN4EoRKN6+2TTLIdSUGDvjdDg2LmcCICsuA60s9YRXbiTdfTyvG8xsdCQFwl3/jO82o4z+7uuQIW9XBFEKc51aawHyp3HdmyjJ/Gny0as+gAOlUwZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rEv+eGpOr9G9Z1/z4b89EdAa3gHWDW9PHgDZOmGZMvk=;
 b=He0v9Xw7uprgzsdJRpg3qSis7wSKxS22wXSbgXDARmrMrpyQ5amQMkuI+1976YZ9m4vo+ym8n3Ub8CHttp1DGA7pom1xB74LJiJz9WcMFfvFdizBFIPCcSKL1hfBylnfQ01AzslLkKwX+Eb2AYW3MGpPmGAKLZUypp9meEW2AcmwhrDgFqRpbwoKE0vKd2jT4NoYCpV2mmRodogYYs7gk7u9gTnih4xtaZkaf+klrgSUyZRowkgvWB4rOuHWwQO9TspLHcjzlzS+DzUulspqvLx7QKJVP7TE56ginm7tPODZj0ymsa0mi9zn77tZNdLfWuB26fDj6t2CPeoZnLv7SA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by SE2PPF271E4F3E3.apcprd06.prod.outlook.com (2603:1096:108:1::7c8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Thu, 9 Jul 2026
 13:59:45 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 13:59:45 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	dmaengine@vger.kernel.org (open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner sunXi SoC support),
	linux-sunxi@lists.linux.dev (open list:ARM/Allwinner sunXi SoC support),
	linux-kernel@vger.kernel.org (open list)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH 21/26] dmaengine: sun4i-dma: Remove redundant dev_err()/dev_err_probe()
Date: Thu,  9 Jul 2026 21:58:25 +0800
Message-Id: <20260709135846.97972-22-panchuang@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 76688458-0151-4b17-a639-08deddc254b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|52116014|38350700014|18002099003|11063799006|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info: u5KlUFnN3bNFuzFput8fIFNgpVUi6U9Q+VqKg3IxLz9Fq05WmoH8V48cWvc/22KWSYFLQ59eqbrRLnGHx1OJ54Gpc+EkIDYzkkX6qK7YINFe2S+YPHZg5UXuYGRxf8/2avTJ+zFhX29r8lV9qD7ejH4cqFFY6r+BHKFwBWyt/r06RnLfsQsNyd1B3gWFQfBeXoQ7XRJTQcPbxDHZpQ3IAgt0NP9MwoxoE19KOlG/6cLux0oyJ4FMX+ixU+a/J9jEoDEFYfq3Xvg3gNqZJAY1AxGv2U/06YviHU6pWo4I2v+EeL14coH7jBKqUghxeE+yrdPmYK1J/UgmlF4PJizk5Ry/lISfVTBhxu5tb06wRbG78PXr+MpMsH7VYLKyHw0JANfpr9iAadfOxAINxPxU3XcXr+oJqsVnHdV99F8v530ghTQSiHRFv760yH4RhhKGhxQjA0KtfZMI6SxIM/QUx4Gxj++elb8cQIa7UJuRNXWq9OVasJY/mhq7o5t2x+VMp8cDhXK/BNmp2QW0BaZE7Sks8Z1yh28Xx9ZTb5fuRkCNIdUdwNE7AkbhDv5ZK1FaCrUyHbhxQa52RsgTMrfqEL9njyMhOtpvw762avtERxTZmSj1Gi6/ED8zmAMZUBP6Q934OAh2fGKgKxSVeNJu2PHSY2muJo9e1hRjLKVVmYUjn7Mli996u6ThOiXEmHfaIJYDDKnZumCCoCg3IujWpix7yaXtsoi5n3h6uyuclmA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(52116014)(38350700014)(18002099003)(11063799006)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iFa/yuuRqM024gg4BeAsvp4l4wDCaTBSdR5ERaSh0JtYsr4LYopt4YUhO/yg?=
 =?us-ascii?Q?RfV5Y9Wqti++pDpu6lteIw4PzzbjGaON3KK+E/xLKm5X56NSv2npWmqowt0b?=
 =?us-ascii?Q?173FVsko5MEKm7NL13angHZVXr5J2N0uWAR3Q6mzVvaaT7ZNYsL5nOEvRR7V?=
 =?us-ascii?Q?qsrg+NNAwGAVi7eVjqgY7E9FQ1iwM7lUnm8s6/G4/3QDYxml4iCcaGnfBoNZ?=
 =?us-ascii?Q?QPDNAHLfW/XLeO7+qaSSzklSCnKcIEOkX/wLtHHeion4tvV1ubrKlumZn17z?=
 =?us-ascii?Q?yjwjdCjdDGy3ZbI8z0qTOAp8sSF+I5gLURAOmMEMx6usq3auqb6W40zh2ZR5?=
 =?us-ascii?Q?SDOWrHWDEyXGn8tCWgbAs5yqE1CMBKYvpjx7y4brZ5o5JK9PvFPZ8s65/WkU?=
 =?us-ascii?Q?0ERyO5IW5ODtIWp3SqN+0U3LWklAThH0rKcFgJtUHt6Pi9F8r2dQCP6erXW+?=
 =?us-ascii?Q?rojyTrnIq+5gLtmGQBnPl7FIdFCPQhbUYlnES3oQQBhdNMPdpvHqYfLF6orc?=
 =?us-ascii?Q?Zhzt3nWiwrETHTczZzHL9ochrL0lYU0zXvy0tCLQZgryuwtTibr2bxgyuzLy?=
 =?us-ascii?Q?Gq9Ch7GeF1B1lBHMXLqhDGSphFoB5AIEcFLFGIeA5jkBYO3A20Dqyb3zUUC2?=
 =?us-ascii?Q?Pr0L5pA2cGvUo13trC/k05SUp5py5szwzALbGI2vbp0CRoFZ3nQKbC8MUhiu?=
 =?us-ascii?Q?g5D7V+mbEAeix8Ws2QyLMmECG/fPEj+9hVtnTr8e8xuTguwPqfQFPQZAA/g5?=
 =?us-ascii?Q?l+00++T+g5GsbYHGpvEyXIrcgE6zM5xRnMUhtyGfdX4gntauQ3hx0m44z4Fg?=
 =?us-ascii?Q?bWVgTZJteKAxD2YEWDbJ/oqwMMZif7PDgWrq5vwVf2VoZ1GDYQ4Wqm4X9Cxu?=
 =?us-ascii?Q?BCQQdsyQNizAGhikgkYOfEZZhvHo522zq1g07Dl8loinOBYWNeGSWt2uT//G?=
 =?us-ascii?Q?a4v/7MslHW/7wg9z2xX526YYxJ59svmR5Bqcp5O5MdXLXKu0FAGX6gM6wd+N?=
 =?us-ascii?Q?uJliOXPk5o0xoVQsesR7RyXCZPTPMgpXUK5+WY23TQHgVk7vCI0wJLHdUWcd?=
 =?us-ascii?Q?qiYJBO9i1OuRU0xa27HAa/Gc0AHryducN0GfoG+dV4AzQ51nWNTZ1sxnLiqK?=
 =?us-ascii?Q?aMTXlZnugKKxqJeCUeD/8YPbo9nZ54Cwgo3h1lTq4Fb2SbrNZ/aDFJDmtUrf?=
 =?us-ascii?Q?4V3L0cOLMSY+oA07RqzdBHG6m/YdwoE9epnRcY0J3F6QLdSx2tiOmq6BrWz/?=
 =?us-ascii?Q?i5/nEkV8MgChoqzgDQoJ71yPFWOBiRimFsZDNK78SnUIBK8xWEREJqeA5JKP?=
 =?us-ascii?Q?guDbwjvmvDsTGzTkqPCjJT8vd7rZeyDJFMoIR0Y6HE3MuqcmqIhRkgmg+pvJ?=
 =?us-ascii?Q?d/9bZat2iodBQT4TqJeqGmcysHcHwjVKp6J1oLf+ftVIU00yQYXQlpp4cDSy?=
 =?us-ascii?Q?OIY001+9yqx5xU+sJqm01thGgl9LBfJHSvwmlHwhyFtID8D959qUEfWRHV9e?=
 =?us-ascii?Q?XOrKNWb/+Ib0hhVuoan1BFx4zx4+fgv434vXboF8xKVBD++r/vk0M59RX1zn?=
 =?us-ascii?Q?U64xAsnxCBrvIW8FgkXyaL5iQICJ3Un/I4p7FjDfFwiLBtdMYK3bL8ijOafL?=
 =?us-ascii?Q?Qj4bGCYJzHG86HL6Blwi4XFD9FuZkS3ndz9bIFavnBjOC4oZQmBLijPgNfQ+?=
 =?us-ascii?Q?2OdZGI4aGtmxbpIYyWjoPhaObMXGvvTzoEDnim0Esa5JjyIObutipbMiaL/q?=
 =?us-ascii?Q?4hcVXbkPsA=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76688458-0151-4b17-a639-08deddc254b8
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 13:59:44.9589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d/o2SGs8m2SZu2EKmoFRy4Ox4kQH4eYQiq73meVyaW8bNu8SyI71fUwszQHlYXSC8vpwSMou+gVn7+HspA4ugg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2PPF271E4F3E3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_065952_949894_201587CA 
X-CRM114-Status: GOOD (  10.54  )
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
 drivers/dma/sun4i-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/sun4i-dma.c b/drivers/dma/sun4i-dma.c
index d2321f7287d2..303d71ba0ab6 100644
--- a/drivers/dma/sun4i-dma.c
+++ b/drivers/dma/sun4i-dma.c
@@ -1337,7 +1337,7 @@ static int sun4i_dma_probe(struct platform_device *pdev)
 	ret = devm_request_irq(&pdev->dev, priv->irq, sun4i_dma_interrupt,
 			       0, dev_name(&pdev->dev), priv);
 	if (ret)
-		return dev_err_probe(&pdev->dev, ret, "Cannot request IRQ\n");
+		return ret;
 
 	ret = dmaenginem_async_device_register(&priv->slave);
 	if (ret)
-- 
2.34.1


