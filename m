Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A86C982CF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 14:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/QAL6IQSx77r2esXxzrplaztAwSnbFo/D3SL7epNA3U=; b=aBU0wRhFoHmpP9TXodaGbWAar3
	rbxANIz3bQFS9LlGErDG992mERqCVJXIxb2SSUd1/yQD+PLUmz3fK1HkHOgeuIQ7awc5ZyN2tYX0M
	2IRWLIgVgv/lZwTZN+0NOjPqbDGAm19v9+hcsEESTcxDmXXpHu1oxLP8t8lyx5vNaN+J2d+roOZV5
	74xvCnId+wQG6NlMXuXpYrKaU58fkZ7Yj9uCgr+Gm23PS4gsxjecZ+rrW8rIGJLx7Brl3qsK15LX8
	I7KF6wVIUGGiHYhOQ/FTEYi92CbqVo9bCx0ATVTkw9/2/rhuq0rtGD0xXsqrnpKb4eDK3eKhV/CVx
	QINqjJMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Cj1-0000000BUsi-0znU;
	Thu, 17 Sep 2026 14:04:31 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Civ-0000000BUlP-1Wan;
	Thu, 17 Sep 2026 14:04:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789653858;
	bh=TNtuc9GGI5fjqkVDrU17OxAsxDoMnUnAakkErqmjmpM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jMT9IhNF7HGV7QqLeOyyL93BjgncoG8F+jFqYZJt2y0gROue0GjQ9BGA4YH8dbqRO
	 c157zJ8eXVCIEPJ6EjxpmxqgtYOvWQg5PRlmSovlzD+hrR/rXw3j7CrHyxQoSmWfgz
	 kxNBhCdgUsfdqnVeSsXnEODgTqTrG+rhSql5G2ypsZuK6v1eJE+3/Hkpla9gKjHcVZ
	 MTRdigstC78jIVbc7NM7LQ2lS5yhvyMj0yMaVobIYWWROerDr5yt0FpNMklwMPBm0j
	 5mGFDa6mb06mZOs1WPPPych7sWDOUjBg5v9wNj4priXir8niTWzoty5XiSP2Hv3UdB
	 YTWqpqd/DgtXw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 84EA717E0D49;
	Thu, 17 Sep 2026 16:04:18 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id EE3E748003A; Thu, 17 Sep 2026 16:04:17 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 17 Sep 2026 16:04:13 +0200
Subject: [PATCH 7/7] PM / devfreq: rockchip-dfi: add RK3576 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-b4-rockchip-dfi-rk3576-support-v1-7-a5752a29f7bd@collabora.com>
References: <20260917-b4-rockchip-dfi-rk3576-support-v1-0-a5752a29f7bd@collabora.com>
In-Reply-To: <20260917-b4-rockchip-dfi-rk3576-support-v1-0-a5752a29f7bd@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2139;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=TNtuc9GGI5fjqkVDrU17OxAsxDoMnUnAakkErqmjmpM=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqr82EejlJ4FuU9C+ypGh5AhmIBgkLkIVLEA
 skFrKrWWYV3wokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqq/NhAAoJENju1/PI
 O/qa8+YP+QEDsuu3RP/2L/Qy2ETZ2iabxGV5UWbgrhU1pPnDMxMaAssY2VYSmij376j5jUg30yZ
 CsDgJztC5EgYglcDRzFTjrF7jY1BUqFwPInLGCn8rvy25PKxICcLtn5SaqNr3CgfmrwoKw0vgcZ
 LlwhUyyamFvSN/fbb5CJR2jBBemSEEDiDT1GS7xA7pW+4agVXoqpVd/Fq3NVJYVV5BCKSPsDaUL
 eJWoL/ynSBl62rS1ycp9uzCQONR3NubE285zGeLZ9vvtEIQTIlAKg6uiu6pu5P9fEEvnScZ5ihF
 OIVCaS5dT4Sz3BIjTnIQwligCNrcHt0VQ+nEBMDNUKx0pDl/BiNHME5g3RrDG55alodx1brJ/3N
 W9tceAUrE+Kt7debuHyb6+lSWWd8FGpePaa5vh0fYeAPCpPJgphs4Z4il5RZmcFnVZLXl9qDbxD
 xvexArxbuKPEQdJgXsXk2DHhnBFurWLaq6siNybPVNqY+GTfOOFt6OOsFx0K+AItSxGbJK+whay
 TGMNqwEGiWjXSVUnEhpEGSLN3e9A3+Q1c0YuRrwsktw4jOBk9FP1exsuvw4u63SVnNPeRCP2eNI
 Lf7x2N4OShGGhtLgDildct0SDJxrWALQEPIjTUc0SGJ/+vQzQFk50GZWmLbeqdeyYw5fHV4vrsN
 qnibFnxZbttyxFtVEw7kqJA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_070426_143486_EE5E549B 
X-CRM114-Status: GOOD (  13.28  )
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

Add RK3576 support to the DFI driver exposing the same functionality
as found on previous chips. This uses the RK3588 init for getting the
DRAM type info from the GRF registers. In contrast to RK3588 it uses
a newer DDRMON controller IP, though (version 0x40).

Co-developed-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/devfreq/event/rockchip-dfi.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/devfreq/event/rockchip-dfi.c b/drivers/devfreq/event/rockchip-dfi.c
index 8ba97af78e3d..a895e566b4b9 100644
--- a/drivers/devfreq/event/rockchip-dfi.c
+++ b/drivers/devfreq/event/rockchip-dfi.c
@@ -858,6 +858,10 @@ static const char * const rk3399_clk_names[] = {
 	"pclk_ddr_mon",
 };
 
+static const char * const rk3576_clk_names[] = {
+	"pclk_ddr_mon_ch0", "pclk_ddr_mon_ch1",
+};
+
 static const char * const rk3588_clk_names[] = {
 	"pclk_ddr_mon_ch0", "pclk_ddr_mon_ch1", "pclk_ddr_mon_ch2",
 	"pclk_ddr_mon_ch3",
@@ -887,6 +891,18 @@ static const struct rockchip_dfi_variant rk3568_variant = {
 	.reg_access = 0x2c,
 };
 
+static const struct rockchip_dfi_variant rk3576_variant = {
+	.init = rk3588_dfi_init,
+	.stride = 0x10000,
+	.max_channels = 2,
+	.clk_names = rk3576_clk_names,
+	.num_clks = ARRAY_SIZE(rk3576_clk_names),
+	.reg_write_access = 0x28,
+	.reg_read_access = 0x2c,
+	.reg_access = 0x34,
+	.reg_clock_cycles = 0x30,
+};
+
 static const struct rockchip_dfi_variant rk3588_variant = {
 	.init = rk3588_dfi_init,
 	.stride = 0x4000,
@@ -903,6 +919,7 @@ static const struct rockchip_dfi_variant rk3588_variant = {
 static const struct of_device_id rockchip_dfi_id_match[] = {
 	{ .compatible = "rockchip,rk3399-dfi", .data = &rk3399_variant },
 	{ .compatible = "rockchip,rk3568-dfi", .data = &rk3568_variant },
+	{ .compatible = "rockchip,rk3576-dfi", .data = &rk3576_variant },
 	{ .compatible = "rockchip,rk3588-dfi", .data = &rk3588_variant },
 	{ },
 };

-- 
2.53.0


