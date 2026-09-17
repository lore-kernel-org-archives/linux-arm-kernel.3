Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 688C8C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 13:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ILfTWBRlq0WTM2b/gmcjqP8ydIM5XxnX/UlHnDGlshY=; b=v1Bktky2RbnRDppZgzXReA50Ii
	MaB7chi+xA8mzTDOkH2JXTg4DXX2JFIHQlqxdY0EcVhzFHkPAGvkp+pXRqJ163GQeFS9S57sRHLNc
	vNNOrztVJXSl+yupwnJpnG/1MtiqWQjTcNp3aUcycCsSki0EWx+1YMlKTLuqDPG9Et1FYoB0QLxxl
	HSDsSwg7P1MGabsBmFJRLSgDt07u8Vv9rBgN7Q3dP2PEcMw8Z8srSiEI8mJPOVAGvGrVjkWMUI5ap
	pyln+fE1jkx6AcTmnaU7wszEmqvG1maymQTgwef8JU+EgsCj/VRLSHeXUJO5onPoRiQmRjT9U6Lsy
	R/u36xqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7CUa-0000000BRRm-3XmD;
	Thu, 17 Sep 2026 13:49:36 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7CUS-0000000BRKQ-1gT7;
	Thu, 17 Sep 2026 13:49:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789652962;
	bh=Vwa4GrOJLj5QOmHKF3cPLVhahqIlD9N15DaKOL6XZow=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gfIW4wmONU9quRWLErVqefc050kJuXV+HjWpM794SlGC8upnE2Mi5HHh3XO5s25qI
	 rbDMGb3Sdp3Da8aowS0hL1aG89vmR+OiQYTi+wnM12oCRWM26kdbfjA/4OfybptgL+
	 tfvUJoh7uvFSAnQmHamczcO/ZLy1hy+DiDlylmtrG7qjHEhBSS4SoNhH0OVgQw7ySe
	 tgWmzhgQIBOGvZireXI6d/euEvtIA5abdrfROSFGy8LUKC2zOAKrd5GWrYsFykoUS0
	 dU5DtIO7FhrSeFIgetjzoiQd9nJDnXedsbjF2Sl0AytF9IHoZk/SyVONee9hiBh4UR
	 8PM3mEy/4DzgQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 205A417E0CFC;
	Thu, 17 Sep 2026 15:49:22 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 8140E480035; Thu, 17 Sep 2026 15:49:21 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 17 Sep 2026 15:49:17 +0200
Subject: [PATCH 5/8] PM / devfreq: rockchip-dfi: use bulk clock APIs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-rockchip-dfi-cleanup-v1-5-4f00a97a69a6@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4096;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=lvpRuYQwgyj92YlzDFeJ2yAKSqPbRarTndix/sTx4H4=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqr7+FnCJy/jwMa05leUmYukEYxoMo7+2UL3
 rNxQP4QiU6RKYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqq+/hAAoJENju1/PI
 O/qahRYQAIcu0Ng3nsVFJwJZlYpx2G5XCANzt/usufe2TdKNle1X8R6GEtNEj6KUTo7LZV+U5+r
 6nhf9OvEZrFgqOMBXHCey0Zk0jbklGACrA7uBR6RAdLbN6GMhvq3J75Sf4Sj8bUNBrGYHTG7i/q
 kBhv3OYcjV93VHPgRl1DYtaOsV5z7CRdD3nmXxT8tEBlo+OQFOD1NJ8goBtKo30BAScKw1VDabO
 30Gz9cCf/PFYAtqUSQAI6kpCeWKPVe8VnNYxtmPbMu0nkVb6asaBw3CY/PnXG8zER52pshlqtdK
 cMfDxSmhaesilCm4R7WkMJkh7jSuC8NmvTnnXRxQBw1rnInxTvCi79OaLbDpEmC+rtQ0wljUPPi
 u3FmsOolDxiGwfutV30VBePzCbDm/19zPgRySlh2ChV0UcrDVIBgK1VtG4Olav5zYqFnbI/vxvs
 kmceHjBYQRE5dZkVD1Of6NJZruzp0WbbOEMMTJXOVa76F/9wxCkkZTAN7gg3Vbr5q6Mpe792JAb
 HVzXca3qoElo5ZqBI4hKZr1E01TAR6P1FC+EdM+L6Y5D4hV4+8pTzJscO805IOt68h/wkvUKiqc
 6M6J1KddzhhW7ykW6yWSfc6Cs2++IrN1h6N3C8tcxJJFzW1KLXJRUnacmkx9VWYec1z/jsQSOp1
 sSgUTPASSXQQNJZf76GoqkA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_064928_599240_F2B1904A 
X-CRM114-Status: GOOD (  21.16  )
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

Currently, the only clock rockchip-dfi will ever use is on the rk3399,
namely pclk_ddr_mon. However, this is mainly because every other SoC's
mainline clock tree and bindings are probably lying and not telling us
about some clock gate branches that do exist in hardware, but nothing
happens ever gate.

