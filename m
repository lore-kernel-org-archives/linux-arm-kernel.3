Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C743AFF8860
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 14:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GHNi4JMMHvnl7sIIBtNGP8COHgIN/9r6JJwlZhmdEnU=; b=Qvxa8k5eekmjqKwspVq3rbpGh4
	QX7HbmvBeN5gyyXgY4HPNQ/w68/YEcnLDDvGyKRN1r5cIayqTOuRfO9dls2AAgbFlwWqs3hw0p8Hc
	e966y/gn7v1W6eYkn2VetpxF/oV1L0i7obkrk88uNToYy/xXBBpSKS4zz1QfD8ll1MGdWxVD4Wm2i
	REVZQcPUZm8iy2EEyr0REBAen5Tn8NBtukFSj4TE+U0sroBHhobG6JkS8nyQN0xR60mKv4KvmKfag
	szR39f8+5fFtfxMWZ0TwSbaD5Xp9QlJh/qxC59KLafaT9ZlAZT1Xc68RZzXWXiup+GQfDFbhaWoyQ
	A8wV7EHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHN46-0000000H73H-0W8q;
	Mon, 27 Apr 2026 14:36:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHN3z-0000000H711-3Bkv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 14:35:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C9D1260139;
	Mon, 27 Apr 2026 14:35:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 656BDC19425;
	Mon, 27 Apr 2026 14:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777300554;
	bh=SiWkbnIH8UOAciAE8X5BeZ7KOGlhjwpjAZNRV7KHgWA=;
	h=From:To:Cc:Subject:Date:From;
	b=LQRGkxOMUS0qZpvN59yIIWKUCjorLizUI+LomxDIWqm9JrYi4NelOOwOVw6zB1d4B
	 iAY++yUa34htxh4vcPIaWctFA4HzR9fK5L5JdC2yshYLddYoIsK3wSWmna4SHf9bXu
	 d/tuKNDGN5AMQy7/tK6hcVQvLrq3wWgexHNJiOmrKnc8R//HHGX13aYfRFVXFnOaj6
	 oEJ5WBSiSanifLQeEWdNrSdyTf+hCtVutLc1XbwonnqpwaFxiDCdhWZEmAMr6iTCM8
	 acuzT4MpEbpubEyAzv9F+mFS5ICyS1R2nEA29RsdcOU/TjdL+31EiYXrydhrP97d7a
	 RRDWsauvhaW+A==
From: Arnd Bergmann <arnd@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linusw@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	patches@opensource.cirrus.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: s3c: use gpio lookup table for LEDs
Date: Mon, 27 Apr 2026 16:35:27 +0200
Message-Id: <20260427143546.3098519-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Arnd Bergmann <arnd@arndb.de>

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-s3c/mach-crag6410.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mach-s3c/mach-crag6410.c b/arch/arm/mach-s3c/mach-crag6410.c
index 7def8824bbc5..57176719d8a6 100644
--- a/arch/arm/mach-s3c/mach-crag6410.c
+++ b/arch/arm/mach-s3c/mach-crag6410.c
@@ -779,46 +779,53 @@ static struct s3c_sdhci_platdata crag6410_hsmmc0_pdata = {
 static const struct gpio_led gpio_leds[] = {
 	{
 		.name = "d13:green:",
-		.gpio = MMGPIO_GPIO_BASE + 0,
 		.default_state = LEDS_GPIO_DEFSTATE_ON,
 	},
 	{
 		.name = "d14:green:",
-		.gpio = MMGPIO_GPIO_BASE + 1,
 		.default_state = LEDS_GPIO_DEFSTATE_ON,
 	},
 	{
 		.name = "d15:green:",
-		.gpio = MMGPIO_GPIO_BASE + 2,
 		.default_state = LEDS_GPIO_DEFSTATE_ON,
 	},
 	{
 		.name = "d16:green:",
-		.gpio = MMGPIO_GPIO_BASE + 3,
 		.default_state = LEDS_GPIO_DEFSTATE_ON,
 	},
 	{
 		.name = "d17:green:",
-		.gpio = MMGPIO_GPIO_BASE + 4,
 		.default_state = LEDS_GPIO_DEFSTATE_ON,
 	},
 	{
 		.name = "d18:green:",
-		.gpio = MMGPIO_GPIO_BASE + 5,
 		.default_state = LEDS_GPIO_DEFSTATE_ON,
 	},
 	{
 		.name = "d19:green:",
-		.gpio = MMGPIO_GPIO_BASE + 6,
 		.default_state = LEDS_GPIO_DEFSTATE_ON,
 	},
 	{
 		.name = "d20:green:",
-		.gpio = MMGPIO_GPIO_BASE + 7,
 		.default_state = LEDS_GPIO_DEFSTATE_ON,
 	},
 };
 
+static struct gpiod_lookup_table crag_leds_table = {
+	.dev_id = "leds-gpio",
+	.table = {
+		GPIO_LOOKUP_IDX("basic-mmio-gpio", 0, "cs", 0, GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP_IDX("basic-mmio-gpio", 1, "cs", 1, GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP_IDX("basic-mmio-gpio", 2, "cs", 2, GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP_IDX("basic-mmio-gpio", 3, "cs", 3, GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP_IDX("basic-mmio-gpio", 4, "cs", 4, GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP_IDX("basic-mmio-gpio", 5, "cs", 5, GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP_IDX("basic-mmio-gpio", 6, "cs", 6, GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP_IDX("basic-mmio-gpio", 7, "cs", 7, GPIO_ACTIVE_LOW),
+		{ },
+	},
+};
+
 static const struct gpio_led_platform_data gpio_leds_pdata = {
 	.leds = gpio_leds,
 	.num_leds = ARRAY_SIZE(gpio_leds),
@@ -875,6 +882,7 @@ static void __init crag6410_machine_init(void)
 	platform_add_devices(crag6410_devices, ARRAY_SIZE(crag6410_devices));
 	platform_device_register_full(&crag6410_mmgpio_devinfo);
 
+	gpiod_add_lookup_table(&crag_leds_table);
 	gpio_led_register_device(-1, &gpio_leds_pdata);
 
 	regulator_has_full_constraints();
-- 
2.39.5


