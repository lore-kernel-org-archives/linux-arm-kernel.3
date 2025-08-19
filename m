Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FD9FCA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 11:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=97Sod5q2+UDuR64MNCzMfdUSx61nJqxmOVeIIUVxGYM=; b=HMWh4As2MKPRUnrQNnSisVt8CT
	rQVKWmoMUWBwFsOxqa1s1vWQYK5tvhYAKmQySCo04aGvpOTzaTBvPE21/MgjEkTTpl3D/GMLzfyZF
	btKeXHDd6hOZOiLPBtVq3XLQhnNJ99YFfJP4evQUsiHtoKdP5/eqSDFgiTAi3orhlaKlrVRZqcdTc
	xeBogWZH1KN/Z6VJ6Uqp21Y0gbSkbhXFgsleL32Fy+eljRnK8/LaOYdBdYbx/xbcQ1Y6rZbqjowAr
	oriipGtNw2Dclh4lcKFUvgXuypBN8aBqUb2QRrKs15xPfudmJ2TnjE5QbCY+c1UinnFSCCdQC/gm+
	29mF2fKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoKFq-0000000AEk4-1HOk;
	Tue, 19 Aug 2025 11:11:50 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoIXX-00000009wOA-2ONI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 09:22:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B66eUU7egsAl1yWEiNR0hGnvga951U8w3nAyqawvNl8B8kfZapXqiyuLurOCcsep5+9XjzKaYevQbSBKQ4Ql0k9/3l/AA4FBmkSkMxnCUucIkIZc4MvDkJujEovce3nYLCWf2dS/huzD+63sx59LCMV78UD0dFQZ4zc347xxgi/Oq4ohFUPLl0zrElIdtUMC8sTBOeAm1XF4nb3wdK+gG1IRZfJNJoOUJbHyqikwjtn5bkRFiozaVVMbfcajSLm8YU8ic3oUUkRGKtQqCKsEaIqTP4cdgQhkBvrBAm7PVIAjmVxqdsPjml4BgmLUsOVR1x7LQ+iiA8OvvVMTHfLDbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=97Sod5q2+UDuR64MNCzMfdUSx61nJqxmOVeIIUVxGYM=;
 b=pbOLn4Worq1dR6oJTa7YSouY+T3Q7lwX/aaPjjZuXJyFTlRibta7+zdWBJkVW1hpycNSfRfjkzZ1nTnu/vws2M3GUeX/Pge6NQ+FUfNvd2mTShJYsrgoykdZ3+DIqN7xzzpPW1G8HUrtULnlNo4xaAzRU2v2gjkW8Mfpb7NEx1mhQLnVqGfghjtHNxCqCdeHing8AoD4Q+SVosrdX71iJV9opcd9XcFFea+wx6NgzNu0SIdLdVSl4efBd0odHS5vwcLHDE0+CPDXIotCKIiEObSxYAYTobKM/6+Ngm8YnlLSgiYr84Bv5yFVS3PQHjdRj/Cwy2Zr62se/RaEXWBmCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=97Sod5q2+UDuR64MNCzMfdUSx61nJqxmOVeIIUVxGYM=;
 b=bSmKtlOAgIaBjYvAgKAm7JLB2HqbJoNRvZCqciDJTUcLYs6yeF9UngoYdgjTMjxPgaUMyR9p4iooO1VW1wS+HvwTYhulZ2b859es7hL8nQSBPm2ffbu7yHtt8CTRX+ZlVWKK1FGh75cpE/WW0b/qxzTvqLSaAnHfyizEdcV0LehOC6XNMnoB2cLYi0wPsRGfM1J6CIC+W/CVczFnT3mpzK/JCgcYEAhdoqGMYVHJZBlcLPprMvUW7tPNGDr51+f1ptpcGsjObRRmShhrG37yLZXu6ozPVNj+MJ7PgBatrLjugRwqA62wcTWb0kO85OEFts9M6WbfAq6QC/MZGZvItA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR06MB6020.apcprd06.prod.outlook.com (2603:1096:820:d8::5)
 by TY0PR06MB5054.apcprd06.prod.outlook.com (2603:1096:400:1bd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Tue, 19 Aug
 2025 09:21:55 +0000
Received: from KL1PR06MB6020.apcprd06.prod.outlook.com
 ([fe80::4ec9:a94d:c986:2ceb]) by KL1PR06MB6020.apcprd06.prod.outlook.com
 ([fe80::4ec9:a94d:c986:2ceb%5]) with mapi id 15.20.9031.023; Tue, 19 Aug 2025
 09:21:55 +0000
From: Xichao Zhao <zhao.xichao@vivo.com>
To: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Mark Brown <broonie@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:PXA2xx/PXA3xx SUPPORT),
	linux-spi@vger.kernel.org (open list:SPI SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: Xichao Zhao <zhao.xichao@vivo.com>
Subject: [PATCH v1 5/6] spi: pxa2xx: Remove the use of dev_err_probe()
Date: Tue, 19 Aug 2025 17:20:42 +0800
Message-Id: <20250819092044.549464-6-zhao.xichao@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250819092044.549464-1-zhao.xichao@vivo.com>
References: <20250819092044.549464-1-zhao.xichao@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0038.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::7)
 To KL1PR06MB6020.apcprd06.prod.outlook.com (2603:1096:820:d8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR06MB6020:EE_|TY0PR06MB5054:EE_
X-MS-Office365-Filtering-Correlation-Id: 520d1468-4952-4223-8774-08dddf01d71f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014|41080700001;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0Ge7tssJSCk5swunibC79Hjc25c/5BwB4x+eFCFu3OKM8qKafC/95E6lWxdS?=
 =?us-ascii?Q?9PiN6ZGnUZcdU3aYAIBeHHe2pUB8oidi7l8BklW0HUdTklO3NlKW5ZJccDB1?=
 =?us-ascii?Q?1u9mZgCyNQ+GyRG0LAOwcY0YPcDTbcQADlTDLaQy6hBNeUikqn6HXmIUTCtd?=
 =?us-ascii?Q?N0ExeRB5kR6sWUFNvu4Q8bnwDLO6OjwlNTvr+Us7CRR2DRgDF1YOJX02NuJQ?=
 =?us-ascii?Q?/ZM2dYfHvS23mGPRTbtGbvH8UzrfbD7o4dFEdU2Rq0DFEL+uEEAztN40IDJB?=
 =?us-ascii?Q?JSyNFQKGslm+Kn9I1ayCTv+rSIpq9WglTlJq/ySHlxVYxqEE3e2M1DD37TjL?=
 =?us-ascii?Q?QCtmZi0k6wL1lwuivu8kZvQ+pYsrtyYo09CnPsXCPiRtFTdrN87HB+EKIjxt?=
 =?us-ascii?Q?a+hCizox0kYgnrrFOb7SO5rn8BTAVJ+D8J9hCdX8Ta2I5IKzmn39kzSto3EK?=
 =?us-ascii?Q?Gd9KVcMiokVdJg+sQpLcDkTKQ0lIyiVDcg6pNNQAU93q6P1aV9xzF4GaYPGP?=
 =?us-ascii?Q?n5sFAO4q3SdA313GjE1xN38DufEF0/D5MVeOiTENL80/+O/9/qoaz2LXyxSm?=
 =?us-ascii?Q?fIfo8bwjvf7Yb6CrqppvgiIHXrUwNd8Ug8//DWjB0RFTLKHKE5o05wRm8F5W?=
 =?us-ascii?Q?O2EEgrTC40/o2Yqotqcb7Vy4uPY8GvJ6rKpk1eOxE/j951vYo0oMylZW3mna?=
 =?us-ascii?Q?7Mt/PFXA/kf5cix6+tei4by2+41phHARdSvbmu6I8Ud6Gm2N0UWdac5tLwTJ?=
 =?us-ascii?Q?WWWfommuQADbyaGyabAXpwTQA5WSdSsBIXdofch+4jriX7x2uPYphxsh5xS7?=
 =?us-ascii?Q?urhOfh8AuyIXK3m0yBPWMaRoqLt0OztnjB7bQHRheIe1lL9hKP8ZArwYl8+y?=
 =?us-ascii?Q?X1z9CAjhiuGJQgnjknw8w2TAzJL2nCHzh7lPKIokoh7BauZOu8BY86kGnu6P?=
 =?us-ascii?Q?drzUurcsc7pWmYjl1tOuTL8xOxca+24xQLMLI0FsspPm4x/1CsZ54ol4gNtz?=
 =?us-ascii?Q?auCwHdjzTmLgxsMzztz629U+w4bjMJRZI117pMgj1fljYa7KGpoJoD/d0tzl?=
 =?us-ascii?Q?SZjwgGc8LQ53/F+b3TidN+xR6fqWGy62PI1YIdynfh6ojCTqd7G4kBY/ikjB?=
 =?us-ascii?Q?RaG01Cvf00Mq0xF/XcEDPfnJJkjjD85Uvgu1q21IdDyHzzdpXsJZ3RNMyY7D?=
 =?us-ascii?Q?R10/XVtPJ6678s43yoCokA/KZezPlmTUTQni7rTjJthY+eILOk+xZdcH07Pc?=
 =?us-ascii?Q?qpKSR9ayJNXepYFCiZTNLcRAKrLCnJQBax5vU3HLorwtH0lWdjdnwPWnhdJz?=
 =?us-ascii?Q?DpbNivrlTcITvLE2YZ1vzTpeg6ty+bT+RZAC18Lf7/MEYxOeo/kooD2lztMz?=
 =?us-ascii?Q?vAI75VJmB2cXlcvl3cue9+D+szLRyg4DvlJnl4lVi3LNMMWlRD/6AvgxNdci?=
 =?us-ascii?Q?vL4javSCJ54ZhgBfb1I4m4i1j1XYr/QoaIwzfU05LTl4dP93D+jDHGSGhrUl?=
 =?us-ascii?Q?FLXBVf60IY6aQ0Da9TDwXCt2BrF2pBHDD+a1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR06MB6020.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2Clilqf76QSRtqW007SEY/YZCeMULdUYCuY3xi5l9ipmui+1uwgBGlv1XtzT?=
 =?us-ascii?Q?4qjNlio3Fx6KEV14crNFII2ukq1Gc3ye1iMBv/m3zKF/WqO7iK9gjtA+Diz0?=
 =?us-ascii?Q?dFuVmbmMc+8YE+610FD/WltzPdqNvDCvC4hH6kJhludY+WRvqSkmth7PnEIb?=
 =?us-ascii?Q?UeXlteM4orp5XQSEysENXbY2DBm1BUkpFVSq5UAnWUSScIjHSRa+O1Ehw3jH?=
 =?us-ascii?Q?DIZtGIpM+3PJ+fVnRtLGfxNak7cCrLibUCHY+kViOa7NAuxkqJkQQrHX20yK?=
 =?us-ascii?Q?oCUejmNeNgOpAyM7SiFYW1H6YRCs0jMWyG09xyIByZwrLXFHo9ZsXzp1rfkj?=
 =?us-ascii?Q?k4EmHT7bqDbD8CNiXbVeYpJ2subpLONA4VGi69cRh9VuxcltroNaK3F0edTQ?=
 =?us-ascii?Q?qxW+OtjZlbodh3K3kgv3vQzW4CmHzRc7kBUvFcEx4dFe1ZgHPQyILq+oNjCt?=
 =?us-ascii?Q?TlodvZumIfa4YgQFL89LeMLW+nZNsAqLnsiIFJkFrq5ERBi4inDeJ4uj3CWj?=
 =?us-ascii?Q?JCvtF/sQZsWvBbUKPrEugAR8UeBt1x3LKjACbCQvYn5UwJA2g5Ba2ieaKTbf?=
 =?us-ascii?Q?b/X16fUzHN2L3Cae+FNYLu+PtE7YejxtPgUJq+KH4kG2gHYTWjk2b99ICE7W?=
 =?us-ascii?Q?3SBWTBNEjBCVpOtmpW46W0g2FkqbM2OkDd9oQXGHSa3gfJgtK32Oy6Q62UAS?=
 =?us-ascii?Q?6ml2Wff1Hog1FOT7WJAps6oETByXq+/q2byF6e7LiXfJrNtdi3pvahuwvIGu?=
 =?us-ascii?Q?aQJH2i8hrdQwk9UlrNbqE3cDpBr2ODi0CXdkvPHZjkPEfg35Tvsr++IdIUjd?=
 =?us-ascii?Q?XsPLjUoCWF4m2LiBB9cNy6OW7UeYvIlaHDvYeRzUtbhnZs2aMbv5eMQsAeus?=
 =?us-ascii?Q?RnFYkLqhcgA5WQBCRmk/uCnjUtKmOklrQ9uDXbtGbqFEeChV2Vj3vNrNyooT?=
 =?us-ascii?Q?EOhdWyG/bODWkeCqvtOX2w4xNzN92NxyMuKBa18N/fUGsrvUtJweixSCgSDC?=
 =?us-ascii?Q?hvCOcFcW2P+s3ODnpKWnzVGUqw0D3mYL0TQTG7KJPGpvJB88YYcSKEc3hnt2?=
 =?us-ascii?Q?Thy88Eflapy0/wHXkAYwpE9IEqAS16mxf0893+AEwhDjRedBq/3tfbQ9BRGx?=
 =?us-ascii?Q?J7OEK48+8Xdn1Rmn4LLyv5HC1Gy0SJpMQkSKO6KlES4Zd0paC3kM2o0RjrWs?=
 =?us-ascii?Q?/RDIB0iiB1Z2QzjXY0QEf3xxF0BRm3YStuzPQN6o+MbV2slgZpZzBxhC9ssj?=
 =?us-ascii?Q?1L3Uf+pCJF9qOLLTYVnHino5fQfc5QfHi1eMWiyGkXgwK3Q+WGt81gxk5lQo?=
 =?us-ascii?Q?+npNhHkiZWpMVERAv6NIBbS3UYKI5VRiOawWCG925N8+MadMXFv6PVo83Aya?=
 =?us-ascii?Q?kQA4I2f3IclKKmd14JYk1/HGE9HSwj2WqB1yGNPfo1TULJihs3nRXYpnyimx?=
 =?us-ascii?Q?hnyiNvgm2/ZpEN1YDkpnbhEh2pbRZM2vHCFfYGpj1U9MT8C4bWVaPEQeLTb6?=
 =?us-ascii?Q?93gOLkhTarxZc8LyTAllruwbdp/g3d2p3wz0szvBHphAUb+Ki+7GqdElN7F9?=
 =?us-ascii?Q?R0NKr+wBY67rS3QdK3OL7WO0+oIcaf59T9UeQpgI?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 520d1468-4952-4223-8774-08dddf01d71f
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6020.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 09:21:55.5939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J4nUd3LXlHVQKYHnX1zs2hhewqIPc3IMGL7mL6aXriF/R2nj5Te3FrQpmM9OaQySv3JNrD3rNKGrektgO75zuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_022159_607752_AED6F44C 
X-CRM114-Status: GOOD (  11.21  )
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

The dev_err_probe() doesn't do anything when error is '-ENOMEM'. Therefore,
remove the useless call to dev_err_probe(), and just return the value instead.

Signed-off-by: Xichao Zhao <zhao.xichao@vivo.com>
---
 drivers/spi/spi-pxa2xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-pxa2xx.c b/drivers/spi/spi-pxa2xx.c
index 06711a62fa3d..ec7117a94d5f 100644
--- a/drivers/spi/spi-pxa2xx.c
+++ b/drivers/spi/spi-pxa2xx.c
@@ -1283,7 +1283,7 @@ int pxa2xx_spi_probe(struct device *dev, struct ssp_device *ssp,
 	else
 		controller = devm_spi_alloc_host(dev, sizeof(*drv_data));
 	if (!controller)
-		return dev_err_probe(dev, -ENOMEM, "cannot alloc spi_controller\n");
+		return -ENOMEM;
 
 	drv_data = spi_controller_get_devdata(controller);
 	drv_data->controller = controller;
-- 
2.34.1


