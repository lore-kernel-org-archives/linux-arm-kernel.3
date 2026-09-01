Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 441A0C624CF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 11:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q078mk27nv/IA37Knfv+c2HeolLnRl5HAWrW7WTYj0E=; b=j+HePmYxFzLFM8tuqfceHhOtrn
	OP7YRouB5B+jtyPPrMp5gnXTIwtqKksBIhb5kD0J0Fe0oDS5bnm7oaVXT7TdGgRggmBHuVb+4+Uic
	fCCNECDdPFg0zAEQbINpMtFHyPC4OeHPD6WoQfyOn9udPQPPL45uh0doAxuBPNXn61jT2eQwmLzw9
	lgQTU8QW/T4XL6prOWbqeTZjlw6vQPt79RhABH82jhZmuVnDVWzBWlQdsPRousXCRL2LahR8Y97R3
	bQcNRKpAHbZkRA5k0u5iTLUemfaL9x+0QJs/kokWOfKfJSbSCyoKTymdcKLGPovcsyStZPkuzdUMN
	K50Qrthw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1MzB-0000000BjRj-3iAk;
	Tue, 01 Sep 2026 11:49:05 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Mz9-0000000BjMv-1zoF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 11:49:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YC/SDxuXiSnwPR961S82MDSdrsA/yvbGFpYDRo/UReLr1F2crlrf8Zks5oU74T/WBXPj0KJ6C0zyHHCQJNeeHHCAYkzAjHx/MPKAJ1BNikPuyWaV/4HmwCoLVbnFn7ZSm4Dz3XP8ZGwBomlOXE/puPf9yjSEVFJQhXyfHfPN7NxLrh2RCiKAEJKLCO5zpdQ4WEGCrPu84QLbG6ok7bd/vmd/iUAtp/Sa5mRhYNIn5aWXItLUtqLoqlDQyzVP5JAqpDmqFlIeGMqp98CG+ReBxvVgTrbZTIQ3WpZJUG6ZbYhpmNl6pn+RCVdca7UhG448+b9jZp1jPwObtKtiWkssUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q078mk27nv/IA37Knfv+c2HeolLnRl5HAWrW7WTYj0E=;
 b=LjzJGPQDrUfxaaOLKKEV1V4gO+Tp5UEbnVMrGAFQXlHJux0VTFAvVi0vQ2F1hgSqcv9SuNJdcs9+7CPLggFkJ5xUB4XWeHxWqssA5xphkNF3qXYZw++rkzFhhy019n+vqFuUO0H/rm/r1JJuAHAI3cRfyBzzPJlU//VZehpwPAo9I9dhbhhqXasvNf072tPA/SheW6EmqF1l/v4wl5gyb/h2vtwkSWyHkyrCaeq/wz6LD/SmvWPY0aeXilFbiNRIzbDS8/NT3ulpBriNSM/I+Q8IC3zWQMk3Cuncmcmb+dHA4Onv5TWQhpYGPm6Vk7RlsN2IKwnLEhoiL5G0WPe3OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q078mk27nv/IA37Knfv+c2HeolLnRl5HAWrW7WTYj0E=;
 b=oe3Cu0HCvYMuVzjolkQOL50RwR7g6AJgqqFvo6IbKgbyZhIXdYKxhlRfzMhNuxm3RNvoaLcRCcdWmTcBme5v1QnO8jJO65PlC6CarPLec+mVORgj1c3Dm/vZDcbsTUpKQIlFMc5U6VdHVMJwnD0DkIBBQ7eMnVvyBAz/ItI5blEh5fj2mJY+Yj5ludEd1oVosG5SbjciJ4Vted5JUvplNfU9omn9Qd7lr1PUDDn1XTF7NqjBEh4OZAUZjMLHjbfMdLT0hAIhuDk7AqPT7py1rIz71MswHuQG3xysfhXUsa1YPTNKGuGzdPKK1RUQWUUhACKqlqV81RE4tZGwO+Xqbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM0PR04MB5858.eurprd04.prod.outlook.com (2603:10a6:208:132::23)
 by DU4PR04MB10717.eurprd04.prod.outlook.com (2603:10a6:10:584::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Tue, 1 Sep
 2026 11:48:55 +0000
Received: from AM0PR04MB5858.eurprd04.prod.outlook.com
 ([fe80::bdf4:c9d1:4e3f:68c6]) by AM0PR04MB5858.eurprd04.prod.outlook.com
 ([fe80::bdf4:c9d1:4e3f:68c6%3]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 11:48:55 +0000
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
Subject: [PATCH v4 3/3] can: gs_usb: check can_rx_offload_add_manual() return value
Date: Tue,  1 Sep 2026 13:48:48 +0200
Message-ID: <20260901114848.500591-4-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901114848.500591-1-ciprianmarian.costea@oss.nxp.com>
References: <20260901114848.500591-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0124.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::15) To AM0PR04MB5858.eurprd04.prod.outlook.com
 (2603:10a6:208:132::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB5858:EE_|DU4PR04MB10717:EE_
X-MS-Office365-Filtering-Correlation-Id: a5019a96-0f90-474b-f8ee-08df081f0035
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|23010399003|376014|7416014|22082099003|18002099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: xUJ/cxILTIHyZ7x0stmSbivxOjz8fwZ0JIN5gpVV/Ym5CNvNy5ZPuuQjCM2CWNcWpFsloyKKHRldvgE3HxyW2CycT08ZdltrKKJHqjGKsuPWwwRFidCzENpDpLs8hipnupZ9yuCqSxwK5dFDLh0x34pNojKlEEYmjMQAyK5w64yGTIYZx6XcbRpeg7Qi0D6M5Dx7lMd48MabOZeNMVVKWNzO4hPNtiYxaWbfyxlr8sR5XoPbmaYip/+FP2MZ5E284E7hiIB7KmbmLfefloHUlwgkHb3lwHjrk8z2rTRn+zwCCXPZg+ZMegNNDU+4OA8Qq2w28dhgRgeyeOCMNok0VSBUm8vZsMjg8xjqQg2V8XGobbUs8vDS5XSBXYafCr4L7wOObnybojbTRoSvVg7xzStqQOYgP2kGuz3mmqSLklsOiSqGHFkuCnox/+TIl/SbnvFN85WsHf0jBF8iwoqycovtvmPubuZOw8GE1iHpf04DFHGYzfr7MZtuzl3M6la+wvpixKfmea+UBZC8Ufp+xlaf8+fByvFJxRM12movif602CWHIfuKU6ncgobo6FmZE7wovyGqgl7Gi1bn1I1Tzae/R/YPY7j2Y4CP3RuM6g08FrwftJfZGohxU8kdIjkQnzc8oX60cCuujW0pPgHt3o7GA0bggBuIkHOmNQo+SFg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5858.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(23010399003)(376014)(7416014)(22082099003)(18002099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUlJZHJJYWl2RGsxNjBBZkV0RXQwWWdiK2xuRTRsUFd4cVJOS2dRY0QxZWhS?=
 =?utf-8?B?bVBEbWI0REZKQXY0bnRQTnh5WDhWMGtIZDZMUzhhNFdlajRDcHNsZUVFMitI?=
 =?utf-8?B?OHdjZTJVSEQrSTNyT1lqM2ViT1NjKzBmWWkzdHJhWHVXWGNZdzl4WjhNem4x?=
 =?utf-8?B?Z1RTVzZ4OUo4c2FueWEwNVVNVzMza1VveFJLS0JrY0w3VUxFVE5TeUQ5bU5s?=
 =?utf-8?B?aTY3ZlBrVVNtN2hPOW5iQ1Y1RVpwVXJ3b0RrTXlaRG9lZU9EYUxqelR0dXp0?=
 =?utf-8?B?ZkFGNlRjcmpZbmxoSG95WW85alR1T1BlT25XVWhQOXJBelNkcjM2MWpwUjJu?=
 =?utf-8?B?NE1EaU1FbmdGbTNwV3lFaWRSQTFKS1BmZlI4MXdBMVJVU2F3N2hWNXVEaTBU?=
 =?utf-8?B?Z2ZhTnlYRDZseCtUNWNObmc4QW0vVVVwWVpLeHArZm0yUWV0cktleVUwQjdW?=
 =?utf-8?B?V21rNFlrSSs0VWdJcEF5TEhIdXZQakdDVzBMQldUb1Y3b3pFNG5HbWdPWGpL?=
 =?utf-8?B?OHFYeEQ1N0FCUXF6N2pPQXh0RjM1L3V5RGZqcnk3SkM2QysvUWNKYjVvb3ky?=
 =?utf-8?B?b2t2Zm03cFd1T0R0UUtNRTUzMCsyQ1I1UnNUZjJTUkloQ3laZlV1Z3lLbExW?=
 =?utf-8?B?T1ZTUHNReGc3TTVzQ01MVVJLczBMcFBDN2xzNXNMUm11SWx5NlhRQ1YzNjdH?=
 =?utf-8?B?ajhjZHk1UHpYM25jN04rb3U3L2VXbUNJdlJEc1g0RDkrcWhVZzNteWRibFFC?=
 =?utf-8?B?aVoxNXR2Z1RnWlpmUjBxMFFZWXVaV0ZxOU9LUE5Ib2NHWngrUHlmWU9lNll1?=
 =?utf-8?B?aW5nUlRPNkQwUUlFMzc1aHRud0JBb0xLSkg2WVVFbEJTWkcydkpQSitrY3pa?=
 =?utf-8?B?RnJFcHRkei8yL3U4T1VCakZ0ZFMxejJ2S1IyUUtzY1Juc3ViaTdTRE9QOHZU?=
 =?utf-8?B?WWxiaFNuNFE4U0luVVp2ek56U2RzRmJ2MmQ2cjNvWTA4VHVoelRpVit6dk9W?=
 =?utf-8?B?akcrZm5aWkUyTHpmeXZCclZPV0w5UmczU1B5TEhDS2VwRW1HK3dwNSt0aWxC?=
 =?utf-8?B?d0NDdjkvcld2Y0d2Nk5RYlNPUThRQmJQOUdlTjZjdW0wbzNsenA0WFhiWS9T?=
 =?utf-8?B?Y1ExSUpFYTJ1NDhoeWJoclNiRkFLQ3hnY09KT1RuMWNrV3hQVUpCVGQxaTZt?=
 =?utf-8?B?WFNaQXVCOVJMVXRWcm9mNUtoRTlSclUxdzYzT2ZFUEpES05iMmo5UFpvRElk?=
 =?utf-8?B?Z0lqWnltY016eVF2eWdSaGc0U0g2RFI2SXBKMldQamhQS2oyRWNMWGxSTEhI?=
 =?utf-8?B?QktLMnN6OGZWZzhwTk5SZ2RicXl2QmxhVzRDTzZIUXhIb3ZJYXpuZUdnaUFF?=
 =?utf-8?B?dEN1L0xEc1VwRUVRdXRTU1BrSWZ2K2Z2K0NKL2lGUERFUjl6R20xUWVUYmRm?=
 =?utf-8?B?aHo0QXgxeGRvR0l2RTRqRUVVZFhSVWphRWdtSnhPaWJBemprLzlJUTlzT2Z5?=
 =?utf-8?B?YnM1RTBWN21BaWFrVDlWajg3UitMdjluMXUrYkNWOVpNYXYwSWUvQ21JbHlV?=
 =?utf-8?B?NEJXYUFBWWo1Y3lKTlVUVS81S24yTWZEUU9aY1RWQ0dhWDllc1lIVFd4USsz?=
 =?utf-8?B?WjA5d3I5YkFWc3gvRHE4Y0crQ3F1QWxZK2VGT2xSdXNSM3RRd3I3eWNSVWNh?=
 =?utf-8?B?UjhYdXNWclBqdE1mQU1QemZsRHUxQ1RzZFIwQndSUnNndGltSVJiM0RVTTRI?=
 =?utf-8?B?d1M3UFNUS0RIWmhhVTNNSGtZcWEvbGNDWUFTSlVYNXVFanJZS2FDbHNJV1gy?=
 =?utf-8?B?azg5SmpUM3FNZ1U4Qll5Vm1DVnZGTkpsZlgwUTQvYmE2dEtGbUduNFZxTkkv?=
 =?utf-8?B?ZUN1YkFrZkFKMmVjWmxFSU9Cdmo1L2FGTmU0REUxRDQxK2QrTHAyenRLNE44?=
 =?utf-8?B?L09aRTNKVi9DT25ydHFiQnZGZisxdit0blhGNmRqa3RtaGdubERpR3hjQ1VO?=
 =?utf-8?B?VS95RzVSR3E2UTcwc3lOdEhvcGxtNkNvVmhzVEVIVFNVelBBWEg0RE5YeS8w?=
 =?utf-8?B?eGtBQ254QmxUU2N0VEJ5SVhsMW9oNmVoaDNURzV5a2ZzbEFpVTB4UkJwUkpC?=
 =?utf-8?B?UWZKdG1WbjhsbStOMDJ4dUE5QThwcGJKeU83UjdDNXlLcUp1cFVvNG1GcHlR?=
 =?utf-8?B?Tk9jMVBjRHRBbmptRWZyREJNNVdvcGw2N000eWZvbUc3RmhsMUU1UWhOaUdV?=
 =?utf-8?B?TklzSU9pZjMvd1dyaHpiV1poeFN1cldqdlcwSjBvVm10L1J0ZElMeEhFRXFz?=
 =?utf-8?B?Q1lDTm9uWlY4YzlxV2RQcUdoS1o0WTdOSDRNQnFiQzFtVW9ucnJuVGFHZXF3?=
 =?utf-8?Q?i5cZR/iFDdLClW4Q=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5019a96-0f90-474b-f8ee-08df081f0035
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5858.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 11:48:55.1595
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 70ovyQhqxNHovgP+A398wkyWhI8MhuTvV9rkwPYMPtOsd9F4B1s4nzpXctWkYXFuK7tbYgsj1bGLH+9wNehGU1DZf8KPyc3S85iNJZjF2p0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10717
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_044903_525732_C4C99166 
X-CRM114-Status: GOOD (  13.06  )
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

gs_make_candev() ignores the return value of can_rx_offload_add_manual().
Once can_rx_offload's skb_irq_queue is made per-CPU, that call allocates a
per-CPU queue and can fail with -ENOMEM, leaving offload->skb_irq_queue ==
NULL.

Check the return value and exit via the existing free_candev() on error
path.

Fixes: 24bc41b45583 ("can: gs_usb: convert to NAPI/rx-offload to avoid OoO reception")
Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 drivers/net/can/usb/gs_usb.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/can/usb/gs_usb.c b/drivers/net/can/usb/gs_usb.c
index 3b9b2f104d86..cac4ce323a1d 100644
--- a/drivers/net/can/usb/gs_usb.c
+++ b/drivers/net/can/usb/gs_usb.c
@@ -1487,7 +1487,10 @@ static struct gs_can *gs_make_candev(unsigned int channel,
 		dev->can.fd.data_bittiming_const = &dev->data_bt_const;
 	}
 
-	can_rx_offload_add_manual(netdev, &dev->offload, GS_NAPI_WEIGHT);
+	rc = can_rx_offload_add_manual(netdev, &dev->offload, GS_NAPI_WEIGHT);
+	if (rc)
+		goto out_free_candev;
+
 	SET_NETDEV_DEV(netdev, &intf->dev);
 
 	rc = register_candev(dev->netdev);
-- 
2.43.0


