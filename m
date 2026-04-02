Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D42D3941E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 12:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zlS/h/cxXotOryEh6ZFVfnQRDC/6dPHpaa27u8RkNB4=; b=pRFA3654qc/bjXyC+NKBMe95kw
	BWcZnZWMaoWxCY91i6AAsF0+vOr4AzYA1arV3NVDPUcGYMSuNQRAKK/PAnV9LvceHIyRU19NFDCSf
	hWV29QkmxLR4nvirtpcVdMleHOubTFzH1sBGshyNpdyVNLRSHqdI8xcI60cFup9bA6zEV3kK6iIh4
	KMyIGZNItiHt83ZXlnjVz7Vmh8IveXmZlDe3fgMn/3qsJUUZVW2TilEUaIyJ/nZCgP4NZb9saj6Mb
	Rne1xTGUNqZh/Up3t2MejKLus4HV1XZk5CkVzUMA1UM/Z8a8bz3rcjWycVO0aZzlFh/WL2U731MpK
	EbS/O7zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Gs6-0000000HYuJ-2LTS;
	Thu, 02 Apr 2026 12:10:02 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Gs4-0000000HYrx-0Dhq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 12:10:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uq7qReypivqx4RSMeXO08O/0+9T13xgA0KHHVp504GrJD9VvZCb2TaqlJ7qWwW+bGELUkzS4vJ/S8zpjlIEEcBcwRXefKWpWcF8OYcfkMRL62VwJGXOTyJhZCjXWOAV6ph2siOoIjfUl+FKsAp7OLVd1Lub6kwW4aK7yEGVwnxgMAoyEUt/acbso8IFkpT0prIBYoUC5yKns4XE33MHobygzs0dFiYgo34Yods1XkZsP85IDPlGf8cE539IsAHQIiI1J+ACo8jofx+BKKN/RrZtyj07chqksKc4LaTYw/hBQq6bw2JuX0hxuZ+cIriYf4ir9e/kVBGo978hsMlHxAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zlS/h/cxXotOryEh6ZFVfnQRDC/6dPHpaa27u8RkNB4=;
 b=vrrYcIcxm3hKN89IL7rwyjral83wq732vV8/m58eCSQDeLGIAIg/hw0MDWOBshjr+yHMkA15DBEK9SCGwphDfIan8JAd6/sk1CGocMO9IweDrMvfFezo895/Sqlz0EdZuHicOOhaofE86EmuVqj5II8pd5wnAghbwBZfcIMmMYjCIDrEiJIC3LkxE3fboYmv16+kRDyCjexSrGvVgY3Cwn9PuZkkK5POxbTQ5mumY8O6Sdf6jAhWTFF/I16RQrG6gRdjFfpw4ZQni2gV+d8wSAOrxNaFpBaqCZY8T63SxSWScYG9Ybcvu00iynGT7VtDvvHN7EpGIw1hOItY6w+d1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zlS/h/cxXotOryEh6ZFVfnQRDC/6dPHpaa27u8RkNB4=;
 b=pUEO+zcv00Yr2sCtoBMtpv0P2FxhcR0lrNBQ7kCwwFNL3A+9DY7iY/fyKB83tO9ksZ6ppbRX4Q/hZciLwiKmZ7O/ntzFaSsqpfMsJzndj5n5JZXNPJaYJHC6I9hSTcLKy53UdKWzOETUkYLvy7sdJw0VcL7UsuzP3uGm7KHPoSyNevNUAmmdyHq/cKbett7i1V40pf0X3dBi1zZ3hTJ0ie1HWMxyrxTasuOVOlUgxFohDaX0MksxHW6xKHtjEFABhqtZTVsmex/gyiDZf4PlrvELPCcr17a1jCkMfG3hnfsKr4oCheoh1Pl9U7Djp3BR7WWAauPoV8sY5yiXv1Ngrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com (2603:10a6:10:5b3::14)
 by AM8PR04MB7457.eurprd04.prod.outlook.com (2603:10a6:20b:1d9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 2 Apr
 2026 12:09:52 +0000
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::93f5:4ff3:2f4c:183a]) by DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::93f5:4ff3:2f4c:183a%5]) with mapi id 15.20.9769.018; Thu, 2 Apr 2026
 12:09:52 +0000
From: florin.leotescu@oss.nxp.com
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Shych <michaelsh@nvidia.com>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: daniel.baluta@nxp.com,
	viorel.suman@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	festevam@gmail.com,
	Florin Leotescu <florin.leotescu@nxp.com>
