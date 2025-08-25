Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0E6FCA0FE7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 14:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OVf2kzdOSE35zubTYhy5p4HObUjPisVXLQwG/uTgz0Q=; b=WPf/4Fw10DJ5FevC15b+jgdYPW
	goheVP6ok03RpcqsqeCo4BSSe8E7M2sr5J7/DgjaC2EiQHg+WlOPfi1n9sEe55f3Uw1yv+8w60meW
	YEkvH6bwVkiBkYg1bg8Dg0frozq5qu0sregJcMYJn+WfTFJezMizbwPVD1nUbZR5gbbdFtRMPDmWW
	2sy6WLHdGeX/CLwBODPpCkSnOp7eJmM/WbYO1w9deH7EeW71k23n9Ky22b4xeuoB0K1tXeRRCs0Hf
	vSWKgQWb8/0KKtvQWBqeJ6LNJ2eibpUSClbhbP2jJS4PG5ZQ0a2KvR33SFOGoeYLj2ywsjOBmU+Sx
	3lZhXVyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYem-00000008L0A-3ea9;
	Mon, 25 Aug 2025 14:58:49 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqVyu-00000007s8M-2g17
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 12:07:26 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250825120722epoutp04d63cdfeb30217aaae322bdaf5cf25f18~fASYd3egZ0983409834epoutp04w
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 12:07:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250825120722epoutp04d63cdfeb30217aaae322bdaf5cf25f18~fASYd3egZ0983409834epoutp04w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756123642;
	bh=OVf2kzdOSE35zubTYhy5p4HObUjPisVXLQwG/uTgz0Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i0faqWSNP74IrBiOCN/Dxc4zuPbZtxApXeWYctvTqALtr6j50fAratjAAiFHhgPU8
	 OUEKYX7lbF9r8YHvLN+zq0QRAEuqlie/JQASuDu+spuv9QjA8njLz0DmTTgcr37ScC
	 4aEnb7TmwYM04xdP2NIM36v4bHguqnL6cGEfVdDQ=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250825120721epcas5p46a1ee09c32bcc3ee067b1ce313d4af9e~fASXic9-S1293312933epcas5p4g;
	Mon, 25 Aug 2025 12:07:21 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.93]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4c9V0S6Vwtz6B9m8; Mon, 25 Aug
	2025 12:07:20 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250825120720epcas5p491e16bbfbdbcd751acbb0c0e55f9e2a2~fASWB8hUb3220132201epcas5p4d;
	Mon, 25 Aug 2025 12:07:20 +0000 (GMT)
