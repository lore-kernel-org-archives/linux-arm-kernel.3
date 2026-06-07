Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B5DBCD8C85
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Jun 2026 00:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yCMMJvjgLIbuZ48D1OsujID8nnO2MASZaeM/GANFcwk=; b=b1VElN/SeNvecBsTZEXPjlMed1
	YuIdgQIzWB/RGKd7b+woFfEplwxOR3wEARXDnxvBqoOCuAKe5x5pY9pubbkahYhAB8XMpTID8yiyq
	rxgzTJZytw8KAaEd2CIgqvMf6J6Tk2iEiVKBDy6RQpErdWqiln03AV660j1FXK0fHPqC2FeBDyDgs
	cA8/O216Ob43JG0AISIvNXPo3mVy5VZzv5F9aoH6EJ0weRQzXbj/qf8s1xn6/RGH+o6ie0PePOrm3
	qJ2cGTU9NiNpkhNIuMcNDTMkJuJvtI3Jy3QAZJiGb97DrYWSBr5bYNVSPmsEdzN91P96Pf5Ka76io
	369tPNbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW1CV-00000001uSn-42Wx;
	Sun, 07 Jun 2026 00:17:15 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW1CS-00000001uQd-2G8Q;
	Sun, 07 Jun 2026 00:17:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JWnXJ4aAjK4g+/x4cgV+X4wJXRQW1xrTRhzgFEbx2Nn1lxNc3jHDmt41su/Zv65aOKA60VzsedXLj2DGRqNMUAcD0aFTs8y62zgvV+8gh9oXVnXL6IE/p2oLvVIZ+fu+/k2y2EOz+B/wxmC1XB7Y7ODxtAxZoy8P9xPc+7mtBZdFKr5az/SkJmqTkm/B+fofOqjzPZ5jQ63g6nveFSP1BdvovWS+uYC95h+WSZvsLXFuO5NA8DJI+1i3tLB8NyO8vYfkJwSJ9ECRh9UhVLjrDVkn2/7ghd1tNl4WHYXIM8ZM3Hja1jGWSBMtP/f+uleQVRd/cOL5QVpZtbICUhPwNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yCMMJvjgLIbuZ48D1OsujID8nnO2MASZaeM/GANFcwk=;
 b=WDpczOLp8j1G9B3RpqPZoI315xyXnipDz2Qv5LOSmXHzaOeW6LaKgXlzDRpJo02qbaO85BVax18dhx2IVmtDr+2T2wZoZSPPiCvBI7t9GPNB1L4G8m1FAGYWWM3NUwOWnM+F65n+nt4fzKaVxPJngkOKrwKu+VJ9VNj3ndkGumC1ekHHVLgWQbc+2FurYF8KAndH4iI/wB2V/UvlM14XlfgwjU5VlUl0yBmRzpCSDgyCvSidTZsfoG9yVFQusGxROn/JNzBDOXf+DmxwblLXkS40JCAh/ZJOD7eDpB8kSQQtx4BTai7eUFIXsdobRu/4SXov9/Zd0XjTaysgiYTqwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yCMMJvjgLIbuZ48D1OsujID8nnO2MASZaeM/GANFcwk=;
 b=jNyLmoW/ZlqKf/QgPzJzLpquwQIymvzyK7YkoqDyoEGzuoxwqtXBrEqv6VReip80GxLy+UWGwjWuh0k1FqwFJtGowfrcqszIdSQTpTJ38N7gMXxI+NVEJitG7sGfaOjUnhhp2oodauiTQ5lP80lU6rhTXH07gZetqKAY7uzhe/wGJK6csL6tT3ePMy6mIbCqq5dcn0nFtq2LtKRvj9hegVKqfPERchsgTCluBzUM3LvEqAdFgQEtKliW7Ra9SzegyoYuD8GljIy0S5CI8faH26V/T/NFnmXWvBgzoxCI0H580IsozH3rrftx+M5KSiyowOiK+2UkQh+WTudbjRXJQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by MRWPR08MB11707.eurprd08.prod.outlook.com (2603:10a6:501:9b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.11; Sun, 7 Jun 2026
 00:17:04 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0092.007; Sun, 7 Jun 2026
 00:17:04 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Linus Walleij <linusw@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>,
	Markus Gothe <markus.gothe@genexis.eu>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH 01/18] pinctrl: airoha: an7581: add missed gpio32 pin group
