Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB76C87FDA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 09:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=N6woNr0g+SpALqet5AGMNPZAjkLLytQMbHWE0WBXc9Y=; b=DIi7UUF2LwZHBs2jmWRPfz8YfH
	n2TPow43qbVOD8qDm7KKm4F0x3QqG5q4s/ej28c7ookb3DLqWOohKG3gB5pSZ4T2DvJzt3hmrZywZ
	3sw1orF6b7K6XtAIGVO+moglQ3UUvPd9cJyVHSQY4sqO0rSHbIn6qQoIK4kJ7MnaUim4xAVkx3Trl
	pGguLyHHfXotdEIW9W9X8FxIS96YLgSEO4ipex5SQwfHac10Gk4WAvzeNNxA7OizYl53gdHdaoGo1
	Fh9dJx5N1897Gp7VEBZIHeSALv4j8FtkcYBXh+6gaYAJMauf+QohZ7TA83DJYCHCOho7rFtwm52yJ
	qGdDQL4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uirSg-0000000A4fk-2LlH;
	Mon, 04 Aug 2025 09:26:30 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiqtG-0000000A03D-0YjE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 08:49:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OdJ+wjd/gE/zIA7c+2iKyRv07z6C/etpCjmgM7BNgM9jt6XbR/aUgLCo1hZDaqrwne98Z54LxEAF8xVypGMDh+tr43SCi6Lzc+SyXFLkLeV5RmWqIkwPq8czk/Pkzy3l4+EFeOZdBuf8DMuwcs40i54qk8PVD3Ylk+84jlbtE1mwqMZO8NDzqD6UZlie652UUu3yY9/0chWz7apBsHrr9Hpp+gkMrloK0TkqDJdwIDNB1zvVmTK1ZKx9qE897DvTTZwJGsonZlGJ3s6HkSoNvWXYSCRU9q9p135eRQxW2LwIAx1CNh7DAtRaw1WUequHB+T01OA76Xitq57t0Rs5aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N6woNr0g+SpALqet5AGMNPZAjkLLytQMbHWE0WBXc9Y=;
 b=czCT0+Jk9i/LcOSQSAlq+eVcW69cOqZUqplG5Qt9Pj3mTmTWQCU9BkeovCEXr3n2yFO/LhTpu5hWpo65rdekx/z6k1yUVpfTc9ccRSuQSPpIGj6nvpHQsW1fv/n25VXPKcKE4FeCJaFsLrxIIsRmdqEAj5AYi9OH1PcUiLPOa/h7HWWTACI4Qanq6ET7cvYB7Pfcg6ufr+DPHKoK87dQxfAa1b2ePDIZ8DcibGVn59PElJs3sOTC4Ta4Qk3G7l6dBRR+wSTGjeGc18ipBdQIA8V/jbscpJqiO3u+hZJSu4k+D8hRLdEDOjotUwhQQv2inMaSk4S1DgOpL5jGQrbd7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N6woNr0g+SpALqet5AGMNPZAjkLLytQMbHWE0WBXc9Y=;
 b=MDzNcmCHaS8QYYOXo9S43HmPSiXYW/G4JGaa7aBPuSiHm88h5JfoMA+00JlcFlVqTPWdfMD1f9TNLz2ohkLHbutBox3TTAFyDnT8FnscUrPacF4g1mznvXnKtWVs9gQ3K5gOIAElzt+gy6DnquIfpgnk0puvzKT1g5fUuLYFQCn+VuHxkMopHi0NXV/W8f0vR/K24MuRbvGu7V37wLgma/EnGUVP2qsP5a4cqL3yoyKL2tn13kiWvJrr171H8zdhUwksIPCiKmXXAOEvJi9gM+pKsCoXeC9QTsj2axOIlW6JzcmXpOkmp3TvVD2u/ApmTMPI2B/qUrYKEsT8YtSAoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by SEZPR06MB5176.apcprd06.prod.outlook.com (2603:1096:101:73::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Mon, 4 Aug
 2025 08:49:31 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%5]) with mapi id 15.20.8989.018; Mon, 4 Aug 2025
 08:49:31 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Liao Yuanhong <liaoyuanhong@vivo.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] imx: Replace redundant return value judgment with PTR_ERR_OR_ZERO()
