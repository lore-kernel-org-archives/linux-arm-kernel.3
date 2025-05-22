Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99AB4C54E90
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 14:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o3ZiWvfW+NmR6QNPMxVhi0wvo+OYomNh/F99QUvV6sc=; b=gRMh33lxpAEJIP87m33vcKrkJd
	C48fSi9hiRTKfA391uFUfEyPcw9ArsBWH5ijX9dwH7Xp8xjkIntTlidpFwxV8o8yygVylFMK58fef
	mkBbez900Bv8LI2QUVMr5C81JxeiyGZpaEW/dzeIq5s2+UoY4A3WLLDJqzXfphzv5OTOnaioG822C
	Qf8GWOePKB2agldoU4pdOM6Ga4rhU+d7medWoL4cBKn5O+LWczsb5FTXtba+uKXXAaJeYaklFj5WX
	CH2lANmPCMt1c3kQNuI8wbZTAMwepoWi5LlfHu0Pu0FLwnBQkrPbiUbdBm8/vg44KQvAnqO5iry58
	hk4uUSSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI7Fp-00000001K0E-1Lqx;
	Thu, 22 May 2025 14:50:41 +0000
Received: from mail-db8eur05on2061d.outbound.protection.outlook.com ([2a01:111:f403:2614::61d] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI71k-00000001H4p-2SEy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 14:36:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=byO5HevfQfGWlHskZNMY3jM7fjQBhd5c29H96hmUxNMwvvso2EDYrI89YEtxHJekPWCjRHoEnq/yJTiaTW7o3dzbNLtrMu8mn+BPD38OFXLG4V6yvNxvt45EvPpJBKgjVERa5/HXV+Liyw5amLC9+c9qb4CDjXQiX5xC+QBj4XitqtB311GFP0y5Gw/BtsbedJIzBQFvZ8WPdEFyMAn4mXp88XQm+UrT/VNaI386sauXgcMANhNFtni2VL6p+WMdhKEBAepwNm1JYfmBmWXwcIlBYQMvOdAkNpJyHvDXnB9GGaJBmBSKMHWbmWGQ/PBkjMf0+0Q/LZE8LWq3M7EyDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o3ZiWvfW+NmR6QNPMxVhi0wvo+OYomNh/F99QUvV6sc=;
 b=kd8mI6WhL+Y1bc06bZsvrGne8qd94eSCtrXa0L09gDJNzC3O1N78SicUYPYX9ZkOh6jGnMqSkfrLT33Op5yAhW0qZPP9H7On3MO0DwTPhWtQHpdxZR8CXYTHZVajOaDPGsR0pMZPBys8Vg4vEDfoFJAs99xLLDFLur0wxi5Ay+G0GmaHfyeqCBgPHUBhJ6MEyojVHzmx+qvhOi4OutjcFHoxluZxP0014GOGP4e3Fw0bjdRONdi+c6Jb9F9qLfRZau5cS+ZtldfS3p6FtChBBG13Jiouakxf0QcIKoIMk3eUQGwQ6G34hdS6PIj4fDJhOgtske7AbXGm+ndkxImtNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o3ZiWvfW+NmR6QNPMxVhi0wvo+OYomNh/F99QUvV6sc=;
 b=lH4WXOkKRkeAnRSrZA0EanCVST9NQKfQbUD+4wcCNnG+IwAP98I2QvvQVAh9c0YLnsj/q4gDfegFcreVnoAQd51rZHp0YiWiddtmn/R6sOgQnQ5JwdavdQGCBQDnyvsyuzAyTmJK8H0a3UhuIkIiLSbLWmk79jnPRUIA064A1/ujcrcCAfeusFLayWn/c5xwlh9ePvWJhcMa4o7D0TnH4euKeGLTX8IU/cXCyt8LzYNS1vWhIubfBPxWW2lvo9NN7Hlkxd3uuXC/kVgV13I3IVOl1wkRBka3srnLoYVsTeTPfHTeUZfkgjFZoeEruPazDp+9rCkbdATz7e9sIgqb1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com (2603:10a6:10:53a::11)
 by AS8PR03MB9912.eurprd03.prod.outlook.com (2603:10a6:20b:636::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Thu, 22 May
 2025 14:36:05 +0000
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf]) by DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf%2]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 14:36:05 +0000
From: Mathis Foerst <mathis.foerst@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Mathis Foerst <mathis.foerst@mt.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	manuel.traut@mt.com,
	mathis.foerst@zuehlke.com
