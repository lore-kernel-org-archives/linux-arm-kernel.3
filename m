Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DD94E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 08:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iMPbRBdbrgKzjYWcrnT31MnocUukSFKsUhXGUgul7OQ=; b=vuHXisvYNfA4seIPMQaW6T38l0
	LO+pLRPNR2cRy0FuDveRNnep4q3OwrX9Lx+vZO7ihayxsRRRhecQtef5xEsLjzv85/jXD0CM/ZGTf
	5vwFn9zM/hnpv6/jBfmas0bLLUvjj2yiMo2PbPmSmmiNr7ClEujEgf8yGXO2Zz45mhQ+dEl/h1hA9
	cjXQMJnP/FAvFNUgHybCjDaectaou8Ur0ILYp1vXLzWsY+szdt22FyuTRXHPM9Kuwnrc5iwSRN7LW
	2cmLcAm4EJjtbAL7x31CmpwLnLEzsujH974ef3LpU0oWAf+9ShmQbHUJt4n94aGSLzZRvPFgtHWaS
	QPpirdAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMNXy-000000060sg-0jE3;
	Sat, 14 Dec 2024 08:30:46 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMNLI-00000005y7p-1zP6;
	Sat, 14 Dec 2024 08:17:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=iMPbR
	BdbrgKzjYWcrnT31MnocUukSFKsUhXGUgul7OQ=; b=hfrmISJKBgWjToJAMnpQd
	6Cdrk4q7rPPSvaBaPOXxUgUJLu+3xsvA0Ae1GKMUihnRPZYezW3v3isz9oTrNyO2
	tINnHVQqAKNAdkN+EE2J5X/NNcfJkDdBChwJG7e5kZnsnB4kd1D+7hWZhpy89KmK
	XTptAG2/fVYfjjlZmU4hfk=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3fwEQP11ntNLtAQ--.5686S2;
	Sat, 14 Dec 2024 16:17:24 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com,
	krzk+dt@kernel.org,
	s.hauer@pengutronix.de,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	derek.foreman@collabora.com,
	detlev.casanova@collabora.com,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v6 00/16] VOP Support for rk3576
Date: Sat, 14 Dec 2024 16:16:59 +0800
Message-ID: <20241214081719.3330518-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3fwEQP11ntNLtAQ--.5686S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxuF1xtF48CF43WF17Zw1DZFb_yoW5ZF4xpa
	98CryrZrWxGFyjqrs7Jw4DCrWSqwnayay7Ww4fG3ZrJasxGF9rKr9I9F15ZrW3X3W8Za1U
	CF4fX34UKFs0vFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UubytUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqRS1XmddM6yz2wAAsb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_001740_833107_EBFCF44E 
X-CRM114-Status: GOOD (  14.12  )
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


Thanks for the basic work from Collabora, I can bringup a HDMI
display out on rk3576.

PATCH 1 is a carryover from the working when add support for
    rk3588[0], is very usefull when some people want me
    help debug some issue online, so I really hope it can
    be merged at this round.
PATCH 2~8 are bugfix of rk3588 alpha blending which report and
    test by Derek
PATCH 9~13 are preparations for rk3576 support
PATCH 17~18 are real support for rk376

I test it with a 1080P/4K HDMI output with modetest and weston
output.

If there are some one want to have a try, I have a tree based on
Linux 6.13-rc2 here[1]

[0]https://patchwork.kernel.org/project/linux-rockchip/cover/20231211115547.1784587-1-andyshrk@163.com/
[1]https://github.com/andyshrk/linux/tree/rk3576-vop2-upstream-v5

Changes in v6:
- Remove unnecessary blank line.
- Limit line length not exceeds 100
- Move the linear check to format_mod_supported() hook
- Move 32 bpp check to format_mod_supported() hook
- Add a blank line after hardware version check code
-  More specific explanation about the AXI_BUS_ID register bit of
   cluster window.
- Collect Tested-by

Changes in v5:
- Added in V5
- Added in V5
- Added in V5
- Add axi id configuration
- Remove the non-existent CBCR scale register.

Changes in v4:
- Typo fix: selet->select

Changes in v3:
- Split it from 10/15, as it fix a exiting compile warning.
- Add comments for why we should treat rk3566 with special care.
- Add hardware version check
- Add comments for why we should treat rk3566 with special care.
- ordered by soc name
- Add description for newly added interrupt
- Share the alpha setup function with rk3568
- recoder the code block by soc

Changes in v2:
- split it from main patch add support for rk3576
- Add platform specific callback
- Introduce vop hardware version
- Add dt bindings
- Add platform specific callback

Andy Yan (15):
  drm/rockchip: vop2: Add debugfs support
  drm/rockchip: vop2: Fix the windows switch between different layers
  drm/rockchip: vop2: Set AXI id for rk3588
  drm/rockchip: vop2: Setup delay cycle for Esmart2/3
  drm/rockchip: vop2: Check linear format for Cluster windows on
    rk3566/8
  drm/rockchip: vop2: Add check for 32 bpp format for rk3588
  drm/rockchip: vop2: Support 32x8 superblock afbc
  drm/rockchip: vop2: Add platform specific callback
  drm/rockchip: vop2: Support for different layer select configuration
    between VPs
  drm/rockchip: vop2: Introduce vop hardware version
  drm/rockchip: vop2: Register the primary plane and overlay plane
    separately
  drm/rockchip: vop2: Set plane possible crtcs by possible vp mask
  drm/rockchip: vop2: Add uv swap for cluster window
  dt-bindings: display: vop2: Add rk3576 support
  drm/rockchip: vop2: Add support for rk3576

Min-Hua Chen (1):
  drm/rockchip: vop2: include rockchip_drm_drv.h

 .../display/rockchip/rockchip-vop2.yaml       |   13 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c  | 1638 ++++----------
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h  |  292 ++-
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c  | 2014 ++++++++++++++++-
 4 files changed, 2793 insertions(+), 1164 deletions(-)

-- 
2.34.1


