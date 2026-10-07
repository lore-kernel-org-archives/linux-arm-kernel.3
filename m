Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B846CA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 10:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cXdGdBbtNu6JyTMus1MqzgfVW8jvDRC6SrwGmrMlF6w=; b=A4dtVHb8q2g0J/71L17f0/cXct
	zYAhixyd0wwb+PFRkucB3jXxBHks/oRR+rN6LKWqs8eTBX5w4x7nB2I8FrZsMJsRBrQ8pGLWOiLUS
	UwfcmAI3vcTg5t+iB9I1h7IIdTYS0kaNmMBwrjkBqyr0hhh4lfkQsjS508aK/ysX3++q24z83Mw+X
	Fa9fDz6PQdIzsLR8Q2Zac2y3SGK3IcV7i6zzfYFFNoe7ouZgSoPwIzFR4sj66wYnxk+ADqqnKuYf7
	JYqWsxjKjB0phM8HFx5ctvGFYb49V5zJTHYDY2a5/C2NdcB4BI3PYJdtv7W5ccLRHiqOCaNUulLfs
	xe16S+rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPBG-00000002DP1-3g4f;
	Wed, 07 Oct 2026 10:47:26 +0000
Received: from mail-westeuropeazon11013001.outbound.protection.outlook.com ([52.101.72.1] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPBE-00000002DN1-1EWJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 10:47:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t8XgrYun22TjBC9xdkiA7NIgjx9t7G1fpNGVJFo/xHpGe6hJUCuwSUbow9o/aJcec99UHFCaQbJxGz2IwvdxERPMwsVdOlmAX6QF7/NJ4ZhWp2bQX7a+e31iQH8fhmHC7dwD2/w8gzqkFy/zNEpOBaDewz5NCKDgZLyn8e1hqN0OYp/VkKsmDfXdsWHosI3V4ld+BeKN+QaAIdFOTAReCHwkHUFy1pTd1E0vNqhhk2wMbj2pqMc8SXDQaWncWbB777nHtdruFnNG8U7WgBA2HKCyrKQ/J1kxw/8HmIF+xgjV0QtE8I9POj/e42mofO1SnGw+uTWuvHvP/UQuKu9pCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cXdGdBbtNu6JyTMus1MqzgfVW8jvDRC6SrwGmrMlF6w=;
 b=VxwBnxfQvjMWWuxqTZsG7YELtGrSX9UVmGjcGOZx7pkttSSa0cg0/ehw9Q02PJ750iuWRRds/lO8NjWZr+GZYCSGrdGXqnRZV3HwX6ivwUZYJVS25MB9fETFBlV8MOinF/G3zyazIau+32j7M9oU372Ndy036UqAXnBqrMxHL2yQS1nBNIMG56qlLV6BzEx4fHJ7tXuuuoT9I3gXSo2DGAu/5QK07LGAoa0pN1gw2WuTWsBemXJGg2zX0A727AEq6Q7UaMhSZroQ2AIJt6eGw3z3VoNzUQy/5Mxa9oSmOwbJOLMuvUzXE++22xp4+vASTJK1NpndRRduHzW+Kb+HAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cXdGdBbtNu6JyTMus1MqzgfVW8jvDRC6SrwGmrMlF6w=;
 b=acCqgQzIeIm9/Q9XI9bsoqsxbLUghf/bP637yv5a5xLusc7JUjO7J6BuzU/tEhibfsOPA3ceeGrA7zPJ1RWf7iw9fkb4PVcrX47VhZ6vxUVDhb2unAb87tylgTjSIh3TMJnUHLahC8+6xk1DP8cRrXNRXlL9GHlxqaALwIsz3E9MP261xAGk1DwpwlbW33Cq/Mjx4Ie+QypFeIlXG6svZMLmwcbhJ3+jROTtswvormILG3frfT1HQjFBBr4/MDhMKxt6Erpcy7orPR89XINbKL3uo77DXaF423x3SK5MxxLy3KDUF3OBqeBkll53YCf0QChNbvzaPHxIekLZE/aDHQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV2PR04MB11738.eurprd04.prod.outlook.com (2603:10a6:150:2d4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Wed, 7 Oct
 2026 10:47:16 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Wed, 7 Oct 2026
 10:47:16 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 07 Oct 2026 18:44:17 +0800
Subject: [PATCH v4 02/10] gpio: mxc: fix wakeup_pads bit operations
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-gpio-mxc-cleanup-v4-2-c9f5a8b50df9@nxp.com>
References: <20261007-gpio-mxc-cleanup-v4-0-c9f5a8b50df9@nxp.com>
In-Reply-To: <20261007-gpio-mxc-cleanup-v4-0-c9f5a8b50df9@nxp.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
 Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SI1PR02CA0053.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::8) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV2PR04MB11738:EE_
X-MS-Office365-Filtering-Correlation-Id: 068fda39-4498-4a4f-448a-08df24605a52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|19092799006|366016|11063799006|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: CAzZ+EA+kqyocPvkOGDkGCnUyE7snZh+6cnJJci+PFvQaqlkIungKKYYiCSJGKzke37WHi+WD/8dP+waMG97n9S2Zpbax5A9CpedXnhqy7a8zEO1ivwLQ/9VmGB2wOSSoeWAh0tCsYq7uw3/Olk5ZG9vqJEDQBUDBHeKpXCl7q1ucjThLuOOIMwu4CualCMJuuVxTIZr3ymE22ESdZkoOaKAvHQdbJwYDMULBIDhV6SpXsQTxV2ec+rQla8kP4AC3Vxxper0I+5+c3xXHv+97lwWWqkiWYwd7VHReXfdPrx0tfmypELXpg4b5d7B8/xwApw0cuPEP3voX7Gclpkocrgdktid3eEJ0uN96DntdDoi2nmNBAWPMXK1f7gpPGpU1D0jQi0dRXQJe4soup3Y9G9Vy1Mtji8mHWwmaYSyr5pDQLl6FTDn3AuUIsHuOy5yqTIScbhg+rPtIz+7X5DoP3bKrp+6Jpf61YiZ9B/mgkZMC2hr32PjM5QGMUNye+Vg1nfF2DA0TXdfWUzrjhxj+PRL/gZzxglWkJqe3HHLXwLF2/1OvokiWGranw9HDO9bR5/t5A06HX6lrKvAM4pFWezaGyyigtQdKLsad+ETH+KjfSmgvYJPcX7n87ufioJRKiZ7rWQGTh7Sbl+emouCD/w+ugh2zMIWCb5gJtvjbQA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(19092799006)(366016)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eExTUU9ucVZUL2lPU1F1WHl4Q3pXdlRUM0ZnaDRJUFloMStnL3dlNERaUGVn?=
 =?utf-8?B?eHlIcVR5bUh1TmkwZ3NGRnkrK25JYm1vOTJWUXBzQ2RqY0QrbTJsek5RT210?=
 =?utf-8?B?SnRwdVBCaThRTDNVYkZSMFl6V3RTQUQ1bWs2UU5wa2tLNEc0dXpKRUZ5alox?=
 =?utf-8?B?SVdZcERkNCtCcmtNWlplTEdkbVBJWDZCcjBhZm5KRExuYk52cXVhbDZXVURN?=
 =?utf-8?B?d3RxTW5sNHpvZG1nOHFsdE45TVhKaHVuN1JRZWhyZEZjT3cxejhwQUhJZTBG?=
 =?utf-8?B?aUdibHd5NXdlK0RpS3pnRituMmFPaGZMNjdGOElQOUNNRFNPN0dqQnJzUE1E?=
 =?utf-8?B?SWE5RHJrNGRGVVpkbFNQME43TTBWNzBSVmYvN1dRdHRoK0NIeTBEbE9QZUFx?=
 =?utf-8?B?SzJqZkNnZDAzbTl0OFdMdm9HeTh1ekhSY3UvY0poU2hqWnJzUCtmaXFYWXM5?=
 =?utf-8?B?dlRIMXJBQTBYb3FnR05KUHVObmNFZHZ2dU43ZHBGb3NpYmlLZlZjSGVsdmwr?=
 =?utf-8?B?R2drNm1DSXVJaXkzTDgyNG51ZGgwbFFaTitEUzByUVR1K2pTVXdkem1ZQmtQ?=
 =?utf-8?B?VklHbEU3bWtyY1BlcTd1MkY5UGNqSVN0L1FJN0Q5TDhTNEEwL1AxVFJ2Q2Fv?=
 =?utf-8?B?b2dhZituWUZmUmdNcWUyZ3IrSE1zWkRRaFEwMGM0cHk0eVRwTk1aNVJBdktk?=
 =?utf-8?B?RGEyaWpxWlEwOU1uNDR1L2pyMko5TnVMVndaSXZuRkF6WlN4cVNhbm1QRGVN?=
 =?utf-8?B?cmlHTmlJYndlUW4vdDNhVnRnZzFoNTJidEJKZ3U3Yy91Qk40bTlBUWlXVWFi?=
 =?utf-8?B?WmNOWjZiZlloWk01WEd6NHptY3ZnQkYxajVYcTl5L0hERW1WY1pSbU1uUURj?=
 =?utf-8?B?RzA0L3pUdXREeGdoRW5EdkdKNlpKeFNaMjZyRjdNbzRkenBBNkRMeU5CSHBH?=
 =?utf-8?B?UXhTN3gwdDBoVmtkUWpoN1Z5VFpCczltNVFnc1c4K2NIb3ZGRndIQzdyUTgw?=
 =?utf-8?B?NjVHaFdsY0RDa25mSU1WRXN0R2hrRHB6L0xyNWFlVDFIa0VNOVhXVUVnN1VN?=
 =?utf-8?B?M0kwUGNtS0k4SWV1ZE5OSm05VFk5bDBlTlRpS2phOGhoNnVaSnNjLzhLVmR3?=
 =?utf-8?B?aU1RNHVYVFhUQ3hkYWwzWEVLR3BLeXM1MGM2cXRmOUNuS2dScFV6MlZibjFH?=
 =?utf-8?B?QXdwekZJWURZNzVNMDgwaUhRdmVlQ3MzK2VDTFROVnVuTEJMSnd0STc1SDBR?=
 =?utf-8?B?c3B2VVRXUittbTZldUxSTC9Ib241V016ZUtQNFFuVzdUa1V6NmFQUWZEL3Br?=
 =?utf-8?B?cG5hSGFRUHJIQUJ2MzlOSC8yU2hmRU43dm5nVURWcXlDbUk2V0pNMTFBNEZK?=
 =?utf-8?B?VVJwU1VVbS83TmRSZFZtTlc1VHJGNUEzMllFZHF0aVFtU3c1b1pTazcvUzVx?=
 =?utf-8?B?c1ZWOGpUbVJnOG0xenY5SlAzNEM5S25MNWZxNFNwUURPZ0pqdmRMaDhwY0dD?=
 =?utf-8?B?Y1ZFbmxEdHlxeXhwNGtCRytBMWV1VmJNdVZHb3VTZDdIQUtGcGZIeXRwZ2JX?=
 =?utf-8?B?U291UGtqYWJyRWFoY1NWZ3VScjFWTGFQUzNiRHBYcGtoOXRUeGphbXdYWlRq?=
 =?utf-8?B?R1hzZWlCWVEzQmhTYlp4ZTdHcW1NSnVtSDRadTVIYmpYS2Y4bytsSGwwR3Ey?=
 =?utf-8?B?VTVzc0R5TnhMTjlaV2hiUkUxZ1lXVE12R1JQaWY5MGFrMGwrZ3pmWVNydmdV?=
 =?utf-8?B?T2NMemd4eTRDQ3czRTRYbitpcXltK1RnWmxDd0JXSFFEMDRSYlkzWnhQMnc3?=
 =?utf-8?B?OUZhTUtoeno2bjdGSEMzNjFmU1JxUkdXZ1dDVnhWazdVWUhockhjVUVqczha?=
 =?utf-8?B?MmpnbXlHd2NUcERVRHJJT1RHRWhxTnBPRmhGanIwdkhiUlFjdnI3SGd3cjlo?=
 =?utf-8?B?OGJNckNLaXQxN01jZFQ3WmxlaG5XMllKb2ErZWR2V3pBUkJaekE2TXdEMkpO?=
 =?utf-8?B?NmR1OE1OQU5aQWFvVDBLaVJkTllGYXZZNHJzRW1aR3IyQVFHWUxtUEppZ1pM?=
 =?utf-8?B?bXpQRkhJN2tHS3pLbmRDOFhKL2hHeC9zNHdyd2VCdUd1QmtTU3N2R0FiU0li?=
 =?utf-8?B?dEZXd0p6R3RpKzBZRFM5QzI0bExPS01BY1c3RzF5SVRkeklaSUJBbzAyYm5K?=
 =?utf-8?B?VXFaYnV3Vi93RDVQTTZ2RjAwOGpYYSs5RUFTcUxFSjcrMVRiS0FreXZMTGdH?=
 =?utf-8?B?bXVwUUJVQmM1R0kwUjZ3M2RlYWkxVUtMOVhVcWIyQ2o0ZDI4b2lxLzNFcWNz?=
 =?utf-8?B?ai9ieTR5K0oyeDI3Z2JhTSt4WVlkYVA2QkZrV1ZwUHorckpySW02QkI0aFB2?=
 =?utf-8?Q?g7+fXMZJqY3uZQITUyNaCc6ag4aC5gvT9fGsc?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 068fda39-4498-4a4f-448a-08df24605a52
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 10:47:16.2443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XsPN9srZkPnmVRrWrmQat5jQegDniOqig8HQQr8mJOMAbCUZiDLG7TkEX6qr3kHGarIh/vR6ctGS/YTu+cPEHTDT8qE8MaTO61ERO/0Lae5QiJdl1hh9czmvczTcs4hr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11738
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_034724_593768_CA518F0C 
X-CRM114-Status: GOOD (  14.25  )
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

From: Peng Fan <peng.fan@nxp.com>

gpio_set_wake_irq() can be called concurrently for different pins on
the same port, so we need to use atomic bitops when modifying
wakeup_pads.

wakeup_pads is a u32, while assign_bit() operates on unsigned long
pointers. On 64-bit platforms, this causes an 8-byte read-modify-write
on a 4-byte field, corrupting the adjacent is_pad_wakeup member.
Change wakeup_pads to unsigned long and reorder to avoid the overlap.

And the enable/disable path unconditionally sets/clears the wakeup_pads
bit even when enable_irq_wake()/disable_irq_wake() fails. Only update
the bit on success.

While at here, simplify the logic by consolidating into a single
irq_set_irq_wake() call based on the enable parameter.

Fixes: f60c9eac54af ("gpio: mxc: enable pad wakeup on i.MX8x platforms")
Assisted-by: LLM
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-mxc.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index e05f276a50e8..627fff6f1886 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -71,8 +71,8 @@ struct mxc_gpio_port {
 	u32 both_edges;
 	struct mxc_gpio_reg_saved gpio_saved_reg;
 	bool power_off;
-	u32 wakeup_pads;
 	bool is_pad_wakeup;
+	unsigned long wakeup_pads;
 	u32 pad_type[32];
 	const struct mxc_gpio_hwdata *hwdata;
 };
@@ -325,21 +325,16 @@ static int gpio_set_wake_irq(struct irq_data *d, u32 enable)
 	u32 gpio_idx = d->hwirq;
 	int ret;
 
-	if (enable) {
-		if (port->irq_high && (gpio_idx >= 16))
-			ret = enable_irq_wake(port->irq_high);
-		else
-			ret = enable_irq_wake(port->irq);
-		port->wakeup_pads |= BIT(gpio_idx);
-	} else {
-		if (port->irq_high && (gpio_idx >= 16))
-			ret = disable_irq_wake(port->irq_high);
-		else
-			ret = disable_irq_wake(port->irq);
-		port->wakeup_pads &= ~BIT(gpio_idx);
-	}
+	if (port->irq_high && (gpio_idx >= 16))
+		ret = irq_set_irq_wake(port->irq_high, enable);
+	else
+		ret = irq_set_irq_wake(port->irq, enable);
+	if (ret)
+		return ret;
 
-	return ret;
+	assign_bit(gpio_idx, &port->wakeup_pads, enable);
+
+	return 0;
 }
 
 static int mxc_gpio_init_gc(struct mxc_gpio_port *port, int irq_base)

-- 
2.51.0


