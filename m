Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D82C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 10:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=58iOZrtE+D/1g0Osi5jfGbMjV7N75KX9EM37JuKBa10=; b=yjd6Y7WWyQpgKi
	b2oyr4F7BXoGAjYq4XVcczPXTW/wWDCS0MkqNyRLNioHh8Dt/EJzZDqfo4JLpmYEEqynS6b97DS3h
	LUkexf7J+ydO8Xa/kC5QgzVydFnJTaAPfN85lD765htLDJIppZWBLGRSij/z+RMFJxQP+xlhcoRVn
	NytJ6uQ22YWbcNbhmEGi42oilC6mpqstBoFAoiGE343yI3RAtsRYCi35hkYQIe0BeVoqSKZAg4LmA
	JohmHmdOmiKJqhh4Rjxj7fdqc8u1hmjiez1uEhZF46JLTTWB/+LY6Xz+QhKkUqP//iHPSTEYxKtY5
	gyKhRt3wwv4tCE/jiYfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzXfI-00000003qTM-1erb;
	Thu, 27 Aug 2026 10:49:00 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzXfD-00000003qSm-05Ut;
	Thu, 27 Aug 2026 10:48:59 +0000
Received: from neptunite.rasen.tech (unknown [IPv6:2400:2411:160:2f00:306c:5b5b:3c7f:eabd])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 61478C1;
	Thu, 27 Aug 2026 12:47:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1787827642;
	bh=o1dAQgAx+m6E/3C1jmsoC6ZdA0OnuiIr4z+WYi2q7Rg=;
	h=From:Subject:Date:To:Cc:From;
	b=tU1dxVB7yXmg6ldj8ZNFbZ4IUEipMlD70A9mlLny+8WOgV2EkOgviV9hUCiLREMk2
	 GrUdkftr/JdgT7X7LzzVQREGhXFVCKZ3NaSPBHtjPvRzD+MbWV0pYZk4tJCFcsu4FU
	 wDJF8g/eibtzgaZZK3FCrxoeWDZaUxlCMo0/chtk=
From: Paul Elder <paul.elder@ideasonboard.com>
Subject: [PATCH v3 0/5] media: rockchip: rkisp2: Add driver for ISP on
 Rk3588
Date: Thu, 27 Aug 2026 19:48:29 +0900
Message-Id: <20260827-rkisp2-v3-0-e91ff0a604d6@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP4VkGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHUUlJIzE
 vPSU3UzU4B8JSMDIzMDCyMz3aLszOICI93kFCNL0zTz1MRUk0QloOKCotS0zAqwQdGxtbUAX52
 Mf1gAAAA=
X-Change-ID: 20260826-rkisp2-cd295f7eae4a
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, michael.riesch@collabora.com, 
 stefan.klug@ideasonboard.com, mehdi.djait@linux.intel.com, 
 xuhf@rock-chips.com, zyc@rock-chips.com, dalong.deng@rock-chips.com
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, Paul Elder <paul.elder@ideasonboard.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_034855_531131_875F014F 
X-CRM114-Status: GOOD (  18.51  )
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

Hello everyone!

This patch series adds a new rkisp2 driver that aims to support all
Rockchip 2.x and 3.x series ISPs. Here we add support for the version on
the RK3588, which as far as I'm aware is a 3.0.

Patches 1 and 2 add dt bindings and dt nodes; patches 3~5 add the actual
driver.

Notable changes from the RFC version:
- fixed a couple potential page fault storms
- use extensible stats (previously only params were extensible)
- no more subdev pad crops; all cropping has been moved to parameter
  buffers so that they can be configured synchronously
- the DMA RX sink pads and the main/self path source pads on the ISP
  subdev have been split into individual pads
- an unused sink pad has been allocated on the ISP subdev for future
  inline mode support (to prevent uapi from changing)

Changes in v3:
- add explicit padding to uapi structs
- reorder patches so that dt goes last
- move uapi header to a nicer location

