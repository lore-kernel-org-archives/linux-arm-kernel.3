Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 984A6C44512
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 07:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9/rmX5SaleVT22SXUaqzcso9b/SnJrXyC+pjCMv+/l0=; b=RgASZfxVm9cKke9O0S+YhP+noF
	fvC+goQXn4kquO2Kw3CT+N3FphxekknEDu2wA1XFIQDrQ2RWlJVrbFaUzL+vx64YwqQb58pR+PaAs
	1ezmRS2o2HUwSj3XvxP8/iiAGlZyWo1kO5yD5r8w2jRuqDkVh5LAo5hlXp47vg3dhN8F89y61MrQa
	7ds5tlAsg1NZuNe6UeTztLERbwtb+nu5s5Kmq7tzslkUIn+k2Ad//ghca7DuHc3HVqIAtV7aGpM+l
	iqay1eGnxoSPNKvmZSrVNriY5DSXa1jC0150L9YxUBLUSYHnFcyL6Bm7RTnkgERE8Ig/fWi3vUuvc
	eyuuSO/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRB4-0000000B2ci-23Sg;
	Wed, 22 Jul 2026 07:15:38 +0000
Received: from mail-francesouthazon11011058.outbound.protection.outlook.com ([40.107.130.58] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRB0-0000000B2aj-4AF1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 07:15:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DQmEfvK047cMexWtKHCkVcXH1wmPZQ4vDAFN1sDQhqFZ7tq4+lxlvDuuMfzYGpOctNi3faocSMKd0JhlgfzNdJ1BM9LRcUz4p+DydPgWf9DNfaJ8DPypLmyprkSz6VtvGZKIAIRAnrlm7/dxTZyLJaLwxFCAqR51HcxYaIKvc2ig/GryEq3kSUDA1uHgHytdS+Sjkbc5pOCsX6CG6kyQkDIpjjC6Tm+Nbi71gsPo5T7C9c3/g2c+JO0qe8lcMzZg7gAr+TpEZVnQmwjSpgdKMT/CK8YcD8HleU0aqfM5vJrGoutNECOcrolN0vmY/IOcpQ67LiTnd5v0LyJnRT3Prw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9/rmX5SaleVT22SXUaqzcso9b/SnJrXyC+pjCMv+/l0=;
 b=Scy10DEgxiraMUFf1zv5sanZjWbc1+NsMA7CysLwyxzQaC72w2M5ECc4MluXMAU6jlKfpsbCyUds5QwtDZ03N5t47QKlbBqLTbT18gFgqBDyq3RgxuQokCDudBU0oE6yilHEnIS3DviERB1A4xiMO/CuctJQLIStV8V5ZVdEF1wY9VGKwdJZCvMSMt+p6w6fR+xXAVEih+/pPnw91wKo/FzK+K/Qd+odKil/qbA1a8UZQCb0bNP1D+Lw0TNc1DCjhEWCZXjmUSEXFExXkSSrtobTc+r9HXKwhGD+htTonH5xWtjqeGC6T8tnbeq8L5uN6q/hc8PMzT//sBOHNkuCWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9/rmX5SaleVT22SXUaqzcso9b/SnJrXyC+pjCMv+/l0=;
 b=Hc8FLeGrs1xpb3JgqauPYqKHQETSBTwVnQJ7P0ciZb2YvgBRiTGEK1OVAZIvAYZZs+GKNmCXHBZaKIrEO32c8wyufqhsg0l9vhs/ZOpYWWgt7BdCFjxoT+7NFejAwXvxBEQ0LDNOlPaDxpkAPicZkW3hxK9NoA0V1ufhLe74e6zxiw2S5W5KVSvpTeL8T2Avtu6/VKVQZJCsIzvZPK8siiWoIS2mHaJrQGsTi9C6VhpX6KlUiTsYgzOMTIwu9QHV09HNrGHwnp1PujE3rMj4AubW0X4ae0DcBtWnZAFcjSb4prp9rC6/oNwf/nxn/94BspUyVwB3D89c1wuNEo8DTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com (2603:10a6:10:113::9)
 by GVXPR04MB11523.eurprd04.prod.outlook.com (2603:10a6:150:289::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 07:15:31 +0000
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5]) by DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5%4]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 07:15:31 +0000
From: Zhipeng.wang_1@oss.nxp.com
To: robh@kernel.org,
	saravanak@kernel.org,
	ulfh@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	peng.fan@nxp.com,
	aisheng.dong@nxp.com,
	jindong.yue@nxp.com,
	xuegang.liu@nxp.com,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] of: export of_stdout symbol