Received: from Jaguar.samsungds.net (unknown [107.109.115.6]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250825120715epsmtip271ff86decb41b6d85cd503e1e3e7221d~fASRXLW0B0204202042epsmtip2B;
	Mon, 25 Aug 2025 12:07:15 +0000 (GMT)
From: Ravi Patel <ravi.patel@samsung.com>
To: jesper.nilsson@axis.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org,
	s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com,
	linus.walleij@linaro.org, tomasz.figa@gmail.com, catalin.marinas@arm.com,
	will@kernel.org, arnd@arndb.de
Cc: ksk4725@coasia.com, kenkim@coasia.com, pjsin865@coasia.com,
	gwk1013@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com,
	smn1196@coasia.com, pankaj.dubey@samsung.com, shradha.t@samsung.com,
	ravi.patel@samsung.com, inbaraj.e@samsung.com, swathi.ks@samsung.com,
	hrishikesh.d@samsung.com, dj76.yang@samsung.com, hypmean.kim@samsung.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@axis.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, soc@lists.linux.dev, Priyadarsini G
	<priya.ganesh@samsung.com>
Subject: [PATCH v3 05/10] pinctrl: samsung: Add ARTPEC-8 SoC specific
 configuration
Date: Mon, 25 Aug 2025 17:14:31 +0530
Message-Id: <20250825114436.46882-6-ravi.patel@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250825114436.46882-1-ravi.patel@samsung.com>
X-CMS-MailID: 20250825120720epcas5p491e16bbfbdbcd751acbb0c0e55f9e2a2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250825120720epcas5p491e16bbfbdbcd751acbb0c0e55f9e2a2
References: <20250825114436.46882-1-ravi.patel@samsung.com>
	<CGME20250825120720epcas5p491e16bbfbdbcd751acbb0c0e55f9e2a2@epcas5p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_050724_997848_439D6E85 
X-CRM114-Status: GOOD (  16.09  )
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

From: SeonGu Kang <ksk4725@coasia.com>

Add Axis ARTPEC-8 SoC specific configuration data to enable pinctrl.

Signed-off-by: SeonGu Kang <ksk4725@coasia.com>
Signed-off-by: Priyadarsini G <priya.ganesh@samsung.com>
Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
---
 .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 50 +++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-exynos.h      | 10 ++++
 drivers/pinctrl/samsung/pinctrl-samsung.c     |  2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h     |  1 +
 4 files changed, 63 insertions(+)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
index 5fe7c4b9f7bd..323487dfa8c2 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
@@ -76,6 +76,15 @@ static const struct samsung_pin_bank_type exynos8895_bank_type_off  = {
 	.reg_offset = { 0x00, 0x04, 0x08, 0x0c, 0x10, 0x14, },
 };
 
+/*
+ * Bank type for non-alive type. Bit fields:
+ * CON: 4, DAT: 1, PUD: 4, DRV: 4
+ */
+static const struct samsung_pin_bank_type artpec_bank_type_off = {
+	.fld_width = { 4, 1, 4, 4, },
+	.reg_offset = { 0x00, 0x04, 0x08, 0x0c, },
+};
+
 /* Pad retention control code for accessing PMU regmap */
 static atomic_t exynos_shared_retention_refcnt;
 
@@ -1816,3 +1825,44 @@ const struct samsung_pinctrl_of_match_data gs101_of_data __initconst = {
 	.ctrl		= gs101_pin_ctrl,
 	.num_ctrl	= ARRAY_SIZE(gs101_pin_ctrl),
 };
+
+/* pin banks of artpec8 pin-controller (FSYS0) */
+static const struct samsung_pin_bank_data artpec8_pin_banks0[] __initconst = {
+	ARTPEC_PIN_BANK_EINTG(5, 0x000, "gpf0", 0x00),
+	ARTPEC_PIN_BANK_EINTG(4, 0x020, "gpf1", 0x04),
+	ARTPEC_PIN_BANK_EINTG(8, 0x040, "gpf2", 0x08),
+	ARTPEC_PIN_BANK_EINTG(4, 0x060, "gpf3", 0x0c),
+	ARTPEC_PIN_BANK_EINTG(7, 0x080, "gpf4", 0x10),
+	ARTPEC_PIN_BANK_EINTG(8, 0x0a0, "gpe0", 0x14),
+	ARTPEC_PIN_BANK_EINTG(8, 0x0c0, "gpe1", 0x18),
+	ARTPEC_PIN_BANK_EINTG(6, 0x0e0, "gpe2", 0x1c),
+	ARTPEC_PIN_BANK_EINTG(8, 0x100, "gps0", 0x20),
+	ARTPEC_PIN_BANK_EINTG(8, 0x120, "gps1", 0x24),
+};
+
+/* pin banks of artpec8 pin-controller (PERIC) */
+static const struct samsung_pin_bank_data artpec8_pin_banks1[] __initconst = {
+	ARTPEC_PIN_BANK_EINTG(8, 0x000, "gpa0", 0x00),
+	ARTPEC_PIN_BANK_EINTG(8, 0x020, "gpa1", 0x04),
+	ARTPEC_PIN_BANK_EINTG(8, 0x040, "gpa2", 0x08),
+	ARTPEC_PIN_BANK_EINTG(2, 0x060, "gpk0", 0x0c),
+};
+
+static const struct samsung_pin_ctrl artpec8_pin_ctrl[] __initconst = {
+	{
+		/* pin-controller instance 0 FSYS data */
+		.pin_banks	= artpec8_pin_banks0,
+		.nr_banks	= ARRAY_SIZE(artpec8_pin_banks0),
+		.eint_gpio_init	= exynos_eint_gpio_init,
+	}, {
+		/* pin-controller instance 1 PERIC data */
+		.pin_banks	= artpec8_pin_banks1,
+		.nr_banks	= ARRAY_SIZE(artpec8_pin_banks1),
+		.eint_gpio_init	= exynos_eint_gpio_init,
+	},
+};
+
+const struct samsung_pinctrl_of_match_data artpec8_of_data __initconst = {
+	.ctrl		= artpec8_pin_ctrl,
+	.num_ctrl	= ARRAY_SIZE(artpec8_pin_ctrl),
+};
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl/samsung/pinctrl-exynos.h
index 362dc533186f..c9c38f8988dd 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.h
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
@@ -236,6 +236,16 @@
 		.name			= id				\
 	}
 
+#define ARTPEC_PIN_BANK_EINTG(pins, reg, id, offs)			\
+	{								\
+		.type			= &artpec_bank_type_off,	\
+		.pctl_offset		= reg,				\
+		.nr_pins		= pins,				\
+		.eint_type		= EINT_TYPE_GPIO,		\
+		.eint_offset		= offs,				\
+		.name			= id				\
+	}
+
 /**
  * struct exynos_weint_data: irq specific data for all the wakeup interrupts
  * generated by the external wakeup interrupt controller.
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index 24745e1d78ce..c099195fc464 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -1482,6 +1482,8 @@ static const struct of_device_id samsung_pinctrl_dt_match[] = {
 		.data = &s5pv210_of_data },
 #endif
 #ifdef CONFIG_PINCTRL_EXYNOS_ARM64
+	{ .compatible = "axis,artpec8-pinctrl",
+		.data = &artpec8_of_data },
 	{ .compatible = "google,gs101-pinctrl",
 		.data = &gs101_of_data },
 	{ .compatible = "samsung,exynos2200-pinctrl",
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
index 1cabcbe1401a..be2dee886d81 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.h
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
@@ -381,6 +381,7 @@ struct samsung_pmx_func {
 };
 
 /* list of all exported SoC specific data */
+extern const struct samsung_pinctrl_of_match_data artpec8_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos2200_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos3250_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos4210_of_data;
-- 
2.49.0


