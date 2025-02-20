Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6095C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 08:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wBxQSOlMPrjUiA/42Bk4q/ePX+2wf9/S6TU2JH/AwxQ=; b=p2XzANxLeXtJszft+DK6pwZ0lL
	XJUIZzL0UfAmXcRXOdt+0Qz5wEr/RKXLnovY82wd15dlupBgdRSFRjQaI+QSVrccLvjtpo86NV1Co
	1drBiMJo8MepRnsgYfrEDrT17H6lOOpQ3DPd3JxPSnAvNzAvPlXTZFCrqXE82oK9cxHl1Ala3CMnE
	el/qfHK0xZFkEaBRTf2685+I+xI6IgVNSFXgIgiG8EZBWDz3NLR1MwPxzkMTipyQGBxoVdpVFH07Z
	xfflkRrxAWVO8WJgvD4zrosy267fuDTDvX6G4PyjIXja7w8yv250J/MyYfWvcuOC2z07phjFmyEGT
	t4eXWZUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl2Ir-0000000HTLC-4A2x;
	Thu, 20 Feb 2025 08:53:06 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl2HM-0000000HSo3-36GB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 08:51:35 +0000
Received: from localhost.localdomain (unknown [124.16.141.245])
	by APP-05 (Coremail) with SMTP id zQCowABnbaEK7bZndtGXDg--.55533S2;
	Thu, 20 Feb 2025 16:51:24 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: linus.walleij@linaro.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] pinctrl: nomadik: Add error handling for find_nmk_gpio_from_pin
Date: Thu, 20 Feb 2025 16:50:01 +0800
Message-ID: <20250220085001.860-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.42.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowABnbaEK7bZndtGXDg--.55533S2
X-Coremail-Antispam: 1UD129KBjvJXoW7AryrZryfWF47XF1rCryxGrg_yoW8AryDpF
	43Wrn0vry3JFW8t3WDJayjvFyfKan7Jr17Wa9Fk3srW3WYyFykKa15KFW7Zr4qkrWrGw43
	Ar4rJFy7uwn5AFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvm14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1lc2xSY4AK67AK6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
	UI43ZEXa7VUUKhF3UUUUU==
X-Originating-IP: [124.16.141.245]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgoTA2e2onjwjgAAsp
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_005133_154749_DCF805CC 
X-CRM114-Status: GOOD (  12.08  )
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

When find_nmk_gpio_from_pin fails to find a valid GPIO chip
for the given pin, the bit variable remains uninitialized. This
uninitialized value is then passed to __nmk_gpio_set_mode,
leading to undefined behavior and undesired address access.

To fix this, add error handling to check the return value of
find_nmk_gpio_from_pin. Log an error message indicating an
invalid pin offset and return -EINVAL immediately  If the function
fails.

Fixes: 75d270fda64d ("gpio: nomadik: request dynamic ID allocation")
Cc: stable@vger.kernel.org # 6.9+
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/pinctrl/nomadik/pinctrl-nomadik.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik.c b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
index f4f10c60c1d2..4155137b0674 100644
--- a/drivers/pinctrl/nomadik/pinctrl-nomadik.c
+++ b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
@@ -985,7 +985,7 @@ static int nmk_gpio_request_enable(struct pinctrl_dev *pctldev,
 				   unsigned int pin)
 {
 	struct nmk_pinctrl *npct = pinctrl_dev_get_drvdata(pctldev);
-	struct nmk_gpio_chip *nmk_chip;
+	struct nmk_gpio_chip *nmk_chip, *r;
 	struct gpio_chip *chip;
 	unsigned int bit;
 
@@ -1002,7 +1002,12 @@ static int nmk_gpio_request_enable(struct pinctrl_dev *pctldev,
 
 	dev_dbg(npct->dev, "enable pin %u as GPIO\n", pin);
 
-	find_nmk_gpio_from_pin(pin, &bit);
+	r = find_nmk_gpio_from_pin(pin, &bit);
+	if (!r) {
+		dev_err(npct->dev,
+			"invalid pin offset %d\n", pin);
+		return -EINVAL;
+	}
 
 	clk_enable(nmk_chip->clk);
 	/* There is no glitch when converting any pin to GPIO */
-- 
2.42.0.windows.2


