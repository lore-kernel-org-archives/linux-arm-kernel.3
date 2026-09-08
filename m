Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B88D2C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 15:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GD9uqjMFzVAwI3HFLeQg05MCFM41kAwYmShtqMqbL/g=; b=uKG/Hel0id9OD60RLo1pQgNzRm
	2pcPQCHjHMEVHLzxIFDDrVIdGSDvHC5LlT+ntN1TnrvdGAYabUCx+oyixjwz7AqjWF58XEPaIFlm1
	srJWeOxZbAgLLI2ubybIhQDuJNeCqBWGWsb9GHAiJ87Jt6SpTMK9Q2QdCgvcoioBP3+Pl4qUu+28f
	WmnjreIoKDmjjOUkm5aVmssxGCnvP5hgEnXnnWckbq/jZTQe8ZI0mPu1MfO+VJZ7r+jePTm3MYgEh
	KCvehM3b8HvMRXH/hK6jiLd7sKEMbc7k7UhfY/ykgPNY4hCzBuOMneJFQnad7XUZIt8g2FuJNa/bP
	dNrXVXqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3y9S-00000009YqZ-1RBf;
	Tue, 08 Sep 2026 15:54:26 +0000
Received: from extorris.mess.org ([92.243.27.206])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3y9Q-00000009YpD-04By;
	Tue, 08 Sep 2026 15:54:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1788882859; bh=544WQVZJeLYU7v3G3MGtP5wW/6wUd4jsHuoiTAyywkI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xg8CIWyRctIvMnvVyP9XewMQybVqg7b0YVC9pBXSJDIIXjbCJM57nZV6iaz+upguk
	 YNWyb1p62KeV1qLiCNAOaChsiNQs3xICig85+PgOlWRKuJfp5NN9EOqtV3pmHbt2Eq
	 S0ohvTyhnl9tftVoH/ksQ8FoYY5jp/dHHlHX5nKslIxjffz56vzT2KI4Juniw8UN6Q
	 JdA+183T5aKi/XOpf2SNaboyUIZYorzzfux1cwHpb3A8v6KMqHBpep2Ig1+4Hz7SDs
	 irF3+nAxs/ccSIYQ4TumXsjc/bkariwqAHjTBcTl7TxtrZrAfsi/EY/UTnf1LJ5PKe
	 Mw9rvycksrMgw==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id B8B1141473; Tue, 08 Sep 2026 16:54:19 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1788882859; bh=544WQVZJeLYU7v3G3MGtP5wW/6wUd4jsHuoiTAyywkI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xg8CIWyRctIvMnvVyP9XewMQybVqg7b0YVC9pBXSJDIIXjbCJM57nZV6iaz+upguk
	 YNWyb1p62KeV1qLiCNAOaChsiNQs3xICig85+PgOlWRKuJfp5NN9EOqtV3pmHbt2Eq
	 S0ohvTyhnl9tftVoH/ksQ8FoYY5jp/dHHlHX5nKslIxjffz56vzT2KI4Juniw8UN6Q
	 JdA+183T5aKi/XOpf2SNaboyUIZYorzzfux1cwHpb3A8v6KMqHBpep2Ig1+4Hz7SDs
	 irF3+nAxs/ccSIYQ4TumXsjc/bkariwqAHjTBcTl7TxtrZrAfsi/EY/UTnf1LJ5PKe
	 Mw9rvycksrMgw==
