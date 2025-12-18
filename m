Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA9CBD711CE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 23:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PmaWJg4CstgXsgEcYpllZucNdRR5BJpT1O+TVMhsrDs=; b=DExBrnvzSuFaF6oAsI3LOz+3ue
	+xZTZ1QUeSwXXzn3kC/OjgbD4OfDTDvNzgfpUvb9WB+hw6i+oGmIIN43mMlt4qZneOeFCctzULxK9
	LP+fCpWnjaEwRbu1rT5A/NVwj7ZtLdF7O4JeGeCKIzvcG1aXZDcTjWl4kCbUP4bg+cvGpZTWCWqRc
	lpX5Hu7veO3EM4x/WmdnG0wWy4DPMF6JH6zbxemSaX6TYvO3EU0DVBbENLgTOA4crxPwdtOqNtQhn
	xnWusp/7RqgDYahEI29XJpxDD6fhxk1b7rEDVag72LqqFDOOvf+bXOBaurxAN7vaQG/7deBVkFnh6
	I1ffq8ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWNQR-00000009Jnv-3Jq5;
	Thu, 18 Dec 2025 23:28:51 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWNQK-00000009Jim-1ctp;
	Thu, 18 Dec 2025 23:28:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1766100521;
	bh=UrByMHK8ShbXkuBF6BQYPAnZlDu/LbP3faYfzE1pIaE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Diva4TaPMtTZrpkKEOeTd5ksH8dWic4wpchbONUPRmL1Aak4vv+L1vCXlnRe6WsRe
	 WkPGVZ87zJ9fChNXSuF65yEr6+nEnpZ89bTw2PJlFKbZj/9ZmSi8PNYMo2JhiYE0BB
	 XneZoj4ycrzN+ymrZKm/s6kFJgjzMHUXNuOqi4BN6NtC9dRYzlUEcTBJTiTEsvox5y
	 4I2gSe1mYevU2oPu5iN8cJHY4VnJEppkWYkd7m5aDMzN2zpvHyWOXpewtB4IrzMfWU
	 jTj8S2aGKjaOnbvyaKTtHqkA7ps7mQ4qmKP8HZm58HyXzWaWtrXrr9m2Xue0Insl0Y
	 1PEK9w+8FvWRQ==
Received: from earth.mtl.collabora.ca (mtl.collabora.ca [66.171.169.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8CCFD17E110D;
	Fri, 19 Dec 2025 00:28:39 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Heiko Stuebner <heiko@sntech.de>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Yunke Cao <yunkec@google.com>,
	Hans de Goede <hansg@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Pavan Bobba <opensource206@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	James Cowgill <james.cowgill@blaize.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v7 03/17] media: visl: Add HEVC short and long term RPS sets
Date: Thu, 18 Dec 2025 18:28:13 -0500
Message-ID: <20251218232829.337811-4-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251218232829.337811-1-detlev.casanova@collabora.com>
References: <20251218232829.337811-1-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_152846_129967_69AB9340 
X-CRM114-Status: GOOD (  11.77  )
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

Log the recently added v4l2 controls to set HEVC short and long term RPS
sets with 2 new ftrace entries.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/media/test-drivers/visl/visl-dec.c    |  7 +++
 drivers/media/test-drivers/visl/visl-dec.h    |  3 +
 .../media/test-drivers/visl/visl-trace-hevc.h | 59 +++++++++++++++++++
 3 files changed, 69 insertions(+)

diff --git a/drivers/media/test-drivers/visl/visl-dec.c b/drivers/media/test-drivers/visl/visl-dec.c
index d90b79de8384a..6bbf937570478 100644
--- a/drivers/media/test-drivers/visl/visl-dec.c
+++ b/drivers/media/test-drivers/visl/visl-dec.c
@@ -547,6 +547,9 @@ static void visl_trace_ctrls(struct visl_ctx *ctx, struct visl_run *run)
 			trace_v4l2_hevc_dpb_entry(&run->hevc.dpram->dpb[i]);
 
 		trace_v4l2_hevc_pred_weight_table(&run->hevc.spram->pred_weight_table);
+		trace_v4l2_ctrl_hevc_ext_sps_lt_rps(run->hevc.rps_lt);
+		trace_v4l2_ctrl_hevc_ext_sps_st_rps(run->hevc.rps_st);
+
 		break;
 	case VISL_CODEC_AV1:
 		trace_v4l2_ctrl_av1_sequence(run->av1.seq);
@@ -611,6 +614,10 @@ void visl_device_run(void *priv)
 		run.hevc.spram = visl_find_control_data(ctx, V4L2_CID_STATELESS_HEVC_SLICE_PARAMS);
 		run.hevc.sm = visl_find_control_data(ctx, V4L2_CID_STATELESS_HEVC_SCALING_MATRIX);
 		run.hevc.dpram = visl_find_control_data(ctx, V4L2_CID_STATELESS_HEVC_DECODE_PARAMS);
+		run.hevc.rps_lt = visl_find_control_data(ctx,
+							 V4L2_CID_STATELESS_HEVC_EXT_SPS_LT_RPS);
+		run.hevc.rps_st = visl_find_control_data(ctx,
+							 V4L2_CID_STATELESS_HEVC_EXT_SPS_ST_RPS);
 		break;
 	case VISL_CODEC_AV1:
 		run.av1.seq = visl_find_control_data(ctx, V4L2_CID_STATELESS_AV1_SEQUENCE);
diff --git a/drivers/media/test-drivers/visl/visl-dec.h b/drivers/media/test-drivers/visl/visl-dec.h
index c2c2ef3a8798c..6e7562e555bb9 100644
--- a/drivers/media/test-drivers/visl/visl-dec.h
+++ b/drivers/media/test-drivers/visl/visl-dec.h
@@ -7,6 +7,7 @@
 #ifndef _VISL_DEC_H_
 #define _VISL_DEC_H_
 
+#include "linux/v4l2-controls.h"
 #include "visl.h"
 
 struct visl_fwht_run {
@@ -43,6 +44,8 @@ struct visl_hevc_run {
 	const struct v4l2_ctrl_hevc_slice_params *spram;
 	const struct v4l2_ctrl_hevc_scaling_matrix *sm;
 	const struct v4l2_ctrl_hevc_decode_params *dpram;
+	const struct v4l2_ctrl_hevc_ext_sps_lt_rps *rps_lt;
+	const struct v4l2_ctrl_hevc_ext_sps_st_rps *rps_st;
 };
 
 struct visl_av1_run {
diff --git a/drivers/media/test-drivers/visl/visl-trace-hevc.h b/drivers/media/test-drivers/visl/visl-trace-hevc.h
index 837b8ec12e975..963914c463dbc 100644
--- a/drivers/media/test-drivers/visl/visl-trace-hevc.h
+++ b/drivers/media/test-drivers/visl/visl-trace-hevc.h
@@ -1,4 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0+ */
+#include "linux/v4l2-controls.h"
 #if !defined(_VISL_TRACE_HEVC_H_) || defined(TRACE_HEADER_MULTI_READ)
 #define _VISL_TRACE_HEVC_H_
 
@@ -343,6 +344,54 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_decode_params_tmpl,
 	))
 );
 
+DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_ext_sps_lt_rps_tmpl,
+	TP_PROTO(const struct v4l2_ctrl_hevc_ext_sps_lt_rps *lt),
+	TP_ARGS(lt),
+	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_hevc_ext_sps_lt_rps, lt)),
+	TP_fast_assign(__entry->lt = *lt),
+	TP_printk("\nflags %s\n"
+		  "lt_ref_pic_poc_lsb_sps %x\n",
+		  __print_flags(__entry->lt.flags, "|",
+		  {V4L2_HEVC_EXT_SPS_LT_RPS_FLAG_USED_LT, "USED_LT"}
+		  ),
+		  __entry->lt.lt_ref_pic_poc_lsb_sps
+	)
+)
+
+DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_ext_sps_st_rps_tmpl,
+	TP_PROTO(const struct v4l2_ctrl_hevc_ext_sps_st_rps *st),
+	TP_ARGS(st),
+	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_hevc_ext_sps_st_rps, st)),
+	TP_fast_assign(__entry->st = *st),
+	TP_printk("\nflags %s\n"
+		  "delta_idx_minus1: %u\n"
+		  "delta_rps_sign: %u\n"
+		  "abs_delta_rps_minus1: %u\n"
+		  "num_negative_pics: %u\n"
+		  "num_positive_pics: %u\n"
+		  "used_by_curr_pic: %08x\n"
+		  "use_delta_flag: %08x\n"
+		  "delta_poc_s0_minus1: %s\n"
+		  "delta_poc_s1_minus1: %s\n",
+		  __print_flags(__entry->st.flags, "|",
+		  {V4L2_HEVC_EXT_SPS_ST_RPS_FLAG_INTER_REF_PIC_SET_PRED, "INTER_REF_PIC_SET_PRED"}
+		  ),
+		  __entry->st.delta_idx_minus1,
+		  __entry->st.delta_rps_sign,
+		  __entry->st.abs_delta_rps_minus1,
+		  __entry->st.num_negative_pics,
+		  __entry->st.num_positive_pics,
+		  __entry->st.used_by_curr_pic,
+		  __entry->st.use_delta_flag,
+		  __print_array(__entry->st.delta_poc_s0_minus1,
+				ARRAY_SIZE(__entry->st.delta_poc_s0_minus1),
+				sizeof(__entry->st.delta_poc_s0_minus1[0])),
+		  __print_array(__entry->st.delta_poc_s1_minus1,
+				ARRAY_SIZE(__entry->st.delta_poc_s1_minus1),
+				sizeof(__entry->st.delta_poc_s1_minus1[0]))
+	)
+)
+
 
 DECLARE_EVENT_CLASS(v4l2_hevc_dpb_entry_tmpl,
 	TP_PROTO(const struct v4l2_hevc_dpb_entry *e),
@@ -391,6 +440,16 @@ DEFINE_EVENT(v4l2_ctrl_hevc_decode_params_tmpl, v4l2_ctrl_hevc_decode_params,
 	TP_ARGS(d)
 );
 
+DEFINE_EVENT(v4l2_ctrl_hevc_ext_sps_lt_rps_tmpl, v4l2_ctrl_hevc_ext_sps_lt_rps,
+	TP_PROTO(const struct v4l2_ctrl_hevc_ext_sps_lt_rps *lt),
+	TP_ARGS(lt)
+);
+
+DEFINE_EVENT(v4l2_ctrl_hevc_ext_sps_st_rps_tmpl, v4l2_ctrl_hevc_ext_sps_st_rps,
+	TP_PROTO(const struct v4l2_ctrl_hevc_ext_sps_st_rps *st),
+	TP_ARGS(st)
+);
+
 DEFINE_EVENT(v4l2_hevc_dpb_entry_tmpl, v4l2_hevc_dpb_entry,
 	TP_PROTO(const struct v4l2_hevc_dpb_entry *e),
 	TP_ARGS(e)
-- 
2.52.0


