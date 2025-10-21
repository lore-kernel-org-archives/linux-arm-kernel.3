Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B330CCCD1BD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 07:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UxK1OP46sV11zbhWQ+0/zP7tImTHzu011gOU5DK+oxg=; b=HDLHgo6OEBaphQmRZaXaBUeNJp
	MraUMT+HJa6ob460EiVv3sgdKumQE4TPCfjJQxFjIgR3qZyvT+7q0xxz9FA7IUe3TH6FxEMa7nJDD
	D/pvNDLjYxaLLSacYKdo/6AxqhX3mfVl+j2VTRELR32NIBl+I/gRaut8/+1P3D7eVPNKHKjMN5X+H
	IJUzb/ZIPQ30F6Wxx1xM6Q/mV3M3/nNG56MnQKbN/hj0XeOhqCPe7c/NDTSnSPrDMGO3vEAtknIxX
	zEuAglm/g5DV8abiXHcBpnoutS88C6QM4WFRSiOgTVKI+sWfz8jxwQsTJ20Ui8VurD7aQfFJXUiNQ
	n6MZeBaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB71p-0000000G6yR-0vO9;
	Tue, 21 Oct 2025 07:43:33 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB71i-0000000G6ng-1M3o;
	Tue, 21 Oct 2025 07:43:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Reply-To:Content-Type:In-Reply-To:References;
	bh=UxK1OP46sV11zbhWQ+0/zP7tImTHzu011gOU5DK+oxg=; b=XSIgqbQ8NchDx3T8OcaMUkhoS2
	Ql52y6+JPPw8y/0PzCt+36TBG54fvqr7vQmQcEbGB3X6iYlpgv5HpLlqKo7TIE9FX4FOu5bh8cHk2
	wa/yDCXV8GCgC8RN2z8GU5wqw+vdr5ZfmrV0m5AM7wO4LizdR5SLXEbUDQ+jom7RkSnyaJOpLMX2g
	6QYDmIh/aXNzPd8cBJSFnhjqVBejlIxeKYfAYqFAVYvfgpKVFJBz2vT7v6aVmGLrLnDRZ+wyWcTbL
	A2kvYtJYWrOSjSWbxijjZ5QNCa7Li87XIrXjtbnU4iQ4wEjCPXc0ZzTstz7TyI/s6pVxwesA6jP33
	ahp/mnhA==;
Received: from [212.111.240.218] (helo=phil.guestnet.ukdd.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vB71M-0000uy-8P; Tue, 21 Oct 2025 09:43:04 +0200
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
Subject: [PATCH v2 0/9] General RK3368 HDMI support and 2 outputs for RK3368-Lion
Date: Tue, 21 Oct 2025 09:42:45 +0200
Message-ID: <20251021074254.87065-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_004326_389219_32A73D8B 
X-CRM114-Status: GOOD (  15.99  )
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

changes in v2:
- pick up Conor's Ack for the compatible
- fix the spelling errors reported by Diederik

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


