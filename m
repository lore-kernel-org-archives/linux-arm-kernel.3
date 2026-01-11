Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90049D2502D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Jan 2026 20:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mm3rzZ/W2xBZFv+Tsa9c0b2CXj+snhRDSnljMQSU3L0=; b=Zw2tyR3vJfeDKyrs+KdtzByEuV
	SQrO4k3ljY67IE4XI/KrW0UGAJlzIPjFII8Dcyi0D9Oq7wbzdJKA+YnvV/LJ6AhOK/8TczlJiGY9n
	8i6DNDFwy27JNmEN2HZJ3CrkZpWRkVFCquRdKHz8ZoHoAqDQ1D/5t6A98X7+viYRIpQsLTrWmem+f
	l5bsUaIEcJd2bPwCzDZdEbHbaUDnpfghebINdkG+wLSsJcq+fD8jvhzYQezmqHV2JmRSHhyodkUKG
	TNJF29ZwkGCcCpVcgS9kSrej8TkfKASkUZhqCw75/VKIf8zjTLkkBrrWg1nTtvwHfPDDcZiS26tHE
	PxC9pX6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vf242-00000004UHO-1su6;
	Sun, 11 Jan 2026 20:29:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vf241-00000004UGW-1Bkk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Jan 2026 20:29:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BA1A260165;
	Sun, 11 Jan 2026 20:29:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEE98C4CEF7;
	Sun, 11 Jan 2026 20:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768163368;
	bh=6oA/Zpv40boNXu9flhLjZnCSCituxNm3WBB02StEqlQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=uuncVLAcRpqSTlbr7qLJijd2DtnBPezA2c5VXmSGuhUKOOnFEjrjpodWKBTFfTxNX
	 E5hQxYVi0lU/1lhWe0ykFFKDnJkNOUEjjNRow0qNysaCd0p3wCwzonl62lVZnAMV8F
	 E+eCNya2VqXMvIHGUaBq6M103+5+Bq6NZFbSnBip/XpGdYk1rbsJUBTTNKa6RON8k3
	 nVZg52U+oygCCrUP84VHyUzLYgCewnCxtp4t/ctCXWIo2bySZCPTenJS8fdDVfXXYk
	 /nhPyisDVcRyXysv04ZGYssTDLMwMzmnKysn7+s4BGx7inmEbociQ46o7uDDVcJP9V
	 vVy0hD1KcjbxA==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 11 Jan 2026 21:29:22 +0100
Subject: [PATCH 2/2] RFC: pinctrl: apple: Implement GPIO func check
 callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260111-apple-req-gpio-func-v1-2-6deb1b695371@kernel.org>
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

This function will check if the indicated function enumerator
i.e. the value set into bits 5 and 6 of the pin configuration
register, is zero and thus corresponds to the GPIO mode of the
pin.

This may be necessary to know since the pin controller is
flagged as "strict": once you set a pin *explicitly* to GPIO
mode using function 0, the core is unaware that this is
actually the GPIO mode, and clients may be denied to
retrieve the pin as a GPIO.

Currently none of the in-kernel device trees sets any pin to
GPIO mode, but this may happen any day.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/pinctrl/pinctrl-apple-gpio.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-apple-gpio.c b/drivers/pinctrl/pinctrl-apple-gpio.c
index a4161d59ab9f..fd20d0e49f48 100644
--- a/drivers/pinctrl/pinctrl-apple-gpio.c
+++ b/drivers/pinctrl/pinctrl-apple-gpio.c
@@ -170,6 +170,13 @@ static const struct pinctrl_ops apple_gpio_pinctrl_ops = {
 
 /* Pin multiplexer functions */
 
+static int apple_gpio_pinmux_func_is_gpio(struct pinctrl_dev *pctldev,
+					  unsigned int selector)
+{
+	/* Function selector 0 is always the GPIO mode */
+	return (selector == 0);
+}
+
 static int apple_gpio_pinmux_set(struct pinctrl_dev *pctldev, unsigned int func,
 				 unsigned int group)
 {
@@ -186,6 +193,7 @@ static const struct pinmux_ops apple_gpio_pinmux_ops = {
 	.get_functions_count = pinmux_generic_get_function_count,
 	.get_function_name = pinmux_generic_get_function_name,
 	.get_function_groups = pinmux_generic_get_function_groups,
+	.function_is_gpio = apple_gpio_pinmux_func_is_gpio,
 	.set_mux = apple_gpio_pinmux_set,
 	.strict = true,
 };

-- 
2.52.0


