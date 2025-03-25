Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22172C36005
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 21:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yMtwELrwJ1dFJEqCcaQPYkMrrj75OWLdmQwwyUQTSXA=; b=I+9OpPfUMnPfzIbRYP/jxDsIV3
	nSvF1cxqzSNk9mAH6d3DBK/MzHGKFPVb/WDpnZWF/565IxExukPW1VZMtY3A7zO1hvpd0oADeGHZ1
	nbLqHHNA8JXYLwey+YcN8A6v7UCbj3+tSOlqwjKVFetmQu60PPBEaDneGuY6EHClqvsLfj/6emTx4
	3ymlMUWC0fsg+pgeK1BjT7Ra4KFLYHBV/JVZBfaqUSoHapkMx+T89JoGIW62T06KnKnZeCaCAMOCt
	zfOSLDOlm9baiADlBtYoc3dhVFN3Cy813IKAq5w+8EvZw5rxnMmWsGLsof2+yFJlKKtpf4imzBb+t
	dTeM8aAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txByj-000000074bR-33mD;
	Tue, 25 Mar 2025 21:38:33 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txBtk-000000073q0-0awy;
	Tue, 25 Mar 2025 21:33:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742938402;
	bh=Ts/xdvdCdHAKpr7BiHXqfNHMmy4Q+yoCfeh9tDETd6Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OkCPTgFgMnq2UKHA4bDiI+vCoX211/3Z1FxNEPL62Cl3+DAOWKO1IOFHkd+ZhmEp3
	 wJYT23Tuep+/D/NGL8c+tLVf8olPn//G7xbBTKX9u49Rs6yI728cDAQoYbLDWoBb1/
	 KsqSeuKhW3Z/gvowriN2osr1R1XNOSKe4ICej/ySo0tXvZRbuGsFu14uaiulOcIR2F
	 A+e94ac97bTAXIk3oZLI0GeaoBwaMcSnYvItf44SitWf08Wl/avXLQdTqI7bSPTj3w
	 5hPWj7jOjTX3oLW/iuOMUyiL187BRfglwwHcveKJKvwCeTTQ9l7JUBtl02CxpzOdGs
	 3RHAHuqaj/MSw==
Received: from trenzalore.hitronhub.home (unknown [23.233.251.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 62BBF17E0FCC;
	Tue, 25 Mar 2025 22:33:18 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Niklas Cassel <cassel@kernel.org>,
	Alexey Charkov <alchark@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	kernel@collabora.com
Subject: [PATCH v4 2/6] media: v4l2-ctrls-core: Set frame_mbs_only_flag by default in h264 SPS
Date: Tue, 25 Mar 2025 17:22:18 -0400
Message-ID: <20250325213303.826925-3-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250325213303.826925-1-detlev.casanova@collabora.com>
References: <20250325213303.826925-1-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_143324_352669_E6404F8B 
X-CRM114-Status: GOOD (  13.39  )
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

This flag is needed for drivers that have a minimum height lower
than 32 pixels.

This is because when the flag is not set, the height is halved, which
would make it lower than 16 pixels if min height is 16.

Setting this flag will keep the height at its value and have a valid
SPS.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/media/v4l2-core/v4l2-ctrls-core.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index eeab6a5eb7bac..b2343f051e5b9 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -111,6 +111,7 @@ static void std_init_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 	struct v4l2_ctrl_vp9_frame *p_vp9_frame;
 	struct v4l2_ctrl_fwht_params *p_fwht_params;
 	struct v4l2_ctrl_h264_scaling_matrix *p_h264_scaling_matrix;
+	struct v4l2_ctrl_h264_sps *p_h264_sps;
 	struct v4l2_ctrl_av1_sequence *p_av1_sequence;
 	void *p = ptr.p + idx * ctrl->elem_size;
 
@@ -179,6 +180,18 @@ static void std_init_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 		 */
 		memset(p_h264_scaling_matrix, 16, sizeof(*p_h264_scaling_matrix));
 		break;
+	case V4L2_CTRL_TYPE_H264_SPS:
+		p_h264_sps = p;
+		/*
+		 * Without V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY,
+		 * frame_mbs_only_flag set to 0 will translate to a minimum
+		 * height of 32 (see H.264 specification 7-8). Some driver may
+		 * have a minimum size lower than 32, which would fail
+		 * validation with the SPS value. Set this flag, so that there
+		 * is now doubling in the height, allowing a valid default.
+		 */
+		p_h264_sps->flags = V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY;
+		break;
 	}
 }
 
-- 
2.49.0


