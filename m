Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A8CCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Oct 2025 12:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2snrpNrzRAzTOeqpJ8KPLiTOapJVIgdfhM9IUrv732o=; b=NWTzCmqMkE3+Wi6awhAx85bvBs
	RX4mFaGH13i9RaJEAw7HbdBA4tqUcUDB6/drCA4hOveTpcZE4oMPhqBXGsHzGy8l5CiamlYPy7L22
	VyexSusseOW9ht/drwo4kgWHuSv0Qk6ZsCFXhfLTtevUZ+vu0ddiSjesEvo3wkIRZOa7tJe0f738s
	IXzm8sOkryTmpbDZ94AztEk7TQNYaSjD01NwTwlA/08XT7r8Q16qWd7rsu1HzE+47Lsbz0Wg7z9NN
	Gn8AKVjXR+/36XRv/Cfbv7Pgpaiu2SM0/+tikH8UM/6kJVAkBxHISiJ+ztuIYj+b+rcu9EtByJqqP
	bUqe/joA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7v18-0000000BIqx-0bRf;
	Sun, 12 Oct 2025 12:17:38 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7v14-0000000BIhj-1H2Y;
	Sun, 12 Oct 2025 12:17:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pI4XnawuQZKe1SVxlUDHBnV6IJ45MzBiTTjOuk3UuPw//+v6Fj2ypsiEMdoPjz3U1oEd3vi0CKWDm0JxhdLg/u7yUMvdOnYjptbR2hTg2MndUbGzX/kt40k8+jyOOZIXZpmKYsg9nCEHDw3vGZ9YF/q6jah60pwXu+ilgOjWbRNXmCBXioypr/P/ZBxYHC3hzUFpbYHm2DGtrpAddWzYxpotuKoXRv3+upZue4jKHG1JU775a+Dh+Ew9hOZv1+PHrIV8DVvCoL/N4lVzUDvFe6k4QYzew0Tjcv3lCexhM+5OAO/amxIpr1hZa+tMOzYwQbNQtKWeDIT19dQ6deF2TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2snrpNrzRAzTOeqpJ8KPLiTOapJVIgdfhM9IUrv732o=;
 b=BV89lgl/IBitjt7WFCxiOV/c3DDrNxYDfdJPzTMFk5i24EY+6hfv/F/xF5YIpUMETqkXSvdsWsVzwZLe3mRun7khGTEO+h6+Eb1Ye0Yht6vEVDFtNZClZwwn3BIys0FIN5MRRoA908CYxG4cEFm6ghRaxjUYCk822Cs2Ky9Ce18pUlUVaGKGmDI19uAJwesS6epuPFhbXBK8JcxwBcd9Vjrchz7LYiKXbpvhLGHl1KWLCXRluI7+YdBKrk08TvU+9mBo6J2shu+OTNtX0JTAdki2zb4M9m06Qr2eAyuOuyOUSGra3NGnLSKlvF8Wa1piHZ5Y74eRmkk5nRn8efltSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2snrpNrzRAzTOeqpJ8KPLiTOapJVIgdfhM9IUrv732o=;
 b=dlNNo9Vctd4C9CWXrFby2ZeFu+P4Xv/1uwMcW6Bit0L3+OtgSSVLonbJZQrT5lYIt4jBU1iiCQHoTYuM2Q6c2iLH937lNDxKip0XOpvXN0z8Nv3C4WiGIbMpv+GRsjkck96Lag8PcZ19YvB2ogHtiMU+PLivPmw5AJ8b1D3eD6tpWzXH14dade5RMNueZ66+000DEs7uThd+QKc0vx1hQJ28MZUlik3PlDLUae6jEjzb1X2IeD+cXf0gDT63Z4oF2KJlZ058TWheFcdufTn3BnwKM1wHwmTo8rdU1gN/4KmDeOL2PAQO3oXkzZZLQidw2Z5a1nguO12FySAgNVv4cQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by DB4PR08MB8056.eurprd08.prod.outlook.com (2603:10a6:10:387::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.11; Sun, 12 Oct
 2025 12:17:25 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%3]) with mapi id 15.20.9203.009; Sun, 12 Oct 2025
 12:17:25 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ray Liu <ray.liu@airoha.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Andreas Gnau <andreas.gnau@iopsys.eu>
