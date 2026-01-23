Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21311D778AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 19:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+zA3u3ECYbJ6bqE40i5fPMDbfRXxnkAxD6masVpU7tM=; b=oJoSA4nhKZdIHBg3QoKkBOT3St
	md2LxdBtJoq+8bYRvoQ9osLOXQtJlUvTO5IiUleWNe2GzmXleroy8+TG84c19rdfcHASzDUQGhGxp
	Wxq3sI+5fdDgRU8/n07mOIl2u5ogG7z8VAssf8rMOQfB/9IhavaIQwARrOiJ2UnQQLwwx2yUSfdDD
	MHcPRVPpa/V0NQpG9kWW6OM1LvgNRubBLBqzzlCM3/mhpBeohRUs007HbP+nKVs4t4CJenWSfpGpF
	P+TxoUK/u2TBigGN0m10gEVrZSpoQTbBkwCW6+gzz6rs9i14h8OLixdOaN9ywUmTXibLKU2+I2eNk
	QvsL+n5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjMkK-00000009Pgw-2r5S;
	Fri, 23 Jan 2026 19:23:04 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjMkB-00000009PUe-23Sa;
	Fri, 23 Jan 2026 19:22:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1769196171;
	bh=1PbDexk1JuVcGk7jA6Ea3tQNMA3I+IYYxLlRzW49kJ8=;
	h=From:To:Cc:Subject:Date:From;
	b=fdxXgHvZkztUfQLUEUTdVo6attL054X8ci55E684kb0E0O3j6etbExS4KOkUNMxs5
	 X7A1l/S43Rgacm4E52XjaHhdq7dbYmXBsxAVPkQrQkqkanTLySImEB7QuyZN01yFbZ
	 HfEzJxQVHfxddj177sRbwJrYPdSFYJpSJxPDu5MGvp32I770N2Fw64ro+7NJbcq7Ua
	 ddMCk9pjAr5PI6rvW19UzTvOPQ8LGPR5gX4gvG5dc44/fUbKX2q74vasGtf/Fjqmkq
	 takK/PPddRHzYgB2TSwBJW3TUZOPZDxWX2e2623SC3DMQXmXqSNQCO2RcdLCP2P1uk
	 iouOzNHpMy7Bw==
Received: from trenzalore (modemcable014.2-22-96.mc.videotron.ca [96.22.2.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A6B0617E0A49;
	Fri, 23 Jan 2026 20:22:49 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH] media: rkvdec: Improve handling missing short/long term RPS
Date: Fri, 23 Jan 2026 14:22:44 -0500
Message-ID: <20260123192244.1441637-1-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_112255_696022_9E415030 
X-CRM114-Status: GOOD (  10.93  )
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

The values of ext_sps_st_rps and ext_sps_lt_rps in struct rkvdec_hevc_run
are not initialized when the respective controls are not set by userspace.

When this is the case, set them to NULL so the rkvdec_hevc_run_preamble
function that parses controls does not access garbage data which leads to
a panic on unaccessible memory.

Fixes: c9a59dc2acc7 ("media: rkvdec: Add HEVC support for the VDPU381 variant")
Reported-by: Christian Hewitt <christianshewitt@gmail.com>
Suggested-by: Jonas Karlman <jonas@kwiboo.se>
Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
index 28267ee30190..3119f3bc9f98 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
@@ -500,11 +500,15 @@ void rkvdec_hevc_run_preamble(struct rkvdec_ctx *ctx,
 		ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
 				      V4L2_CID_STATELESS_HEVC_EXT_SPS_ST_RPS);
 		run->ext_sps_st_rps = ctrl ? ctrl->p_cur.p : NULL;
+	} else {
+		run->ext_sps_st_rps = NULL;
 	}
 	if (ctx->has_sps_lt_rps) {
 		ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
 				      V4L2_CID_STATELESS_HEVC_EXT_SPS_LT_RPS);
 		run->ext_sps_lt_rps = ctrl ? ctrl->p_cur.p : NULL;
+	} else {
+		run->ext_sps_lt_rps = NULL;
 	}
 
 	rkvdec_run_preamble(ctx, &run->base);
-- 
2.52.0


