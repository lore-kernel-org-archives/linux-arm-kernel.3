Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A87C982FB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 21:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dI3z7JmlBlGxh13DMJi77YRdVjMKL3NpC1W3YN6YN3s=; b=ioA7YwJ8a/5e6EVK7Vw8JbuMg8
	mYuEHih+dJf13ruNMCuS6TGtmvIZ7kVhRIs7StPLotoMrFXJhyEMHPq01/EPIhvgCyzqSNVV68/nh
	fU5ruQovl7F3vfkkdQgheF+pCsE8kHjLyVAM4Rtfm9Kxy5AFqtXpd67aD/DleOTmCf/mFFQ0ApMp+
	H7i2/w0PxLT69C6eWuNyBeA5K5ZPEtoDDQhDRVY4z2BFFskB6dCoUSZQCS+bEyyGeWvzC8SVrvoC6
	JQa9/vfkf+kzbIq1PAQEmf7mMhX5LGn5CoZEH2OQ6XvGtdgUxGlUZ23E3dElZqO/s7xlS4YTzaYn+
	gYi2woxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8lM6-00000003R8h-1wdh;
	Mon, 21 Sep 2026 21:15:18 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8lM1-00000003R4f-0M1A;
	Mon, 21 Sep 2026 21:15:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790025307;
	bh=uqMNGGCnilMrPONpheO7c6uhWrV0luIU3LS1piJiwUQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jP0Efpz0Vm8CEGwsEpiSACYEuYk5e2udChBTs31bNf9KEpZmkyNNbyzNwKZ4OKH2L
	 S9iMAGhln4FbG9HP2f/Ly2YqNrPffPg/z8Yk2FXHRFaoBG1FPVgxO4Aokxt5BNDnI1
	 QHy2/2HydgfBolqIwFpbEK0WGiCDAL78uD2rCVrrZpHoHnenD1ISQi3Z/9l2bmGqyY
	 OK5bJKu//u5aZic9bczxzdH3t/VLaY8pfQg1TvGss+Ch6i+ecBOEIFyH+P4wq5YFbF
	 5TVa3PwsacTDX/89likwk7UWV/92qIW529C2rbZJOPUbJrjcK1lyQeMy7Y5tWlPs3C
	 je10www9Vgx2Q==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E555717E087F;
	Mon, 21 Sep 2026 23:15:06 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 595DC480035; Mon, 21 Sep 2026 23:15:06 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Mon, 21 Sep 2026 23:15:07 +0200
Subject: [PATCH v2 5/7] PM / devfreq: rockchip-dfi: move register offsets
 to variant struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-b4-rockchip-dfi-rk3576-support-v2-5-04f847016321@collabora.com>
References: <20260921-b4-rockchip-dfi-rk3576-support-v2-0-04f847016321@collabora.com>
In-Reply-To: <20260921-b4-rockchip-dfi-rk3576-support-v2-0-04f847016321@collabora.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3887;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=uqMNGGCnilMrPONpheO7c6uhWrV0luIU3LS1piJiwUQ=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqxnlr79BkrVsguvkA1cajHCrmn0J/ppMa2j
 OiZ3x5OJhKDSIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqsZ5aAAoJENju1/PI
 O/qatcwP/0auVC5k+GjR2+AtlrvsRto+vulEL3KCfeAHBMd8oQGRim0xthoX6khJBv0qnTgT1j3
 meBCmBslP0XA/menqQLuqCIiJKsOVc9+4yrSwB7446rfJ70wAfzpPK84gJKIAaKXjLV4N2tjaxq
 1FMN2vUCGjfuyLkdo6rVMzEggXR1VV2GKHfKSXtp/GW0gue2nXwDXG7OosHgDxYxOPb5L8GPo0z
 vrlAOhHAVzlKaXieNz3u0mG2EW3OUnaTnBMUMIqW3rr/wgITuD9rTrrZv5cImo8DZnzFtaiW6Or
 X3gNvfi3DbqoR0j408KUaJiwILXDwr37uSxeiDexG4/xyBbNU4YtK/UdYBhLfkFTwSe9O5HzeBh
 DtzIOq8M8pc0dKBZNabM4XE7JMoA2AaLbvTZOW4qdj/JFnY4JXWb8iDRtxyeogt35UYOO4fBdww
 7CKXzdFGVYoglgvbmpL5PhoRA1wyL8RQ3DDnkCyRbShXaZgvuQQVkoGemGZ3M72aFZyb6J2UQUm
 ZksY4c53/YIS1NAtIt3x2Cp3px5gIWNjb0S0TgVUkUZwTzP4PsRQJDkSLh9N/RgvUZHBhNYzyMx
 pTaJvD8+Msm5rTtiUEN0p9NgWzd6f+7iuVHOH5KkaLktxA5Lq428JI4bAeRcjoqswQ8G6+4xgOp
 pTCu5s9eIxlXkEI+wWyktbg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_141513_325700_07A10BBD 
X-CRM114-Status: GOOD (  15.67  )
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

