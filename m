Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D8EC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 00:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IY61HJVbUC6SMPNFJByUluek9/u1F121iHY5hkFmCLo=; b=L9A3EpwlT8fwbgq09gDraHHCKp
	jPF5Jn0zHy1tlftETItP9PRNoI9WA1herxA4OYWt+gVNvZWeflAUur6dl//Y72d6mcTHWpuP+wERh
	9UmGAuoUt1YMCe9Riqi1Tuygl9/VKJBIDO1YtjbCE1BdRoZtTTyR8yWtTIVl7VK8C4ib+wr1+ypWC
	WcHjJHbz+MfCrDw4oZRbY7HZaKekc48RocrD8yzLefpFGxxsvD0/j9DStMLxP68p0za5r3A1DltRK
	m2T5lDftg+Ye7TlNd34wwfo01lnx1k2ksMofM8osxhmew74JbQ9dJp7L2f8nbCOEIaOW0ZwcvRluK
	4Iq0/wDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZfYn-0000000AN3a-3eAu;
	Thu, 10 Jul 2025 00:54:49 +0000
Received: from mail2.coasia.com ([112.168.119.159] helo=spam.coasia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZf28-0000000AJOG-2ARP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 00:21:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=coasia.com; s=coasia;
	t=1752106862; bh=+XyIYQMf2ncS8t1GTxr8ifxgcrmBt2eK7n4z1pjGkos=;
	l=5043; h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=CLBeIJS3n60wpYNDups7Nio9xhosNVGFpQAF3qL7/2yUt4YEWblol0a3YJ4SmFmIK
	 wymByngctjyAPt7mrMJ42KGtKne/t0sAcWg/krccR5qApOg4woyWO6cFu6bcQWlu+/
	 e9aCN3JZA8gWNllwv7NxTN6Pr8F1e+dLEHfnMoAo=
Received: from unknown (HELO kangseongu..) (ksk4725@coasia.com@115.23.218.194)
	by 192.168.10.159 with ESMTP; 10 Jul 2025 09:21:02 +0900
X-Original-SENDERIP: 115.23.218.194
X-Original-SENDERCOUNTRY: KR, South Korea 
X-Original-MAILFROM: ksk4725@coasia.com
X-Original-RCPTTO: jesper.nilsson@axis.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	krzk@kernel.org,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com,
	linus.walleij@linaro.org,
	tomasz.figa@gmail.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	kenkim@coasia.com,
	pjsin865@coasia.com,
	gwk1013@coasia.com,
	ksk4725@coasia.com,
	hgkim05@coasia.com,
	mingyoungbo@coasia.com,
	smn1196@coasia.com,
	pankaj.dubey@samsung.com,
	shradha.t@samsung.com,
	ravi.patel@samsung.com,
	inbaraj.e@samsung.com,
	swathi.ks@samsung.com,
	hrishikesh.d@samsung.com,
	dj76.yang@samsung.com,
	hypmean.kim@samsung.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@axis.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	soc@lists.linux.dev,
	priya.ganesh@samsung.com
From: ksk4725@coasia.com
To: Jesper Nilsson <jesper.nilsson@axis.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: kenkim <kenkim@coasia.com>,
	Jongshin Park <pjsin865@coasia.com>,
	GunWoo Kim <gwk1013@coasia.com>,
	SeonGu Kang <ksk4725@coasia.com>,
	HaGyeong Kim <hgkim05@coasia.com>,
	GyoungBo Min <mingyoungbo@coasia.com>,
	SungMin Park <smn1196@coasia.com>,
	Pankaj Dubey <pankaj.dubey@samsung.com>,
	Shradha Todi <shradha.t@samsung.com>,
	Ravi Patel <ravi.patel@samsung.com>,
	Inbaraj E <inbaraj.e@samsung.com>,
	Swathi K S <swathi.ks@samsung.com>,
	Hrishikesh <hrishikesh.d@samsung.com>,
	Dongjin Yang <dj76.yang@samsung.com>,
	Sang Min Kim <hypmean.kim@samsung.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@axis.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	soc@lists.linux.dev,
	Priyadarsini G <priya.ganesh@samsung.com>
Subject: [PATCH 12/16] pinctrl: samsung: Add ARTPEC-8 SoC specific configuration
Date: Thu, 10 Jul 2025 09:20:42 +0900
Message-Id: <20250710002047.1573841-13-ksk4725@coasia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250710002047.1573841-1-ksk4725@coasia.com>
References: <20250710002047.1573841-1-ksk4725@coasia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_172104_828822_FBEA6F57 
X-CRM114-Status: GOOD (  14.03  )
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
It is similar to other Samsung SoC pinctrl blocks.

Signed-off-by: Priyadarsini G <priya.ganesh@samsung.com>
Signed-off-by: SeonGu Kang <ksk4725@coasia.com>
---
 .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 50 +++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-exynos.h      | 10 ++++
 drivers/pinctrl/samsung/pinctrl-samsung.c     |  2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h     |  1 +
 4 files changed, 63 insertions(+)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
index dd07720e32cc..ee3b488b00ff 100644
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
 
@@ -1814,3 +1823,44 @@ const struct samsung_pinctrl_of_match_data gs101_of_data __initconst = {
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
index b483270ddc53..6bc04cb5ac9f 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.h
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
@@ -216,6 +216,16 @@
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
index 2896eb2de2c0..993efba5a9ad 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -1468,6 +1468,8 @@ static const struct of_device_id samsung_pinctrl_dt_match[] = {
 		.data = &s5pv210_of_data },
 #endif
 #ifdef CONFIG_PINCTRL_EXYNOS_ARM64
+	{ .compatible = "axis,artpec8-pinctrl",
+		.data = &artpec8_of_data },
 	{ .compatible = "google,gs101-pinctrl",
 		.data = &gs101_of_data },
 	{ .compatible = "samsung,exynos2200-pinctrl",
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
index 3cf758df7d69..bfd88ad2f3ff 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.h
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
@@ -377,6 +377,7 @@ struct samsung_pmx_func {
 };
 
 /* list of all exported SoC specific data */
+extern const struct samsung_pinctrl_of_match_data artpec8_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos2200_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos3250_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos4210_of_data;
-- 
2.34.1


