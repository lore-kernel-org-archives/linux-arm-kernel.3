Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1EBEC3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 15:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xt740VByp9gsOIuEcdYp3Z1vozAijb4WlB8io0cYkAI=; b=XWyvNU8CD2lAqQABwifYH4FM3J
	CZTOd+qz1pHAxtZP8Xoy/URFYfi/RH/lFEih4taUveD/+5maDHMfTZGorinHqDMxiOJlziWAyQisP
	/V5N2+E+/vaKYJOxZ18JScswa/P/P5qVVQ7Hx2nwK2aL7CdjScWV/GqNjhxl4MH2+b+yv/jOQZ4Ri
	mW5jq2JMIOdjl7sAFV3vBGqihmUCOY1Rtjk7SufiegQSKCWZ9BJGYtmEEQ8PoV9Jxk2cHWPrg02/p
	UB3Vwncoq+eggbh4L+XBq00tHhg/J+CsFXV7QDn+3HdhOPDIJY6iIIBMUbL9ESnaQJI1PpC4Pv09L
	V8rv5aBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAs97-00000002JIn-2SND;
	Fri, 02 May 2025 15:17:49 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAryk-00000002Ho5-1c4h
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 15:07:08 +0000
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1uAryS-0004HG-57; Fri, 02 May 2025 17:06:48 +0200
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
Subject: [RFC PATCH 03/11] media: uapi: add nal unit header fields to encode_params
Date: Fri,  2 May 2025 17:05:06 +0200
Message-Id: <20250502150513.4169098-4-m.felsch@pengutronix.de>
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
X-CRM114-CacheID: sfid-20250502_080706_427155_688F2EF4 
X-CRM114-Status: GOOD (  13.58  )
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

The VEPU540 and VEPU580 may prepare the NAL unit headers in the coded
params. These values have to be provided by user space and be written
into the hardware registers.

Furthermore, nal_ref_idc indicates if a picture will be used as
reference and is a hint to the driver, if it needs to keep the
reconstructed buffer or not.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 include/uapi/linux/v4l2-controls.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 670f822ee758..a8df393c9ead 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1694,6 +1694,9 @@ struct v4l2_ctrl_h264_decode_params {
 	__u32 flags;
 };
 
+#define V4L2_H264_NAL_CODED_SLICE_NON_IDR_PIC	1
+#define V4L2_H264_NAL_CODED_SLICE_IDR_PIC	5
+
 #define V4L2_CID_STATELESS_H264_ENCODE_PARAMS	(V4L2_CID_CODEC_STATELESS_BASE + 8)
 
 /**
@@ -1719,6 +1722,8 @@ struct v4l2_ctrl_h264_decode_params {
  * @pic_init_qp_minus26: initial value minus 26 of luma qp for each slice.
  * @chroma_qp_index_offset: offset that shall be added to qp luma for addressing the
  * table of qp chroma values for the Cb chroma component.
+ * @nal_ref_idc: nal_ref_idc for the header of the generated NAL unit
+ * @nal_unit_type: one of the V4L2_H264_NAL_CODED_SLICE_{} values
  * @flags: combination of V4L2_H264_ENCODE_FLAG_{} flags.
  * @reference_ts: timestamp of the V4L2 buffer to use as reference
  */
@@ -1751,6 +1756,16 @@ struct v4l2_ctrl_h264_encode_params {
 
 	__u32 flags; /* V4L2_H264_ENCODE_FLAG_ */
 
+	/*
+	 * If nal_ref_idc is 0, the NAL unit won't be used as reference by
+	 * later NAL units. Any other value indicates that the NAL unit may be
+	 * used as reference.
+	 */
+	__u8 nal_ref_idc;
+
+	/* TODO Can we infer the nal_unit_type from the slice_type? */
+	__u8 nal_unit_type;
+
 	/* Reference */
 
 	__u64 reference_ts;
-- 
2.39.5


