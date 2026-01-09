Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBFE0D26D6C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 16:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kq6K55kv1Bpm/wexsYXamqWnOMrxXGMkNe0/+/cTSAI=; b=FA2reRF7N2QBRcPYD+Htl1g70K
	q6bVaOegx3svW3c0yMnxtbmJ1hgD2y7Fg2npPoOXlXV4AdaSFALE2Wd2zhAmrqnvY0jPhwBc+BSRw
	H8XFohSf8eXJ3XpK9L4qll3myxGrgc6/XOJ/+t/z7mR+p+sXYIK4iGSD5C5RTR2MYk+W+xTRPuDuw
	jTsS5SHAPpSe/4MlPsRGCqaGzh/r2fUTFt2zQMYaiHqLgDr0spSYUCvmk1CQVwttaNxx4BIaY5NJK
	4N4AHJAVYYKz5CfS+B2YCBOth9CNyVtKhgZEJqNZ1YGZNIQMcSyKbgqaaK+uZzBl7Lmuv6XxRgJx3
	ezfIHrLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veF9V-00000002ZJk-1yVW;
	Fri, 09 Jan 2026 16:15:53 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veF9T-00000002ZIE-0dIZ;
	Fri, 09 Jan 2026 16:15:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767975348;
	bh=p+kuCGdXK/6j2iTBeIRSLPfGIialDQlPSZDcqO4rm2Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E1lSKjyz9/8GolqdFLydMGYfLFYfLWtAVBpMcbyqLncwJ+uJRtb/Fj1LA2LZuq1Sm
	 mgxmH0z7FFFHKxIVj/Ci8OPullbidzm8f7c0YoGT9SXzYHjxoxWEWNGpgrGh36QFsj
	 FFOzbjxFrYPlV73AurmsDJANh91mvcZhBcAbQGqatkidD8FnQKKWeaIbxq+OQzwVWi
	 hoYP5cYw2qiuvVGZiOIasXHkcptScN1YPBOR0YSb1VoIMYbvjD+JFW25gv5q6G6Nw+
	 6o8+Up3UGp5LeWHdLU0w86r4VdkYb9UB3VHGhfN36+qHtG8wZmDi8ANWpDI1sSg/a/
	 +8azVmznjg7ig==
