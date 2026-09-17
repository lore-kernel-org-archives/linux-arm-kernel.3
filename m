Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C681CC982D5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 13:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bJRvcCNaoXZpA2vKZW8mNtfRDLV0GNYvJEp7NrjhqiI=; b=in7GJ111nAcoKERpZrJrvv5RXi
	rCyUbasULhlpfvEt0T4BACArxChVju5Qe2kNGTd4tryJH/TI0kDe9o0jTzj/YvR4RweKKps/leUjX
	72GIqJG7LBc6gxUannkQafxruGliSAuWA0BwpM/FN4fqB+MXfq8j6hbSZgy+qczadJAEoxNn2JNp7
	O+HXIWSgGpnXEdI+27+KkhpchM5e9HO4aI+lsnne5h08yOPCPptQdcsMag25ultGgoVZMLA9vMaid
	87my3++wy7c5yaf9M4J6QzGDW4lHFu+xMha0P5R5x8epCXZ+8suYdwLIuEAlxFjUONkNXiJXoIWtE
	fpbZxapA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7CUb-0000000BRSa-0Iap;
	Thu, 17 Sep 2026 13:49:37 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7CUS-0000000BRKi-3xZi;
	Thu, 17 Sep 2026 13:49:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789652962;
	bh=tiAXtxGxkrnKvU2eq5NeqSXpRtY5IBhw2szF9OLHTKs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mfEEPMHZi6bq0dHpVN5YC36TT+Hxjhh/GnxoeJmqjUcPN4BYW/Xt8MILjKjb9hAA4
	 n9yq+NddK/Z5zEBAwAvAePDQLFB7aQRMdZczAtXVMx9w3oyV2bPVqDRwwhoYLpTtX0
	 0r/ybOffsQ/HLZy8VdwHW6/qwGTyeiR3OoCPNIn4xbaqG1ORY8wR1nJNbrJJftP8Yg
	 +ez3rwdUhcy9pTDTMmJbvGeBooJpOdILVWvOGYBt6yuBs5NjbKzkdHU5izV8KT5Osn
	 IUdHdgzI+QBvBdSIeyWfXY7jmPRuYEMx3b19STjuRJg50ZEUqJYTnHMbwY/RJX3ag0
	 ZclT2D5JimMog==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 28BDC17E0D49;
	Thu, 17 Sep 2026 15:49:22 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 84E4C48003A; Thu, 17 Sep 2026 15:49:21 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 17 Sep 2026 15:49:19 +0200
Subject: [PATCH 7/8] PM / devfreq: rockchip-dfi: make RK3588 use its clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-rockchip-dfi-cleanup-v1-7-4f00a97a69a6@collabora.com>
References: <20260917-rockchip-dfi-cleanup-v1-0-4f00a97a69a6@collabora.com>
In-Reply-To: <20260917-rockchip-dfi-cleanup-v1-0-4f00a97a69a6@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3489;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=qvocAYEOUWCK+4Q9yI0ZwLs4Fy1aQdG/tLvtq/e+Jqc=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqr7+GFV+M6adaNBJbuYk6kVjFVMZuBUGmle
 T/HWkCpx4u3jIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqq+/hAAoJENju1/PI
 O/qa0i0P/2kmfmF5wFPZRp1Kce15wZ231gZnotouedinOs2H9/RgOfH0OUXthZ5UIOdn2lpjzY0
 M35pLf2QzmsKUPp/d/51sOgNCn7/UOH57PwjQtA6CzwpR0fXUQGH4yjTq/vvroYaqkrUtfbKRxZ
 vnPs5kcYCZeCrvJT5q/p+GoIw/kq53ZddMzBuzwruqavFVffybXEO/pBF9lyvaBRsN5lxMuV6Mh
 QgPFnj7vIIsbYgZLWzRPeY6rd65qwNpSKRf/hwF1O0MtxZhx289jXtMTYmv50Y6N9+1X0RCoOW1
 NpNZU+ZU5YF6Q2SsloVeCIV+CJP/zjUI42q4wvsAqe1E2oJdUN+YaihGWeGSOy+wc8MkgZGQ0e2
 hvryTdERy+YnZlnKxoXkYlOSe8o9wDbRS+8HmF6Z1Nx3YUai+g4aQ93VSr3KkTIhddWr3sC1EvC
 0c5bdHo0bJ7r1YspPD0hOVY62Jst4SNXT3CQakQh85UcdzaK1UFBY5vWrrZTIF/A/nWKPD2Iqyn
 ny7OPUN/VY2bZ18nLC28p+lOJPomUJeSfriuSybOT5P4ebzYrsv8ZhbriCMdALz4gm6bcEdlp3N
 uF0dn/VtfneDFSfLtwVwN6K+9bo0oSYBzDoeeBR1x4683J3qeEbZr3FLmqBxttcUtLS8L22TyiT
 u7zp3tHNWhjU80N8HZb070g==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_064929_162777_16336D69 
