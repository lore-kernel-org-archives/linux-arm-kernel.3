Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA73C36008
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 07:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/zUFhkjN07lKFNy4wSSfsWq7x4iV6wJvKuoBP4MGc58=; b=QbUT4eI1MncFvzA24yuK3TQpSj
	U45eqHmYexVvXr/FPOiBxSNVwKGGCbyCm/pKYDj/a1Y/1mOiYkYiRvbc5wskzaq0lRvgPmfZCMA2L
	0XjMVs8o7sPubk/joiofOor5K5CHfsgvkAf+3xj2NPpVku2rW06tYSmhRKU3pdLSAk0TfzVwulknN
	20HA9RsO2SSWcDg2m63IWa3a1aukkRlP8PVpK5Nme0VozezrfYT0J+HNF9g51Ed28u8k8DEjXSdnc
	isBzRdAJFXhxcWezelQ+10prWMf1FHszMyNKfX9kUhkNVpbvtWyVkyS4XOWbWOxCYk/EC9Z39h/fB
	ZfwOSxCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzWDp-00000002D9D-3QWU;
	Tue, 01 Apr 2025 07:39:45 +0000
Received: from mail-vi1eur03on20622.outbound.protection.outlook.com ([2a01:111:f403:260c::622] helo=EUR03-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzWAK-00000002Cpe-1MhY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 07:36:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RxTvaNZhTvfSPhcBJf9dbXxaH1paZUCEVz+/sV1ZE+uTPUFdwiF+dn4Y6v+0Ckk29m+2LgmfYOlK0bUHrVXPjwucRXgAqMyCiaTtNSanW8SSk665PqdCC/B/FTGdOkEVy/dasN5ejcjIm6Q/onLU7ftMYBUhBq+uedM6XXG6BVd/Esndhd0kJZ4xCZgxZXYvMI5FUwJV8vLABjPAztjckLGqzdj0UawSoHmw1pSyhlAt/8LOlt3Ou5n6qTXUn8wusIg1CvLLG3claktbfct5c4wFUAjBGenXDqW23tVnj4vwu4+e1T/7zXzmJl7+wRsqMeNBCahmKMGfBUHFdhxq7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/zUFhkjN07lKFNy4wSSfsWq7x4iV6wJvKuoBP4MGc58=;
 b=vHIo7uNS8LapY1NOCAM0XqXWi7pA2UPSO+aG7RhVFmLw2k0CXHeYBCmnyrXaVqWNBRGv6LuIIlg4hS4+WhiBHfmGGOh3xI5ytgktB7LZHdgRJwH7UMxdyukI3j+7gP3+Phxw7xZ5+z1rb8iKmH+ZJocijWL8bvve+KuBdDNltV7/QuLqF0kFxhjHaFyPbJH32VCa/w3opuLD2x7vvHC6/oBYhhCgfrsnHjJ5NLHX6D7A/mNK5D0DCJegGdzTCaUXzv7mDnbthMraTjn34mTxIECFczyjcO8EvRrV2vN4lwsklvYeY9t3RAM/Gs1Sk5FarGSgwv91Fceiy8CD5UqamQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/zUFhkjN07lKFNy4wSSfsWq7x4iV6wJvKuoBP4MGc58=;
 b=YC30kJDmCbQSt06WhlJ1L9slZDrudsuJB5vi0oKdctdCVzo5tZ6R9412QfXbHl8ww7lEqO4aSvCU4ZpnSfvbwc0BAwybD3/7shJvWZ/1WywW15Lk0qE6LcWmLglDDimUqSVCvhuVb/0NYdz7f3v7o4yYcP4Y60f1raOAYoiM17kQOro1GZZF8WTOuSZH4w5pIU+mru1VUCb/IMH6agLjDsw73HfGWIBph5pi993R3y1LH4E/DiCFD/ey8E66YjO5/2I0TkzTp2Z7Dm/IyEC9PIHuDNcJeGDXJlu2+C091zOxAX9/inMuA4NM29lfHsfnvWUZvyIOpiBt15abcKfo/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by PAXPR04MB8893.eurprd04.prod.outlook.com (2603:10a6:102:20c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.52; Tue, 1 Apr
 2025 07:36:04 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8534.052; Tue, 1 Apr 2025
 07:36:04 +0000
From: ming.qian@oss.nxp.com
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl
Cc: nicolas@ndufresne.ca,
	sebastian.fricke@collabora.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 2/2] media: amphion: Add a frame flush mode for decoder
Date: Tue,  1 Apr 2025 15:35:25 +0800
Message-ID: <20250401073527.1626-2-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
In-Reply-To: <20250401073527.1626-1-ming.qian@oss.nxp.com>
References: <20250401073527.1626-1-ming.qian@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0143.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::23) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|PAXPR04MB8893:EE_
X-MS-Office365-Filtering-Correlation-Id: d4111d9a-db13-43f9-a380-08dd70efdb88
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RGRWc35WjRckGxvrqIkVQQo+FRpECqSyOEYpBqYlQQ+7T6hQdE/ItLEIcfSA?=
 =?us-ascii?Q?xJa8h4HnDCWA8gnwIYbxyRZ9sxOYvUvlM+J0phtwiNSQ48zYg6p2+pgDPF3N?=
 =?us-ascii?Q?A0KQRvlRpOArd97Y82FAyXpgbC9Ht7lin716sxN6pVffIwdPiR7ecsOcX/tH?=
 =?us-ascii?Q?1X2T6Ky26S7QOYjyOLGHaEACfvy6u6mWS19dH9qNDMQ24O1Z46ilt6+jRwjq?=
 =?us-ascii?Q?vLvCtJ8g4NVlDqWnQ68afJlB33l07hnl8pXSkLu5jXl2bvsSjxINZildE/+S?=
 =?us-ascii?Q?bT2m8ACejYmafajTDQMYPGfysd2qnsi6tm7CipU6buTy3GDt1hs437jdZ6I0?=
 =?us-ascii?Q?u27skKPYxsp7T7UogZ1DlDX/4PqvtIy/12Dm+cxmccEotgETvVUEVKp0AGhp?=
 =?us-ascii?Q?QLJ6xFjFNd56/r+xTpdQuphvmEzQaA9jDrVstfWv9UT8rJOHuaNY9fAlUP9j?=
 =?us-ascii?Q?DGanei5yqeaZH4OdL5jes2CAiPN9S6cR2qPW/pofC810pu/q1kMAg/OZo1WN?=
 =?us-ascii?Q?tX9ukFJfzOpcecZtnsh3toODJKvnF91lqK3OLgKgV0wsF1I7JmDLsaYVu60a?=
 =?us-ascii?Q?B1ApWxIKfwEpuiQv9mj6jLDbguL975wfXmUfzRYcsPAK/whwB6Y7hzgrnL4z?=
 =?us-ascii?Q?Y8ytAVGeybSAQY0lEBoH7xbLvJg2WG8kVi7tP088rDfA0DK6pha/494jNUW2?=
 =?us-ascii?Q?R9QhxkWPnhsML4A/pvBNBwgkyBN/u3t22zY9kjxd9tsZu+9kbCZIWEN9aYSW?=
 =?us-ascii?Q?oaBE7XBeR2c6zg3H7A1u/yCmMGY7OSQjzBPkuLMk9+9UINNICyEfq+ObMscp?=
 =?us-ascii?Q?l2hfppFbf568PqH6MCjUfA7mNB+G/9UN5rTYgCLIrhrgiWf9EZ/5yBJtXXzR?=
 =?us-ascii?Q?MA4+viQ7AD+CP/VZ98SyOjKpH6FH6VlUVLE9dYtOCO153Y8+6XfQtwtBSfLT?=
 =?us-ascii?Q?x0GFWsMV1tNnXEQ34QPX4BI41qsyqPcrinrdXMPEKgFgc0mjImK8M6f8BYJ5?=
 =?us-ascii?Q?KT/Xlmx7ZRsBvkRtplwO5d+IOfRwPXyCOKUhQnyk+MtknFRX9oxYV4x5AXj1?=
 =?us-ascii?Q?dG0+Ob6d99sxWnd+2R1VqhbrPOk/EZA/qJvssmjtDGVjjWQuDT0+5f2eRRZ7?=
 =?us-ascii?Q?gb7Dq2G9r8Fnt7qlgCpm0qSL6Dp8khLk6JjBLQ0RMTm7/0SUsd2XV03ae5hC?=
 =?us-ascii?Q?b0fDBG9rTWaXvfreR2M+FrE72FIv0f26J1s7PvI1jMxsm2+6qiTLc7++2e2/?=
 =?us-ascii?Q?Gb0MxxS34yl6BP2QBUZNb0xLuU+p/RJGx5Wh2kFkFIYHmUvH5HVm7lGfrQAg?=
 =?us-ascii?Q?FulqaR3IgUUo0pfAOzUsPUpe6gvFF/rWgMA4/+pf6+kPrldL3G9Twm96FaMa?=
 =?us-ascii?Q?qtKB8hfODj06SCka2cZmCTacjIznrtu/2BqcTuK+sq0viL3XTEBag6CR1jZP?=
 =?us-ascii?Q?z4erCkEjBSuTbaWSNpVBTK4i+zSZHIxP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OyiEqJWdg7XDwobuDJ6iI03xl4Zwg70lbv/lBlcnJlzrcqLbBRS0fUEjnDwi?=
 =?us-ascii?Q?HaYJWshuW8NJPrCHBLYDEUAjkXqglVGGovmD1pcPNGUQUv/O25lKyuSZGo+P?=
 =?us-ascii?Q?OyjwnXRZ12tT3FtWGuw67diqBgEjYGMREHzJm7BqtFzCBD4OZp/jYSGnL15V?=
 =?us-ascii?Q?Tf2pG8eHHOiCPseNTZbMMAylt9ZvOOs/a7s9zqYv/2U/3kco9iBiSj3E3YeZ?=
 =?us-ascii?Q?zlfEFxrZFLK7e8JVJEycwMF5gQNGqmUrRFtgPA5vi7LVl0R49P9p7DjC1WnC?=
 =?us-ascii?Q?dKsEna9DkWCPFdB1KR+27MCm4P7P4HfGhT2TeMgmJKUv9Xn7yxJ+BPFPnRRW?=
 =?us-ascii?Q?nIdLTh5aGmWxXEIovC7h2mKTXzVyyBfEjd6Whkpv/Fj67zkiGUUCD6lAwgfX?=
 =?us-ascii?Q?AHcXvTggywXWaoTo3l/9J3lopWsAoyo7V5cC7LIWpXAJAEIDqHA0Zr6UsNHX?=
 =?us-ascii?Q?SYiWpNQcPGxONhTcnMbymedsfbSeyOeamQPN2c+qkQhIvatXgNDYa+Qxjt5W?=
 =?us-ascii?Q?LFXj0m+flp0LEG56Grw0AuLTkNiNJZzoUrsWu//RydjpsEcqkVmefyAC75UT?=
 =?us-ascii?Q?I52CqRhC/pLNn84Y95aEzB3hXvP4pe3D8wMxrEtRTPTBJTRwF5Fidg+Ih0eO?=
 =?us-ascii?Q?U58Aiyez/uCa3NsGeaT142gwTdODr5lO1t6wXeaxRrIwSH8ZAGDyESn8wdeX?=
 =?us-ascii?Q?cI0XbXPHNfCKoRgCVaBMaGrv2EG5IiQuSLPIG2VU/WWtQPlwo2sQ/LnvqCtF?=
 =?us-ascii?Q?OSM5k5DuzI839EKjpDAVOhhGDcQ5WH0vLLvk9wi8kHT5ILA5Km4OPfQAmV4W?=
 =?us-ascii?Q?NUwtTuB29YwspkaeZk7gffLCaLv7ouacZog98qmkEM9Aj6HEs06Ipyd4ZaIJ?=
 =?us-ascii?Q?vfTruIl+A8Rn6IxFo6llerHCRUHzP1dfJ2i+kIDv1m6duWHppq3T4udWle95?=
 =?us-ascii?Q?rKobiR3fHxQ143/nChOAZo/Onum1bl1X1Mki5Fz0DN+b18hdTYTCGMzajSa1?=
 =?us-ascii?Q?/zHPkbz+BBvHdXoryZV7CpieWqcIvsdlvl7mKfWDzt1ZLun2nYM8S+pakSYl?=
 =?us-ascii?Q?OFS3EHY6/ExzWK+rKqFqmZJ5HIcX2zMgfETRaRE20OxfnsZOQAf/cIEYdVfC?=
 =?us-ascii?Q?UQVfurAHe50gyggbddNGEdBh3cLs8Dx1B+aIftiIi+4g/yRW1GaHaLhzqrLL?=
 =?us-ascii?Q?/aHoKRnm8KxjwwsH7z/m2Lx1UJ+zFnSMnplCQhtPhnKv5l33zIB/zJGnUAqh?=
 =?us-ascii?Q?r/d7ygv4x3P3duZy6Hbn1MQgehfNkqkhL7R7Qb5sgPqoGHy6kxURVGP0ObNB?=
 =?us-ascii?Q?P5rHAGfC+EuDJVDaYkJi+5zQiL5mEnxDpN8BbHPgFSJ5a130zly0eQFjoezU?=
 =?us-ascii?Q?x9itlkzcnPXzBNQ5be5wWiIkinqA6mxpoXS12b5CJj4zNIt3FYealzrfbhp8?=
 =?us-ascii?Q?Ouj5jgzW1VlCpAhvboBEBkOiQ5VkrlrsoF3gBUHZA12ZN5uCjQjnqzCkbcBg?=
 =?us-ascii?Q?psHgn2/CXB2xbndAu/8YuMqDQAAVA01PGgwqV9LycWP7WCjWmAetuvq1A6a4?=
 =?us-ascii?Q?T2pvNlrqUV9LGqG5N4kCoJH5T2tjc9CicxpbmwHR?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4111d9a-db13-43f9-a380-08dd70efdb88
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 07:36:04.1878
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mV7Di2xPxyDIzncScAH+nz5G+WufDw6BOSlgSkCY2mmXiunZ3xplkIGqgtzboTVVCwatFr+CSTegKwbCXEiT7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8893
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_003608_367889_77BEC39A 
X-CRM114-Status: GOOD (  15.64  )
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

