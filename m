Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D69DC71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 16:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c3HhE13Fd1F6pIWlTQEESkHtV5ZAAVZOasp1FZX/nXI=; b=RIaXNbGEodTJYJfXSrBgIA7AFJ
	XHmgq4IsAbDeneF0AZY61Ov6mjfQxCQURD80OuAq/TpW0Aed0GQT94lCk9AXZ+0qK33H7Vs9w+VwO
	4Uc1P4zNUafMxljLrPCuuwgde3hxNvmP8LcauvQHjR+k0L+HWdsw0Sd9X37DFo6L5iLvzchFErjgO
	0IDFJ8MhWrwarmYCo5XIw2I31fTLKODxd4YIfVWT7/Zf5+JPd/Iy35p4FDj1jxAnDRzlwUT6xWd4Y
	JI3cpzVuv2Q0FcZVzoHsJH9BQTA2T5YAw9Xd6ywzlglW3reggYFNEeegwfbL/hdWVcZJdtF8PT1iS
	+L145QbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRvSy-0000000AhkJ-13qw;
	Wed, 18 Jun 2025 16:16:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRs8U-0000000AAr4-3hQI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 12:43:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 364FF5C4AE2;
	Wed, 18 Jun 2025 12:41:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C75A8C4CEF2;
	Wed, 18 Jun 2025 12:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750250605;
	bh=sEwTFjUCiBVe4R3iljd5w8GSzTd/qtNXrriFMn9qrO0=;
	h=From:To:Cc:Subject:Date:From;
	b=QgFQjueKKcZsRqeXF7t+tyGl+x6nLtDn14B49OhBEA55yl8XHJDZaL2HnyuxqQ+/X
	 VvW7RehI4AsLyDQ0HQV6ZaxSICG7HVCR5mSoXxY5p1vrcSzVcJd6CNNsWfOXJZVtlM
	 6kaviF1wY2vRe3kXwu3UjqXz4jFa/9+nZ2S+kZPpv+wxC2xwK42PvOm7oWpXXaXUtZ
	 s7HdFaEzhAmPuLWIZEwVbO1OnJme5EDlnRGY2+pO4pqcKIQcs2ISoMdKnnv2l/U1dI
	 5ISwor4hZfuWh+lotKpcPWwXbLXpejpdnFdPVE5Di9OZYOAeS0YpGgWD0HJkNgNqSi
	 RL2nwSFyXIehQ==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To: linux-gpio@vger.kernel.org
Cc: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Andy Shevchenko <andy@kernel.org>
Subject: [PATCH] platform: cznic: turris-omnia-mcu: Use new GPIO line value setter callbacks
Date: Wed, 18 Jun 2025 14:43:19 +0200
Message-ID: <20250618124319.19220-1-kabel@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_054326_998599_A4EC649D 
X-CRM114-Status: GOOD (  12.82  )
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

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 .../platform/cznic/turris-omnia-mcu-gpio.c    | 35 ++++++++++++-------
 1 file changed, 22 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/cznic/turris-omnia-mcu-gpio.c b/drivers/platform/cznic/turris-omnia-mcu-gpio.c
index c2df24ea8686..57c229d70ead 100644
--- a/drivers/platform/cznic/turris-omnia-mcu-gpio.c
+++ b/drivers/platform/cznic/turris-omnia-mcu-gpio.c
@@ -439,27 +439,28 @@ static int omnia_gpio_get_multiple(struct gpio_chip *gc, unsigned long *mask,
 	return 0;
 }
 
-static void omnia_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
+static int omnia_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	const struct omnia_gpio *gpio = &omnia_gpios[offset];
 	struct omnia_mcu *mcu = gpiochip_get_data(gc);
 	u16 val, mask;
 
 	if (!gpio->ctl_cmd)
-		return;
+		return -ENOTSUPP;
 
 	mask = BIT(gpio->ctl_bit);
 	val = value ? mask : 0;
 
-	omnia_ctl_cmd(mcu, gpio->ctl_cmd, val, mask);
+	return omnia_ctl_cmd(mcu, gpio->ctl_cmd, val, mask);
 }
 
-static void omnia_gpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
-				    unsigned long *bits)
+static int omnia_gpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
+				   unsigned long *bits)
 {
 	unsigned long ctl = 0, ctl_mask = 0, ext_ctl = 0, ext_ctl_mask = 0;
 	struct omnia_mcu *mcu = gpiochip_get_data(gc);
 	unsigned int i;
+	int err;
 
 	for_each_set_bit(i, mask, ARRAY_SIZE(omnia_gpios)) {
 		unsigned long *field, *field_mask;
@@ -488,13 +489,21 @@ static void omnia_gpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
 
 	guard(mutex)(&mcu->lock);
 
-	if (ctl_mask)
-		omnia_ctl_cmd_locked(mcu, OMNIA_CMD_GENERAL_CONTROL,
-				     ctl, ctl_mask);
+	if (ctl_mask) {
+		err = omnia_ctl_cmd_locked(mcu, OMNIA_CMD_GENERAL_CONTROL,
+					   ctl, ctl_mask);
+		if (err)
+			return err;
+	}
+
+	if (ext_ctl_mask) {
+		err = omnia_ctl_cmd_locked(mcu, OMNIA_CMD_EXT_CONTROL,
+					   ext_ctl, ext_ctl_mask);
+		if (err)
+			return err;
+	}
 
-	if (ext_ctl_mask)
-		omnia_ctl_cmd_locked(mcu, OMNIA_CMD_EXT_CONTROL,
-				     ext_ctl, ext_ctl_mask);
+	return 0;
 }
 
 static bool omnia_gpio_available(struct omnia_mcu *mcu,
@@ -1015,8 +1024,8 @@ int omnia_mcu_register_gpiochip(struct omnia_mcu *mcu)
 	mcu->gc.direction_output = omnia_gpio_direction_output;
 	mcu->gc.get = omnia_gpio_get;
 	mcu->gc.get_multiple = omnia_gpio_get_multiple;
-	mcu->gc.set = omnia_gpio_set;
-	mcu->gc.set_multiple = omnia_gpio_set_multiple;
+	mcu->gc.set_rv = omnia_gpio_set;
+	mcu->gc.set_multiple_rv = omnia_gpio_set_multiple;
 	mcu->gc.init_valid_mask = omnia_gpio_init_valid_mask;
 	mcu->gc.can_sleep = true;
 	mcu->gc.names = omnia_mcu_gpio_names;
-- 
2.49.0