Received: from maru.home (host86-150-50-53.range86-150.btcentralplus.com [86.150.50.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id 0EAE141448;
	Tue, 08 Sep 2026 16:54:19 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Cc: Rik van Riel <riel@surriel.com>,
	stable@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 19/19] media: meson-ir-tx: Validate carrier and duty_cycle
Date: Tue,  8 Sep 2026 16:52:07 +0100
Message-ID: <528055c59611d6711e15b05c5ab150d4d3d338af.1788882189.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788882189.git.sean@mess.org>
References: <cover.1788882189.git.sean@mess.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_085424_205035_CB8307A2 
X-CRM114-Status: GOOD (  17.45  )
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

It is possible to set a combination of carrier and duty cycle that do
not produce a correct signal. In addition, setting a carrier larger
than USEC_PER_SEC will result in a divide by zero in
meson_irtx_prepare_pulse() during transmit.

Fixes: 49be1c78d575 ("media: rc: introduce Meson IR TX driver")
Signed-off-by: Sean Young <sean@mess.org>
Cc: stable@vger.kernel.org
---
 drivers/media/rc/meson-ir-tx.c | 54 +++++++++++++++++++++++++++-------
 1 file changed, 44 insertions(+), 10 deletions(-)

diff --git a/drivers/media/rc/meson-ir-tx.c b/drivers/media/rc/meson-ir-tx.c
index 1ab898069e67..a410464ede22 100644
--- a/drivers/media/rc/meson-ir-tx.c
+++ b/drivers/media/rc/meson-ir-tx.c
@@ -76,11 +76,24 @@ struct meson_irtx {
 	unsigned long clk_rate;
 };
 
-static void meson_irtx_set_mod(struct meson_irtx *ir)
+static bool meson_irtx_calc_mod(unsigned long clk_rate, u32 carrier,
+				u32 duty_cycle, unsigned int *pulse_cnt,
+				unsigned int *space_cnt)
 {
-	unsigned int cnt = DIV_ROUND_CLOSEST(ir->clk_rate, ir->carrier);
-	unsigned int pulse_cnt = DIV_ROUND_CLOSEST(cnt * ir->duty_cycle, 100);
-	unsigned int space_cnt = cnt - pulse_cnt;
+	unsigned int cnt;
+
+	cnt = DIV_ROUND_CLOSEST(clk_rate, carrier);
+	*pulse_cnt = DIV_ROUND_CLOSEST(cnt * duty_cycle, 100);
+	*space_cnt = cnt - *pulse_cnt;
+
+	return *pulse_cnt >= 1 && *pulse_cnt <= 65536 &&
+	       *space_cnt >= 1 && *space_cnt <= 65536;
+}
+
+static void meson_irtx_write_mod(struct meson_irtx *ir, unsigned int pulse_cnt,
+				 unsigned int space_cnt)
+{
+	unsigned int cnt = pulse_cnt + space_cnt;
 
 	dev_dbg(ir->dev, "F_mod = %uHz, T_mod = %luns, duty_cycle = %u%%\n",
 		ir->carrier, NSEC_PER_SEC / ir->clk_rate * cnt,
@@ -90,8 +103,10 @@ static void meson_irtx_set_mod(struct meson_irtx *ir)
 	       ir->reg_base + IRB_ADDR1);
 }
 
-static void meson_irtx_setup(struct meson_irtx *ir, unsigned int clk_nr)
+static int meson_irtx_setup(struct meson_irtx *ir, unsigned int clk_nr)
 {
+	unsigned int pulse_cnt, space_cnt;
+
 	/*
 	 * Disable the TX, set modulator clock tick and set initialize
 	 * output to be high. Set up carrier frequency and duty cycle. Then
@@ -100,13 +115,18 @@ static void meson_irtx_setup(struct meson_irtx *ir, unsigned int clk_nr)
 	 */
 	writel(~IRB_ENABLE & (IRB_MOD_CLK(clk_nr) | IRB_INIT_HIGH),
 	       ir->reg_base + IRB_ADDR0);
-	meson_irtx_set_mod(ir);
+	if (!meson_irtx_calc_mod(ir->clk_rate, ir->carrier, ir->duty_cycle,
+				 &pulse_cnt, &space_cnt))
+		return -EINVAL;
+	meson_irtx_write_mod(ir, pulse_cnt, space_cnt);
 	writel(readl(ir->reg_base + IRB_ADDR0) & ~IRB_INIT_HIGH,
 	       ir->reg_base + IRB_ADDR0);
 	writel(IRB_FIFO_IRQ_ENABLE | MIRTX_FIFO_THD,
 	       ir->reg_base + IRB_ADDR3);
 	writel(readl(ir->reg_base + IRB_ADDR0) | IRB_ENABLE,
 	       ir->reg_base + IRB_ADDR0);
+
+	return 0;
 }
 
 static u32 meson_irtx_prepare_pulse(struct meson_irtx *ir, unsigned int time)
@@ -215,12 +235,17 @@ static irqreturn_t meson_irtx_irqhandler(int irq, void *data)
 static int meson_irtx_set_carrier(struct rc_dev *rc, u32 carrier)
 {
 	struct meson_irtx *ir = rc->priv;
+	unsigned int pulse_cnt, space_cnt;
+
+	if (!carrier)
+		return -EINVAL;
 
-	if (carrier == 0)
+	if (!meson_irtx_calc_mod(ir->clk_rate, carrier, ir->duty_cycle,
+				 &pulse_cnt, &space_cnt))
 		return -EINVAL;
 
 	ir->carrier = carrier;
-	meson_irtx_set_mod(ir);
+	meson_irtx_write_mod(ir, pulse_cnt, space_cnt);
 
 	return 0;
 }
@@ -228,9 +253,14 @@ static int meson_irtx_set_carrier(struct rc_dev *rc, u32 carrier)
 static int meson_irtx_set_duty_cycle(struct rc_dev *rc, u32 duty_cycle)
 {
 	struct meson_irtx *ir = rc->priv;
+	unsigned int pulse_cnt, space_cnt;
+
+	if (!meson_irtx_calc_mod(ir->clk_rate, ir->carrier, duty_cycle,
+				 &pulse_cnt, &space_cnt))
+		return -EINVAL;
 
 	ir->duty_cycle = duty_cycle;
-	meson_irtx_set_mod(ir);
+	meson_irtx_write_mod(ir, pulse_cnt, space_cnt);
 
 	return 0;
 }
@@ -337,7 +367,11 @@ static int meson_irtx_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "modulator clock setup failed\n");
 
-	meson_irtx_setup(ir, clk_nr);
+	ret = meson_irtx_setup(ir, clk_nr);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "carrier %u, duty_cycle %u%% not supported at clk_rate %luHz\n",
+				     ir->carrier, ir->duty_cycle, ir->clk_rate);
 
 	ret = devm_request_irq(dev, irq,
 			       meson_irtx_irqhandler,
-- 
2.55.0


