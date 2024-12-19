Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C281E7718A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 01:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=leHgdd5BR8ndLLckZQqMwgDDbkR8i1YWTVH/tazIYxA=; b=Yqy5Gx7MgnalEZh2bkRGCjzW4t
	pVw+Zge59I/pSPIpeFoQo4MiChoIjpvp1v5R3kGJ82ROxZl5A6XaYkxZ09/TD+KqyWEk0pQYd91gM
	tTMt2umtrtjLvPfi2iS8EBpkWVcBSUEyEOWAefONNsmlfChgiEV9MmdVueAW43kQLdrqwyREew5Q2
	j3xl+1A04ayyeSDcZfIBxoQn+SPocxlw04guw/s7En70XeXgY8Nb1NYSOV+1GGRYbDuxBMu0zVPaK
	mHo/X5uRKkmt+2oXhbQF1K5Nh8BpWt8fKX+1cnAQd7rfmneNUogUayIdvP21+E1vRjmRchwfCLOxv
	mfJQyRyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tO5jD-00000000Y2y-2xPw;
	Thu, 19 Dec 2024 01:53:27 +0000
Received: from mail-am0eur02on2061a.outbound.protection.outlook.com ([2a01:111:f403:2606::61a] helo=EUR02-AM0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tO5i6-00000000Xtb-0S7X
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 01:52:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tx6ExbbHV8k3i0fvCGuk3Y/F9uspWLw1Z1nGmomqZcCbVnbKTTTQNdQlYT6xMuIQAXgO2h3lUXnEoIsuaBDv4FxnbdS1mAg6zOdgUUT8zD0+KT5U7aFlyenORbRKg9G1YKfhqNYXshoOMikO+zR7YWDB3jXILyDkq6TLrw/AwyRM3gmPk3gN68efTysnXyunN5akQnlCt9tXxaP6QBhBQsE8HKD0WNr9JOYBvAs1Q0CFaaCAbId2iTQpnd/YvRtIpwfEb9L8Qspdsp59lK70uR5Hicab7CyGoPK/UuXImZSmvTErLqXSeWGzC6FaAJsTKDTXRP4Lb4jIBx7TgnhWiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=leHgdd5BR8ndLLckZQqMwgDDbkR8i1YWTVH/tazIYxA=;
 b=JabE3B2oqt9vGYTWLgWSBamWgJqZrto/F54aPfEW/NlihSxeFFojEJAOHYrSgIK40h6PIq9Hf02pPydpcM9YjUkUmMR/BFWI+rWTW5ulCcjUyDOsb/GLYFSnYZanZ5pOahrwY0dhy7tRYx8jIr7MnXYIYkUcCivR9BC2jTFLIjiIkruDuZqd8aw1Xh/cXD0zAVq3FHOa9Yk504FlwnQNmtWD0ghOx5Sk5+K9WKx08Jh9PwcwdtL0XwYwMloI93dCtPbzEjqO6dk0IW41Swlb7xXutu8qoSVeJiNWMzEoDtygsF/G4Hg01Vl/blKhcbxpxS/VFCpSHecISiSOrKGNeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=leHgdd5BR8ndLLckZQqMwgDDbkR8i1YWTVH/tazIYxA=;
 b=e51awLI100+0uWWy9xA1X3ze2DdxRLcp37Si34i2k9aHUN5PE6v96DzdZ2Xk9/bAP/x/RnJUGl3TZ49erBdpRn8vwLhRJ6FGMG2IidQPWvWcX+QQ2fH0veq2clM6e4SKztNLTjzP84Jdnqw5PQc7Iv58GSZg46HTJbDLqjKKvlS4LOfqNvEuRXjViax4QYvIf43Uq/E0QT8JwWC26HbxJsejLHSqjC0F+JQK446C+EpHJgQdFBxuhcfHLQ63Mxgxx+Wkgjs3++Bkm2HS4bZOb3/QnOD81HXhHU5FlkTqnos7z1Kzp54a5bz+IsbzKX4XaTBGKi3Ph6dKVUTHL5kNSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by DBAPR04MB7270.eurprd04.prod.outlook.com (2603:10a6:10:1af::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 01:52:11 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%6]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 01:52:11 +0000
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
Subject: [PATCH 1/2] media: amphion: Support display delay for Hevc format
Date: Thu, 19 Dec 2024 10:51:45 +0900
Message-ID: <20241219015146.706482-1-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.43.0-rc1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0074.apcprd02.prod.outlook.com
 (2603:1096:4:90::14) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|DBAPR04MB7270:EE_
X-MS-Office365-Filtering-Correlation-Id: bb9c9200-daa3-4ff0-15a5-08dd1fcfc0e6
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fFfE5qvXhxjwOKBdzt2dNfvQ/RhPIQM8ODTIqmdpopd6thJbJ8bpBabVPOwV?=
 =?us-ascii?Q?l1j0BmDdQvxE/iFChosIrIHyD3D4DnOZtumEJkWRvkzxnbfGbtKWjQzbtp/4?=
 =?us-ascii?Q?yAEFPiI1RRLUf7yx7JJ+ND/l5iOp7TW/VjDSW7nTaI/O2i2XwUxlZGqd80kN?=
 =?us-ascii?Q?eJu8Yuz/YCOTUPCYH/iqswVcK87KIUWcm5LkyOumgnPUu8IWWNARehh324Up?=
 =?us-ascii?Q?sdiy66ZB6IizQejFMHOHeKkA+ajgNwHtXVO1sIT6MANNTOJMbetTBOo4jIN/?=
 =?us-ascii?Q?8Z5MIIGBhRmXiVq214O2jsqJwdSks74i1hY2zNVXlcZSZGlM7ywWc0Mjwh30?=
 =?us-ascii?Q?ECcT5i0+mKjZcyrIKlGYAum//IYy0x5+to3CEgWrvwZAmbyphNJ0218adzSU?=
 =?us-ascii?Q?X9wgI6D5VZ9c1xC414hqI5oX1dBhOzxFU7lOWpiGClKOUd+HVidJfJteH0mA?=
 =?us-ascii?Q?mxJBdG6K1bbEKpmJU+BOmp7W/YcS7X2GQd3XAF4feEXRu9bv1XhtUuGSQ6GZ?=
 =?us-ascii?Q?HXQ5xtnZuHp7cRoQoG2rkKQgze4N/GPV8oyftVF08qbxeV7W05fwzHsE3mRo?=
 =?us-ascii?Q?BgG/knjMWMJ8UdM/mEg4EIKnZJzBxkkjVNbw0UFkjG+RW9nJ1YjjBtOjfixq?=
 =?us-ascii?Q?eJUiWRoDzQTswzPcqGdW/PG8nTnHql/8eyHrrwfoBoNjJMNncJsm+qT3+qVs?=
 =?us-ascii?Q?yocPoP7C3pA0nHOZqAEUgUOLmeE25gyHpbkUtzkqJ3BnevgYqv+XKYoHM73Z?=
 =?us-ascii?Q?ZxDnCEBRYJcONeFNm5n1krCeLRHHl+eSXTcf5ahoiYUSTgihO5tkflvXi5Jz?=
 =?us-ascii?Q?jzE58VaD+GdgobBbdEOLpLhxiY/RQNLj1s/+7Hf5ZyW4joLmE2MPgjI1rnYj?=
 =?us-ascii?Q?resaByDM3lME/a44HN1DTiSyQZQFjIOCRHkafJ8cXyaR0URUsiGtQkzQILBp?=
 =?us-ascii?Q?t8b8PZu+CVc0YNe34pEzjpWYu/FAswGVmoMLhBg4iRqdIJKwxNGHYp51WiHa?=
 =?us-ascii?Q?Lqpxv4zPZs+L6QhZDenW3Kg0+tpXmNilpWmOjY8Gey/nJHWg7WJrF63LO0QH?=
 =?us-ascii?Q?ErFhXK+MqNvhaQu5UD2cZig9qn4EF2+djo4kNn4fFFVLSA+uyjGGBpLWugmY?=
 =?us-ascii?Q?B4gn5u1NF5+Z7+3lgeteJX/B+yM80kRQLK/diSRbSQybW9QaoYH+9gyCuQRY?=
 =?us-ascii?Q?Zl/7FdLegfa5YTmF07AVwo0+esSvqiUTvJZTs/iqfB8/hC+ccJ2Ub1qdtJDI?=
 =?us-ascii?Q?P/X+0vYT2K5jaYz9SUmy3kb9IpDbiMkDVvr1AtvowbgvdQ7sL/700QiZCBXi?=
 =?us-ascii?Q?bk97kUrpxQk+1S0YX+HOVvy6am+ZZvfzdlSX27uGB/pixfMzmimIOMG+nMNX?=
 =?us-ascii?Q?OqVHsLu5pVtg6pXCQycs2z64Dv9/vULASedWeYWU6yKBk5aUunACFv3zaS9k?=
 =?us-ascii?Q?SDjLSugoPNawX5lsuitTFNS73W5Ueuh/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lBKfAjn3NbE1y01SqekM9+lu4SMM6cYU0kAvpCgwOH//ULpsjdUu0oMsIipX?=
 =?us-ascii?Q?MZl+h2SJ29CNuiQSK6isjx1b0kgJaqyzXYZ++DlkssJsLoQMWqm3GCBmSWAM?=
 =?us-ascii?Q?kMiWZ+lXzuobuMBdjwQST5jkN3uFn6cd1oOWmK6FhOKPrTuSFzGpKOaexwlw?=
 =?us-ascii?Q?d10gXF/Ohigi+BZPcBcIYHzMJoxRbQ7CH0EtiGb2OhwgkvAdjyOqLE186Vh3?=
 =?us-ascii?Q?fea1UlIwLsuXlblmZk6RtXU23qY+CfJ18vrVWGVjAGnnEtGBWK+lVxmHob+2?=
 =?us-ascii?Q?DLb6nku1gogW4iGNNUzfQ1yyYcu6zs9/V6tVsWOPXkuUw1xDL13aYWZFmM3l?=
 =?us-ascii?Q?Ns9B9mq+G4wQ/qHeu/Tb10l1Z+AfDySEsVUnXR5cnzfNKw2znPgww4JEjlN/?=
 =?us-ascii?Q?1JpPWHm1sY0gzkPI0x+Dac56vgELaB9OJ+XpGUQJW5dD0lRu6+wvz2lJlbQb?=
 =?us-ascii?Q?ivUuQQ+MrFk0Gji8RORfiXhpQUMjyWbQSYWmWX8EqQl6MhBUkxnLmHsnshNG?=
 =?us-ascii?Q?pdAV0ICepjSB6Z6kIjaOSnOAqlsOIwI/skWBXB2mFvk2pMVDvGb6EM2Vwvp4?=
 =?us-ascii?Q?ZT3t3EoVNrJsEO0VpKGx5kpklwbmDrIZqWwBj6dN/837ddsUnJLh24hRI8sa?=
 =?us-ascii?Q?vWydcBREPU9H7wMDv5Tde2yjjpGUaRB1rWEj4GMdc6gQahfxTEy7kG+EnrHm?=
 =?us-ascii?Q?4r8jg3TXDndAIJOBVDTY+AehsRnEWGduudYHlBgQJJ4b36mvqYEAqG0MGR1I?=
 =?us-ascii?Q?rNRa7VKEwspS0qkcgJ+gGYSo1oeMP2xyS46L94QvBXk8zb67Z02NQjNmr9bb?=
 =?us-ascii?Q?K20X4aWQlYPQRU3iig3ZouMsudwz5jsOxHugYh/5r7Tbwpw/Qp8LmocQ+C7K?=
 =?us-ascii?Q?GKwxtlNid3E4hzNwb8qBlhbEE5V1/1fuz6kL0HPpIl02sVi0iZlyjdHYeYfS?=
 =?us-ascii?Q?F/EtkFoQZzWL2lP+8EXzJ8kjIFSZol66GXXJQtsd0MDLVDi91SeD+H0PHA6Y?=
 =?us-ascii?Q?lCeonRegRqBOY5/EJGAymrbjEezejaWm5YGZdW9/aoLlBIdw/SgnogsyAO4l?=
 =?us-ascii?Q?BPdRSLurmpE0KfIRgBJKvTFZ3/eHU4qPwTvFw62slfOsJYKQFydYlgfEV5+T?=
 =?us-ascii?Q?97V3aMHgsXWZYgWG+0lTuSTDJyd471O7Vy+s3oWvzQ47BvlOXnQKiGZjX4ST?=
 =?us-ascii?Q?v59ISHILf0SRbU4mxjDJ+pbif0UPSteVGl4PMgelZqw9THWWqGZLO3DxHQys?=
 =?us-ascii?Q?TKPgTe5e1wMzahofAqlBQ4nwaOC9f2nq5cmQbuipkNDFnIhJEt8YE+SHBa08?=
 =?us-ascii?Q?IHC02pvVZpeGTp+suBDaTG+A3SlZ9CjQd7thc2J2rOw4b7FvEMALr/PTc4sm?=
 =?us-ascii?Q?/9bncfIvYe4CQRLqbmaoSikd7OjALCOfAjPul1MmvwBJ3Nfe+l3OegrtRNVP?=
 =?us-ascii?Q?Jmjy9Kts9L9DGLlvZZJON5JoBr/Z/CqCfFv6vXXqmbPDp3sDU8y3hAkIdNOs?=
 =?us-ascii?Q?ea+tqxvacO7mLS13iRi0Q8ip+ithjeXQ9pMs+QXY0WtYWmlyc4T+7lUCm3IY?=
 =?us-ascii?Q?6Q8QsRqqPL4uoH3mLvT2DD6T1nSnn/tKj4UI7kzE?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb9c9200-daa3-4ff0-15a5-08dd1fcfc0e6
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 01:52:11.3937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8aBI5RX6s5QNdrKpxL3NgO2LXgWnFJkpZUEkalmfgrtCvP9uLkH60KKhCABYf/k9HQNg2PIFAmhwlomBmgq2lA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7270
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_175218_155999_49AC4735 
X-CRM114-Status: GOOD (  13.77  )
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

The amphion decoder firmware v1.9.0 supports display delay 0 for
hevc format, then driver can enable this feature.

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
 drivers/media/platform/amphion/vpu_malone.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/amphion/vpu_malone.c b/drivers/media/platform/amphion/vpu_malone.c
index 5c6b2a841b6f..8f4aa48b2d65 100644
--- a/drivers/media/platform/amphion/vpu_malone.c
+++ b/drivers/media/platform/amphion/vpu_malone.c
@@ -332,6 +332,8 @@ struct vpu_dec_ctrl {
 	u32 buf_addr[VID_API_NUM_STREAMS];
 };
 
+static const struct malone_padding_scode *get_padding_scode(u32 type, u32 fmt);
+
 u32 vpu_malone_get_data_size(void)
 {
 	return sizeof(struct vpu_dec_ctrl);
@@ -654,8 +656,10 @@ static int vpu_malone_set_params(struct vpu_shared_addr *shared,
 		hc->jpg[instance].jpg_mjpeg_interlaced = 0;
 	}
 
-	hc->codec_param[instance].disp_imm = params->display_delay_enable ? 1 : 0;
-	if (malone_format != MALONE_FMT_AVC)
+	if (params->display_delay_enable &&
+	    get_padding_scode(SCODE_PADDING_BUFFLUSH, params->codec_format))
+		hc->codec_param[instance].disp_imm = 1;
+	else
 		hc->codec_param[instance].disp_imm = 0;
 	hc->codec_param[instance].dbglog_enable = 0;
 	iface->dbglog_desc.level = 0;
@@ -1024,6 +1028,7 @@ static const struct malone_padding_scode padding_scodes[] = {
 	{SCODE_PADDING_EOS,      V4L2_PIX_FMT_JPEG,        {0x0, 0x0}},
 	{SCODE_PADDING_BUFFLUSH, V4L2_PIX_FMT_H264,        {0x15010000, 0x0}},
 	{SCODE_PADDING_BUFFLUSH, V4L2_PIX_FMT_H264_MVC,    {0x15010000, 0x0}},
+	{SCODE_PADDING_BUFFLUSH, V4L2_PIX_FMT_HEVC,        {0x3e010000, 0x20}},
 };
 
 static const struct malone_padding_scode padding_scode_dft = {0x0, 0x0};
@@ -1058,8 +1063,11 @@ static int vpu_malone_add_padding_scode(struct vpu_buffer *stream_buffer,
 	int ret;
 
 	ps = get_padding_scode(scode_type, pixelformat);
-	if (!ps)
+	if (!ps) {
+		if (scode_type == SCODE_PADDING_BUFFLUSH)
+			return 0;
 		return -EINVAL;
+	}
 
 	wptr = readl(&str_buf->wptr);
 	if (wptr < stream_buffer->phys || wptr > stream_buffer->phys + stream_buffer->length)
-- 
2.43.0-rc1


