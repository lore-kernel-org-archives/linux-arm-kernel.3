Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC9BE73151
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 09:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TJfTIh2o2CFn2GacROj6QyU093eEqXT+XuL5cbsLKGo=; b=AwXX08XyuuwwhuuQg8Wkfiqh7p
	CBBk/YGREV6eZfJeuv+e132Ee4l1wSCG6aeRPvq5OuPB8cLRFFR0S1CtkAU91z8QKOEvL0kbMF3nz
	qIbduC6A1cUgmfUo800erMRbgLab0R9EeStkK4nnR1thjJH5pkDSosCVS/yizhdj276KA/QcH9J3O
	QkYY71Qg/bh9fnxiwNMFH3Lq5phm6W3PL3Kxg7W4G7KOkWpdeVBujbeCbrCzJ3mPr72X7c4++YUoi
	DyQRqkWakWYoQ/s5Ss2MkqJAiRYk9R4qryfs9H38COgVS4EL6tqfMj4Yy/2WwEY2XGtenbo7EAubQ
	egPL6Ntg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmqif-00000004l1Q-3tJn;
	Mon, 02 Feb 2026 09:59:45 +0000
Received: from mail-norwayeastazon11013011.outbound.protection.outlook.com ([40.107.159.11] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmqid-00000004l0F-1Rek
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 09:59:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WPnMSyulPYRu/kKfMOfJWzPxuF/MPSTRpA7ndYlXk9veaTXzGzJIzpMNYye0tvT4mIELFhiSw1TooU4qXnbhFl38wuT/BmMm+Um07KmgJITuBEZF7N4y1Vgi+QT3zf01N1TEIuKYefGhYk6/h6GyPX9WX0XIZr5mLc/58ZWfazQgwrCEy+qb09Gt7PJaUdn/Z5bypitG5/v5CsI9CzgNyZTKqAAka59A4cX8e/SL+4mZgHQqdDWmziEgdc0h4rTAjgVqrJBGFmtVOOKS+XDgp+EFFcb6jIgASEE1CItmxQ1pGpoluYU0rJ/JdFd3CF0W5rjuBWrUVJhBJBCvqPeTHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TJfTIh2o2CFn2GacROj6QyU093eEqXT+XuL5cbsLKGo=;
 b=AmnO2csidTpdYAd2No8a9hNQhXuXcG6Brfc+gUEhGTbJk8YqsJEhRHLhV3aR001356FvBZrCKqiueALkTmAyWVsSJ+Nf6vlB0ZDvSq3WB0ZTla442d0WsX20s9SAs6p5YeGpdIrsP8ElLI6zu1FtlDnYRovFNZrIA9tan1XmCEREKWx8yWWVLDLN7hMTDAc2O0oYoMGgUANWEhgkUUCNJeSkz3wupR6MpqMh0hVAHvE2l025Z0fQ9WED+6YBtzAZKOsAy4NbVoV3e+KqqOUuBjkn7903yAyph/pain3KJ6xo/MUtFau9y17Z8IXHeLNg5F8tX29ncX/MZWm9ZxGXUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TJfTIh2o2CFn2GacROj6QyU093eEqXT+XuL5cbsLKGo=;
 b=DDffLlpOLrAuyNkty0zLzx07J/rp79mLiFdFXNC5mHiNzy5zxUcDXl+dr/aroshNQEqjKAabJ5lEeU6FZKh6r8/utLKtc7YpE2y1H9uIDRbvqc0vqh5UV7R3Sp7OIbOFTL71sCGodxe/zUAcfIhLWyb+kT6nYVGJhlBj0TipJwmfotOW/3gNATjg+S63d03z64GR3IbsR3FNttM2755wjjH2nWCS5gO1nZmZ2ih3cOk1dP8eeSONhB3ofrTwG2JKmFlsI1bWKUjeZDT9PDx90sryhbBBuXOX+b4VuQiOjL09WvYDOQUOm2idItBf83l5X7/pOHEyXDKhFBtnwJJcog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by DUZPR04MB9726.eurprd04.prod.outlook.com (2603:10a6:10:4e3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 09:59:38 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 09:59:38 +0000
From: ming.qian@oss.nxp.com
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	mirela.rabulea@oss.nxp.com
Cc: nicolas@ndufresne.ca,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	linux-imx@nxp.com,
	Frank.li@nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 1/3] media: imx-jpeg: Simplify descriptor initialization with memset
Date: Mon,  2 Feb 2026 17:58:34 +0800
Message-ID: <20260202095843.1030-2-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
In-Reply-To: <20260202095843.1030-1-ming.qian@oss.nxp.com>
References: <20260202095843.1030-1-ming.qian@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0188.apcprd06.prod.outlook.com (2603:1096:4:1::20)
 To PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|DUZPR04MB9726:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b0ec59c-b3cb-4e20-c2a3-08de6241c69e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dOPWfQu33PupCZgIc0pN3UztgaUAP7yMusVPk7QNqnfDESAdMMxesrQSPZH2?=
 =?us-ascii?Q?60MCJisgovf8ZO5u+MSJiCYFLP7xm/kf05AO5lQJBncINmaAAjC+1V6iWA2X?=
 =?us-ascii?Q?4rzG5vQoUOmPMcBFUSJ+d0rr5+2Dv5oJ577q/ZTmlHaRIwiRrhE9/hZ7Iylr?=
 =?us-ascii?Q?QFzQNyS6gSogxuWfj2hQxAveRQsF0Cfk/GDCuzeyGTSOLQD/+pctFGOoBk2Z?=
 =?us-ascii?Q?YS6fyKDxyZ+QsNzIsCQBE1/SLeBNe0QT821gGhKsYBmsuDqYo5Y/LsAzfA8E?=
 =?us-ascii?Q?LjrX2pAK1FoZzZJvL4QQQjI/HAGHbHCGiuQLlI1Fc2Xd7AP4SCIup90Y7xPX?=
 =?us-ascii?Q?Jowf1DoMRVSKQvM1VO/Uk8DeWMoiLQl+gPQVJ1TaZLTS2dtM48KLiGniPhfP?=
 =?us-ascii?Q?Chrj1+ElnXLbmWF+SDb9XbLgje3xetu49Bpt8zQdVE6mqJ7xl/zh+8VyjTeU?=
 =?us-ascii?Q?FC7aLcSWlR/VrNQmt9H+c9pTs/6CvX7yEWNRfYVaxo0HeiyRTU/c5l8SEraL?=
 =?us-ascii?Q?gALwxzdufyj4qgQiT51E1FMEVbpX3AW4PEBQ06aZXxqE1evMUW68arQHG3nz?=
 =?us-ascii?Q?LdO42Osl/iR+5h5ZAkTfFOLCL64PkERcT7QmFxDNZ2sl4nrwuxZtDpBRB4D9?=
 =?us-ascii?Q?taj3aFN7MKgUQQPunOLOvIAD+bJxamPOzig2OXUwu41dTbzFaIlbftq5u54k?=
 =?us-ascii?Q?RICWhKpIEGiRLj1AJ6/Hntb9MSCbcZ64DQSj1dt1gXVXGaMTB5uIWY59E3Yh?=
 =?us-ascii?Q?54+oSr0E03MU15XsjjFgrdPShDI04pqAXviFhKladAMsLrRlbGz9EQmKQ0rL?=
 =?us-ascii?Q?JXJ0z7tWtZl2p45zCIro8xyDU1fzwoJR9ynq3TMX99jiaSorEPHH9WdZX4nE?=
 =?us-ascii?Q?Wvzxid5kaKAnNNEkT98/B0fb1Hot/5Ik5OCohjWQWrnbteMNx5CbNnWk+15v?=
 =?us-ascii?Q?/9v0iockkXtISRVGlBJgo866j2z9E4QL1u/PYuTKt/BI//ykwqvjcDg93M8t?=
 =?us-ascii?Q?FrpGt4Pbr2wa9guGXlNrRESLCqF6/Ja0gyIoQoc88l++JWCM/nop0K9ZSL9r?=
 =?us-ascii?Q?iKtuEeEOsYN/K0MM0Sqv7pIVkzYBC1GW65RRFuAaSyGj8SQ4wRdjN766jtAp?=
 =?us-ascii?Q?a5/Qo/zp2S5RZA2vnsHfLqKADcB89OU2Lp7W7sdjQE8u7utFS2wLku+SsoIK?=
 =?us-ascii?Q?ACA28d555CNn+a7JaPA1klF/cvA8i1hGitNLSma/bWXQwDBFDYybRXYAIMNj?=
 =?us-ascii?Q?ORbxaMvv6arYbc0wJURxmJj1p5wLMZHV+MXFaqY1o/VqBU6O+2TVmhviQpQX?=
 =?us-ascii?Q?genl56M/CWt+Sb0QTtbgECtbG2JGku6zLmOUDBDm+GI6GK6ywCGw8uFnMgVa?=
 =?us-ascii?Q?++VIQ6CmVW9Kt1T4R+puD5351ypo2RFtfjJGx3HPZcNfbHyZdFj5jN2yEMgW?=
 =?us-ascii?Q?R3l1COA5quEn4OZf2mO+24nRloB6DmZq6C98IH3qePuA1CFC4zs61nyDyQYv?=
 =?us-ascii?Q?1HcPfnMug7Yfsmwa24vgK+u4YorXLXCuv1LCIk5DOe9bkWv4dBe1Q1pAFtc6?=
 =?us-ascii?Q?thqpYstZKv3eYrkRLcSNV5/KsRy3eSWFw1Tn1rRrT4nzkqFQjpg3KSnr5OhP?=
 =?us-ascii?Q?oSwBNkFZyo66MF0qdd8qYkI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KA6v4VG7KK6UDymdF40PjxZu9FN7hc20xs90WVI9YBWzUQDCBpdd0sClrBEc?=
 =?us-ascii?Q?3sxcTYM2LZZIIWmPmoIa+rgZ7AiP01KO9D3ET0HOWwkiSKq9pS7y4v67MbPa?=
 =?us-ascii?Q?B5t25JwGB+geioeq3sXfKJaA65kkTmgVxuKEu8412HViACHW5miekG4ssRHp?=
 =?us-ascii?Q?IK6C8cxbXWsArLpl2tJ7pEZjTYFsa5RIE5cnxNJUoWMil13ib1jKBHEFuDEH?=
 =?us-ascii?Q?c6CL5r5pK0Qux6tY/5SYoVsORevDW5vYG2Q+xHXqoJHcpVzYRBoEyk1naoR9?=
 =?us-ascii?Q?Vyr+l9e9n38SLKYyKyW+BBlsJH5C1VjzLfRreF5RlyGIsK98iXj8+3bk1Rqx?=
 =?us-ascii?Q?IiW7m2Rc50oDH6J2L3DM2YYHfHXP6zIcaDbXxuk+HC3UHswAMWkwGT5ZD9AO?=
 =?us-ascii?Q?KH0ZI251iKVnAEHbNBOI4/U/jxMfQfY6Zi0vXXo2ilNe1do7VEHKJgXFctrt?=
 =?us-ascii?Q?q3q+gJ5fg3kbPC1KrTBsEFbv67Vqob0Ti0Fn+mn7VAvADbOLix2WdchfbwN6?=
 =?us-ascii?Q?v7HinO9CgHEu7Xx43/vGtByBJG7LlvGUep8OmIIBpwNHWVkBcrqxEVUnnZy0?=
 =?us-ascii?Q?xoz1zJ7n5vH0xWxbmc6PjnV1JLGgyXVlFuAGCUVxTrhxSA5hSIRur+d5qqOR?=
 =?us-ascii?Q?lHBI73dY2WB8BSn84ML4/GPIax4f/puk44QJWRKomCGxRlFLFwR0Az901mDZ?=
 =?us-ascii?Q?BHK218+7qxiUWdAgCAxYj1o0cwBeqE/jzZQSxR5qXBcNa/VV1dySvByjr1hO?=
 =?us-ascii?Q?zMX1vnrqTdVkOu9qwOKjZEc1VjiYkrBrD596JtlztGsPHQ39YO7sViQ5A1PJ?=
 =?us-ascii?Q?ua4j9Li0j+Zaxq8owm/5XyT5mNMlkiDmObY0q1SMKXq8GINiJRTSE5f34b+X?=
 =?us-ascii?Q?jqxk4ZnyiYYZxhFtn9MBnShcqu2D6e3SfChbUgU1TUIienulSR7O8TuMmTio?=
 =?us-ascii?Q?OMAmiYbc++15n1CxXAh+3ZyXuFby+TcKOK20ePMFvCkZKrOhfKVD3DT6tz8P?=
 =?us-ascii?Q?mYUJeiCJ+DEDNCGrawkCSy13Uwu392DHb8RP953YneDWG9wcetJjrRrIGw5g?=
 =?us-ascii?Q?hWqE/iosgfGuPMgqVWdBAMbmonb/E3F5DYRbvxuBxBAjHiESbL52AyqmUUil?=
 =?us-ascii?Q?i3dsSJvinHW1vSpGOoVJnB7bl9jW59Phh16kCdQ1iM2crF3uKKGPZ6hel94V?=
 =?us-ascii?Q?7K1XE+OS7V/5MbkyxjvieEbb3WNAxpSXQVe943tshYkJqe/LWCMjr4ES9Uqp?=
 =?us-ascii?Q?VcIqJ5LMQK8/MpPpsI34lSa3RWGGIfbfdn9ZJwEa2VgDctbwZAloC3GggU6Y?=
 =?us-ascii?Q?EBjsjySTFR11uYqgRR9EYwglCmlMwuQOiwiL+59gDbnGdYSXyFaFBOobR4hM?=
 =?us-ascii?Q?ZWDjDvP1omb+GGFjEDJpSxNUiIK1lNfTw5T2/MJPDlFwj5XSpExY2YQit/P+?=
 =?us-ascii?Q?+KzqldJiUC+4Jg+RMHrSpS2wjuapr8PuhFV4u6xHPxpVA1VQRJXxhdhLjvH9?=
 =?us-ascii?Q?E7+VtxlHUvu5ci7dIaVMgGnbfs/zrady6EHM+zoCW+V5vjLXSVxTVvT4LjwJ?=
 =?us-ascii?Q?IScdHn20Rx+/I8dZj+B5bmhzjfrj/gM6HUVdWn6TqmhqE8/EWqxtjRo725fD?=
 =?us-ascii?Q?SpC8+rcNRwe2+oeT9WJO2Ct+8JD6rTu/bM7jbNeBcJ9Dti5yuKKL/An5Kkg7?=
 =?us-ascii?Q?bv5H9XMQLIo4Aub+MevW3x43soanUMDBO+tYJyrGDxEo3T4xIRqYCSLQ84N7?=
 =?us-ascii?Q?I9Epgx8R5A=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b0ec59c-b3cb-4e20-c2a3-08de6241c69e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 09:59:38.1694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3rWTWrT1xgVLeFB3yD7rHdjaYwnY8t4epI6FRWsDMCi+BTYWIbDNb2oYf9HsbIgC9MhIxrx3+e4Ur/ZdvCVYtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9726
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_015943_410831_9E9292E9 
X-CRM114-Status: UNSURE (   9.24  )
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

From: Ming Qian <ming.qian@oss.nxp.com>

Use memset() to zero-initialize desc and cfg_desc structures instead of
assigning individual fields to zero. This is cleaner and ensures all
descriptor fields are properly initialized.

No functional change.

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index b558700d1d96..39022c1bf36d 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -1338,6 +1338,8 @@ static void mxc_jpeg_config_enc_desc(struct vb2_buffer *out_buf,
 
 	q_data = mxc_jpeg_get_q_data(ctx, src_buf->vb2_queue->type);
 
+	memset(desc, 0, sizeof(struct mxc_jpeg_desc));
+	memset(cfg_desc, 0, sizeof(struct mxc_jpeg_desc));
 	jpeg->slot_data.cfg_stream_size =
 			mxc_jpeg_setup_cfg_stream(cfg_stream_vaddr,
 						  q_data->fmt->fourcc,
@@ -1348,11 +1350,6 @@ static void mxc_jpeg_config_enc_desc(struct vb2_buffer *out_buf,
 	cfg_desc->next_descpt_ptr = desc_handle | MXC_NXT_DESCPT_EN;
 
 	cfg_desc->buf_base0 = jpeg->slot_data.cfg_stream_handle;
-	cfg_desc->buf_base1 = 0;
-	cfg_desc->line_pitch = 0;
-	cfg_desc->stm_bufbase = 0; /* no output expected */
-	cfg_desc->stm_bufsize = 0x0;
-	cfg_desc->imgsize = 0;
 	cfg_desc->stm_ctrl = STM_CTRL_CONFIG_MOD(1);
 	cfg_desc->stm_ctrl |= STM_CTRL_BITBUF_PTR_CLR(1);
 
-- 
2.52.0


