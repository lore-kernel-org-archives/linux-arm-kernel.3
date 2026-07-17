Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DCE6C44517
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 08:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vDUk8y/EEhZBBu0L9bqDdy+tbB8EaRNIICnHcrc2lYI=; b=3hXKH7tf/6gx7OwDWGO6PUIiR4
	ZN8Pm4qfoQH9zR1VEJUipikuG3BkI80eSfMfBlI/YMXOygn5moiKJ57lC9PJQBrc3KBm2sdSdZXWZ
	xL0mg5YYUP1oYtS1ictWc+cNOg7XRtSaoWx+7WuT3sRySSUkv6VbqABvjVj+K8syatXF3AmA5GQ8Y
	euEFh8I/BCGkhoUiNTbd0ipAaIot2MWaC6y3RbytlyTFpUpwCPJt3JLYfiri5rmBRdZo8AoEL/CEC
	2YNd/5g03vfcJOdtD5/RUZl023CojpVM93KvrfoPTaMZ4BbIlYx8l83PEBU4Wvh5txUptn7y9sFZ0
	3nIxCHPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdU9-00000001X92-3wlZ;
	Fri, 17 Jul 2026 07:59:54 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdTw-00000001Wzx-22Qi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 07:59:43 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-47640541585so3731778f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 00:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ahdrone.com; s=google; t=1784275178; x=1784879978; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vDUk8y/EEhZBBu0L9bqDdy+tbB8EaRNIICnHcrc2lYI=;
        b=EvXjN+utTxqGu7i+itjsZU/PiQSAVlDibxjLwbMGRsfF2Tk0lUch3J8TSEq/2d96Pf
         r8/iBOn0ks4mZI4PWhuIkih1u1zbL1VVdRnVkFqCeEhRsB8lb76fOPsDb9DpovPvIIB1
         DdxDDc+ISHlCctjYtxaMoDdYIs+2EYTKLTqDdL+DNcXyEHNySPxNqsKV3uPuEhezx6vV
         COX+eMqaHYQxMQmISNdb087Iv7dnEVieIjDBb5ib17NYqTCR/DMwnHCNWFacxq4WLW/j
         7Vgi1KcZlbGbYaE2Qdn9hTgkYl9AaCnNlmrVx8Z1sQe44KdhNDUNgWE1ABkJ4JXH5uk8
         kRDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784275178; x=1784879978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vDUk8y/EEhZBBu0L9bqDdy+tbB8EaRNIICnHcrc2lYI=;
        b=TJuwi8n+4xghuhJjIQbNMZBpIqFMgewBoxEUSkSMdAlvdRJbniL9s7nG4l+Qs9vxWB
         QqXq7q+O7VbA4xSa+5vvaI1iQYXYzs0LIqzetyrdaPhgu+CPFeFX4LgP4w81c0Hcp6TJ
         WgzF4AmieL7Fy8wt+FLz4iuSnW4amXwtCgFjmrHk4/JokzKSMi5UHJ78QH6e2ABA7SDU
         rXYrMyyPGuIRubL+Vl9gLcS0cArNkX6oNqbin0jkh6OssEUpuEtoz+FYsXRtIeGPRGOS
         zAid1E4Y+jI6vsaP2UGylvlKl+K/1WjgwjjSO7o8N2FbdUL7St/U2KSv+sBIau7Jhssp
         p/HQ==
X-Forwarded-Encrypted: i=1; AHgh+RqQrD+5T7rScvoYK2Z34+9vcItZuOfjSBtClOEqkaVNuSTPABHN9i79oJ6Atb4XKUzqGy0RJYBrPpPnoXAgV4mi@lists.infradead.org
X-Gm-Message-State: AOJu0YwSyXiBXz8bt91g5jQ9/5rnJ2MhyGOvj7DOgYOvU3wEWYRWlrHr
	1N7a8CKfKX5Wvs60oSMczrTAkAxREYI+76gfX7eL9fuAL7BlhbDE1Z9Cyr1VLqEesw==
