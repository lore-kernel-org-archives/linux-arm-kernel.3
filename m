Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E14C87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 07:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1dcGGwyGuw3NgR+kHGhp3V9sxbVOhA5WImDQO/VYQQE=; b=P4WyTwuDQzTX/+V2xtpr9BwpF/
	jeDS04+fQp5IhGqO/KF/SLTz4VBq7ALlgpqhIOxGLN8dTiYxg750w2SKtdgJf6Sa+ERYe4vW4QeuT
	FPcaE1kXbj6bjdK7M51RPKev6kduFeCp1XJJ2/5DKVYhJ5YCOHTPJyQ7lELQdZiLaN/+QTGwV5gM+
	vpNRsTqp0m9c8ajeqSLZzxC+5sSpsACGV81JaFVEriyq8NaNxsQsAautm0/mO939wnkO1lMFJKwbd
	7vIhk92nSvQ50Gsnns0PbRHQdw2+Mx+5qWPhjOf2QXp8HuteY9mSvgpiqpyTOH1PiWHGK2z12jnIF
	+VLy/RMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugIHN-0000000DrdD-1swk;
	Mon, 28 Jul 2025 07:28:13 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugHsF-0000000Doi9-0YjI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 07:02:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kYzI4l0jdOEqTiwCWyaaxqFloYDAgt4nL1p6PZWG723XupcLL1mPRlF6iC1gr5M2NCnbdJEjALJlh/+vV2i1wp0N4QIu30IObcR/UqBBO9ZgL3o5puxhmz/HtPE689ywxySELu5j5XvDdMfxLXZP1SFUBnjv+/7onozuFOtcsG1JDPsoX2YzzCWXQcZqQPO7GP1iNJMPgkINRTPDJ1XD7EsrSEbH/eeTqj5d0ADW8GhJ90jzHh5UEuIRm63AbphoJVbJOYPk2brCRb648+EQ/RzftRy8qag3CflPttwVbLACQLBLw3Rf1PZEisC/oXsEXi1ASfD0a+bm5ytAkKeIew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1dcGGwyGuw3NgR+kHGhp3V9sxbVOhA5WImDQO/VYQQE=;
 b=Qc2dEZeNU/3KbHtF0EkjloB6ueWUNv4bO38HtuL1SIjDycjDcxHYt+LqkFtXXWr9jT8cIMUKKL8C8j8I4x7E4tNTsoXMJtEqEwY17Hy7rnuaFa3hF/g+amZKm2Ce1U+SG92hMnxUxHpXwAHZpj7EuK+mG0jeQzT0Ruv0G9kIyWHL1M7PKmrHJDz5Hfx82dHiu4J5LuabnpDJli5xYeezXqOO9DTE3jpcPbJcLn9L1i6uxKQQ6wfXTOzNOstvAK7QZRr0ZtdHzIapbkJ+KAAykZx4/KNY3I35wp0nA7v7iYQTu7BHACcYqHXP0nfNRKT9vRtHJTsXRpYtbOVtKpMsuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1dcGGwyGuw3NgR+kHGhp3V9sxbVOhA5WImDQO/VYQQE=;
 b=FHgcfMT+hZUh4FeoGR1N++z2k62Fets1fpjEw0iFQo+0Tc+9z4R+tMjsW1x6i3DJb0Bu2ilapmO9JuB6eWPvcnKBiQiGYD3bIx2yImoc2+Yl0UD1YfAyOBqgD3CLudpt/ihfhPvu7e1+0uaHuCjdR0aCD1VacVFBJxaJXhCQoIprPTMtrvkOTunzLsGHB8NXp0EhUQ2dmpRF2QdmkXLwhp31k2wTMu+WLB9gOTx7bpxNw0kYoHiLRuecrCq5thBOC7zCnSGL+14PKSw10d0vyynlT0SxtKZSG3/e6MwbzHMzGKTdttp2Mjdo+86DC0bcvXQVmLWiohRXIiaG521+Ug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by AS1PR04MB9430.eurprd04.prod.outlook.com (2603:10a6:20b:4da::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 07:01:58 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb%5]) with mapi id 15.20.8964.023; Mon, 28 Jul 2025
 07:01:58 +0000
