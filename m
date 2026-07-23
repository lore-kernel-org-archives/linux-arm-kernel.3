Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E60CAC4453F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 01:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5C4KBGp34p6ghtc8dC8WcjbQKC4pVCTe1x6qZCa5kh8=; b=zwyPz9df3XzqkGjO7ivZ4/0DqN
	3GOnvLAtt4XB70ytz4y3WeXL/zqYP7IshVHzfTv3KOY/sGZDzlsTBOynPJGp5z4fvGZ/LjSvzTuue
	SeaZdwf7M4dx9GnG1t1fihK19vjZZeK+lPB6QPkpgyzG1Gt9C4vdfIQhgzzFA6VzOuMRmvMZJcGO/
	FcVCEl3wx4X2yyl2JhfEuvWwHmba1wnVzuTbRm0uu1WozCHbRtKu78i0lxbrbmbB/UfYhRzz2dg8u
	MwRC2K5XpVF1R9UyAesZNm5D+IozPoxZyoUsQJKGWQJkTNTyb1fFee8WF2gLJ1NS9GtK/qYi7BR/2
	NQnwMDgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmiL5-0000000D2pW-3LsH;
	Thu, 23 Jul 2026 01:35:07 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmiL3-0000000D2oS-1BkF;
	Thu, 23 Jul 2026 01:35:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784770502;
	bh=D/Mo27GDMqgDFGKu/PHByp3WOMc3rGEVU+1xPyeAtoA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=o876QeRCxbHDF9CSaJHExc43JFcJYJ28pcHKGlcoCIX+XeaAXj7MWg7TDHVq8/0o9
	 Uoi3pMHxnJ2gp+FVqSK/BQPtPP0TtmpvcicVqs2N7nahwxd47w91b/HzQ2lVF3X6Qf
	 koOKswcV+0eQYFYUftQ8Blmp9LCLeFE5uRN4Df6lSjgNq7kWase/dvppRYBnyg6uTM
	 7l0Bls0tthTQmp/etsq13xn8aJPCQnsFXZcuhfr1dseJipd0JNO8Bnc2hkJOzMANv6
	 h7+0JDQc78REYnNGIS4Ub+lAUupqLaRQdQptXKJqq3pFmzLS/ksopwWSXCfnmooSZF
	 zxiSqROySkLZw==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B992B17E062C;
	Thu, 23 Jul 2026 03:35:02 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 23 Jul 2026 04:34:50 +0300
Subject: [PATCH v9 01/61] video/hdmi: Introduce HDMI version enum
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-dw-hdmi-qp-scramb-v9-1-4fb12ea22ac9@collabora.com>
References: <20260723-dw-hdmi-qp-scramb-v9-0-4fb12ea22ac9@collabora.com>
In-Reply-To: <20260723-dw-hdmi-qp-scramb-v9-0-4fb12ea22ac9@collabora.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Algea Cao <algea.cao@rock-chips.com>, 
 Daniel Stone <daniels@collabora.com>, Liu Ying <victor.liu@nxp.com>, 
 Phong LE <ple@baylibre.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_183505_485115_81E60D6F 
X-CRM114-Status: UNSURE (   8.16  )
X-CRM114-Notice: Please train this message.
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

Add an enum to represent HDMI specification versions.  This will be used
by upcoming changes to associate HDMI connectors and bridges with a
maximum supported version and to simplify handling of version-dependent
features.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 include/linux/hdmi.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/hdmi.h b/include/linux/hdmi.h
index 8dab78e1f61b..b80a5ee63bb2 100644
--- a/include/linux/hdmi.h
+++ b/include/linux/hdmi.h
@@ -27,6 +27,18 @@
 #include <linux/types.h>
 #include <linux/device.h>
 
+enum hdmi_version {
+	HDMI_VERSION_UNKNOWN,
+	HDMI_VERSION_1_0,
+	HDMI_VERSION_1_1,
+	HDMI_VERSION_1_2,
+	HDMI_VERSION_1_3,
+	HDMI_VERSION_1_4,
+	HDMI_VERSION_2_0,
+	HDMI_VERSION_2_1,
+	HDMI_VERSION_2_2,
+};
+
 enum hdmi_packet_type {
 	HDMI_PACKET_TYPE_NULL = 0x00,
 	HDMI_PACKET_TYPE_AUDIO_CLOCK_REGEN = 0x01,

-- 
2.55.0


