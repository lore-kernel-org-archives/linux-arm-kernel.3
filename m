Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A93D6ED2B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 13:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oT58q45BHt1UL79xkKrgV9Ac9/94VjkagOmgL19rZm4=; b=mLfA5AaJtEbLJi8DwFJgMKyLm1
	PpCSMwrBOnxaKUUO9RF6D6uPZMdKtD2Z5BjZrdiQTmw+p+AbAf8uRXdnj1AXIyL8yimewMSQ82NhI
	qG7s2Zfsaz4zOEFRngSiBErYkL4YL5hXII05d71vO0O9P4I0gPagenKxNg9gbmwEqTYAZE60to0qg
	qOV1PyimLR5G1l7a6yN+Z4CnreXY3LrbBAcsW1m8+Pa3yDk07iYMcvfprSIHP9TgId9Wd6TnFDIB3
	FckU2MH9QqbpIU/oBgDylq25jrLM9+Ua2TrFwaeiTY03VgXoqgdGm0W1xuFZceNj6iAT4Xg7IlhLn
	ZNXuT2LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE7A5-000000006L0-18N6;
	Thu, 21 Nov 2024 13:23:57 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE78P-000000005yD-21Jc;
	Thu, 21 Nov 2024 13:22:14 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ALAlClX018947;
	Thu, 21 Nov 2024 14:21:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	oT58q45BHt1UL79xkKrgV9Ac9/94VjkagOmgL19rZm4=; b=Tc1cyOr+kEQ8YxTp
	HvoE/Td6C19fL1PZqQlSY+e71y0kKXOPqibppW2GJHsaSO+ziXj7M0Uc0AvR1rIh
	ckChbsoEMf11DuIJ7UT52+JQxHiSZubdAJok4pYh3zm9M0N0nUTrquHnuYnSStlg
	rfPh9ipFADBeGN/Q17/r+KR7F19kM59gUt9W+PBKIOszH11q3wVdO5+VPW7kDi/u
	vgU6HYVFyCOpl7MR06UEUC/koeIXg/Dd6v+wBovhnpB405TvPSxbjzTeLCwYa6cp
	Tg8KlbL+JeBcsHZXLmjBxConU+kgwSyX3R/DsKkUILH9RGNzNmvf2LxLXvAWQ+Rf
	Ob/LYA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42y77nmea9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 14:21:59 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 22AB24004B;
	Thu, 21 Nov 2024 14:20:19 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5B4972843D6;
	Thu, 21 Nov 2024 14:19:09 +0100 (CET)
Received: from localhost (10.48.86.208) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 21 Nov
 2024 14:19:09 +0100
From: Hugues Fruchet <hugues.fruchet@foss.st.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ezequiel Garcia
	<ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Hugues Fruchet
	<hugues.fruchet@foss.st.com>,
        Sebastian Fricke
	<sebastian.fricke@collabora.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Erling Ljunggren <hljunggr@cisco.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus
	<sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
        Benjamin
 Gaignard <benjamin.gaignard@collabora.com>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-rockchip@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v3 3/3] media: verisilicon: postproc: 4K support
Date: Thu, 21 Nov 2024 14:19:04 +0100
Message-ID: <20241121131904.261230-4-hugues.fruchet@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241121131904.261230-1-hugues.fruchet@foss.st.com>
References: <20241121131904.261230-1-hugues.fruchet@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.86.208]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_052213_798472_C8547F35 
X-CRM114-Status: GOOD (  13.75  )
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

Support input larger than 4096x2048 using extended input width/height
fields of swreg92.
This is needed to decode large WebP or JPEG pictures.

Signed-off-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
---
 drivers/media/platform/verisilicon/hantro.h          | 2 ++
 drivers/media/platform/verisilicon/hantro_g1_regs.h  | 2 +-
 drivers/media/platform/verisilicon/hantro_postproc.c | 6 +++++-
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/platform/verisilicon/hantro.h
index 811260dc3c77..d1337f7742e4 100644
--- a/drivers/media/platform/verisilicon/hantro.h
+++ b/drivers/media/platform/verisilicon/hantro.h
@@ -321,6 +321,8 @@ struct hantro_postproc_regs {
 	struct hantro_reg output_fmt;
 	struct hantro_reg orig_width;
 	struct hantro_reg display_width;
+	struct hantro_reg input_width_ext;
+	struct hantro_reg input_height_ext;
 };
 
 struct hantro_vp9_decoded_buffer_info {
diff --git a/drivers/media/platform/verisilicon/hantro_g1_regs.h b/drivers/media/platform/verisilicon/hantro_g1_regs.h
index e7d4db788e57..f6e5bbeb1914 100644
--- a/drivers/media/platform/verisilicon/hantro_g1_regs.h
+++ b/drivers/media/platform/verisilicon/hantro_g1_regs.h
@@ -351,7 +351,7 @@
 #define     G1_REG_PP_CONTROL_OUT_WIDTH(v) (((v) << 4) & GENMASK(14, 4))
 #define G1_REG_PP_MASK1_ORIG_WIDTH	G1_SWREG(88)
 #define     G1_REG_PP_ORIG_WIDTH(v)	(((v) << 23) & GENMASK(31, 23))
-#define G1_REG_PP_DISPLAY_WIDTH		G1_SWREG(92)
+#define G1_REG_PP_DISPLAY_WIDTH_IN_EXT	G1_SWREG(92)
 #define G1_REG_PP_FUSE			G1_SWREG(99)
 
 #endif /* HANTRO_G1_REGS_H_ */
diff --git a/drivers/media/platform/verisilicon/hantro_postproc.c b/drivers/media/platform/verisilicon/hantro_postproc.c
index 232c93eea7ee..84c8e287470d 100644
--- a/drivers/media/platform/verisilicon/hantro_postproc.c
+++ b/drivers/media/platform/verisilicon/hantro_postproc.c
@@ -49,7 +49,9 @@ static const struct hantro_postproc_regs hantro_g1_postproc_regs = {
 	.input_fmt = {G1_REG_PP_CONTROL, 29, 0x7},
 	.output_fmt = {G1_REG_PP_CONTROL, 26, 0x7},
 	.orig_width = {G1_REG_PP_MASK1_ORIG_WIDTH, 23, 0x1ff},
-	.display_width = {G1_REG_PP_DISPLAY_WIDTH, 0, 0xfff},
+	.display_width = {G1_REG_PP_DISPLAY_WIDTH_IN_EXT, 0, 0xfff},
+	.input_width_ext = {G1_REG_PP_DISPLAY_WIDTH_IN_EXT, 26, 0x7},
+	.input_height_ext = {G1_REG_PP_DISPLAY_WIDTH_IN_EXT, 29, 0x7},
 };
 
 bool hantro_needs_postproc(const struct hantro_ctx *ctx,
@@ -103,6 +105,8 @@ static void hantro_postproc_g1_enable(struct hantro_ctx *ctx)
 	HANTRO_PP_REG_WRITE(vpu, output_height, ctx->dst_fmt.height);
 	HANTRO_PP_REG_WRITE(vpu, orig_width, MB_WIDTH(ctx->dst_fmt.width));
 	HANTRO_PP_REG_WRITE(vpu, display_width, ctx->dst_fmt.width);
+	HANTRO_PP_REG_WRITE(vpu, input_width_ext, MB_WIDTH(ctx->dst_fmt.width) >> 9);
+	HANTRO_PP_REG_WRITE(vpu, input_height_ext, MB_HEIGHT(ctx->dst_fmt.height >> 8));
 }
 
 static int down_scale_factor(struct hantro_ctx *ctx)
-- 
2.25.1


