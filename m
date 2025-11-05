Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89ABFCCFA1E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 09:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UvG2J4njgiLi463RSBjiHQbyGjKWZ2ISGcDjH01GbhE=; b=ZOT3w5HctrYIB/JuKy0+rQPTlT
	y42IB0iPSV1gGBthOiDUuYJC/p5IhbeweNdrmOlbIN6RacOt+lZAYTIrDtM4rUAVySAJDkp6MKwdJ
	jrS/CdDSY367jPsH8gRitrTjhE45W9a5XDlE2/TDnUm9/9LvdUUlVcFaMGavYWJChhHQ1VB1t2H0V
	P06YlfbMuvi0MNeZwBy6wCOF4XFqUhdD6rED76u5EYTHj1mq4g24rHCJm8kMJokh7mSbJoCcEd+Ng
	z5/RR+fmAVP+uraBh6LXLDobQGLNJ4q8NaUxGccsgPo2Q54pmmKnFp2LZ+cYKtgSNV30gE/yWmzwf
	9GUV56Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGa6K-0000000DPbC-2RKZ;
	Wed, 05 Nov 2025 09:46:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGa6I-0000000DPZV-2tid;
	Wed, 05 Nov 2025 09:46:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F357D6021E;
	Wed,  5 Nov 2025 09:46:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9C118C16AAE;
	Wed,  5 Nov 2025 09:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762336005;
	bh=D+g92RPPyToKxZV9E5r3aNx2xs44Ra8kbrfRIOZI8og=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Qn7Z0iyyau3yR17BhkZ8u2RDOPdxGweXPQXK8VGc0Zd+u5nfbza0EEYFQnHimc0vw
	 fI6bwEPk57nHwlBEYk77/39cQM8GFwbYmQxehWwiP6bFNiv5VvkbWCKCXKLRjDPs8l
	 mZcfTWtHOAKHL6MtzAL9MIwOZ/FPS2H4YbkhHBOQ87cl7u88Jh4jgyCOXxjGSvQi36
	 x5B/Ea2WDWRCRu1xKH+ggREzw4xoRhwfaEOcybqjFU26fdwzGy3rsbZKJD3uLQB+6O
	 ZltfUoMB8Y5ZbYy/V0UhkkiAMD3UvyUZtwxzBm9s2xp9y0a87GmBDIlC9XJOmS4grp
	 TW2sX7SoiyJ3Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93F46CCFA07;
	Wed,  5 Nov 2025 09:46:45 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 05 Nov 2025 17:45:33 +0800
Subject: [PATCH 2/5] irqchip: Add support for Amlogic S6 S7 and S7D SoCs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251105-irqchip-gpio-s6-s7-s7d-v1-2-b4d1fe4781c1@amlogic.com>
References: <20251105-irqchip-gpio-s6-s7-s7d-v1-0-b4d1fe4781c1@amlogic.com>
In-Reply-To: <20251105-irqchip-gpio-s6-s7-s7d-v1-0-b4d1fe4781c1@amlogic.com>
To: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762336003; l=2575;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=8Qj9MLaQxbWjp8ZestvxizI5mF05EIMU/HlW0eH6014=;
 b=4RZQDlQ+vZEZoK73tT8R8TxrKC/7YG83xJ+YyAtAFiEh5hkkvEU9clUHwiGPkK2/C66L38kaK
 xnfyJ0ve5FvDLpxf4C/YxVsQsmL16A3U86H5gjXNt2wy3J/9/IGtum/
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
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

The Amlogic S6/S7/S7D SoCs support 12 GPIO IRQ lines,
details are as below.

    S6 IRQ Number:
    - 99:98    2 pins on bank CC
    - 97       1 pin  on bank TESTN
    - 96:81   16 pins on bank A
    - 80:65   16 pins on bank Z
    - 64:45   20 pins on bank X
    - 44:37    8 pins on bank H offs H1
    - 36:32    5 pins on bank F
    - 31:25    7 pins on bank D
    - 24:22    3 pins on bank E
    - 21:14    8 pins on bank C
    - 13:0    14 pins on bank B

    S7 IRQ Number:
    - 83:82    2 pins on bank CC
    - 81       1 pin  on bank TESTN
    - 80:68   13 pins on bank Z
    - 67:48   20 pins on bank X
    - 47:36   12 pins on bank H
    - 35:24   12 pins on bank D
    - 23:22    2 pins on bank E
    - 21:14    8 pins on bank C
    - 13:0    14 pins on bank B

    S7D IRQ Number:
    - 83:82    2 pins on bank CC
    - 81:75    7 pins on bank DV
    - 74       1 pin  on bank TESTN
    - 73:61   13 pins on bank Z
    - 60:41   20 pins on bank X
    - 40:29   12 pins on bank H
    - 28:24    5 pins on bank D
    - 23:22    2 pins on bank E
    - 21:14    8 pins on bank C
    - 13:0    14 pins on bank B

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 drivers/irqchip/irq-meson-gpio.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/irqchip/irq-meson-gpio.c b/drivers/irqchip/irq-meson-gpio.c
index 7d177626d64b..7e718b07e960 100644
--- a/drivers/irqchip/irq-meson-gpio.c
+++ b/drivers/irqchip/irq-meson-gpio.c
@@ -174,6 +174,14 @@ static const struct meson_gpio_irq_params s4_params = {
 	INIT_MESON_S4_COMMON_DATA(82)
 };
 
+static const struct meson_gpio_irq_params s6_params = {
+	INIT_MESON_S4_COMMON_DATA(100)
+};
+
+static const struct meson_gpio_irq_params s7_params = {
+	INIT_MESON_S4_COMMON_DATA(84)
+};
+
 static const struct meson_gpio_irq_params c3_params = {
 	INIT_MESON_S4_COMMON_DATA(55)
 };
@@ -195,6 +203,9 @@ static const struct of_device_id meson_irq_gpio_matches[] __maybe_unused = {
 	{ .compatible = "amlogic,a4-gpio-ao-intc", .data = &a4_ao_params },
 	{ .compatible = "amlogic,a4-gpio-intc", .data = &a4_params },
 	{ .compatible = "amlogic,a5-gpio-intc", .data = &a5_params },
+	{ .compatible = "amlogic,s6-gpio-intc", .data = &s6_params },
+	{ .compatible = "amlogic,s7-gpio-intc", .data = &s7_params },
+	{ .compatible = "amlogic,s7d-gpio-intc", .data = &s7_params },
 	{ .compatible = "amlogic,c3-gpio-intc", .data = &c3_params },
 	{ .compatible = "amlogic,t7-gpio-intc", .data = &t7_params },
 	{ }

-- 
2.37.1