Date: Wed, 22 Jul 2026 16:15:11 +0900
Message-Id: <20260722071512.3494011-2-Zhipeng.wang_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260722071512.3494011-1-Zhipeng.wang_1@oss.nxp.com>
References: <20260722071512.3494011-1-Zhipeng.wang_1@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0308.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:220::6) To DB8PR04MB6858.eurprd04.prod.outlook.com
 (2603:10a6:10:113::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB6858:EE_|GVXPR04MB11523:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fc56e33-5e05-4348-b863-08dee7c103cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|376014|7416014|23010399003|366016|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: p64i5gcKDyuWsALXt8NL38A+ilZhYsVfptBgsRN8MJ6iIlG/vrAs1Xzhlvo41WhjlLDXq5gsz1X7L7MnvE6WE0ZRxJKCOAMyLFt9mGl7QRvi0ddHH5fjKMvvkHwnRJPeK6yfG4wOsWXFQDpRv9IAmNskPhXj5MaZnC46zUB/Mb6Pzq4tsr3LzRUXYufUG4yhAJPPuJkTvbkYbqjDJnE9+r1l3tRxYXWkIyUjdgD1O6euZD4x0N2UYS9PPPmHCBKxaplvtzbWDfdFBndJzqrpvSDYuw7gH0LU/NC22UxGosEJaKQ/Qn6DIzIbrz6iJYRQj2yp1LoO5ukNG9VQIQWMRcGiAda94WxIOJkq8ApYBZiOHWbja+4HMac+Z1pKLv+6mt4acHKyBGWEzG2+Z29QuDy5HGp1rUvzy5qsmQgPk5KpTx/JjbgL1l2qJhXuFGwbAeHDNgpZt6Oc+4Rd2nW/kO+hQ0CjGT7nrOo/t2Nn8rjZYmyWf+rp0WA0P0YYMReF4g2yZMSZKBKgquMMAZm/7PhTMbnFj+Bffld46eX5npEhCYAEaoSnvE3IV6fji77C1uMfkrdHfcNQ6hIkPMqddKpA+WRBoCjYO3w4ONWyAtPgObPrpuv5IwljMdopGcNKdLMMLfoLlJjek3OwpAP5xE+SWgUsvka4mos27aLiZxU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6858.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(7416014)(23010399003)(366016)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GsQDm0vwHaWkj4GwHaFE2V2KnC9AdXDpkSLMPThTc7biqyLEiQy86Q4CKXSs?=
 =?us-ascii?Q?LPRkJO1G3f8bHMR6tWxupizaAXMbb/DIbeyeWvyjjWa1PiKUI/66VsMI0jV2?=
 =?us-ascii?Q?AQUxyaqhRl5tgPQ4IAWadK8AOr4g6uDKSDiDgKEuBIyGSXRQpRFpNp9dLYcZ?=
 =?us-ascii?Q?OVaIgfJlqzWI9bSSqJ0ceJwK1Lj5Bx8Lx/WsRrOXvmeBfZAu3sKe6sp1z15B?=
 =?us-ascii?Q?8v4aiI7LuiVrskUHUrerUEfOgB1WSGLkfGot4Z1lcjeczuqzOkSP0MjWVDJD?=
 =?us-ascii?Q?85iYlgtdXODjSRuyxanOfUJOVAg/khzhpGOH3XLUbv4/m8/XdOr8gqFFaI1x?=
 =?us-ascii?Q?IcvwtXNgN+Uxbow6Jm8j9NFnPko4ZFVdCWjtbE2qO6klvth55H8okt/zmoEn?=
 =?us-ascii?Q?IMG2E63JJKMWwhT5MF6yWRN6qbJ2wa/lvCoPsAfl9vS6UNhzB9tFOAt1g3/z?=
 =?us-ascii?Q?y/x13NoQGLzLwLiHfDRcwN3tnJWU1cEojC29wSWmmZjxXJnMQY2FDQZPStRQ?=
 =?us-ascii?Q?9brMqkm/qB54S3NzoJ17YCQrD8GF34VEKemO3he766tTAsn3g/aamg+ByYiR?=
 =?us-ascii?Q?CL9oUuGiJc9mhatGpIsARRdkgqkOlxj7WnHVHiMZeYrBxhyQZD/UtT+EudIB?=
 =?us-ascii?Q?188LwdeUMGGpnm+340c5sdW1t5omgj5f6Q7guImRefZsLTlAovBq2YoWc1ju?=
 =?us-ascii?Q?KXE04Rb2/IcnMUJqw74lwI6st+sdqd64YlW2ZPxmezXqWeWCKVxhCBHJ+ODj?=
 =?us-ascii?Q?JIuWTIoZl1zFgR5EeBeSn0gVp6T2qD+9CRpSNZ5p4/3MFGqrMIHHUCr/y/IZ?=
 =?us-ascii?Q?0DsrXC6l204edKNKba0uMWxBZsfYlObdJRw6Fcn5J7lpaifqcnZ2JSah3zUO?=
 =?us-ascii?Q?ASJiTZKatDnTKqQ7vfRQWMeqk9j4snP2PXdE3Ze2ZyNFGZX5GoQ7Ye6LmJCQ?=
 =?us-ascii?Q?fEppWKXNwZYQ1nN1P0JibRUn9H1XtGyVW3THPGdBsB/yV9tzTecQ/SvbN1Jl?=
 =?us-ascii?Q?4CQ0FDy7EAXqDN6xioEvLXNswKu4ATKJ2QcftkcC5gufelXBfhTEGIf68hp+?=
 =?us-ascii?Q?mAu6StjIaWRjw+srdv5B7lCM8Xvfhz2+LKrZ1pVp/YcewzDcl6/w5SWGomUr?=
 =?us-ascii?Q?b+SA7qtuIpy9io9v5YYFeKei6omeeWEt/zytmfhSEGbR4nMrHB6dthGKBvsh?=
 =?us-ascii?Q?n3lS9x2hPNjDWhP9bW5RUJ9a4eg60UrIUk5nOtKYRX4v72KDztfNGiyNmeU/?=
 =?us-ascii?Q?CaBDKKPxg4Rzq/C546VBZg+RL3aFkJWEa6EVUy0ySS3/KVSrN5p1Dm9Sap73?=
 =?us-ascii?Q?TZqQQK+D732T9dnlCa8LnxtfZ5MV3QiXAFORlDT/0WIZK4oN/jjScg542ZLq?=
 =?us-ascii?Q?1goRACcjf394DhN1tTc1xSBpLbxApgjO3yY40GMHAZlfXdtTljoq05lQd/fg?=
 =?us-ascii?Q?/yCr8ab0tW5qYtlcApaabJM8BzF0Ra9NrEgiBfBZrBxYAzkP2fh1fNfdk333?=
 =?us-ascii?Q?t5NQ0D63xZ9jatSaFdP2sbykVfRFSjZUf/FBXnYv9IZJTra1j5r7nE5jS0+5?=
 =?us-ascii?Q?v9DB0MePzDlZpSPkWOXLAm5xGBlKfUWQBKIjy7NCE1YfzAP9X5Oy/b3+qceD?=
 =?us-ascii?Q?zGC3lGWK0lKiNL8hRjHjG2fwZWyBvlIZJrLsbB8PzCM2WEmJm4qyaT+gVP4Q?=
 =?us-ascii?Q?QBWAXNniM6m6mwzIfo9YIrF+MylBYv5iu1X2Z8gZ3g4nhuJZ3JgwLx1pf2rq?=
 =?us-ascii?Q?EOKbDEygXKstDEMt8/u/v7VHglqrVuYgkh1b3psA9fx7UaLbYTOJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fc56e33-5e05-4348-b863-08dee7c103cd
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6858.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 07:15:31.3433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jw0VcnOpKAVVaeheBCbykwpMsOcK7PoQg2nO1njKLs5zowmbx/NgpJRQyiaQr+ED+yfZaiAPAB3jIJsNJkg/Nw8GbSoC2KuOHYmd+Ctc9I4Wz6bwTxvDJbZB3Z6jEJUf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11523
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_001535_031740_1159F6D3 
X-CRM114-Status: GOOD (  10.40  )
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

From: Zhipeng Wang <zhipeng.wang_1@nxp.com>

of_stdout is declared extern in include/linux/of.h alongside of_root
and of_chosen, but unlike those two it is not exported, preventing
modules from referencing it.

Export it with EXPORT_SYMBOL_GPL() so drivers that need the stdout
device node can be built as modules.

Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
---
 drivers/of/base.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 6e7a42dedad3..a25c95800719 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -39,6 +39,7 @@ struct device_node *of_chosen;
 EXPORT_SYMBOL(of_chosen);
 struct device_node *of_aliases;
 struct device_node *of_stdout;
+EXPORT_SYMBOL_GPL(of_stdout);
 static const char *of_stdout_options;
 
 struct kset *of_kset;
-- 
2.34.1


