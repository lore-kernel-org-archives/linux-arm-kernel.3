Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB12CD5BC9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 16:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BFUISAt7vXlOWvF+abglvlceVssJoppIr/ZIY+Rfi/0=; b=IjxAo0Xqe5obL3EG11WQGr50BJ
	TRRowddE0FpDoXPpvkAj168RFW6f5peMt5XXWFbqy0ZkyMqtm0EPvAY/RklKMxA4cgh8L940vJo5u
	jTEHSIUdc8P32H4hSJSQ1p7ZcYV7/1WjhuG2jhIgNpVuKGd1M2OEGPps4Wb9NiMjEN5qsKKzuXrJW
	wTzJ12U/mtrrHcR8S29E7U2NbqLNNPF4Hw834mkrFQWH4SoJzh4zVTdQi6JTYUX711ebAgley37ON
	PjIZmV0Plv8yEwe2jLW1I8uSzN8ithmtZYzqtPaZaSf/a5uJ0rSQfktR+KY+XJC0xaewVbjAD7Sfl
	vVwyjgjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRYON-000000002UK-28x8;
	Mon, 25 May 2026 16:43:03 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRYOH-000000002R7-3QDC;
	Mon, 25 May 2026 16:42:58 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 56D8D271DC;
	Mon, 25 May 2026 18:42:46 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZOP0gYfiY2U5; Mon, 25 May 2026 18:42:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1779727365; bh=2OF8js3j011GkbvGK5yHUNv8z+itCdsM0bZhVVbT3Gs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jyx8dljb0o9X2Zu8q11qd/9fDwiFed/WZj5YPpRnlTa5LWwS92gCuM8dPAVnNa2qs
	 W2I/M6J7OoYAidzZAURRqswTyyYX9lHiyZdA9k7vQpZF4fd+HgOoIdDANwQwtV6aH5
	 AN3ZganVnzUAZl/EZ+zvlcrYqjSQTTKiRkpd4viPHE3ZQNw1Nj4CLeBJwcXyICboG5
	 QVVEyRi5cEg8EYV/F121Y2bahwrO9Glgyr9hJ+GWSLEdDbf3tzWbl+a2n9TvG4DBhG
	 vTDdjMI8UlDY6FuvpaqU0/zBxEJLYBa1SsLwd86C7FLKOPzIWu62QInGQd1pxpQBgT
	 rpNAZrzE/Nuxg==
From: "Marco Scardovi (scardracs)" <scardracs@disroot.org>
To: linusw@kernel.org,
	brgl@kernel.org,
	heiko@sntech.de
Cc: linux-gpio@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Marco Scardovi (scardracs)" <scardracs@disroot.org>
Subject: [PATCH 1/2] gpio: rockchip: convert bank->clk to devm_clk_get_enabled()
Date: Mon, 25 May 2026 18:39:38 +0200
Message-ID: <20260525164230.43307-2-scardracs@disroot.org>
In-Reply-To: <20260525164230.43307-1-scardracs@disroot.org>
References: <20260525164230.43307-1-scardracs@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_094257_989137_B8B6FC40 
X-CRM114-Status: GOOD (  11.40  )
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

The bank->clk was previously obtained via of_clk_get() and manually
prepared/enabled. However, it was missing a corresponding clk_put() in
both the error paths and the remove function, leading to a reference leak.

Convert the allocation to devm_clk_get_enabled(), which also properly
propagates failures from clk_prepare_enable() that were previously ignored.

The GPIO bank device uses the same OF node as the previous of_clk_get()
call, so devm_clk_get_enabled(dev, NULL) correctly resolves the same
clock provider entry.

This change fixes the reference leak and simplifies the code by removing
the manual clk_disable_unprepare() calls in the probe error paths and
in the remove function.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Marco Scardovi <scardracs@disroot.org>
---
 drivers/gpio/gpio-rockchip.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index 44d7ebd12724..33580093a4e7 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -656,11 +656,10 @@ static int rockchip_get_bank_data(struct rockchip_pin_bank *bank)
 	if (!bank->irq)
 		return -EINVAL;
 
-	bank->clk = of_clk_get(bank->of_node, 0);
+	bank->clk = devm_clk_get_enabled(bank->dev, NULL);
 	if (IS_ERR(bank->clk))
 		return PTR_ERR(bank->clk);
 
-	clk_prepare_enable(bank->clk);
 	id = readl(bank->reg_base + gpio_regs_v2.version_id);
 
 	switch (id) {
@@ -672,7 +671,6 @@ static int rockchip_get_bank_data(struct rockchip_pin_bank *bank)
 		bank->db_clk = of_clk_get(bank->of_node, 1);
 		if (IS_ERR(bank->db_clk)) {
 			dev_err(bank->dev, "cannot find debounce clk\n");
-			clk_disable_unprepare(bank->clk);
 			return -EINVAL;
 		}
 		break;
@@ -751,7 +749,6 @@ static int rockchip_gpio_probe(struct platform_device *pdev)
 
 	ret = rockchip_gpiolib_register(bank);
 	if (ret) {
-		clk_disable_unprepare(bank->clk);
 		mutex_unlock(&bank->deferred_lock);
 		return ret;
 	}
@@ -792,7 +789,6 @@ static void rockchip_gpio_remove(struct platform_device *pdev)
 {
 	struct rockchip_pin_bank *bank = platform_get_drvdata(pdev);
 
-	clk_disable_unprepare(bank->clk);
 	gpiochip_remove(&bank->gpio_chip);
 }
 
-- 
2.54.0


