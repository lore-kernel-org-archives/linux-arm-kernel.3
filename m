Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE41CD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 17:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rLTEyXP7DRPl8i7g7DG4YLwd/sdcsQbC3ghkKvp2cuI=; b=IPR2ZRG92qmeuGNu3/+qsr3hwu
	p+IzK3bHaI2/G1bAHbtl2coUP1fBefKQ5NMPIlTHT1lUvXFBDZIwh5U+mNR3Hv6wM6lzSHNR+owC8
	JRR+i7oMXBf4XaJGH9KMlgJ6oU2Dmwmr1sfIttT8giwPUlyeaxDtbbGzJ5WFRKB2jw6KSI08X2yMO
	ZmhifkPLpe1GH//xjUdmZts4RuDA+GFCoI8y/uchxkr9g3mamCLSbaBXZT15bfUhm2nzIPg3QO9nJ
	wrSdPR/tukSDdjBksXQsXuvyZRF9Y/k1VOQ5FLIJ4qtqcgBtL9l84+JMSXo0BF8xyy7iLiNQ49oPV
	13bd63Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRvJD-00000002fFV-1yr8;
	Tue, 26 May 2026 17:11:15 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRvJA-00000002fEX-36T0;
	Tue, 26 May 2026 17:11:14 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id C740A26FB1;
	Tue, 26 May 2026 19:11:07 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KdRAlyE6vvhA; Tue, 26 May 2026 19:11:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1779815467; bh=nG8T2sDyMTvq1VTUzB4uTiqI65Ywba/cU0io/fgNHAM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=brMpP/3uRaqBFyS/3FuWaqj1LkIPLM+tFUWQRmjORbIzViIkjkFoIPeTkRbUS8zKs
	 T1lRwi0t99btr6XxUHAVG4C867WQISraNMZIsSq24o+dcwB1tXcVQIAz46Yh2bvpCu
	 JgxJHhkG4XyFoYHChl+8F6RP/G28Wj3wGQdNDiVyYd1q2i5OeRYb4N44AuWaxPU8wV
	 cDiG69QFl4XFcpm8RbK5qeD/h/21HpPgUfOryzfzHg3bFWUz6ZGXaYH3ODantIsYCH
	 jZeX0y86TV0PKcZeFCmMbsqNpvYcwszxdeD/c5Uy6Cgotvehm5IEut3i+vkoFwoctl
	 9CYvG703MaCow==
From: Marco Scardovi <scardracs@disroot.org>
To: brgl@kernel.org
Cc: heiko@sntech.de,
	linusw@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	scardracs@disroot.org
Subject: [PATCH v2 2/2] gpio: rockchip: teardown bugs and resource leaks
Date: Tue, 26 May 2026 19:02:46 +0200
Message-ID: <20260526171050.12785-3-scardracs@disroot.org>
In-Reply-To: <20260526171050.12785-1-scardracs@disroot.org>
References: <CAMRc=Mfk9tP091DN=5kjb8fvFhj1=MiBZSq4NJ7+k5LNCVy9bw@mail.gmail.com>
 <20260526171050.12785-1-scardracs@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_101113_186997_5DF76877 
X-CRM114-Status: GOOD (  14.09  )
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

Address several teardown issues and resource leaks in the driver's remove
path and error handling:

1. Debounce clock reference leak: The debounce clock (bank->db_clk) is
   obtained using of_clk_get() which increments the clock's reference
   count, but clk_put() is never called. Register a devm action to
   cleanly release it on unbind. Note that of_clk_get(..., 1) remains
   necessary over devm_clk_get() because the DT binding does not define
   clock-names, precluding name-based lookup.

2. Unregistered chained IRQ handler: The chained IRQ handler is not
   disconnected in remove(). If a stray interrupt fires after the driver
   is removed, the kernel attempts to execute a stale handler, leading
   to a panic. Fix this by clearing the handler in remove().

3. IRQ domain leak: The linear IRQ domain and its generic chips are
   allocated manually during probe but never removed. Remove the IRQ
   domain during driver teardown to free the associated generic chips
   and mappings.

Fixes: 936ee2675eee ("gpio/rockchip: add driver for rockchip gpio")
Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Marco Scardovi <scardracs@disroot.org>
---
 drivers/gpio/gpio-rockchip.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index 33580093a4e7..c804f970d823 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -638,10 +638,17 @@ static int rockchip_gpiolib_register(struct rockchip_pin_bank *bank)
 	return ret;
 }
 
+static void rockchip_clk_put(void *data)
+{
+	struct clk *clk = data;
+
+	clk_put(clk);
+}
+
 static int rockchip_get_bank_data(struct rockchip_pin_bank *bank)
 {
 	struct resource res;
-	int id = 0;
+	int id = 0, ret;
 
 	if (of_address_to_resource(bank->of_node, 0, &res)) {
 		dev_err(bank->dev, "cannot find IO resource for bank\n");
@@ -673,6 +680,13 @@ static int rockchip_get_bank_data(struct rockchip_pin_bank *bank)
 			dev_err(bank->dev, "cannot find debounce clk\n");
 			return -EINVAL;
 		}
+
+		ret = devm_add_action_or_reset(bank->dev, rockchip_clk_put,
+					       bank->db_clk);
+		if (ret) {
+			dev_err(bank->dev, "failed to register debounce clk action\n");
+			return ret;
+		}
 		break;
 	case GPIO_TYPE_V1:
 		bank->gpio_regs = &gpio_regs_v1;
@@ -789,6 +803,9 @@ static void rockchip_gpio_remove(struct platform_device *pdev)
 {
 	struct rockchip_pin_bank *bank = platform_get_drvdata(pdev);
 
+	irq_set_chained_handler_and_data(bank->irq, NULL, NULL);
+	if (bank->domain)
+		irq_domain_remove(bank->domain);
 	gpiochip_remove(&bank->gpio_chip);
 }
 
-- 
2.54.0


