Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E60AD32D8E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 10:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=16+22Ye9VLGg6SaDg7irfKMxZTPXIedl4yFHXsNedBU=; b=TYJTBq7ze0FUzQftq7oQ2MAilS
	C8tSYy2nuj8xWjCZWd4iFnk+dyFihSsoTnUVmztDXf0WZqJOymvFOHXOOIPXYJxNlP8g9bq2yIXXv
	CdjDjO63P2Hihd1f5KWJCEXimwif3A4BqWLw4FPQ5ZbEATwiYyMEgf100C+xoF8wcDzGvE4nPS7Ec
	hZudSGU7yRnNVdsbNzlktoMZ7FbpDyI81P0pHzTX2TjftCuk//58/31mp8GwJWUDpdrPf4gL3C/mz
	u7COywJRoPdQjWPAbLoiUvptPijAardyl39DdDDk9+IaQ9zoWHxgEqjJD6UgnTqh8Tj0Q1/6ubHnr
	hH3kuzSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAoPd-000000036Ph-2eAF;
	Tue, 12 Nov 2024 10:46:21 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAo6x-000000032f2-03mr;
	Tue, 12 Nov 2024 10:27:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0573AA4190D;
	Tue, 12 Nov 2024 10:25:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C1793C4CED9;
	Tue, 12 Nov 2024 10:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731407221;
	bh=u/qw2hKCT9cFOoXZwF+MDoMtpUmJbTAMh7xRFAFXzgM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cuQK3yyHEfjyRdxhpYVQ9ECWRsi3XAx3tFcYZZaW2U8ludaDJe2YhBrM49Gf79Fsy
	 VXFPXEffx0cKJcTyJ6v87CQYtAmRukv1XDpb/2G2fOkFP69sXgkBfsveOYvQ2r+VV2
	 svbFR/mETGARIz0/sNdtreSiCi/+VXvy78FU246v/5uQTi2qX4sKsgtKt2VlcQhVFy
	 ztuUCc24neu9CPltj5+QjrRcpDb1SsYeC8KOcKE/AhyruftVodvFa+HcfUyLE/cTh3
	 d8Uc+SVucmxWEiyDJk+kfYisLoVwNfDjvpduxPrRqAmFkPMBGX62DQjUCe7XlxRQSk
	 YbL+ukXweyv6w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B55DFD32D8F;
	Tue, 12 Nov 2024 10:27:01 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 12 Nov 2024 18:26:57 +0800
Subject: [PATCH v5 3/5] pinctrl: meson: add interface of of_xlate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241112-a4_pinctrl-v5-3-3460ce10c480@amlogic.com>
References: <20241112-a4_pinctrl-v5-0-3460ce10c480@amlogic.com>
In-Reply-To: <20241112-a4_pinctrl-v5-0-3460ce10c480@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731407219; l=1697;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=knLIUCSGih56JEya5+7FKqp5xI+HFVaycdj15fbWv+g=;
 b=kS5VjjbODTrXUOWox21tZe1qSyaH88DvfQphEHJ7JKf/QXzT+qT28LcFHG/LOyiRxyG8VfTHJ
 vTcykybrR0ECTs1gRJFwW9G/HERuMExt8Yd1HgJvNU3qujCRR9DYMFd
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_022703_342415_FC83EC13 
X-CRM114-Status: GOOD (  10.49  )
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



