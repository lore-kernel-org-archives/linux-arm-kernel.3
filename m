Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 785B9C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 16:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lKwqJsBpJtiLoQ0zbkH5Yo2FxcXE4tE/k0bw9vuSqOA=; b=sDijNAd76/YOfhlr0RSTtlkq+0
	AhR/xKXz9HXvh5vTIWd2/ceB+CRtfrXDm4WbnqCQ4azUh3ar8WbNyY/zGFRImQC1e2lxH7GCaVBgN
	xMTKa0zLq865Shub85VRefnj6z0FD/jtKiprZkPL8poJzhsweS7C5Ah//5K/oVYB/7s7zNz1eySec
	KmB2FxWSWVOAZxjKuIxfzRdMLVGu29uxIoXQ3cmA08NR3XDi44wq67kCW8EBytcRYlJR/unhWTdy1
	7ZuHpzZzdmJHy2Od6+GEpFVi1csiVIVRGOD6v9rpGK5l5McGYdjad8IMeYAgfm6+5YLyY/rMxCDzD
	jTnHdDZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umEWY-0000000ERpd-0Vrw;
	Wed, 13 Aug 2025 16:40:26 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umE9B-0000000ELcJ-2WZv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 16:16:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=lKwqJsBpJtiLoQ0zbkH5Yo2FxcXE4tE/k0bw9vuSqOA=; b=e3W5lu
	wEeATWkuqFnhlaNI5TPJ9vWzSMDUH3XjFzY0JzIKnQDExc59WA0iRJnIE/kd/jk5
	v/iZZZC8DhKWFn0Bd14amGpQ0MglBVhzoRq2g+JYpBSKkwRjNcd4L3rQsp3sMpDt
	wILYwwr4PJ/TAdGr+fOoRaxhGOTyiDjIKiMQ/ehNI9USc4L930iJZqnUWTe1b18u
	BNkncyo8udnS3l19qCF8NFfk+0cNOb5106PMAIY+sVwuFRU7yVyTrLQwypZPHvEN
	NXpIJVJVdyHz10+q/VoWCdjyjrR1lsHrNRE0GZJmeGlhGk34CyLgK9I9C6KyjzF0
	NgGmoZiIH+OSBJXA==
Received: (qmail 694614 invoked from network); 13 Aug 2025 18:15:59 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Aug 2025 18:15:59 +0200
X-UD-Smtp-Session: l3s3148p1@Xe7eeEE8EpVtKLKq
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-actions@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 02/21] clk: remove unneeded 'fast_io' parameter in regmap_config
Date: Wed, 13 Aug 2025 18:14:48 +0200
Message-ID: <20250813161517.4746-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
References: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_091617_913523_78F3C2A9 
X-CRM114-Status: GOOD (  11.08  )
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

When using MMIO with regmap, fast_io is implied. No need to set it
again.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
No dependencies, can be applied directly to the subsystem tree. Buildbot is
happy, too.

 drivers/clk/actions/owl-common.c  | 1 -
 drivers/clk/clk-axm5516.c         | 1 -
 drivers/clk/nxp/clk-lpc32xx.c     | 1 -
 drivers/clk/qcom/a53-pll.c        | 1 -
 drivers/clk/qcom/a7-pll.c         | 1 -
 drivers/clk/qcom/apss-ipq-pll.c   | 1 -
 drivers/clk/qcom/clk-cbf-8996.c   | 1 -
 drivers/clk/qcom/clk-cpu-8996.c   | 1 -
 drivers/clk/qcom/hfpll.c          | 1 -
 drivers/clk/qcom/ipq-cmn-pll.c    | 1 -
 drivers/clk/thead/clk-th1520-ap.c | 1 -
 11 files changed, 11 deletions(-)

