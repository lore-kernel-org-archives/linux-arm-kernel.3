Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E21BCA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 05:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OVf2kzdOSE35zubTYhy5p4HObUjPisVXLQwG/uTgz0Q=; b=jS0TxRVe+1Wt0oigyK8r8ZFIuW
	HccTDYMKeS1B0V4qs15G+zFzBr1EMevOHNovYTJektvyipERT7s3OcQxYoKJ0/5pnpEj9MRJC34mn
	B5FO0k4attGtBBL+xiXdbixH5DIePZSZg8UxZLT1H64jEMCH3KD6ts7TeSplgNWttZP1P0eiXrWmB
	VYYnLMPM963PKuKGzHdR6vFdGINw12VhAfWLV0mkkBNaP71a51972I1NtuoLe8KS6uZv5wbdk34SV
	5RdMYMclvL1hNVU9X1a9ESIMQZziKcqohOXffi9A6MdAS1ZV/DyFXow9QeiHF/QRV3CnLVzRBjpq0
	tfs2BMsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usxRT-0000000BFDd-0roQ;
	Mon, 01 Sep 2025 05:50:59 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usxJZ-0000000BEWa-1NeU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 05:42:50 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250901054247epoutp0142731b3b46d2b4a4ada59e09ef572aa0~hEjldSX1K1779917799epoutp01c
	for <linux-arm-kernel@lists.infradead.org>; Mon,  1 Sep 2025 05:42:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250901054247epoutp0142731b3b46d2b4a4ada59e09ef572aa0~hEjldSX1K1779917799epoutp01c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756705367;
	bh=OVf2kzdOSE35zubTYhy5p4HObUjPisVXLQwG/uTgz0Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rHp+9/sBJvdyKby+86phch8jULBaRcLAn3T6NBV6C3zUJyrclFb5ekOHNggA9yATf
	 n/LUsDpT9o0HdeFgPX+lAFRgAwc0W0pfkZDkKczKt/HvU1/6BZhRDxkckZcbOmrmpy
	 QYT9LAqO55388pJuA4j9IsxncgypHuZHKTCTGJTI=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250901054246epcas5p1b328b9c60a8a5ecbd961288890b9c346~hEjkqarrk1274712747epcas5p1m;
	Mon,  1 Sep 2025 05:42:46 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.93]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4cFd7T1ygVz6B9m4; Mon,  1 Sep
	2025 05:42:45 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250901054244epcas5p474b65dbf838296ba3177edaeb2c6ec97~hEjjBPtz71608616086epcas5p4j;
	Mon,  1 Sep 2025 05:42:44 +0000 (GMT)
Received: from Jaguar.samsungds.net (unknown [107.109.115.6]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250901054239epsmtip29a7402a69a09b1ca1ada114007b15539~hEjeqp3Aw0762707627epsmtip28;
	Mon,  1 Sep 2025 05:42:39 +0000 (GMT)
From: Ravi Patel <ravi.patel@samsung.com>
To: jesper.nilsson@axis.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org,
	s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com,
	linus.walleij@linaro.org, tomasz.figa@gmail.com, catalin.marinas@arm.com,
	will@kernel.org, arnd@arndb.de
Cc: ksk4725@coasia.com, kenkim@coasia.com, pjsin865@coasia.com,
	gwk1013@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com,
	smn1196@coasia.com, shradha.t@samsung.com, ravi.patel@samsung.com,
	inbaraj.e@samsung.com, swathi.ks@samsung.com, hrishikesh.d@samsung.com,
	dj76.yang@samsung.com, hypmean.kim@samsung.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@axis.com,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, Priyadarsini G
	<priya.ganesh@samsung.com>
Subject: [PATCH v4 2/6] pinctrl: samsung: Add ARTPEC-8 SoC specific
 configuration
Date: Mon,  1 Sep 2025 10:49:22 +0530
Message-Id: <20250901051926.59970-3-ravi.patel@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250901051926.59970-1-ravi.patel@samsung.com>
X-CMS-MailID: 20250901054244epcas5p474b65dbf838296ba3177edaeb2c6ec97
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250901054244epcas5p474b65dbf838296ba3177edaeb2c6ec97
References: <20250901051926.59970-1-ravi.patel@samsung.com>
	<CGME20250901054244epcas5p474b65dbf838296ba3177edaeb2c6ec97@epcas5p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_224249_688820_A4410CBD 
X-CRM114-Status: GOOD (  19.07  )
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


