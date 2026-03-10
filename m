Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E5FDEB104D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 10:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wtwKbDCYEYbWJ1+AjIvX8amjBKFQOPqxNimGoabF6Mk=; b=f0HFPQY3KTct8FFjdKl2reWd56
	AZ8uKSZAzBMNKmvB0XMIlJJ0l4ByZSpT7Vr+4q0jfizjydsHgWzsN0B34XXbVkNGiMtmvc5UcKgpy
	WwHFTt6nGjZwPQB5BGZmaolTqfD1OkSGkuI4wHDQg7pptL+fuMUvjiJ5xT4lQs2DDqGiXKtLGKOZS
	8nGt+DFdD7OrnldTou5OCHd9e2j2uU+zjc1vyCskYYmjb7f7kvX3GzczaVI3Eu0mJRRFIevZtYT4b
	SvefYE8FuIfFu8Q31H9nIU01fyZpKGHXCrL2f5U381MhPAfG1OFYJYWR1JMoR6qm+xNLqnG3kpSs1
	jVtmKLFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzujp-00000009EdP-0Tnk;
	Tue, 10 Mar 2026 10:54:57 +0000
Received: from mail-m1973184.qiye.163.com ([220.197.31.84])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzujl-00000009Ebr-3nKp;
	Tue, 10 Mar 2026 10:54:55 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 366858a4d;
	Tue, 10 Mar 2026 18:54:47 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: hjc@rock-chips.com,
	heiko@sntech.de,
	andy.yan@rock-chips.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	nicolas.frattaroli@collabora.com,
	alchark@gmail.com,
	cristian.ciocaltea@collabora.com,
	sebastian.reichel@collabora.com,
	kever.yang@rock-chips.com,
	dmitry.baryshkov@oss.qualcomm.com,
	luca.ceresoli@bootlin.com,
	dianders@chromium.org,
	m.szyprowski@samsung.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v1 0/4] Add eDP support for RK3576
Date: Tue, 10 Mar 2026 18:53:03 +0800
Message-Id: <20260310105307.309765-1-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9cd7628fea03a3kunm866f47e7374c04
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQhhJGFYeQ0hJTh9DGktJGkNWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=YjU5ZYhk800jrdAf3wByeCDk5mJyVYv3fsw3MBEj26IblLDEsgscryftL/ilV+gAucWKzs1T9MSmCOpM4+0iMKd/cax5BjpWFJyeOtP0vRJxoydRn01UV+wS2bGV7LH2aEOXaQLZ8ELkzORb1x0vXYZfkAeIZJAE+oxqpXirti0=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=wtwKbDCYEYbWJ1+AjIvX8amjBKFQOPqxNimGoabF6Mk=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_035454_092413_E29A62D2 
X-CRM114-Status: UNSURE (   8.10  )
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

These patchs have been tested with a 1536x2048p60 eDP panel on
RK3576 EVB1 board (hardware modified specially).

Patch 1~2 are to add the RK3576 eDP node.
Patch 3~4 are to support the RK3576 Analogix DP controller.

Damon Ding (4):
  dt-bindings: display: rockchip: analogix-dp: Add support for RK3576
  arm64: dts: rockchip: Add eDP node for RK3576
  drm/bridge: analogix_dp: Add support for RK3576
  drm/rockchip: analogix_dp: Add support for RK3576

 .../rockchip/rockchip,analogix-dp.yaml        |  6 +++-
 arch/arm64/boot/dts/rockchip/rk3576.dtsi      | 28 +++++++++++++++++++
 .../drm/bridge/analogix/analogix_dp_core.c    |  1 +
 .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 15 ++++++++++
 include/drm/bridge/analogix_dp.h              |  3 +-
 5 files changed, 51 insertions(+), 2 deletions(-)

-- 
2.34.1


