Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D31C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 16:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zp7x905o3nBbfy64jMP7lCRMV+4M0/Q9bAg8al7RT0E=; b=GeDkriBCu3JWRz+on72wW+X3kl
	QZgVwXNg2NOmrOeerqB8KCzL+ayrXmg++hrfNKURXWw5MsRgsHdWQ5vN/h2+pbTMsOl4g0/hUBxoc
	kzWgVvOPmJewhfBYvTMfHDHneX1nA6nptIUNxuEc4Jg8dDDWGNTM1UtWW/WAzO5fpqK4a8UC63Jbi
	ZZ/feGBy/YL24pyChKfuQQthu/IftCblHqGCV98oclQqkFuInYe0/zyMfoG2PflzuQHZg4EZ4WkGp
	gATyU3T2TEw+//xls0E/4QeA6Fg+2eXk2rEwk2ZEk6r5Z2lpdf1F1uD8bMUmnN+OF8BMAMDP5r7w9
	7XYjz3Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1webQY-0000000HTgh-3dCe;
	Tue, 30 Jun 2026 16:35:14 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1webQU-0000000HTfm-0hAI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 16:35:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eHkd9e8Qn9jhx1jgb84lanQBJCy31FNt1pOxm0m70riT+0OkYegSUYa3suyurbGnowV0l5YfMYV873us/aYean3yoF0ACncSwF4W8O3J5Ci76bdhthaasx4q5JvoCKroWxjafHQZcxWxmxhwTjHA/DPRvZdp/z7ZRcj4Q56fH6iWR4LcV8eM7gTv8lk7E0JPwKi7YcYfn+fwdQqgnbhmnImNAyJf3i7zZKG6TyhrygADWgHDzRJX5+DCdI2pOdFUMx8vIDdWLNsks+6Z6yBZxUv2pyZeex71SuHbAIgnnfe2spcwB7xBE8Na7Jje9wfDwr9bV0Zj0IHz/4ormPj8Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zp7x905o3nBbfy64jMP7lCRMV+4M0/Q9bAg8al7RT0E=;
 b=VCrSLg8Zo0XCymXGEy9BF0EWlfdYyiK/1Di5/WyTWg5mBgIwls/jKQSqLJVvrSJZWiVMluSS5Psx/EOe5bFRPYTLioRw6bDvECGW916aMTrWsR8kY2wwGleffeTp/zoGTnYekP9qnTMut/nx6RTuElZe3+P2lFUCYv9QXby6NzkamZEDk0Jm6gXhjLf8Sl55/ATG8AGN7zOfzC/J2lRUlwLDTYHzdk5DFVdsinS2s8Sx8lWJ7ZAkHoDPrpVIlcE5GB+IunWsS5OaWyTSkchcaJemR6P2JBYrLZBGUFFGzhlLGCevisiSGraM3fd0mp/lCEWa88g9I5qv2mOPvcjh6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zp7x905o3nBbfy64jMP7lCRMV+4M0/Q9bAg8al7RT0E=;
 b=VfFrpqxYaNarUoFbhccctU3d/HEy/TVjeM8VKthFC/s2eTdrbRtRQY362LyYev4BT8j1cyxJNLdwk0W4Qo6/z3eomNO9DLYjHuf2KPXjNCgKZU1n4NvUonsyb/S2SWrLS8LI4Fxm+25PePvzpyGxzXUJdvsvQFHAXdsFvLVaeK+aSj0agDrRkiRBlpvHZSZbqiDx+ogoeQahXlylEwXrVpfLfQ8nerHgpchjTfEyPwiBAsWmS5iAtNF2nlFs+7RagadLXOzSj9Jo3DQou4zJlMuNuqZV4gfTV9yap3H+z54SL5hCJa1CpSXmaNgN9wq7qfOeR00VttPHAE6ZHhvK3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS1PR04MB9630.eurprd04.prod.outlook.com (2603:10a6:20b:475::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 16:35:04 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Tue, 30 Jun 2026
 16:35:04 +0000
From: Frank.Li@oss.nxp.com
To: laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	kernel@pengutronix.de,
	estevam@gmail.com,
	linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 1/1] MAINTAINERS: media: nxp: imx8-isi: Add Frank Li as reviewer and i.MX mailing list