Subject: [PATCH v10 05/16] spi: airoha: switch back to non-dma mode in the case of error
Date: Sun, 12 Oct 2025 15:16:56 +0300
Message-ID: <20251012121707.2296160-6-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251012121707.2296160-1-mikhail.kshevetskiy@iopsys.eu>
References: <20251012121707.2296160-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0424.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::17) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|DB4PR08MB8056:EE_
X-MS-Office365-Filtering-Correlation-Id: c83eacc0-54bd-458c-3d76-08de09894de7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|921020|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Q2iXmybX0G+XmPwVkONqEHX4kS5KcEf4bVkQcitAQZmpjgZlWuvodKHyqfu0?=
 =?us-ascii?Q?s/8BVEZmOakv99wJqrbzMxrbRJ/e0Rfed1u++wkISKE11gC8cXWrZVd++AMx?=
 =?us-ascii?Q?8v98vXKYpRnLDG09F/IGNT9KDtlY8TN1xzDpB8Ik1LY2QRVUQ6yKA4U/CWXY?=
 =?us-ascii?Q?kCMH+5++7y0O7PZyYR35N51AA9TH8/dOquy+jr0WkCn6Cjv8uvCzHwEaXVJh?=
 =?us-ascii?Q?cKhe8Ual8Cb6jgDTfeVXjzQuXibdrJPZciuqs9RrTqhFl0qNScA4G+fyjAG6?=
 =?us-ascii?Q?GQKVoMgwWFX0Dwoq+MZc9sY6SF7vElE4FppOuhgwC2ISypxAoR0jh5PM22z9?=
 =?us-ascii?Q?pLeh1+SWrbQCs1mr6eg03zqwPulF3B0Ft8L6ZiPW3qCBRl1FmnjJV9RY1Jld?=
 =?us-ascii?Q?X4M43Rc5PrnJAnUzgCOTuTeh5rdGy5o3cmkEj8Iym0u5+0PQogYDaaWaaGSc?=
 =?us-ascii?Q?UMra4I8sXT5ZFurfn3JPP0SVQebNoR5JOU0zM4tJT/fQPzNWRqeAuc3EXG/C?=
 =?us-ascii?Q?Hqo42FyZatP6P9ULohh5DITPuYDCL9LP83zLFiT4WrE7JTkIL80lRxqjRkZo?=
 =?us-ascii?Q?KeyOOYJ27pShE7BW8AEgKGkMoZl2NL7S1FYKnsN1nSlondZKTq+lCwXb6d8f?=
 =?us-ascii?Q?W9TIuCHuMf8UvalXMD1hezovQQd+F1BJRys9Q+sjd1apBI07MX0lqg74uOBq?=
 =?us-ascii?Q?aqM3TpoQysl2cY6YEKk+TsMBgtBVAAmlq6TNsu6abGTTrq3Go7pIYmWP4p4/?=
 =?us-ascii?Q?rYINoh+DhPkw7ZbYVjJSvVUm39RQ0j26xlJwONQvCpunq0Uq1paRabx9B2JP?=
 =?us-ascii?Q?Qb/Z/sWW2/iSlo4RMoNw0UakV3m6GdP1/3nL+iu/PMOIaZedhp/gOM1P34a7?=
 =?us-ascii?Q?Msa2+xTlTQdXCCmB0Kzy1s5cbboNyGp1IVx8vNnR+50NSiTgMolXgEUexQeR?=
 =?us-ascii?Q?pv5awQGrh/J57MTHk0vK8NkDALVB8FIucCt39fG2neg7Jd6OU+qU1UCedrkc?=
 =?us-ascii?Q?sflgEx4kOJRXGrhqNphFv3QsGkh7EvDXIvphuiK1bI7v+rnLU3ExtqMdQxKA?=
 =?us-ascii?Q?g9psvc3f7jmUbZ2oCTkxbaVsOcY+rEsaeWpYGouHSuilBEMCZWy4TqUtpHUX?=
 =?us-ascii?Q?FGwkeCmo7bGtCTYrlkcYV3fhi51ZcnH4qyeKE9lV+fSn0Pps4yHbzhAbc26N?=
 =?us-ascii?Q?benXSVrZZdeYWBiItBoCO5C2QzH430ZQvVCdH5mANIfDt2e/gj/TL6aH+hIg?=
 =?us-ascii?Q?KwNb8B8U4IjTwXo5Q1hh22bul2veq0FMlI0anMccVdPIFfIy+zz7bocTKXHK?=
 =?us-ascii?Q?ChLOoU3LlpCSmjU9rDUNqs1/gG8TXts5XWHm7XBTr0p9gWhsBioSx5E1MIgR?=
 =?us-ascii?Q?OthaEwKODFzXtkxaR+h5ZxLqi/99ZJ8PWAnSo3gbTRnYWp6jACge6IaFmBFT?=
 =?us-ascii?Q?l0xlXhYm4FEiLFtEXdzk5YN98kn9VkoBFvsou54DXa8os/VzZZQX3iVsFIsl?=
 =?us-ascii?Q?dutObTirbS9fRHaSXCtRgUXS/fyRdGFqGxSTbXQBih+xRjDq7s1DnFshYw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(921020)(38350700014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q7L/PU6AWp9AOT9STz3/0l5ZrQ6dxP0YVeDco5IiDefBYJZikYyZ451vENaH?=
 =?us-ascii?Q?McLffyr+8If7j/T217D2GSucWi6Sgl4CtCweqT1NjbX6mpaqvFpOm87Tbz5/?=
 =?us-ascii?Q?zy/pUi8Kj6Rqii2tpNoHwedzpEHvibiNjXkOOxlWwrXnLYgTAqTf0a0i5qku?=
 =?us-ascii?Q?xRtlBcxSKVLKxgUmWz8ZDPL8kwXPSIgTB7RrwWozp++V0UeIv/O+LkLZmKBQ?=
 =?us-ascii?Q?FqcXYwOHdnDyy604xJOgKWUZKtkdkTwq7+sVLoaVGkfwm9adCRGW1XcCDcJX?=
 =?us-ascii?Q?QsHArmt6OaOz5Z2vBY+Z0Wy+FIKK2qL1Csjcj2EW1/GCBope1gl6zvdcSWSY?=
 =?us-ascii?Q?xr4xnfAC2qqGBEVElzqGCJcyLCxCo/qa8Yjx0NGZvaCcq0qgK/Fni/TlUosg?=
 =?us-ascii?Q?UBHvz4U0AGTKpFt7hFWkH4szWJZqOilpQsfz1Lwrap9rigQcJ7Ic/RLff7Pr?=
 =?us-ascii?Q?nbwgX7Z4OwrWIeQT4yNtMvZxWerWXCgFseqR9ejQ1Lta8Y9dBwCjrWuDeOc/?=
 =?us-ascii?Q?+gMzVUEseFTly38kQAaBDKUmpmbK2m9fMB57qUTKi+JkedkFiEIXSOpAbu0s?=
 =?us-ascii?Q?yv4FD545XyXcUVxdj06OLDze9UcjIQDbKxq1ngAYMNtLn0Xa7qhVrsqqXL0h?=
 =?us-ascii?Q?UZi8B5ChscVtIPXHihPXVEABtDzZufi0nq5X8F/gQe9zFJ03knw1mUGNwtNM?=
 =?us-ascii?Q?orld/driuQS2XR17K0D5HXLnuAwWMsXw6ltk03ZcmLSR0RpTNR7K5pJmVP3H?=
 =?us-ascii?Q?hwMSgy+NXi55/JOU2GhqOHV+4HsROcZ4KCd+ztQ4oSgXkabDU7vD24N1XwHo?=
 =?us-ascii?Q?N/84uA0J+tYNFrVrRFi+esU+rMakNOlfC7uuoxjRxgfG10JKRlYQvSgb2xXB?=
 =?us-ascii?Q?GI42qAfcA8YyEUO7xN2xOIvNO31AqFW91z112RudLWlXRlV31G7KnOOzoY+x?=
 =?us-ascii?Q?yL8SadgKgzxCMe20HwiazwLpKaoaB20Po3ySLYQmL6EBRNjXME4J0oMxqDPf?=
 =?us-ascii?Q?Qrbqb8CK7C3W6W7eMUL95nF0nOvjiCj9aWGeFAtA8zvXMsgvbI6Xp+ZTXkqX?=
 =?us-ascii?Q?QI0e9UHarLrP9Bbt89Iwvh/7935oHZPRn6Lk8J72vLGQ+/BxUk1zSZuW5KNP?=
 =?us-ascii?Q?Nop3eU8yI1kHY1irOEgupe3eav0u0nexkdRKf0LmUK+9KhOduv3CNm9Puta1?=
 =?us-ascii?Q?g5TijkP8Mx+JacQmbluTtiDdEltMa1IYsze1fthi714dQttLGzrqfI/bqxRF?=
 =?us-ascii?Q?LijTnHgDn0oqvN1qPN6/8Ebqb7hsjtP9jxgXWehXOtyGKwFuudHoU/2+3eqA?=
 =?us-ascii?Q?qqizkjc3G5Z9E8l3vSPI1OHRURt88b+5UjGKqhodNw+Cri1hb+a2TG3ZvCjo?=
 =?us-ascii?Q?q1FNLNpA/utnHdvOVq0e6afpotny8zaHeACtAuAWHhFLx3mUk+3QoatFAKjX?=
 =?us-ascii?Q?J8BLk8CaIceA07feeVYtoz/GyxG8l8hqeJJOhlqjSaF1sD0yezVab/ujRFAx?=
 =?us-ascii?Q?7t1dzlck+DOU7y9y93Z7yNWChiXWPmyZ2w3xhldvFwvC7NHX/AAvwUbVGejx?=
 =?us-ascii?Q?ZsPW40IjAv/mWh4tp97NzgAn4yoZFLW1pUk/H3qInkvlV+f6dbiokPWFVs/M?=
 =?us-ascii?Q?Wg=3D=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: c83eacc0-54bd-458c-3d76-08de09894de7
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2025 12:17:25.6835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eOQu7J48SO0TtBRT211/JIduRGpuntvu1/pkTwzfRUbLTCzk18MlP0A8reDrmVZVE2DYO9KUC+YsSRdsBA9KEYbOO/DegAe0yCFLdb6cXYQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_051734_342859_5FBC1096 
X-CRM114-Status: UNSURE (   9.52  )
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

Current dirmap code does not switch back to non-dma mode in the case of
error. This is wrong.

This patch fixes dirmap read/write error path.

Fixes: a403997c12019 ("spi: airoha: add SPI-NAND Flash controller driver")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/spi/spi-airoha-snfi.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-airoha-snfi.c b/drivers/spi/spi-airoha-snfi.c
index 2d86dc62dbde..a39c3ab4af5c 100644
--- a/drivers/spi/spi-airoha-snfi.c
+++ b/drivers/spi/spi-airoha-snfi.c
@@ -691,13 +691,13 @@ static ssize_t airoha_snand_dirmap_read(struct spi_mem_dirmap_desc *desc,
 
 	err = airoha_snand_nfi_config(as_ctrl);
 	if (err)
-		return err;
+		goto error_dma_mode_off;
 
 	dma_addr = dma_map_single(as_ctrl->dev, txrx_buf, SPI_NAND_CACHE_SIZE,
 				  DMA_FROM_DEVICE);
 	err = dma_mapping_error(as_ctrl->dev, dma_addr);
 	if (err)
-		return err;
+		goto error_dma_mode_off;
 
 	/* set dma addr */
 	err = regmap_write(as_ctrl->regmap_nfi, REG_SPI_NFI_STRADDR,
@@ -797,6 +797,8 @@ static ssize_t airoha_snand_dirmap_read(struct spi_mem_dirmap_desc *desc,
 error_dma_unmap:
 	dma_unmap_single(as_ctrl->dev, dma_addr, SPI_NAND_CACHE_SIZE,
 			 DMA_FROM_DEVICE);
+error_dma_mode_off:
+	airoha_snand_set_mode(as_ctrl, SPI_MODE_MANUAL);
 	return err;
 }
 
@@ -926,6 +928,7 @@ static ssize_t airoha_snand_dirmap_write(struct spi_mem_dirmap_desc *desc,
 error_dma_unmap:
 	dma_unmap_single(as_ctrl->dev, dma_addr, SPI_NAND_CACHE_SIZE,
 			 DMA_TO_DEVICE);
+	airoha_snand_set_mode(as_ctrl, SPI_MODE_MANUAL);
 	return err;
 }
 
-- 
2.51.0