Date: Mon,  4 Aug 2025 16:49:21 +0800
Message-Id: <20250804084921.231257-1-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR06CA0040.apcprd06.prod.outlook.com
 (2603:1096:404:2e::28) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|SEZPR06MB5176:EE_
X-MS-Office365-Filtering-Correlation-Id: b7cc2df8-eaf6-4872-977c-08ddd333d411
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OYN4yZWNvxfkOEf9QmPnbjP6XkAHmnwDVCnFxDsjJk9HSvTNXdi5UXXDI0pu?=
 =?us-ascii?Q?oTvPGZF6Jsx3OsliXNu/KuJioT8n9qVUD4GJ+oGrMS8U4+wIxqZPPcWWhMvd?=
 =?us-ascii?Q?/ljyfCjweKbUCNykcGhGPt/9h6lnAlp5P8KOLxl8v2d++c8wXVyLKh+ezDWp?=
 =?us-ascii?Q?Kp4CrT0nrg05Bb299sKKUfNeAV02mLYurY6BKoxVa+42xRVTnzeCVvSi+c+l?=
 =?us-ascii?Q?HkcBFpYXmWv5o3vbGc5jf6EZiBOtK2rJgbmdh14xy/7GU6It7wKt801Jc//4?=
 =?us-ascii?Q?lMXJytotUn7Hb3mwbxbz7chuGYMbew7PI53cyRuNhjhgnRZymYcTdYz4OPWM?=
 =?us-ascii?Q?sxtYBhsoivmXSysKq7728+8lZXa8ATm2MjvMb/c9W/pQSJfJVEwFZhM1whG6?=
 =?us-ascii?Q?2Zf2Cl9wor0hJDZeuv5wiPwSqNIHhJ5m6rBwD/VjuRVF02QfcvEvnRks64c3?=
 =?us-ascii?Q?N67IMrmlZD2AZ3JW9crw7zqm8wiNbWMVkceY34Jm7vWRhzQInsqEhd/Cp5Du?=
 =?us-ascii?Q?om6/+jYuCArbN/VyX4HK60rjqjglKiKYASGFHfPiFKvNBGNfZz8dYzg84gpw?=
 =?us-ascii?Q?lJ1tZXeX/1a1RSYvjLgckK5CiJKwn4QAyL95NmI1EPTUZdP6AJpQPaGHCaWj?=
 =?us-ascii?Q?ei6/kqaOYIgDl9HkJEVqvkbQMv+thR2QE72R580sDEoC7PG31tbdrHT6YwZs?=
 =?us-ascii?Q?jbDhzGvFms4mPW9l8lgestucKizPp2LSUGXAkajlL7dVoC72igC/7HUxF94n?=
 =?us-ascii?Q?BFtCSBjG5XHWZMrBkU6W6L/d5wj3+kCKqgmXEagrY+xnY5ieRo9nA4NKLAqc?=
 =?us-ascii?Q?1Vs55P4lOfOGeXXW+kPzyN5PDrvRSQHdIiZdwYHc+R7S7hU4yQ9BLBS6aOtR?=
 =?us-ascii?Q?uB2yZ17zggQSpkben+yKq6NYS2iHuRBESiMOMZIZytbJc0hqHI5qrYwahmuO?=
 =?us-ascii?Q?rzkw3AhHgzW99tCUf5JuejEr2H7L3QvWUsQMpyhWAJ8ph8GsZq+zWCjcLMF9?=
 =?us-ascii?Q?RItOpQLdIFXxLpujxweXhJu++t6JXrjonLWWKeCsz3kcxr69eDp0tNg30oWt?=
 =?us-ascii?Q?Y5bKt+Gb4lw1a/6jTg87UVqHLwzCk/8faZMw8cfQmud8UfEjDZGpLTM30QGj?=
 =?us-ascii?Q?J3xHgaOWuuabP9FE1OXYSNX2RIB2NlICbtu2L4sUbFfTy0TktOGP9Soms+rJ?=
 =?us-ascii?Q?OZroUV1UOOXN2UZL+3eGIgHuzPjRy/Y2QvmgaglOo1lV9TCjavUtEOl1GJ8e?=
 =?us-ascii?Q?SVXDt9yc/K0NOhT7sh6wcPNfK+XXFqg73i8J69vdNDGho0/lIYWDpyj5vvhR?=
 =?us-ascii?Q?9P5DrzZfYP9cZs3S29j3v1Ld9tsR+41J1XAFZjgEOV7ik9xi8dv62MsEfUY8?=
 =?us-ascii?Q?ltfJXA8sEqQ7Uwo6elvxVxijYM+QblxukIZh3BXoJXsP7JAyf1MbPsjqp/ye?=
 =?us-ascii?Q?3Pypi3JO+NrMNz9gY8a05RsRQV/T3OD5Gi9oRQHHuEC8SbCBII7+3w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5576.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VyvfwL938P4Mv4LZyMl5JJilKSa0ldfZ6OkcHBTLxQtcWwuEsPFWs0nlqiWA?=
 =?us-ascii?Q?gbuXDyP712JQI74r1M4QMTkbsm61hRRgAJ5hMtX0HKZcMrPOesQm1CRdkQL0?=
 =?us-ascii?Q?QcIPofZyWoGJ0mUTY2h/b9wlvzIPdF2wjJ8WnSku2Io3y/6Ao3gOijY7K+r+?=
 =?us-ascii?Q?ao4QnLWvGegCk0UEaYtCuGxhqR/G/yq/57HruxWAp5syZ5KaSm1o8x70joH0?=
 =?us-ascii?Q?hpPhtz9dNhc8JGsvFvBzvvgY08ex42xj9bc/UyqitRske0PenQkGf7NPucWq?=
 =?us-ascii?Q?YVzx9XhIjGZWSdMC5cacJ+dhaFrds2PRF04qYbp5AucjrP2UDh1Gg1DBwef3?=
 =?us-ascii?Q?x922t8hw16zJ0NqH6dPh8KT6PVJ2ZLr6mj8+fu1TGae2Wb4KeJyOCEo2FUki?=
 =?us-ascii?Q?nMtiL7OHiUXQvJ4664MybWVItjJwezaoG6LNDMCaDvDuB76GDlDPbXRCq9u+?=
 =?us-ascii?Q?+Juq6gqYlKBFk6nKbjntN317LLKRj7NJgbtrSUAYA1htb8Zy1ANQgp+W/r7R?=
 =?us-ascii?Q?5JcmSDfn8QhH4DmZoS5GlxNm//BQN4J2saCGlG0iNieadAn7c58UqXcSO8wD?=
 =?us-ascii?Q?iAt7iHriqf47asjsQaDITxD7n9qj03cbtjunP8mj4eBo8cdiDcsci1hAzov8?=
 =?us-ascii?Q?gaWjmJuLnasojEH+JSOdB1V9Dq3lPopdZLAIPrFJkMSrMIJNWVXTqv0l/1pv?=
 =?us-ascii?Q?kS4xtT7u/BbP860HnxyEn9TzVaFRojlyoqOcfYdyme0hZk/EYgC7+ntjyzxj?=
 =?us-ascii?Q?LbDi2lcBFPHR2ZC+D93NVSVEk4OBWHfdhds9PLB/RowX2NMtKxsA8sajMkDX?=
 =?us-ascii?Q?wIRwFgcAte4Z/lU26xwciCQqPWQoGLKYMIvA79vQvzgGbczL0xCubjnh21UT?=
 =?us-ascii?Q?t/wuEDcvihni8PLURhXgUW7UNMAqjU7SETAEZZQUvefNxNUJagoMF96WrTH2?=
 =?us-ascii?Q?xbcWR0dek/wcyR5+idAyWSUEKJ0IwTGl7UDr6vxgZ9G7BkkvzCJPmuIc9fH7?=
 =?us-ascii?Q?QZMd9jvH/ApXPZQsjas9ESvFWcURKt8Mp9974PPWf3bmh7Z9ED0ToSebOhKR?=
 =?us-ascii?Q?tgPlZpw34bxHlZnkghxpeak+6C43m62LTc15Pt8h789D3IntvsPshdBRdw0v?=
 =?us-ascii?Q?Kf0x6RdSRUXxWQaRX7OnppBPuBHnMalh5QJDepEoG4LZ7ybC2KkM3bGCYhLJ?=
 =?us-ascii?Q?S4rXNgjwZ6NglmokJLyxbtqOaANxQsDhaOBgq4CU91jTTbbwzCndpAG2e7Cr?=
 =?us-ascii?Q?OPKEhsKtAc/RYgxk+25uGuUGcP0DGxwZNtWMVmHTaXAVnelnYA9JeH3yqgvY?=
 =?us-ascii?Q?4DP69xx09muojVXM8QKZcj9a/oIMuEjEIS3+678tj1KEntrmzWUDuQ9zdlFS?=
 =?us-ascii?Q?7AyGMlfcT5AiKYXIOiRUxxw2ryM0IX9xCjVKm6CHg91HzwsMMVCB5ysgI+eZ?=
 =?us-ascii?Q?VR9QA+iSDMHXHvbqXIR5El0ykt06qxKrQVDQwYFzs+A6DjyeeB641d4G+TRH?=
 =?us-ascii?Q?Pg4AKhFg5CDrEpCDGW/hdB3i+ioMTEbTDlV36mGpDA3jWtKefnHAopUO0vrr?=
 =?us-ascii?Q?dgcSYmTJ7F0dvpaS9AazToCauN0GKCwzUCqvC3XQ?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7cc2df8-eaf6-4872-977c-08ddd333d411
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2025 08:49:31.3280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TeHMVKc0ciE0ZAl56Lea6XL6bcaH5n7ARnmBUNHB1BZs4nn2XcY/0CefYaPVaOBsufedaVVc3/t3rLtDIOAV/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5176
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_014954_169507_0905E69F 
X-CRM114-Status: UNSURE (   9.57  )
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