This series is based on the latest version (v7.2-rc1) (at the time of
posting) of media-commiters/next [0], with some patches on top for
testing on the Orange Pi CM5 Base with an imx708. I have a branch [1]
that integrates this series on top of said patches and
media-committers/next.

Corresponding libcamera patches+branch will be coming soon (within
minutes), but since I cannot send and link these simultanously, you will
have to search the libcamera mailing list :) I'll be sending a v3 to
match the driver v3.

[0] https://gitlab.freedesktop.org/linux-media/media-committers/-/tree/4900cad020c0580dfb1be27776ff10a4ef110cfa
[1] https://git.ideasonboard.com/epaul/linux/src/branch/epaul/v7.2-rc1/rk3588/rkisp2/upstream-v3

To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
To: Dafna Hirschfeld <dafna@fastmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: michael.riesch@collabora.com
To: stefan.klug@ideasonboard.com
To: mehdi.djait@linux.intel.com
To: xuhf@rock-chips.com
To: zyc@rock-chips.com
To: dalong.deng@rock-chips.com
Cc: linux-kernel@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
---
Paul Elder (3):
      media: rkisp2: Add parameters output video node
      media: rkisp2: Add statistics capture video node
      dt-bindings: media: Add rockchip rkisp2

Xu Hongfei (2):
      media: rockchip: rkisp2: Add rkisp2 driver
      arm64: dts: rockchip: add ISP nodes to rk3588

 .../devicetree/bindings/media/rockchip-isp2.yaml   |  125 +
 .../userspace-api/media/v4l/meta-formats.rst       |    1 +
 .../userspace-api/media/v4l/metafmt-rkisp2.rst     |  112 +
 MAINTAINERS                                        |   10 +
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |   57 +
 drivers/media/platform/rockchip/Kconfig            |    1 +
 drivers/media/platform/rockchip/Makefile           |    1 +
 drivers/media/platform/rockchip/rkisp2/Kconfig     |   19 +
 drivers/media/platform/rockchip/rkisp2/Makefile    |   14 +
 .../platform/rockchip/rkisp2/rkisp2-capture.c      | 1540 +++++++++
 .../media/platform/rockchip/rkisp2/rkisp2-common.c |  180 +
 .../media/platform/rockchip/rkisp2/rkisp2-common.h |  620 ++++
 .../media/platform/rockchip/rkisp2/rkisp2-debug.c  |  234 ++
 .../media/platform/rockchip/rkisp2/rkisp2-dev.c    |  372 +++
 .../media/platform/rockchip/rkisp2/rkisp2-dmarx.c  |  706 ++++
 .../media/platform/rockchip/rkisp2/rkisp2-isp.c    |  839 +++++
 .../media/platform/rockchip/rkisp2/rkisp2-params.c | 1167 +++++++
 .../platform/rockchip/rkisp2/rkisp2-regs-v2x.h     | 2625 +++++++++++++++
 .../platform/rockchip/rkisp2/rkisp2-regs-v3x.h     | 3428 ++++++++++++++++++++
 .../media/platform/rockchip/rkisp2/rkisp2-regs.h   | 1736 ++++++++++
 .../platform/rockchip/rkisp2/rkisp2-resizer.c      |  407 +++
 .../media/platform/rockchip/rkisp2/rkisp2-stats.c  |  509 +++
 drivers/media/v4l2-core/v4l2-ioctl.c               |    2 +
 include/uapi/linux/media/rockchip/rkisp2-config.h  |  643 ++++
 include/uapi/linux/rkisp1-config.h                 |    1 +
 include/uapi/linux/videodev2.h                     |    4 +
 26 files changed, 15353 insertions(+)
---
base-commit: 7517ffce3b70c999f6038fc87d4811004d994d25
change-id: 20260826-rkisp2-cd295f7eae4a

Best regards,
-- 
Paul Elder <paul.elder@ideasonboard.com>


