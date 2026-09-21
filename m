Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA008C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 21:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/QAL6IQSx77r2esXxzrplaztAwSnbFo/D3SL7epNA3U=; b=oK/qanYdP31vHoW/eGknaCojUB
	JIkZoLr3Cn3nx/Ul+VFm0SBdWOY5yOBxaSB2fdbmuoLtSChbFc3GW4neUgyKK8ne8xLlsTJ41yqsb
	9Cx/Ylh6tJzM8f7RyMdW38E0D9Alv+nf8N38XskKnVpQEEPRzimS5PPvzbOb5JNcT6yzUokK9glnu
	K+nIZJIZZf+A/b9baTu/2xJXJTpSbnynbYirD61tjcpofRHCEby8CpWyAO0FuCTQ6oiVooK1SKPi3
	SVs4m/aBJzJmVDAGf+1kNsyExrArLbJABsWhT35HhZIz4ljntEnzGr9MTzkK8TsPL8A70sgnnf7Tp
	x4m9em/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8lMI-00000003RH2-3cSu;
	Mon, 21 Sep 2026 21:15:30 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8lM1-00000003R4k-22gL;
	Mon, 21 Sep 2026 21:15:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790025307;
	bh=TNtuc9GGI5fjqkVDrU17OxAsxDoMnUnAakkErqmjmpM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kt54p4xpZW4EiBD56EqPJI/QVLDKjN3Xa3rZIzGZxyL8N5Bz6GsLrIvjZblKx9y5t
	 AFzvNmEzzYUfv1yBdW9dIMzaioTKg7PrRIzx0fa34G3EocyMDv1NRSePG/IkNDrfp/
	 3WjF0kLcwcPcJLAHPJrQtnUf0NdjmwDCQPYmojnobz2J66U/yDHk9hKr8XxCvH9rU7
	 zs1zIKJjJaJCopbxBbQf7LHvtqYouCkzzvobSGHb9fmJbFGrSB6xxKXcDGftrRH1/1
	 qHTREswfAEA6dPB73JDpUGz3AusjQIUfjWNe+Ex7QC0c7e8SxgyXUVN0WXoQlRBKg/
	 pu/crUe8feKAg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F078B17E0C41;
	Mon, 21 Sep 2026 23:15:06 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 5CCB548003A; Mon, 21 Sep 2026 23:15:06 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Mon, 21 Sep 2026 23:15:09 +0200
Subject: [PATCH v2 7/7] PM / devfreq: rockchip-dfi: add RK3576 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-b4-rockchip-dfi-rk3576-support-v2-7-04f847016321@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2139;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=TNtuc9GGI5fjqkVDrU17OxAsxDoMnUnAakkErqmjmpM=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqxnlol0OsOFB4ts1S7FhDqpQZ6O1/Wwptfn
 ZUQCwWFIe08pIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqsZ5aAAoJENju1/PI
 O/qaDL8QAKpjQ/mqe+tNS/dJfsKdgheQwI7p9BLdOqUz7eC+De199dvACWqIX2E5mxo5+N9XUE3
 l4qHb8Q3668ZWT9yChRP1R2uxURNR0nKPf/SsASgug4kNi30y23Ez5/tIAYGrdIgY+QUm0LBnIj
 iUM/N03JlNpIau/OSRFise/z4ue4MRGuJOGFOcQxt2NeyQS73FLxPZzIHA+4YxfrPh6ohYwYyr0
 T63djmkAh6l1n4gXE8TBBdQ2Dx9/TQppoH2R7bfq9g2iULrfqxbSG19f5b+5cjCeHue+98MARUc
 mug/MjebIDilIgSU9tdJGgdSVuKNresE3ZetB12C0sSKU8v0KwKw8nz6Wx0tTm4GT7Hhrt/jGVu
 CoYH61jLS78Gu0swN4HvZxF7tbS8hby5FzRjTsu0nbh444/QQ5szh/Nzur3+t2pHWAgvsd5seo2
 qlSUy6jWASUCmEUdCI7Zo/pLuZf2COAOeGJz78wTUWYjVAAJJVFgGlaemqcZTgkJtMFjvtEcEem
 rD+ZlyYd1eNnjypMNDospKY5vaEo1n6HSlryxm52q19qvPKXEK55WZjYmtpeKXTfMIqvt2V4Cy/
 KFDMjtT9XVNBry5II4KQywznZFk8mmwrWGAHZz71P28VwhdKbGd09Jd8dRGW8Ihk+EfeLnr4T9B
 Et9Obo5PvSnzyYse7UqYzmQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_141513_676819_56076059 
X-CRM114-Status: GOOD (  13.57  )
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


