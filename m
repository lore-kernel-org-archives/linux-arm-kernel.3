Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62763C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 14:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EwhF5xvcCxFXCkjv1iSNJSpLrofkJ7pi5BU9kbT4ll4=; b=A6c6jAuHj2I3X3
	Xak/alOJYRZD13SP2SFTaJirJoOYleUizkYsE5vrwfpCLYmqLlLZjNueLv+ZYTxTImodYKiXlB7yZ
	VUard7KTVAvO6WNYiUYFA2bcwf0Twd93bJUHrw7Ye8Il6MDv9CVtsXsXGJcTX7Xy6qlEuPitN0FfV
	0PnaKLMYNzXVYFhTHdQ7zm/gy4mcCuuVPfJIVKSBwcpCHeXgPZ2h3q0d/+YHIDWDTJCqBTUrP5f2H
	6INNuBOZKMu+mMs749qoKyCl1EiLXw5GocN3ormrz5WIv4y9cLlrPrkDPCOJlLuVa1Jod/O5xwAaT
	b0ktq7+aG7QYxZuhorLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXhYF-0000000Egqu-04s8;
	Fri, 04 Jul 2025 14:38:07 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXhKA-0000000Eeyj-0gpF;
	Fri, 04 Jul 2025 14:23:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751639011;
	bh=ue3704ExvIRhPugRmJAEoUTNWcIk9NV2FgJK3CY4rxU=;
	h=From:Subject:Date:To:Cc:From;
	b=RuvPT1Z3nR1nAKyEIgczNL1PLkYjDSzT1PUnSRnSSjxTEAmEsjc+nwJMGmbm2k24X
	 R/6l/i3a4qYkL4q+cuC65REWLNnGW773kSx+OLN58vr+Ws33tYw5xntruVs41OwZXC
	 eSkMxY5/ssh72sEkQ8mJU6YuNmL1si6vRUxH1azQXFWSm2CCI2yRjb/GAhBECZHWMF
	 Ujts/SLIpENyXlXOvEwH/4GT5IBHuy1Af+0Lvxl1npOC7AJbBGuIsbr2sJ6a/HXz9v
	 LRFG1gsZ+S/RquWhM2zznKT11GGMEa3ZDYlJdldepkwg95oxBrThHyAPQ51sdv25Wt
	 t4tkfcJWr1BRg==
Received: from localhost (unknown [212.93.144.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 59E0717E07FF;
	Fri,  4 Jul 2025 16:23:31 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH 0/5] Add HDMI CEC support to Rockchip RK3588/RK3576 SoCs
Date: Fri, 04 Jul 2025 17:23:21 +0300
Message-Id: <20250704-rk3588-hdmi-cec-v1-0-2bd8de8700cd@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANnjZ2gC/x2MQQqAIBAAvyJ7TjBNkr4SHUTXXCILhQjEvycd5
 jCHmQoFM2GBhVXI+FChK3UZBwYu2rQjJ98dpJBazELxfChtDI/+JO7QdawJWiofJgO9ujMGev/
 jurX2AX9RG4RhAAAA
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
X-CRM114-CacheID: sfid-20250704_072334_372090_ED184C5B 
X-CRM114-Status: GOOD (  11.46  )
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

The first two patches in the series implement the CEC capability of the
Synopsys DesignWare HDMI QP TX controller found in RK3588 & RK3576 Socs.

This is based on the downstream code, but rewritten on top of the CEC
helpers added recently to the DRM HDMI connector framework.

The next two patches are needed for RK3576 in order to fixup the timer
base setup according to the actual reference clock rate, which differs
slightly from RK3588.

Please note the CEC helpers are currently affected by a resource
deallocation issue which may crash the kernel and freeze the system
under certain test conditions.  I've already submitted a patch [1] that
seems to correct the problem.

[1] https://lore.kernel.org/all/20250703-hdmi-cec-helper-unreg-fix-v1-1-7e7b0eb578bb@collabora.com/

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Cristian Ciocaltea (5):
      drm/rockchip: dw_hdmi_qp: Provide CEC IRQ in dw_hdmi_qp_plat_data
      drm/bridge: dw-hdmi-qp: Add CEC support
      drm/rockchip: dw_hdmi_qp: Provide ref clock rate in dw_hdmi_qp_plat_data
      drm/bridge: dw-hdmi-qp: Fixup timer base setup
      arm64: defconfig: Enable DW HDMI QP CEC support

 arch/arm64/configs/defconfig                   |   1 +
 drivers/gpu/drm/bridge/synopsys/Kconfig        |   8 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c   | 231 ++++++++++++++++++++++++-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h   |  14 ++
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c |  17 +-
 include/drm/bridge/dw_hdmi_qp.h                |   2 +
 6 files changed, 269 insertions(+), 4 deletions(-)
---
base-commit: 8d6c58332c7a8ba025fcfa76888b6c37dbce9633
change-id: 20250703-rk3588-hdmi-cec-cea8f523df48


