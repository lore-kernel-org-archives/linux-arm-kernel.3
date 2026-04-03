Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE48D730B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 07:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Po/SGAUNetbNZqws7TyBI/pS5fyLBPvJOytlLfUBhDg=; b=hDnPzphHNbKyps+bmMNltajKk7
	+TvVxSDrLbMY+gwKDOKLWfIdmPoeqH3L6sszwcXXfJcan5qSSyWSBTza29OGHquG34ygY3w0M6iVy
	8I/wPBYk3Rra+JoAsNqQlmeKOZ0e89BCauXZuouLkDRj7UVHvPMfN8UrnD1JHZzkQsGE6aklcNEWr
	CQI72xm2O1y2uU6OWF/MHwYNsiAuteyRICsA9TOqws2czu0wRJpNDb0pneVvXijJIZdMM7lP9CKlC
	rkiPg/3tQzuDRRbNem2uiL+peW247OuOpJfHpWLrGFeCiOnP7HNoeRN0tVHFDA5z1zZ3thsQZMz9s
	QvYmNIUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8YWR-00000001Qle-2Vpv;
	Fri, 03 Apr 2026 07:00:51 +0000
Received: from mail-m32116.qiye.163.com ([220.197.32.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8YWO-00000001Qes-1z2P;
	Fri, 03 Apr 2026 07:00:49 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 396d58c5d;
	Fri, 3 Apr 2026 15:00:34 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	hjc@rock-chips.com,
	heiko@sntech.de,
	andy.yan@rock-chips.com,
	wens@kernel.org,
	samuel@sholland.org,
	luca.ceresoli@bootlin.com
Cc: Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	victor.liu@nxp.com,
	dmitry.baryshkov@oss.qualcomm.com,
	shengjiu.wang@nxp.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v1 0/4] Apply bridge-connector for the Rockchip DW-HDMI driver
Date: Fri,  3 Apr 2026 15:00:28 +0800
Message-Id: <20260403070032.447102-1-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d5224c50403a3kunm1d6b6bc811de47
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0xKT1YfHhpJHk9KThhDHUpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=i3q+UMV3T40Upw+1mmYGdtYmgqCkv9XHwkxm6H6mozeFHn9SlX0oRLG/mD+xCH5lrus0RrFBhRoR6oFsI9CBcLz5+Qf11Ik7WReJYvsvc25eGOkRgJ5A6DWs++LWimnqFfoxgC7ibB9ZThrhcffXNrMjMuXp2JqBqp1c2y8rBu0=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=Po/SGAUNetbNZqws7TyBI/pS5fyLBPvJOytlLfUBhDg=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_000048_689384_AD7238AF 
X-CRM114-Status: UNSURE (   7.41  )
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

This patch series depends on and must be applied after:
https://lore.kernel.org/all/20260402-drm-lcdif-dbanc-v3-7-27cd247a0847@bootlin.com/
(Series [v3,00/11] drm/mxsfb/lcdif: use DRM_BRIDGE_ATTACH_NO_CONNECTOR and the bridge-connector)

Patch 1: Make DRM_BRIDGE_ATTACH_NO_CONNECTOR optional for platforms that call
         dw_hdmi_bind() to attach the dw-hdmi bridge.
Patch 2: Allow &dw_hdmi_plat_data.output_port = 0 without the attach flag
         DRM_BRIDGE_ATTACH_NO_CONNECTOR for dw-hdmi bridge.
Patch 3: Apply bridge-connector for Rockchip dw-hdmi driver, so that connector
         management is unified under bridge-connector. Treat dw-hdmi purely as
         a bridge without using its own connector helper functions, which
         partially overlaps with the bridge helper.
Patch 4: Add next bridge support for Rockchip dw-hdmi driver, so that it can
         support both the HDMI connector and additional bridge chips.

Damon Ding (4):
  drm/bridge: dw-hdmi: Pass bridge attach flags for dw_hdmi_bind()
  drm/bridge: dw-hdmi: Allow &dw_hdmi_plat_data.output_port = 0 without
    DRM_BRIDGE_ATTACH_NO_CONNECTOR
  drm/rockchip: dw_hdmi: Apply DRM_BRIDGE_ATTACH_NO_CONNECTOR and the
    bridge-connector
  drm/rockchip: dw_hdmi: Support to find the next bridge

 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c   | 10 +++----
 drivers/gpu/drm/rockchip/Kconfig            |  1 +
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 33 ++++++++++++++++++---
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c       |  2 +-
 include/drm/bridge/dw_hdmi.h                |  4 ++-
 5 files changed, 39 insertions(+), 11 deletions(-)

-- 
2.34.1


