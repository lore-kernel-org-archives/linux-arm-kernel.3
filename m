Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10216CD4F58
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 19:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TlU0GMVOxYk1PemQNJopSc+GPnvpfNyuL2IXfnUOPOA=; b=3kyvIraVMgXs9yX7SmWDgOx1HC
	XHlgphi26g0G0RKt3YmNPThK/r8EuCgpPzRPTzQDQsJ4rJ/GcNq+wqdplO4jBjoAdcMA+uKOFjXbv
	uEMcJsHSON2MBtVbBYilp4nT4EfULTn7RGXRfgyFz9hO9NlcskEb7MnTvtMAx0FOJsP7eD+4zsezW
	+CqWrjFgdMhjyydvu8n0XWi/NqFVOS3VJcW4GZr9e41QsjwDLz70V7rsvs1IcoCloY4G1bFjrXRuu
	ZifuxdDhM5sHJ7esLMMD0+RcwVm8Tf77GyOwrzQwTseqS3j9T1z44gabGz5x/QIRnm2bsvoXVObyo
	BVE6jNDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP3n2-0000000Ghqg-23Wq;
	Mon, 18 May 2026 19:38:12 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP3mx-0000000GhnD-097g
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 19:38:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From; q=dns/txt; s=fe-e1b5cab7be; t=1779133086;
 bh=TlU0GMVOxYk1PemQNJopSc+GPnvpfNyuL2IXfnUOPOA=;
 b=bd2cD0QQorwjSpo+x/GJnMQ01pcjhhtVTDNRInCu6eilTe0YiVXWoz30hdluyUv8j7QL/H4j+
 moISN/lNUQ/vXEoPUCyfRHcQGYRL8nSW5T8W8alsTF3LiZnh9BvkAQv5kbPI1E9DZULsCDwC/Kk
 rpqOUsWDlC8N5iXZaShPDG42fo6j2qc8huLe0Z/DCTV+eEUQO7xz5RvEW6FnvhuNgIZi/FrcxbD
 KzoIjyU+YHIfWheDd/kh0gAx/xi2OtQt3ZLpPA3PuvZNHkv6Luxg2j7sS+fjoXulsxQOaa+vXPR
 uDg1erd9YAu6id5AhVpSK9A7H2/3wGNc1DUAco6VrGOw==
X-Forward-Email-ID: 6a0b6a92486b4b38b826f99f
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.8.12
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v2 00/11] drm/rockchip: dw_hdmi: Misc cleanup and propagate bus format
Date: Mon, 18 May 2026 19:37:34 +0000
Message-ID: <20260518193748.2482823-1-jonas@kwiboo.se>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_123807_066691_78AB1E96 
X-CRM114-Status: UNSURE (   8.67  )
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

This series include misc cleanup of the dwhdmi-rockchip driver and
prepares for future support of YCbCr output and Deep Color modes.

Patch 1-7 cleanup and changes to use drmres helpers for the encoder.
Patch 8 prepare for use of a display-connector bridge for RK3568/RK3566.
Patch 9-10 prepares for future support of YCbCr and Deep Color modes.
Patch 11 changes to use resume_early pm ops for system suspend.

This series depends on the patch "drm/rockchip: dw_hdmi: avoid direct
dereference of phy->dev.of_node" [1] from the series "Split Generic PHY
consumer and provider API" [2].

[1] https://lore.kernel.org/linux-phy/20260505100523.1922388-16-vladimir.oltean@nxp.com/
[2] https://lore.kernel.org/linux-phy/20260505100523.1922388-1-vladimir.oltean@nxp.com/

This series is part of a multi series effort to:
- phy: rockchip: inno-hdmi: Change TMDS rate handling to configure() ops [v4]
- drm/rockchip: dw_hdmi: Misc cleanup and propagate bus format [v2]
- drm: bridge: dw_hdmi: Misc enable/disable, CEC and EDID cleanup [v7]
- drm/meson: hdmi: Misc cleanup and use CEC notifier helpers [v1]
- drm/bridge: dw-hdmi: Improve input/output bus format handling
- drm/bridge: dw-hdmi: Convert to a HDMI bridge and use of bridge connector
- drm/bridge: dw-hdmi: Add and use tmds_char_rate_valid() plat data ops
- drm/rockchip: dw_hdmi: Enable YCbCr and Deep Color modes
Link to snapshot: https://github.com/Kwiboo/linux-rockchip/commits/next-20260518-rk-hdmi-v5/

Changes in v2:
- Add patch to use resume_early pm ops for system suspend
- Adjust error messages related to the dw-hdmi bridge
- Use dw_hdmi_unbind() instead of dw_hdmi_remove()
Link to v1: https://lore.kernel.org/dri-devel/20260510183114.1248840-1-jonas@kwiboo.se/

Jonas Karlman (11):
  drm/rockchip: dw_hdmi: Use of_device_get_match_data() to get match
    data
  drm/rockchip: dw_hdmi: Use local dev variable consistently in bind()
  drm/rockchip: dw_hdmi: Use drmres helpers for encoder resources
  drm/rockchip: dw_hdmi: Inline resource lookup into bind()
  drm/rockchip: dw_hdmi: Hold a reference to the dw-hdmi bridge
  drm/rockchip: dw_hdmi: Remove empty encoder helper funcs
  drm/rockchip: dw_hdmi: Clean up whitespace
  drm/rockchip: dw_hdmi: Set output_port for RK3568/RK3566
  drm/rockchip: dw_hdmi: Configure HDMI PHY in atomic_mode_set()
  drm/rockchip: dw_hdmi: Propagate bus format to display driver
  drm/rockchip: dw_hdmi: Use resume_early pm ops for system suspend

 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 227 ++++++++++++--------
 1 file changed, 133 insertions(+), 94 deletions(-)

-- 
2.54.0


