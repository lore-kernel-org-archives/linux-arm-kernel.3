Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C4A6CA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 19:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NNFFfF25lXEY7p77+bLlpT+o/t57hb4SlnKLE4oaBVA=; b=axRyMYmqj8wWv/Yq65HWSRnR4o
	irHny0em+vsWbOXhvdJVEq5ZsPPFN89QQT8WuOKeZDaw+37EgKKHa5wJ7JsIxbrPpuBvI5ZL4nOht
	w9+q7bNFJhkj2/VxlzWp5NOAXN1W67ZiaL6AtFquOVf4y6GbfSPYUkIoEkH7cgzdzxzOxZ3B7hV21
	FlKsuhxQ2n4FkUpygXBmaa3rFeGsTj5Z9lTfDaBDC1vR2HBU8G0QDRzCnXUId4qcGcA1QuU5oDEAY
	IIDrLWNplknnmNm67H2UhBLfOt0jY2GxuPoMRHMtofor/gJDe7mQfKAdZNbE+OcpWkS9VdNqsQvEU
	YfY3TEGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxsZ6-000000024hC-2M3f;
	Sun, 14 Sep 2025 19:39:12 +0000
Received: from fhigh-b5-smtp.messagingengine.com ([202.12.124.156])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxsZ0-000000024cG-3HuV
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 19:39:08 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id BC0AE7A0129;
	Sun, 14 Sep 2025 15:39:05 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Sun, 14 Sep 2025 15:39:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1757878745;
	 x=1757965145; bh=NNFFfF25lXEY7p77+bLlpT+o/t57hb4SlnKLE4oaBVA=; b=
	hlF+P4hgJWKomKFdlxJ3/QGEkLspoNnGGoLXdhQ2MrYyZjINDzgHXlp+M7vnhmTH
	qCdv2gQ9IuitD/YZ8xQUSZMIcpe/WonyqkNzViUFtCNWhKEoZ4WnuWCvDkXyU6RL
	2lMfUW4XXO06OCSqcLLsGgsEihD/hb9lhx5Ts4O7YbfUMfesdF5RATvXBM/VlYNv
	QqFZgJThEURxCovei0+Qu9rkF90D8lruTTO3kIzZY8wWvnxJtESLyWNKnnvzctrm
	aszy1MatQKzeKpA1SFt6gsyhnJ7A41Qj4CcHlHgGmBsMdJJAGidM5Um7uod+yL3b
	cdKC47oItG/FZnTgMnsmvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1757878745; x=
	1757965145; bh=NNFFfF25lXEY7p77+bLlpT+o/t57hb4SlnKLE4oaBVA=; b=M
	u937apJ4SFW4Ucal+RAAosFsp1u2831wfYlfK9uImJg9w8vT5heb2ZXoByMwQiuO
	8+as0mKVHLZnkvFdXUTosHjUIyZTcgeoEjNgGLDQ+ZNWNaFYt7BbIYJqOn/B27rg
	UG2oO9LO4xE2j8i9XJSxrixF8tRrFs8OCH3guY5dZhR/9xOomwTonceWdBa24CUH
	ViSjoJKrLrS9biqno9N8n7Jk0S9rKh/3BJGtx44u+jjyOe8g55lZLJDXaWyD53zd
	y0/H12ngtBvWvy9hazpYy0d2l3IBqSrQOmmflfea7C6v2n8EHThJ/BoU6sdijBZK
	k/lEKpBuUuD1ZxAuzNAZQ==
X-ME-Sender: <xms:2RnHaKxroVjAx4-e2g9xWMsXaX8-nf1aWYcCbo4sDCMhuI6yOPv8LQ>
    <xme:2RnHaNitfvVtl55OD09AeG-FG92Di4djKsFsay-0t8jdfN-OrkKqJWeikEu_FY_WN
    NkB84fx8W3mChHlcLI>
X-ME-Received: <xmr:2RnHaHNcwBpYy7p4ujKru-6WDtFZJkBiVjzTtEu9ScHp5qx3rBdzJwciUtdmg4r_6jshQmvsFLhzbAcZPk7Njw8x1ycbbv29O7FD1A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdefheeijecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheplfgrnhhnvgcu
    ifhruhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtthgvrhhnpeefhe
    ehieeludffheetiefhvddtleffuddtleduudeiudetvdefffehkeehgfettdenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjsehjrghnnhgruh
    drnhgvthdpnhgspghrtghpthhtohepudefpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgvrghlsehgohhmph
    grrdguvghvpdhrtghpthhtohepjhesjhgrnhhnrghurdhnvghtpdhrtghpthhtoheprghs
    rghhiheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdgrrh
    hmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthho
    pehmrgiisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsvhgvnheskhgvrhhnvghlrd
    horhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdho
    rhhgpdhrtghpthhtoheprghlhihsshgrsehrohhsvghniiifvghighdrihho
