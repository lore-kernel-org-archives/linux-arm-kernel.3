Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE950606A329
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 12:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LU3yAMuA;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=WrE3Eg7t
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PaYz+8zXO9ujogHakqrSWss0FJ/AVkkg/0HPhoXx4ng=; b=LU3yAMuAiIjek0
	2l0Qu5dFE7W87ozwuX9IpirYy2ZkvLuNb+/uKJSiBdX6/dQce+mHzaRcO4+TGYtPLgjsNZOhzf73a
	DowyIpC0q0DE6BGMuvJT5YyVQ+E7Q1IeIdbW42Mh2G3r94GzKeBmVjBO7fTYJRAfKozwhAgOSTilP
	GgMP6o8nl2TmemlhKWfPcwL5+S9I7VX76rJag1TNUkjsD9vULzXzCbe8BlSg4F+gtkUYWtH4S3RfP
	iDf9hiRwWkM8+yIxHNydLFXinrOIYFQkCFqwiYrgT40S5qSXlt8ckWmJuiYfjj7/dXKcSE+5BAr0B
	WBP+Kh3JeLYQ89wKv3TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOa6k-00000005Jj3-2r51;
	Wed, 04 Nov 2026 12:28:50 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOa6a-00000005JSk-1eeO;
	Wed, 04 Nov 2026 12:28:42 +0000
Received: from [127.0.1.1] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C4D292336;
	Wed,  4 Nov 2026 13:26:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793795180;
	bh=/KgvK7KKTO9K6EReqGFFUe9cgP7T3ggr+Oh0Hli0D+E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WrE3Eg7tu05mbUPJfbSn7qiWz9fCg+eQvd5j+ntdtiWdhhYUYR+wT8KBAdCOBP0kL
	 v3Et+sHOQvxK++9cQNc6NvBN6V76GzuZ0Oy6wblSzfg3yHRzGaTYLuOUd7P79XHaNZ
	 2WuO1JKW22S+kL8pOsjuqkD6B3+UjxP+7Kfs4jcY=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Wed, 04 Nov 2026 12:28:22 +0000
Subject: [PATCH 7/7] media: rkisp1: Re-apply v4l2-isp reset buffer on
 resume
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-v4l2-isp-resume-v1-7-06aeb8cf2940@ideasonboard.com>
References: <20261104-v4l2-isp-resume-v1-0-06aeb8cf2940@ideasonboard.com>
In-Reply-To: <20261104-v4l2-isp-resume-v1-0-06aeb8cf2940@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
 Jai Luthra <jai.luthra+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Keke Li <keke.li@amlogic.com>, 
 Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Daniel Scally <dan.scally@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2936;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=/KgvK7KKTO9K6EReqGFFUe9cgP7T3ggr+Oh0Hli0D+E=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBq6yTv9E+f/HyYSMlzPK364U2jD1zhVCo/VXc5g
 j0gjbbuKT2JAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCausk7wAKCRDISVd6bEV1
 MhosD/9QOIDvNLn4Zm14QQjjpvXfp+XO3nvoAtoii/VEUB96XunSKi2Dp8FQcxtYTz5gTpfH/WG
 D3ibtb57qPtSIPpaFen3ERDhvZb1vCkPi38JkJPtUoVIzdP+DlVygk7EuNQUkLCnEkRmIWWtSvF
 hGKD/y4OnNhDbwY6aGVt6RrlhrdsZQv4CcGSs5PF52+fioThJGhjheRHldWoj0dmQZRHG2IkAbi
 ApJQhAyc8kFOJytcsRH6Ao4kFxuVOIOOyxCXQr2kPIGYcG3RMFKBf3HPNHYnUaC/O2GovIOoIQC
 q7S8/k+XwyvhOiPhvDkfZpIhqrCA9g5WPBlMJ0TjVbrSihtpuajhTxPj1Z9g9uEwW1k60RKL4/R
 NQ+JpC4oA1bIj1wJ4NX6ARKAgstg4GZwBmmR/KaRkVmw2uHMnRl0C/Y5B59tTWTw+EnfJo9KfjV
 yW0zfTQFUEzozBfLTofPUfJ1kDP0TFz4LkKp76J5pzdJcvQwuONaz+FHmwCjt/d3nex7upv1EkL
 7UxrZ2lgNPGOxYvRVoBtT/pjJgXKr+ptPLSJMeCIexSbFp212cIGO4NAI2TKMv+UTrvEFY6MxsI
 ppmrlwji/0nH+9s66taEQJ3paMBnT2js1SDXV8J9aTjiHcmqs1yrggsgVrXaWxtHgZPqSSHB9Py
 wBvRnt7VoUNvntw==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_042840_613677_FB53769F 