X-Gm-Gg: AfdE7cmob+BqViKtzXmmtiL+7ft1ybZefasswz105+7nRzzMDPoacWXC6u2y8X9Wjoz
	rXghzYBNZ7laMOA53hPOejBA5lqosTfZ0wJNKI8JelbOgJX00U88qSY2+ENIkqbn5oH+j6WEOZc
	sP7u+vLIWryW1QOMMUAgHaH6vrFxG/wh0rihV+xbsDC1I81f/2YJNhf4rVX8K3GYw4vBrnTtfM4
	WK4yX4v//LDH5RsYlcb8++oovPWUP3JK3TUt7k4nsD6qYmLc6ev93m/a8weIv23cxMiPvk764FS
	KUTiODlZLEQPyuaRCx9CH6KAZVgXtT3qr3VWE6p5e4RpnhQaVoItpIIalhuRXd1UvOeehRGaboc
	KfmWKGFYNyr2buHi+Cds6csXeTqqpTsSAM8EfwQYruVdug+jSlH5RmdKSBVotJgoCUImRvMnb2p
	L3YZsmrXhY1x/HNDdZGAKFWIzQjouF5ydSsYXe
X-Received: by 2002:a05:600c:3b8e:b0:495:4bf3:2150 with SMTP id 5b1f17b1804b1-4954bf3216amr5291465e9.8.1784275178234;
        Fri, 17 Jul 2026 00:59:38 -0700 (PDT)
Received: from rikus ([2a01:e0a:edb:6330:cc2f:bd70:58a:fcfb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549a3e2a9sm31709045e9.4.2026.07.17.00.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 00:59:37 -0700 (PDT)
From: Hugo VALTIER <hugo@ahdrone.com>
To: Linus Walleij <linusw@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Hugo VALTIER <hugo@ahdrone.com>,
	linux-gpio@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dmitry Yashin <dmt.yashin@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 1/3] pinctrl: rockchip: constify mux recalced and route data arrays
Date: Fri, 17 Jul 2026 09:59:14 +0200
Message-ID: <20260717075918.1869879-2-hugo@ahdrone.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260717075918.1869879-1-hugo@ahdrone.com>
References: <20260717075918.1869879-1-hugo@ahdrone.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_005940_610286_B830F0E4 
X-CRM114-Status: GOOD (  13.85  )
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

The mux_recalced_data and mux_route_data arrays are never modified after
initialization. Mark them const so they can be placed in read-only
memory. Also constify the corresponding struct fields in
rockchip_pin_ctrl and local pointer variables.

This is inspired by review comments on Dmitry Yashin's earlier
RK3308B series [1].

[1] https://lore.kernel.org/all/20240515121634.23945-1-dmt.yashin@gmail.com/

Signed-off-by: Hugo VALTIER <hugo@ahdrone.com>
---
 drivers/pinctrl/pinctrl-rockchip.c | 34 +++++++++++++++---------------
 drivers/pinctrl/pinctrl-rockchip.h |  4 ++--
 2 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 7e0fcd45fd26..849e72f1832c 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -483,7 +483,7 @@ static struct rockchip_mux_recalced_data rv1103b_mux_recalced_data[] = {
 	},
 };
 
