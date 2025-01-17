Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C45C02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 06:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bquDV/bmUAb9pFD/nbqifxv3X/8ei8IhgKKoVYCEd7A=; b=xVLQBoAvKwhRmNvgEdzoXxzVNG
	/Iuohhh/2BvtWMYVXLgf/HxaIJy9CwjdKTuxIKv1wLDh4EmLWJOpVPG+xKBSMuyjYRtW3XB5w/7tj
	IWWwqBSUcc0Ab9HY26FGyrMU7Tn9LD1DM7I0QhcW3YNqNRIS6RLkIntlNxgzZnJCCQqDEWsQXPQOd
	wz/fdE+Ma92CvmA8ZWQexy+1onBGHlywNNEnRRkKs7cUp38fR9iJzQyoDM5FHjcZAZkYYyVvfE3XV
	9+C4lTuVlE78RJzGM70U4KgIdzlvIWID+SQPnSy2NKPk4BAIuwDdiY4tZV83kOsEVwV86jrtDWbq/
	6MCmpC+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYfjr-0000000H6WE-0Xl8;
	Fri, 17 Jan 2025 06:21:51 +0000
Received: from mail-vi1eur05on20606.outbound.protection.outlook.com ([2a01:111:f403:2613::606] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYfiX-0000000H69w-3vPm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 06:20:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Huc5v9TzqnCcYapIFKlACqOUWZAdw/HLsuYiIYROKdI6voIWkAdGmeUxH7pCOyZWTLvb/U9tN6nq9m1HnD3pKaBZ0J6vjVytscKc7UELsGMtqRn/YpXhuEz9Q7KwCWB3BHMmGVp2dC7sx03hi4sAxota35TPkJoomLQ5m6mCa9UBvRkvN0S0iQ5K1/wgHX0zW4nfJySkrojUvlI7GE2KK+GJwM6Jc4ITyoO3gfnL7qk7duFhmjh+GTwvro+xuWCPBGy2rwk4mNj9TpOFeU15BzWLGPNS+XBfumySp5kNG5e++wlmnHIEVeTTo3Ltpj9aNVdDiu0rOd0o4WCjp8pNkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bquDV/bmUAb9pFD/nbqifxv3X/8ei8IhgKKoVYCEd7A=;
 b=G8dX7kQuJc2GgdzvTuJNLY9p0QJREgs7pOuCuFEfynwyc2YV9INiAVN/Xn4PTbxQeoxQ5lv5Q/QGqiLauaoK9+k2H9s3oo2ajwMDMfbxt5wyHMPdBWjspnh9meNWFCnuCDcHwHCTX0YEStYLx6WnJbPRt/nzLGWOlAL0lYQm8NaglHR8HRRYGtzxFbX4CMRHE7+G2gWse2XSjE+YVoroocnhjBPzbkBcNKcLZHOKBsjTWCQZT+UE0WhtNz8TMIVT36PTNEfUNPiHHt8nxUos1J9OO7BabBB5hG6CH46so7YzIeFF1Fo8UHSCd48+Dsr5DoSaGoP/Wg8agjDYQMDM2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bquDV/bmUAb9pFD/nbqifxv3X/8ei8IhgKKoVYCEd7A=;
 b=U22YWuxyJ/mKN2OxkmRqIleUTdA4J/50Mt5mr+x5jaY0AnZvoEXwWq0OrH7g/AiUpmQdrltWDh5zcaH0V4JhzBs51iZQ2QTQgaw1/dmqjACMtBX0U/68C5VJU5G/NDEnAphsc7+Sr7hv15Eenz9KS8VZN/ZJTUq4Fw1T5t4nM4UYlaq2Vy5bpduE0lLK/3HogkakFJh5urwtHUE/mA48X5G1VjZwTx8c+f6fTspns97ihY3NjD+YHoagroRoJplhWpX0shLIwSMEbdHiH0yIUlI+grlGZse8jK7NQ0wkmiYDbLMzed1YEdrGBqlT363KyaN2IoCaPyU9jtRC+p84tw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by AS8PR04MB8053.eurprd04.prod.outlook.com (2603:10a6:20b:2ad::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.16; Fri, 17 Jan
 2025 06:20:22 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%6]) with mapi id 15.20.8356.014; Fri, 17 Jan 2025
 06:20:22 +0000
