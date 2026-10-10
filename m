Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A62FCA9EC7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 11:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MUGs28pjyaKV6mm7T8DFRVWF7FBLghSbmcUfgUOr8K0=; b=z4iU33qkVnytgKo0w9vBUvNynR
	ZjTS7lxkGb4r8Hlc4eylKEJWP80BLYBPgh6yX836xL8YZRzl/6M9sIkXh/ApHNUI1k2fO0t+LcLIl
	7DL3a741CMbk+G/XC3mtd8MIa4RPvgpB3JJm1nUeG1rFx5zgi/DkTAnji8KdT/HtIX76RsZxKhk7h
	ovzpSiZ/lQ0CluTpxBdcZOxoZ2mybWLOOClXINLHo8GGowbbXPXEHP2c6rMFwjpvALPiz6dTgn8W8
	Pxv8IyiRlkYAJ1qM5uWtB8X5QdVyL4Zw/+Q6/UES2nzssXuFRdzqVvJ85gVahgSPl1DMRhS5FyDK3
	oeljOWHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFVgS-00000007xxv-1XIV;
	Sat, 10 Oct 2026 11:56:12 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFVg8-00000007xkZ-1Cjd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 11:55:54 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4a061a13884so4860005e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 04:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791633348; x=1792238148; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MUGs28pjyaKV6mm7T8DFRVWF7FBLghSbmcUfgUOr8K0=;
        b=kmJvxMQmFKWxpDcHSAF6UdZF093UsmE55AuTEayv4tcDBQ2iktwezHnsgaJwYo3/Ts
         Qye7SbWM/1JkOMAiH7Gt+eyYnSCMHXhjo5R4Clu/dAbRydeA1Dv5icVp7Aygw9aiaIUr
         GdlrnZ4rnImnvap4JsHr5dW5WWbB3ZwsFm+kOFuLOcRlE6zmzeYtj6RVbI3Z8Q0YKhD1
         zlPKx1jk70y0AATzNiyUOKlN1p8HI0Z3EFnBYZa8lQEAV+RIW5Gnj+7Qk6Gl1VfBKJlD
         /lE/L6uIvPhFm19kFeukBhGovTJ4BZcA4NjJDT2xixVecdDwLKWm15d7gEDDh6eQXcSE
         jUSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791633348; x=1792238148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MUGs28pjyaKV6mm7T8DFRVWF7FBLghSbmcUfgUOr8K0=;
        b=RVgdlEryvcbgtA2hlmNeSEaCBl5NXbciNjI1asIlPTG5t63QwC5x0J/H6CxxNVRh2q
         7cgWH5DzQdKCRcC68VF9vmbv5MV47co/m0UBRJ5+UUqnpbGCNRyXE97qQ8U/fdZftLCH
         V/XnAAG/CtLkVcgJ1jNAXq5mbfq/1yIxQ690vGmCqGV2wNdJZ7nOWfQrFZrQ8FnMmDj0
         U3xZ6hz2weL8qMHnggoA/AXMYgcTtvmGwQ1IEmr+SLApxrHmTVmX0BC4tBgYPmagVe50
         cEfn7irByr/+V8JaWqeP2j2Zpq6OGMN1XaYR2m5yk3Q5YT4ToaRr6+i3mjLp1plGSVEL
         1h7A==
X-Forwarded-Encrypted: i=1; AKwUvBzeGsIFJVIYKChsoaOEnr9K57nng6xq0jEHhuT/KdVLVY/+VZg6IoWn3aSo1jqD8V+/z5TX4SRATHv6oK41XcSI@lists.infradead.org
X-Gm-Message-State: AFq9FYLmWqG5mckATTE1nm7M4xG+hoPMYAVNeLcXWSGYnCryfaVTMl+K
	+bZoDiDQWvI35rlVUDkzFDcSXsZYj4fjOCPm7UOVbx2e0T/O5NR5j3Kh
X-Gm-Gg: AYBFou3Qm+bAwu+hicBdLBeRMz3BFfCgDvpBOSGBpgZQemuseZfeepmN5b8eEpaIn71
	kbazc7U5f+ZuUBjHIAoQqPW+Vc3Ggd1Ha7UzAX8wLOUtaRLjhZy20na7NCjlIUIbBb40Gc4/y2A
	elrRL+krL7b/1OOM/30giZEE9cbMELzydEoDPeOHUAJMlH3IAyV3r2b/NaEob/nHbysHRoGAfDy
	4l0HkAcm/20z5b4qw65jfl0Wde9ijd0htGTVo6j17VlnMN/IQg9dxbktaZe+yt4d4XnvcuGKHCt
	bN9FPIclu6J+N+wGR2EWC5xjrHiiPQ+GyPCMt462HunLW40bAVC2Q5wA9DPhNO7dYbuxSHmuRbL
	ftsXh3syuHGajUzIBCqHOhS/+Y9hAYXN1uQzkyrFCo7LP+1USyGLWjidOuw7oefZjft2kEh04+m
	W+zIAe8Jx7IuDIxzloRznqanHrzWZklfo46iczLndD0XrYUdiNSKKvqVPEnrvM0zAGmL9G33eKI
	gMF1g==