diff --git a/drivers/clk/actions/owl-common.c b/drivers/clk/actions/owl-common.c
index c62024b7c737..b3dded204dc5 100644
--- a/drivers/clk/actions/owl-common.c
+++ b/drivers/clk/actions/owl-common.c
@@ -18,7 +18,6 @@ static const struct regmap_config owl_regmap_config = {
 	.reg_stride	= 4,
 	.val_bits	= 32,
 	.max_register	= 0x00cc,
-	.fast_io	= true,
 };
 
 static void owl_clk_set_regmap(const struct owl_clk_desc *desc,
diff --git a/drivers/clk/clk-axm5516.c b/drivers/clk/clk-axm5516.c
index 4a3462ee8f3e..3823383f3fa6 100644
--- a/drivers/clk/clk-axm5516.c
+++ b/drivers/clk/clk-axm5516.c
@@ -529,7 +529,6 @@ static const struct regmap_config axmclk_regmap_config = {
 	.reg_stride	= 4,
 	.val_bits	= 32,
 	.max_register	= 0x1fffc,
-	.fast_io	= true,
 };
 
 static const struct of_device_id axmclk_match_table[] = {
diff --git a/drivers/clk/nxp/clk-lpc32xx.c b/drivers/clk/nxp/clk-lpc32xx.c
index e00f270bc6aa..96a1a527b380 100644
--- a/drivers/clk/nxp/clk-lpc32xx.c
+++ b/drivers/clk/nxp/clk-lpc32xx.c
@@ -68,7 +68,6 @@ static const struct regmap_config lpc32xx_scb_regmap_config = {
 	.reg_stride = 4,
 	.val_format_endian = REGMAP_ENDIAN_LITTLE,
 	.max_register = 0x114,
-	.fast_io = true,
 };
 
 static struct regmap *clk_regmap;
diff --git a/drivers/clk/qcom/a53-pll.c b/drivers/clk/qcom/a53-pll.c
index f43d455ab4b8..724a642311e5 100644
--- a/drivers/clk/qcom/a53-pll.c
+++ b/drivers/clk/qcom/a53-pll.c
@@ -33,7 +33,6 @@ static const struct regmap_config a53pll_regmap_config = {
 	.reg_stride		= 4,
 	.val_bits		= 32,
 	.max_register		= 0x40,
-	.fast_io		= true,
 };
 
 static struct pll_freq_tbl *qcom_a53pll_get_freq_tbl(struct device *dev)
diff --git a/drivers/clk/qcom/a7-pll.c b/drivers/clk/qcom/a7-pll.c
index c4a53e5db229..f95aefc43119 100644
--- a/drivers/clk/qcom/a7-pll.c
+++ b/drivers/clk/qcom/a7-pll.c
@@ -50,7 +50,6 @@ static const struct regmap_config a7pll_regmap_config = {
 	.reg_stride		= 4,
 	.val_bits		= 32,
 	.max_register		= 0x1000,
-	.fast_io		= true,
 };
 
 static int qcom_a7pll_probe(struct platform_device *pdev)
diff --git a/drivers/clk/qcom/apss-ipq-pll.c b/drivers/clk/qcom/apss-ipq-pll.c
index d6c1aea7e9e1..3a8987fe7008 100644
--- a/drivers/clk/qcom/apss-ipq-pll.c
+++ b/drivers/clk/qcom/apss-ipq-pll.c
@@ -169,7 +169,6 @@ static const struct regmap_config ipq_pll_regmap_config = {
 	.reg_stride		= 4,
 	.val_bits		= 32,
 	.max_register		= 0x40,
-	.fast_io		= true,
 };
 
 static int apss_ipq_pll_probe(struct platform_device *pdev)
diff --git a/drivers/clk/qcom/clk-cbf-8996.c b/drivers/clk/qcom/clk-cbf-8996.c
index ce4efcd995ea..0b40ed601f9a 100644
--- a/drivers/clk/qcom/clk-cbf-8996.c
+++ b/drivers/clk/qcom/clk-cbf-8996.c
@@ -212,7 +212,6 @@ static const struct regmap_config cbf_msm8996_regmap_config = {
 	.reg_stride		= 4,
 	.val_bits		= 32,
 	.max_register		= 0x10000,
-	.fast_io		= true,
 	.val_format_endian	= REGMAP_ENDIAN_LITTLE,
 };
 
diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
index 72689448a653..21d13c0841ed 100644
--- a/drivers/clk/qcom/clk-cpu-8996.c
+++ b/drivers/clk/qcom/clk-cpu-8996.c
@@ -411,7 +411,6 @@ static const struct regmap_config cpu_msm8996_regmap_config = {
 	.reg_stride		= 4,
 	.val_bits		= 32,
 	.max_register		= 0x80210,
-	.fast_io		= true,
 	.val_format_endian	= REGMAP_ENDIAN_LITTLE,
 };
 
diff --git a/drivers/clk/qcom/hfpll.c b/drivers/clk/qcom/hfpll.c
index b0b0cb074b4a..385964196185 100644
--- a/drivers/clk/qcom/hfpll.c
+++ b/drivers/clk/qcom/hfpll.c
@@ -99,7 +99,6 @@ static const struct regmap_config hfpll_regmap_config = {
 	.reg_stride	= 4,
 	.val_bits	= 32,
 	.max_register	= 0x30,
-	.fast_io	= true,
 };
 
 static int qcom_hfpll_probe(struct platform_device *pdev)
diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
index b3d7169c63e5..dafbf5732048 100644
--- a/drivers/clk/qcom/ipq-cmn-pll.c
+++ b/drivers/clk/qcom/ipq-cmn-pll.c
@@ -108,7 +108,6 @@ static const struct regmap_config ipq_cmn_pll_regmap_config = {
 	.reg_stride = 4,
 	.val_bits = 32,
 	.max_register = 0x7fc,
-	.fast_io = true,
 };
 
 static const struct cmn_pll_fixed_output_clk ipq5018_output_clks[] = {
diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
index cf1bba58f641..cff4f014bddb 100644
--- a/drivers/clk/thead/clk-th1520-ap.c
+++ b/drivers/clk/thead/clk-th1520-ap.c
@@ -1056,7 +1056,6 @@ static const struct regmap_config th1520_clk_regmap_config = {
 	.reg_bits = 32,
 	.val_bits = 32,
 	.reg_stride = 4,
-	.fast_io = true,
 };
 
 struct th1520_plat_data {
-- 
2.47.2