From: Ming Qian <ming.qian@oss.nxp.com>

By default the amphion decoder will pre-parse 3 frames before starting
to decode the first frame. Alternatively, a block of flush padding data
can be appended to the frame, which will ensure that the decoder can
start decoding immediately after parsing the flush padding data, thus
potentially reducing decoding latency.

This mode was previously only enabled, when the display delay was set to
0. Allow the user to manually toggle the use of that mode via a module
parameter called low_latency, which enables the mode without
changing the display order.

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
v4
- Improve the comment expressing
v3
- Improve commit message as recommended
- Add some comments to avoid code looks cryptic

 drivers/media/platform/amphion/vpu_malone.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/amphion/vpu_malone.c b/drivers/media/platform/amphion/vpu_malone.c
index b6e4996c2d91..89af89087e2b 100644
--- a/drivers/media/platform/amphion/vpu_malone.c
+++ b/drivers/media/platform/amphion/vpu_malone.c
@@ -25,6 +25,10 @@
 #include "vpu_imx8q.h"
 #include "vpu_malone.h"
 
+static bool low_latency;
+module_param(low_latency, bool, 0644);
+MODULE_PARM_DESC(low_latency, "Set low latency frame flush mode: 0 (disable) or 1 (enable)");
+
 #define CMD_SIZE			25600
 #define MSG_SIZE			25600
 #define CODEC_SIZE			0x1000
@@ -1581,7 +1585,15 @@ static int vpu_malone_input_frame_data(struct vpu_malone_str_buffer __iomem *str
 
 	vpu_malone_update_wptr(str_buf, wptr);
 
-	if (disp_imm && !vpu_vb_is_codecconfig(vbuf)) {
+	/*
+	 * Enable the low latency flush mode if display delay is set to 0
+	 * or the low latency frame flush mode if it is set to 1.
+	 * The low latency flush mode requires some padding data to be appended to each frame,
+	 * but there must not be any padding data between the sequence header and the frame.
+	 * This module is currently only supported for the H264 and HEVC formats,
+	 * for other formats, vpu_malone_add_scode() will return 0.
+	 */
+	if ((disp_imm || low_latency) && !vpu_vb_is_codecconfig(vbuf)) {
 		ret = vpu_malone_add_scode(inst->core->iface,
 					   inst->id,
 					   &inst->stream_buffer,
-- 
2.43.0-rc1