Subject: [PATCH v6 4/7] media: mt9m114: Apply horizontal / vertical flip while streaming
Date: Thu, 22 May 2025 16:35:08 +0200
Message-Id: <20250522143512.112043-5-mathis.foerst@mt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250522143512.112043-1-mathis.foerst@mt.com>
References: <20250522143512.112043-1-mathis.foerst@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0077.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:65::6) To DBBPR03MB10396.eurprd03.prod.outlook.com
 (2603:10a6:10:53a::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB10396:EE_|AS8PR03MB9912:EE_
X-MS-Office365-Filtering-Correlation-Id: 543faa17-f7ba-4700-df12-08dd993dfbba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?45OWknirFbVXCQweo5vs24eBzUCmrD+gZQWUA65WZeOwoQUrSNpPRncO0ZLU?=
 =?us-ascii?Q?LCqWLHrFsgcmesDXRj3s6Ao8HmlVnRZeL6bUAPah9Feuf+RLXs1t/Xyv2XxS?=
 =?us-ascii?Q?BZ8KuddzQMgiSr37i6y4xi9YcE1RLjD8IQHmtFN9GAuukZ6jeMhzQCQbbVSZ?=
 =?us-ascii?Q?Q7KFJXGpG5+Ly0fPdt9Cxd1BkHD9+n7jyyVulB3zAPoOW6KfVfFfbaFD5Tju?=
 =?us-ascii?Q?/ncobKKfIIm8OgnT3keDh35RF2KSagsPwfXRZsnDkF971Y7C+aatW0+AwJcA?=
 =?us-ascii?Q?+bzgQ52M7OrXbqtB2f+7MPdqeyQs52WB2WclCQF/COWHv0fLiBU8TH6lRzLW?=
 =?us-ascii?Q?AK6UClrRFIhk39YH1FqIy0pwTH9sw6S35DWhR8/vajB6RFiF7SWf8caC9pV2?=
 =?us-ascii?Q?QdD1ZO/hnMobTX50aG2EwC8lJXEzFKnJPUDrm6qLnE8ocIMqU//TKuIkYVbI?=
 =?us-ascii?Q?mIedgJj2v1jqKnzuIroAIoQ+DZqmq2CtfzHXGziuge9/u5c1BRGuqLuAgMGy?=
 =?us-ascii?Q?B/dMb+BGwFkdzQyle5vn2Y0YzJF4mnvJybwQBeRxraTVcSKSyqs0qWnBokMr?=
 =?us-ascii?Q?eQ1Ufl6eIhBrn3+7RI3VfckPQwoOXMcUeQPBlJaq21I07ACY/zHFfS63akGo?=
 =?us-ascii?Q?xLvAVYrKYeqwKxmWPdxQWG7J4C/ST1CrdxW/7AlN2SobpKWox9DIe+G1ozEz?=
 =?us-ascii?Q?SCvdtZOx7FC3PQtGY7bbB3k8HG8Se6G7czri0bi7Q7Awk0xucgpuSvqOM7Iz?=
 =?us-ascii?Q?kQVAId2cx/s3nVOH4x5qDURFnDLNt0V/qvtNNdz8yQs6Dlc1UPr52fiUIUtc?=
 =?us-ascii?Q?D+v0oBBxBiwt0sqdhDR1v/lhRU0dwJe9lDg1KIUVI1F3bb7XCl6agWAOqNoQ?=
 =?us-ascii?Q?tM5e+TB/b3ZmXdzg4NhH7IRjSEz4yYkZ4KJahyfGmgrMEPTedST8V2r3/+1K?=
 =?us-ascii?Q?9BCly3N96XiNWDK5GIK+5srDUu+NIjnUJHaQD+qyZiHw7VyYmg6fRQzoBK1x?=
 =?us-ascii?Q?wIlPbDaJ1oBXezCe46wuWKkTvqznkiSBF/mAGdGiWJidSGntODCuEfbB48xF?=
 =?us-ascii?Q?q7rR3Yn0JLXzo3V9wWOKQvQlU2QqjRJ4y3QCirL/5GgwVKvT3ZGXVVLbNR80?=
 =?us-ascii?Q?1hz0Gr7koD2LILTlBMWGEiWYDSaG/K6Euleb1r9P7cBwxkHJ0sGzxaPjjmTC?=
 =?us-ascii?Q?t29KbzfrgUopkhlSXJC7m/dPj2jiGg35VQj5gL2xMbdaru9fcW/IP/N+HSmS?=
 =?us-ascii?Q?BZsHelVWK7tTGCDlYnNP1YRBk79q5c+XoKKKfsvMdY/NRZ2rX45and9U26l9?=
 =?us-ascii?Q?qejfWHPsTQZ9SOQKFbzNIRqeCZ7j95haEhn/3I7zBUjPFSKo4WAFet4Oaimq?=
 =?us-ascii?Q?SfCSKWi6mPEyNnf+bFQMCg9mA1otNcXux1BUUbeN6CPAc4vkYu5rBBs3QFQe?=
 =?us-ascii?Q?5XENhXX7BV0fn8JFOL0At/Bi9VuXDPENFM0Q/TuII2oD+8pXwKmfiw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB10396.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LZETnTViR49oNawpsG5Ttm+z8MeWHFljvWSzkPk1TjKgOnJlLgHt1ElZ3iKL?=
 =?us-ascii?Q?ydTl7ZFsSVIgdp7wmh1zwWqCiDRHrPtatTFlN//IQeFrniVn92EGxxEQxtpU?=
 =?us-ascii?Q?2UErAxJM30wkIl0PA9e+k0jX4HcgFpP/POC3P61AA0QDXTfldrYzw6/SM3fT?=
 =?us-ascii?Q?4fSXaoH/DaAtr/vhsUpXFNgv0r7pthC6Z3o5JxiG8Zk+c9mW3KEHuQzE5UnT?=
 =?us-ascii?Q?90BYEl8qj3cOIXpIrns6aFO5wHJFDMI2oRaTGYBuyL79uIFFbJxQlgGgUbM3?=
 =?us-ascii?Q?JafLaF2aF8PzqvMOgnSNdevVUE4hlXIPuhup9kNPr5xYj1ggAfhkhOJdsohn?=
 =?us-ascii?Q?ffRcDfJ8x89zI+v1L3YAqmPD/kcQOIYhK78x1UD4svDGGR8Ft3JNumdiKGMg?=
 =?us-ascii?Q?u/YrIQEhZDSFsmv5pX1fL9m+blR5XoXcQMF/8fNrCMJrACOWLG/FJtbaN18Z?=
 =?us-ascii?Q?tEpYFAzIvfPsrryEmP9AcIyUnnhdvL2ahWNpmWEmyAieuEK2YhAHChcGU98R?=
 =?us-ascii?Q?JPi2l7gYg99iqrVHnrpS3/xnd9wuqtLEwa6Y9mJO8qa9mwozlSf9ODOSpFFV?=
 =?us-ascii?Q?0eCLaXiAcFEg8kSwKHdGDaid/17VzP07kbmlRa8wqnz0mEJyX7M94uOyxGCH?=
 =?us-ascii?Q?M+1nB3u1/C49SuIBT/E2SmqdRBzhpLxIjrEJHa5EVrPMh4hcjaxTiOoyv94d?=
 =?us-ascii?Q?xKxFsv8w1RkSDCxqi4LsfHdcIVENRIRi5oIGqx4S2gr2vwNJSDRw5eintVui?=
 =?us-ascii?Q?LB23fCa+eakE64I4RfIQ3rf/fNL22Dd+xF8p0JWBuAqv/zCwc1Y2C1bcLbPk?=
 =?us-ascii?Q?LyfFug3kPKyKmZ9yN8zE4RTrVedhWsRUIzaUWScNWGRIh1UxqForPQpbYrIm?=
 =?us-ascii?Q?TIUYS31C+YzhIt0qPGeJ1iaGyG8qy/woAyhdx6zySr8N9Q2Nlzohhh496sfm?=
 =?us-ascii?Q?taKkvFQs8UpTu7ZhBeQnwu8vWyJyT3hPSWFkXyJqXEd8ZxE/oH0eTNv8m8bT?=
 =?us-ascii?Q?LOQXk1h5eZPBQvq+4fuGk4IZWuj0Wu1Fl5QLo8eOUUAfVZWj3Qh/gfrG8C4Q?=
 =?us-ascii?Q?Ck1libBzNKcXupxgmCFJrz1viq7jSTbqROH5xJk1VdyMhvWPXDJgUY2a3ByI?=
 =?us-ascii?Q?4Qavh1WnlVTGVKu674oHjQVpTVFhSxYOymvLhLuJGs+5Grd2cxGtc3jNLONd?=
 =?us-ascii?Q?nCDuNk6fggMtzyQrKswAC24ztUWDbwZlBiLmlqetLj9DHMsG+bszWAFL8f7U?=
 =?us-ascii?Q?AAv60JQyRkaV5fX3UsW5hrfPkWp72TxrfoubnMORWJ1v8pYzkqPE5vyobDw1?=
 =?us-ascii?Q?T5JW5iUo6G5d1oz69HIz1iWdlUqLlbfZ6b3YcXxba3so9PgE4eMwMNecwR1o?=
 =?us-ascii?Q?NDXJtnBKtzsOMJV+Q9NAMeFYGrrF7pcHs2ZhOVTuHhzt+JN0769+z42tyfj0?=
 =?us-ascii?Q?cdVIDnkF/4hwT7e9TenTTFstSFE2yTl6EO17UdFNtoNTq8ewA7ATYL6OLVZ2?=
 =?us-ascii?Q?vygo4mbef+16qV+WZ2N0ytj2c8apDISkYWDSy7Zv1U3bEoeu3X8/rJkwRQB+?=
 =?us-ascii?Q?dsnKERMhcs+C8sIJd2/a/JPyU/PBGK3EemVXeU3C?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 543faa17-f7ba-4700-df12-08dd993dfbba
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB10396.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 14:36:05.3363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bV2yf+wCx+ayLMuJsGiq2gkPhcdumD7lJcCk8mZO81wmpR8jWQ+oTYufWXatFxqhBgOwYYWDwjpqqxryE4kncA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9912
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_073608_618112_49F318F3 
X-CRM114-Status: GOOD (  16.03  )
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

The current implementation does not apply changes to the V4L2 controls
HFLIP & VFLIP of the sensor immediately if the sensor is in streaming
state. The user has to stop and restart the stream for the changes to be
applied.

Issue a CONFIG_CHANGE when the V4L2 controls HFLIP or VFLIP are set if the
sensor is in streaming state to apply the change immediately.

Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
---
 drivers/media/i2c/mt9m114.c | 43 +++++++++++++++++++++++++------------
 1 file changed, 29 insertions(+), 14 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index 6c80c6926aef..7d39978835fe 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -399,6 +399,11 @@ struct mt9m114 {
 		struct v4l2_ctrl *gain;
 		struct v4l2_ctrl *hblank;
 		struct v4l2_ctrl *vblank;
+		struct {
+			/* horizonal / vertical flip cluster */
+			struct v4l2_ctrl *hflip;
+			struct v4l2_ctrl *vflip;
+		};
 	} pa;
 
 	/* Image Flow Processor */
@@ -1059,6 +1064,7 @@ static int mt9m114_pa_s_ctrl(struct v4l2_ctrl *ctrl)
 	struct v4l2_subdev_state *state;
 	int ret = 0;
 	u64 mask;
+	u64 val;
 
 	/* V4L2 controls values are applied only when power is up. */
 	if (!pm_runtime_get_if_in_use(&sensor->client->dev))
@@ -1095,17 +1101,25 @@ static int mt9m114_pa_s_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 
 	case V4L2_CID_HFLIP:
-		mask = MT9M114_CAM_SENSOR_CONTROL_HORZ_MIRROR_EN;
+		mask = MT9M114_CAM_SENSOR_CONTROL_HORZ_MIRROR_EN |
+		       MT9M114_CAM_SENSOR_CONTROL_VERT_FLIP_EN;
+		val = (sensor->pa.hflip->val ?
+		       MT9M114_CAM_SENSOR_CONTROL_HORZ_MIRROR_EN : 0) &
+		      (sensor->pa.vflip->val ?
+		       MT9M114_CAM_SENSOR_CONTROL_VERT_FLIP_EN : 0);
 		ret = cci_update_bits(sensor->regmap,
 				      MT9M114_CAM_SENSOR_CONTROL_READ_MODE,
-				      mask, ctrl->val ? mask : 0, NULL);
-		break;
+				      mask, val, NULL);
+		/*
+		 * A Config-Change needs to be issued for the change to take
+		 * effect. If we're not streaming ignore this, the change will
+		 * be applied when the stream is started.
+		 */
+		if (ret || !sensor->streaming)
+			break;
 
