Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75AB5D2502E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Jan 2026 20:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YuRCNSLCN3TImNoB57Ste31jidUsJol6plo7SdKv3Ps=; b=nPEkw8+nwf6+YIh3nz3OO+vJk9
	NRk+zKQ7+ggSBDqv9xInBlxk/FEKsfafqmpDFBrhihvduog/zNIc9Jmbbyv50ywpQdsowS1I3UXCi
	wMNV3EfUapZpPYaoiKgMN0jp3pS7JYdzoKWi8ydgMAKFGbNhgOxTu6HqFFZ+ybK+OWWOq0gFQ/HQo
	AhNj5xPiBTo4pRllPwKjqm9ACYXZrc9B2xi5rzNFupHXURK3M/iKF99dq/ASWooGzyK1UJR8EWC46
	3dFxYi3FQG5qdiA5rdfWjRBHuv42+2ibGRHS9LOG7ma45foy8y4OaAx8n5cZKgC2fDtquirP1eQEz
	ARxh+RgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vf242-00000004UH5-0XAF;
	Sun, 11 Jan 2026 20:29:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vf240-00000004UGQ-1K1e
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Jan 2026 20:29:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D3A2460197;
	Sun, 11 Jan 2026 20:29:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13127C116C6;
	Sun, 11 Jan 2026 20:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768163366;
	bh=DyoRTFzN7q43JaCq11Qs8BMWjMCdgppXa/JN1s/8Jz8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Gq0uiQN1uJpebhWEflc7Jp8qiSVNiSxtyO48lVlRyRFj8hsV77Xr44gAmqpwFnRMK
	 Q6jbciUqtiTHUen9V34UHOFs4qf3c6ecLVgagnpkfNJ4YX/yu6b6KnzPqb5Gceai34
	 zooyi0NO4JSr3P99sqdUkaW9KpD20sr865qkJE4S/se2JZOV9iaXtK89zvkGT9fWas
	 /FXid2DyckmWmIAFtC5s2clyBVxBZn+5s36vsG4JLL97QJnAlqL8JD3gTD/UprLnfR
	 m7fmRAhRZ5+0ipU6FSt0cxKqcRJ9AYtdxl/5Ml5XcM7iBLBKIP2b1Yq3eSCp9cPGwL
	 GkOBkK4SvMYew==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 11 Jan 2026 21:29:21 +0100
Subject: [PATCH 1/2] pinctrl: apple: Use unsigned int instead of unsigned
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260111-apple-req-gpio-func-v1-1-6deb1b695371@kernel.org>
References: <20260111-apple-req-gpio-func-v1-0-6deb1b695371@kernel.org>
In-Reply-To: <20260111-apple-req-gpio-func-v1-0-6deb1b695371@kernel.org>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Bartosz Golaszewski <brgl@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
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

It is discouraged to use the ambiguous "unsigned" type, use
explicit unsigned int in the driver.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/pinctrl/pinctrl-apple-gpio.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-apple-gpio.c b/drivers/pinctrl/pinctrl-apple-gpio.c
index e1a7bc8cf765..a4161d59ab9f 100644
--- a/drivers/pinctrl/pinctrl-apple-gpio.c
+++ b/drivers/pinctrl/pinctrl-apple-gpio.c
@@ -102,9 +102,9 @@ static u32 apple_gpio_get_reg(struct apple_gpio_pinctrl *pctl,
 static int apple_gpio_dt_node_to_map(struct pinctrl_dev *pctldev,
 				     struct device_node *node,
 				     struct pinctrl_map **map,
-				     unsigned *num_maps)
+				     unsigned int *num_maps)
 {
-	unsigned reserved_maps;
+	unsigned int reserved_maps;
 	struct apple_gpio_pinctrl *pctl;
 	u32 pinfunc, pin, func;
 	int num_pins, i, ret;
@@ -170,8 +170,8 @@ static const struct pinctrl_ops apple_gpio_pinctrl_ops = {
 
 /* Pin multiplexer functions */
 
-static int apple_gpio_pinmux_set(struct pinctrl_dev *pctldev, unsigned func,
-				 unsigned group)
+static int apple_gpio_pinmux_set(struct pinctrl_dev *pctldev, unsigned int func,
+				 unsigned int group)
 {
 	struct apple_gpio_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
 
@@ -202,7 +202,7 @@ static int apple_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 	return GPIO_LINE_DIRECTION_IN;
 }
 
-static int apple_gpio_get(struct gpio_chip *chip, unsigned offset)
+static int apple_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct apple_gpio_pinctrl *pctl = gpiochip_get_data(chip);
 	unsigned int reg = apple_gpio_get_reg(pctl, offset);

-- 
2.52.0


