Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B5ABC7EE39
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 19:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=440Lf5uinQkdFKrCECmkcjs6oNpZSMKXM7Md4d+7k4E=; b=JAzMyhyhOR0yB1qXOriYfs4OVT
	537N51EcFEHMcVTn0Dk3f2Ob9vIPADf6xeK9QGaC+ZEztjn0kQJs/oHYcgGmEcis5RAINBJ+nK9eb
	4gICLuJvXWcygwCWzS5vZLA6OMycSzlPk7krj413B/rui15AI3RtmhcxjyY2sN/Y6Nxm/5wjJ5iKh
	ISykzxiiC/Ly9GrDZurHl6r4sICZToMxSNNQPiuY7QUHC91tn1mlMS/ajrHwx1+vsuY8sGC/xBM/B
	S4B99Fq2DZf7AvStEHv97Q1jgrZO6cvqipsemNPWdy0WmhMA9QUgbCmrGhOaVg5qU4D63v4aBw+3D
	AoP7siOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTnHA-00000003sc6-00Ob;
	Mon, 23 Jun 2025 19:56:20 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTjiQ-00000003ME9-1vnx;
	Mon, 23 Jun 2025 16:08:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750694892;
	bh=L4p5mXi7DFDYHCSaTVxJNafGXSHDm+zZmxqXO3mMrMY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qskRex4KS5ZZJaJwLsSUyUFsAf1k4QKIQF0MgHltmvgQxKp9+2+d//S4QHw/Q3Uea
	 fH5rR/de88nZaQ4f5gJfPxOY3WCUTR9TxeZDGtVPKyjxe3mUlsYP53rSeANhyNHMWx
	 sJjhLlyEn/tOFLFlOzmxpx78ZmDnGHMi3+1Sv+IcPFAsmr5JQfU9A35hwRsdSVKcFd
	 WPPfDCSNgLWT4agyfvYPfgK/3OyKn/93e+8BFS16TXhP5jA+YBuJ5i8YUB0gBIkOTQ
	 W8M5WjDI32QzMLnNbwu27TMdzQMSXAh+NWDYDEeUA5iA8oF0YvcR03GFtucqa01Hpz
	 c40gtzlbT85jw==
