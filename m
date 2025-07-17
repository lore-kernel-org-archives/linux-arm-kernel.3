Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 120E5C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 09:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PMuQNuZHynTbdVNIIMfLYsoElWxgT4IgmjP+PUnkAhE=; b=PTOfCuOToej+WZfdTvK5U+YQXk
	od2NegZANWh8VyFlB8njI5RBys5z/s+Lb4ps1IE3TOZDCZA56kZ18SCJHz+T7zp6dyMusF7HWlTLl
	8HaqAHRhmkZE+cozae9nLmPW+znFiDKCheTGqDF6afv3uRHS33hMODvjRUhwH0xk6fTsHDfipECxZ
	XJ+GHmT6qWFDoUdNuq2aZ+XZ/78sLtJVALzjck9RigNx37ihxRe/JQfKbUZAdXR85I8oVp8NKIrRv
	gkFzzdcykyPs47yDnFfQ8dy6Q5iijhHLXcY73C9pG2gpqw5iK5H6Qnv3/JRvQ1kw4oJitaiNlj3EW
	SCqeCC6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucKYq-00000009g9J-2xhJ;
	Thu, 17 Jul 2025 09:05:52 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucJlM-00000009YT0-0wX5;
	Thu, 17 Jul 2025 08:14:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=PM
	uQNuZHynTbdVNIIMfLYsoElWxgT4IgmjP+PUnkAhE=; b=TvgTb5T26kOQQME21A
	rSt6O9iaTj5y0O98gp0B8BCR09PO2g5iG5DoWNqqyWGNf4uFFaC0W5u4mUM3xXow
	HJ9/XRYo8bxTfL9mKBh+P06smcWimkZKt9zgWgRCuR/3C/5+GqzGZH6LTY1MsgSu
	yrg28+uPBPWYBDEcdekX5iGhE=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wCHFbq9sHhoLS7XFQ--.22249S2;
	Thu, 17 Jul 2025 16:13:55 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: dmitry.baryshkov@oss.qualcomm.com,
	heiko@sntech.de
Cc: conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	hjc@rock-chips.com,
	mripard@kernel.org,
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
Subject: [PATCH v6 0/2] Convert inno hdmi to drm bridge
Date: Thu, 17 Jul 2025 16:13:35 +0800
Message-ID: <20250717081344.1355613-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCHFbq9sHhoLS7XFQ--.22249S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CF4fZw1rGr45tr45KF4Durg_yoW8Ar43pa
	17Cry5CF47CF42grs7CF4fAr1Syan8Jw4S9ry7X34SvFW29F1UArna9F4Fqr9rZr47CF42
	yrZ7Ja47KFy7ZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jv_M3UUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiMxyNXmh4rblpeQAAso
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_011444_566705_60618C0A 
X-CRM114-Status: UNSURE (   9.00  )
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


Changes in v6:
- Rebase on latest drm-misc-next
- Link to V5: https://lore.kernel.org/linux-rockchip/20250512124615.2848731-1-andyshrk@163.com/

Changes in v5:
- Split cleanup code to seperate patch
- Switch to devm_drm_bridge_alloc() API
- Link to V4: https://lore.kernel.org/linux-rockchip/20250422070455.432666-1-andyshrk@163.com/
- First included in this version

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
 .../inno_hdmi.c => bridge/inno-hdmi.c}        | 502 +++++-------------
 drivers/gpu/drm/rockchip/Kconfig              |   1 +
 drivers/gpu/drm/rockchip/Makefile             |   2 +-
 drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c | 188 +++++++
 include/drm/bridge/inno_hdmi.h                |  33 ++
 8 files changed, 374 insertions(+), 368 deletions(-)
 rename drivers/gpu/drm/{rockchip/inno_hdmi.c => bridge/inno-hdmi.c} (69%)
 create mode 100644 drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c
 create mode 100644 include/drm/bridge/inno_hdmi.h

-- 
2.43.0