Date: Tue, 30 Jun 2026 12:34:56 -0400
Message-ID: <20260630163456.3317624-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA0PR11CA0124.namprd11.prod.outlook.com
 (2603:10b6:806:131::9) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS1PR04MB9630:EE_
X-MS-Office365-Filtering-Correlation-Id: e4da05e5-08f7-4af4-f535-08ded6c589c2
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|376014|1800799024|23010399003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: GjOQCRgXx/z6YN02ntDpswGwGAfPryCZlEqixtvJdXX3MmICI6V8fVlZkId5FXzUzoMPv6MfWKhWNlo7j7CmA9Sk5lkpYMfScD9m8OLd02NROaOHaBDEH8Nn02qHWX1nE/GiC37LNWVQ0oBPxwOPY0rT+UmAXrj9ssHY3gHZ0egs7IHMqfKGZk/qPCRYcwMiUpp2ukeIJxSZZ+RYnnqZclqqdskgsFKzSo/L+EOBOwBJbpUShSb11xgNTWu5lCLJNGRTgDyh8FdooFODUY2NZVG/KLKBY9Z8zKaoEYm7zAt6dtliHskhjzYRYRl4B0ht4w0Ny09+AVo5sV2BvyO3kX86370SMGr+/FsdBTNSCIrry6SowP+dgNRLuKxNyRU/q+lK5k0qYoTgTCDwpuPjgGlMldgGDDDelTjlSzUxp6ySI4sQGBzZvNvmGgEq5YyGSc8iG4mRmNivwOXuEcGmi6UggyELb1ZwUA2DuRfOGyabjunOrUvzOUIMMHRSnFQy3YrYJcsGtHeB3ijwr07nERCrVljQPKbeJtAndJE4wZ3c9gFx8HAu48D+jm0gqWdgRARl7Fde4EbreB+f4atxkfS2ZMpFInZ3dna9nT28jtnZOAQ1pMTMLQOz4pyLSHfOHYjfWWJvUhrdXGOw0yiotHfkhyDYqUKjrEd8xKUFj24=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(1800799024)(23010399003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UYGQjq4yHkyqbcCJ6DgPyu04bgjt4MydvWuQp0ey8SF7nhNANMuU1F8dunP7?=
 =?us-ascii?Q?YMDwDEbeO/sQEKIgxkkSVbfSzORbEtM6KS8I3AkYiQmFCaCTiJo99qWKwp3Y?=
 =?us-ascii?Q?+lsvAQuyaOQcMU3CRM60TLx9yNHZbZqPVZ10sXe+4RJdPtoPD7bb+/pb/an2?=
 =?us-ascii?Q?vWtLyyejrQ7Jj4zKa5Uht5vL5fYAV285TdgeG0RenAOEgVOc8wy3KzimscSb?=
 =?us-ascii?Q?IqmW+Y7GcsscxY23RxrnVqoPxJTmIsjMZy/uONiMTFZ5m95Jibs8GC53wKyt?=
 =?us-ascii?Q?+F1FdG/Snw0iqTtgwNgKIPNnGla0qYYbP1Hg70h6p06v1bqz54bQ/nRo8FaI?=
 =?us-ascii?Q?57rxepZtH5oI15npxNYILLWN6YLhUQFTdDyaex3ZxkHIRpUmvWkmiuL/F8ZU?=
 =?us-ascii?Q?Wg7Yh/87NKcUr8r28lDnINKmHnJhm4Si7UB/9/77Br5qf9Z803AQP2Bn++S9?=
 =?us-ascii?Q?TH355JAYVZllEG1bWjztvp9sTLD/G0Gj7dlAxA9p+Jl/XwY4RDiqSbhB76hZ?=
 =?us-ascii?Q?E8qUw6YXwhDU1cRisp1TYALk2Zeict+5fAMBCOoRqMo9N8/A6OWH7yIDrbB2?=
 =?us-ascii?Q?7QY7fQipkv3fDPiRDnyiONohsisprkDpI56lTUgCqiDYYQnyemCvvHHJZr2J?=
 =?us-ascii?Q?l/0g6571QmKCemMpwrT8QbrXTortX/GGrjaX+vvA0heJDezmUSVs+0bubYV2?=
 =?us-ascii?Q?mn8vPWf1yMETD/CbznaBMqVLLuVXpKnkZaONjskrfUQjBb97ai4Kw1irsz5K?=
 =?us-ascii?Q?GzbKe1SSZr30NO3z1kg8w2XMMnRHVOeM2ayLA5H9wsMOX5PAqjDhccZlOpms?=
 =?us-ascii?Q?FaUwPW+8Go7RcdZRU0Wigrt6y8Q6kn2978o1RABB+M1iBsZ/No+cyPpLTVfl?=
 =?us-ascii?Q?OqTwaDRWqKKiC3Qob7XbRKd+Bi1y1Ad9PAayOEew2K7rkWvNgSgi6gX15LWv?=
 =?us-ascii?Q?I5kFBuEgf/7CLtyPOWjZD9IO9E7yhBzJosqD6VzL0S7gLcwUHhPtMBmu4u6G?=
 =?us-ascii?Q?gVhUqDkMY35QFH7bDv/0CXLGQstnzXJOAqg5xG80jAxjDzRB7eLYnIA4FZx+?=
 =?us-ascii?Q?5WBxcvO3litqZzF5TvlhwZ0PrluknG1M9o5QLNaQu1n2Bh6BXQ0gHnKsNEmp?=
 =?us-ascii?Q?x6SWPZS4Rq5H2OFmNDGCwwmPDeYa04244B6jQbkeKI+veDT8HiY1PvnalBHR?=
 =?us-ascii?Q?0twd4PYocn0If6neH7rQ25NdoubElQrk1VQEyAEtakI4LuYeHiWSFXMkUI05?=
 =?us-ascii?Q?R97z6erISHJG3IvPwl57Rf7lMWY/HgPtubtBPLceXH+5zvUal3N8+9FLvB0M?=
 =?us-ascii?Q?Bb2GuKraEXf0GI2Q9LBN7y3oisqNF29nJ5bN87ygF7mkkHzMQirlTSco069f?=
 =?us-ascii?Q?qjxFt0SqtuSC9FG2ylDBGW2QZ3YzypIhvmlSG7zQHWJNEXmiLOBvlgevPxU7?=
 =?us-ascii?Q?qnwxb2ZlLZYLtYw/yg1B6V2R2mRknSTgBPIxl0DLkJ+KjZWCfZN2yU+4tl/x?=
 =?us-ascii?Q?EyKgBCwCDbn85mQiwjPSndZrZHW70Ky/F109SQgjxRPiCoF6khe39MZlA6bO?=
 =?us-ascii?Q?+Ct3qfv/y3n5MVp198FcPbxbSiGEc2djFqlTrupgq2o0mTxNSiszN1eNRrBO?=
 =?us-ascii?Q?WsNCt8v9HTgy1B2z388V3ZTxUf4izNXGwsui8rw/+UFL/q8Fr0cN8DdTmSd8?=
 =?us-ascii?Q?RNVa8LuFnnfwzg74/81FbOpZNQNe60eQRePMbnsMstO9BusGB18qf6oPDoN1?=
 =?us-ascii?Q?diseA7gvpxt5DAUHSjMIFGhl7sMvpj76aQibNb67JoeQyjR4AyX/?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4da05e5-08f7-4af4-f535-08ded6c589c2
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 16:35:04.3582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d7u1X4wX/AOzGMVX84cQiMgj5k6FoDsuZvYLMvmyS8h/nzxKGKamVa3XibRQ0W8Uy1TuLVTtWhqilwyHwuCCarxFQE8SMWC2YhB3Wh7rcKArUqvPqfcbyNH5ty5Vyx1U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9630
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_093511_724691_3DE9A81A 
X-CRM114-Status: UNSURE (   9.66  )
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

From: Frank Li <Frank.Li@nxp.com>

Add Frank Li as a reviewer and the i.MX mailing list for the i.MX8 ISI
driver. This helps ensure patches receive review by the NXP i.MX
maintainers.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 361a4f447277c..62ed60238b1cb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19470,7 +19470,9 @@ F:	drivers/iio/adc/vf610_adc.c
 
 NXP i.MX 8M ISI DRIVER
 M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+R:	Frank Li <Frank.Li@nxp.com>
 L:	linux-media@vger.kernel.org
+L:	imx@lists.linux.dev
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/fsl,imx8*-isi.yaml
 F:	Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
-- 
2.43.0


