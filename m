Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A8D9C02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 08:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WGg0pPkgSkpCmF7v6yR2DYkMkIR6Fot5aiOCBKpV/jg=; b=Fmx9l08wDp+Dj/W074si73Vf94
	j5rVY2S1WRsZAgXic+TNVzaJ4F5uRuRjzQ/6cneq+Fh/QEtFvUqxx8Mq7rLMxLJ0hBhs4Glv9Rw/T
	645ZkK9KCUWdIr6xpGZGbYjksHMm8nWR01bacMthsBQ0tllMwk8PacgCUBTemVm6Z5sg3gZW4+r8T
	EB/6F0ZX7jC3EvldkbFFaxY02Id0XavsItmjmu3DYEn6XoOxQiqfXNDrvj5pZsLjqJ9rGKFh1Xgb9
	LUH+fvIeh2ZiIkvG0JuhQL24an6l0l1uXNHunVORAtvIZv+mhAzjKvhy7qjGaqPnMOTSPZqMuhMBZ
	XaqmNCKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYhIO-0000000HGyo-1fwb;
	Fri, 17 Jan 2025 08:01:36 +0000
Received: from mail-northeuropeazlp170130004.outbound.protection.outlook.com ([2a01:111:f403:c200::4] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYhEy-0000000HGQW-0sy7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 07:58:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WT99t7PPDWZf5Lz1Myg0xc4leAPPKf0O0Ytq+LxSk78A96DLBhzflm3wL7lw/r3tJkeFaxsFPhR7m9rLXxLbocD8JTZxmaI5L/egyFMujY9Zcs3O1fIbtSTnnZrb8upJSIgM+TmZziQnCMzRikiNtBvUIj97IkUaG9zrPPP5yD5XwUKJNlkYSF/8+dMKrejiPLm91eRF7TktjHPSW1lJLmn2QmzUyxfrLDv/fuYS7vmRT1aXtTu+N8/pVlD0h+NZdTBRKfE4nFsCEqeg41WRzt6gB13GoZccy1a0l/nSmQl6X9z8MMs5kjFUvcueo6ZW6E2YErSDVH2lFHHKZLIryw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WGg0pPkgSkpCmF7v6yR2DYkMkIR6Fot5aiOCBKpV/jg=;
 b=kF10COgrI/1EvpumBN5GOTgBDEwgJEpNUQ4C5J0dwhezWQus8p1iB1UslBBAakFYLpbNk+ijIWlC0aUoMosa9Jo7gDTUNkdrrq9i0+hU4ZH4p4cFwP+6Sgo/H47rETc0rULTEJ8HylwKc5Izag9z9iZ+LkPn0EvPU4SJlCPDfBQzKVXHTPjeKJPGKEFaHL+pI2sqEmyiMnisji34pgOFPOYpkeztbPkW/HbXun8mbFPSCnnZafVNCHln5rdZStb/hBQgq55eidn9NFhmFa1iDRO3UtwnIcLE4lKKxpecUx43994rLBa0vRVXKlqALL9venYEvUrJW4MLZGbHa5cGKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WGg0pPkgSkpCmF7v6yR2DYkMkIR6Fot5aiOCBKpV/jg=;
 b=uoCkmc10VbzgA6f6yDISbXxch2CU8XA+ID4mBoPgGzNgS0STkLVlL+WGWQl8St6ppHUvaNOLzaqYjt+ZetQvtzkeepi7c84r5R18xS68F8wYfbPCoKTNIjHS3+JWeFJLE0LxtUb2Ot1ZY1faeWmxMEruPOU/hMbwnlLyzNUXbwAMzz3Tlu8SbVAKQMpmq5fNR20MsMgC+k5SCouECIR+1at1XjC9t7LYFcZojsTNnIcqitfo8Lr8BJfZ0De3QVMHNMS6F2OOIL5leos3SHMAHkYhK9uIbImOmg578m462zRfX8ahNrXjpJjiJIJ7DVL5aTI8dKjJZ08ni4e17fXNqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by DB8PR04MB7115.eurprd04.prod.outlook.com (2603:10a6:10:128::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.14; Fri, 17 Jan
 2025 07:58:01 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%6]) with mapi id 15.20.8356.014; Fri, 17 Jan 2025
 07:58:01 +0000
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
Subject: [PATCH v2 2/2] media: amphion: Add a frame flush mode for decoder
Date: Fri, 17 Jan 2025 16:57:20 +0900
Message-ID: <20250117075720.4018076-2-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.43.0-rc1
In-Reply-To: <20250117075720.4018076-1-ming.qian@oss.nxp.com>
References: <20250117075720.4018076-1-ming.qian@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0016.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::17) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|DB8PR04MB7115:EE_
X-MS-Office365-Filtering-Correlation-Id: cc0c9295-3d4c-49d3-c336-08dd36ccaa1e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Zb5c2IMZ2ljom9zof+Zo2uXuAh7fbI+jFSeiuZmmNoODBwDhNym4g99eFwo8?=
 =?us-ascii?Q?UlJeKsWa4XL0v/JjGoV/r9WitGCkcvLGc4gXVtMI/qufSKt+aEeDV9vdugWn?=
 =?us-ascii?Q?T9pL7ajsdB9bb9a+gjJRCg0DYdm9GNakGAr7ez+rJu6c0Ewl63Rm4hbglwYr?=
 =?us-ascii?Q?t63SkDfhi0D0DyB57oJgJ/ERBpCM7Q/mOlKxo/8rAKwm86IYt5ei8FtfRDMe?=
 =?us-ascii?Q?dkrfKMTqwxjeN/aPq79T6tPVem9MY7w1lm5QZ5ADxlbW6vLd5cUFAe8Fv5sM?=
 =?us-ascii?Q?6CDDbkbUpbLVmnCIEI8/fKoB11eKYvxLc16Givu7OQLTouSnaiiJsIJpBG4l?=
 =?us-ascii?Q?WLUla0XXU3I+26C/4ZgEGCWsohsuCbfPdP+66JUfdQPv/w7jidXYu2CJ5vB9?=
 =?us-ascii?Q?NG/Oq8t+OrkWDOnm7T3KA+NETEdFucjX/CMpETe/VT6DFhfGQ2YXefv+Gfc7?=
 =?us-ascii?Q?J2LNuFBy3uyUVz8VOOGLASWKRtgn7hswAv6lMV4hXZxosmZY7oTtDYgToKvp?=
 =?us-ascii?Q?bC1YE+41xP/7o5n9FrTVyvRdXdNU5anf6LZX9HN3ANh+2UkF5goMY9S6Lic+?=
 =?us-ascii?Q?6LFLwLYnTnxsWNNcYXDe7K8bw6lbL3/nKmxrPZLlVv0c+q6WlBfwgP/CycKc?=
 =?us-ascii?Q?EG2g4WG7c4fSFD2oJre48YZrSnG5iA12N5lJ5cjYencJVxtF95nMm3VySfce?=
 =?us-ascii?Q?+pCRVcUo/nSVGU+2AocH44/Zp0721YgMGxuqjQ5kOYBfSWBG5n+/Idc4tmM9?=
 =?us-ascii?Q?rMgsiJxDJZfImUf7526aOfFRGghUxPBH6afmsQRL2kvhd5axGa+V7HLY3Cz1?=
 =?us-ascii?Q?S5tnQjCySRICUHeEOr4gQTvWX8ejZN74EWEcpdZQJaYH6YtG0gw9SaxCFHK3?=
 =?us-ascii?Q?9FeTMTq0gBNDpz3/K1tkI29oEqVKESOOUtIed/qpZEt8fmmghaCUTouC5JiE?=
 =?us-ascii?Q?Ux0wRHlEwZzjB0ZPZ3xlq29m4hYmT9NE1cNsTs5Q6bRtjbM8q/sMZHEm4Ex5?=
 =?us-ascii?Q?vBOIp66L2U2MV+2hSuyl/zPpmXxfBVB0/1SXpnN6mzF8j79AdWJz6fh1N9Vd?=
 =?us-ascii?Q?Lzu7/KWl0lvDMwr8ojcPykYolnvPsjOkaLfweKzheJ5u3gi6N2wieZj+0v1Q?=
 =?us-ascii?Q?pvEeWOuPyBtcZnl7B+l7kN49f/5niOfHDhwJNLKPBBw27c8m1Bh5bK3dp0XI?=
 =?us-ascii?Q?dbD3wFdefzGDtQIS7iMD2AGolpjihMa3mL1m99RNLG8Ef9frBgyVrWTBqDwH?=
 =?us-ascii?Q?CGO/Qed7kNv2/hT718z9/7NWHarWLMA9+ncQIHII4m5hvtIzDEFlw9B0358r?=
 =?us-ascii?Q?v5qdX7oUvL1mbVasl4yyXGruIFMIvs+uz8hMyeZ2Msn9P3bas77LEBF0AN8P?=
 =?us-ascii?Q?SDG662wjt5JZagESgKstSAy3iE70imlHdPp9dVQhYrBkpM5gAnQXDYX4+MJ7?=
 =?us-ascii?Q?HIjZgW1SeGOvNXkhJkJ2+nXLjHN4fVhG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3MsmHpXvRfmWRi65SORsqlVG9sho9fvVEy7VTZYNErQMnqn8j/mzKvslncXb?=
 =?us-ascii?Q?BKzxD2AE+RhSh4MFEZ5Mu5Sma/x5esrsasVoq0Z56app2ExhpyrKLAT9hF16?=
 =?us-ascii?Q?ivbPPlr/e/2s9toQJXDsNKcIXwr98Af4Rv9qY6i0VkhmEZATKWY1sSUBxy60?=
 =?us-ascii?Q?6SirmORWrCHZ6qKp8gF8t/2+hxVRFWFW4wfffqMITScvS4i7cQ0iItqvf60K?=
 =?us-ascii?Q?jF6OrpZLBjNZoMjvbAarHwEFtj5+qYisEVIEasat2w32OmX14tkbUrQOLnKM?=
 =?us-ascii?Q?36scUqRsh2YT5MgCSUULJYu23bFBpOKZe737oUPeUwQZ4EvFID8zK0mK2Itc?=
 =?us-ascii?Q?9nWFrmLfD9rJyzT8++hxMoi+hjhfCRpfe+0csbqQOAmsDczGC6bHuA6TEpYe?=
 =?us-ascii?Q?XTxEkBz4uYUYkvN9jKJCAMOMV4duC1Jaq0SzqztG/4c0ztsQIsstzAu7Unf5?=
 =?us-ascii?Q?ZU1b1AP8Rp+m07igCnISUJQ4CMnj7X9aV6XGIh3Pu9hNi+ZqOv8JHc2sbdcs?=
 =?us-ascii?Q?c9PjKSgbEX962whIxBK6IPiTOLQ6lrMf6Mx1yQV8w3WXcFDknVb0e5n8sunX?=
 =?us-ascii?Q?de/uyZNOWCdN8M5VL/FSfb8WYkpr28OKMHWm4tHVGbckMU2YPyODLv3MWcpH?=
 =?us-ascii?Q?eE4ttZIJkH/srZikRTejb3jax6lXTY8ey++g/11dBOcuBnf44QvqHItiYsSu?=
 =?us-ascii?Q?mVsCN5o6umbfO/jFCjaHYPexWsra2+6MMFUjKhT3aBqtApUahpffLtb46ySC?=
 =?us-ascii?Q?KVVk/qRgxTiftmFboJRbSVV9trarrssmttZjw6Y/bP16SaHR9f0x5vOldE/Y?=
 =?us-ascii?Q?d1ppW1K9G+PBQyZlVIn3fsssf0krlv+yv+GlWVFeML0xJmAnqjlMHNueSJ/i?=
 =?us-ascii?Q?EzGKBJI6E9U/uXZ5WBjDAtkBqmtDsuYE61pcY9qb5UkyZgyYvKMpiPpKnY+K?=
 =?us-ascii?Q?vbtWOX3RAHjzFtEeZmQ+plfQEYwBjPwiwbXfYypWO6+IVypgyRYqiKdRuXM3?=
 =?us-ascii?Q?QNffflkkE+/xGpART2FEIqr8FcDTfmCbBZEoTZPNjOlJ+r+ltYq/rYVZLk8t?=
 =?us-ascii?Q?qaguGhYR5VkcI7uXZgD5YBFHkCZWrdWGnyz2QGDX05IsyH5dBL2JIU8SufI6?=
 =?us-ascii?Q?OCu32HoTP/5B4b+PR7FguWTkhcm3qP4tBQ7kre8BK6NQr/vOXRbMFPcS+D36?=
 =?us-ascii?Q?opAo4htCaGgYDoaz8LUa8e4Oi+Sz6B4sUn3tdT+X9GJ+McTw+N64vcK5B5PB?=
 =?us-ascii?Q?/LXBgoIsU8Xh7I+37po2n/kuOahkFyA4ALaYW78a/M4mrt0xis9VoaJ7VB4H?=
 =?us-ascii?Q?744ITX5c8X6F7MGOJPMWpPYVaY+VIoa7r5XwJXJPM5C95vR7yQJ0wm0N+rpH?=
 =?us-ascii?Q?ApX9b9PXuKeFWX1o1On+c9Sy+OocPcqvS8RSJGbfotPDUQIQ3SigvajDi22T?=
 =?us-ascii?Q?ybmFZh8Dck/sxaHqGMwekSwdbb5OhfJUkAASKvFiejmKe3Sb9t7bZvyyIf/8?=
 =?us-ascii?Q?FMq9uH0co+BkL6BkBU+UYaQQngN+W0gkVX5devK9G2s9OeX+v8+cYDBe0HzL?=
 =?us-ascii?Q?AVE2eonJGUkArvrW+R2LvvAu5plJ+BS+aivyTdjP?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc0c9295-3d4c-49d3-c336-08dd36ccaa1e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2025 07:58:01.3641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7C26cgvi1ekFkGlB5G/iZj/hPmwDhUO/p8X1vHwv/vGMSZnlnay410c9OjQKA6P4KluVDfsXfOnZpqTrbKGbUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7115
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_235804_248983_C6F5278F 
X-CRM114-Status: GOOD (  14.59  )
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

