Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D20C6D41C2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 09:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KWcYE08QmOt/2PXkvFAPHcchNfXBF8BJT23rJcCAv50=; b=r5ts9WosQjtAFv9MggjVzC+/g8
	lhDnBS96CRxh/k1mitmWo7U1eWT+MQfjgT18gDNBu+oitycfTFzUfhdqk/50GuP/zZcYcJ706OS7m
	YXby7xn9xOYqcAIXBPPw/2F8Ljj+lHiYBNbjhF9U0GrvsN03uIv7jHjDmz8CI6lYaLXBRrXTnwXFO
	7zgSCtUGapz2mYUPVQTFGPfyCafTBQm5UirTSHg1oR14MNGR/WAa/SQOpiUmtWgmGcQabebsUKSPq
	jJGG+pt1qggH5zUVH5fS5jf+yT8/HSDWKE4IDUBohRmEsJdOmdrNmJ2Fmt+RFmcopSmeeAQetvzpT
	xp9BaMdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB9yr-00000006Htf-00Mj;
	Wed, 13 Nov 2024 09:48:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB9oo-00000006G9Q-3E41;
	Wed, 13 Nov 2024 09:37:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=KWcYE08QmOt/2PXkvFAPHcchNfXBF8BJT23rJcCAv50=; b=DvoJ2jFKVW8so0in35Ggn72uNA
	RhhaRRrvMTOo7110paphkD2F9m+agSuskFKtcBHUkRfzJJnN5BC+64Tr4BrOAJMX0s4vHFLWVGV2V
	6XFh7X32ptuGZpl6SMJUecTpa3+sKsrVP5ujhNOt24lXyrdj0sXALrBOuGKD+t+mA8W3S14IkJhQs
	kMSF39TYIkJF9DjiIC1WJsMP6JCjG0seXOlqLPYHBtxLdvmArHboZ2JXDVstsDJ4/y/hq+UEILbjN
	qv1CFx5B+ExJesB3x0lG9svAtLb/Lwb4qgbKWgHdtGugAchyec1Oq6kuibGSvBm+xhrWw2ZyNTnRm
	HyuIuymA==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB9oj-0000000DDvH-0W5h;
	Wed, 13 Nov 2024 09:37:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 62F80A405B8;
	Wed, 13 Nov 2024 09:35:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D81B5C4CED8;
	Wed, 13 Nov 2024 09:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731490655;
	bh=8TOv1Z5OyPH3FzN2qQ0QJp6OTICIwjthX/si2CeYrbw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gEY6ye42h+QP1DKU3EHWQ4r29J9fqJ5z3ykGlFr83XMAlUCbTF1GylEGA0sAotw3t
	 xVKHWuY/5+aM8Lcj/Pnsp6F5uGThnI4LNb0JxqNSfs9JZKWRMQK7eMjEAggYwBhv5Y
	 JOYx4cZhgEGMUQuuvv9lJeAGnQoME+fDsOp7Hka4zWpig2BW2NvglUT4ewiXIP3pwi
	 iTd/zl85gMtZ/rkAoYwnPjlZyRxI0i5lN9FYEH+58Rr3MpDxEyKZN1YT55bT/vYNAj
	 aC69fjhCfE3uNTQ/TQV52m9Gtrt1te4Luo5yTZM6RN8mR2+iptPs2RypaTqg93p1HT
	 8AFnIF/oTEh2Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCBBDD41C2A;
	Wed, 13 Nov 2024 09:37:35 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 13 Nov 2024 17:37:30 +0800
Subject: [PATCH v7 3/5] pinctrl: meson: add interface of of_xlate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241113-a4_pinctrl-v7-3-0546a20c1c22@amlogic.com>
References: <20241113-a4_pinctrl-v7-0-0546a20c1c22@amlogic.com>
In-Reply-To: <20241113-a4_pinctrl-v7-0-0546a20c1c22@amlogic.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731490653; l=1754;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=kZkfTxXyUa/bUEnikqRrRpqnocDlXw3ORsFp/T0SNwU=;
 b=oyTkOMvKCa2cVjlY8hKd3hAxrbJwp8YiBEVVLREl9rTCfaX7670T1XHpd6Gn8jhqZlrNnw3Dp
 jY4hQwnxHW+BvZuHsgwrLIpDMHI23qxbIJ3iyyIWmdK/oZYc50MpOYG
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_093742_085440_271E5648 
X-CRM114-Status: UNSURE (   9.98  )
X-CRM114-Notice: Please train this message.
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Amlogic pinctrl software framework use system API of_gpio_simple_xlate
which only support linear one-to-one correspondence to translate gpiospec
to the GPIO number and flags before. It can not meet the non-linear needs.
Add the interface satisfies the underlying driver to implement the
transformation to meet the needs of various scenarios.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 drivers/pinctrl/meson/pinctrl-meson.c | 4 ++++
 drivers/pinctrl/meson/pinctrl-meson.h | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index 253a0cc57e39..fc0c0bef38c0 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -620,6 +620,10 @@ static int meson_gpiolib_register(struct meson_pinctrl *pc)
 	pc->chip.base = -1;
 	pc->chip.ngpio = pc->data->num_pins;
 	pc->chip.can_sleep = false;
+	if (pc->data->of_xlate) {
+		pc->chip.of_gpio_n_cells = pc->data->of_gpio_n_cells;
+		pc->chip.of_xlate = pc->data->of_xlate;
+	}
 
 	ret = gpiochip_add_data(&pc->chip, pc);
 	if (ret) {
diff --git a/drivers/pinctrl/meson/pinctrl-meson.h b/drivers/pinctrl/meson/pinctrl-meson.h
index 7883ea31a001..cbb3f22552b9 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.h
+++ b/drivers/pinctrl/meson/pinctrl-meson.h
@@ -120,6 +120,10 @@ struct meson_pinctrl_data {
 	const struct pinmux_ops *pmx_ops;
 	const void *pmx_data;
 	int (*parse_dt)(struct meson_pinctrl *pc);
+	int (*of_xlate)(struct gpio_chip *gc,
+			const struct of_phandle_args *gpiospec,
+			u32 *flags);
+	int of_gpio_n_cells;
 };
 
 struct meson_pinctrl {

-- 
2.37.1