X-ME-Proxy: <xmx:2RnHaAc3ZUrh4vpwSM98yipTkTWR0tGr2nal3fjzUms7KSuwzRzwxg>
    <xmx:2RnHaBz3GgfYW2UR-YMl54fe_8ZY6xuqVaumRvejUGS-Wuh_dHSGDg>
    <xmx:2RnHaF3yyTjvqm8cqtRdfSn51zcmDdmHIQMI22tJYRMmHjPaQQqRkg>
    <xmx:2RnHaIc_WPK-0pWIVbXSXxs7VVLcsVHtv_igdog0s-kC0GEHpypXeQ>
    <xmx:2RnHaFwBTmiMwRElvVKUQngMeVL1iKJrSM8J-B_tWOoXk3mAjx9poj9H>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 14 Sep 2025 15:39:04 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Sun, 14 Sep 2025 21:38:48 +0200
Subject: [PATCH v2 5/6] arm64: dts: apple: Add J474s, J475c and J475d
 device trees
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250914-dt-apple-t6020-v2-5-1a738a98bb43@jannau.net>
References: <20250914-dt-apple-t6020-v2-0-1a738a98bb43@jannau.net>
In-Reply-To: <20250914-dt-apple-t6020-v2-0-1a738a98bb43@jannau.net>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hector Martin <marcan@marcan.st>, 
 Marc Zyngier <maz@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7359; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=ulmJ9Q9E5wPu/53catabwVrJTmiDve5jseB6PwOjhFc=;
 b=kA0DAAoWoRs8240vZWYByyZiAGjHGcqgLIp38IO8CSIRV+2sw3PRIytJCg8rLZdRyv147Sacv
 oh1BAAWCgAdFiEEYivpiACrfCFcfeBWoRs8240vZWYFAmjHGcoACgkQoRs8240vZWahlAD+OdwY
 is1e4dkCtjwaZ3Shn9aeJLoCsFjvjDGyESB4bRQBANqtXkdaXw1biDHV7Gbqs773X9AajSklOya
 WSPMiAw4M
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_123906_899414_F402950E 
X-CRM114-Status: GOOD (  15.88  )
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

Add device trees for the M2 Pro Mac mini and the M2 Max and Ultra
Mac Studio. These devices are very similar to the M1 Max and Ultra
Mac Studio so reuse the device template, include the .dtsi for the new
SocS and correct for the minimal differences.

Co-developed-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Hector Martin <marcan@marcan.st>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/boot/dts/apple/Makefile             |  3 ++
 arch/arm64/boot/dts/apple/t6020-j474s.dts      | 47 ++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t6021-j475c.dts      | 37 ++++++++++++++++++++
 arch/arm64/boot/dts/apple/t6022-j475d.dts      | 42 +++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t6022-jxxxd.dtsi     | 38 +++++++++++++++++++++
 arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi | 38 +++++++++++++++++++++
 6 files changed, 205 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/Makefile b/arch/arm64/boot/dts/apple/Makefile
