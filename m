Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A259CD37B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 18:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LWC2Dyj1Ts06tYFJbPdEZrK3i8UqPILa8yBO4xt6oB4=; b=mhwpu9mFA9iTIfvvDNeJp661C/
	eSSzokgD+/EJZAOHD56c6fd5s8E+Tznq1rDZ3oR7C6254+KIyzoDeC62VJ/EZFb0GfKpHkA4rQyY2
	KoZTGlmeiWXAMuB/vg7DQMJHm9g7Ei1TaN22L/cFnbKyogvNKtLBGEhuDoXywT6smMzj3PXKSzzOl
	2LdHb/SKSkGczwkZg7jsrYyWio4LZuRfVsauWnnhGwdcfyt84PLFyntV6ERHhrvwW5W7Wd+NatYwr
	5O4WXLWH43NUgLJW4e8aVA8QKF0R7XIp5LZRKEXZI6V7bTUWAaA67MacSDGcY7RKZl19QSmZ2VqgY
	f0HZ0XQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM8ww-0000000BMlx-1CnS;
	Sun, 10 May 2026 18:32:22 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM8wt-0000000BMe1-1Npg
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 May 2026 18:32:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From; q=dns/txt; s=fe-e1b5cab7be; t=1778437929;
 bh=LWC2Dyj1Ts06tYFJbPdEZrK3i8UqPILa8yBO4xt6oB4=;
 b=SytIGQLztuhiWZhevaN86kyIiUbLOlvWxXcj0oYc4je5X6ufhAWQkfBI8sOTrRfx00tIsKhTe
 QgNKb5k8t6lKRDgXkem3lM7ZSpM5TOunv56EAc2Vo8iBeeTdhqfMPlrDyyIk+Jy6J5lPzoYV7OU
 YhLJK/wye0n5BaSxk6E1Fl9fJ8UJGh/7NeVBhsUxeO+RdEO6QXZ1OguG7MXk1bT1HbqAcWKRjz6
 JZ2ltYluKsAmgFKLSPCQTxtSHYvouwSDJuD4ZApaGN7cTQh5rjPT92Ir4wZ9LjLkscOe4MhriAT
 ABzt6wF2EkvM3KcMgAu18L9SjvjGAq27KiBOqVzJLd2Q==
X-Forward-Email-ID: 6a00cef861db3ab145b0f20b
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.8.0
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
Subject: [PATCH 00/10] drm/rockchip: dw_hdmi: Misc cleanup and propagate bus format
Date: Sun, 10 May 2026 18:31:01 +0000
Message-ID: <20260510183114.1248840-1-jonas@kwiboo.se>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_113219_433313_24192109 
X-CRM114-Status: UNSURE (   6.96  )
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

This series depends on the patch "drm/rockchip: dw_hdmi: avoid direct
dereference of phy->dev.of_node" [1] from the series "Split Generic PHY
consumer and provider API" [2].

[1] https://lore.kernel.org/linux-phy/20260505100523.1922388-16-vladimir.oltean@nxp.com/
[2] https://lore.kernel.org/linux-phy/20260505100523.1922388-1-vladimir.oltean@nxp.com/

This series is part of a multi series effort to:
- phy: rockchip: inno-hdmi: Change TMDS rate handling to configure() ops [v2]
- drm/rockchip: dw_hdmi: Misc cleanup and propagate bus format [v1]
- drm: bridge: dw_hdmi: Misc enable/disable, CEC and EDID cleanup [v5]
- drm/bridge: dw-hdmi: Improve input/output bus format handling
- drm/bridge: dw-hdmi: Convert to a HDMI bridge and use of bridge connector
- drm/bridge: dw-hdmi: Add and use tmds_char_rate_valid() plat data ops
- drm/meson: hdmi: Misc cleanup and use CEC notifier helpers
- drm/rockchip: dw_hdmi: Enable YCbCr and Deep Color modes
Link to snapshot: https://github.com/Kwiboo/linux-rockchip/commits/next-20260508-rk-hdmi-v3/

Jonas Karlman (10):
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

 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 220 ++++++++++++--------
 1 file changed, 129 insertions(+), 91 deletions(-)

-- 
2.54.0