DDRMON in version 0x40 (found in RK3576) has two control registers,
which moves the register addresses. Move the register offsets from the
defines to the varaint struct to ease supporting the newer version.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/devfreq/event/rockchip-dfi.c | 34 ++++++++++++++++++++++++----------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/drivers/devfreq/event/rockchip-dfi.c b/drivers/devfreq/event/rockchip-dfi.c
index 380361a231a2..8490219f61be 100644
--- a/drivers/devfreq/event/rockchip-dfi.c
+++ b/drivers/devfreq/event/rockchip-dfi.c
@@ -42,12 +42,6 @@
 #define DDRMON_CTRL_TIMER_CNT_EN	BIT(0)
 #define DDRMON_CTRL_LP5_BANK_MODE_MASK	GENMASK(8, 7)
 
-#define DDRMON_CH0_WR_NUM		0x20
-#define DDRMON_CH0_RD_NUM		0x24
-#define DDRMON_CH0_COUNT_NUM		0x28
-#define DDRMON_CH0_DFI_ACCESS_NUM	0x2c
-#define DDRMON_CH1_COUNT_NUM		0x3c
-#define DDRMON_CH1_DFI_ACCESS_NUM	0x40
 
 #define PERF_EVENT_CYCLES		0x0
 #define PERF_EVENT_READ_BYTES		0x1
@@ -128,6 +122,10 @@ struct rockchip_dfi {
  * @clocks_optional: whether not finding the clocks is non-fatal. Set if the
  *                   DT binding for this variant didn't require clocks in the
  *                   past, so that the driver remains compatible with old DTs.
+ * @reg_write_access: register offset for writes access
+ * @reg_read_access: register offset for read access
+ * @reg_access: register offset for read/write access
+ * @reg_clock_cycles: register offset for clock cycles
  */
 struct rockchip_dfi_variant {
 	int (*init)(struct rockchip_dfi *dfi);
@@ -137,6 +135,10 @@ struct rockchip_dfi_variant {
 	const char * const *clk_names;
 	unsigned int num_clks;
 	bool clocks_optional;
+	u8 reg_write_access;
+	u8 reg_read_access;
+	u8 reg_access;
+	u8 reg_clock_cycles;
 };
 
 static int rockchip_dfi_ddrtype_to_ctrl(struct rockchip_dfi *dfi, u32 *ctrl)
@@ -275,13 +277,13 @@ static void rockchip_dfi_read_counters(struct rockchip_dfi *dfi, struct dmc_coun
 		if (!(dfi->channel_mask & BIT(i)))
 			continue;
 		res->c[i].read_access = readl_relaxed(dfi_regs +
-				DDRMON_CH0_RD_NUM + i * dfi->variant->stride);
+				dfi->variant->reg_read_access + i * dfi->variant->stride);
 		res->c[i].write_access = readl_relaxed(dfi_regs +
-				DDRMON_CH0_WR_NUM + i * dfi->variant->stride);
+				dfi->variant->reg_write_access + i * dfi->variant->stride);
 		res->c[i].access = readl_relaxed(dfi_regs +
-				DDRMON_CH0_DFI_ACCESS_NUM + i * dfi->variant->stride);
+				dfi->variant->reg_access + i * dfi->variant->stride);
 		res->c[i].clock_cycles = readl_relaxed(dfi_regs +
-				DDRMON_CH0_COUNT_NUM + i * dfi->variant->stride);
+				dfi->variant->reg_clock_cycles + i * dfi->variant->stride);
 	}
 }
 
@@ -829,6 +831,10 @@ static const struct rockchip_dfi_variant rk3399_variant = {
 	.max_channels = 2,
 	.clk_names = rk3399_clk_names,
 	.num_clks = ARRAY_SIZE(rk3399_clk_names),
+	.reg_write_access = 0x20,
+	.reg_read_access = 0x24,
+	.reg_clock_cycles = 0x28,
+	.reg_access = 0x2c,
 };
 
 static const struct rockchip_dfi_variant rk3568_variant = {
@@ -836,6 +842,10 @@ static const struct rockchip_dfi_variant rk3568_variant = {
 	.stride = 0x0,
 	.ctrl_single = true,
 	.max_channels = 1,
+	.reg_write_access = 0x20,
+	.reg_read_access = 0x24,
+	.reg_clock_cycles = 0x28,
+	.reg_access = 0x2c,
 };
 
 static const struct rockchip_dfi_variant rk3588_variant = {
@@ -845,6 +855,10 @@ static const struct rockchip_dfi_variant rk3588_variant = {
 	.clk_names = rk3588_clk_names,
 	.num_clks = ARRAY_SIZE(rk3588_clk_names),
 	.clocks_optional = true,
+	.reg_write_access = 0x20,
+	.reg_read_access = 0x24,
+	.reg_clock_cycles = 0x28,
+	.reg_access = 0x2c,
 };
 
 static const struct of_device_id rockchip_dfi_id_match[] = {

-- 
2.53.0