-	case V4L2_CID_VFLIP:
-		mask = MT9M114_CAM_SENSOR_CONTROL_VERT_FLIP_EN;
-		ret = cci_update_bits(sensor->regmap,
-				      MT9M114_CAM_SENSOR_CONTROL_READ_MODE,
-				      mask, ctrl->val ? mask : 0, NULL);
+		ret = mt9m114_set_state(sensor,
+					MT9M114_SYS_STATE_ENTER_CONFIG_CHANGE);
 		break;
 
 	default:
@@ -1406,12 +1420,13 @@ static int mt9m114_pa_init(struct mt9m114 *sensor)
 			  sensor->pixrate, sensor->pixrate, 1,
 			  sensor->pixrate);
 
-	v4l2_ctrl_new_std(hdl, &mt9m114_pa_ctrl_ops,
-			  V4L2_CID_HFLIP,
-			  0, 1, 1, 0);
-	v4l2_ctrl_new_std(hdl, &mt9m114_pa_ctrl_ops,
-			  V4L2_CID_VFLIP,
-			  0, 1, 1, 0);
+	sensor->pa.hflip = v4l2_ctrl_new_std(hdl, &mt9m114_pa_ctrl_ops,
+					     V4L2_CID_HFLIP,
+					     0, 1, 1, 0);
+	sensor->pa.vflip = v4l2_ctrl_new_std(hdl, &mt9m114_pa_ctrl_ops,
+					     V4L2_CID_VFLIP,
+					     0, 1, 1, 0);
+	v4l2_ctrl_cluster(2, &sensor->pa.hflip);
 
 	if (hdl->error) {
 		ret = hdl->error;
-- 
2.34.1


