Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D080C36017
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 12:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oGUkH84hkPBzmx/lS7RDwXwqM5OPP1Xjz5Ep4c4bpzw=; b=09NbDqLGjFf0WtF1jstOqkiKLW
	VvZH1ENKZ9y7WuuBkvuuL8trxQOSHYDyRYDTqwB450M4v2IlwBkWqkpXp1a/7bjFNKEaeA5YHTz6G
	km4WZzDUSTomaOiBuF6coMIduzbSNyIURJ4GESO0yj8IqDIxS8nGT+EWG8De7cdpJ6xKjYXCQsxG4
	J+AlDV8guJi00tMbCBS8dtPLOdN4il2lT69KBdnJOwJsYZToGnsRQLTekdy5rJskBEg3KFDyAz71v
	vmywxHbimTxr0EeG4+VJ2TGCjsI/uTXt0Rv4hGl2ib51xek+jK70bnR4OIJbrVAh1vxOtnJrormKg
	QP9dgXfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzxOq-000000066tn-2JJY;
	Wed, 02 Apr 2025 12:40:56 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzxGZ-000000065K4-1Qh0;
	Wed, 02 Apr 2025 12:32:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=oGUkH
	84hkPBzmx/lS7RDwXwqM5OPP1Xjz5Ep4c4bpzw=; b=chYKSqCmtnnZUjyAf+UAH
	mCRrVrrJ1FXKyjopzqe2GmeDC4k6D66qgOhLl38eXGUEtktVV9Iz6Bkjo03O6+pG
	Z/Qn4NbF+1ZcT4eP23UZMRAHjaySKHWDP0yAPA4sBForiDS3BJJOpuxtwb1lX8nL
	L8gXDcUdHq2W8kZuEpHIJM=
Received: from ProDesk.. (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgDnd405Lu1nJwOJBA--.36321S2;
	Wed, 02 Apr 2025 20:31:57 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	hjc@rock-chips.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	dmitry.baryshkov@oss.qualcomm.com,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v3 0/7] Convert inno hdmi to drm bridge
Date: Wed,  2 Apr 2025 20:31:34 +0800
Message-ID: <20250402123150.238234-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PygvCgDnd405Lu1nJwOJBA--.36321S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CF47WFy5uF1rJF4fGr48JFb_yoW5JF15pa
	98Ary5ZF1xC3WIqrs7AF48ArWayayDJa1FkryxJw1fZr4F9F1jyr9xuFs0vrnxAr17AFsF
	yr4xGa4UKFW7ZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j7b18UUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0h4jXmftK+o5IQAAsi
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_053223_780201_8A26F83A 
X-CRM114-Status: GOOD (  14.08  )
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

When preparing to convert the current inno hdmi driver into a
bridge driver, I found that there are several issues currently
existing with it:

1. When the system starts up, the first time it reads the EDID, it
   will fail. This is because RK3036 HDMI DDC bus requires it's PHY's
   reference clock to be enabled first before normal DDC communication
   can be carried out.

2. The signal is unstable. When running the glmark2 test on the screen,
   there is a small probability of seeing some screen flickering.
   This is because The HSYNC/VSYNC polarity of rk3036 HDMI are controlled
   by GRF. This part is missing in the current driver.

PATCH 1~6 are try to Fix Document in the dt-binding, then add the
missing part in driver and dts.
PATCH 7 converts the curren driver to drm bridge mode.

Changes in v3:
- Convert to drm bridge driver
- Link to V2: https://lore.kernel.org/dri-devel/20250325132944.171111-1-andyshrk@163.com/

Changes in v2:
- Included the HSYNC/VSYNC polarity fix
- Link to V1: https://lore.kernel.org/linux-rockchip/20250324103332.159682-1-andyshrk@163.com/

Andy Yan (7):
  dt-bindings: display: rockchip,inno-hdmi: Fix Document of RK3036
    compatible
  dt-bindings: display: rockchip,inno-hdmi: Document GRF for RK3036 HDMI
  drm/rockchip: inno-hdmi: Simplify error handler with dev_err_probe
  drm/rockchip: inno-hdmi: Fix video timing HSYNC/VSYNC polarity setting
    for rk3036
  ARM: dts: rockchip: Add ref clk for hdmi
  Revert "ARM: dts: rockchip: drop grf reference from rk3036 hdmi"
  drm/rockchip: inno-hdmi: Convert to drm bridge

 .../display/rockchip/rockchip,inno-hdmi.yaml  |  20 +-
 arch/arm/boot/dts/rockchip/rk3036.dtsi        |   5 +-
 drivers/gpu/drm/bridge/Kconfig                |   7 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 .../inno_hdmi.c => bridge/inno-hdmi.c}        | 907 ++++++++++--------
 drivers/gpu/drm/rockchip/Kconfig              |   1 +
 drivers/gpu/drm/rockchip/Makefile             |   2 +-
 drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c | 187 ++++
 drivers/gpu/drm/rockchip/inno_hdmi.h          | 349 -------
 include/drm/bridge/inno_hdmi.h                |  33 +
 10 files changed, 760 insertions(+), 752 deletions(-)
 rename drivers/gpu/drm/{rockchip/inno_hdmi.c => bridge/inno-hdmi.c} (52%)
 create mode 100644 drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c
 delete mode 100644 drivers/gpu/drm/rockchip/inno_hdmi.h
 create mode 100644 include/drm/bridge/inno_hdmi.h

-- 
2.43.0


