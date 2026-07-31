Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53E8EC55173
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 03:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LyJNm63Wo7GGm8BdYjR6OY8C9XHFSyzlBwUJXFz7Co0=; b=NTwuen0jDWUAENdohwkUa6Ov03
	13ReOI9GkjT1yAWP8vbxu/AuABYW3gBgPv2Jk9uwyomMd2HLX842Wd+nfvfqFRcE/hhzprskXRJ1i
	uwmgzVnTOBVn+ruEmhnKHh6czeDXtBudsOoJHlZiGXH6iu54I0YTkf9T06e2opLLtsYDPD3XVuqxj
	shM2I4/vWhgpx1Sky/uJK4J8bp6UPlJiT4Jsf2F7gnaJzAb9E2wMNf2DChK7Hsm8B9H7PKYvdZ5sV
	qmPW13Ie+6++pgWnHMR0REgWZ6UyELBtjQPXzynRX1FsWIoq/qcacTm+UJn1AJj/h2dAvVBbDHHYu
	nBMCE4+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpeLp-0000000BiNK-0S6C;
	Fri, 31 Jul 2026 03:56:01 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpeLk-0000000BiHx-0Znk;
	Fri, 31 Jul 2026 03:55:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SQD2Oq6d82mQUQicbY66FRHY55tWMMVVNcP79HVvShin+7v44KKCHiOT8Ul2fm4eZApzAhYN4ptVVD8UG296wg2eMuvGdS6TVDWvobdbZ1gKQRcVbBSbTHO5rjGUuTpTZAW2Le6z2aT1gxIH/z3M/95sCcmKb5Xu+IGMKCwdhdt1Y4x9p2QSzkEFXRSqZs7RouB1eI2GDHKSyV/jebCcOHIwG5TCxLpK/nU6BuMQPMJKAu5M3QcZhop/Re7E0MKaGUFQ9FLwoX0ZrFE0fpNtFtbVg1psE/29nBdo9eK/gosi61oMeeYgfJ4ODr86GrMHAagCKU1oiohc1IFESiiUIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LyJNm63Wo7GGm8BdYjR6OY8C9XHFSyzlBwUJXFz7Co0=;
 b=jB29K1sMqXsdskBvr0lUC8sr1BYnTK1GVp1r+w/MahCCTX6BF8IKhE7Y5mxzu0qdkgPtnGnGTMG2/I6w7qAyNaz51OnPPHS9BGw7+p8+A9+0ym7rFgXMK2Te5som+kEtzmU/txZUtjUYyo3g+5oRxZt9JUZjdU4F58mz7kcj9EMJFDUmdofQypsQfR/USup4Yu23IVO4aIjHksqkHEUAJttz/+HIjreIAzvnhCyMpqX/O0NsWqWacSfD1XmfehTZSEo7ZIZ9tgseNvarDlLT7LEy4MeUqicQWK+Gj0G8kSPhx9GwUDy9b8ujwb+M1tuXgikh9Ci3sgGw9CfE7h6BSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LyJNm63Wo7GGm8BdYjR6OY8C9XHFSyzlBwUJXFz7Co0=;
 b=lJrHXkMMIKdEHG2U5dt7a2waExO56cIeYLP6JsJy640ryzPiplSsN6LluK0Wx3bbXzhA29sfWUK3a83jkWIT6zWGifXsPy7Ka9hCyyYmJYGFa0+l21fLFmsOmVoPi3VMWYSQMKJ1gaWOKqkDP0QUPCy9sZq9z8uPjXUk9wXiSa7W7+UOKiBFdSqmWETBR9DrdWb1qzQl1npXIax2agpzp3q7/shDhhQhlAk5H79NRuPAABDJWE0PAWDaomEZ61+oWf6mPMQt6xCg+vnPdJKaqpRP6cv+SIq0ZI53tD/TGEFdsCI4N0ycNCFXrvut8pMEZcNchHuG4EyPhUGyYaLFfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by TYNPR06MB8782.apcprd06.prod.outlook.com (2603:1096:405:3c5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 03:55:29 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0245.012; Fri, 31 Jul 2026
 03:55:28 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org (open list:MEDIATEK USB3 DRD IP DRIVER),
	linux-arm-kernel@lists.infradead.org (moderated list:MEDIATEK USB3 DRD IP DRIVER),
	linux-mediatek@lists.infradead.org (moderated list:MEDIATEK USB3 DRD IP DRIVER),
	linux-kernel@vger.kernel.org (open list)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH 08/11] usb: mtu3: Remove redundant dev_err()
