Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 553DDE6B278
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 14:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=16+22Ye9VLGg6SaDg7irfKMxZTPXIedl4yFHXsNedBU=; b=bIGTTeyIX9hOq+juAHsiC1bNWp
	IRlMNXpLfcQbACjuwV3f96DKJQxGCAIE7fDk9ov5OOi2b7yIeygwPGXOArQ4T5ItwYGVgXlvjSa9Z
	2tDEZbHVniQCHql5n9KzBjMn11HMV+vqZ/0mkac7lhATAeO4Jc6T8Rv9xLiwAa4oxlA4IjURYsLPl
	sV4TWeI+0xfmI3Rxlld0JwzU8Szrvp8AU6xZT0dSc5wcNCTkPMypVCvv1ZeALRr52AsDZq0TMLP3d
	KKK/stbHzoy0tBAJSCOQuRoHZ06Vb2E7qgVhj9hNBEGXhKR9kIoGXbaJTG8D3cmb3QbT6uUfycyPW
	g1c8EjAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6sES-00000007GMX-0Gnj;
	Fri, 01 Nov 2024 14:02:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6s4m-00000007EqZ-2pMB;
	Fri, 01 Nov 2024 13:52:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=16+22Ye9VLGg6SaDg7irfKMxZTPXIedl4yFHXsNedBU=; b=VRbf6yiZQ+iQLdyAmzGCY2HvQI
	xRqWEvBgfLkJ9/nMzsmgHN0alXnbkjogGhLhdIGQUQoDC2vRKUaKeUuHBEVf9nLaiZziQyuM/Re9M
	4oVz7iemRWLWcO+aS/Kxeq+o3mVxRVq5qhM7C4tNHRBoU/JFuKDHgD35orblFd7S2G4MqrZjCnLBk
	HQVNkoyVZL6SzgDNyy3l39qzWxEki40qq46ZDA9AwCjVRLOQKkH7oOOCLdQ94CG9jQJBObxGU19Gm
	9wAlii+tEQ7nGqyI8wZ2tDrzX+Y2JP10MeVWWS+tQTrgPxLLcUPwo3odQeYtZkn06YvA0ERctwG7E
	dU5t+mlg==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6s4i-0000000AhIQ-0wLt;
	Fri, 01 Nov 2024 13:52:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2EABD5C3A67;
	Fri,  1 Nov 2024 08:26:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C09F8C4CED2;
	Fri,  1 Nov 2024 08:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730449640;
	bh=u/qw2hKCT9cFOoXZwF+MDoMtpUmJbTAMh7xRFAFXzgM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dADt3Ewzi+v+7BOLMRY/nL9peULtYo1hrrdsEYcYUWYXDWOtvHfSwuFrroU/QLyfN
	 +vXsKQayCiR4WR5aWBnveTlwo9mnGipsgrjZL0CHiA3+hKY1cn/xvHvVEXt5WgbrKg
	 eqRc4ONQX6s0UVVhlupgAqA+YZqa3FLnqUxO/tPfegfKvJ9BS9pQ1sj5i3/ci+3SVU
	 JzePKKwPse4snaswDUIBFEJnK5s0mQaqfv3IfZJSFuGxAWpxriwhRG2gtwPo6rZUKK
	 BG2TVoqmkfq+r/G/Nw8+XgTKnaSYi+A+m6qDcmFIVGijf/Qyods9etXohQ5mXe7cWt
	 CaA+UoRjBYrig==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A91C4E674B9;
	Fri,  1 Nov 2024 08:27:20 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 01 Nov 2024 16:27:18 +0800
Subject: [PATCH RFC v4 2/4] pinctrl: meson: add interface of of_xlate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241101-a4_pinctrl-v4-2-efd98edc3ad4@amlogic.com>
References: <20241101-a4_pinctrl-v4-0-efd98edc3ad4@amlogic.com>
In-Reply-To: <20241101-a4_pinctrl-v4-0-efd98edc3ad4@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730449638; l=1697;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=knLIUCSGih56JEya5+7FKqp5xI+HFVaycdj15fbWv+g=;
 b=QM1zSNe+4Fb8fwciG4BdSgMCDW+B64PF10XSfq5BS4qnHgRf/iIEaq+FaP/S6LiR/h8wqDPjc
 KBviRMisYn4CC8xJYgYk1KmfCA9Iczlea98u8TknDZIcXaNtKHZiSGP
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_135228_840573_5CC43ADB 
X-CRM114-Status: GOOD (  10.20  )
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



