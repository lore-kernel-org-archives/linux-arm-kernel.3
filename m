Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DEBFC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 19:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=W4ZUM4K86TsKXvb8cdaqkr/Jea1BHAlTB5kZ3S8Z/oA=; b=nOYWVOOearh1B3m555KQ5pnMav
	fIS52tczwu1URkDoDz4vuA+MLYKS5HSoIk4gLmfELuroPB8LRP0Rt6jkeRL4g82zdH6HJX/GVbmNV
	xX0HDIdGEoYDI5bmR265Aro3+Zj3MZvnJ78iqe3fGR02gXoFfXJH9K8nfHS94aTXzNB9mSD81AWKN
	IqBkAB/8oB0l50zvAyDs/zoO2D3dCAU2IEwAMt18UFwhs46oh9AHCNWhlIANq3ZHvj1QcTeKe866N
	WXckaxZpnMxeBbNALRpu5/N+rSdT9lfLFSGlR0i47XWq4fQ0NTB9ryL/N3g6aQPnnXgVAMWSEFypR
	ECGy3etQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTn3p-00000003ptS-13JX;
	Mon, 23 Jun 2025 19:42:33 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTjhx-00000003Lz5-3yg9;
	Mon, 23 Jun 2025 16:07:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750694864;
	bh=potBOdXr8Iz2ioECm7kZqlRyCx32EonrYrShLBe6IA0=;
	h=From:To:Cc:Subject:Date:From;
	b=mBIu00QNj1CLzYNlx8lmRn1yZwl8BwHb8ZyGA/R4yuut7XODfZQJbiFB5/sbi+fsf
	 Bw2bOUpqvZIwTHJSLxTO7psFxYAyKq9zqlPFYlWsqqcI6EOOQ25XR3B6Mx83A5djyP
	 pqjUwjEfK0hZxAVtKN2kPWGVYUiY1CtqITnzUlAvEoFqprNKlGrauXGP33M6h/g/N/
	 d1I21SWkZYP+XO0+ajKlXWpTutAK1ydowgxxJSE0BudcAIhujvx3qer94e6ZjiWIZO
	 sTXntA+k5WA8HQsSAaLruG3at6OXYKJSjWOor2i6mSVw+Xg0uniCMrFRJ0XKkY/YML
	 rKX23HXSQbY5A==
Received: from trenzalore.hitronhub.home (unknown [23.233.251.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DBD5C17E0342;
	Mon, 23 Jun 2025 18:07:40 +0200 (CEST)
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
Subject: [PATCH 0/8] Prepare for new rkvdec variants
Date: Mon, 23 Jun 2025 12:07:14 -0400
Message-ID: <20250623160722.55938-1-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_090746_137488_C52B531A 
X-CRM114-Status: GOOD (  13.94  )
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

This patch set introduces the necessary bits for new variants
implementations that do not modify the driver.
The driver changes will come in another patch set.

The first 4 patches document the device nodes and then add the nodes for
rk3588 and rk3576. I kept the R-b tag from Conor Dooley as the patch
didn't change much from [1]. I can remove it if needed.

Then a new v4l2 control for HEVC is added to be able to send the missing
RPS information to the driver.

Finally, the driver is unstaged as the TODO points are removed. I added
myself as maintainer for now as I'll be adding support for several
variants.

Those 3 parts can be applied separately and do not depend on each other.
Based on v6.16-rc3.

[1]: https://lore.kernel.org/all/20240620-unsmooth-surfer-b62ed94b4a5e@spud/

Detlev Casanova (8):
  media: dt-bindings: rockchip: Document RK3588 Video Decoder bindings
  media: dt-bindings: rockchip: Add RK3576 Video Decoder bindings
  arm64: dts: rockchip: Add the vdpu381 Video Decoders on RK3588
  arm64: dts: rockchip: Add the vdpu383 Video Decoder on rk3576
  media: uapi: HEVC: Add v4l2_ctrl_hevc_ext_sps_rps control
  media: v4l2-ctrls: Add hevc_ext_sps_rps control
  media: rkvdec: Remove TODO file
  media: rkvdec: Unstage the driver

 .../bindings/media/rockchip,vdec.yaml         | 80 ++++++++++++++++++-
 .../media/v4l/ext-ctrls-codec-stateless.rst   | 73 +++++++++++++++++
 .../media/v4l/vidioc-queryctrl.rst            |  6 ++
 MAINTAINERS                                   |  8 ++
 arch/arm64/boot/dts/rockchip/rk3576.dtsi      | 36 +++++++++
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 74 +++++++++++++++++
 drivers/media/platform/rockchip/Kconfig       |  1 +
 drivers/media/platform/rockchip/Makefile      |  1 +
 .../platform/rockchip}/rkvdec/Kconfig         |  0
 .../platform/rockchip}/rkvdec/Makefile        |  0
 .../platform/rockchip}/rkvdec/rkvdec-h264.c   |  0
 .../platform/rockchip}/rkvdec/rkvdec-regs.h   |  0
 .../platform/rockchip}/rkvdec/rkvdec-vp9.c    |  0
 .../platform/rockchip}/rkvdec/rkvdec.c        |  0
 .../platform/rockchip}/rkvdec/rkvdec.h        |  0
 drivers/media/v4l2-core/v4l2-ctrls-core.c     |  9 +++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  5 ++
 drivers/staging/media/Kconfig                 |  2 -
 drivers/staging/media/Makefile                |  1 -
 drivers/staging/media/rkvdec/TODO             | 11 ---
 include/uapi/linux/v4l2-controls.h            | 48 +++++++++++
 include/uapi/linux/videodev2.h                |  1 +
 22 files changed, 339 insertions(+), 17 deletions(-)
 rename drivers/{staging/media => media/platform/rockchip}/rkvdec/Kconfig (100%)
 rename drivers/{staging/media => media/platform/rockchip}/rkvdec/Makefile (100%)
 rename drivers/{staging/media => media/platform/rockchip}/rkvdec/rkvdec-h264.c (100%)
 rename drivers/{staging/media => media/platform/rockchip}/rkvdec/rkvdec-regs.h (100%)
 rename drivers/{staging/media => media/platform/rockchip}/rkvdec/rkvdec-vp9.c (100%)
 rename drivers/{staging/media => media/platform/rockchip}/rkvdec/rkvdec.c (100%)
 rename drivers/{staging/media => media/platform/rockchip}/rkvdec/rkvdec.h (100%)
 delete mode 100644 drivers/staging/media/rkvdec/TODO

-- 
2.50.0


