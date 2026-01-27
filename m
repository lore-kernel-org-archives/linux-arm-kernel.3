Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9148D3409B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 16:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4YNTaowixnozBp6OgMoCK33IRiaDQ/kgBlgssEsqiwo=; b=X0boHMgKAiNCuIBXZfIyi8J2td
	XWU3VjRcZIolwMbHvs/Dp2Xrc4towy+nm/75NvpGVNu6JahxXVANa1Dvv7M/io/TKGCD+YrUT9PeU
	vXTWWl9Thz5nkl1tf+ECsSXADEulUtC1EppMMeeWXFCwQUaKJQZSfrV01wAqIYljwc/SyslmEQ1Yz
	cvVaZihZkh8RtQXo5VwfdMQ6PQcOoyoTW2cGmXpm/xYCbcBoqwLqv2KGRMG9F9YmIR+ELRMCvs9Xy
	bgVywM8FCfwB0c+9VfJ+3QgicOC3Fm6myRsVLtfZ3HUpyKqzRj/Q+1iRTsCOx0jlaL4cIRZ7o42DM
	ds/6ARUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vklcc-0000000Ec0M-2GTE;
	Tue, 27 Jan 2026 16:08:54 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vklca-0000000Ebyp-1NeO;
	Tue, 27 Jan 2026 16:08:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1769530129;
	bh=kL9kNvqSXpOVHTWoVnZEkOBC5bbK790jsX9GDjm0yZg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZhpQtmSczb3U82x8A+JD7eBWzDq/HSVJ8wuG8SD+ikRWHn0vTbv7dJPHSLYOekyzT
	 HchLoXbEzJPJLOsAjXGQ7aY7zEIe+bh16n2dRPhWuMgnQk6LBwG7Qdz13WmV7i6Dnu
	 yuLm3MK1bOD1QW6LJvh1mVuNZKNyZkQpXHrAtvt6Vw4HpjvqM8o4VCEsTi3Z6diZMm
	 pRhrje6OO73sG92DrLB6tGsJSOuFffV9oh08YHYYJOE1w04TRZmE+DPevl2cfU0vu5
	 RxrQLOulyoRcvs1XiUow8QD9YsSUpc8YSwPhO3GOjMoEapku2bQhBlur19MHFyOgS7
	 I0Waf+HoHDkIQ==