X-CRM114-Status: GOOD (  14.30  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When resuming from suspension or hibernation with an active stream
the hardware will have lost all settings. The v4l2_isp framework
defines a configuration buffer format that is extensible, meaning
userspace does not need to pass in a full set of parameters for each
frame. As userspace is unaware of suspend / resume it's very unlikely
to pass a full reconfiguration.

Use the v4l2-isp reset buffer to re-apply configuration blocks marked
as needing to be reapplied.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 .../media/platform/rockchip/rkisp1/rkisp1-params.c | 35 +++++++++++++++-------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
index 178da1f648869b7b963f634f29f5653cfb16dd77..952c4246ccefa81aa4853a18c941a6f10f456902 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -2326,20 +2326,31 @@ static void rkisp1_ext_params_config(struct rkisp1_params *params,
 
 void rkisp1_params_reapply_config(struct rkisp1_params *params)
 {
+	struct v4l2_isp_params_buffer *buffer = params->v4l2_isp.params.reset_buf;
+	struct rkisp1_ext_params_cfg *cfg;
+
 	guard(spinlock)(&params->buf.lock);
 
-	if (!params->buf.curr)
+	if (params->buf.curr) {
+		if (params->metafmt->dataformat == V4L2_META_FMT_RK_ISP1_PARAMS) {
+			rkisp1_isp_isr_other_config(params, params->buf.curr->cfg);
+			rkisp1_isp_isr_lsc_config(params, params->buf.curr->cfg);
+			rkisp1_isp_isr_meas_config(params, params->buf.curr->cfg);
+		} else {
+			rkisp1_ext_params_config(params, params->buf.curr->cfg,
+						RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS |
+						RKISP1_EXT_PARAMS_BLOCK_GROUP_LSC);
+		}
+	}
+
+	buffer = params->v4l2_isp.params.reset_buf;
+	if (!buffer)
 		return;
 
-	if (params->metafmt->dataformat == V4L2_META_FMT_RK_ISP1_PARAMS) {
-		rkisp1_isp_isr_other_config(params, params->buf.curr->cfg);
-		rkisp1_isp_isr_lsc_config(params, params->buf.curr->cfg);
-		rkisp1_isp_isr_meas_config(params, params->buf.curr->cfg);
-	} else {
-		rkisp1_ext_params_config(params, params->buf.curr->cfg,
-					 RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS |
-					 RKISP1_EXT_PARAMS_BLOCK_GROUP_LSC);
-	}
+	cfg = (struct rkisp1_ext_params_cfg *)buffer;
+	rkisp1_ext_params_config(params, cfg,
+				 RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS |
+				 RKISP1_EXT_PARAMS_BLOCK_GROUP_LSC);
 }
 
 static void rkisp1_params_complete_buffer(struct rkisp1_params *params,
@@ -2891,6 +2902,10 @@ int rkisp1_params_register(struct rkisp1_device *rkisp1)
 	if (ret)
 		return ret;
 
+	ret = v4l2_isp_params_init_reset_buf(&params->v4l2_isp);
+	if (ret)
+		return ret;
+
 	mutex_init(&node->vlock);
 	INIT_LIST_HEAD(&params->buf.queue);
 	spin_lock_init(&params->buf.lock);

-- 
2.43.0