Replace redundant return value judgment with PTR_ERR_OR_ZERO() to
enhance code readability.

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
 drivers/firmware/imx/imx-scu-soc.c | 5 +----
 drivers/firmware/imx/sm-cpu.c      | 5 +----
 drivers/firmware/imx/sm-lmm.c      | 5 +----
 3 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/firmware/imx/imx-scu-soc.c b/drivers/firmware/imx/imx-scu-soc.c
index 497192320562..ecea39ea708f 100644
--- a/drivers/firmware/imx/imx-scu-soc.c
+++ b/drivers/firmware/imx/imx-scu-soc.c
@@ -145,8 +145,5 @@ int imx_scu_soc_init(struct device *dev)
 		return -ENOMEM;
 
 	soc_dev = soc_device_register(soc_dev_attr);
-	if (IS_ERR(soc_dev))
-		return PTR_ERR(soc_dev);
-
-	return 0;
+	return PTR_ERR_OR_ZERO(soc_dev);
 }
diff --git a/drivers/firmware/imx/sm-cpu.c b/drivers/firmware/imx/sm-cpu.c
index 091b014f739f..431ea1963bd9 100644
--- a/drivers/firmware/imx/sm-cpu.c
+++ b/drivers/firmware/imx/sm-cpu.c
@@ -61,10 +61,7 @@ static int scmi_imx_cpu_probe(struct scmi_device *sdev)
 	}
 
 	imx_cpu_ops = handle->devm_protocol_get(sdev, SCMI_PROTOCOL_IMX_CPU, &ph);
-	if (IS_ERR(imx_cpu_ops))
-		return PTR_ERR(imx_cpu_ops);
-
-	return 0;
+	return PTR_ERR_OR_ZERO(imx_cpu_ops);
 }
 
 static const struct scmi_device_id scmi_id_table[] = {
diff --git a/drivers/firmware/imx/sm-lmm.c b/drivers/firmware/imx/sm-lmm.c
index 6807bf563c03..1abd406d7d16 100644
--- a/drivers/firmware/imx/sm-lmm.c
+++ b/drivers/firmware/imx/sm-lmm.c
@@ -67,10 +67,7 @@ static int scmi_imx_lmm_probe(struct scmi_device *sdev)
 	}
 
 	imx_lmm_ops = handle->devm_protocol_get(sdev, SCMI_PROTOCOL_IMX_LMM, &ph);
-	if (IS_ERR(imx_lmm_ops))
-		return PTR_ERR(imx_lmm_ops);
-
-	return 0;
+	return PTR_ERR_OR_ZERO(imx_lmm_ops);
 }
 
 static const struct scmi_device_id scmi_id_table[] = {
-- 
2.34.1


