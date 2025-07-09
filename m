Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20159C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 22:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UVgvpvUu/uMo5s+N3RHTJF1jklsCioqrC1QEakFey5o=; b=4h/zEzVa/KNHDm
	9O9rgnFkVy4qrVI+M2ofFmLUrJf57a7efUOv5ip6kH8OzYBT5w3d78gOFcosikcRL5qwi8n4GxtTv
	eVXvBLmn7E8KjU7p2m8O8F+QY0/ZWgUfRYVSvLMO0ZaTxjANDRWaZOh5Dffs6Wmdt99uPP3y2Eu3T
	SNV5rgV5mNFvM0Uyspg1+8Ppo4ZpZ/2p3T58OsGcJjwi1x5XEtsWkE9oYBirRuWZTICurD4/ckpmU
	raTYN7Q61yVT0dwDrcEuF565qYI+awu8x5l99DWFDxIHxN8EdiJIPlnD0/FFba1Of9jmBFsTJ7F5C
	zvfdYwrN1r2XspgCMpnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZdiU-0000000A8WP-3dRS;
	Wed, 09 Jul 2025 22:56:42 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZbv1-00000009r1L-3rGs;
	Wed, 09 Jul 2025 21:01:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1752094888;
	bh=kzWB2OH30J0P4Kym4GxrIAQEztbUTee1hXQn/eF6cEE=;
	h=From:Subject:Date:To:Cc:From;
	b=YpYTXG7Z9N8Udk9MOvejUr3SGFs6JBAW6kumWTARcHqCtYrB4llIhjQE1JqFwOZtZ
	 ktyRYvMuNbLtW2HOT6i5P2eVUr1rEGShKuotIUc05/Ar8N6y82rd6LDBxTrElt2DnL
	 AW9/ZT3QSR2Qxk/9fbKzrZrq2P0YHeF3up6+VmXnNylRu9PbIHD59ZXphy2TciFnGg
	 nutCcjjtuoXxBKkG3oUriOvawnuFQxcTJcMzuh38TCKGIIT9QoCfFjvas6UtcRhk9U
	 tdAzcgVqezTjB2Zjjk4hA2kbm/K8TEplyyAtfFemxHe7aLwJpEwmTZni+/d8e3ZmbM
	 2AyyUQONWdU3w==
Received: from localhost (unknown [212.93.144.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 1308717E0456;
	Wed,  9 Jul 2025 23:01:28 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH v2 0/6] Add HDMI CEC support to Rockchip RK3588/RK3576 SoCs
Date: Thu, 10 Jul 2025 00:01:11 +0300
Message-Id: <20250710-rk3588-hdmi-cec-v2-0-f5884be34bc1@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJfYbmgC/2WNQQrDIBRErxL+uhajkUhXvUfJwuhP/TSJQYu0B
 O9eG+iqi1m8gXmzQ8JImODS7BAxU6KwVhCnBqw36x0ZucoguFC855LFh1RaM+8WYhZtjdGTEtJ
 NnYa62iJO9DqMt6Gyp/QM8X0c5Pbb/lzdnyu3jDMxOu1Q95xbd7Vhns0YojnbsMBQSvkAj17gC
 rIAAAA=
X-Change-ID: 20250703-rk3588-hdmi-cec-cea8f523df48
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Algea Cao <algea.cao@rock-chips.com>, 
 Derek Foreman <derek.foreman@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_140132_142205_C17D1479 
X-CRM114-Status: GOOD (  13.10  )
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

The first patch in the series implements the CEC capability of the
Synopsys DesignWare HDMI QP TX controller found in RK3588 & RK3576 Socs.
This is based on the downstream code, but rewritten on top of the CEC
helpers added recently to the DRM HDMI connector framework.

The second patch is needed for RK3576 in order to fixup the timer base
setup according to the actual reference clock rate, which differs
slightly from RK3588.

The following three patches setup platform data with the new information
expected by the HDMI QP transmitter library, while improving the error
handling in the probe path.

Please note the CEC helpers are currently affected by a resource
deallocation issue which may crash the kernel and freeze the system
under certain test conditions.  I've already submitted a patch [1] that
seems to correct the problem.

[1] https://lore.kernel.org/all/20250703-hdmi-cec-helper-unreg-fix-v1-1-7e7b0eb578bb@collabora.com/

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Changes in v2:
- Collected R-b tag from Dmitry
- Restructured the generic bridge patches to not depend on the
  platform-specific changes and updated cover letter accordingly (Heiko)
- Replaced the loop searching for "ref" clock with clk_get() (Maxime)
- Added new patch "drm/rockchip: dw_hdmi_qp: Improve error handling with
  dev_err_probe()"
- Link to v1: https://lore.kernel.org/r/20250704-rk3588-hdmi-cec-v1-0-2bd8de8700cd@collabora.com

---
Cristian Ciocaltea (6):
      drm/bridge: dw-hdmi-qp: Add CEC support
      drm/bridge: dw-hdmi-qp: Fixup timer base setup
      drm/rockchip: dw_hdmi_qp: Improve error handling with dev_err_probe()
      drm/rockchip: dw_hdmi_qp: Provide CEC IRQ in dw_hdmi_qp_plat_data
      drm/rockchip: dw_hdmi_qp: Provide ref clock rate in dw_hdmi_qp_plat_data
      arm64: defconfig: Enable DW HDMI QP CEC support

 arch/arm64/configs/defconfig                   |   1 +
 drivers/gpu/drm/bridge/synopsys/Kconfig        |   8 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c   | 231 ++++++++++++++++++++++++-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h   |  14 ++
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c |  77 ++++-----
 include/drm/bridge/dw_hdmi_qp.h                |   2 +
 6 files changed, 291 insertions(+), 42 deletions(-)
---
base-commit: 8d6c58332c7a8ba025fcfa76888b6c37dbce9633
change-id: 20250703-rk3588-hdmi-cec-cea8f523df48


