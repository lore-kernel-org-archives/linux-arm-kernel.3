Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BFADE7C70D
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Feb 2026 08:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aqRmpHo6XX+cmlEPlSDptfKyft1oOFmzNX1tdW6dbIM=; b=Gm7WZQs+vNo7VJMZ8dhXe/nYGV
	ILheTJos3mlHyVcQgHV9BKe1rajn6EYhg0YGe5ZHIEiDUIeKuWzbOApXeXq95TYdLG932oIqAoIdN
	L28jQQQQhhCiL7BaRRUzCUTVEJJxWFlHInGBd62LuNhf9fg0CqJv8wE5ykesJDhzVaMd63rnhHhDw
	45lswoj378prMdQk9HOAqM4n+FmwCXcC3UoVIN0CbDBjk0HrdMUp6NauzM7t2MCKFi3n2K2Gkshk8
	CCSIBzW6krkx65Yks1TOy+lg5yiV8nMa79wfOcvsq1BeazEIACcPphhncWObPOycIIXb4m+v4+8xJ
	vEaWDPww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmSbt-00000003Lel-1OD1;
	Sun, 01 Feb 2026 08:15:09 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmSbq-00000003LdC-2xII;
	Sun, 01 Feb 2026 08:15:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=aq
	RmpHo6XX+cmlEPlSDptfKyft1oOFmzNX1tdW6dbIM=; b=K9c/XmC4mo6lHM5a7w
	RczrDbm3oyC/hrWiARL5cVSkg48QS0UJnNXABTkVK2Tks/SNyVd9+A0yqZe/UH28
	tButDg/N45SPjPtc1yRI1AnA1PIGgYpGKBpZgUXLOs8yaOXEMxnkzg4FU4iF9dXj
	nyiCJFcqicqS8Hdyz0PdjCge4=
Received: from ProDesk-480.. (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3Hz40C39pmxGTKQ--.55310S2;
	Sun, 01 Feb 2026 16:13:44 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: dmitry.baryshkov@oss.qualcomm.com,
	heiko@sntech.de
Cc: alchark@gmail.com,
	andrzej.hajda@intel.com,
	conor+dt@kernel.org,
	cristian.ciocaltea@collabora.com,
	airlied@gmail.com,
	jernej.skrabec@gmail.com,
	jonas@kwiboo.se,
	kever.yang@rock-chips.com,
	krzk+dt@kernel.org,
	Laurent.pinchart@ideasonboard.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	nicolas.frattaroli@collabora.com,
	robh@kernel.org,
	rfoss@kernel.org,
	hjc@rock-chips.com,
	sebastian.reichel@collabora.com,
	simona@ffwll.ch,
	tzimmermann@suse.de,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v2 0/5] Add DisplayPort support for rk3576
Date: Sun,  1 Feb 2026 16:13:26 +0800
Message-ID: <20260201081338.407999-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3Hz40C39pmxGTKQ--.55310S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zr1DtFy7trW3Wr4rtw48tFb_yoW8Jw47pa
	nxuFyYyrZ7GFWava43Cr1Uurs0vr1ktrW8Kw17J3y7t3s8GF17Gwn8GFn8Jr9rXF18A348
	ur4UJa47Cr4jvrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jDrcfUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbC7RgLaWl-Czhr1gAA3P
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260201_001507_142686_D1E89133 
X-CRM114-Status: GOOD (  10.20  )
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


The DisplayPort found on RK3576 is very similar to that of RK3588,
but work in dual pixel mode and support for MST.

This patch series aims to add basic display output, not include audio
and MST, which will be the work for the next stage.

Tested with 2 lane standard DP port and USB-C Alt mode output now.
For those who want to give it a try, I have a reference branch here[0].

[0]https://github.com/andyshrk/linux/tree/rk3576-dp-upstream-v1


Changes in v2:
- Remove unnecessary maxItems
- Commit message improve: The pixel mode is determined during the IC
  integration stage

Andy Yan (5):
  dt-bindings: display: rockchip: Add rk3576 DisplayPort
  drm/bridge: synopsys: dw-dp: Set pixel mode by platform data
  drm/bridge: synopsys: dw-dp: Make i2s/spdif clk optional
  drm/rockchip: dw_dp: Add DisplayPort support for rk3576
  arm64: dts: rockchip: Add DisplayPort dt node for rk3576

 .../display/rockchip/rockchip,dw-dp.yaml      | 27 ++++++++++++++++--
 arch/arm64/boot/dts/rockchip/rk3576.dtsi      | 28 +++++++++++++++++++
 drivers/gpu/drm/bridge/synopsys/dw-dp.c       | 12 ++------
 drivers/gpu/drm/rockchip/dw_dp-rockchip.c     | 27 +++++++++++++++---
 include/drm/bridge/dw_dp.h                    |  7 +++++
 5 files changed, 85 insertions(+), 16 deletions(-)

-- 
2.43.0