The amphion decoder will pre-parse 3 frames before decoding the first
frame. If we append a flush padding data after frame, the decoder
will finish parsing and start to decode when the flush data is parsed.
It can reduce the decoding latency.
In the past, we only enable this mode when the display delay is set to
0. But we still can enable this mode without changing the display order,
so we add a frame_flush_mode parameter to enable it.

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
 drivers/media/platform/amphion/vpu_malone.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/amphion/vpu_malone.c b/drivers/media/platform/amphion/vpu_malone.c
index 1d9e10d9bec1..f07660dc3b07 100644
--- a/drivers/media/platform/amphion/vpu_malone.c
+++ b/drivers/media/platform/amphion/vpu_malone.c
@@ -25,6 +25,9 @@
 #include "vpu_imx8q.h"
 #include "vpu_malone.h"
 
+static bool frame_flush_mode;
+module_param(frame_flush_mode, bool, 0644);
+
 #define CMD_SIZE			25600
 #define MSG_SIZE			25600
 #define CODEC_SIZE			0x1000
@@ -1579,7 +1582,7 @@ static int vpu_malone_input_frame_data(struct vpu_malone_str_buffer __iomem *str
 
 	vpu_malone_update_wptr(str_buf, wptr);
 
-	if (disp_imm && !vpu_vb_is_codecconfig(vbuf)) {
+	if ((disp_imm || frame_flush_mode) && !vpu_vb_is_codecconfig(vbuf)) {
 		ret = vpu_malone_add_scode(inst->core->iface,
 					   inst->id,
 					   &inst->stream_buffer,
-- 
2.43.0-rc1