Date: Fri, 31 Jul 2026 11:54:42 +0800
Message-Id: <20260731035448.252289-9-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260731035448.252289-1-panchuang@vivo.com>
References: <20260731035448.252289-1-panchuang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0115.jpnprd01.prod.outlook.com
 (2603:1096:405:379::17) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|TYNPR06MB8782:EE_
X-MS-Office365-Filtering-Correlation-Id: 67caeffa-34cc-4cf0-63f4-08deeeb78f71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|23010399003|366016|1800799024|38350700014|6133799003|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 5ONux4GF/MZkIyxxEbJeCtr1ZviQcHETW8BH+d7qNFnBPss2hJNor85MtPS47zRv6W6wibOdR7cGhAiVDCx9LKrgIYvpH6zkhz/9Nj/fG7x668lz12hWbaz3AYPVBUzo9IsMYwwUFWukYFVuRKYgQ8OG8qy7AumxjESqjX8OHVULMyxuU+hBuwRkWRUrxXaWeo0H40hrAy8j6JSwILxfjZqgRIHFjXS1DP5BuL+B58runZ/qVxe3v8vitg0lL0S9JCm1OPaH4fvUAvQ71GjjqBeNDBArM7qHZAv5xxLQ1CKgcx/Cdbs8kmpQaMZ9Z3YAYdWKP7ZRwcimSnzFX1m/zSSYHsbm4xnI9q/vMRc2ZfylJmjLtTrM/u4L/wE9TN+ZsK0ZV99+pv00C3pL9EW4/S9FdsRkBJ50uNKXSGKGNdFBKbRpFV9/WSg6zB5iTGbzABtmTmks18ZzmjX/TXD3SW3MNPlWxJwUTTQ0M7gwz7WGG7WhU+7OcPqfeLAI8OftaSt2xxWyK3j3taLCE4phhYaxNaDuQI+vEfuEWEfHwvnFsS+AalbRgjLDz0ceaEHf3dTGNgkNDYQ7KO51qe7SGlPFIjxnU3QzD25pSq5ATDG7R1EC34vykMzi3ohDzq906kAYvVahzVpyGsqOmYlPFKCcdpsHCuqS7FZIRLnsd4iuDRCoowEzP2moGsgeo+4eQztvKNGyF4xkdKogKp7TQKVCVKJps6k2kshLDSv1e6Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(23010399003)(366016)(1800799024)(38350700014)(6133799003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N1pCmPeot63uOBmj/MEwMJtMPczAAHTSzR4CoHriO2T+OC7P0iIioIGlnlSv?=
 =?us-ascii?Q?M47XhHGcRaQ0Zme/AXr5LXgPlFBMn9cDQkowSN5EYv4IDRgyBn0vRkA+vsbg?=
 =?us-ascii?Q?v0fPlEOGe/2GByp8M1tSjJcjgQawgT6gXzSUOdvWaCwH+S5JfoSbTjkhETg3?=
 =?us-ascii?Q?z4vwuQvzyXjFNsGyaAR//ga0qbxTm6aDqwE27SctyuyLADxwOK+YJEpJdZnY?=
 =?us-ascii?Q?oqK5ygDdM63THir0+HuiHqxx0TzfkZ7nCjc920KqDzWkqy2ChfXYhZTRt1cd?=
 =?us-ascii?Q?rWj2U4/TwFCwzAyk64MeMehevDH55hu5Jig7hyaY7pQIqkSwn/dYQsW/RmEH?=
 =?us-ascii?Q?FmqBeAJp670STBdgY3HMPUWnemzL88BWwMbldJXO4M6hhlv+s9t1R1+YZH9c?=
 =?us-ascii?Q?6CKB6EVzYFLSxG+CGxC+BghAJ1nYfveCQkYB25w5kPzyJwyVCBxL+B7Y019R?=
 =?us-ascii?Q?O8I/4+8AyJwRye99VzX9r9Ir2mvhD0X1lIB5WkvSv+uw/pP54CQrElEmg5dc?=
 =?us-ascii?Q?8hZ3YtXIMfrxRLaDeseBX5SGw3EwyiGVFgdZy7PXDeZt5UiLkLKDcpUSyOXI?=
 =?us-ascii?Q?MclY5/I2LhifisvkKxFV1lRUhYxI4bpoDSyw0PN/IfyLYhZ5ZvPekWtm394W?=
 =?us-ascii?Q?8SIyv+x0T/qEh4FlUHxHKT8XPfyjHo1aBX0VGLjjxelAxHby5w0kp462ptHf?=
 =?us-ascii?Q?HldkWlTNuOe88KMMzWA7GMa2UZdzdvxHWos3jc7nADvW40O8QTqpCxt8dh5d?=
 =?us-ascii?Q?aTAcHCrLU4Ad3fAIUwX/90gv33lCY575EKIqHS/q339pqPBeJB1vHFm4XGDY?=
 =?us-ascii?Q?X5wFolKc2gjgHTM1oDuL0uSAmwK8jIO4qyTsI4cfxr8UFKw+O+otQ2FsmQWg?=
 =?us-ascii?Q?i4bmRcSaHsKePD5XlscvBoZ/Dd8+r1Pm/+heaEeBaXqwQSbKjdJvP2nK1g2D?=
 =?us-ascii?Q?oWXZUtNXDssFxDMH6hSTdh9BiOLqke7UfTKOmYzjAWwPjhdbqZvggTuQnJCf?=
 =?us-ascii?Q?trM+YzpxiLO9Y49/E1tCA2MjiM2v68azu2W2lkGmuB8/k2Fhigpewhh+AlU9?=
 =?us-ascii?Q?NrI4PAyy91A4WkWA2+2N4NhTq3I/ClhPMBxOz6W9MpzzFBL+QsJtmxC0vXjB?=
 =?us-ascii?Q?0HsrhC11+8c5mzGaPbGpap4ZAV39Xggxlhe+29xuKhtliWQlJzSVF8S6GCHN?=
 =?us-ascii?Q?8pfH0zNKtqJfhPm8q5LbJXRXtOkJ9X6TIwetjps+zFt9foOBHTJFe3xs23hw?=
 =?us-ascii?Q?sPbn4AMItQsRdBpUqy+A4Q28k32sbkW5Ven8PDxSiR6k7ipoxE9k4HBDlhjq?=
 =?us-ascii?Q?AT3NFsAsVjV3UjC4nxME2ogqUAZW3ffc7MAnFgeDsx6E6X62B2G8idcaXscr?=
 =?us-ascii?Q?bfrhBTR0FdE0Jr56Sdzu0iacrhzBUcPqbJk8Q25Gx3VX00oJxuLLkhydvvti?=
 =?us-ascii?Q?/ymYb1TZxmyKgH+DJrHbMSCUbMq4Bl8Ym2XcoxqGka+CS+nl+DFqgu6v9KAh?=
 =?us-ascii?Q?gK1HL+djJWEJbUWEToJRpKRXoDajk+7TZJ6/14bUItM4V+mEEo3reZD+NgQS?=
 =?us-ascii?Q?5ShHjlq8IQHC3pa+Se6ULvHI3uU/m3Bg343KMGaOiB9kBLR2TrCWbkEvHAId?=
 =?us-ascii?Q?1w2nqtutEhPU3xwIKbHY6m1AFlNW0R6wznbDylyQXT5b7bKPNRQ2m5cFSoEW?=
 =?us-ascii?Q?RQyO93KKfckj+1s9M4vuGLCF8NZcv0ac+49DiPS531ND+frZ9VLocdvtCPUs?=
 =?us-ascii?Q?Fw/Fn67ong=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67caeffa-34cc-4cf0-63f4-08deeeb78f71
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 03:55:28.8188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uIXcD/14OMXYox3P1YG3KpBdgOwmvAlg7QaIxbY+fE5WZ2Uf4LJzcgoGnyDlq8IQs3LEuDPpfeRvrqdlrOQMBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYNPR06MB8782
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_205556_178350_C39BD336 
X-CRM114-Status: UNSURE (   8.53  )
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

Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()"), devm_request_threaded_irq() automatically logs
detailed error messages on failure. Remove the now-redundant
driver-specific dev_err() calls.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/usb/mtu3/mtu3_core.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3_core.c b/drivers/usb/mtu3/mtu3_core.c
index a40bf5bad2d5..990e2e8e6bc2 100644
--- a/drivers/usb/mtu3/mtu3_core.c
+++ b/drivers/usb/mtu3/mtu3_core.c
@@ -973,10 +973,8 @@ int ssusb_gadget_init(struct ssusb_mtk *ssusb)
 
 	ret = devm_request_threaded_irq(dev, mtu->irq, NULL, mtu3_irq,
 					IRQF_ONESHOT, dev_name(dev), mtu);
-	if (ret) {
-		dev_err(dev, "request irq %d failed!\n", mtu->irq);
+	if (ret)
 		goto irq_err;
-	}
 
 	/* power down device IP for power saving by default */
 	mtu3_stop(mtu);
-- 
2.34.1