index e97a6676387c6e4cbaf3b0834c4e59338d08d1b8..21c4e02a4429fa1db506dd85637a44000073590e 100644
--- a/arch/arm64/boot/dts/apple/Makefile
+++ b/arch/arm64/boot/dts/apple/Makefile
@@ -83,6 +83,9 @@ dtb-$(CONFIG_ARCH_APPLE) += t6020-j414s.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t6021-j414c.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t6020-j416s.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t6021-j416c.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t6020-j474s.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t6021-j475c.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t6022-j475d.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8112-j413.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8112-j415.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8112-j473.dtb
diff --git a/arch/arm64/boot/dts/apple/t6020-j474s.dts b/arch/arm64/boot/dts/apple/t6020-j474s.dts
new file mode 100644
index 0000000000000000000000000000000000000000..7c7ad5b8ad189e5d04d03189a07c82426185dd7d
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t6020-j474s.dts
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Mac mini (M2 Pro, 2023)
+ *
+ * target-type: J474s
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+/dts-v1/;
+
+#include "t6020.dtsi"
+
+/*
+ * This model is very similar to M1 and M2 Mac Studio models so base it on those
+ * and remove the missing SDHCI controller.
+ */
+
+#include "t602x-j474-j475.dtsi"
+
+/ {
+	compatible = "apple,j474s", "apple,t6020", "apple,arm-platform";
+	model = "Apple Mac mini (M2 Pro, 2023)";
+};
+
+/* PCIe devices */
+&wifi0 {
+	compatible = "pci14e4,4434";
+	brcm,board-type = "apple,tasmania";
+};
+
+&bluetooth0 {
+	compatible = "pci14e4,5f72";
+	brcm,board-type = "apple,tasmania";
+};
+
+/*
+ * port01 is unused, remove the PCIe sdhci0 node from t600x-j375.dtsi and adjust
+ * the iommu-map.
+ */
+/delete-node/ &sdhci0;
+
+&pcie0 {
+	iommu-map = <0x100 &pcie0_dart_0 1 1>,
+			<0x200 &pcie0_dart_2 1 1>,
+			<0x300 &pcie0_dart_3 1 1>;
+};
diff --git a/arch/arm64/boot/dts/apple/t6021-j475c.dts b/arch/arm64/boot/dts/apple/t6021-j475c.dts
new file mode 100644
index 0000000000000000000000000000000000000000..533e3577487469e868c05976013f0d89ff3faea0
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t6021-j475c.dts
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Mac Studio (M2 Max, 2023)
+ *
+ * target-type: J475c
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+/dts-v1/;
+
+#include "t6021.dtsi"
+#include "t602x-j474-j475.dtsi"
+
+/ {
+	compatible = "apple,j475c", "apple,t6021", "apple,arm-platform";
+	model = "Apple Mac Studio (M2 Max, 2023)";
+};
+
+&wifi0 {
+	compatible = "pci14e4,4434";
+	brcm,board-type = "apple,canary";
+};
+
+&bluetooth0 {
+	compatible = "pci14e4,5f72";
+	brcm,board-type = "apple,canary";
+};
+
+/* enable PCIe port01 with SDHCI */
+&port01 {
+	status = "okay";
+};
+
+&pcie0_dart_1 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/apple/t6022-j475d.dts b/arch/arm64/boot/dts/apple/t6022-j475d.dts
new file mode 100644
index 0000000000000000000000000000000000000000..736594544f79b5e45f6ea0c98e6c71d948ef7a43
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t6022-j475d.dts
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Mac Studio (M2 Ultra, 2023)
+ *
+ * target-type: J475d
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+/dts-v1/;
+
+#include "t6022.dtsi"
+#include "t602x-j474-j475.dtsi"
+#include "t6022-jxxxd.dtsi"
+
+/ {
+	compatible = "apple,j475d", "apple,t6022", "apple,arm-platform";
+	model = "Apple Mac Studio (M2 Ultra, 2023)";
+};
+
+&framebuffer0 {
+	power-domains = <&ps_dispext0_cpu0_die1>, <&ps_dptx_phy_ps_die1>;
+};
+
+/* enable PCIe port01 with SDHCI */
+&port01 {
+	status = "okay";
+};
+
+&pcie0_dart_1 {
+	status = "okay";
+};
+
+&wifi0 {
+	compatible = "pci14e4,4434";
+	brcm,board-type = "apple,canary";
+};
+
+&bluetooth0 {
+	compatible = "pci14e4,5f72";
+	brcm,board-type = "apple,canary";
+};
diff --git a/arch/arm64/boot/dts/apple/t6022-jxxxd.dtsi b/arch/arm64/boot/dts/apple/t6022-jxxxd.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..4f7bf2ebfe397dbde6451672d74ef76fe782bcd0
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t6022-jxxxd.dtsi
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Mac Pro (M2 Ultra, 2023) and Mac Studio (M2 Ultra, 2023)
+ *
+ * This file contains the parts common to J180 and J475 devices with t6022.
+ *
+ * target-type: J180d / J475d
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+/* delete power-domains for missing disp0 / disp0_die1 */
+/delete-node/ &ps_disp0_cpu0;
+/delete-node/ &ps_disp0_fe;
+
+/delete-node/ &ps_disp0_cpu0_die1;
+/delete-node/ &ps_disp0_fe_die1;
+
+/* USB Type C */
+&i2c0 {
+	/* front-right */
+	hpm4: usb-pd@39 {
+		compatible = "apple,cd321x";
+		reg = <0x39>;
+		interrupt-parent = <&pinctrl_ap>;
+		interrupts = <44 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-names = "irq";
+	};
+
+	/* front-left */
+	hpm5: usb-pd@3a {
+		compatible = "apple,cd321x";
+		reg = <0x3a>;
+		interrupt-parent = <&pinctrl_ap>;
+		interrupts = <44 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-names = "irq";
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi b/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..ee12fea5b12cb37f95d9cb531c9065403665e8ca
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Mac mini (M2 Pro, 2023) and Mac Studio (2023)
+ *
+ * This file contains the parts common to J474 and J475 devices with t6020,
+ * t6021 and t6022.
+ *
+ * target-type: J474s / J475c / J475d
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+/*
+ * These models are very similar to the previous generation Mac Studio, other
+ * than GPIO indices.
+ */
+
+#include "t600x-j375.dtsi"
+
+&framebuffer0 {
+	power-domains = <&ps_dispext0_cpu0>, <&ps_dptx_phy_ps>;
+};
+
+&hpm0 {
+	interrupts = <44 IRQ_TYPE_LEVEL_LOW>;
+};
+
+&hpm1 {
+	interrupts = <44 IRQ_TYPE_LEVEL_LOW>;
+};
+
+&hpm2 {
+	interrupts = <44 IRQ_TYPE_LEVEL_LOW>;
+};
+
+&hpm3  {
+	interrupts = <44 IRQ_TYPE_LEVEL_LOW>;
+};

-- 
2.51.0


