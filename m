Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EBB1CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 19:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mc7nblQbAWFFELQ9xDqrj2Jacy9OF+Rdr+ldOYLP6HQ=; b=Gg9hcty4sjKEGWf2/fhF+1nG1w
	DTLeUwuEC6uNXrdaoUsXyMbDxZRN+3XABTlzOMQhNS05eL2imnrqpnNU0E6n6cVrro1KvVIFbKzpx
	GIlLB/Tp8tMOtkkYv8U5SngTtOYHBmMf8yJaDAjfD0Cr0M9G/cgB9WZgR1pMcozJ3aHpx4IgmBHeU
	jn2agElBB+Vbs/F98hFqflgqJ0BfISlT6XhlnO4LbwXCwx6y48PyfpWH6iqnjf20TLAemoq5/G+20
	CpiMZt8KpJQws+9FTMIC6sHYA88K2JlLwhwr03jSbsnRMOhrPbtTf/pT74ZZyF9e15B62l/bIEmpg
	2jKAqHTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP3wd-0000000GlAB-284r;
	Mon, 18 May 2026 19:48:07 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP3wa-0000000Gl77-21bI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 19:48:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From; q=dns/txt; s=fe-e1b5cab7be; t=1779133680;
 bh=mc7nblQbAWFFELQ9xDqrj2Jacy9OF+Rdr+ldOYLP6HQ=;
 b=bpeEtfsqCPpw2Uu4ETHBM8aGVyZSbA0enjMEdnMrfx2JGd7Sn69QzCam+ZY/ssPlEXZgTgv3r
 ojBBZvLM/GsKhNAtQn6mleMxrMpjtO0fpTBnF8JaYRHFQ9WLX/mKaPPRG7qxaD6HHnrDHU7PNWK
 lzzdXOqPhF6uI5/jU86vEsmE3QqwVEaaxgxiEs6v4apPHQVn5ljX9kAPJm69Q2csaXWEzCWds4r
 wbobLkAj+3dSpwst1obF2BEcsW/1zQgF3aoGtSYCo6x4q+lycEFsCnyZ/LKXxZ8s1vptG6grtIh
 yuD0pTRCBzPDVgFtumpaOy3vFCg4HOjNJ0JnE7uLGBpA==
X-Forward-Email-ID: 6a0b6ce8b74b0ebd362eee05
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.8.12
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 00/13] drm/meson: dw-hdmi: Misc cleanup and use CEC notifier helpers
Date: Mon, 18 May 2026 19:47:28 +0000
Message-ID: <20260518194744.2483580-1-jonas@kwiboo.se>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_124804_616084_CFD86C42 
X-CRM114-Status: UNSURE (   7.03  )
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

This series include misc cleanup of the meson-dw-hdmi driver, changes to
use the bridge CEC notifier op and to use the dw-hdmi delayed work for
HPD event handling.

Patch 1 ensure connector status is based on HPD bit
Patch 2 protect from a possible NULL pointer dereference during bind()
Patch 4 reduce number of hotplug uevents and hpd_notify() calls
Patch 6 changes to use bridge connector CEC notifier
Patch 3,5,7-10 cleanup code for consistency
Patch 11-12 changes to use dw-hdmi HPD delayed work at HPD event
Patch 13 changes to use suspend_late/resume_early/resume_noirq pm ops

This series depends on improvements made in the series "drm: bridge:
dw_hdmi: Misc enable/disable, CEC and EDID cleanup" [1].

[1] https://patchwork.freedesktop.org/series/134727/

This series is part of a multi series effort to:
- drm: bridge: dw_hdmi: Misc enable/disable, CEC and EDID cleanup [v7]
- drm/meson: hdmi: Misc cleanup and use CEC notifier helpers [v1]
- drm/bridge: dw-hdmi: Improve input/output bus format handling
- drm/bridge: dw-hdmi: Convert to a HDMI bridge and use of bridge connector
- drm/bridge: dw-hdmi: Add and use tmds_char_rate_valid() plat data ops
- phy: rockchip: inno-hdmi: Change TMDS rate handling to configure() ops [v4]
- drm/rockchip: dw_hdmi: Misc cleanup and propagate bus format [v2]
- drm/rockchip: dw_hdmi: Enable YCbCr and Deep Color modes
Link to snapshot: https://github.com/Kwiboo/linux-rockchip/commits/next-20260518-rk-hdmi-v5/

Jonas Karlman (13):
  drm/meson: dw-hdmi: Report connector status based on HPD bit
  drm/meson: dw-hdmi: Protect from possible NULL pointer dereference
  drm/meson: dw-hdmi: Call dw_hdmi_remove() consistently
  drm/meson: dw-hdmi: Drop call to drm_bridge_hpd_notify()
  drm/meson: encoder_hdmi: Use CEC phys addr from display_info
  drm/meson: encoder_hdmi: Use bridge connector CEC notifier
  drm/meson: encoder_hdmi: Report ycbcr_420_allowed from encoder
  drm/meson: dw-hdmi: Use local dev variable consistently in bind()
  drm/meson: dw-hdmi: Use devm_clk_get_enabled() helper
  drm/meson: dw-hdmi: Use dev_err_probe() to report errors
  drm/bridge: dw-hdmi: Export dw_hdmi_schedule_hpd_work() helper
  drm/meson: dw-hdmi: Use dw_hdmi_schedule_hpd_work() helper
  drm/meson: dw-hdmi: Use suspend_late/resume_early/resume_noirq pm ops

 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c  |  11 +-
 drivers/gpu/drm/meson/Kconfig              |   1 +
 drivers/gpu/drm/meson/meson_dw_hdmi.c      | 169 +++++++++------------
 drivers/gpu/drm/meson/meson_dw_hdmi.h      |   3 +
 drivers/gpu/drm/meson/meson_encoder_hdmi.c | 107 +++----------
 include/drm/bridge/dw_hdmi.h               |   2 +
 6 files changed, 106 insertions(+), 187 deletions(-)

-- 
2.54.0


