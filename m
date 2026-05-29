Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 255CACD6E49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 04:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DWebs7+LB3ebsJnzaXVAOm3CvPMJPGCS3AcXWbRqA24=; b=kHqQXM/JE+eOLqTV8kQGId7wX4
	Z2bKkVqdDm5SeKWvQhxMZoWXTMdEpyBgo8KUntz6stYltoBUfDeO/TBDwv2J+p3ZGBR6oCkTVj41q
	Fc9m9bllu/wAsYZeyTlmBplaYUPOy4XVAw+Lde4Duh25axDyfhHG4V55881tXluNbx+k58d0Bk2Fd
	p4XEMwvDGJli0Rgiqs/dgPvue8wSbg/G85uMZ3Eou1giPy8vIP1NjKa7GnF4EZXSRkfBf5xVKHy8L
	qMwFf0Hi6U1ogOCBWbDadqBHMqgr8lYc65zWb4xHCOIuMwEPYZ6Vjj6/uYIRh65d6j33KaUFboEYs
	+cQ32aIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSoTt-00000006ibY-2VU3;
	Fri, 29 May 2026 04:05:57 +0000
Received: from mail-m2464.xmail.ntesmail.com ([45.195.24.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSoTn-00000006iXr-2KLi;
	Fri, 29 May 2026 04:05:52 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 404653b80;
	Fri, 29 May 2026 12:05:34 +0800 (GMT+08:00)
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
	cristian.ciocaltea@collabora.com,
	sebastian.reichel@collabora.com,
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
Subject: [PATCH v4 0/3] Add eDP lane mapping support
Date: Fri, 29 May 2026 12:05:27 +0800
Message-Id: <20260529040530.741336-1-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e71e8ae0a03a8kunmaf9a1d48e6b97
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCThpKVh8eGU8fH0xPS09JSlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=EX0fV5U2VSGpba33TzMsCFZZW90mZSSHH2S/G4d3l2NMISqNkFlsVJOuH8HkfQqpMKWAAmZ9Oe861qGr9Deg9tFDMekzaRg7urkUwEz4G05im20HydE2iOK5J+OwHEJo04uwIxO2aYoxnhi3864z4fe+IhDx1dTvucVyfBximAE=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=DWebs7+LB3ebsJnzaXVAOm3CvPMJPGCS3AcXWbRqA24=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_210551_812074_7ABF4151 
X-CRM114-Status: UNSURE (   8.39  )
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

This series adds configurable eDP physical lane mapping support via
device tree data-lanes property.

Lane mapping is mainly used for below scenarios:
1. Correct PCB lane swap and differential line routing crossover
   without hardware changes;
2. Adapt mismatched lane pin definitions between SoC and eDP panel;
3. Support multiple panel hardware variants on the same board
   by configuring data-lanes in device tree only.

The series includes driver implementation and device tree binding
updates to support custom lane mapping configuration from endpoint
node, and keeps default linear lane order if no configuration is given.

Patch 1: Add endpoint data-lanes property to analogix-dp binding
Patch 2: Add validation for samsung,lane-count property as preparation
Patch 3: Implement lane mapping in analogix_dp driver

Damon Ding (3):
  dt-bindings: display: bridge: analogix-dp: Add data-lanes support for
    endpoint
  drm/bridge: analogix_dp: Add validation for samsung,lane-count
    property
  drm/bridge: analogix_dp: Add support for optional data-lanes mapping

 .../bindings/display/bridge/analogix,dp.yaml  | 19 +++--
 .../rockchip/rockchip,analogix-dp.yaml        |  1 +
 .../drm/bridge/analogix/analogix_dp_core.c    | 69 ++++++++++++++++++-
 .../drm/bridge/analogix/analogix_dp_core.h    |  4 +-
 .../gpu/drm/bridge/analogix/analogix_dp_reg.c | 15 ++--
 .../gpu/drm/bridge/analogix/analogix_dp_reg.h |  4 ++
 6 files changed, 96 insertions(+), 16 deletions(-)

---

Changes in v2:
- Add lane mapping application scenarios in commit message.
- Remove redundant deprecated property 'data-lanes' for eDP node.
- Update port@1 $ref to /schemas/graph.yaml#/$defs/port-base.

Changes in v3:
- Squash [PATCH v2 2/3] into [PATCH v2 1/3].
- Add unevaluatedProperties: false to both the port@1 and endpoint
  nodes.

Changes in v4:
- Add validation for samsung,lane-count property as preparation.

-- 
2.34.1


