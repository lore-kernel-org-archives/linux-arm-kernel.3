Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 609DF10AB838
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 00:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=k3VWpDlrifc7ElXqCtPp83/OifSkfsYl8ZjQGXiR3o8=; b=WcET1sfW1ZhFTZ
	VUsbJstC4is5++GjeqFHT7g4z9vjsJVbI3GJX+oehry3RWdsV7WOl0CZ7I99icvUqqJaeRXlj9X46
	yYhKu5j0MjX34Qg8oQ2hNhXKgjNLiU/QQI6JGpchMtfaWE57hVMXp5EFL7mNVT/DkfLp84iwv1l5g
	uiOAEB28f2db9BLWX1Y2xDkJnCqv9zZAg3dN1EtQBw4w1eevw7toHlba3dbWz+eEZMGrMvWHmI5DK
	QFkZLWgymR/08RWC36wPSyigOH3YJB2KWtUrAQuL9XxqqG3bPKl0e8hsqnSvTvletdhTlugpNxlGI
	qVdK4H/x6Pf+WAziFYtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5vUD-00000006S2z-0nd5;
	Fri, 27 Mar 2026 00:55:41 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5vU8-00000006S1m-3v7g;
	Fri, 27 Mar 2026 00:55:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774572932;
	bh=tziTw9WjJXg9ysB8nqoQ8JdDk/cS9+M+QzzINfFb2ic=;
	h=From:Subject:Date:To:Cc:From;
	b=Ryy9Qe44pyXOT9TY7RhEmOPZV/qkiBk8JmgCAQCUtANUhBp63shZkIsdOadLIw83N
	 AlhO8/HS89QoeRPg5UXO2wwKmYtBI7Vn3pna0g1dRqHptl60NiBYVCHsy7POpR3+VE
	 3pFW7vkOH6JWq5zPQVq6PNayRdfoSVWBZh0rAL7bmbrg0Pzw3NfiG0cZ+E6jtT4Riu
	 7K+43U4RArQyewtZ44k4RGfB/LxWLQbRLQLLciiJ2Uv976I5HLF+iQRQKTAtqHjGLm
	 LbBMC7/3TCr0b8EKOl8GdQOpo90X8PBYtYTjgUpjAogAhfdbrVYaEAxkuYKHuq2vf/
	 p9MffmRwpBQJg==
Received: from localhost (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2356417E5D08;
	Fri, 27 Mar 2026 01:55:32 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH v3 0/2] Rockchip DRM use-after-free & null-ptr-deref fixes
Date: Fri, 27 Mar 2026 02:55:06 +0200
Message-Id: <20260327-drm-rk-fixes-v3-0-fd2e6900c08c@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XMQQ7CIBCF4as0rMXAAK115T2MC0oHS2yLAUM0D
 XeXdmPSxOU/k/ctJGJwGMm5WkjA5KLzcwlxqIgZ9HxH6vrSBBjUjAPQPkw0PKh1b4xUNzWAabh
 SAkmZPANuj7K43koPLr58+Gx64uv1D5Q4ZVS0Eiw/qUYxvBg/jrrzQR+Nn8iKJfgBgrMdAAWop
 UJjOymsbPdAzvkLVHg+LO0AAAA=
X-Change-ID: 20260122-drm-rk-fixes-a7622c71553e
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_175537_141389_ECD40875 
X-CRM114-Status: UNSURE (   8.41  )
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

The first three patches in the series are fixes for use-after-free &
null-ptr-deref related issues found in dw_dp and inno-hdmi Rockchip DRM
drivers.

The following three patches provide a few minor improvements to dw_dp
and dw_hdmi_qp, while the remaining two address use-after-free and
memory allocation in DW DP core library.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Changes in v3:
- Dropped patches 1..6,8 already applied by Heiko
- Reworked remaining patch "drm/bridge: synopsys: dw-dp: Unregister AUX
  channel on bridge detach" into:
  * drm/bridge: synopsys: dw-dp: Support unregistering the AUX channel
  * drm/rockchip: dw_dp: Release core resources
- Link to v2: https://lore.kernel.org/r/20260310-drm-rk-fixes-v2-0-645ecfb43f49@collabora.com

Changes in v2:
- Fixed conflicts while rebasing onto latest drm-misc-next
- Added two more patches:
  * drm/bridge: synopsys: dw-dp: Unregister AUX channel on bridge detach
  * drm/bridge: synopsys: dw-dp: Drop useless memory allocation
- Link to v1: https://lore.kernel.org/r/20260122-drm-rk-fixes-v1-0-3942f185750e@collabora.com

---
Cristian Ciocaltea (2):
      drm/bridge: synopsys: dw-dp: Support unregistering the AUX channel
      drm/rockchip: dw_dp: Release core resources

 drivers/gpu/drm/bridge/synopsys/dw-dp.c   |  6 ++++++
 drivers/gpu/drm/rockchip/dw_dp-rockchip.c | 20 +++++++++++++++++---
 include/drm/bridge/dw_dp.h                |  1 +
 3 files changed, 24 insertions(+), 3 deletions(-)
---
base-commit: 46c31e1604d121221167cb09380de8c7d53290b9
change-id: 20260122-drm-rk-fixes-a7622c71553e