X-CRM114-Status: GOOD (  21.47  )
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

From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

So far, RK3588 doesn't have the pclks for DDRMON used in the driver, as
they weren't modelled before.

However, they are now correctly modelled, so the driver should use them
when possible.

Instead of unconditionally getting them for this SoC, add a new variant
member that specifies whether the driver should let missing clocks
slide. This is needed because we want old device trees to keep
functioning, as otherwise we'd be introducing a breaking change for
literally no functional difference here.

Fill out a clock name list for this variant as well, and hand it to it.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/devfreq/event/rockchip-dfi.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/devfreq/event/rockchip-dfi.c b/drivers/devfreq/event/rockchip-dfi.c
index b61ec500eaed..380361a231a2 100644
--- a/drivers/devfreq/event/rockchip-dfi.c
+++ b/drivers/devfreq/event/rockchip-dfi.c
@@ -117,6 +117,18 @@ struct rockchip_dfi {
 	const struct rockchip_dfi_variant *variant;
 };
 
+/**
+ * struct rockchip_dfi_variant
+ * @init: pointer to the variant-specific initialisation function
+ * @stride: address offset between the DDRMON per-channel instances
+ * @ctrl_single: whether only one DDRMON instance monitors multiple channels
+ * @max_channels: maximum number of memory channels for this SoC
+ * @clk_names: pointer to a constant array of constant clock name strings
+ * @num_clk: the number of elements in the @clk_names array
+ * @clocks_optional: whether not finding the clocks is non-fatal. Set if the
+ *                   DT binding for this variant didn't require clocks in the
+ *                   past, so that the driver remains compatible with old DTs.
+ */
 struct rockchip_dfi_variant {
 	int (*init)(struct rockchip_dfi *dfi);
 	int stride;
@@ -124,6 +136,7 @@ struct rockchip_dfi_variant {
 	unsigned int max_channels;
 	const char * const *clk_names;
 	unsigned int num_clks;
+	bool clocks_optional;
 };
 
 static int rockchip_dfi_ddrtype_to_ctrl(struct rockchip_dfi *dfi, u32 *ctrl)
@@ -804,6 +817,11 @@ static const char * const rk3399_clk_names[] = {
 	"pclk_ddr_mon",
 };
 
+static const char * const rk3588_clk_names[] = {
+	"pclk_ddr_mon_ch0", "pclk_ddr_mon_ch1", "pclk_ddr_mon_ch2",
+	"pclk_ddr_mon_ch3",
+};
+
 static const struct rockchip_dfi_variant rk3399_variant = {
 	.init = rk3399_dfi_init,
 	.stride = 0x14,
@@ -824,6 +842,9 @@ static const struct rockchip_dfi_variant rk3588_variant = {
 	.init = rk3588_dfi_init,
 	.stride = 0x4000,
 	.max_channels = 4,
+	.clk_names = rk3588_clk_names,
+	.num_clks = ARRAY_SIZE(rk3588_clk_names),
+	.clocks_optional = true,
 };
 
 static const struct of_device_id rockchip_dfi_id_match[] = {
@@ -883,8 +904,12 @@ static int rockchip_dfi_probe(struct platform_device *pdev)
 		for (i = 0; i < dfi->variant->num_clks; i++)
 			dfi->clocks[i].id = dfi->variant->clk_names[i];
 
-		ret = devm_clk_bulk_get(dev, dfi->variant->num_clks,
-					dfi->clocks);
+		if (dfi->variant->clocks_optional)
+			ret = devm_clk_bulk_get_optional(dev, dfi->variant->num_clks,
+							 dfi->clocks);
+		else
+			ret = devm_clk_bulk_get(dev, dfi->variant->num_clks,
+						dfi->clocks);
 		if (ret)
 			return dev_err_probe(dev, ret, "failed to get clocks\n");
 	}

-- 
2.53.0