Received: from jupiter.universe (dyndsl-091-248-210-071.ewe-ip-backbone.de [91.248.210.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 78B2D17E00AC;
	Tue, 27 Jan 2026 17:08:49 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 3486E480038; Tue, 27 Jan 2026 17:08:49 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 27 Jan 2026 17:08:22 +0100
Subject: [PATCH 02/10] ASoC: rockchip: spdif: Move DT compatible table
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-rockchip-spdif-cleanup-and-bsp-sync-v1-2-a7c547072bbb@collabora.com>
References: <20260127-rockchip-spdif-cleanup-and-bsp-sync-v1-0-a7c547072bbb@collabora.com>
In-Reply-To: <20260127-rockchip-spdif-cleanup-and-bsp-sync-v1-0-a7c547072bbb@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Alexey Charkov <alchark@gmail.com>, 
 Sjoerd Simons <sjoerd.simons@collabora.com>, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3102;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=kL9kNvqSXpOVHTWoVnZEkOBC5bbK790jsX9GDjm0yZg=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGl44xCH0fJv0AZ5RtUF/UqPoZ+zg4liu6CLs
 T0gTRftH9vVGYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpeOMQAAoJENju1/PI
 O/qa0wUQAIoQ6OlvovSDSonbD5rIV0SKSWd48HMd7hysmB314iSkPvJxnFiIuchm9gf50qkuxWa
 i5i+QeDCBpCdoxE9+ZgRyRWjQouiuqts0pD+eBl2jpm5AfPR1KzMFoHYJ4Z7aQMLmMDOefA75NR
 0IElaXk5ILY0ZrXtFfcg7H9Dgn5bzAJM6o/DglXYt+PPNmtEgzTQgZ1ErsqRQMkjbV/dKf+yJ4i
 UolFsmtbat37eQPluZtIkdSffeqq9CrACak5lCli54Fw2sKKYat/4cQeRo0CLR6zfKFGR7/HUgz
 +wOtdoJxZecq/gdrKTsmAh4GmR05EZ6cWxeCna8tWiSOFjwFODPAMXiu0V0nmcWwwNAz7tMLeOn
 eHpU3aKQYCYEWxzIMla+zVgSXR6rZejyGalGGZxBnNziYuyBsEXsqGTFs6Lx2MktKtuVGLfeOGo
 Bzv/Ym5t7lxS3mUIwsCIyy9oxX1tMobrv8/42hiMBuPP1Ik2+I6NuKbJAeOM/dn16RuraZWF0+q
 HTuds55U/8IAuvgQ8mOtFnemv1EQ5W72+BVi0UzHZHudFY+2TY5BadiIMtClD+6aJO1UobUeUeq
 Ix3Upe8vOZ+32oIAn/IUqjKtlV7Cw8hW+OfdKMy7kVlGOajl7QKuBbyvRFJvS5Y98DVxj3JcFBn
 Hga+lAOSeWPrreFlGLWspIA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_080852_540230_16E9192E 
X-CRM114-Status: GOOD (  14.29  )
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

Move rk_spdif_match DT compatible table to the usual place before the
platform-driver struct definition and drop the useless of_match_ptr(),
since it is fine to reference the DT id table even when OF support is
disabled (which makes the driver useless anyways).

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 sound/soc/rockchip/rockchip_spdif.c | 48 ++++++++++++++++++-------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_spdif.c b/sound/soc/rockchip/rockchip_spdif.c
index 23f14274a6e0..331a23d5173f 100644
--- a/sound/soc/rockchip/rockchip_spdif.c
+++ b/sound/soc/rockchip/rockchip_spdif.c
@@ -40,29 +40,6 @@ struct rk_spdif_dev {
 	struct regmap *regmap;
 };
 
-static const struct of_device_id rk_spdif_match[] __maybe_unused = {
-	{ .compatible = "rockchip,rk3066-spdif",
-	  .data = (void *)RK_SPDIF_RK3066 },
-	{ .compatible = "rockchip,rk3188-spdif",
-	  .data = (void *)RK_SPDIF_RK3188 },
-	{ .compatible = "rockchip,rk3228-spdif",
-	  .data = (void *)RK_SPDIF_RK3366 },
-	{ .compatible = "rockchip,rk3288-spdif",
-	  .data = (void *)RK_SPDIF_RK3288 },
-	{ .compatible = "rockchip,rk3328-spdif",
-	  .data = (void *)RK_SPDIF_RK3366 },
-	{ .compatible = "rockchip,rk3366-spdif",
-	  .data = (void *)RK_SPDIF_RK3366 },
-	{ .compatible = "rockchip,rk3368-spdif",
-	  .data = (void *)RK_SPDIF_RK3366 },
-	{ .compatible = "rockchip,rk3399-spdif",
-	  .data = (void *)RK_SPDIF_RK3366 },
-	{ .compatible = "rockchip,rk3568-spdif",
-	  .data = (void *)RK_SPDIF_RK3366 },
-	{},
-};
-MODULE_DEVICE_TABLE(of, rk_spdif_match);
-
 static int rk_spdif_runtime_suspend(struct device *dev)
 {
 	struct rk_spdif_dev *spdif = dev_get_drvdata(dev);
@@ -377,12 +354,35 @@ static const struct dev_pm_ops rk_spdif_pm_ops = {
 	RUNTIME_PM_OPS(rk_spdif_runtime_suspend, rk_spdif_runtime_resume, NULL)
 };
 
+static const struct of_device_id rk_spdif_match[] = {
+	{ .compatible = "rockchip,rk3066-spdif",
+	  .data = (void *)RK_SPDIF_RK3066 },
+	{ .compatible = "rockchip,rk3188-spdif",
+	  .data = (void *)RK_SPDIF_RK3188 },
+	{ .compatible = "rockchip,rk3228-spdif",
+	  .data = (void *)RK_SPDIF_RK3366 },
+	{ .compatible = "rockchip,rk3288-spdif",
+	  .data = (void *)RK_SPDIF_RK3288 },
+	{ .compatible = "rockchip,rk3328-spdif",
+	  .data = (void *)RK_SPDIF_RK3366 },
+	{ .compatible = "rockchip,rk3366-spdif",
+	  .data = (void *)RK_SPDIF_RK3366 },
+	{ .compatible = "rockchip,rk3368-spdif",
+	  .data = (void *)RK_SPDIF_RK3366 },
+	{ .compatible = "rockchip,rk3399-spdif",
+	  .data = (void *)RK_SPDIF_RK3366 },
+	{ .compatible = "rockchip,rk3568-spdif",
+	  .data = (void *)RK_SPDIF_RK3366 },
+	{},
+};
+MODULE_DEVICE_TABLE(of, rk_spdif_match);
+
 static struct platform_driver rk_spdif_driver = {
 	.probe = rk_spdif_probe,
 	.remove = rk_spdif_remove,
 	.driver = {
 		.name = "rockchip-spdif",
-		.of_match_table = of_match_ptr(rk_spdif_match),
+		.of_match_table = rk_spdif_match,
 		.pm = pm_ptr(&rk_spdif_pm_ops),
 	},
 };

-- 
2.51.0