Subject: [PATCH v6 1/3] hwmon: emc2305: Validate fan channel index
Date: Thu,  2 Apr 2026 15:25:12 +0300
Message-Id: <20260402122514.1811737-2-florin.leotescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260402122514.1811737-1-florin.leotescu@oss.nxp.com>
References: <20260402122514.1811737-1-florin.leotescu@oss.nxp.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0129.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::16) To DU7PR04MB11163.eurprd04.prod.outlook.com
 (2603:10a6:10:5b3::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PR04MB11163:EE_|AM8PR04MB7457:EE_
X-MS-Office365-Filtering-Correlation-Id: c1907181-a50e-4422-02b5-08de90b0be8b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|19092799006|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: bHFIiOYsSt0oFvmqTGudFg6ZqSb4hIHJjXz0a6FpCLNqmuokMproO6ubJ3zwbllo885ahrEDdw6v1Q4JJWJ2TwfZe8ci5P0av9iqX5DOnk8Sr6G3o3ZiCnkerTIiHfCqxaW/E0k0+IWYPg+T2EaSUce7r15X2/7sb/sSWQFAArb/eRghxBas8IMzFH6+D5YgDcIBb5lzpkDRn9IYJR0oAKlaKb3bj2Yjk7fiWIMihc5YFY+33kq/XiGYwnS0YoLXy/cjp999L+fkgS4k4hueYlWAyTuGIVEhSVYJTajM1X7fI134arwJgl03qE5RQuUMaXfR8erClKFkRzvH9A+uLJf2LKSjhsIB+t4ubssz71rXOaW0EbNx+niBoBHPb5WgDJb3pdxxpB0ptBq1gp4sarL+YUzOf9A2C+1pPRwEZRmwGCw5Sm+XO0SD8Av1OVDyo6U++NQr0UUvb+6NepHmQ/88vO+/7YoT19ccpg/bD6HrNJa1Wi1VNmrBAcQOy3mvRBneX5U0d6BEZLBEHXLm7PTYDdcrj04ZgNiGevFMqCQYMoNN/4fpMLp/xwUA+q7i9yP+LgTuuya0QS+J2nz9Jgv67KoyxJjuXiGltA13F0O8ktagoMV7C2WJx76BGffuptxnEfg7l/6KngQ8fphj8t97ySagxoj1vvU34eY2aVuejWxDp7ZCGlvNHQT1U6P0TUYH2/lMUIrqVkBRnUy1z078KtH0t3Sl4dlWlgr5y7Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PR04MB11163.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(19092799006)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ApXrE3mWW6ZIbShfH0eYKO9WwssUj9kHuX/5sLcba628FH9PC51pI+1J6f?=
 =?iso-8859-1?Q?EdL4h97Usx25J106dWo/SgXeB0LBn+KGb2PANOBqvGirgJDU/BgzfFcNql?=
 =?iso-8859-1?Q?usPM9fi27j4dng2WNPlLcy7Gm4IJHYhtD3i0AcS8SO8facVan+ZivoLkjJ?=
 =?iso-8859-1?Q?A1OkhDUYbJwbZ8qIzBQ/knN6WooP012nBhCC5Lyp67cfguyRB757qAD2x+?=
 =?iso-8859-1?Q?3DtxntUyrNJOPJ7NeniLfuY2yowt7Yh4pP3iXg7NF2YxpLBQ4kx+m5jy2X?=
 =?iso-8859-1?Q?naG24hz1159LMg6vNW3FbKmp908LKCrWTzkMyyOorcYE59Ecqd6WqUvxp4?=
 =?iso-8859-1?Q?+FlTZhvWrGrO3Gi02Ws2I42zoRahNkK/I1BNBZADKipLNvhOIfUXf6jchE?=
 =?iso-8859-1?Q?wW6yz9jgr0UxVDNxf6bE8QSDJFonEYjE3zRDmE5Te4MhGycg/CXItmGQwJ?=
 =?iso-8859-1?Q?JdYRimIP5LNi2v5k4TZRrtRzqSVB/uIml7r9fj959igvkQFndUsd6n9p+D?=
 =?iso-8859-1?Q?oNsS9KCmOgV7Oquuc8OibS/gnZ7rUKGWDa4daWF2VkrWSV/kEHAt6DUo3u?=
 =?iso-8859-1?Q?uvgH8odsRDxK///+U+2SDQlZH1iyuJKwbl6N+qQISop8OhaSsqvSYPLJFz?=
 =?iso-8859-1?Q?l4wTrqIGOIM4D6vEzD8u++eIAgvHNSxQy2BV0Olcd8i3Wd6uH8UsW5u719?=
 =?iso-8859-1?Q?5tDsPlNdnzuV7/Qo34j+a8MmBKvXWzn0h6R7qzQo6ovyOimDtrZGaRfuvy?=
 =?iso-8859-1?Q?3dgHVf69wUn1nFmPurSmbPUmjZYf0mM/6aZHQ/6pe5Ex4zWz7/l4ANS9wY?=
 =?iso-8859-1?Q?Eah+X0v9YU5eZ3JxpJc7b7U59YPflAu2XX0P+RTeonF+8YYm7pEYM/YcJ6?=
 =?iso-8859-1?Q?sltQRYNbL/FLQkrKZVGOMkjF/dvJERkjGV7FaU6/Bb6xs3oJRxNoGJhjPk?=
 =?iso-8859-1?Q?RGEmH0ZOe7g/FKGcJRjM41LXtfVwaEaBir9ZoZXoWjSKSSr+bHiUAmcs/5?=
 =?iso-8859-1?Q?1/2smSlPbYUhzYH2KFIM8ymRow6P7oZQlW8i1Lx47Qex5rTI9PMBT47bqz?=
 =?iso-8859-1?Q?mg6yV5YAMSOswBuZddZjtVpU+cQgYpRAgC45urXSC1C8r41olHI+/9n/u5?=
 =?iso-8859-1?Q?gVBIXj6oHLgvfv8e1KlBlwB457iI1DKeBJQX+aJLtdJAipAPj2FlK8shgx?=
 =?iso-8859-1?Q?4P5LK15Q+kBq3bFFxyWYnAcRSooYilNshKJcIOs2BtLQaInt+iGQtng3aE?=
 =?iso-8859-1?Q?aKGCXYvR4UeH3HOtmgo/O95DSooTpmCRvbZKpPYndv1L6XD4z0NlaA5xTc?=
 =?iso-8859-1?Q?e8pr+P6SK0N0KpYMUgjEuYNEQJe0uW28YhItYB9QB14YvrsjJYRw2t4Qnr?=
 =?iso-8859-1?Q?tStIbcCFQ1JVm1YZrXYnNLS5aKBthBnA1uuxo5Oz6iyfZt6ieTydi//gQ6?=
 =?iso-8859-1?Q?GLBm2FlsdLUEW0oA4BrjcWMjZ9Mm+id6j5uD64vLTZlDqxxzBkGXIwafqt?=
 =?iso-8859-1?Q?3aQmS7no/sF/rw8ceR+80qrdXbugsae5YxKdi+FIIJAMgrBgaFS/bDyR5B?=
 =?iso-8859-1?Q?0q1c62Y4PT4JnR64fQc58zGYxxVOm9BVlAQ0M9C/E2VQZ41jQAwQ5PNaK4?=
 =?iso-8859-1?Q?4s73L1U/e2Hu+EN5cVjd+wVwb8jowsIhYloeChyroA5W4kkOKdE7jN4MYm?=
 =?iso-8859-1?Q?/UUOoHh2N0SM3Sh3HjamJhoNSe2zjDXv/J9M1I2NcC46UAyDJwwH2Jqjkz?=
 =?iso-8859-1?Q?I+Yz3cYNMJ3ckMHA3uMc0kjASi+JQGDkmd1zFFI/wrIawSdes9kWMQOthm?=
 =?iso-8859-1?Q?OG2Iy58tLA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1907181-a50e-4422-02b5-08de90b0be8b
X-MS-Exchange-CrossTenant-AuthSource: DU7PR04MB11163.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 12:09:52.0214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t3WWpuGWskSsh8/mCWZd7KZeu1OlHOSiC4jTiBk1M4E5jhnlKINsD7Cllalsjp0WuN9onL08L+gXE5rC7+T/xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7457
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_051000_095538_8F773C12 
X-CRM114-Status: GOOD (  10.18  )
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

From: Florin Leotescu <florin.leotescu@nxp.com>

The fan channel index is used to access per-channel data structures.
Validate the index agains the number of available channels
before use to prevent out-of-bounds access if an invalid
value is provided.

Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>
---
 drivers/hwmon/emc2305.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/hwmon/emc2305.c b/drivers/hwmon/emc2305.c
index 64b213e1451e..0b42b82c8e22 100644
--- a/drivers/hwmon/emc2305.c
+++ b/drivers/hwmon/emc2305.c
@@ -548,6 +548,12 @@ static int emc2305_of_parse_pwm_child(struct device *dev,
 		return ret;
 	}
 
+	if (ch >= data->pwm_num) {
+		dev_err(dev, "invalid reg %u for node %pOF (valid range 0-%u)\n", ch, child,
+			data->pwm_num - 1);
+		return -EINVAL;
+	}
+
 	ret = of_parse_phandle_with_args(child, "pwms", "#pwm-cells", 0, &args);
 
 	if (ret)
-- 
2.34.1


