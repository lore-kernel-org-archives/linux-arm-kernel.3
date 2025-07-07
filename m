Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 092F2C83F0A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 17:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UgDyrbY7CdskTK70D5noANtlFt/YxfxBmkElKCjjEWU=; b=aIktk1A3OAyV8+JGPy8tTiYzGY
	nv7Pfner8ZEHaEcMHDdBY6W/FzJKNjG3KV9Q1wgnKI7SbpyFBBTspJnSwgz3gV68JHwiRBIpdT8Tw
	S+zhldwIQubYl4WDAI6aN9fsUyfiS7ggtCrUBfr4/4R1FCNsAkkD9yZx/pcKz+Cg/yvC9L0hpp9fU
	Sl6PCQUpqVVXS7ojawObx7S97nhXbgqkUC13+F1B7xWeR6eDHuSMxa0Yx2gbKWcRhvIFR8x+8slaS
	/RHuUd0AVDzMa3vT+QDI80ZRhI1OhF1/ULGRypsby4WDHEwuIhmHh4FiFSN9OrJMh1zSAnUpw0XRm
	CYMOaqdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYprg-00000003CRm-06Dw;
	Mon, 07 Jul 2025 17:42:52 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYp2N-000000033zf-0GCU;
	Mon, 07 Jul 2025 16:49:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=UgDyrbY7CdskTK70D5noANtlFt/YxfxBmkElKCjjEWU=; b=bg6zCFw9BsFIzPiBP9J4vDAHQ4
	JA5QvATBXNuz2I+Ler6sJCaLkuLTj9MguafUELuCkrTy4PxIevVDmaOaCzUVtqI7lTZg2vhWkizdd
	qT/TEZDniDNfdrRB3E9jR2THpB08PaMebo+cyw5G1kdONc9h6Z/rZ+R49x1hVMUxH0Kh+YqS49RwZ
	Qt2mPMKxcU8c/pDMlbYponD9cbfI4rRMieY876kpD5gjP2HurcAE0XW+DJFi8H1Ch0a1SZHKlDvSb
	6WHUdeVeYtuW6v8JVKNeycNaTNjV7TdAdz5dZHHxktHi+dsULYhUF0isFzuXfRg31vbDhnai6BQep
	W1WScSYA==;
Received: from i53875bf5.versanet.de ([83.135.91.245] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uYp1t-0004yl-4W; Mon, 07 Jul 2025 18:49:21 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: neil.armstrong@linaro.org,
	quic_jesszhan@quicinc.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	hjc@rock-chips.com,
	andy.yan@rock-chips.com,
	andyshrk@163.com,
	nicolas.frattaroli@collabora.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 06/13] drm/panel: ilitek-ili9881c: Add Bestar BSD1218-A101KL68 support
Date: Mon,  7 Jul 2025 18:48:59 +0200
Message-ID: <20250707164906.1445288-7-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250707164906.1445288-1-heiko@sntech.de>
References: <20250707164906.1445288-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_094951_281915_5C4399D2 
X-CRM114-Status: GOOD (  12.92  )
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

Add support for the Bestar BSD1218-A101KL68 panel.

The init table comes from the Firefly BSP ([1]).

[1] https://gitlab.com/firefly-linux/kernel/-/blob/rk3588/firefly/arch/arm64/boot/dts/rockchip/aio-3588l-mipi101-BSD1218-A101KL68.dtsi

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 220 ++++++++++++++++++
 1 file changed, 220 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
index 154eea5f4d77..3095a8bd1ebf 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
@@ -1223,6 +1223,200 @@ static const struct ili9881c_instr am8001280g_init[] = {
 	ILI9881C_COMMAND_INSTR(MIPI_DCS_WRITE_POWER_SAVE, 0x00),
 };
 