Received: from trenzalore.hitronhub.home (unknown [23.233.251.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8969617E37C2;
	Mon, 23 Jun 2025 18:08:09 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Alexey Charkov <alchark@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Frank Wang <frank.wang@rock-chips.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans de Goede <hansg@kernel.org>,
	Yunke Cao <yunkec@google.com>,
	linux-media@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH 8/8] media: rkvdec: Unstage the driver
Date: Mon, 23 Jun 2025 12:07:22 -0400
Message-ID: <20250623160722.55938-9-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250623160722.55938-1-detlev.casanova@collabora.com>
References: <20250623160722.55938-1-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_090814_677115_936C01BB 
X-CRM114-Status: GOOD (  11.75  )
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

The TODO list for unstaging being empty, the driver can now be moved to the
main media folder.

Also add myself as maintainer.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 MAINTAINERS                                               | 8 ++++++++
 drivers/media/platform/rockchip/Kconfig                   | 1 +
 drivers/media/platform/rockchip/Makefile                  | 1 +
 .../media => media/platform/rockchip}/rkvdec/Kconfig      | 0
 .../media => media/platform/rockchip}/rkvdec/Makefile     | 0
 .../platform/rockchip}/rkvdec/rkvdec-h264.c               | 0
 .../platform/rockchip}/rkvdec/rkvdec-regs.h               | 0
 .../media => media/platform/rockchip}/rkvdec/rkvdec-vp9.c | 0
 .../media => media/platform/rockchip}/rkvdec/rkvdec.c     | 0
 .../media => media/platform/rockchip}/rkvdec/rkvdec.h     | 0
 drivers/staging/media/Kconfig                             | 2 --
 drivers/staging/media/Makefile                            | 1 -
 12 files changed, 10 insertions(+), 3 deletions(-)
 rename drivers/{staging/media => media/platform/rockchip}/rkvdec/Kconfig (100%)
 rename drivers/{staging/media => media/platform/rockchip}/rkvdec/Makefile (100%)
 rename drivers/{staging/media => media/platform/rockchip}/rkvdec/rkvdec-h264.c (100%)
 rename drivers/{staging/media => media/platform/rockchip}/rkvdec/rkvdec-regs.h (100%)
 rename drivers/{staging/media => media/platform/rockchip}/rkvdec/rkvdec-vp9.c (100%)
 rename drivers/{staging/media => media/platform/rockchip}/rkvdec/rkvdec.c (100%)
 rename drivers/{staging/media => media/platform/rockchip}/rkvdec/rkvdec.h (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index c3f7fbd0d67af..d05a153c21526 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21466,6 +21466,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/rockchip-rga.yaml
 F:	drivers/media/platform/rockchip/rga/
 
+ROCKCHIP RKVDEC VIDEO DECODER DRIVER
+M:	Detlev Casanova <detlev.casanova@collabora.com>
+L:	linux-media@vger.kernel.org
+L:	linux-rockchip@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/rockchip,vdec.yaml
+F:	drivers/media/platform/rockchip/rkvdec/
+
 ROCKCHIP RK3308 INTERNAL AUDIO CODEC
 M:	Luca Ceresoli <luca.ceresoli@bootlin.com>
 S:	Maintained
diff --git a/drivers/media/platform/rockchip/Kconfig b/drivers/media/platform/rockchip/Kconfig
index b41d3960c1b41..9bbeec4996aa2 100644
--- a/drivers/media/platform/rockchip/Kconfig
+++ b/drivers/media/platform/rockchip/Kconfig
@@ -4,3 +4,4 @@ comment "Rockchip media platform drivers"
 
 source "drivers/media/platform/rockchip/rga/Kconfig"
 source "drivers/media/platform/rockchip/rkisp1/Kconfig"
+source "drivers/media/platform/rockchip/rkvdec/Kconfig"
diff --git a/drivers/media/platform/rockchip/Makefile b/drivers/media/platform/rockchip/Makefile
index 4f782b876ac9b..286dc5c53f7e1 100644
--- a/drivers/media/platform/rockchip/Makefile
+++ b/drivers/media/platform/rockchip/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-y += rga/
 obj-y += rkisp1/
+obj-y += rkvdec/
diff --git a/drivers/staging/media/rkvdec/Kconfig b/drivers/media/platform/rockchip/rkvdec/Kconfig
similarity index 100%
rename from drivers/staging/media/rkvdec/Kconfig
rename to drivers/media/platform/rockchip/rkvdec/Kconfig
diff --git a/drivers/staging/media/rkvdec/Makefile b/drivers/media/platform/rockchip/rkvdec/Makefile
similarity index 100%
rename from drivers/staging/media/rkvdec/Makefile
rename to drivers/media/platform/rockchip/rkvdec/Makefile
diff --git a/drivers/staging/media/rkvdec/rkvdec-h264.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c
similarity index 100%
rename from drivers/staging/media/rkvdec/rkvdec-h264.c
rename to drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c
diff --git a/drivers/staging/media/rkvdec/rkvdec-regs.h b/drivers/media/platform/rockchip/rkvdec/rkvdec-regs.h
similarity index 100%
rename from drivers/staging/media/rkvdec/rkvdec-regs.h
rename to drivers/media/platform/rockchip/rkvdec/rkvdec-regs.h
diff --git a/drivers/staging/media/rkvdec/rkvdec-vp9.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
similarity index 100%
rename from drivers/staging/media/rkvdec/rkvdec-vp9.c
rename to drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
similarity index 100%
rename from drivers/staging/media/rkvdec/rkvdec.c
rename to drivers/media/platform/rockchip/rkvdec/rkvdec.c
diff --git a/drivers/staging/media/rkvdec/rkvdec.h b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
similarity index 100%
rename from drivers/staging/media/rkvdec/rkvdec.h
rename to drivers/media/platform/rockchip/rkvdec/rkvdec.h
diff --git a/drivers/staging/media/Kconfig b/drivers/staging/media/Kconfig
index b442148543995..b9d52a51841b5 100644
--- a/drivers/staging/media/Kconfig
+++ b/drivers/staging/media/Kconfig
@@ -32,8 +32,6 @@ source "drivers/staging/media/max96712/Kconfig"
 
 source "drivers/staging/media/meson/vdec/Kconfig"
 
-source "drivers/staging/media/rkvdec/Kconfig"
-
 source "drivers/staging/media/starfive/Kconfig"
 
 source "drivers/staging/media/sunxi/Kconfig"
diff --git a/drivers/staging/media/Makefile b/drivers/staging/media/Makefile
index ad4e9619a9e07..102ca632ddf5c 100644
--- a/drivers/staging/media/Makefile
+++ b/drivers/staging/media/Makefile
@@ -4,7 +4,6 @@ obj-$(CONFIG_INTEL_ATOMISP)     += atomisp/
 obj-$(CONFIG_VIDEO_IMX_MEDIA)	+= imx/
 obj-$(CONFIG_VIDEO_MAX96712)	+= max96712/
 obj-$(CONFIG_VIDEO_MESON_VDEC)	+= meson/vdec/
-obj-$(CONFIG_VIDEO_ROCKCHIP_VDEC)	+= rkvdec/
 obj-$(CONFIG_VIDEO_STARFIVE_CAMSS)	+= starfive/
 obj-$(CONFIG_VIDEO_SUNXI)	+= sunxi/
 obj-$(CONFIG_VIDEO_TEGRA)	+= tegra-video/
-- 
2.50.0


