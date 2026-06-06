Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C75ACD8C89
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Jun 2026 02:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yCMMJvjgLIbuZ48D1OsujID8nnO2MASZaeM/GANFcwk=; b=HjaH6AdfKJ12d3Q1QcxO8gPPox
	GlQcFjTyV3Za/iCXWNmA26QulBlg8n3hnC5/oLk4gGUD8t2/mPW78zqcRxOHCktWFxeOY+WHtzq02
	8mgJrO3GA43tRL/+y4sapehTHDD69+Akn9urFRggHSeeVL7NjHNfuBI/ig6gTyvcaydbrXuppJKkD
	Q4U2N9+RluOwnXDo8Keyjn2YJF/d2KdTbTIamiaL7F4cYBHS9w5lFvb/3g9bgZXY2uY5gt4AeVzAe
	60sTe9Im1ekeIGT2M980yQc4gJzlzGy7M74mfbPtKwyh5vBFbObPRHaxIH4UQzi9EILck5SSgcgoX
	xOFyTS1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVgOL-00000001Mnj-46DJ;
	Sat, 06 Jun 2026 02:04:05 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVgOJ-00000001Mn9-2QVC;
	Sat, 06 Jun 2026 02:04:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mlb0nER+3uzYLSziqX4kJdL3zjuk5hyX46r5G6qpk9V6j9YvqnMi42H/arKlgUigWNjKtm2HyqEKGBJniqJ00H/H6AitspIeZ1FDIopPg5zQS4WO+iCVndeofBwyQmmKZBE5Lx/YJ+AIFxMJ+2aM55MmOWnH8eoQzo1gOve3ZWPYYekyyreG+v95/ma+YXY1SAoXMWpfL5qqG87BMf/ZT5/fH4I/QPXisP3EC2Lcj3lm+BXWdRXh7UMFRQ+RQV+ESOVtNepIP/71BQQ/c2L5WB0x68tOtQs0EEz8Xpt9B4YDqVkcmQUJvq7sQFIi5mXjvRkoS55dow9iebFumJjkAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yCMMJvjgLIbuZ48D1OsujID8nnO2MASZaeM/GANFcwk=;
 b=Wy94HVazaWj7kTRzjK1W0G5Iu6MuJMJm6Ihz0BV3nY9kki9KWJhAdVYFTAR6W0WauQo/JBnNbQtiH2MLe0WCJzDTfq8gH6XDMnQrz2Xc1IJ1Ak4bZT1Bq8OSS7citqQXdec4SfZZvSI8pJms7L7gRlSah7bgBoFzVVb96DO96ZA8CbZVVxo5TMwGJrqG8u06Ghj7IDhi7rfqEa+lMjTlGu1p4y0KpXEeMJKl921IzqBNSbFkBDeKvqsMVeQs2SwOIiAUPUv96QNTFnXHSid51032mq3eymqrl7m03IJFTUUrYAQG2kOCrfMoT38Yp694aTNwnWLXb0GWNGl12Y3Lnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yCMMJvjgLIbuZ48D1OsujID8nnO2MASZaeM/GANFcwk=;
 b=xT08/onLJrTiI15BqjvxVmZmnjrMlIxxDgyFXJCPrE9Le1rAe4t8XfILhy1ZiHnXCQ/m4Tji0+bYuDQkdAtvwZBMaRlILWxkzq+RJgZiQTOqW9dIAZ608UBbhfVu8AzXsCrmi34Uh9U69GvQXlofRY6+vxAb6DCcrALxuKhJbFCIOxpuUxO0cE7RdjEAMzklAyYsSEXdEkE78eQjFnc7WY/cpgqgcVDAHhVDtN+wC9haZq3BPWTythQpFROQMqMP4dVebRL0SD8by7dL2PjRfcPyPYkvoXzwVaWVyiHu7fMbKANv6UszxkIXyfNi+hbPIScass3p7DB9NjKakUahcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by DU0PR08MB9558.eurprd08.prod.outlook.com (2603:10a6:10:44d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.10; Sat, 6 Jun 2026
 02:03:57 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0092.006; Sat, 6 Jun 2026
 02:03:57 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Markus Gothe <markus.gothe@genexis.eu>,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH 01/11] pinctrl: airoha: an7581: add missed gpio32 pin group
