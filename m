Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F26CBCCD194
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 08:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RSvYSPh8ZvpCq9Tn8rRo74pwoQsk+cPXDxtofOd/xlQ=; b=hFL2eS6qgapmTQcwpugmcoqimc
	qLUmLWd9ctzyh7LTv7s6+wMWc2u/AEiBIfar5+wWmL1EYwUPYAYhJpTBYK/Uwg15Cvv5wLAqJCo8b
	NtAm5ZX+ZXpSoRUOFf2yVABwqafThXCrKmU/17vAVkHkypGCGVvBwzEmjHjFp8UzxXQmQ3L64uD+9
	w8bYIYx17kdupYRxCxe6vZwBEBNFTYlHr9UfpeqSfENXPAvY5pQCtP+vsIaPRtoDYKty5jhG5SFo5
	ht2X0Sf5SjDqDlP4IEHql0ekiC26UBAyStL8iTOldqxvHU1YU5RtGQ8AwaWfRZiV8kCAUjNt3fo0u
	c76d0WDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9JWP-00000003zSp-2Flt;
	Thu, 16 Oct 2025 08:39:41 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9JWN-00000003zQm-0R7T;
	Thu, 16 Oct 2025 08:39:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=RS
	vYSPh8ZvpCq9Tn8rRo74pwoQsk+cPXDxtofOd/xlQ=; b=IXvHAR7fi2TAsfLHVn
	2fLAddoDQPJpeHz+Hc0NSWLC+xBmv3zguiE5uAvUltBapI4Q7QDPwqAvtxclmPkb
	HySd+GNCk9SREAlplFQSf1P2d3GRAx/h2mwx0FMk4yAhZlqMIDPv4A3aCVKxsnZo
	zaVlOiK6ME/Ndg+TjBzMX2h+Y=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wC3f_8Ur_BoSVKcAg--.8978S2;
	Thu, 16 Oct 2025 16:38:48 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: dmitry.baryshkov@oss.qualcomm.com,
	heiko@sntech.de
Cc: mripard@kernel.org,
	neil.armstrong@linaro.org,
	andrzej.hajda@intel.com,
	jernej.skrabec@gmail.com,
	jonas@kwiboo.se,
	Laurent.pinchart@ideasonboard.com,
	maarten.lankhorst@linux.intel.com,
	rfoss@kernel.org,
	simona@ffwll.ch,
	tzimmermann@suse.de,
	knaerzche@gmail.com,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v8 0/2] Convert inno hdmi to drm bridge
Date: Thu, 16 Oct 2025 16:38:30 +0800
Message-ID: <20251016083843.76675-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wC3f_8Ur_BoSVKcAg--.8978S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CF4fZw1rGr4xKr48KrWDCFg_yoW8uF4kpa
	yjyrW5GF47uF1jgFs2kF1fAr1Syan8Jw4S9ryxX34SvFW29F15Aws29F4Yqr9rZr47CFsF
	yrn7Ja47KFy7ZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jv_M3UUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBEg7oXmjwqwOGzAAAsQ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_013939_440256_F1D3C574 
X-CRM114-Status: UNSURE (   9.20  )
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

From: Andy Yan <andy.yan@rock-chips.com>


Convert it to drm bridge driver, it will be convenient for us to
migrate the connector part to the display driver later.

Patches that have already been merged in drm-misc-next are dropped.


Changes in v8:
- Rebase on latest drm-misc-next tag: drm-misc-fixes-2025-10-09
- Link to v7: https://lore.kernel.org/linux-rockchip/20250903110825.776807-1-andyshrk@163.com/

Changes in v7:
- Rebase on latest drm-misc-next
- Link to v6: https://lore.kernel.org/linux-rockchip/20250717081344.1355613-1-andyshrk@163.com/

Changes in v6:
- Rebase on latest drm-misc-next
- Link to V5: https://lore.kernel.org/linux-rockchip/20250512124615.2848731-1-andyshrk@163.com/

Changes in v5:
- Split cleanup code to seperate patch
- Switch to devm_drm_bridge_alloc() API
- Link to V4: https://lore.kernel.org/linux-rockchip/20250422070455.432666-1-andyshrk@163.com/

Changes in v4:
- Do not store colorimetry within inno_hdmi struct
- Link to V3: https://lore.kernel.org/linux-rockchip/20250402123150.238234-1-andyshrk@163.com/

Changes in v3:
- First included in v3
- Link to V2: https://lore.kernel.org/dri-devel/20250325132944.171111-1-andyshrk@163.com/

Andy Yan (2):
  drm/rockchip: inno-hdmi: Convert to drm bridge
  MAINTAINERS: Add entry for Innosilicon hdmi bridge library

 MAINTAINERS                                   |   8 +
 drivers/gpu/drm/bridge/Kconfig                |   7 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 .../inno_hdmi.c => bridge/inno-hdmi.c}        | 501 +++++-------------
 drivers/gpu/drm/rockchip/Kconfig              |   1 +
 drivers/gpu/drm/rockchip/Makefile             |   2 +-
 drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c | 189 +++++++
 include/drm/bridge/inno_hdmi.h                |  33 ++
 8 files changed, 375 insertions(+), 367 deletions(-)
 rename drivers/gpu/drm/{rockchip/inno_hdmi.c => bridge/inno-hdmi.c} (69%)
 create mode 100644 drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c
 create mode 100644 include/drm/bridge/inno_hdmi.h

-- 
2.43.0

base-commit: 21f0c9e6d2835608c3b46ab47d84e341fc7749fc
branch: rk3036_hdmi_bridge_v8


