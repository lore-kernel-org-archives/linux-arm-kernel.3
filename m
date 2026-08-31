Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45BE3C624A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 08:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H+s8BkOyNSHuRie2fC01Wy19tDVhaca9HVahGR1s/5k=; b=ZG6PUGzmkgQQG3em/rnfrn+lRN
	Jz8DUkxyd9m6tC5nUvcG2+Efdu3s9TLJANGZvQT0DV7Z5gvr9CPnHdF8so4bqxIQQ8d1vgE7Hz8Tb
	ooGTAykiluykdaq63rZrWSf/SljCpSaBKoqK66AFFHMivwXi9aor5gpBkkL4B3OSE4TSwWP/bApZC
	2auNXlwQB/2j3CRKzsygFdUA5HFolardqCc9tYpUWK2YLwssyKp+fL6VcyALxDUMfvcfZR04JlIsl
	G3gubDRFvU+Th5vU70BvoX70WwDbDBBfBHvKQMx9hAUl7oy8/Jk2W2uZ0T+qcy6H/SW3FGQjemKgE
	OViYuHdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0xFA-00000008pQI-3PPx;
	Mon, 31 Aug 2026 08:19:52 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0xF6-00000008pOd-0eHY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 08:19:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=actGPO6usvMxZzNpXb46guzwxjtPrZC8dnJoxwusN868PJ2mf40v/0DW7sjY+o8kYz0vmGbQkclHNlU0jVtoNGwwtM/n9nEGKWZ1LQWhA85+za7r0LwCfoxnJKrosW4ZecFJiwjxJl59Jc5nLpFR1xuXb7cuhscs6NOit0yZ08JOPIsCZn9csDJytON7XdRfvl3Fnqoyt1O5jMU+4dO+VQ4RqC2Q/dejPnYisCLMCW9LFRHiJhbICymJomsp+xTAupCUe1itLCuDX2xa8JgjB5rRxEsHl2ZCtMi6E7WS01SRpje221TsD9JwHG/xjSCmT+mWMRPhL9TvsPrOPE+c8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H+s8BkOyNSHuRie2fC01Wy19tDVhaca9HVahGR1s/5k=;
 b=jGJ+Xl6pV5Y+jFXTwdAyNm1bXeZag9piuyQt6F9kzkuYHmjWfPv7rk0HJ0jppgXzTzVNS8plQ42q26t3EEykgc4uX3jsHoToPifMQq06WGrgcZmP4Vhacfhdpfuu1NOu63jgPrWX8J07xsc8rLWhsNzzRtE4VAugYLXk5SPTmZ5ecsMEOxB7q7r3CIKNBI0ks8JRAIy3mNeC7lRBYeppMJP0qvIfvfdHZ+9vZ/U+7WOqT/OUl3pJXyYUHQwi29NBIZPzSG5tLEpKXj5+ud9Ti6dI1UHsO6fdtDI4gKNO1gYkosqhZ4q4XJQycKdCe+60ninRfFqC2DwS9ZmndZVvbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H+s8BkOyNSHuRie2fC01Wy19tDVhaca9HVahGR1s/5k=;
 b=R8HEwlvQHES4gBI48sZA34p88dYK2thGWEkktGWEswD+EuytmBXkFLlv7TTShVC82tU58OVoPT08EKiiHDFGa8NH1jS3EIyuu4K+qPlr5EyXeI6Gf25gI8/hVYPm/+j5JIHiKKDvhFOWSjG/0T6JPFZW9mjc5mHxSB/W0ZuP7hG/L4Vsq7e7QXxxksnNZc4yT9UV6frPQjX9TmuzzDmnIpEO13yWOjEyb3xs8lbywm+OdqTkGuaKxFvArp103NdNUoofWRW+4XS66VjgWE/7w9b6/XkMbQfzYkbn0MUU0cn1cAra9Z9SsdePnQ5rivqh55XIz9Rg+8ZAlJ0k6xDFzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VE1PR04MB7216.eurprd04.prod.outlook.com (2603:10a6:800:1b0::22)
 by AM9PR04MB8440.eurprd04.prod.outlook.com (2603:10a6:20b:3df::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 08:19:43 +0000
Received: from VE1PR04MB7216.eurprd04.prod.outlook.com
 ([fe80::a9a5:cf83:dbe8:1f74]) by VE1PR04MB7216.eurprd04.prod.outlook.com
 ([fe80::a9a5:cf83:dbe8:1f74%3]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 08:19:43 +0000
From: wei.fang@oss.nxp.com
To: xiaoning.wang@nxp.com,
	andrew@lunn.ch,
	olteanv@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	richardcochran@gmail.com
Cc: wei.fang@nxp.com,
	imx@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 net-next 2/8] ptp: netc: remove unnecessary pcie_flr() call in probe
Date: Mon, 31 Aug 2026 16:23:29 +0800
Message-Id: <20260831082335.1184605-3-wei.fang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260831082335.1184605-1-wei.fang@oss.nxp.com>
References: <20260831082335.1184605-1-wei.fang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0044.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d6::14) To VE1PR04MB7216.eurprd04.prod.outlook.com
 (2603:10a6:800:1b0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB7216:EE_|AM9PR04MB8440:EE_
X-MS-Office365-Filtering-Correlation-Id: c5e8cd20-373e-4af7-7cc8-08df07389c29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|19092799006|366016|23010399003|376014|18002099003|22082099003|11063799006|56012099006|10067099003|921020;
X-Microsoft-Antispam-Message-Info: SbrZQVZbJR8umH40BOZV+9kWuDYe/q/N5WV2dA7lKjRipg+dv8BRzCkVL+CftfbrC42dAayD6vuUIYiOuUPuizz0ygeZEpNowqGlZCPu6YjO3Qy6Yz9bvvbHWDVXboAB13L1YhG1TdiuryHZBMpnFg/zKF2zhN2k+lJFzbvrrJvaMWTUKmWz0y5kSODvxkwG8Ep7Nue9LDTjt+LnyEsDoGifCDkyum/45RUH8vSZaykGG2iMmXXyljFpDqt2IhB1qBS3yN3hV1K3+uDqQ9kTsF4jli3VLrQL1g+I5vBtsfuJnp9JFqpyTAbC3O3gpv4g1N3mARbWr0lweriYMr1/gFQs++M/1bWbhDI8GHiJV8BLUwzuvMJbTZOoQGrcWQmsNe4K7wjppJwP1pH61XWckKxLXymnnO/MB4YfMSkif/iYv2hGQTuJUlqwAVGSWrH2IQCl5KEegmy87ytf2BCOUxYe624B3VjT4G1g0nEf59IjacsTB0MQe6JeMlJmugjvpJfnBGQq4XNFnQIDr7PoIvm/dWgJ945TqIfEmUzwzM71LOIGTW06X2eGYYojkhA9El6hIRkQOJFfGb7DQyBy146a8LOmD2ZxuMiRANFSNNUwK7KLa9MRKEmPCiV+nc12M4E17Wj3s/S7tbbQYfgQBMmTDK3wCfoJrz4dgQvasMpzwOaqOaZ/9KpweY3SYQ+jHHj/lnK6udNMxLJGbLi+Lw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB7216.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(19092799006)(366016)(23010399003)(376014)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?32jKDQuvHyniG+hSUn2WvdiLvE/66mG54F4qdApj/l3CR1wsxF3OVKkZ6Cq7?=
 =?us-ascii?Q?KE54XA9mzqiymCao4zs9I+RJvITXwBbFIa5CJjxfsE1gLOBkBxzEkj9sB1OW?=
 =?us-ascii?Q?L78+5sOzRWHMC0sMAwuJpbDKWaJXU2UZMV1sQJdMpq5829/05uYk23nIUoYX?=
 =?us-ascii?Q?aEk+M0b62CKX0+L/yrmZsSIHOCqMURoaLTNvz78pnQGbDI7ZBatG/maLRWoR?=
 =?us-ascii?Q?+gXV47zdnqd0yP9CPa4jHKnETksyNf0d8g/3e+nmyTZtXgt/ryaxmKFM6CZp?=
 =?us-ascii?Q?t8BHHXpVAsiewiggKvkI8BlUJThW1zgezK3YZewK6llp3LsGTHeo06EWZm/S?=
 =?us-ascii?Q?D2Tb4GD5YkYQ+KqXzCosNWjOwyyGVKLJpT0B1hWMhH+oT5GwiheruV2h/6fc?=
 =?us-ascii?Q?AlzNgc+3VKPEBDHrilsGHbBBsLrt0vvk8jb75zmhpyo5Mftoj3P+Fv208+0j?=
 =?us-ascii?Q?OPQsNj10MvHiyPGEMmCMEEBOI9WhT4iDWOvMU4sjMzmNvae/EEPAHe0PzRXP?=
 =?us-ascii?Q?r9jMv9UGf2/EE3NNF9G9nKnGwUmWdTiWCK9n3ihooPphJixESJz3h/aWL4Ec?=
 =?us-ascii?Q?XB0pCXCpBDZoLf7yLB46AUWwHHAOojFDGJ1XYTZvUNjxNx36uxveFyGFQE32?=
 =?us-ascii?Q?qxqLRPQ/RdaabO3aD2CRu/iq1Ejx5PR5brYUXzOYBkxHX5u064mI8sORN9o5?=
 =?us-ascii?Q?bqlKO4R1KAykrR7+YPUST0aNTI0Yev0T4k5tr8To4MLgx9eTI1nADHhjfn2/?=
 =?us-ascii?Q?MP7KxOKWdYtdXGU3sqUGTY7ypwbubwlGDbC94k5qikcEFdwgpIIt6gP67aS+?=
 =?us-ascii?Q?TjefNyUa2kSo9MTJQvW8Y4i6B+CUbq3hNbU9Dxlct3+KHwpPTj4nQXneXFTQ?=
 =?us-ascii?Q?nQJL3hib7uplrTn2YBm3s0FDG/n0krXIAbg7OGO5yazVCRVWy/ayrjsvdJUH?=
 =?us-ascii?Q?2JD4EFyC5ehnOfDRfFN/8S3zYC8ehixb+TAfR/K9UpJJU0/8JtX3BokCzKhk?=
 =?us-ascii?Q?qpOieWkvxvGe25Lx2iY2iAruqOlmPaZ28J74Wl+8ORphzxbG8TeYV7CT5aJg?=
 =?us-ascii?Q?TNPxFSe+IwX9r1JaRIgZVSPRZkpswH1j4p2E5mKBhh+Ro9SzEeXH3R3MYsgQ?=
 =?us-ascii?Q?F/WpnTyLiCKrsuKYRMpPGLdXYZvTWX4f2OyrJDK+syMs1whTNxXbrtRbrl6r?=
 =?us-ascii?Q?BNA1tb9ICX+6kA0AZKEk75e3/9JJGZwJNtskXyzhyoc0ONIzo+6MqCHrC5qn?=
 =?us-ascii?Q?G/o7gTpUEUdwj3/uwSEW43HMqCcIu/HVqlJDF8XQ98uZvmr2G48NYIgNK0Y6?=
 =?us-ascii?Q?21F5k6dcaVNb77acnJIXQDqLz8OU27AAVIZs9VQMlZrHuT3i54l36y4nSZj9?=
 =?us-ascii?Q?jUEwOx9Co+ew+cAgMc8NgDyZmZzxV1y6Tl4PfYZYU6EuOED4jM/QD9Gp64W7?=
 =?us-ascii?Q?yLFumn61F87BAPADH7P+nC/VkYvYJI9c2btZM7ttAe1TBjlHqUQW1RU9oa1n?=
 =?us-ascii?Q?1m963REBftWytFJ0GfbjQNZp9kHlNRqpngXWJmAzvWsZ+p/oW9AFrVvUOpxn?=
 =?us-ascii?Q?aAyH54LlbNJIAvqEgQuxaJJ2sBEIXLOCQBm1oQRQZKMIhhEGX8+HSQDQ2gMd?=
 =?us-ascii?Q?1XXDdn1jFnvu1YzakX1IpAQUWCYxwsns1ISOwdRgKp4IdmKZFeGapHhMQMXG?=
 =?us-ascii?Q?gDhLqu6i/4uc1SZqK6U0KRyEIzwOlc+iJj5VsLUrq0z6ohn6Y+7WHGLZvP6I?=
 =?us-ascii?Q?QxVqdYPKuV2rdYKNNRFfe6D33Lh2rlQ6iJVXeg+Yi3LcjfufJNAK?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5e8cd20-373e-4af7-7cc8-08df07389c29
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB7216.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 08:19:43.1969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ehn+kJhagijBsIwMb+EB6sU6WnAHtSXIxwVzSGO4/NAGeGpDujAvae9Hqz0ilwiIndMgSGw1cQs9eBYMbXOvO7CKeBLumdpRXKym1hkBixeHPwcVYMKiA8PowUlTxjHh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8440
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_011948_201499_39BE3128 
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

From: Wei Fang <wei.fang@nxp.com>

According to the NETC reference manual, function level reset is not
applicable to the timer as a supporting function. Remove the pcie_flr()
call from netc_timer_pci_probe() as it has no effect.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 drivers/ptp/ptp_netc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/ptp/ptp_netc.c b/drivers/ptp/ptp_netc.c
index 376b3b0d1a38..aa9be8e2a630 100644
--- a/drivers/ptp/ptp_netc.c
+++ b/drivers/ptp/ptp_netc.c
@@ -777,7 +777,6 @@ static int netc_timer_pci_probe(struct pci_dev *pdev)
 	if (!priv)
 		return -ENOMEM;
 
-	pcie_flr(pdev);
 	err = pci_enable_device_mem(pdev);
 	if (err)
 		return dev_err_probe(dev, err, "Failed to enable device\n");
-- 
2.34.1


