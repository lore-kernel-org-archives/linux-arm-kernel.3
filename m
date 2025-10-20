Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D847ACCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 08:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wGVaL8ZXz08MYLs41kERmlA/MzErRlXr5si+49dXDbw=; b=HVHBzolr+Hf2f0KmGwiO8qmgGn
	EsrpOZgPIu4xdIJgQuOV3HC42Py/eS8u7F7/4SgBpnQKu6AMYZd9lJ7pkx4vVPhwWFiyHhDj2hNE7
	jnc9zFpLuyJGn4lz1CHhSqDi988UTeypCoFQRGrUjk3HTTZuJxxt+ppIX4OZpvRkPPsu08PNzuLx+
	RUdZWOluq5HMNYbnpNard1b5IwRVKX4C2nmJzx6LNOyVU4n93gtWBnTW8wrnd0Yfi3Nne8QkzQzas
	UHN1QEX3XrBEzEdWAAtvAj2h4JR20yPS6X6UDbIrqDRNUAmTCN+7Fo2nab59iMf0QmDLdaqsw0EWD
	pTR2qz9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAlDT-0000000CN9c-0AuR;
	Mon, 20 Oct 2025 08:26:07 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAlDI-0000000CMrM-1chP;
	Mon, 20 Oct 2025 08:25:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Reply-To:Content-Type:In-Reply-To:References;
	bh=wGVaL8ZXz08MYLs41kERmlA/MzErRlXr5si+49dXDbw=; b=UbhZz0bXI2wfJ4VRYaZGhN0+pe
	PxbtZDraakyULxzeZn++PGmRjHhrq9DFRFuiZjgWGo2m2jhzlavDfE0uWCtmVRHi9zr5m+ASNct1R
	F26pghlil5tKauQeoCKutKVaI1TxOt38HigcDS/DzZfFkEI+dRPJWEus33p8j8IQfwo58XNfuIVaR
	owRLKwvDZ0JVSoFNZv/4ddCzSWNEXVLDrAFqh0c/5EVHiEwP7h4CujSSoDChHQ/TIEvCScXMyP8WC
	yqD2oTPSOqpfRVdof1U7yeJWb5OyW8EXK+a0VZkg+Z2op8/tc7MzgqaW6rcJmpZbOlI+C28E0gQrB
	4AK3P8wQ==;
Received: from [141.76.253.240] (helo=phil.eduroam.local)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vAlCx-00078O-M9; Mon, 20 Oct 2025 10:25:35 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	quentin.schulz@cherry.de,
	andy.yan@rock-chips.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	cn.liweihao@gmail.com
Subject: [PATCH 0/9] Gernal RK3368 HDMI support and 2 outputs for RK3368-Lion
Date: Mon, 20 Oct 2025 10:24:59 +0200
Message-ID: <20251020082508.3636511-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_012556_455406_BCD9790B 
X-CRM114-Status: GOOD (  14.56  )
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

This series adds the necessary bits for HDMI output on RK3368 and enables
this on RK3368-Lion. At the same time, use the recently added DSI support
to enable the generic Video-Demo-adapter as an overlay on Lion as well.


The reason I'm shaving this Yak is that the recently added DSI support
created DTC warnings about a single endpoint with an address.

So it was either removing the @0 from the endpoint, or adding a second
output option :-) .


Heiko Stuebner (9):
  dt-bindings: display: rockchip: dw-hdmi: Add compatible for RK3368
    HDMI
  drm/rockchip: hdmi: add RK3368 controller variant
  soc: rockchip: grf: Add select correct PWM implementation on RK3368
  arm64: dts: rockchip: Add power-domain to RK3368 DSI controller
  arm64: dts: rockchip: Add power-domain to RK3368 VOP controller
  arm64: dts: rockchip: Use phandle for i2c_lvds_blc on rk3368-lion
    haikou
  arm64: dts: rockchip: Add HDMI node to RK3368
  arm64: dts: rockchip: Enable HDMI output on RK3368-Lion-Haikou
  arm64: dts: rockchip: Add the Video-Demo overlay for Lion Haikou

 .../display/rockchip/rockchip,dw-hdmi.yaml    |   1 +
 arch/arm64/boot/dts/rockchip/Makefile         |   5 +
 .../rk3368-lion-haikou-video-demo.dtso        | 174 ++++++++++++++++++
 .../boot/dts/rockchip/rk3368-lion-haikou.dts  |  36 +++-
 arch/arm64/boot/dts/rockchip/rk3368.dtsi      |  45 +++++
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c   |  16 ++
 drivers/soc/rockchip/grf.c                    |   1 +
 7 files changed, 268 insertions(+), 10 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3368-lion-haikou-video-demo.dtso

-- 
2.47.2