From: Jacky Bai <ping.bai@nxp.com>
To: sudeep.holla@arm.com,
	cristian.marussi@arm.com,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH] clk: scmi: Add duty cycle ops only when duty cycle is supported
Date: Mon, 28 Jul 2025 15:04:46 +0800
Message-Id: <20250728070446.949095-1-ping.bai@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW2PR16CA0060.namprd16.prod.outlook.com
 (2603:10b6:907:1::37) To AS8PR04MB8642.eurprd04.prod.outlook.com
 (2603:10a6:20b:429::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8642:EE_|AS1PR04MB9430:EE_
X-MS-Office365-Filtering-Correlation-Id: 40e73e9e-2d9a-4cae-d0f0-08ddcda4a4e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|52116014|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?in05eXV1AdQ1GTLRCtNmgPgJEW/4GrX5EVaJphOis8eoa1ZFYLcvqZ107P4m?=
 =?us-ascii?Q?HJhxSL167GdvVhq/2W+EUbNuwu4C6hCbE7c2TSxaUHJBCg7cOU/dQ3UhPU/7?=
 =?us-ascii?Q?rp5Y7x+v7dB1m6nTteMCy9q0VU2DtNcaIuKx9++0tuNLH607ufJCgf3sQHsV?=
 =?us-ascii?Q?1mUV0zAZnCJdFaP8qDgmrBHSG5Lf3m0zrLkQI6rQO1KPsDNlC1M4pudPWgm4?=
 =?us-ascii?Q?BHX9HQ27/tuTUBF5Il0iOL26m+BDPtfsgHs16n+qvy4OYwT81SpDhtFwnraW?=
 =?us-ascii?Q?k3KY7kmBnkrtGIEjg57VBH3FEdGaKnxjTbmyzDXGrtbnD5igC3dy/oioDVEC?=
 =?us-ascii?Q?N9uRtZxJkteWiQQgSL0UnZ39nT5Vh2zLBxV/yVjA/rxMCE6zV4cQGLVBFnzL?=
 =?us-ascii?Q?+nQlyQo2MH5JzNSa2n0tC6FXwZxJ90pvsvKisZBriP0ysol0wSEmpxwXy/y5?=
 =?us-ascii?Q?YCVBIPIHBioQMqat3qRW0p5t7M1PWCQtEcNH5wpNEHMZT5AjRZQjJeW6L9b/?=
 =?us-ascii?Q?jCD2wziAKENwKPnSsWv9abL5o7axIjFfYgFet8BsND3LBXzdVoAf8oJZXWKs?=
 =?us-ascii?Q?muIu6MVStFdKFSgbsPPgcLNKp/FKvU0qIbGjcJZKEOOeVFbRKVgpOwv1VcAI?=
 =?us-ascii?Q?l6e/vYSoOKsqKIBROElArBXjStXGxeiqBMoZvDuE0zfEmD+xvE9Xqy24YDGt?=
 =?us-ascii?Q?ojDyxwPnDwtORTd/Tz2bDUKsQgfkXDPL3UbR3P3iSNtmW6K99sirgGnUfPbh?=
 =?us-ascii?Q?KnpK9HRuRa9pFx9xW+QsdYoicQjTwYtY6aS2zBNkKc/SgRDkUXHS+WSDQRx7?=
 =?us-ascii?Q?/iaaXSnkiUdvA8Uf09XXhP2hzOJptQIQasfzbLdUzc0OlPwLe6nZVEpvdZs8?=
 =?us-ascii?Q?1YYVb2amPfpVr+x/KMcLx+jpZobF4WUxc0hGNUYR0FS8T33omcwNIG1DRVEf?=
 =?us-ascii?Q?5JoB+p4CXNXcou1QbUYA9nBB9oaE2jCu2PubYSZloUK6imjXUiydnkCj26VY?=
 =?us-ascii?Q?E++qDDdtzRMnuZClgQ/Gl3g5VXSQ4YbYx5NWN+b9RNGisivKMU9U/E+mD1Cd?=
 =?us-ascii?Q?PDjGY4Z/6nwChHHH4oOIr/oIO5kVgubR8IL0gpr8yqO6LZeqOpMu2LO2q8xM?=
 =?us-ascii?Q?g6wjdVrTSwSswXmorYGDgEXaCLoI5sgFz1GjFA8C5bsUz1KMxeb8bYq9dmUu?=
 =?us-ascii?Q?bZaUoO4wtHQ91BcVks9XOTQ6XeB8LF6lm0+I7QHmt9WyHtnJLxSxqYNyv0gP?=
 =?us-ascii?Q?kJuZf0fIdTmEBz4cvSQ7cjo1/m7JsydvR3k3TaGJdTwUtSQ+8u0nq/9sNipW?=
 =?us-ascii?Q?e8/cFifuPZJvvWv11goh04KmM9CPaYlUS8KC2Jeu0g/jRtLPu14stn8Ej0tT?=
 =?us-ascii?Q?Pr3qEsi2YVrewn0GM4hP+M2x5hGnFo+6sX4X+mOstKy70XOLo7QIy33hjoZh?=
 =?us-ascii?Q?0Zv+FD6KiI5KQ40YVaM+qmLfKcP99BqmFC3C18vgrOHvUfiqC+U+qQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lMFMTkjYQydjMl/yKANTtEkCdVU7ez9KSox+l4MTunoyWJuzkxuiLX7ImETv?=
 =?us-ascii?Q?WUUzRU7T81HP44QHkFWpMLwnia9llP2EwdxvJAgCU00Z4aXZuQzzTeFxi0LT?=
 =?us-ascii?Q?ofTBveAeRKc+dmeD92XJaE+vn3C+3lV+t7TqSFxFzmH3W9ggxMCulC8Fioev?=
 =?us-ascii?Q?WdyuZy4r3Odcia7rYpzj+5ktiwmqLhVA8apiYxfd1y94qUsqSaJ4fmxJvzJ9?=
 =?us-ascii?Q?Zg8pM4Sy4pApkFZn9SbPxMBYXk8l65fKMeIynXBC8Wor6k5Z10NMkrmbrH+8?=
 =?us-ascii?Q?20Ct4xqbIscXZ3AdvouJkIWi9NYsSh3xEUHh3REdcYjNFYQS0a/qSwfKTVx2?=
 =?us-ascii?Q?2YjxiJuTd38vHzZ//8RHN8/8Eb5zubCIDKB2yGlq4+kqNISnkKC2asiN93WB?=
 =?us-ascii?Q?XEp2loqnlWBBV+XaTMHSh7MnXt/z5tR+uu9/gMhNhlPgcESc6SgKQNinpJXl?=
 =?us-ascii?Q?VLFOZRZ7VCN2v8VuTIMtfYT6a8x6/49fAtaXXdh+UJIWtr9pRRrJbPo0Lte+?=
 =?us-ascii?Q?iaf1lJciC3GLLNmd93hrMAIgmZ4f6blwUWgEKNp9esPIMfde/qvbYI6zUChg?=
 =?us-ascii?Q?wDQTiwF/RjubXpkBOH6JKJomEQeggih44ZHoEkbucBmJsxPtay7ekPGWOjS0?=
 =?us-ascii?Q?JkbfpfHrYJj9LjVXPgfDQoJHPEGKGQCOxlTzThN/FR5YDwKaa/qnSSEBo6E0?=
 =?us-ascii?Q?WULprC9wCL3c8DpJ6Z5uM2T77jVcdCr1wBRQQ9BXzZZapoTmieJCM/VTHRLo?=
 =?us-ascii?Q?g3O+RT9qTOjyUMD/3a0uCJcxx9iRPiNVBKwqLyM53OONU6m3TGDEKpL6ZClf?=
 =?us-ascii?Q?s7v2OaCGGGTQfXavJk7F1P1uBh/hQsqfSNRP3nCjBGUlpAdBgc7j20U47pdQ?=
 =?us-ascii?Q?hMNb/GjWAHPBfvavHCYlsCCeOpFaJMNELRV/8QlHSnteya9eBhyygAqRuThQ?=
 =?us-ascii?Q?Tt/XXEjCjERmF4qrRfBraGbEHTKQyWQY+HLfGStnnAKm5S8/zodg552iNtcg?=
 =?us-ascii?Q?eDBRExk4Y9vkrNrB1KCBBqb/5c7DbU4jcuRjmik2PBdxOZvFQDKoJu4OVzdB?=
 =?us-ascii?Q?yllQB2zyv0ETOh7O6rPwZjUiPoerWLJevZnSxAx0pYcPx/UOiFxiEeD0xpPP?=
 =?us-ascii?Q?05RMB4Dz6bGC5Y4HPkpPEy1qnBQokUuJAOMUdgqfZBi3crXqf9xO5bnUYhws?=
 =?us-ascii?Q?YJCD1LVW3VgBIjMgdmaUimPk+PiBkW2gD5FBu7AwmWN0C1b/aRW5fZyvFWOY?=
 =?us-ascii?Q?TioFd0e10vpLsDuo83Aq5iBzJL1vg9oskr6w2U7FGhhBkT5yLjmgVeqZeBhb?=
 =?us-ascii?Q?qtc42Wtl/p00x26M1FRjIHtc335RW3RgAw4FKnl9yx71Px1kzvu4EihWebeA?=
 =?us-ascii?Q?v5x9QbOCLNmyaybcIJW4EkzcDz1jt0VH1JyGeu3IGacOzw6HUD7XlDtl9DbL?=
 =?us-ascii?Q?SR0e3hfNFYG1FjKjnPABK1c4zoHBCLUmirLJMU2RQaP2fNVsH3u9rB5VWKsv?=
 =?us-ascii?Q?IhHZ5ZaZqAyf5t6t2srn/AMQOXHTKBmLFR2tzLgi8YqR7k5a9uDvDvScroV+?=
 =?us-ascii?Q?ccW8VvRPzTR6Oj/W6mNLtoqKfxM0SeM8nBQM6K5C?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40e73e9e-2d9a-4cae-d0f0-08ddcda4a4e6
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 07:01:58.5538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Is/OWDtgADC0UN6Mo0GUWnhqIxz2z44/1jNxgt/Tf5jDjnKmsEKr8NLjHHmosoW3zz0Js0Ot5bqpkoAvu+v20w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9430
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_000215_195021_14DEEC53 
X-CRM114-Status: GOOD (  11.42  )
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

For some of the SCMI based platforms, the oem extended config may be
supported, but not for duty cycle purpose. Skip the duty cycle ops if
err return when trying to get duty cycle info.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
---
 drivers/clk/clk-scmi.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
index d2408403283f..c2f3ef4e58fe 100644
--- a/drivers/clk/clk-scmi.c
+++ b/drivers/clk/clk-scmi.c
@@ -349,6 +349,8 @@ scmi_clk_ops_select(struct scmi_clk *sclk, bool atomic_capable,
 		    unsigned int atomic_threshold_us,
 		    const struct clk_ops **clk_ops_db, size_t db_size)
 {
+	int ret;
+	u32 val;
 	const struct scmi_clock_info *ci = sclk->info;
 	unsigned int feats_key = 0;
 	const struct clk_ops *ops;
@@ -370,8 +372,13 @@ scmi_clk_ops_select(struct scmi_clk *sclk, bool atomic_capable,
 	if (!ci->parent_ctrl_forbidden)
 		feats_key |= BIT(SCMI_CLK_PARENT_CTRL_SUPPORTED);
 
-	if (ci->extended_config)
-		feats_key |= BIT(SCMI_CLK_DUTY_CYCLE_SUPPORTED);
+	if (ci->extended_config) {
+		ret = scmi_proto_clk_ops->config_oem_get(sclk->ph, sclk->id,
+						 SCMI_CLOCK_CFG_DUTY_CYCLE,
+						 &val, NULL, false);
+		if (!ret)
+			feats_key |= BIT(SCMI_CLK_DUTY_CYCLE_SUPPORTED);
+	}
 
 	if (WARN_ON(feats_key >= db_size))
 		return NULL;
-- 
2.34.1