X-Received: by 2002:a05:600c:4e01:b0:49f:ce78:3567 with SMTP id 5b1f17b1804b1-4a18e4afc3amr83354515e9.24.1791633348096;
        Sat, 10 Oct 2026 04:55:48 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9aca657sm8746340f8f.43.2026.10.10.04.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 04:55:47 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Fabien Parent <fparent@baylibre.com>,
	CK Hu <ck.hu@mediatek.com>,
	chunhui dai <chunhui.dai@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/7] Add support for Mediatek mt8167 HDMI display output
Date: Sat, 10 Oct 2026 13:54:00 +0200
Message-ID: <20261010115539.9237-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_045552_495669_C6223A3E 
X-CRM114-Status: GOOD (  19.50  )
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

The MediaTek mt8167 SoC supports HDMI output via a dedicated HDMI PHY
driven by the DPI1 display block.

Support for HDMI output was partially upstreamed in 2021, but is currently
not functional as it's missing its HDMI PHY driver. The HDMI PHY is
apparently similar to the mt2701 one, but some differences in timings and
in the initialization sequence are better expressed with a separate driver.

* Patch 1, 2 add support for the HDMI PHY.

In addition to the HDMI PHY, a few fixes are required here and there to
actually get HDMI output.

* Patch 3: Some of the HDMI registers are mapped into the apmixedsys
  syscon. Since they are manipulated inside the HDMI PHY driver, we change
  the apmixedsys memory map to non exclusive by switching it from
  devm_platform_ioremap_resource to of_iomap. This approach was copied
  from mt8173 apmixedsys syscon.

* Patch 4: Since the DPI1 interface is hardwired to the HDMI PHY, it is
  appropriate for the HDMI PHY to control the DPI1 clocks. There is no
  effect on DPI0 clocks as they're completely separate.

* Patch 5: Some MediaTek SoCs require a supervisor call to enable HDMI
  output. mt8167 is not one of those.

* Patch 6: In the common path for mt2701/mt8167, a register operation that
  is meant to enable the HDMI_PSECUR_EN bit is actually touching some
  other bits that are set by later operations anyway. The patch makes
  more explicit the intent of the operation by setting only the necessary
  bit.

* Patch 7: Adds the device tree nodes to the mt8167 dtsi. Since DPI1
  is hardwired to HDMI it is possible to bind the input port of the HDMI
  node to the output port of DPI1, but the patch that adds the DPI nodes
  to the DTSI [1] has not been picked up yet, so we leave it disconnected
  for now.

The series was tested at all supported resolutions on the Sony PlayStation
Classic Mini.

[1] https://lore.kernel.org/linux-mediatek/20260921113914.779393-5-l.scorcia@gmail.com/

Luca Leonardo Scorcia (7):
  dt-bindings: mediatek: hdmi-phy: Add compatible for mt8167
  phy: mediatek: hdmi: Add support for mt8167
  clk: mediatek: mt8167: Map apmixedsys iomem as shared
  clk: mediatek: mt8167: Correct HDMI-related clock definitions
  drm/mediatek: mtk_hdmi: Set tz_disabled for mt8167
  drm/mediatek: mtk_hdmi: Improve the secure output bit toggle
  arm64: dts: mediatek: mt8167: Add HDMI display nodes

 .../bindings/phy/mediatek,hdmi-phy.yaml       |   1 +
 arch/arm64/boot/dts/mediatek/mt8167.dtsi      |  62 +++++
 drivers/clk/mediatek/clk-mt8167-apmixedsys.c  |  26 ++-
 drivers/clk/mediatek/clk-mt8167.c             |   6 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c           |   3 +-
 drivers/gpu/drm/mediatek/mtk_hdmi_regs.h      |   1 +
 drivers/phy/mediatek/Makefile                 |   1 +
 drivers/phy/mediatek/phy-mtk-hdmi-mt8167.c    | 217 ++++++++++++++++++
 drivers/phy/mediatek/phy-mtk-hdmi.c           |   3 +
 drivers/phy/mediatek/phy-mtk-hdmi.h           |   1 +
 10 files changed, 314 insertions(+), 7 deletions(-)
 create mode 100644 drivers/phy/mediatek/phy-mtk-hdmi-mt8167.c


base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
-- 
2.43.0


