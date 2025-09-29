Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48CB3CAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 03:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zCjAA38WHCg+MXqF3kGXwWOXS+/+KMwtcI5UNPsSod0=; b=IZ/6M2Jx86YgtAx9kMLzfvTYvF
	tI1+v7jJKUz5nAfp2Koi1PsnTfVqSQ1O9n6cPvGrAn2b7iqt+XN2JHy/u2cTEatgWPFZ/x3Ngd009
	uLoxbEEMSlqpd/O+tCLFz9oRB2//0PEKbO3z4WYG9Xv8dAPBadbAMJmBEq6nC6WQ8o6NF3rRODQrb
	12DxSVdjtvJNZL97i9Ol4tsRSw0dB3ctq55LzdjN28cghClWpOjGuljLldWonJMW0dV7+nrv/AOgp
	bE/y0BiiOnY6zLngH7FJgboltpFJug9XL3L14fWFaG8mX0lCu26sL1Ldjwwj3QADO+n8V0lFaenEg
	wAf8ZXHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v34Pz-00000001Dix-1767;
	Mon, 29 Sep 2025 03:19:15 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v34Pw-00000001Dhy-3DfQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 03:19:14 +0000
Received: from DESKTOP-L0HPE2S (unknown [124.16.141.245])
	by APP-05 (Coremail) with SMTP id zQCowAB3GROt+tloGaKNCA--.46972S2;
	Mon, 29 Sep 2025 11:19:10 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-arm-kernel@lists.infradead.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH] pwm: atmel-hlcdc: fix missing clk_disable_unprepare on error paths
Date: Mon, 29 Sep 2025 11:19:08 +0800
Message-ID: <20250929031908.2320-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAB3GROt+tloGaKNCA--.46972S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJr47WF48CF1rWFW3uw4rZrb_yoW8uryxpF
	47GayjvrWIvws8Wasaqr97JF1Ska18AFW3urW0ka40vrs0yr1IvFyrGF92qFn8CFs7A3W7
	A3yUtFyruF4jkaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvG14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
	4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AK
	xVWUAVWUtwCY02Avz4vE14v_Gr4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
	0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
	17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcV
	C0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY
	6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa
	73UjIFyTuYvjfUUksqDUUUU
X-Originating-IP: [124.16.141.245]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgsAA2jZ399mzQAAsU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_201913_175888_AC6D7C80 
X-CRM114-Status: GOOD (  10.33  )
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

atmel_hlcdc_pwm_apply() enables a new clock before updating register
settings. If any of the subsequent regmap operations fail, the clock
was left prepared and enabled.

Add a common error path to disable the newly enabled clock.

Fixes: a56960e8b406 ("[media] cec: add HDMI CEC framework (core)")
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/pwm/pwm-atmel-hlcdc.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/pwm/pwm-atmel-hlcdc.c b/drivers/pwm/pwm-atmel-hlcdc.c
index 387a0d1fa4f2..0791a97c2fb4 100644
--- a/drivers/pwm/pwm-atmel-hlcdc.c
+++ b/drivers/pwm/pwm-atmel-hlcdc.c
@@ -98,9 +98,6 @@ static int atmel_hlcdc_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 			if (ret)
 				return ret;
 
-			clk_disable_unprepare(atmel->cur_clk);
-			atmel->cur_clk = new_clk;
-
 			if (new_clk == hlcdc->sys_clk)
 				gencfg = ATMEL_HLCDC_CLKPWMSEL;
 
@@ -109,7 +106,9 @@ static int atmel_hlcdc_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 						 ATMEL_HLCDC_CLKPWMSEL,
 						 gencfg);
 			if (ret)
-				return ret;
+				goto err_disable_clk;
+			clk_disable_unprepare(atmel->cur_clk);
+			atmel->cur_clk = new_clk;
 		}
 
 		do_div(pwmcval, state->period);
@@ -134,19 +133,19 @@ static int atmel_hlcdc_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 					 ATMEL_HLCDC_PWMPOL,
 					 pwmcfg);
 		if (ret)
-			return ret;
+			goto err_disable_clk;
 
 		ret = regmap_write(hlcdc->regmap, ATMEL_HLCDC_EN,
 				   ATMEL_HLCDC_PWM);
 		if (ret)
-			return ret;
+			goto err_disable_clk;
 
 		ret = regmap_read_poll_timeout(hlcdc->regmap, ATMEL_HLCDC_SR,
 					       status,
 					       status & ATMEL_HLCDC_PWM,
 					       10, 0);
 		if (ret)
-			return ret;
+			goto err_disable_clk;
 	} else {
 		ret = regmap_write(hlcdc->regmap, ATMEL_HLCDC_DIS,
 				   ATMEL_HLCDC_PWM);
@@ -165,6 +164,10 @@ static int atmel_hlcdc_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	}
 
 	return 0;
+
+err_disable_clk:
+	clk_disable_unprepare(new_clk);
+	return ret;
 }
 
 static const struct pwm_ops atmel_hlcdc_pwm_ops = {
-- 
2.50.1.windows.1