Get preparations out of the way to fix this by moving to the bulk clock
APIs, which will make handling the one-clock-per-channel cases easier to
deal with.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/devfreq/event/rockchip-dfi.c | 39 +++++++++++++++++++++++++++---------
 1 file changed, 30 insertions(+), 9 deletions(-)

diff --git a/drivers/devfreq/event/rockchip-dfi.c b/drivers/devfreq/event/rockchip-dfi.c
index dd9edfd6a674..b61ec500eaed 100644
--- a/drivers/devfreq/event/rockchip-dfi.c
+++ b/drivers/devfreq/event/rockchip-dfi.c
@@ -98,7 +98,7 @@ struct rockchip_dfi {
 	struct device *dev;
 	void __iomem *regs;
 	struct regmap *regmap_pmu;
-	struct clk *clk;
+	struct clk_bulk_data *clocks;
 	int usecount;
 	struct mutex mutex;
 	u32 ddr_type;
@@ -122,6 +122,8 @@ struct rockchip_dfi_variant {
 	int stride;
 	bool ctrl_single;
 	unsigned int max_channels;
+	const char * const *clk_names;
+	unsigned int num_clks;
 };
 
 static int rockchip_dfi_ddrtype_to_ctrl(struct rockchip_dfi *dfi, u32 *ctrl)
@@ -183,9 +185,10 @@ static int rockchip_dfi_enable(struct rockchip_dfi *dfi)
 	if (dfi->usecount > 1)
 		goto out;
 
-	ret = clk_prepare_enable(dfi->clk);
+	ret = clk_bulk_prepare_enable(dfi->variant->num_clks, dfi->clocks);
 	if (ret) {
-		dev_err(&dfi->edev->dev, "failed to enable dfi clk: %d\n", ret);
+		dev_err(&dfi->edev->dev, "failed to enable dfi clocks: %pe\n",
+			ERR_PTR(ret));
 		goto out;
 	}
 
@@ -245,7 +248,7 @@ static void rockchip_dfi_disable(struct rockchip_dfi *dfi)
 			break;
 	}
 
-	clk_disable_unprepare(dfi->clk);
+	clk_bulk_disable_unprepare(dfi->variant->num_clks, dfi->clocks);
 out:
 	mutex_unlock(&dfi->mutex);
 }
@@ -721,11 +724,6 @@ static int rk3399_dfi_init(struct rockchip_dfi *dfi)
 	struct regmap *regmap_pmu = dfi->regmap_pmu;
 	u32 val;
 
-	dfi->clk = devm_clk_get(dfi->dev, "pclk_ddr_mon");
-	if (IS_ERR(dfi->clk))
-		return dev_err_probe(dfi->dev, PTR_ERR(dfi->clk),
-				     "Cannot get the clk pclk_ddr_mon\n");
-
 	/* get ddr type */
 	regmap_read(regmap_pmu, RK3399_PMUGRF_OS_REG2, &val);
 	dfi->ddr_type = FIELD_GET(RK3399_PMUGRF_OS_REG2_DDRTYPE, val);
@@ -802,11 +800,17 @@ static int rk3588_dfi_init(struct rockchip_dfi *dfi)
 	return 0;
 };
 
+static const char * const rk3399_clk_names[] = {
+	"pclk_ddr_mon",
+};
+
 static const struct rockchip_dfi_variant rk3399_variant = {
 	.init = rk3399_dfi_init,
 	.stride = 0x14,
 	.ctrl_single = true,
 	.max_channels = 2,
+	.clk_names = rk3399_clk_names,
+	.num_clks = ARRAY_SIZE(rk3399_clk_names),
 };
 
 static const struct rockchip_dfi_variant rk3568_variant = {
@@ -837,6 +841,7 @@ static int rockchip_dfi_probe(struct platform_device *pdev)
 	struct rockchip_dfi *dfi;
 	struct devfreq_event_desc *desc;
 	struct device_node *np = pdev->dev.of_node, *node;
+	unsigned int i;
 	int ret;
 
 	dfi = devm_kzalloc(dev, sizeof(*dfi), GFP_KERNEL);
@@ -868,6 +873,22 @@ static int rockchip_dfi_probe(struct platform_device *pdev)
 	desc->driver_data = dfi;
 	desc->name = np->name;
 
+	if (dfi->variant->num_clks) {
+		/* NB: CCF is fine with us leaving this NULL if num_clks = 0 */
+		dfi->clocks = devm_kcalloc(dev, dfi->variant->num_clks,
+					   sizeof(*dfi->clocks), GFP_KERNEL);
+		if (!dfi->clocks)
+			return -ENOMEM;
+
+		for (i = 0; i < dfi->variant->num_clks; i++)
+			dfi->clocks[i].id = dfi->variant->clk_names[i];
+
+		ret = devm_clk_bulk_get(dev, dfi->variant->num_clks,
+					dfi->clocks);
+		if (ret)
+			return dev_err_probe(dev, ret, "failed to get clocks\n");
+	}
+
 	ret = dfi->variant->init(dfi);
 	if (ret)
 		return ret;

-- 
2.53.0