Received: from trenzalore (modemcable014.2-22-96.mc.videotron.ca [96.22.2.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C5B5217E13E0;
	Fri,  9 Jan 2026 17:15:45 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Heiko Stuebner <heiko@sntech.de>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Yunke Cao <yunkec@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	James Cowgill <james.cowgill@blaize.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH v8 01/17] media: uapi: HEVC: Add v4l2_ctrl_hevc_ext_sps_[ls]t_rps controls
Date: Fri,  9 Jan 2026 11:15:17 -0500
Message-ID: <20260109161538.1294449-2-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260109161538.1294449-1-detlev.casanova@collabora.com>
References: <20260109161538.1294449-1-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_081551_357527_37CFB417 
X-CRM114-Status: GOOD (  17.19  )
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

Some hardware (e.g.: Rockchip's rk3588 hevc decoder) need to fully parse
the slice header, which cannot be passed with the current controls.
There is also no skip method similar as to what can be found in
verisilicon HW.

The SPS is therefore extended through these 2 new controls, providing the
long and short term reference information from the slice header for HEVC
decoding.

These now controls are similar as what is passed in the Vulkan Video API
with the StdVideoH265ShortTermRefPicSet and StdVideoH265LongTermRefPicsSps
structures embedded in the SPS struct.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 .../media/v4l/ext-ctrls-codec-stateless.rst   | 120 ++++++++++++++++++
 .../media/v4l/videodev2.h.rst.exceptions      |   2 +
 .../media/v4l/vidioc-queryctrl.rst            |  12 ++
 3 files changed, 134 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
index 497ae74379f6..3b1e05c6eb13 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
@@ -2959,6 +2959,126 @@ This structure contains all loop filter related parameters. See sections
       - 0x00000004
       -
 
+``V4L2_CID_STATELESS_HEVC_EXT_SPS_LT_RPS (struct)``
+    Subset of the :c:type:`v4l2_ctrl_hevc_sps` control.
+    It extends it with the list of Long-term reference sets parameters.
+    These parameters are defined according to :ref:`hevc`.
+    They are described in section 7.4.3.2.1 "General sequence parameter set
+    RBSP semantics" of the specification.
+    This control is a dynamically sized 1-dimensional array.
+    The values in the array should be ignored when either
+    num_long_term_ref_pics_sps is 0 or the
+    V4L2_HEVC_SPS_FLAG_LONG_TERM_REF_PICS_PRESENT flag is not set in
+    :c:type:`v4l2_ctrl_hevc_sps`.
+
+.. c:type:: v4l2_ctrl_hevc_ext_sps_lt_rps
+
+.. cssclass:: longtable
+
+.. flat-table:: struct v4l2_ctrl_hevc_ext_sps_lt_rps
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - __u16
+      - ``lt_ref_pic_poc_lsb_sps``
+      - Long term reference picture order count as described in section 7.4.3.2.1
+        "General sequence parameter set RBSP semantics" of the specification.
+    * - __u16
+      - ``flags``
+      - See :ref:`Extended Long-Term RPS Flags <hevc_ext_sps_lt_rps_flags>`
+
+.. _hevc_ext_sps_lt_rps_flags:
+
+``Extended SPS Long-Term RPS Flags``
+
+.. cssclass:: longtable
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - ``V4L2_HEVC_EXT_SPS_LT_RPS_FLAG_USED_LT``
+      - 0x00000001
+      - Specifies if the long-term reference picture is used 7.4.3.2.1 "General sequence parameter
+        set RBSP semantics" of the specification.
+
+``V4L2_CID_STATELESS_HEVC_EXT_SPS_ST_RPS (struct)``
+    Subset of the :c:type:`v4l2_ctrl_hevc_sps` control.
+    It extends it with the list of Short-term reference sets parameters.
+    These parameters are defined according to :ref:`hevc`.
+    They are described in section 7.4.8 "Short-term reference picture set
+    semantics" of the specification.
+    This control is a dynamically sized 1-dimensional array.
+    The values in the array should be ignored when
+    num_short_term_ref_pic_sets is 0.
+
+.. c:type:: v4l2_ctrl_hevc_ext_sps_st_rps
+
+.. cssclass:: longtable
+
+.. flat-table:: struct v4l2_ctrl_hevc_ext_sps_st_rps
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - __u8
+      - ``delta_idx_minus1``
+      - Specifies the delta compare to the index. See details in section 7.4.8 "Short-term
+        reference picture set semantics" of the specification.
+    * - __u8
+      - ``delta_rps_sign``
+      - Sign of the delta as specified in section 7.4.8 "Short-term reference picture set
+        semantics" of the specification.
+    * - __u8
+      - ``num_negative_pics``
+      - Number of short-term RPS entries that have picture order count values less than the
+        picture order count value of the current picture.
+    * - __u8
+      - ``num_positive_pics``
+      - Number of short-term RPS entries that have picture order count values greater than the
+        picture order count value of the current picture.
+    * - __u32
+      - ``used_by_curr_pic``
+      - Bit i specifies if short-term RPS i is used by the current picture.
+    * - __u32
+      - ``use_delta_flag``
+      - Bit i specifies if short-term RPS i is included in the short-term RPS entries.
+    * - __u16
+      - ``abs_delta_rps_minus1``
+      - Absolute delta RPS as specified in section 7.4.8 "Short-term reference picture set
+        semantics" of the specification.
+    * - __u16
+      - ``delta_poc_s0_minus1[16]``
+      - Specifies the negative picture order count delta for the i-th entry in the short-term RPS.
+        See details in section 7.4.8 "Short-term reference picture set semantics" of the
+        specification.
+    * - __u16
+      - ``delta_poc_s1_minus1[16]``
+      - Specifies the positive picture order count delta for the i-th entry in the short-term RPS.
+        See details in section 7.4.8 "Short-term reference picture set semantics" of the
+        specification.
+    * - __u16
+      - ``flags``
+      - See :ref:`Extended Short-Term RPS Flags <hevc_ext_sps_st_rps_flags>`
+
+.. _hevc_ext_sps_st_rps_flags:
+
+``Extended SPS Short-Term RPS Flags``
+
+.. cssclass:: longtable
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - ``V4L2_HEVC_EXT_SPS_ST_RPS_FLAG_INTER_REF_PIC_SET_PRED``
+      - 0x00000001
+      - Specifies if the short-term RPS is predicted from another short term RPS. See details in
+        section 7.4.8 "Short-term reference picture set semantics" of the specification.
+
 .. _v4l2-codec-stateless-av1:
 
 ``V4L2_CID_STATELESS_AV1_SEQUENCE (struct)``
diff --git a/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
index c41693115db6..6182b4e2d2ee 100644
--- a/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
+++ b/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
@@ -150,6 +150,8 @@ replace symbol V4L2_CTRL_TYPE_H264_SCALING_MATRIX :c:type:`V4L.v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_H264_PRED_WEIGHTS :c:type:`V4L.v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_H264_SLICE_PARAMS :c:type:`V4L.v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_H264_DECODE_PARAMS :c:type:`V4L.v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_HEVC_EXT_SPS_ST_RPS :c:type:`V4L.v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_HEVC_EXT_SPS_LT_RPS :c:type:`V4L.v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_HEVC_SPS :c:type:`V4L.v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_HEVC_PPS :c:type:`V4L.v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS :c:type:`V4L.v4l2_ctrl_type`
diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
index c8baa9430c14..82c8b52e771c 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
@@ -531,6 +531,18 @@ See also the examples in :ref:`control`.
       - n/a
       - A struct :c:type:`v4l2_ctrl_hevc_decode_params`, containing HEVC
 	decoding parameters for stateless video decoders.
+    * - ``V4L2_CTRL_TYPE_HEVC_EXT_SPS_LT_RPS``
+      - n/a
+      - n/a
+      - n/a
+      - A struct :c:type:`v4l2_ctrl_hevc_ext_sps_lt_rps`, containing HEVC
+	extended Long-Term RPS for stateless video decoders.
+    * - ``V4L2_CTRL_TYPE_HEVC_EXT_SPS_ST_RPS``
+      - n/a
+      - n/a
+      - n/a
+      - A struct :c:type:`v4l2_ctrl_hevc_ext_sps_st_rps`, containing HEVC
+	extended Short-Term RPS for stateless video decoders.
     * - ``V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR``
       - n/a
       - n/a
-- 
2.52.0


