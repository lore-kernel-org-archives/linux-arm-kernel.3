Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85452C02185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 16:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yZ6ajiEGtvZNXqBhvOIGnxZ+5lXWhydO9ctTFiNpYf4=; b=vfjYMQ0WCiQ4A+CzrlqaMZ8zrA
	VlIgDW0vcOS69OcRdmVQLfT7NLpzv34NkVEPcaUAv6O5Fr3OKU9BO1w4D2hvK418aSw4qpYveDGXg
	GhxJ0WckoRSBYt/mXrhFF1X6WmFmWmfUhxghmSKCP/vqYibeCgWTviUy3kJxXdy9M+BYA/WI7O4zr
	ys4SZPcaw5j5+GR7glorJs7d3fhwHJ9AjY5jrpifhZgXHFoRdYPsi3IQcEic1fxz1OHPfDxSmoHc8
	4CG/DdcLM30JORPOsbEn4hpoNy6RKZBcRHs8Na1OrXqujRIzvPmMWP4n7/QGuBMaMaXxGow/EoznF
	a4k51dmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYpYb-00000000qvr-1MQu;
	Fri, 17 Jan 2025 16:50:53 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYpWD-00000000qH5-3Kdl;
	Fri, 17 Jan 2025 16:48:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1737132503;
	bh=84YKOZ/drOYfn0QtG1NOft6JVq2XEK+your1FhHrQ7E=;
	h=From:To:Cc:Subject:Date:From;
	b=S7vXiJnSSJ7FErDnG16gmqM9+gk4AuzJWPBItbC5yvkqT0+QS04iRUbNE4m8xJbwx
	 4ublKRep++XH7UaGdAFLLAwXidFuJRyKtrIe0jfnSx4EN0q/RrdsVdCpiLmvoAA9fv
	 ch2OqgMqx1cO/UIvglMkZFS2uVZx9c56bPnmzlqurWYnwbXOozpftMVMAY+052NCdt
	 EtSgRQIskLGJxHltoogf0O0W+aAoPJiWB5LIc+zfsnM06ilf+XLYqXWcwy5610ooEd
	 IBexNnjzobrX3+fbcIcCxKaWhGVcCdnrMq5hbc2GiDIcMM0Mbwis7q0kWjPWticnvf
	 bT2RtUhj9RpQg==
Received: from earth.mtl.collabora.ca (mtl.collabora.ca [66.171.169.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 386C217E0B9D;
	Fri, 17 Jan 2025 17:48:20 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Alexey Charkov <alchark@gmail.com>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Johan Jonker <jbx6244@gmail.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sugar Zhang <sugar.zhang@rock-chips.com>,
	Algea Cao <algea.cao@rock-chips.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	kernel@collabora.com
Subject: [PATCH v1 0/2] Add HDMI audio on the Radxa ROCK 5B
Date: Fri, 17 Jan 2025 11:46:56 -0500
Message-ID: <20250117164815.67253-1-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_084826_015780_DCCC9014 
X-CRM114-Status: GOOD (  11.83  )
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

To support HDMI audio on the rk3588 based devices, the generic HDMI
Codec framework is used in the dw-hdmi-qp DRM bridge driver.

The implementation is mainly based on the downstream driver, ported to the
generic HDMI Codec framework [1] recently merged in the DRM tree.
The parameters computation has been kept as is and the data stored in the
dw_hdmi_qp struct as been cleaned up.

The downstream kernel also implements a machine driver for HDMI audio but
it is doing exactly what the simple-audio-card driver does, so use that
instead in the ROCK 5B device tree.

Based on commit f1359f46f1f1 (tag: drm-misc-next-fixes-2025-01-16)

[1]: https://lore.kernel.org/all/20241224-drm-bridge-hdmi-connector-v10-0-dc89577cd438@linaro.org/

Detlev Casanova (1):
  arm64: dts: rockchip: Add HDMI0 audio output on rock-5b

Sugar Zhang (1):
  drm/bridge: synopsys: Add audio support for dw-hdmi-qp

 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi |   1 +
 .../boot/dts/rockchip/rk3588-rock-5b.dts      |  19 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c  | 472 ++++++++++++++++++
 3 files changed, 492 insertions(+)

-- 
2.48.1


