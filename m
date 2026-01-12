Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D6CFD232D7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 10:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MNN1phBJjzRSvUd+GKHD6wI9Bs/+dpm9nGPr1H6olLM=; b=TedPv+pFSVMDGhUsYQqCEVivAc
	iyE31g0Zo2VJdeVJQEGXP+RsGxL6tQIpnNMyB52bpG9OYVBcZGNzYMUHV5YjSgJLGdsi0Rg18vG7d
	K360wKsBQWV4gjL4BuNGHr5Q8PFCXY1YgY2ZOnUAQUlVYBqe+65k5r9tgdE4RdG0PTusXxSEpoid2
	ni/5qbAfUl1c7GWDSPLoUh0HjJvjlMkNF6bf7lm2zeSIRVdedDejhV5PcLlozMqeVYm4E3P440L48
	6BA6y33nOyK2ImpQW28YyFG5lPHT/gdNIQ/qPGWYEDVXtX7VfbzvZtLYOv70PcoMGt8T+uKtt42dd
	nNWtMu4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfF2Q-00000005A0W-0nz7;
	Mon, 12 Jan 2026 10:20:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfF2O-000000059zR-2e2S
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 10:20:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0A2C8601B6;
	Mon, 12 Jan 2026 10:20:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E8DCC16AAE;
	Mon, 12 Jan 2026 10:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768213239;
	bh=xkYzUdmREYDJRqPUh32xP2grXpOE5bywwQkQJYrx8H4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=um/uMGqxFAjePXUG3INtpSZGK0VHNEtJtxSjOwSiYSOcm1O9u4JmDBbqDd+5cnYpr
	 bSaWgCO41jn7erVRqL6lHUi4szOxoGKlC2wI8iAcrUlqVqm/e/38zec9QoNEzgmv3t
	 Qj6lInGSWQvzMsyrIJiw039V7PfoXkg8kI8A3eyRE31OvFHzdm8cct9cKDW1EqL84W
	 Q1vODyJfQSo9RqvMZ9DJqLVOlePD6/VExceHHGkriQdy+y4cf/lPHmmJcj3988aPE5
	 myXvNy/Sht0w/j6hi+HZDjeUvyMEv4gCA4Cs3/vRtgMR3Xq7SN94GOpVXN9TQn/hkz
	 89jUTGwD3AIvw==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 12 Jan 2026 11:20:32 +0100
Subject: [PATCH v2 2/2] pinctrl: apple: Implement GPIO func check callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-apple-req-gpio-func-v2-2-fbb91114e630@kernel.org>
References: <20260112-apple-req-gpio-func-v2-0-fbb91114e630@kernel.org>
In-Reply-To: <20260112-apple-req-gpio-func-v2-0-fbb91114e630@kernel.org>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Bartosz Golaszewski <brgl@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
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

Reviewed-by: Sven Peter <sven@kernel.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/pinctrl/pinctrl-apple-gpio.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-apple-gpio.c b/drivers/pinctrl/pinctrl-apple-gpio.c
index a4161d59ab9f..2bd5013b19ac 100644
--- a/drivers/pinctrl/pinctrl-apple-gpio.c
+++ b/drivers/pinctrl/pinctrl-apple-gpio.c
@@ -170,6 +170,13 @@ static const struct pinctrl_ops apple_gpio_pinctrl_ops = {
 
 /* Pin multiplexer functions */
 
+static bool apple_gpio_pinmux_func_is_gpio(struct pinctrl_dev *pctldev,
+					   unsigned int selector)
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


