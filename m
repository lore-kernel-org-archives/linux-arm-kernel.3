Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D9F7C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 16:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JOIOq894v+zaK4XV37kMzgRxg3LpyHPgMP/RL2Mj3a4=; b=HaB6Z3vcoivl6TWfDv+CiA5c0g
	YixlGfo6q2sx/bXzD9JgEeVIRspaQ8nZuNpv4M1Pw97ZMfTnezOOjT5Cpwavy6Mbu+lwj6hx+TY0C
	yiMPUjzi9yYkylD+PJgna4nfo9zAKDBqYCYxvGj0wAoNefR5s9YhCoVjfUJcErZ/tiO4JUG2FdGoq
	ZUMBzqms+R9b9RcWCNokRgKuyHfWZo/e1bYgf0MCVUrVkFT+f62wxB73h7URTTlu+flmGHSU0JmCK
	2S9kEamaUep8siMCgEXax2CoDwfEbsSWH6yG3FffOSEKw4q+GKQE9Kc1WyMhxCCRD2IPBpmlJOZPw
	TOexYkBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umEjL-0000000ETi5-0t4g;
	Wed, 13 Aug 2025 16:53:39 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umE9N-0000000ELhM-1w9M
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 16:16:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=JOIOq894v+zaK4XV37kMzgRxg3LpyHPgMP/RL2Mj3a4=; b=gQgD4H
	D9eZ10uOMPdefygxiftpeI0O9E4P2jdt5Ft+P6+nRtsbPFJo/Rx7oP5R4qfkLOlk
	K8yTgsKitD2MGbLSdu7nsxjvMIzS4QRN6PDl/lbizFjApUYmaqz0FU1/+UYXoJHr
	kfREh1l1caSGge8T+0wGQD9Q8LrToK/Mt10h7u14NxdhGIQr9CG+MqtDfcTBCIOh
	scvODsgiNRQbNO/DX8xchORmLrWw13AXbSHx1ceMwnmtnr5AQ4Yqi8fbgjgH+cEz
	W+QTokqZBfvPTn0uK0cUMiu6aKSevxnWHJuTMBTDNSQ5F8jlJEmKsQnaf8WCp+Y6
	M9lCqwuXQ+wny+cw==
Received: (qmail 695008 invoked from network); 13 Aug 2025 18:16:13 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Aug 2025 18:16:13 +0200
X-UD-Smtp-Session: l3s3148p1@Tie5eUE8HNttKLKq
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 09/21] mfd: remove unneeded 'fast_io' parameter in regmap_config
Date: Wed, 13 Aug 2025 18:14:55 +0200
Message-ID: <20250813161517.4746-10-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
References: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_091629_773776_0EA97CD6 
X-CRM114-Status: GOOD (  11.25  )
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

 drivers/mfd/exynos-lpass.c    | 1 -
 drivers/mfd/fsl-imx25-tsadc.c | 1 -
 drivers/mfd/stm32-lptimer.c   | 1 -
 drivers/mfd/sun4i-gpadc.c     | 1 -
 4 files changed, 4 deletions(-)

diff --git a/drivers/mfd/exynos-lpass.c b/drivers/mfd/exynos-lpass.c
index 44797001a432..9bb2687c2835 100644
--- a/drivers/mfd/exynos-lpass.c
+++ b/drivers/mfd/exynos-lpass.c
@@ -101,7 +101,6 @@ static const struct regmap_config exynos_lpass_reg_conf = {
 	.reg_stride	= 4,
 	.val_bits	= 32,
 	.max_register	= 0xfc,
-	.fast_io	= true,
 };
 
 static void exynos_lpass_disable_lpass(void *data)
diff --git a/drivers/mfd/fsl-imx25-tsadc.c b/drivers/mfd/fsl-imx25-tsadc.c
index 0aab6428e042..467b1a23faeb 100644
--- a/drivers/mfd/fsl-imx25-tsadc.c
+++ b/drivers/mfd/fsl-imx25-tsadc.c
@@ -17,7 +17,6 @@
 #include <linux/regmap.h>
 
 static const struct regmap_config mx25_tsadc_regmap_config = {
-	.fast_io = true,
 	.max_register = 8,
 	.reg_bits = 32,
 	.val_bits = 32,
diff --git a/drivers/mfd/stm32-lptimer.c b/drivers/mfd/stm32-lptimer.c
index 09073dbc9c80..123659178cc2 100644
--- a/drivers/mfd/stm32-lptimer.c
+++ b/drivers/mfd/stm32-lptimer.c
@@ -19,7 +19,6 @@ static const struct regmap_config stm32_lptimer_regmap_cfg = {
 	.val_bits = 32,
 	.reg_stride = sizeof(u32),
 	.max_register = STM32_LPTIM_MAX_REGISTER,
-	.fast_io = true,
 };
 
 static int stm32_lptimer_detect_encoder(struct stm32_lptimer *ddata)
diff --git a/drivers/mfd/sun4i-gpadc.c b/drivers/mfd/sun4i-gpadc.c
index 3029d48e982c..bf2f6fdaf8bf 100644
--- a/drivers/mfd/sun4i-gpadc.c
+++ b/drivers/mfd/sun4i-gpadc.c
@@ -72,7 +72,6 @@ static const struct regmap_config sun4i_gpadc_regmap_config = {
 	.reg_bits = 32,
 	.val_bits = 32,
 	.reg_stride = 4,
-	.fast_io = true,
 };
 
 static const struct of_device_id sun4i_gpadc_of_match[] = {
-- 
2.47.2