Date: Sun,  7 Jun 2026 03:16:37 +0300
Message-ID: <20260607001654.1439480-2-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260607001654.1439480-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260607001654.1439480-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF0001DBFE.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::319) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|MRWPR08MB11707:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a926d3a-7a77-4d18-9e7e-08dec42a1a0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|22082099003|18002099003|38350700014|921020|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: PtEDViGou8Js80djyPi3s53Mzm6YPzzC2BQtJVoZWQmozzlt4cg5UWpo0tmrdkQtq4LEjrBbJV0cdcoqvXOqBsBhc9rcezOn8Ls5b1isLQ3K3twMZpwZFSNUsy1RdYmOX0zzsFyeDAN2FTCYerXvNfcrn0IQRXpY1bw8kNGb30FO1A/zK4LsM9FQeVUYhPKzC/8J+WHHHrYlCAyw6bOFmFm5dCyap6sgHsKl/U0VzrlmbXhsKIVktVfrMsUCTjuEa6/UG8xopbdi+vlpy8tQrs3v9ofq7Ff9tEsLejN5WO6Cdgk9QnHfqiiD7+hRc8sYPvvZIOrTFi90pYxgk6A47uCRJE42EWPCjU1iwBxCigHgOPBisHT0n3guyeew64FPIYUv5a3FlEK4GPMZZQc2wAXg3syEhfFEui6VKIb1Hg0O4YZe2rQ8DfZas9siN2OePRB3ZXwFPFmtlbEyy7EVLcy/2bYaJazsB0C1bYekpwvIneTl+ekozPz9NgNzKkg95mTt/1CtjgpLhlAPEjl1xEt6O+0DNvubBedMqsMqJwvQpPb7wS+UknbfUNuPAXBQDn0uPm3qoMCgcH5g81VzyQOX9anjZ04IhujmGYXqesducvFJc/h8scuC8y0FGjDoPMlb0ZBnDofh2V72C0dp+K0AuWMzmcLOt6j1QFcC4hUQJlUMxFfkyoVqVMtSz2vDFqc6swdL1GCqWTCacwkbIL0BXX3MAxxRPHgOKnS6c14j5aIUW08eRfvxrP7BbjbdonFs9CPO1wq2JWZ1JdpQVQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(22082099003)(18002099003)(38350700014)(921020)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LS8F3f/aSMzM8sjTpd57oXAUISvTyyNNizaUiZtvFVROe397jXKtAHR4BkZ0?=
 =?us-ascii?Q?7Ztwkx1P1Z9PTbm86ntwsMyW1NGp7nId0BosTQaWXeQUUoD1dsgfaQmfKE0/?=
 =?us-ascii?Q?CHueGegoq7KgrWsFE9afPA/u/O43RXsnlL6KsLdOT+jNaoBdHXP2ZlXK/UoR?=
 =?us-ascii?Q?csZn8KGtlW4+5uGMVoolhxtKMjnFmugjc1Ax2LWHlCIfA1DAbaFDseedJBCS?=
 =?us-ascii?Q?jm1zqO1byZ/0R7ziv7ZgkTZOqvaUZQrcHU5Ar+YgHsKuvmlZkrG0yXZ4zb/m?=
 =?us-ascii?Q?x8+spdtHc5OIamh72ILCjfuBPXYylkoOCNNHHirhy5Vs/kM6qBkacxr/jKDA?=
 =?us-ascii?Q?Ajf7X+LG+LpY0Ex7K3D6hLFjpkR0E07PSm1ECKyWOj0GMqwDfFJ8kALUMTcS?=
 =?us-ascii?Q?D6LHMZJqIedct8MyuzA+qDBP+Ng77sxfmVfwR4t+TToUHe2NTHapmleC+emg?=
 =?us-ascii?Q?kOGUJGC+9foWCGT1i6c3RsfqqY4mABzr76E66wDzF93SoZmXnxkuj/67PDru?=
 =?us-ascii?Q?QBQ0RWrWWkC2e+7dbZLtp07YM1+FqCmflY70td56wVGmMyZRAiLM7xhs1t6m?=
 =?us-ascii?Q?RIWBX7axtZCJ50M8EPXtOIigfMKsLbjN4/pq4wGvWtdwFnmnD2sziArZKpt1?=
 =?us-ascii?Q?euO6cO9u0oLe/XwzJrUUBsKyMkncvWO8h37fBi1DZnyEN8iauwCwTq0aI7Az?=
 =?us-ascii?Q?7X/vBLCFjvBYs9sAj8HoJMBFpseWIhzH+56r6gQsRuMJZ1wmqA3KoSvhLe/W?=
 =?us-ascii?Q?7gYXo/G8YyLTBH91WILX1DI3e7B5e9+IgVlR0A/qelL7e5vSQgFiTe4BC2gt?=
 =?us-ascii?Q?eIg1WKW02ObF6ymbOi02ZH0WhX5/Bb+G2Huy2p4VotvZOl6/AddLzp7N8ggQ?=
 =?us-ascii?Q?4q3O4hSYeF9CFuAtCTFkGLEqZoCmTHfXrcGynKsRQ5ICHd6bdAqdWA6lMliz?=
 =?us-ascii?Q?Qg7qVQ3Iki94dP54GQGSG8W1MNh2ao4DTdYG5HV748MZFOxLrP7wOBtrIk4Z?=
 =?us-ascii?Q?KEochfKtsp28lE54YRimYB56o+Zikbhc47egXQNvG4c6Yu8AXghz6KmqE/US?=
 =?us-ascii?Q?06JalLOI/yz/HC3VoIPahofudJg3ifJtt3dQ6xAuJCZmP2Ma/4H5m47t977m?=
 =?us-ascii?Q?IQKLpVngQxd5opHJObtcyYF7NTo4wQjPSmjAU+02uBHPNgoaq5mkQ+w0ICPc?=
 =?us-ascii?Q?0muHhc2c4vfgpJsdYwiRiW8SL8BJLkydUaYifajkz2fiUnPDZ2Bo9fNanEFA?=
 =?us-ascii?Q?zRA2kftGVF2vT78AnKLlaYiFT91DYTFIVRdHNnPvWLHJ/vYJ2mhRnrVFkXbo?=
 =?us-ascii?Q?ezDphVWScUb1jwi2x1a5ZylWP3P0ADZOXhDX0tvQYiZ/LPDdUQHUFYeJ9+GO?=
 =?us-ascii?Q?re8Twkcmuxq8Yf13+yXQEMEzB7g23otuCpGJQZew9h0ia8WFNnOX7swhtZPU?=
 =?us-ascii?Q?OHUXqQS3tZaDrEeCOzMJD++EMhQMp576wr/0k8+Pob/tMEZBLgyErah7SvNG?=
 =?us-ascii?Q?qOf4afxJMMKUsaWFWI4V+nPrx2vE3bLPKtNyHNSw8MHFsPImqnicrDGck7D5?=
 =?us-ascii?Q?arXN7VEHamNc7MWE+YVzIx/mBjOD32zDqis9EjgGpEjSo9I+oiKyKkf1X2T8?=
 =?us-ascii?Q?cE0FibBVY7Rw9SQsgCvYrBxCKatXUMivERCK4fmdUNno3HS6z8gWeKbZA1WI?=
 =?us-ascii?Q?oCOopQkg+odC0Ti3vBo8o6LzyJcTbK9USlPuLU/qj9jB7CQRyT2O8+hFp6VN?=
 =?us-ascii?Q?OpLQJXxxqrfk2x2b/QPPEDd1BtZNBDU=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a926d3a-7a77-4d18-9e7e-08dec42a1a0f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2026 00:17:03.9752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +7XOiajQ0l+g9blb6pc+bWApIpztSHvNbPcQEG8wslnkVJ7R/3xOedLG+ltC3RsUa2JAhseuIXhsYoo1M5qOyVGBYEf0yD5MllWGHfnut5U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR08MB11707
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260606_171712_574772_47EEC9B9 
X-CRM114-Status: UNSURE (   9.01  )
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