+static const struct ili9881c_instr bsd1218_a101kl68_init[] = {
+	ILI9881C_SWITCH_PAGE_INSTR(3),
+	ILI9881C_COMMAND_INSTR(0x01, 0x00),
+	ILI9881C_COMMAND_INSTR(0x02, 0x00),
+	ILI9881C_COMMAND_INSTR(0x03, 0x55),
+	ILI9881C_COMMAND_INSTR(0x04, 0x55),
+	ILI9881C_COMMAND_INSTR(0x05, 0x03),
+	ILI9881C_COMMAND_INSTR(0x06, 0x06),
+	ILI9881C_COMMAND_INSTR(0x07, 0x00),
+	ILI9881C_COMMAND_INSTR(0x08, 0x07),
+	ILI9881C_COMMAND_INSTR(0x09, 0x00),
+	ILI9881C_COMMAND_INSTR(0x0a, 0x00),
+	ILI9881C_COMMAND_INSTR(0x0b, 0x00),
+	ILI9881C_COMMAND_INSTR(0x0c, 0x00),
+	ILI9881C_COMMAND_INSTR(0x0d, 0x00),
+	ILI9881C_COMMAND_INSTR(0x0e, 0x00),
+	ILI9881C_COMMAND_INSTR(0x0f, 0x00),
+	ILI9881C_COMMAND_INSTR(0x10, 0x00),
+	ILI9881C_COMMAND_INSTR(0x11, 0x00),
+	ILI9881C_COMMAND_INSTR(0x12, 0x00),
+	ILI9881C_COMMAND_INSTR(0x13, 0x00),
+	ILI9881C_COMMAND_INSTR(0x14, 0x00),
+	ILI9881C_COMMAND_INSTR(0x15, 0x00),
+	ILI9881C_COMMAND_INSTR(0x16, 0x00),
+	ILI9881C_COMMAND_INSTR(0x17, 0x00),
+	ILI9881C_COMMAND_INSTR(0x18, 0x00),
+	ILI9881C_COMMAND_INSTR(0x19, 0x00),
+	ILI9881C_COMMAND_INSTR(0x1a, 0x00),
+	ILI9881C_COMMAND_INSTR(0x1b, 0x00),
+	ILI9881C_COMMAND_INSTR(0x1c, 0x00),
+	ILI9881C_COMMAND_INSTR(0x1d, 0x00),
+	ILI9881C_COMMAND_INSTR(0x1e, 0xc0),
+	ILI9881C_COMMAND_INSTR(0x1f, 0x80),
+	ILI9881C_COMMAND_INSTR(0x20, 0x04),
+	ILI9881C_COMMAND_INSTR(0x21, 0x03),
+	ILI9881C_COMMAND_INSTR(0x22, 0x00),
+	ILI9881C_COMMAND_INSTR(0x23, 0x00),
+	ILI9881C_COMMAND_INSTR(0x24, 0x00),
+	ILI9881C_COMMAND_INSTR(0x25, 0x00),
+	ILI9881C_COMMAND_INSTR(0x26, 0x00),
+	ILI9881C_COMMAND_INSTR(0x27, 0x00),
+	ILI9881C_COMMAND_INSTR(0x28, 0x33),
+	ILI9881C_COMMAND_INSTR(0x29, 0x33),
+	ILI9881C_COMMAND_INSTR(0x2a, 0x00),
+	ILI9881C_COMMAND_INSTR(0x2b, 0x00),
+	ILI9881C_COMMAND_INSTR(0x2c, 0x00),
+	ILI9881C_COMMAND_INSTR(0x2d, 0x00),
+	ILI9881C_COMMAND_INSTR(0x2e, 0x00),
+	ILI9881C_COMMAND_INSTR(0x2f, 0x00),
+	ILI9881C_COMMAND_INSTR(0x30, 0x00),
+	ILI9881C_COMMAND_INSTR(0x31, 0x00),
+	ILI9881C_COMMAND_INSTR(0x32, 0x00),
+	ILI9881C_COMMAND_INSTR(0x33, 0x00),
+	ILI9881C_COMMAND_INSTR(0x34, 0x04),
+	ILI9881C_COMMAND_INSTR(0x35, 0x00),
+	ILI9881C_COMMAND_INSTR(0x36, 0x00),
+	ILI9881C_COMMAND_INSTR(0x37, 0x00),
+	ILI9881C_COMMAND_INSTR(0x38, 0x3c),
+	ILI9881C_COMMAND_INSTR(0x39, 0x00),
+	ILI9881C_COMMAND_INSTR(0x3a, 0x00),
+	ILI9881C_COMMAND_INSTR(0x3b, 0x00),
+	ILI9881C_COMMAND_INSTR(0x3c, 0x00),
+	ILI9881C_COMMAND_INSTR(0x3d, 0x00),
+	ILI9881C_COMMAND_INSTR(0x3e, 0x00),
+	ILI9881C_COMMAND_INSTR(0x3f, 0x00),
+	ILI9881C_COMMAND_INSTR(0x40, 0x00),
+	ILI9881C_COMMAND_INSTR(0x41, 0x00),
+	ILI9881C_COMMAND_INSTR(0x42, 0x00),
+	ILI9881C_COMMAND_INSTR(0x43, 0x00),
+	ILI9881C_COMMAND_INSTR(0x44, 0x00),
+	ILI9881C_COMMAND_INSTR(0x50, 0x00),
+	ILI9881C_COMMAND_INSTR(0x51, 0x11),
+	ILI9881C_COMMAND_INSTR(0x52, 0x44),
+	ILI9881C_COMMAND_INSTR(0x53, 0x55),
+	ILI9881C_COMMAND_INSTR(0x54, 0x88),
+	ILI9881C_COMMAND_INSTR(0x55, 0xab),
+	ILI9881C_COMMAND_INSTR(0x56, 0x00),
+	ILI9881C_COMMAND_INSTR(0x57, 0x11),
+	ILI9881C_COMMAND_INSTR(0x58, 0x22),
+	ILI9881C_COMMAND_INSTR(0x59, 0x33),
+	ILI9881C_COMMAND_INSTR(0x5a, 0x44),
+	ILI9881C_COMMAND_INSTR(0x5b, 0x55),
+	ILI9881C_COMMAND_INSTR(0x5c, 0x66),
+	ILI9881C_COMMAND_INSTR(0x5d, 0x77),
+	ILI9881C_COMMAND_INSTR(0x5e, 0x00),
+	ILI9881C_COMMAND_INSTR(0x5f, 0x02),
+	ILI9881C_COMMAND_INSTR(0x60, 0x02),
+	ILI9881C_COMMAND_INSTR(0x61, 0x0a),
+	ILI9881C_COMMAND_INSTR(0x62, 0x09),
+	ILI9881C_COMMAND_INSTR(0x63, 0x08),
+	ILI9881C_COMMAND_INSTR(0x64, 0x13),
+	ILI9881C_COMMAND_INSTR(0x65, 0x12),
+	ILI9881C_COMMAND_INSTR(0x66, 0x11),
+	ILI9881C_COMMAND_INSTR(0x67, 0x10),
+	ILI9881C_COMMAND_INSTR(0x68, 0x0f),
+	ILI9881C_COMMAND_INSTR(0x69, 0x0e),
+	ILI9881C_COMMAND_INSTR(0x6a, 0x0d),
+	ILI9881C_COMMAND_INSTR(0x6b, 0x0c),
+	ILI9881C_COMMAND_INSTR(0x6c, 0x06),
+	ILI9881C_COMMAND_INSTR(0x6d, 0x07),
+	ILI9881C_COMMAND_INSTR(0x6e, 0x02),
+	ILI9881C_COMMAND_INSTR(0x6f, 0x02),
+	ILI9881C_COMMAND_INSTR(0x70, 0x02),
+	ILI9881C_COMMAND_INSTR(0x71, 0x02),
+	ILI9881C_COMMAND_INSTR(0x72, 0x02),
+	ILI9881C_COMMAND_INSTR(0x73, 0x02),
+	ILI9881C_COMMAND_INSTR(0x74, 0x02),
+	ILI9881C_COMMAND_INSTR(0x75, 0x02),
+	ILI9881C_COMMAND_INSTR(0x76, 0x02),
+	ILI9881C_COMMAND_INSTR(0x77, 0x0a),
+	ILI9881C_COMMAND_INSTR(0x78, 0x06),
+	ILI9881C_COMMAND_INSTR(0x79, 0x07),
+	ILI9881C_COMMAND_INSTR(0x7a, 0x10),
+	ILI9881C_COMMAND_INSTR(0x7b, 0x11),
+	ILI9881C_COMMAND_INSTR(0x7c, 0x12),
+	ILI9881C_COMMAND_INSTR(0x7d, 0x13),
+	ILI9881C_COMMAND_INSTR(0x7e, 0x0c),
+	ILI9881C_COMMAND_INSTR(0x7f, 0x0d),
+	ILI9881C_COMMAND_INSTR(0x80, 0x0e),
+	ILI9881C_COMMAND_INSTR(0x81, 0x0f),
+	ILI9881C_COMMAND_INSTR(0x82, 0x09),
+	ILI9881C_COMMAND_INSTR(0x83, 0x08),
+	ILI9881C_COMMAND_INSTR(0x84, 0x02),
+	ILI9881C_COMMAND_INSTR(0x85, 0x02),
+	ILI9881C_COMMAND_INSTR(0x86, 0x02),
+	ILI9881C_COMMAND_INSTR(0x87, 0x02),
+	ILI9881C_COMMAND_INSTR(0x88, 0x02),
+	ILI9881C_COMMAND_INSTR(0x89, 0x02),
+	ILI9881C_COMMAND_INSTR(0x8a, 0x02),
+
+	ILI9881C_SWITCH_PAGE_INSTR(4),
+	ILI9881C_COMMAND_INSTR(0x6e, 0x2a),
+	ILI9881C_COMMAND_INSTR(0x6f, 0x37),
+	ILI9881C_COMMAND_INSTR(0x3a, 0x24),
+	ILI9881C_COMMAND_INSTR(0x8d, 0x19),
+	ILI9881C_COMMAND_INSTR(0x87, 0xba),
+	ILI9881C_COMMAND_INSTR(0xb2, 0xd1),
+	ILI9881C_COMMAND_INSTR(0x88, 0x0b),
+	ILI9881C_COMMAND_INSTR(0x38, 0x01),
+	ILI9881C_COMMAND_INSTR(0x39, 0x00),
+	ILI9881C_COMMAND_INSTR(0xb5, 0x02),
+	ILI9881C_COMMAND_INSTR(0x31, 0x25),
+	ILI9881C_COMMAND_INSTR(0x3b, 0x98),
+
+	ILI9881C_SWITCH_PAGE_INSTR(1),
+	ILI9881C_COMMAND_INSTR(0x22, 0x0a),
+	ILI9881C_COMMAND_INSTR(0x31, 0x0c),
+	ILI9881C_COMMAND_INSTR(0x53, 0x40),
+	ILI9881C_COMMAND_INSTR(0x55, 0x45),
+	ILI9881C_COMMAND_INSTR(0x50, 0xb7),
+	ILI9881C_COMMAND_INSTR(0x51, 0xb2),
+	ILI9881C_COMMAND_INSTR(0x60, 0x07),
+	ILI9881C_COMMAND_INSTR(0xa0, 0x22),
+	ILI9881C_COMMAND_INSTR(0xa1, 0x3f),
+	ILI9881C_COMMAND_INSTR(0xa2, 0x4e),
+	ILI9881C_COMMAND_INSTR(0xa3, 0x17),
+	ILI9881C_COMMAND_INSTR(0xa4, 0x1a),
+	ILI9881C_COMMAND_INSTR(0xa5, 0x2d),
+	ILI9881C_COMMAND_INSTR(0xa6, 0x21),
+	ILI9881C_COMMAND_INSTR(0xa7, 0x22),
+	ILI9881C_COMMAND_INSTR(0xa8, 0xc4),
+	ILI9881C_COMMAND_INSTR(0xa9, 0x1b),
+	ILI9881C_COMMAND_INSTR(0xaa, 0x25),
+	ILI9881C_COMMAND_INSTR(0xab, 0xa7),
+	ILI9881C_COMMAND_INSTR(0xac, 0x1a),
+	ILI9881C_COMMAND_INSTR(0xad, 0x19),
+	ILI9881C_COMMAND_INSTR(0xae, 0x4b),
+	ILI9881C_COMMAND_INSTR(0xaf, 0x1f),
+	ILI9881C_COMMAND_INSTR(0xb0, 0x2a),
+	ILI9881C_COMMAND_INSTR(0xb1, 0x59),
+	ILI9881C_COMMAND_INSTR(0xb2, 0x64),
+	ILI9881C_COMMAND_INSTR(0xb3, 0x3f),
+	ILI9881C_COMMAND_INSTR(0xc0, 0x22),
+	ILI9881C_COMMAND_INSTR(0xc1, 0x48),
+	ILI9881C_COMMAND_INSTR(0xc2, 0x59),
+	ILI9881C_COMMAND_INSTR(0xc3, 0x15),
+	ILI9881C_COMMAND_INSTR(0xc4, 0x15),
+	ILI9881C_COMMAND_INSTR(0xc5, 0x28),
+	ILI9881C_COMMAND_INSTR(0xc6, 0x1c),
+	ILI9881C_COMMAND_INSTR(0xc7, 0x1e),
+	ILI9881C_COMMAND_INSTR(0xc8, 0xc4),
+	ILI9881C_COMMAND_INSTR(0xc9, 0x1c),
+	ILI9881C_COMMAND_INSTR(0xca, 0x2b),
+	ILI9881C_COMMAND_INSTR(0xcb, 0xa3),
+	ILI9881C_COMMAND_INSTR(0xcc, 0x1f),
+	ILI9881C_COMMAND_INSTR(0xcd, 0x1e),
+	ILI9881C_COMMAND_INSTR(0xce, 0x52),
+	ILI9881C_COMMAND_INSTR(0xcf, 0x24),
+	ILI9881C_COMMAND_INSTR(0xd0, 0x2a),
+	ILI9881C_COMMAND_INSTR(0xd1, 0x58),
+	ILI9881C_COMMAND_INSTR(0xd2, 0x68),
+	ILI9881C_COMMAND_INSTR(0xd3, 0x3f),
+};
+
 static inline struct ili9881c *panel_to_ili9881c(struct drm_panel *panel)
 {
 	return container_of(panel, struct ili9881c, panel);
@@ -1418,6 +1612,23 @@ static const struct drm_display_mode am8001280g_default_mode = {
 	.height_mm	= 151,
 };
 
+static const struct drm_display_mode bsd1218_a101kl68_default_mode = {
+	.clock		= 70000,
+
+	.hdisplay	= 800,
+	.hsync_start	= 800 + 40,
+	.hsync_end	= 800 + 40 + 20,
+	.htotal		= 800 + 40 + 20 + 20,
+
+	.vdisplay	= 1280,
+	.vsync_start	= 1280 + 20,
+	.vsync_end	= 1280 + 20 + 4,
+	.vtotal		= 1280 + 20 + 4 + 20,
+
+	.width_mm	= 120,
+	.height_mm	= 170,
+};
+
 static int ili9881c_get_modes(struct drm_panel *panel,
 			      struct drm_connector *connector)
 {
@@ -1576,8 +1787,17 @@ static const struct ili9881c_desc am8001280g_desc = {
 		      MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM,
 };
 
+static const struct ili9881c_desc bsd1218_a101kl68_desc = {
+	.init = bsd1218_a101kl68_init,
+	.init_length = ARRAY_SIZE(bsd1218_a101kl68_init),
+	.mode = &bsd1218_a101kl68_default_mode,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+		      MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET,
+};
+
 static const struct of_device_id ili9881c_of_match[] = {
 	{ .compatible = "bananapi,lhr050h41", .data = &lhr050h41_desc },
+	{ .compatible = "bestar,bsd1218-a101kl68", .data = &bsd1218_a101kl68_desc },
 	{ .compatible = "feixin,k101-im2byl02", .data = &k101_im2byl02_desc },
 	{ .compatible = "startek,kd050hdfia020", .data = &kd050hdfia020_desc },
 	{ .compatible = "tdo,tl050hdv35", .data = &tl050hdv35_desc },
-- 
2.47.2


