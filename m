Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD301CD5BC9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 09:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dJmxlSvWQVKoc/7QuMVj+YRRA1DlN4UUW864zJ29Qm8=; b=Zj9YHtUOIFduQ30hnYB8wVp6KI
	eJZzrGfxz45vrwtqh688fFl3HCSNVExGCVwAd4D9YYscaJtNIzEaYYJDINfHfkD0ONK+I9ru0zaxn
	Hxrxpldy+k4wXVBnIZy6KcgUU73bnipojWVqbZ74kNRyj1asvzfKXeY5okfnfGEWvSd8Fq9wcROKJ
	MV9j+c2phZrLFy9GA/hsHlYhcQpfVKepyBexuWr4UL4kKYIt1riah2kplXTNJ4rQiZprXyoUG38LO
	bV7WTn1PpjuHaeR0c6ok0ZXhRewp5QZeo1Ms+yewXVdOr1mCa04Qri4jea6/LJPaN6xTfaqomRMc+
	G5OfBE2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRRuR-0000000GrDa-0gLc;
	Mon, 25 May 2026 09:47:43 +0000
Received: from mail-m10143.netease.com ([154.81.10.143])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRRuN-0000000GrBh-2yES;
	Mon, 25 May 2026 09:47:41 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3fb5f0035;
	Mon, 25 May 2026 17:47:33 +0800 (GMT+08:00)
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
Subject: [PATCH v3 0/2] Add eDP lane mapping support
Date: Mon, 25 May 2026 17:47:29 +0800
Message-Id: <20260525094731.121380-1-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e5e8855eb03a3kunm84eb206f10f6de
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaT0tKVhgaTE8YHUJOGEMaHVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=LhdM9J5K8Ff4EF6h/eqz/71N+GCQt1zn7XF4QRbFUj85GTayKMHtqx+Zn5aNDYN9GHdaN5LdhKHzg7EAebf9qSSuLxTZLdVjaT4JppPiW76gzei2ODx/QYnLjDW3t1VZ/mS8U2EdNM8BKpyCfPfmOSkBuE5otmOybJWOMHyVwH0=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=dJmxlSvWQVKoc/7QuMVj+YRRA1DlN4UUW864zJ29Qm8=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_024740_303163_409922A5 
X-CRM114-Status: UNSURE (   8.94  )
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
Patch 2: Implement lane mapping in analogix_dp driver

Damon Ding (2):
  dt-bindings: display: bridge: analogix-dp: Add data-lanes support for
    endpoint
  drm/bridge: analogix_dp: Add support for optional data-lanes mapping

 .../bindings/display/bridge/analogix,dp.yaml  | 19 +++++--
 .../rockchip/rockchip,analogix-dp.yaml        |  1 +
 .../drm/bridge/analogix/analogix_dp_core.c    | 56 +++++++++++++++++++
 .../drm/bridge/analogix/analogix_dp_core.h    |  4 +-
 .../gpu/drm/bridge/analogix/analogix_dp_reg.c | 15 +++--
 .../gpu/drm/bridge/analogix/analogix_dp_reg.h |  4 ++
 6 files changed, 85 insertions(+), 14 deletions(-)

---

Changes in v2:
- Add lane mapping application scenarios in commit message.
- Remove redundant deprecated property 'data-lanes' for eDP node.
- Update port@1 $ref to /schemas/graph.yaml#/$defs/port-base.

Changes in v3:
- Squash [PATCH v2 2/3] into [PATCH v2 1/3].
- Add unevaluatedProperties: false to both the port@1 and endpoint
  nodes.

-- 
2.34.1


