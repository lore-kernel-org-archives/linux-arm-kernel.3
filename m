Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D55C4452D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 02:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gWp76fGCLRMdX+Ql14Q1KqYDj3g8xmuSGtKT3/KgRi8=; b=aQNXUnsiaTRHeb1s9VGw5e0HXh
	QU2ZvE045JEFVuq8cO1LGx4dlD6U25VjcfwZTjb2rmROwO1blQfz/VDuyTlGMntHTeme4Re+JMmxt
	YA8y4KG7MHzV9zH50EaVRt770AhJr6rDM4734H6RnLUfqZtjHEjeCml65sYVJndKr9D6DtvubdOVY
	O56+eEO3l9i9GzFVia8RKJtpcDj4Tdxi+Ka6CaJB0M3CJr6fFHahvKaNyv7ifoDLaj6PsjVM+efPd
	IUvlrsgL1xnj7ZJyagLN44LEtmvW69w2usLlFcg9PYyoqG9UBXBoR+d8sQu/w+3yR6uOn4q+vb6EL
	x7+WrciA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmMoX-0000000Al0t-1a1B;
	Wed, 22 Jul 2026 02:36:05 +0000
Received: from mail-japanwestazon11012043.outbound.protection.outlook.com ([40.107.75.43] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmMoP-0000000Akyq-2zam
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 02:35:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S7jpTC2b3Banc8AE7w8q7YZG+kwEmDONmzAmfh1W4Ff3s11XpyhG5kF9SkWrDjswlqxGGG6vIWhz+gzLgnO6gwzyokoy4AC12NuQWqYEjzpNJtV3QBeSQSU8i0W299ex+hg7+O0SqhjoYyXJElBAt2v+nqEde5s4yk5AlOlGDNL/RmiTWYICWRwVLGkwxaRzWL5W0pLAfuPb4xaW+B2ISEXKC5Gp1mAEHIhEUGTRlYX/3LgH1ezjA0UCfNmIe6o9Ss4cVU4AN6HKPH5ryJg6bGUMGpTAUsTBVDFO66PtTdKHdlt5QoDp/y0Vn9d0sgH2Rct+n/gWAiTBhIptax8EYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gWp76fGCLRMdX+Ql14Q1KqYDj3g8xmuSGtKT3/KgRi8=;
 b=MD2FcD9dl89qvFLb2VbR1d1wfHB0kJLLqJAREGyMCp61oTDuk0v/lfj2/E+x6Dhl+91dJb3LpBo0X/gykgZMdxlDU3d0BJ6f5Sx5jkvSDO5qSe91/kYq/BMHa2ar47HUfLRIVwChhfaT1WpchNAd9jSfoMUcFyOFS3E+N+DJi7FC9b6lj5F/JY5gvbClx3j4zhEjE+ZMU74dU3dA4d6K/ihG+Qj/rW12nA6cIgLPlvUPMd190Ri5UtetR3CATj81FUdhaejCDPKf6j4FM8ySsQv0RqzvFiKfYMlg67QmJClVF9daS0YK1LarLM/blVYQW7W7jIdA4DjwzTbglqDKCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gWp76fGCLRMdX+Ql14Q1KqYDj3g8xmuSGtKT3/KgRi8=;
 b=KwCF8PrycnPoDu2qFTBKRHE11WP5vHEMexIkKOjL4NhNxe/DH6mKGXDBeFP80jbswZRBO1hYb2jz8kGTW24dbGJvZ4qTyhqeNQSOJ0Kr5+FKGEACW7sTVvSGQZoC1xzsNrqxOhfw6LKl3OUV4BU4u4TCSG42QTq7WupmUFraSAN3ejGr30HXFQnq4L0LfPf/Q7l1tdqxndrgtZYnSj5BvavUP4UehGFU9kNe+cayxLZ6faVeKsEyEV1gqhfC0v0xV0WDx7UPTCM9HnURmTDW+OMGa2h3o1ClPotukVxC1lNhGl6OrmMPVSpxtX5a52RLQaVYoctstbnjbucP5BoQXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by SE2PPFEBA6DFDFF.apcprd06.prod.outlook.com (2603:1096:108:1::7f1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 02:35:36 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 02:35:36 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Linus Walleij <linusw@kernel.org>,
	Imre Kaloz <kaloz@openwrt.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/INTEL IXP4XX ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH v2] soc: ixp4xx: Remove redundant dev_err()
Date: Wed, 22 Jul 2026 10:35:18 +0800
Message-Id: <20260722023523.42269-2-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260722023523.42269-1-panchuang@vivo.com>
References: <20260722023523.42269-1-panchuang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0023.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:5::19) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|SE2PPFEBA6DFDFF:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bcfa486-a5e0-4116-af08-08dee799e953
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|52116014|23010399003|10067099003|11063799006|56012099006|6133799003|38350700014|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: qIDh1iPLfkra+UCJqUa1yrsnw7rUacdxyZzTpJGBrHwWmYmueyOe1LQloL19E9h3zCi/4VMCht3NJ0+6T/LADfGIDnLqp82ORdrazqXRb6mnfOLnNUeJmn8neZRjrjvgcRMHb9SoJHvvMpXyu3zBvFgMIeaauXyQCpW46Y1E7Ukc+aSSIT1AIISJjq5F/4QFp/aulPQOe9SbCYM+vVrvKfeBJdCuMc3/F7lfdAOEsoXGwImebtR1y4BUeY1f6I1HtRa5RJEn/g/6wRJegzYUrwE3vFx3L5Xo5m8g3J9vPx76N0lN/eEAoQDCKGLg/ToK6JbXxEK7Ww2HMnbJ3GXzNIKRjnuBV9qkrpmnD4241JMIjtpDHu+PBLfNjk8/ZHtTtMW8oV4cjI73+AV83rDRbd9U43FTz2VH03B5zoEkuzmz5ageo9o3l5H6Hof3I/WH8l+ouFt8FxqjnZ5o15BFlF3WDTTZ0LmZnPB7xkPmyLBkivFbaBkJkQVKtIgtiVUVJrMsh5/07BybXjPQ76ZP+iNd7M3Er4sQMoYiO7WzqKL54mg5uxO/1Q0cvuYOywjyYO7hVr6KfZ6UkbIGu9FGGr3TJUXEPZpkc5zaMWOnNkdmvr7dA14gqvSixLpqz8zVvany1oyGAd7S64jum+YH+LCoas8FAaFJUm0JuweyS7ubdh+XlNI+3PYELlBb1K2caztg4kduzCxj0ak9QJmhNq3dLbg5Gx08NQoVgNokMk0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(52116014)(23010399003)(10067099003)(11063799006)(56012099006)(6133799003)(38350700014)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hqHtvLEQZWqIO2yVhEa7Jl/GFqkLjmgyxUjkTkS4Lr5hGRhv/aTBVf/rEn7Y?=
 =?us-ascii?Q?A0H2r3AU1iT7PBqZp+R3SyOcYMJEKKkeT1CIdtvv8aDeH+eDHvWNeuzRmvyW?=
 =?us-ascii?Q?zUGeZXscLgBae69JSJJ6sqGfnoc4zg1YHj+ncMp8Jk7oW7FRAfRaI7KQe+B9?=
 =?us-ascii?Q?0Cwf44Pi9BlabWEu22dPfK/ZgkZccNFDf+cpN1zALVXNHN0+QUi8PD1Q+EpF?=
 =?us-ascii?Q?/w4q2734chpR5FNFcEZmyuP8+NvdO/uU+vL3N5FP2SY4JUWkQSdpd6uj3FKG?=
 =?us-ascii?Q?Cor8tOH3FQRqspkh2qVIK+lXWtVTbPzmjwUaYket3vZvByd1acWnFJGE46RN?=
 =?us-ascii?Q?3gxjpZd8TxQ4i7/9pnHynLHrmabapUFxo5zi6PedEHgURsjXLh9MYXv78bI1?=
 =?us-ascii?Q?TaNMXWcoM3WEC+YhCNImNJVwJsrXR582YCVh7trRYjIXJFpcpxQCbZDahtlF?=
 =?us-ascii?Q?tyi9mmfRx95skWnimEtlKeukycBlFXJ87svwKYeQl/zZsKWlodDlGcDkqUjW?=
 =?us-ascii?Q?RHlHaIq+kRdMyKCymqlYHF5um3vYhSRbPqIXueTn70KKS8834eFODrYxnMEF?=
 =?us-ascii?Q?GO1FY6iQX07/ZvXB4+RyQ/FPLCuktlvd8dYMBGFqd6MKrCoL3YnIMD7L78wk?=
 =?us-ascii?Q?+kpVmn3jhlR7SZYjDpVuk193FJMi46AQYJzj+NeB66DJeEQGxNBfqUDFlvZU?=
 =?us-ascii?Q?t5I0vxodu1gF8rYyG2t3lj+rX3aVUDH+2qwx2E7lyPEIGukL1ApZT2PgYXtW?=
 =?us-ascii?Q?CiZ7O91Mm2X7j/A3QhBP6/TwPgaf6mGVpWLaXOrxlZ75PSP0ihMbn23US3AT?=
 =?us-ascii?Q?dEfh0qo/pjUQcvA00FYTiqPJRqULEzE13jND4UkgROmJ+FDQ7vieEdyzYHI1?=
 =?us-ascii?Q?FXSfOWB4uK2Gsonl2xiGVjwovjFMsSuM6xc+e7GGUBPZDbDpr2WeO2qYdCoP?=
 =?us-ascii?Q?BQsLobBHDnV5OfXVStpHXYptzJmKhQ3FdcvKLE213A0yIaYY7Gzcwzw75glo?=
 =?us-ascii?Q?HAAcwsitT47q1JkzZD82nrWJ//WBgs6Q29/sCHCm+SYbyort6FOxOQ7jiBNp?=
 =?us-ascii?Q?yPdnXyVxQYa6rxqhOafhJVgzisMagvdk4S+jEWgjuS6ofrHoczy5/M95MbU2?=
 =?us-ascii?Q?hgwoFjsTTUmCQUQGc4GWo1aUFcsDJ6z+shm4QvhqjAc14GIx4JOHvJcyc/4z?=
 =?us-ascii?Q?eLv9zEpq5Z3VAR6zLVLefixEdlnC8+VmHb8j7jbiIg8j/CLVyTgDGtS0Ci3u?=
 =?us-ascii?Q?CQpcDidoNlmxR3vdaPAzQO/YHgLFOdIPHPsenng/B7NoFnxaujs0rECtKS0S?=
 =?us-ascii?Q?YhXDGtoknpJjOdcFTQi6iVLpe5rO1nlBloKQZ6Eh3JvwzO8/P2S3smubkTk3?=
 =?us-ascii?Q?iixxu62CgaRh4omnJiltmrvX88Zk26e+y+Jkq4g7p+537GfWBDDU40UCwCkT?=
 =?us-ascii?Q?393YGt63Qajos3I+fI0kaXOrVQoonGHfraIRix/dBu5myWjYYnNPMTX7Chsw?=
 =?us-ascii?Q?Fqtu6Gzqi8AwJtEr5zfcwU/C8jLqrVYJo1DRk0wwwiYHGfu/wHscLBrKfMyE?=
 =?us-ascii?Q?TxA17o4vydXUa8B+tqUaG86WnMMXp93w4AbaYKP3vldrtA2JKqyQAEYjQEru?=
 =?us-ascii?Q?IhCvUITmPgAd083fKUF/pwD211nYhGfwLLrE+PTzA4uyXHq11AsB3v/RZIQJ?=
 =?us-ascii?Q?FgtfbRf90A2odANWjgE4pCUhDcuqEJ/woMExkESNYwcIzfthoeZbi1VqFTrQ?=
 =?us-ascii?Q?rVhB/brqFQ=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bcfa486-a5e0-4116-af08-08dee799e953
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 02:35:36.5867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: icUURRZXR+qQxnPVQe7lr+jMkWUgYNqAtXVkU10Wuw5yJ/8KY8gANFcLC1q+iD30zat6rogfV37cPIhGjqrBZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2PPFEBA6DFDFF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_193558_117834_5E57B534 
X-CRM114-Status: GOOD (  11.06  )
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

Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()"), devm_request_irq() automatically logs
detailed error messages on failure. Remove the now-redundant
driver-specific dev_err() calls.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/soc/ixp4xx/ixp4xx-qmgr.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/soc/ixp4xx/ixp4xx-qmgr.c b/drivers/soc/ixp4xx/ixp4xx-qmgr.c
index 475e229039e3..6e1fca630b80 100644
--- a/drivers/soc/ixp4xx/ixp4xx-qmgr.c
+++ b/drivers/soc/ixp4xx/ixp4xx-qmgr.c
@@ -421,19 +421,13 @@ static int ixp4xx_qmgr_probe(struct platform_device *pdev)
 
 	err = devm_request_irq(dev, irq1, handler1, 0, "IXP4xx Queue Manager",
 			       NULL);
-	if (err) {
-		dev_err(dev, "failed to request IRQ%i (%i)\n",
-			irq1, err);
+	if (err)
 		return err;
-	}
 
 	err = devm_request_irq(dev, irq2, handler2, 0, "IXP4xx Queue Manager",
 			       NULL);
-	if (err) {
-		dev_err(dev, "failed to request IRQ%i (%i)\n",
-			irq2, err);
+	if (err)
 		return err;
-	}
 
 	used_sram_bitmap[0] = 0xF; /* 4 first pages reserved for config */
 	spin_lock_init(&qmgr_lock);
-- 
2.34.1