-static struct rockchip_mux_recalced_data rv1108_mux_recalced_data[] = {
+static const struct rockchip_mux_recalced_data rv1108_mux_recalced_data[] = {
 	{
 		.num = 1,
 		.pin = 0,
@@ -547,7 +547,7 @@ static struct rockchip_mux_recalced_data rv1108_mux_recalced_data[] = {
 	},
 };
 
-static struct rockchip_mux_recalced_data rv1126_mux_recalced_data[] = {
+static const struct rockchip_mux_recalced_data rv1126_mux_recalced_data[] = {
 	{
 		.num = 0,
 		.pin = 20,
@@ -578,7 +578,7 @@ static struct rockchip_mux_recalced_data rv1126_mux_recalced_data[] = {
 	},
 };
 
-static  struct rockchip_mux_recalced_data rk3128_mux_recalced_data[] = {
+static const struct rockchip_mux_recalced_data rk3128_mux_recalced_data[] = {
 	{
 		.num = 2,
 		.pin = 20,
@@ -612,7 +612,7 @@ static  struct rockchip_mux_recalced_data rk3128_mux_recalced_data[] = {
 	},
 };
 
-static struct rockchip_mux_recalced_data rk3308_mux_recalced_data[] = {
+static const struct rockchip_mux_recalced_data rk3308_mux_recalced_data[] = {
 	{
 		/* gpio1b6_sel */
 		.num = 1,
@@ -721,7 +721,7 @@ static struct rockchip_mux_recalced_data rk3308_mux_recalced_data[] = {
 	},
 };
 
-static struct rockchip_mux_recalced_data rk3328_mux_recalced_data[] = {
+static const struct rockchip_mux_recalced_data rk3328_mux_recalced_data[] = {
 	{
 		/* gpio2_b7_sel */
 		.num = 2,
@@ -793,7 +793,7 @@ static void rockchip_get_recalced_mux(struct rockchip_pin_bank *bank, int pin,
 {
 	struct rockchip_pinctrl *info = bank->drvdata;
 	struct rockchip_pin_ctrl *ctrl = info->ctrl;
-	struct rockchip_mux_recalced_data *data;
+	const struct rockchip_mux_recalced_data *data;
 	int i;
 
 	for (i = 0; i < ctrl->niomux_recalced; i++) {
@@ -811,7 +811,7 @@ static void rockchip_get_recalced_mux(struct rockchip_pin_bank *bank, int pin,
 	*bit = data->bit;
 }
 
-static struct rockchip_mux_route_data px30_mux_route_data[] = {
+static const struct rockchip_mux_route_data px30_mux_route_data[] = {
 	RK_MUXROUTE_SAME(2, RK_PB4, 1, 0x184, BIT(16 + 7)), /* cif-d0m0 */
 	RK_MUXROUTE_SAME(3, RK_PA1, 3, 0x184, BIT(16 + 7) | BIT(7)), /* cif-d0m1 */
 	RK_MUXROUTE_SAME(2, RK_PB6, 1, 0x184, BIT(16 + 7)), /* cif-d1m0 */
@@ -862,7 +862,7 @@ static struct rockchip_mux_route_data px30_mux_route_data[] = {
 	RK_MUXROUTE_SAME(1, RK_PB5, 2, 0x184, BIT(16 + 9) | BIT(9)), /* uart3-rtsm1 */
 };
 
-static struct rockchip_mux_route_data rv1126_mux_route_data[] = {
+static const struct rockchip_mux_route_data rv1126_mux_route_data[] = {
 	RK_MUXROUTE_GRF(3, RK_PD2, 1, 0x10260, WRITE_MASK_VAL(0, 0, 0)), /* I2S0_MCLK_M0 */
 	RK_MUXROUTE_GRF(3, RK_PB0, 3, 0x10260, WRITE_MASK_VAL(0, 0, 1)), /* I2S0_MCLK_M1 */
 
@@ -959,7 +959,7 @@ static struct rockchip_mux_route_data rv1126_mux_route_data[] = {
 	RK_MUXROUTE_PMU(1, RK_PD0, 5, 0x0118, WRITE_MASK_VAL(2, 2, 1)), /* UART1_TX_M1 */
 };
 
-static struct rockchip_mux_route_data rk3128_mux_route_data[] = {
+static const struct rockchip_mux_route_data rk3128_mux_route_data[] = {
 	RK_MUXROUTE_SAME(1, RK_PB2, 1, 0x144, BIT(16 + 3) | BIT(16 + 4)), /* spi-0 */
 	RK_MUXROUTE_SAME(1, RK_PD3, 3, 0x144, BIT(16 + 3) | BIT(16 + 4) | BIT(3)), /* spi-1 */
 	RK_MUXROUTE_SAME(0, RK_PB5, 2, 0x144, BIT(16 + 3) | BIT(16 + 4) | BIT(4)), /* spi-2 */
@@ -969,12 +969,12 @@ static struct rockchip_mux_route_data rk3128_mux_route_data[] = {
 	RK_MUXROUTE_SAME(2, RK_PA4, 2, 0x144, BIT(16 + 6) | BIT(6)), /* emmc-1 */
 };
 
-static struct rockchip_mux_route_data rk3188_mux_route_data[] = {
+static const struct rockchip_mux_route_data rk3188_mux_route_data[] = {
 	RK_MUXROUTE_SAME(0, RK_PD0, 1, 0xa0, BIT(16 + 11)), /* non-iomuxed emmc/flash pins on flash-dqs */
 	RK_MUXROUTE_SAME(0, RK_PD0, 2, 0xa0, BIT(16 + 11) | BIT(11)), /* non-iomuxed emmc/flash pins on emmc-clk */
 };
 
-static struct rockchip_mux_route_data rk3228_mux_route_data[] = {
+static const struct rockchip_mux_route_data rk3228_mux_route_data[] = {
 	RK_MUXROUTE_SAME(0, RK_PD2, 1, 0x50, BIT(16)), /* pwm0-0 */
 	RK_MUXROUTE_SAME(3, RK_PC5, 1, 0x50, BIT(16) | BIT(0)), /* pwm0-1 */
 	RK_MUXROUTE_SAME(0, RK_PD3, 1, 0x50, BIT(16 + 1)), /* pwm1-0 */
@@ -995,12 +995,12 @@ static struct rockchip_mux_route_data rk3228_mux_route_data[] = {
 	RK_MUXROUTE_SAME(3, RK_PB5, 1, 0x50, BIT(16 + 11) | BIT(11)), /* uart1-1_rx */
 };
 
-static struct rockchip_mux_route_data rk3288_mux_route_data[] = {
+static const struct rockchip_mux_route_data rk3288_mux_route_data[] = {
 	RK_MUXROUTE_SAME(7, RK_PC0, 2, 0x264, BIT(16 + 12) | BIT(12)), /* edphdmi_cecinoutt1 */
 	RK_MUXROUTE_SAME(7, RK_PC7, 4, 0x264, BIT(16 + 12)), /* edphdmi_cecinout */
 };
 
-static struct rockchip_mux_route_data rk3308_mux_route_data[] = {
+static const struct rockchip_mux_route_data rk3308_mux_route_data[] = {
 	RK_MUXROUTE_SAME(0, RK_PC3, 1, 0x314, BIT(16 + 0) | BIT(0)), /* rtc_clk */
 	RK_MUXROUTE_SAME(1, RK_PC6, 2, 0x314, BIT(16 + 2) | BIT(16 + 3)), /* uart2_rxm0 */
 	RK_MUXROUTE_SAME(4, RK_PD2, 2, 0x314, BIT(16 + 2) | BIT(16 + 3) | BIT(2)), /* uart2_rxm1 */
@@ -1016,7 +1016,7 @@ static struct rockchip_mux_route_data rk3308_mux_route_data[] = {
 	RK_MUXROUTE_SAME(2, RK_PA4, 3, 0x600, BIT(16 + 2) | BIT(2)), /* pdm-clkm-m2 */
 };
 
-static struct rockchip_mux_route_data rk3328_mux_route_data[] = {
+static const struct rockchip_mux_route_data rk3328_mux_route_data[] = {
 	RK_MUXROUTE_SAME(1, RK_PA1, 2, 0x50, BIT(16) | BIT(16 + 1)), /* uart2dbg_rxm0 */
 	RK_MUXROUTE_SAME(2, RK_PA1, 1, 0x50, BIT(16) | BIT(16 + 1) | BIT(0)), /* uart2dbg_rxm1 */
 	RK_MUXROUTE_SAME(1, RK_PB3, 2, 0x50, BIT(16 + 2) | BIT(2)), /* gmac-m1_rxd0 */
@@ -1031,7 +1031,7 @@ static struct rockchip_mux_route_data rk3328_mux_route_data[] = {
 	RK_MUXROUTE_SAME(2, RK_PC0, 4, 0x50, BIT(16 + 9) | BIT(9)), /* cif_data5m1 */
 };
 
-static struct rockchip_mux_route_data rk3399_mux_route_data[] = {
+static const struct rockchip_mux_route_data rk3399_mux_route_data[] = {
 	RK_MUXROUTE_SAME(4, RK_PB0, 2, 0xe21c, BIT(16 + 10) | BIT(16 + 11)), /* uart2dbga_rx */
 	RK_MUXROUTE_SAME(4, RK_PC0, 2, 0xe21c, BIT(16 + 10) | BIT(16 + 11) | BIT(10)), /* uart2dbgb_rx */
 	RK_MUXROUTE_SAME(4, RK_PC3, 1, 0xe21c, BIT(16 + 10) | BIT(16 + 11) | BIT(11)), /* uart2dbgc_rx */
@@ -1039,7 +1039,7 @@ static struct rockchip_mux_route_data rk3399_mux_route_data[] = {
 	RK_MUXROUTE_SAME(4, RK_PD0, 1, 0xe21c, BIT(16 + 14) | BIT(14)), /* pcie_clkreqnb */
 };
 
-static struct rockchip_mux_route_data rk3568_mux_route_data[] = {
+static const struct rockchip_mux_route_data rk3568_mux_route_data[] = {
 	RK_MUXROUTE_PMU(0, RK_PB7, 1, 0x0110, WRITE_MASK_VAL(1, 0, 0)), /* PWM0 IO mux M0 */
 	RK_MUXROUTE_PMU(0, RK_PC7, 2, 0x0110, WRITE_MASK_VAL(1, 0, 1)), /* PWM0 IO mux M1 */
 	RK_MUXROUTE_PMU(0, RK_PC0, 1, 0x0110, WRITE_MASK_VAL(3, 2, 0)), /* PWM1 IO mux M0 */
@@ -1140,7 +1140,7 @@ static bool rockchip_get_mux_route(struct rockchip_pin_bank *bank, int pin,
 {
 	struct rockchip_pinctrl *info = bank->drvdata;
 	struct rockchip_pin_ctrl *ctrl = info->ctrl;
-	struct rockchip_mux_route_data *data;
+	const struct rockchip_mux_route_data *data;
 	int i;
 
 	for (i = 0; i < ctrl->niomux_routes; i++) {
diff --git a/drivers/pinctrl/pinctrl-rockchip.h b/drivers/pinctrl/pinctrl-rockchip.h
index bb0e803e3b8a..dd07a16f615c 100644
--- a/drivers/pinctrl/pinctrl-rockchip.h
+++ b/drivers/pinctrl/pinctrl-rockchip.h
@@ -400,9 +400,9 @@ struct rockchip_pin_ctrl {
 	int				pmu_mux_offset;
 	int				grf_drv_offset;
 	int				pmu_drv_offset;
-	struct rockchip_mux_recalced_data *iomux_recalced;
+	const struct rockchip_mux_recalced_data *iomux_recalced;
 	u32				niomux_recalced;
-	struct rockchip_mux_route_data *iomux_routes;
+	const struct rockchip_mux_route_data *iomux_routes;
 	u32				niomux_routes;
 
 	int	(*pull_calc_reg)(struct rockchip_pin_bank *bank,
-- 
2.55.0


