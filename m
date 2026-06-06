Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52AFBCD8C90
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Jun 2026 02:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ECFb+azXNKYvk9q1g9bD4jBMKoDxwd3230PP3WFNB+Y=; b=tGxdAmyEaPp5Q5jTXTQLziiBBT
	eEgUuOW9Bo8CpNKsOIa8b35EfNqvs1tWknC7Ibl48cIri7tdBsB5WbktV+FWV2O9LyK4qi2SpjOnu
	JynxXHaCX/67VQ56ywNoLpL2HSS77AqQrek4BTIMMbp2/9ZlrwAJ6FeDMmnzzvy/5Erllr/+H3E5e
	vvnCcr8i3cT/6IMWHkxx3jBKcg3o+BYluqjs+/NjjXaIQeQ9kMGA7CWg88/IB/mSgVaoORB2LAdLs
	vz10eAWbqmVgFC76OBj1TdXCuyGI1BD3Kbx1sEPrpTVpZKuJWVm9FoL5gIjfiJVbBz2IfjpChB/JE
	g6BqsBmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVgOe-00000001NEC-24b1;
	Sat, 06 Jun 2026 02:04:24 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVgOb-00000001Mn9-0wCj;
	Sat, 06 Jun 2026 02:04:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w4A0VZfovO2iM9E9QDhzIJUAFMyR4U27QtEXbBOLOlEzjHhZ2xmFxvqUeiIIxvTVxwC1zntDAuJ/X4uiXRRACuzGzSA7u7/uENh+7joE4tNwckaEJ1r6l1yovF/6+z68VMALKhPSSzCFZDl924NRDZxUgy6iauD178IDcEXSJFfdhOUWm9S4j1XCHs2wAFJskrDV9jpwdvpA888XO55eg4X+zsAh84S3EdtM+K5AKtHstioH7ajcaDXMpHcXKWzFcF45QeYY3Ixq6dyMqHyVgv9OkJongrgju0eTl5vMHmyyb7hzwTc/0yUTz2r20U1EqBxbEURirCzAOc/pS6hUXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ECFb+azXNKYvk9q1g9bD4jBMKoDxwd3230PP3WFNB+Y=;
 b=HazffzxCjpLry34blJgYWoNL8R3s2dXv4fwcrf8dP6PujbXibqzLYcJKFIPrV00OKZwi0IDA/9PH8ae80XAa+H9jfq1V820wAKV9t66I+kXGoFEGuCpzG691MmCOmQRiTUNpjxLHs1dn4WF9LZ9EoVuKhAb2wHts6btJqTh5ajphGqoM2sqzmG2HsGxitA+U1gPt7bckNsPYonFuFB/D8fa+HFZBsCGB3Dp2DX+ObblybovBymYyjrnendpZBlKF/nYwhKq4ruNRbZJRfu4RX9o6YJdDnn2BrJX1B4MmuVCoEijuyg9sFkGyB+7SHei0eYrMcUCjPgKieRbiYPW2iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ECFb+azXNKYvk9q1g9bD4jBMKoDxwd3230PP3WFNB+Y=;
 b=NvlIdFzvDKKAelp2vdeL9j8Oss4lft3/6dt/hM7uUw5XioRRsLZRsfgL6l4q22Q0p28TOwCy6Q4tAZZ29frLRWISt8yq8EsG+ht1FCjgT/3SuaZ/QLcWluP1Xz6Wj1+k3XaaP/wx6TcnB0ubudgr4B0qkE+uUrqrkMOQhEGlnkV1D58lfxSnBdI/LuUl5ntFWJHSQtkqCXrm1nEk5GO4q7xp+bjZVSaU6QbL5PZfXcUC8eDLlkFCBcpanRFa2pR4+ewbfHo9W/eda2XeuDKpv4tKynE8Js4RTT4MeeI6Bv5lY4B5LEfNvfSCf2bLETW8sDs5TAptPeSbPwR2yoBotg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by DU0PR08MB9558.eurprd08.prod.outlook.com (2603:10a6:10:44d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.10; Sat, 6 Jun 2026
 02:04:14 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0092.006; Sat, 6 Jun 2026
 02:04:14 +0000
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
Subject: [PATCH 11/11] pinctrl: airoha: an7583: remove undefined groups from pcm_spi pin function
Date: Sat,  6 Jun 2026 05:03:42 +0300
Message-ID: <20260606020342.1256509-12-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: 0403c6a2-0252-439c-507c-08dec36fe842
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|11063799006|56012099006|22082099003|18002099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info: Xc1ppVXRNVC8cKV/KYcliuhYLowblw8SOMKobFfLnu+LPllqtozL9tz3Q2SCllFSMieen+N1OUMwNQnUOJYs/mvFMfAugvr3AoP/4+6xALx9JlpCDyjyYg0qpqpuynQMk1rFP7V8QnEXXP2DaD/A8auhLWgRQ6v3nY9LyVPWUyIzQY2iCkLQHgApPfDdOiK+0NeEhDp55ZcpxZYL5GzDs30rwXdB5NBv/2V0KuMm7bzMHJ5i20WXlG2zmGJrCPpEJEAgtoz/aOGMSAtGDKswKLDBVfNLOO8ruYlU54/wCp2RXHMH8pjRIyGgSkFDIPRWO6YS8IFz6vQCCG+8NG8dsDgC8CWYPk1OXZNmdMkIzQiOEO5MxGxQUq/RcS0vZ3bdiaeFEm4udvH0tmLl/r4o1WJ6VDqvQdUOkMc4NIRRluCxVF671f0Y9EO3rPngQlfzf7pxRbfp37TmZ1W2GlNMYBYAYDaULIdJWEvoRoOxh2y1xCR27lxBKfqzOMtvkcNc7KSOjLNYijwGZILhNukSRaUBS+VmTYGOXaPK/wYm3kT7n9TKkhX62S63P1Vjrii3qnwfocBBYTzjkVsPoRhvQjQ7ZkwZ1PuF3aearfZF036Vxz13m07HP0MvGT+by+TlK+EQNCaedW2Shqnb4xG79SdG+hbDNo2B0xC2U8BKD6r5WqEyBDPWRP2uwfrpFbHhXxgDDEH03bG5N+RpW+j4apNzKsrgrnTH2abZ0EfUYVO2InjCLuKA32QiAlQnMzdpn60w16EvQYpDAI8OoPNjbw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(11063799006)(56012099006)(22082099003)(18002099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?G7LCy7gaO6dN2rN+hnNT3B9iZHOVyO4UGZyyztAX6NZLYMwRsxyzkc2HY3JB?=
 =?us-ascii?Q?iyptfnXGMlRHUuR/3U/T6pMXs94GOp+l1peFCX3x0BxwVxMRUTExWjo0QjAK?=
 =?us-ascii?Q?5lmwc5oCRz7/JOt73YVAQWOKyGcFNy0unzq3CBsQ43QXIBUYiit3WysgDvil?=
 =?us-ascii?Q?9srJZbqLCNM8R4XYAFrQfL15EsCtPYMol5HOxNeW0dTLth8cK8Y9e8HvfuX7?=
 =?us-ascii?Q?/U5jTk+ZxqmzHPnJvyfu1WNrxf5iLN6wNIBqaiAzss387uQ3KCxKX/xzmm9s?=
 =?us-ascii?Q?cY5pPeQZ4s8z08l0FQgRIBpZ9VUQDeRLGn3xMFQHXBFLC8MOPARYAegHudjJ?=
 =?us-ascii?Q?gQer5fLM26PqNRSmhfq2jiGLXCBybz0KrJB1x2fRnesIGVZ6nE2WxsI6gsVL?=
 =?us-ascii?Q?sO2s19VgRngxvpjgp1vlbzWvhBAVYf+7JK0vlwedg3/OboL5vLI/U1oTq+fQ?=
 =?us-ascii?Q?YdMuLTP7Oi4uJy4eXpsO4vV2Rckgot6UbHXuy/JKepfCkkYmhmQs9zAZHOoq?=
 =?us-ascii?Q?FcG6AIJ+7JwWZdzcdfMgqcB7LPUHAA2QHlRCywuw+OhlOV4CEFkhxnkPvK54?=
 =?us-ascii?Q?CXq925vCbBoKkuOcmYIFj1HVDdsygtFoAy6VcqimfKxNLvdrYQZk66phv7B0?=
 =?us-ascii?Q?IkZ+ATOfQlgPt4KglvCqF/qsQkpQrdxFWKY5H4qM9OHjx/nt3lexPA2iXz2d?=
 =?us-ascii?Q?tFvZmLzAxdPKSv2fGCSuOCid0jhWlNPysNfD8NOJ0afyAg5If/AhAn2Shfx5?=
 =?us-ascii?Q?xLyAhBhrm8JRSjo1q8Wj8JQWhSDPkvHILfGANMp3EekvbM57Y88m+ZQBYR3n?=
 =?us-ascii?Q?8xpB2Ghx682wB2y9Pv2vUpMgsgsO+dU2O4u7AWeZ9vuZ3Oo5jrSsBzdQh2TM?=
 =?us-ascii?Q?5vhZjHoMqNrjFp/zHB/lbf53USpW07uPtxO47aPzI4C/0x8YZCPaEZEhsEXR?=
 =?us-ascii?Q?dlnZdjblyVFcBcNrp5yO/eiiFF850dWeMLSekIsOrNTUCfjawF5vvIR12U2z?=
 =?us-ascii?Q?eHTLVU4XAscr6Jx5kiuB7FQ6qoUNNbadHzwdXeUQNjh0mgXatzXY9YkvYdnb?=
 =?us-ascii?Q?s66G3VloLo9h0lKWEPCCEoRcyr1QFH5PEetl7n2xt97BUpMsUmW01OLYlssd?=
 =?us-ascii?Q?a26ZE+XGoM7brIYTpeOLVYpyVFkzrYZbyeRpbHgjRmcC1lveOhB2Lv5hqtZm?=
 =?us-ascii?Q?/uHpvjp3siG+7mNIqtH6eKWSXAUFOrE0SbzC9ZqbeI4V9C7VPqbGJAx8+fwu?=
 =?us-ascii?Q?I02HWKp+a6Wu2GtpUyIluu1X12IlXjLTwPZBs6ktFN7ja6epeMEshUuchYls?=
 =?us-ascii?Q?YjOICGPQBy5PvPkJd7rWqXo/ohbb8eAuJXMYrAincvuekZk88IfA9WlFOrFh?=
 =?us-ascii?Q?oXjFexlE6TT2oPc6eoUJdeUfciVfMgHBc3NYS1WyN/RFhbGT6PSi6r7wx/RC?=
 =?us-ascii?Q?ere6sNhxTZKHmR+NQbIP0qOnb9ORM+I1hyywmlaetBAyHGbozU1CzgXV0fQJ?=
 =?us-ascii?Q?w0gMe9Pbyiz+6gwIzPXl+jGB7UIrMEPT2dTPzjPJkeBetk0yS2mPqQO6bgRO?=
 =?us-ascii?Q?2KEQi0izz+6Ry9J9x/cCrBhZkQuAghWZ56oe3H/yVMn+ICQ0uI/R1iL2dQ+b?=
 =?us-ascii?Q?UdVZ2I+bTh7BTxh51kdP8SNZXVjKn4dca0QAj0zT8cKhuvFH/BCfYt2eLvO3?=
 =?us-ascii?Q?shYLMyxhRapFE4RT6DoYFOg/55y1kmjyVdR8SgdsyRp/92Z6M58Y3CZ2c8DU?=
 =?us-ascii?Q?yTTKWB3TXvyfPxRA5jVKlxuyjQzzlOA=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 0403c6a2-0252-439c-507c-08dec36fe842
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2026 02:04:14.0145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d0aAlEloipxbMgzERnrPHaglOxR2lLrr0CtWUYMvncJVUiqoR1G6ov3XOSD1fRhk6M7z0Whz6VNXjbVWa3TJB8jlUbUd5pK7+Cse8Pel9BE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9558
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_190421_301278_A0F582F9 
X-CRM114-Status: UNSURE (   8.89  )
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

pcm_spi_int, pcm_spi_cs2, pcm_spi_cs3, pcm_spi_cs4 pin groups are not
defined, so pcm_spi function can't be applied to these groups.

Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index b73ab60d0065..bf5ebb31e635 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -877,10 +877,8 @@ static const char *const pcm_spi_groups[] = { "pcm_spi", "pcm_spi_int",
 					      "pcm_spi_cs2_p156",
 					      "pcm_spi_cs2_p128",
 					      "pcm_spi_cs3", "pcm_spi_cs4" };
-static const char *const an7583_pcm_spi_groups[] = { "pcm_spi", "pcm_spi_int",
-						     "pcm_spi_rst", "pcm_spi_cs1",
-						     "pcm_spi_cs2", "pcm_spi_cs3",
-						     "pcm_spi_cs4" };
+static const char *const an7583_pcm_spi_groups[] = { "pcm_spi",
+						     "pcm_spi_rst", "pcm_spi_cs1" };
 static const char *const i2s_groups[] = { "i2s" };
 static const char *const emmc_groups[] = { "emmc" };
 static const char *const pnand_groups[] = { "pnand" };
-- 
2.53.0


