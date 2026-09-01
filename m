Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 395B7C624D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 11:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uZMRLx2jnL+NjNb1tkWootG7u1lAvnyAwkpLwwFr6LY=; b=HpgEnYOwO94HadL32JIPTfczxm
	FNu64hUQ6XMK+LivPz566CDck3RbBNQrYFYJ5AKj7XEQAAC4AMuT7JTKxf/60LfIwI3ZxUysveDvX
	CowCVMclX6ygtUcTKpUGPGH2VxY2h4Eg+cC00MDNR6YQ3zqY1dWpgfazRECJsJLt5/ZGx05evQQCN
	BIGo4x2WC2uerUkcfR1cTick0K9U0k7n04VstRgExlbAz1OZR21c7yVGv9wCLIeM0rsNge5dOER0y
	C/F7v/Ix6dNUn0HJV+RwmSnNFMNa+wmLH5X5c+wmSxeJJpmXNMZKQmf+TPDSPo/vgDqUQls+TjJ/Q
	0BFbUB+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Mz9-0000000BjQ3-34Zh;
	Tue, 01 Sep 2026 11:49:03 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Mz8-0000000BjMv-03BH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 11:49:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d0GSApgRNI9GpKn7n5/lTk0r1oOtmiG2bRXvaqh9adwZEB+EpRmPPnuTZY8cetyW7RQYCoTprxKZOo6WJyJUgf8nmNpqLodzKi1GgZgT2kfnbefMVvaNvwRyjUwImW4Zwy1YjBCRJFNd8FeSNa0rrrWmIQ7uwE3AGu3wnKi4BxAvY5mJBKRwNo5Va2AUF2WckgtdaGUhWH2VCOOWmSpYjQMbIHz4R+u4iSw66eYmLKTpiBJ7HO91MvhF8ab+xL7sHa9gSKfzikyQpecYcUFmVye7AqDjYBt5ZNNAXJzMlN5TL/7NX8GAW4lIyyXHJeiKSV9yFVEZUB6B9USiS+lv2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uZMRLx2jnL+NjNb1tkWootG7u1lAvnyAwkpLwwFr6LY=;
 b=D/w0z4foMKRNziCjMIr14sNYg7dsIHekyf+ZC90rF40UcHd2Qzr/+r0GsLginRIbW569WHrs3iw/QKEat8RVrFVnXDJd/lZ9cyxAXHzDF/uJPEq5QwTy6H0NSyfRXsnDoQ+1PV99usyDWfZ6BJFyAn2w688lymgHqkV6gH2GhtsZB7z+lw0k7fd6TgJ1fb0zidBNvOH/eTwml30tFhnILvzKrLrcxbmU0nQoynIAFAFIdbyLavdBZM5uGQtUAR0pYeUvdEbAxfMDaHs77xI6nB93f+5n1iJGIi0mjQ9cAX9EwLKk3O2GRJ9KgNvVQWQg8Pl5xjgP3WkVftmX/m5apA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uZMRLx2jnL+NjNb1tkWootG7u1lAvnyAwkpLwwFr6LY=;
 b=Ch/lMrpT/1KVtv638Zw5ln6s77vPmcb/j6QC7UqwDJqEKtqXTlr3qpX0H4BnJnotPxZOblwSgUnhnG2s6JW4nPuADUtQEOEB4fzwMPrWr00m7zhAfh2aijTMyf8g9ehiZSmOz/L8qWzJNA7q/YgWZ+tX2BODTKqHRmjEPzJYawbgViRbbwzBUuRlawuNPrrs2DqnNI1iUtZAff9Znxrb06BBQOnyyBFSiXFinu/l9/HhXIdOBo6UX578q4nhonFzCM18du54oBVkJvx9yzd3p8bvyVQJbRcG1LH7XZMdb7CEsWF5jhvQ4I+4BlbRBpESeOmdYQlRz7JwhOrJHjD/4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM0PR04MB5858.eurprd04.prod.outlook.com (2603:10a6:208:132::23)
 by DU4PR04MB10717.eurprd04.prod.outlook.com (2603:10a6:10:584::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Tue, 1 Sep
 2026 11:48:53 +0000
Received: from AM0PR04MB5858.eurprd04.prod.outlook.com
 ([fe80::bdf4:c9d1:4e3f:68c6]) by AM0PR04MB5858.eurprd04.prod.outlook.com
 ([fe80::bdf4:c9d1:4e3f:68c6%3]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 11:48:53 +0000
From: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Cc: linux-can@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	s32@nxp.com,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Subject: [PATCH v4 2/3] can: at91_can: fix rx-offload cleanup on unbind and probe errors
Date: Tue,  1 Sep 2026 13:48:47 +0200
Message-ID: <20260901114848.500591-3-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901114848.500591-1-ciprianmarian.costea@oss.nxp.com>
References: <20260901114848.500591-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0135.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::19) To AM0PR04MB5858.eurprd04.prod.outlook.com
 (2603:10a6:208:132::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB5858:EE_|DU4PR04MB10717:EE_
X-MS-Office365-Filtering-Correlation-Id: f8e2a212-a47c-43db-05dd-08df081eff64
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|23010399003|376014|7416014|6133799003|22082099003|18002099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: Vn2hbWSNfaL6t2Z6cZK6BCh2j2iaRJkM5JOeLY13Vqo7hKubxCpXEcRMKjRLxTCBD+eFp4WZWKM5N94zSYnEttMT7xPAINKK4yvsShQqjcG3rZF7TGiW6pj1imENKHvyYpKcnPEaaiQlOylO0YJ1If210XGq1w+2cxfJYwL3VpCj6j5Xk7Dhi7W7NdXlKAewE/+4OfUb1lOX1K4ugR7bCFck2TzyB7ydTqDWMwOqJsCLrzLUMWMj9tJvCas2Y5NJh9SVuvxCr06nCYeMmavli/Btwdc98nwm2Rw7PTHpQl1QKECVWp+xI8XfT+ZLNKQr/ZL152ZGpJxaMS3nwIrh2a1+pH6E5/npqm8qKZluA/ST3Sk9h1nzIUDZo5gvlBRJeYQ1ROZA2gk05vTBew193soXRVgZe8tAPJkDCUW6DJ451ZCDE6qyRHD//2OZZtfzGoG5FYD44wT5lxwi5eQlXymlbVMFLXpkGGmDwQNTBk6V5oFD3YBAW6WBkq8vYAuOCF/V1mCGLm9O+fFesZD6aAQHA4sVN1I9+++7zJvAQnwImAsPCE6vyDIivZ1NNe4KhUpmRnXJNh7yVEGgUnaulPP4ImXmMYbnOHV8bn4IEgjOlJSQrWOHu11OxT3UeINSVzYexZi3leCv2Me2LLx0szPxIW36CId8g6NLGLyaB5Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5858.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(23010399003)(376014)(7416014)(6133799003)(22082099003)(18002099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODhFcVphSi8zTVBET1NFb2lrTnRONVN4WEpyZUpLM25XRUwzcTVrVk9kSTVN?=
 =?utf-8?B?MlowZjVJbnpvVEthTXkyaUJaV25jREFGTXFmK3hMa09jS011THNSVVJiRjFG?=
 =?utf-8?B?L0Myd1VYYXJzaFNtUGFEQnUxbkhGd2xLektaZ3k0VVVMeklkeE83SGpJNzAr?=
 =?utf-8?B?UGxqcEZQYzFyaXdDRnRoMDB0emlxOXd2MDJFcmpZdVJXZHZyczJXS0o2QURG?=
 =?utf-8?B?R0R3dkpOT1pLZkt4cWM5dFVxNE5yR3dLdERVeWpPZ1B4dGNick1LNGZROE1j?=
 =?utf-8?B?MDZSd3J2VWN2aVJUVCtiRHBta2owbEFQOFJzMUpSL0lmQTdLbHdxNkxXUWNt?=
 =?utf-8?B?L01ZaHdKZDd3a2l1NWg3dXN3cDJOVWdKZTNCRHRRSmdmbGNudUpuSFdJMVBs?=
 =?utf-8?B?R2FFc2tVYWlYQW9iMXo2TGxKaGFwMmJYMm5pYTRpa1FGbVFkTnlqNkhmNXRT?=
 =?utf-8?B?dmlJeXR5UkQ4RkZPLzdNZWRzY0dUVFI5VkF1NEtlQ1UwRVNaM1BhSHNQVXBw?=
 =?utf-8?B?aEVzMmhocXVwVUpFM3ZmM1E3bnltRjd3d3NhYjJDWnd2SVViWHo2T1dXZ1hZ?=
 =?utf-8?B?WnlFMm1GRXBWT3VxRkZqa0Z4WmRlYUVtZCs2T2tXVlRnanhOSWVvM0RLVVNL?=
 =?utf-8?B?TzlNMVQ1YjhSYTBUa0t2UW9tNzBqK3Vpcm9PNWFwbG11c0Z6eWU2a0l0cjhq?=
 =?utf-8?B?V3liQXJBckllK3duaDdDQy9qNUswZG9VMTBJSXZ5ZDFOOWdBZWFhNWkvSFhG?=
 =?utf-8?B?QWpmb2UzaGxIYk1WUHZYeFlLMDl2L3kwUGZRZ1d4UlV4UkFZVzJCcXUwWjk0?=
 =?utf-8?B?Z1NoNmhtVXBFT0h5TWRFWU5UVDAwS3RzeWF5UWNJZk5Ka2F3N1RJZUg5YUhs?=
 =?utf-8?B?dGpYOWVXelhrMkt2VnpFbnpFb0YvUGRZaHUwc2ZrV1Q4bnVTOTlpQkVkakFZ?=
 =?utf-8?B?Rkttd1dXS1BxRStnT2xqQmFpdWIySUVUWlF5U0VGMVBBWFRvMTVIZ0xPWGVK?=
 =?utf-8?B?TXZrZjRaWVFPTk1MVURWQkxZakJ6MnZId1pjT0dxeENPd3VUdi9vWGFDNGpZ?=
 =?utf-8?B?TzB4U1o4YVNCbGxHbHZmUVUrTFVaRjVpd0Y4d1ZVZFdLd1krTVBBUHFKQ2s1?=
 =?utf-8?B?NUFsQUkrYTdVVXpEMmxsamJ5UHI5SDNOZjI1UVlTU0E1dGVLQm9yTWZ3NEp3?=
 =?utf-8?B?RVdEYmo4bisvK1kzVDQxenBUNk1OaW5sSlpBMkRxcGVxUW5pWUw0V0RmbEVL?=
 =?utf-8?B?UmswQ05QY3RWbkVNcmhudkVVbko0dDE4Ry92aDBnWmtBUExrNitxeHJveTFj?=
 =?utf-8?B?UjV5RWFVYW5VQk1Mb2toQ1RQUGVrclpOdkNGR08rSVZ3RTRyTnJKbmxUTmxl?=
 =?utf-8?B?amVOeEE2TzdKT2FvdEtZb0w3SHBJRnI2THVYSDJXR3gzYmdSN2xaVlZZSFo4?=
 =?utf-8?B?bVYwaTg4a0NsR3BqVFpuM04rQTFiMU5zQ0xudDNxRzU1aVgxZWNNNHI0WGdi?=
 =?utf-8?B?dDBPWUxuSlhsdDE4amtkbUg0Qzh1ZkpkeGZWRWZVWmttbzVsRVJWWXlsSG9O?=
 =?utf-8?B?MGJFd3Q3OTNNY3pVL0pGYjFVeklveWFEZnpDZzdaUzFZTGhDQW5waFFIa3Va?=
 =?utf-8?B?SjF2MkEvZmtFL3Arc2djZmY5YWdSeTB1cTAxUldnV3hlK3lDVnRaQXI2YkJh?=
 =?utf-8?B?dUpQTysra0EranQ2VEViYWtlbmdYYVJvbWp3SHU3YzhwaUU5NEhMa2dTS0xD?=
 =?utf-8?B?MzB2V0xnZjIvelJVd29hZUJjMVdtcTFXQkI2alN2T050c2cxQUIrL2MyMko3?=
 =?utf-8?B?OTZOSTVFNHY2N0ltbitIZHBIaXp5VUlJcnpsbURXUGRqRk85cmlUeWd0RXo4?=
 =?utf-8?B?cUZGKzlLY3NoR1lZMWFYYmRUV2JuVEdsNFpLU29KTEJ5c2xXWTFXN1E1M2lt?=
 =?utf-8?B?S21LV2NjUzY1SGdUVGlTYzlxUHRTRGdmcXZRZGtrUk1hbjNCRHRQU2ZhckNl?=
 =?utf-8?B?NFY4cGdzVDBMUUtSU1Y2MmsybDI3Wmd5Y09QWmlFMUNsbFU4MW9TMU41OS93?=
 =?utf-8?B?T1M5Vmw3VzhwaURocllqdnpONjgyWTlYVWZqQ2xvOG5VOE52U0w3KzVIUzlq?=
 =?utf-8?B?QTRHaUdkc3pJYzRoUjlpcStqc2l1UjNBMUpoL1I1VW5BZ1VOM3FHKzFTZXgx?=
 =?utf-8?B?OG9DVzJOd3FaQ1I0eE5aMWFLQlZoUFJCY3lmeTFhejIxaTU0eDRrY2NGMCt0?=
 =?utf-8?B?MDByb2h1R0ZyWGg0N1U3Tmh1K3U0NjZGY2p6d082Zng0a0l0SDJkc3dMN3U0?=
 =?utf-8?B?Z3JUektDbDZYT1Mvc3ZQbHlVc2Flcm5HQm5NeWcrRDR3VHNFYjIrenNjeVFY?=
 =?utf-8?Q?Xcw0j5RqdzOZABhE=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8e2a212-a47c-43db-05dd-08df081eff64
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5858.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 11:48:53.8502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xMwgyArIhlgVAHxmRa9a4mvwznvubaHHHEog+WTnfQIfsqwkUA084py0vmQblyL5/6URHluZFh5awuHhU1fnauGjhvnMMk9chDXZA/GlcR0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10717
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_044902_047115_C6B4A5DA 
X-CRM114-Status: GOOD (  17.03  )
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

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Making can_rx_offload's skb_irq_queue per-CPU (previous patch) adds an
alloc_percpu() to can_rx_offload_add_*(). That allocation has to be freed
on teardown and can fail with -ENOMEM, which exposes three problems in
at91_can:

- at91_can_remove() does not call can_rx_offload_del(), so the NAPI
  instance and the per-CPU queues are leaked on unbind and module removal.

- The probe error path after a failed register_candev() jumps straight to
  free_candev() without can_rx_offload_del() and leaks the same objects.

- The return value of can_rx_offload_add_timestamp() is ignored. It can now
  return -ENOMEM with offload->skb_irq_queue == NULL, probe still succeeds,
  and the first RX interrupt dereferences that NULL pointer in
  can_rx_offload_irq_offload_timestamp() via get_cpu_ptr().

Check the return value and call can_rx_offload_del() from at91_can_remove()
and from a new error label taken when register_candev() fails.

Fixes: 137f59d5dab4 ("can: at91_can: switch to rx-offload implementation")
Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 drivers/net/can/at91_can.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/net/can/at91_can.c b/drivers/net/can/at91_can.c
index 58da323f14d7..3f6c5bb373d3 100644
--- a/drivers/net/can/at91_can.c
+++ b/drivers/net/can/at91_can.c
@@ -1123,7 +1123,9 @@ static int at91_can_probe(struct platform_device *pdev)
 	priv->offload.mb_first = devtype_data->rx_first;
 	priv->offload.mb_last = devtype_data->rx_last;
 
-	can_rx_offload_add_timestamp(dev, &priv->offload);
+	err = can_rx_offload_add_timestamp(dev, &priv->offload);
+	if (err)
+		goto exit_free;
 
 	if (transceiver)
 		priv->can.bitrate_max = transceiver->attrs.max_link_rate;
@@ -1137,7 +1139,7 @@ static int at91_can_probe(struct platform_device *pdev)
 	err = register_candev(dev);
 	if (err) {
 		dev_err(&pdev->dev, "registering netdev failed\n");
-		goto exit_free;
+		goto exit_offload;
 	}
 
 	dev_info(&pdev->dev, "device registered (reg_base=%p, irq=%d)\n",
@@ -1145,6 +1147,8 @@ static int at91_can_probe(struct platform_device *pdev)
 
 	return 0;
 
+ exit_offload:
+	can_rx_offload_del(&priv->offload);
  exit_free:
 	free_candev(dev);
  exit_iounmap:
@@ -1165,6 +1169,8 @@ static void at91_can_remove(struct platform_device *pdev)
 
 	unregister_netdev(dev);
 
+	can_rx_offload_del(&priv->offload);
+
 	iounmap(priv->reg_base);
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-- 
2.43.0