From: Ming Qian <ming.qian@oss.nxp.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl
Cc: nicolas@ndufresne.ca,
	shawnguo@kernel.org,
	robh+dt@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	tao.jiang_2@nxp.com,
	ming.qian@oss.nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/4] media: v4l: dev-decoder: Add source change V4L2_EVENT_SRC_CH_COLORSPACE
Date: Fri, 17 Jan 2025 15:19:35 +0900
Message-ID: <20250117061938.3923516-1-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.43.0-rc1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0034.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::9) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|AS8PR04MB8053:EE_
X-MS-Office365-Filtering-Correlation-Id: cdcd5b1e-aaf7-415b-31ad-08dd36bf05f9
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MC9XYCgVfWV/mFR7rbxJdfdFfhH4u4XyUEvCdz6eWzi1wz7rMOlmsNAfaDXq?=
 =?us-ascii?Q?mdFFt/3ZoO5ZZQNbYvcilwXZyI/T+JwEIIfWff3B5Pv4wad7p37fJ6ho187q?=
 =?us-ascii?Q?GelJmZTC8lW8hVIDuASPd5QQis278+NcHD39yZyDg/mdvz93CLXT2K6xPs3s?=
 =?us-ascii?Q?FKxv10R50JtP67aR4GBmFvbM+xIvC3EJXdsiGELX5qEYs/D2MgEJ+A376qnW?=
 =?us-ascii?Q?cKtlXB1B9xOEOsPL2MB/sFbi/T/4fshfXADtTwP9Dk9jqbEiDVf8UnVnUJ3X?=
 =?us-ascii?Q?q650ycmfwPS5Nd1i4CpwZGqwsdnUKjpzMkkzLXPgLWZEsWMV9nI6pFLoysxb?=
 =?us-ascii?Q?gsuC67eLtxpcrzavlNqjrBWSeC/70RwwxDxw7vxKEw9wmk2EhBrgm05ACFI2?=
 =?us-ascii?Q?rQw3kbhhuTo4J3wFsatVjuM2PhtTC2X17AEpyUEGpsGbPMlldP8HNQHLaZeC?=
 =?us-ascii?Q?itgB9mLzwlQ70HMSJU1k4QLaXfb40yGcvE0CZa+F8Leo9qerMaT+qUqPwtoL?=
 =?us-ascii?Q?E/F5MPf13SOsuQIvVubEXwGgPnboa0CCI9aeSoW3hsX7be/FN2bTcvbBbsTt?=
 =?us-ascii?Q?rTgTOsA6JJzYvoujMb6/x8AWmanWLqU4g11A5iuiO8BT1HKThjRzpfAkdRyi?=
 =?us-ascii?Q?9gyXecuX1hxODyleXKw2Y8tJqcIkFqxmMgSl7+MnHFrAb1DzlOhR7LJIttQo?=
 =?us-ascii?Q?kcs4NbodvZWZTtlrOTDSewGY+/319HX2MdaQz6z7mqhO4CV4L81RH+dNnUJJ?=
 =?us-ascii?Q?IVqF+x5cCh7fA20McB8fRK6pOLTmDQSbt1x3pxsAsgPqSi53CWmgBPA5O10U?=
 =?us-ascii?Q?KOVQASSUcBHOSw0Lks6U7rblU71/+vDnv2kKxu3ZRYQatNOELCy2/9j+K4R+?=
 =?us-ascii?Q?6uxkPfJJFX87c1Fibsepf/pl9rH7RvkDPpK6m5lifAYQBM6pXXinANaoL9l0?=
 =?us-ascii?Q?Q2qee3Jpw6L9XAQVmEaa0ZVrfT2KuV5EvgIxN1ojoUYntREOR2Wl2juJChvP?=
 =?us-ascii?Q?HXSNcD/QbsiNnYNi8z3lg6lUXBgd41hMYfYRNH6Pv0uTt9mgPt9elBtzSwE8?=
 =?us-ascii?Q?nN6pRjKlaHzn6M7iVPvR004pUArUVebeTCSa+YKI9XH9ixVlwl1DANMW2VfP?=
 =?us-ascii?Q?7Ed/tcyJX2R8JrMz5iwqmGhAjiJT8Cq2ZmckUr00KCJIh5w0OiA7Fc7f/8oU?=
 =?us-ascii?Q?IejK+9G8203YQ/NFQV4iEmrmOhIEnPnYOZuBOcZd/A9I9orxtPXuxOKM2mV2?=
 =?us-ascii?Q?5SMCvfRIfVGHcmTZjqin5JxrmmNIDEelpaM/iuqjS/7KvbsMvwfOsXETcnN+?=
 =?us-ascii?Q?2z/9IP7Ud0Bfw9Hfm2t/iRQRJ0GuFB93xhKNpauO2/Fju6If8bv9iqQ7KjXz?=
 =?us-ascii?Q?CfvBmXlXrsNZqy/1PsyFSwD3rU1Hb8JJgYQ0lzceMkTiPeftElg0jsD+lrET?=
 =?us-ascii?Q?sBrSd+2l0kEAlxK+t3CF6Ls0qzOJvz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FsVUVvlWBPdSuI3tnrRFlZDQkLULAQFLcVFwUw2EpmQKx6x8uxtNbbTYTyNZ?=
 =?us-ascii?Q?6C95ZETYNzAC6wxB1MelVLO/s5WXo8MhhDJeza984d0Mwj9sow5Zl5myPYk2?=
 =?us-ascii?Q?UH6T0zE8PUWuWSmu93s6GxCBJJGtnvPL9BdypsQisBV0ovWItDkUSEwPC/DA?=
 =?us-ascii?Q?Bku43C0TEnz6ki8w1nEvIOAYGG+lyHOffQa/YisksnOtVIJzdRbVcLDBP0Wu?=
 =?us-ascii?Q?y3v5PfpRkmkGSJK1y/tQDXQYweVqq7dQxuv041BrCSqdcFypTfmOl7xRxbOl?=
 =?us-ascii?Q?KyNxUSjeIesBwn1NWXXnsADNL+lb4rQIA01ai3tfLVRtq3oPk9fNcZZP1UlX?=
 =?us-ascii?Q?OwQRuQvSBCjpEmzMJCROqR8aBl4ooaY5kN6wIs+FzO2dFiI4nk8PnMYiUEwe?=
 =?us-ascii?Q?4f7vzxctpZZL7S68D1cXD6m0Q16cgrKDYApMVVVUKwuf4NojMB6vxeWhjQ5q?=
 =?us-ascii?Q?SWKgADdYJMcKPzitKODmEsDce/PWsEkVS2rNyPAgDLg7yJ4WfaloAWRzGA+x?=
 =?us-ascii?Q?ghtWSw5PJX8fbHXNMfWPGqg3tpLwGs0VFD1qTvbWkpE6mPoYoSBz8qtXfZ61?=
 =?us-ascii?Q?veexYIo9KMGXJJrib7e6acujR9YUJzJz9TMtoCAV9z6ZyiYrDde8e6lwkEjE?=
 =?us-ascii?Q?W/KNrrLwBjDa/hhbGuKIID+i0vSY0GLxNdVpiV/aqBGz+fUdaEtSfSp8XF4E?=
 =?us-ascii?Q?qSzJfIjtSzqrg4bIOTDUVM8ApHMR5f/woxKDW9LEUrDSlqoLBUKaMNPyLcJt?=
 =?us-ascii?Q?CE4ZZJRsCyZeDa6FXSXp1DjBpkOKc/yrWvY6jhI0M+JhLFe3hYYprZDGbVMq?=
 =?us-ascii?Q?xbkW+CtkE7TUQql8RHGMGD6BPEt0ANQ83JhX010KapNu3GA64mvPzZk1Rzvs?=
 =?us-ascii?Q?n2C5QXdNFR7WRHcL2v+6i4kmsjwhImfmGzyLjgldGyEdG6NmFFxBNe+rG53i?=
 =?us-ascii?Q?kmT7fq1+FLO3kfu903boV8tKjGT9mcv2cl4HpP5mkxi1Qev1negWD5Tu4riZ?=
 =?us-ascii?Q?iXqovrf+vMDHTxj567L1b86rCHWtR0H4Dc4q5sgupjm9sQoofK+K5KSXvK9n?=
 =?us-ascii?Q?RxhuJRKPVJ9EKiJZ5Tdf1sx6Qq8xYDaEyaPPGA4x6vzVKW/Y3wXgXX2JfZwY?=
 =?us-ascii?Q?4KtzhYlqauIfRFGbGOyR60UnQrv020kZG2dwpjMI5P4o+yuY/FzOuUFs1fWF?=
 =?us-ascii?Q?B7nW/906GP/Hz05vUfDRuqjMA2LeebYLenHfGzWUYFoXBTB3+zlF+7B28kWo?=
 =?us-ascii?Q?fvFJNlCbU2d7iOWNBKixIQNetPwI/KPBnTk5fxYkrDLmyJBKXX1G22aMY3rF?=
 =?us-ascii?Q?GrdYHxbUOTMoGdf6BSKV4cLAF4GkqvKnWSKpwxdWhTGtI3kTGdnt6UdcHus/?=
 =?us-ascii?Q?XpSKVewKIwvxT7QXPxAtT3GuexKLBD0jviQy2XTcXtRDKnqYhz0gRraqH6wi?=
 =?us-ascii?Q?nsmB2SJotVmVywNVglV90HozlUcMU7+4k96J0v+2b9W69yjPLJTeWL09roeU?=
 =?us-ascii?Q?0BjyEoM+n9ClcvgsIzsp61B4zXbBgwubdyIM8hWrcSon4HSzkeMadp4VrwdP?=
 =?us-ascii?Q?MhgEcCUcL4W6dWeNVGAnufAK/hGvAfHaY7JN7nD9?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdcd5b1e-aaf7-415b-31ad-08dd36bf05f9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2025 06:20:22.5374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oiV7/4ymi9w+8OiiZb+SsKUc/9KoIQxS4AQYYvV80+X+jpPT79UM4FPducm1jmKSu+5eOFuvplbSMqLoXoETqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_222029_986902_35538AA6 