Date: Sat,  6 Jun 2026 05:03:32 +0300
Message-ID: <20260606020342.1256509-2-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260606020342.1256509-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260606020342.1256509-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0099.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::16) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|DU0PR08MB9558:EE_
X-MS-Office365-Filtering-Correlation-Id: c55f0f6c-a4bc-4c62-c4d8-08dec36fde96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|11063799006|56012099006|22082099003|18002099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info: GeVmYFfYtI4EDtElbi58gQvLRzTjbPxiFf3j3g1BC+p1+DURGrnxq0r1NyPqtWXRNuKizW+RGL+EPcn9T6z0QFhilwDSDbQgdfsq0nrG5SnY1Hhxq3gEMFWTcDZUm+55XRXJaDsCGYkIZrBoHXxCNaBqoNFWY8CIaa0nMCIEzEoAauNQIPdb9H/wSUslvdNJ6/5Lzb2ffylDsUhDn61tgIJ6tTnQGw7SoS2OtLh/0FTtzgowJV0ISCf8JJrrl77SDAfLscGGXA7CK4GiE+DjT+Hj4QCSdeSvCdrQR61NGGj6AJVqmKkO4qE/ZqRUOs8qiaGIPQhEn1QOo8LNCwA+kPSUGpQIUSa9snW/blRafW32HeasN9b3YYeDpmWH4AZO9d+OuB0IPrYoXngD4A5PgxvvQG4cdIG+zcQEq1BwZthhUUFE1EDsVw28dMWpC1jFkI93pwhqSk9++RtA2mPyT9gU4KjxS5ULNVCJkt4cCpyaALe4lGcLmwvrUu7kNgpK/4i2hyfg3BpxSFnfMn7L8F5yHIXQCamTQA86B9G97godCVcKis9MV88+8eeEoWnrQjJxa7cRtk9fBzv+kgrO3SgHEoTKMF1oK8sTdkR+gKWO6trx65TVhQ+SSpQJI1RIV643oRwBbgInI2wMCdmQj54NScrIxiuHI4guVitFHoi7cVEqhW2Ennm0qryOQG9yreOBqCINkgwr4PKKatHM0PHCWiTQ+TFbrkEnC3k15ea43HllmU0be2/zsPOhYN0Ny+g1NkDfb1ZyTtfoof36oA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(11063799006)(56012099006)(22082099003)(18002099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QRmNbcbCZJVvpkDxD46i3trmD7dQ47cJSbuWjkwTFLOFklTakMat76EwKB/m?=
 =?us-ascii?Q?PiIx159K8NcBXPtmDb6beUrLRYAy/B1noRSofTsSm0TMs7b/DtkleJcKGuud?=
 =?us-ascii?Q?D6drXx4ec45YyXO6SMImwE7d1XMknxBSXSE7EdYdrKbScFJi9DYJuW2trFHu?=
 =?us-ascii?Q?eowevXXDZp3IuZWOkVeKL1hiC0YX8c63eD29xi/YitAKb1etRKSHN83cewNE?=
 =?us-ascii?Q?ECNBVPTCDbv0vukREV8cH0GZSQlwnahN4kFpT78zy9GPyyYrDuMtIiD6YHIB?=
 =?us-ascii?Q?HrYQnnDPDuCpedVHMReY7LLHnPrXxS22BN6D4DttNP615vVAkfvN6aZY9F1M?=
 =?us-ascii?Q?sjwEe+9lQnckImVpthRbqYhO9YKXgHbuqJZUEeUw2zFkXtBrSs0qcDnqPJ4O?=
 =?us-ascii?Q?ShZX3NBCpUaws7lsdTjN+ErxA8FdW893r3ZbuL2XGLB5qSdiWHu+2GjhZq0q?=
 =?us-ascii?Q?+U4541QiRb9rYFCGiLSAy4oaKsl7kDZrKA4lkD/AvSyBBCKjsRmTqsB97Q/L?=
 =?us-ascii?Q?PG7j03rJk/ru3T83qRoFV1TcYWzYHnAneOvnXDl2/rpClijc/m136ACojGDA?=
 =?us-ascii?Q?lPSjYvyxj16DOLrGHnBchIBqcR0ED5PMzPRZVqZFj14/gknPkch/KL3HkGkd?=
 =?us-ascii?Q?g+9mQ8nivVUamtRIW3Gbye05oHfpJeOABxhdRJX2Yb/2aIzv2YMB8lJux0Ac?=
 =?us-ascii?Q?DU2wH1lt6JCZ9BJI9hohVkNFnq5SGS0kRgLfrQ9UPP6gQcD4VAfv2pqpBc3v?=
 =?us-ascii?Q?/3j+kSf8RE6ZbyRz8J5AxahHCEVhyDBZiQ4jZsHdQ0tPubOhEJY502turAGd?=
 =?us-ascii?Q?62uCU0FlHG1CDue9g5EodtZfmtBZY9ar/mifYf1gXHwD5Ry0REgSSwKfQrnM?=
 =?us-ascii?Q?JZdjfJrEoW9wF+SpBwEo2vYpM/PTycdvYiXpK/GKLZXzVmSvUg32dL0KHnUH?=
 =?us-ascii?Q?pBN2nX0bOYWrKKVN5v9GlLlnlhvE1ewbNXfqGQuNktoGm+ZPhPb6oMZMu9DP?=
 =?us-ascii?Q?GATAGQ8gcUWWIvRx2GSPH7Im31b3Bjy04RDwetxRTI7Ly3q5Uf8Masq3vPtx?=
 =?us-ascii?Q?Cd6BxQX7ZmL3EGoC9rIJDRJObWLIWAWD1MfQ+l7JpGKgXIS6wXx0/1UYK1e6?=
 =?us-ascii?Q?xJS+eg5h3xFPc9Vjr8QQF3eKjrJNhilVKDlet/RIxoazl5llhrJJKayo/viM?=
 =?us-ascii?Q?FTKxzzqB/XCq0FDKcrjcX7tdaAz5PyaK54ZdjVB/3yqhPV5Q1gT8PuudbK4S?=
 =?us-ascii?Q?iCuNwTG5o85eGF079LGVpFhR3bD9T0RtUn4CTIdC6rfIH9h8PSSFQizdcvxy?=
 =?us-ascii?Q?hWFXdvX9NH//HI9tj44CTvtdpd0qJcVOff7Z8nRaw37NQRp7aLHmPwwDjejt?=
 =?us-ascii?Q?xMGrukKsSc+/zAzn+7JTC6SxuVgtGzuJc3qlH8ITXbb97B9QNipojMjoPQtV?=
 =?us-ascii?Q?wnrEmnsX5tsfqHF9G5GUOir+ZQjdHwMB1IYF7gJ8tqH0gaSk9HSbmXNLbIAE?=
 =?us-ascii?Q?LDWiQ877OASU/dLbXovjrnZZZlnk95aKoOBiogfa+Md+bpTkwoMzQO5tBbT1?=
 =?us-ascii?Q?fEwNU7kP//6JGb6Y0gFAyAS8ee2ZvWg6MHrf1F1u6o1AxF4ccpoUEPaNXsSG?=
 =?us-ascii?Q?g4PbCK+LoknA67uCRx8hSBMDNmZ5mUhlvkn3K24Im9ou+OjwjaIk6unSzQY7?=
 =?us-ascii?Q?9J3lvfIwKqRM+yov1Tp16OGFDA5/Zw2JZUAUCQ7qVvu94duw1BNi1OkQ4eUb?=
 =?us-ascii?Q?yD0gMExCjuzjat9XdcuNggcpRB8F+kA=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: c55f0f6c-a4bc-4c62-c4d8-08dec36fde96
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2026 02:03:57.8249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J9AdYpJwQrchNIelMHiZgw6N8XjiRbVJoWooyY7bUQBxBY2P7ZHz21sUlHTVmE2Cq38N1Vj4J1/dgm7I1AUT/J+UyufrKfTjWnZolZcZGFI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9558
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_190403_985144_BD5D8688 
X-CRM114-Status: UNSURE (   8.91  )
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

gpio32 pin group is missed for an7581 SoC. This patch add it.

Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index 995ba6175c95..805166223228 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -539,6 +539,7 @@ static const int en7581_gpio28_pins[] = { 41 };
 static const int en7581_gpio29_pins[] = { 42 };
 static const int en7581_gpio30_pins[] = { 43 };
 static const int en7581_gpio31_pins[] = { 44 };
+static const int en7581_gpio32_pins[] = { 45 };
 static const int en7581_gpio33_pins[] = { 46 };
 static const int en7581_gpio34_pins[] = { 47 };
 static const int en7581_gpio35_pins[] = { 48 };
@@ -623,6 +624,7 @@ static const struct pingroup en7581_pinctrl_groups[] = {
 	PINCTRL_PIN_GROUP("gpio29", en7581_gpio29),
 	PINCTRL_PIN_GROUP("gpio30", en7581_gpio30),
 	PINCTRL_PIN_GROUP("gpio31", en7581_gpio31),
+	PINCTRL_PIN_GROUP("gpio32", en7581_gpio32),
 	PINCTRL_PIN_GROUP("gpio33", en7581_gpio33),
 	PINCTRL_PIN_GROUP("gpio34", en7581_gpio34),
 	PINCTRL_PIN_GROUP("gpio35", en7581_gpio35),
-- 
2.53.0


