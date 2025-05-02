Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 971ECC3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 15:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JBd+7VmcycZDckaOTiLdw3LcwdTgbcJWFwcxnvWJnS8=; b=y1JmKDP6eRYBC2g7IIQv9F3y8B
	QWJsh9GV87D+vMnXoR334jk3FLd1/poy6u+vYedl8zKgEIjPAGO8IitHdPtyahmDCLebgHjPoL5aW
	P6PFylRysiWi8FTF/H1xBH65O8Nhau9cs9ZIKeEDrRyFHtt6HTyqUN47T0v0cj2746SGKSYWtmckT
	fnYOxvSDvtxD5XMxgGiXljdHDOR6MpqQnrpIJAFG4saq+1q73LekCrVWIay58PSt4pfVlZzWx9D+8
	+hnJbpof6x+rHu/GWafmNOtFsIXm3oKseVZaNfVv/DKKtX1pf4tL9C4gq3CZ8Q67Hbdpv7iWcbIHF
	NC8SoPDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAs96-00000002JIF-0DS5;
	Fri, 02 May 2025 15:17:48 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAryI-00000002Hgp-33DL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 15:06:39 +0000
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1uAry0-0004HG-9b; Fri, 02 May 2025 17:06:20 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: nicolas.dufresne@collabora.com,
	benjamin.gaignard@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	shawnguo@kernel.org,
	Sascha Hauer <s.hauer@pengutronix.de>,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paulk@sys-base.io,
	hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	sebastian.fricke@collabora.com,
	ming.qian@nxp.com
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Michael Tretter <m.tretter@pengutronix.de>
Subject: [RFC PATCH 02/11] media: uapi: add documentation for the V4L2 H.264 stateless encoding API
Date: Fri,  2 May 2025 17:05:05 +0200
Message-Id: <20250502150513.4169098-3-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250502150513.4169098-1-m.felsch@pengutronix.de>
References: <20250502150513.4169098-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_080638_756234_83985AFD 
X-CRM114-Status: GOOD (  17.27  )
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

From: Michael Tretter <m.tretter@pengutronix.de>

Document the parameters that are passed to the stateless encoding API
since they need to be filled by user space and knowing what the
parameters do helps when filling it.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 include/uapi/linux/v4l2-controls.h | 46 ++++++++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 2 deletions(-)

diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 4f6b37513edc..670f822ee758 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1696,6 +1696,32 @@ struct v4l2_ctrl_h264_decode_params {
 
 #define V4L2_CID_STATELESS_H264_ENCODE_PARAMS	(V4L2_CID_CODEC_STATELESS_BASE + 8)
 
+/**
+ * struct v4l2_ctrl_h264_encode_params - H264 encoding parameters
+ *
+ * @slice_type: selects slice type. Set to one of V4L2_H264_SLICE_TYPE_{}
+ * @pic_parameter_set_id: identifies the picture parameter set that is referred to
+ * in the slice header. The value shall be in the range of 0 to 255, inclusive.
+ * @frame_num: an identifier for pictures.
+ * @idr_pic_id: identifies an IDR picture.
+ * @cabac_init_idc: index for determining the initialization table used in the
+ * initialization process for context variables. The value of cabac_init_idc
+ * shall be in the range of 0 to 2, inclusive.
+ * @disable_deblocking_filter_idc: specifies whether the operation of the
+ * deblocking filter shall be disabled across some block edges of the slice and
+ * specifies for which edges the filtering is disabled.
+ * @slice_alpha_c0_offset_div2: offset used in accessing the alpha and tC0
+ * deblocking filter tables for filtering operations controlled by the macroblocks
+ * within the slice.
+ * @slice_beta_offset_div2: offset used in accessing the beta deblocking filter
+ * table for filtering operations controlled by the macroblocks within the slice.
+ * @slice_size_mb_rows: number of macroblock rows in a slice.
+ * @pic_init_qp_minus26: initial value minus 26 of luma qp for each slice.
+ * @chroma_qp_index_offset: offset that shall be added to qp luma for addressing the
+ * table of qp chroma values for the Cb chroma component.
+ * @flags: combination of V4L2_H264_ENCODE_FLAG_{} flags.
+ * @reference_ts: timestamp of the V4L2 buffer to use as reference
+ */
 struct v4l2_ctrl_h264_encode_params {
 	/* Slice parameters */
 
@@ -1710,8 +1736,16 @@ struct v4l2_ctrl_h264_encode_params {
 
 	__s32 slice_size_mb_rows;
 
-	/* PPS parameters */
-
+	/*
+	 * PPS parameters
+	 *
+	 * TODO Duplicating the PPS in the encode_params may not be necessary,
+	 * if the PPS are set via separate control. Otherwise, it may be useful
+	 * to just use struct v4l2_ctrl_h264_pps here.
+	 *
+	 * Needs to be consistent with the values set in the PPS referenced by
+	 * pic_parameter_set_id.
+	 */
 	__s8 pic_init_qp_minus26;
 	__s8 chroma_qp_index_offset;
 
@@ -1728,6 +1762,14 @@ struct v4l2_ctrl_h264_encode_params {
 
 #define V4L2_CID_STATELESS_H264_ENCODE_RC	(V4L2_CID_CODEC_STATELESS_BASE + 9)
 
+/**
+ * struct v4l2_ctrl_h264_encode_rc
+ *
+ * @qp: quantization parameter for the currently encoded slice
+ *
+ * TODO Setting the QP is enough for implementing const QP, but probably the
+ * entire rate control mechanism has to be reworked.
+ */
 struct v4l2_ctrl_h264_encode_rc {
 	__u32 qp;
 	__u32 qp_min;
-- 
2.39.5