X-CRM114-Status: GOOD (  11.46  )
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

Add a new source change V4L2_EVENT_SRC_CH_COLORSPACE that
indicates colorspace change in the stream.
The change V4L2_EVENT_SRC_CH_RESOLUTION will always affect
the allocation, but V4L2_EVENT_SRC_CH_COLORSPACE won't.

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
 Documentation/userspace-api/media/v4l/vidioc-dqevent.rst | 9 +++++++++
 .../userspace-api/media/videodev2.h.rst.exceptions       | 1 +
 include/uapi/linux/videodev2.h                           | 1 +
 3 files changed, 11 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst b/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
index 8db103760930..91e6b86c976d 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
@@ -369,6 +369,15 @@ call.
 	loss of signal and so restarting streaming I/O is required in order for
 	the hardware to synchronize to the video signal.
 
+    * - ``V4L2_EVENT_SRC_CH_COLORSPACE``
+      - 0x0002
+      - This event gets triggered when a colorsapce change is detected at
+	an input. This can come from a video decoder. Applications will query
+	the new colorspace information (if any, the signal may also have been
+	lost)
+
+	For stateful decoders follow the guidelines in :ref:`decoder`.
+
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
index 35d3456cc812..ac47c6d9448b 100644
--- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
+++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
@@ -526,6 +526,7 @@ replace define V4L2_EVENT_CTRL_CH_RANGE ctrl-changes-flags
 replace define V4L2_EVENT_CTRL_CH_DIMENSIONS ctrl-changes-flags
 
 replace define V4L2_EVENT_SRC_CH_RESOLUTION src-changes-flags
+replace define V4L2_EVENT_SRC_CH_COLORSPACE src-changes-flags
 
 replace define V4L2_EVENT_MD_FL_HAVE_FRAME_SEQ :c:type:`v4l2_event_motion_det`
 
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index c8cb2796130f..242242c8e57b 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -2559,6 +2559,7 @@ struct v4l2_event_frame_sync {
 };
 
 #define V4L2_EVENT_SRC_CH_RESOLUTION		(1 << 0)
+#define V4L2_EVENT_SRC_CH_COLORSPACE		(1 << 1)
 
 struct v4l2_event_src_change {
 	__u32 changes;
-- 
2.43.0-rc1


