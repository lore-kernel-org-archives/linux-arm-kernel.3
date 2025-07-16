Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C3E3C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 11:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0u+F4uSXWp4fu1jXml3y1tvKJ+rRK+QNJHYGF1V9ge4=; b=c9tRlwLdCXd/XAG13LBKjv2qy/
	/aaTncmfrt3LDqEfgZjXYS/gZoLzLO7GGYCio4ZYek/llhj5K02oZBtZAhLIN6Oji1rS5bkFKrakq
	ZLXFwRmU+B0/h26U9SF3IDRMZYYiMZEi3CXcGMpUlJ6DeK2WGJtWwe9alPbCu0JyWTpxLtXt34V17
	TAfB9ZNaOaHw2g1Y8xU/e2SdEA/f9IETMRS77gCfHEp0F2ntlXTgekMWCNipQ7ax/7+qBDvvWnclQ
	z4j1Vbcd044n18att995XcBgaojdyDNmUt5UOAoOVxl3jbJxzNAUrM0NlroCUpXMf1eNX7ZRyvzqB
	UdzEPnIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc0UW-00000007aFQ-301y;
	Wed, 16 Jul 2025 11:40:04 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc0BP-00000007XbG-3WV7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 11:20:21 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56GBJn9E235380;
	Wed, 16 Jul 2025 06:19:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752664789;
	bh=0u+F4uSXWp4fu1jXml3y1tvKJ+rRK+QNJHYGF1V9ge4=;
	h=From:To:CC:Subject:Date;
	b=exTFlg0xv8WWt9fJGv9s9HwmPZX8tmq86TxceyH/7hcnbaTqfzFl7UI9Ek3URsTgU
	 LFUqiQqqsAUpPKbAcD3atZVSg3ETos43IhH3/unU9ok2nk5HLzacugjJ4vjWE2++mJ
	 Ag3SJBwL/NSWvGUdsRMCDvWj1VLdPdsomnuIk2ic=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56GBJnle1343225
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 16 Jul 2025 06:19:49 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 16
 Jul 2025 06:19:48 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 16 Jul 2025 06:19:48 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56GBJep0344714;
	Wed, 16 Jul 2025 06:19:41 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <linux@armlinux.org.uk>, <ardb@kernel.org>, <ebiggers@kernel.org>,
        <geert+renesas@glider.be>, <claudiu.beznea@tuxon.dev>,
        <bparrot@ti.com>, <andre.draszik@linaro.org>,
        <kuninori.morimoto.gx@renesas.com>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <heikki.krogerus@linux.intel.com>, <kory.maincent@bootlin.com>,
        <florian.fainelli@broadcom.com>, <lumag@kernel.org>,
        <dale@farnsworth.org>, <sbellary@baylibre.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <dagriego@biglakesoftware.com>, <u-kumar1@ti.com>,
        <y-abhilashchandra@ti.com>
Subject: [PATCH V2 0/4] Add support for VIP
Date: Wed, 16 Jul 2025 16:49:08 +0530
Message-ID: <20250716111912.235157-1-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_042019_963977_4822F69A 
X-CRM114-Status: GOOD (  17.41  )
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

This patch series add support for the TI VIP video capture engine.
VIP stands for Video Input Port, it can be found on devices such as
DRA7xx and provides a parallel interface to a video source such as
a sensor or TV decoder. 

Each VIP can support two inputs (slices) and a SoC can be configured
with a variable number of VIP's. Each slice can support two ports
each connected to its own sub-device.

The first patch in this series updates the outdated MAINTAINERS entry
for the TI VPE and CAL drivers. The subsequent three patches introduce
support for the TI VIP (Video Input Port) driver.

Link for v1: https://lore.kernel.org/all/20200522225412.29440-1-bparrot@ti.com/
The v1 patch series was posted in the year 2020. This v2 series resumes the
effort to upstream VIP support by addressing all previous review comments

Changelog:
Changes in v2:
- Remove array and just use hsync: true in bindings (Patch 3/5)
- Remove array and use enum for bus width in bindings (Patch 3/5)
- Use pattern properties since properties across ports are same (Patch 3/5)
- Remove vip_dbg, vip_info, vip_err aliases and just use v4l2_dbg, v4l2_info
  and v4l2_err instead (Patch 4/5)
- Remove color space information from vip_formats struct (Patch 4/5)
- Use g_std instead of g_std_output (Patch 4/5)
- Do not touch pix.priv (Patch 4/5)
- Remove all comments with just register values (Patch 4/5)
- Remove support for vidioc_default ioctl (Patch 4/5)
- In case of any error while streaming, push all pending buffers to vb2 (Patch 4/5)
- Address some minor comments made by Hans throughout the driver (Patch 4/5)
- Update copyright year at various places

v4l2-compliance output: https://gist.github.com/Yemike-Abhilash-Chandra/b0791cb465fadc11d4c995197cb22f29

v4l2-compliance cropping and composing tests are failing likely
due to OV10635 sensor supporting several discrete frame sizes,
fail: v4l2-test-formats.cpp(1560): node->frmsizes_count[pixfmt] > 1

Test logs: https://gist.github.com/Yemike-Abhilash-Chandra/98504ab56416aef38b851036aef5eeb1

Dale Farnsworth (2):
  dt-bindings: media: ti: vpe: Add bindings for Video Input Port
  media: ti-vpe: Add the VIP driver

Yemike Abhilash Chandra (2):
  MAINTAINERS: Update maintainers of TI VPE and CAL
  Revert "media: platform: ti: Remove unused vpdma_update_dma_addr"

 .../devicetree/bindings/media/ti,vip.yaml     |  211 +
 MAINTAINERS                                   |    3 +-
 drivers/media/platform/ti/Kconfig             |   13 +
 drivers/media/platform/ti/vpe/Makefile        |    2 +
 drivers/media/platform/ti/vpe/vip.c           | 3824 +++++++++++++++++
 drivers/media/platform/ti/vpe/vip.h           |  719 ++++
 drivers/media/platform/ti/vpe/vpdma.c         |   32 +
 drivers/media/platform/ti/vpe/vpdma.h         |    3 +
 8 files changed, 4806 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/ti,vip.yaml
 create mode 100644 drivers/media/platform/ti/vpe/vip.c
 create mode 100644 drivers/media/platform/ti/vpe/vip.h

-- 
2.34.1


