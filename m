Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C54DCAC593
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Sep 2025 21:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x+VP5nzPO7TU78rfhYTFY7al0sL7mhZVAIAF4JSoUlo=; b=fGg5cU6QPSznTcmnMtuko6DNbw
	mvBC6baeoq0oma8WB1lnHsNGO4zH+BNReay1F9qzMPHX6UjJ85w3k8gFBzTOB5Lm1qCmcsIJtGkJ5
	7YZSND6ZXnmA7OgfWP+l2pYedxpiKRGkHYp1+4KvC5XCAM44hELH0wHNYYYOJ+VCNqop+qgmQ9w2T
	jw9CjrGm/8xp2gnC4wdgOzzWqSSfIm8/q+RMFNpUEexxE443Z1Fcrlih2gQOY35D73CvH+DwdOTfK
	LFEVdbFLhaTn9/QaoZjipUGxT9q6toQXSg7EPvYA/0Bdj4CQmWRRGnD7ui0sbaDoDknXv/Ls1sZ3V
	OB6O896Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxXbp-0000000GI71-1gML;
	Sat, 13 Sep 2025 21:16:37 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxXbg-0000000GI1q-2zAG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Sep 2025 21:16:29 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3e7636aa65fso2366659f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Sep 2025 14:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757798187; x=1758402987; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x+VP5nzPO7TU78rfhYTFY7al0sL7mhZVAIAF4JSoUlo=;
        b=Rst0ewIqdtXVyvh/wYa7kJLxWF3Gnw5hUnb8aHblwGlQIGPt+qBygFlyOlfq6k4wsJ
         1vfDYCSeokSMdGUJ1ozkZkeY1PibnVQfScaZ32gh5H9m0Dgw1H2IyGSo0J75kjFz8OMp
         DyT/czvS7KAwHIZ+HKZuUgVD9UtfEAjxaXJ90v2+/R38Ay5FSErQbZBUtrkEL4k3ZZlv
         0/n3CzG2tBfnWs8c7HAbri9KVhev0C1Y6hdrroD7Skdf8RGFXGTGlv6eXtWY5Uj0EUBe
         KHgKzSCN5EGps9CkEUz4n73HQ/1Dd6MHqfnW3Pukw9lAZ79+6wjM320e03c+wS2ff2RO
         MBlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757798187; x=1758402987;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x+VP5nzPO7TU78rfhYTFY7al0sL7mhZVAIAF4JSoUlo=;
        b=xKTPZ9mZ5ngX0QO8uZtpWByaw8WmQTS7dLCp39ec1OAMN4mNoo5LZdjvkhGgmd7+Kk
         zyBO4BAy9B2mQzsG8HR8NqzZDFzyCwvHd32VTLl94gS4Yj7AawUAomCIue91ekwbX9yG
         jTHCXfM1SR/VihlI2vpg1DSLTAvst13jyKQy7MYS/o0b/6wqOMdXS4qxB54NP/6zFvPA
         9Rj4qSEcPHTUtS8bhtKpY08LrlHQiPbtOigkqObSZs+9KurTX7SAYdYDSEwZ0pYiT6i7
         QNvSU1MnTiX6Upc7FR3+Hi4LvgN/yMYmzAvv0yH/LrayOkY/h+pOWQ/CJAc8Ecy5Oi4O
         jenA==
X-Forwarded-Encrypted: i=1; AJvYcCWsIeJPqi7QviurIffE/rs5K9wGKx40MXBxlX2e8x1Y2H4yvSkg1/zLNMpEnAXiq1nJW35NnQXroedNWXw5xbuj@lists.infradead.org
X-Gm-Message-State: AOJu0YxTVXiLR89/P1d4fB7l/GbmQu+zmpStjavjYMFadwyd0Rprq3Tc
	wsEabqZcSz5cBSuI7EW7o75RzgfjVBjL6FdqeVpen1EgZ4bFdK0wwe/f
X-Gm-Gg: ASbGnctHjEQqYSdPybNxveNoWL+lxQ4WUUfvUtJn3vEhdrj+dpDfQ5rzJ3uzyeF3VUy
	gMXQP2isahDuEBPV4F4BCaE4eFjh/4b5xgb7mbORM40BksxosI+zS9WTJ2m2FW6Zh8vS5kwepp0
	no2xXnGJYnn0mPhN3S4+mL7cyRNH45WBRkumVhdcMh47Ou+kiHli4OB2Ykb7r66+1ZxN1V7yTnp
	HcwxZZsxhnfN7Jitg+1S4T7ctKw2yL/e5dwyafSenEwyYzb98qb3biF68CEHO8CaFIwhnO4KSmX
	bTUHensayK0k+7aBc32BkMOI5GwM5dhb3xd8JIS0XuzdbORfnuFv7P5syjspDV8hVKeAgJErK6A
	jAORcd+/XiO8AK1dHmOjgVQoG7u2Rki8JyJ7Iifgiby9qA3CqjWX3
X-Google-Smtp-Source: AGHT+IErQfbzl+MbBvCHZhxs1p+1GYnI5sydo30kHH2h99Tqk9i7XQM6wd82P0gT6HpXmbTeKuaCjg==
X-Received: by 2002:a05:6000:2289:b0:3de:5aff:3498 with SMTP id ffacd0b85a97d-3e7659c40f9mr6426295f8f.14.1757798186616;
        Sat, 13 Sep 2025 14:16:26 -0700 (PDT)
Received: from Radijator.localdomain ([93.140.65.23])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e014ac468sm65403145e9.0.2025.09.13.14.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 14:16:26 -0700 (PDT)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Date: Sat, 13 Sep 2025 23:12:50 +0200
Subject: [PATCH v4 3/4] clk: mmp: pxa1908: Instantiate power driver through
 auxiliary bus
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250913-pxa1908-genpd-v4-3-55e4cf32f619@dujemihanovic.xyz>
References: <20250913-pxa1908-genpd-v4-0-55e4cf32f619@dujemihanovic.xyz>
In-Reply-To: <20250913-pxa1908-genpd-v4-0-55e4cf32f619@dujemihanovic.xyz>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: David Wronek <david@mainlining.org>, Karel Balej <balejk@matfyz.cz>, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4616;
 i=duje@dujemihanovic.xyz; s=20240706; h=from:subject:message-id;
 bh=w28rVWlir7yhdT2JFdKVFGiML/ldN3rGLXPeOpnXsl0=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDBlH7ytV2V8LFpVXk4iwbXp8pKpRROVavt7LuJkzhLbbe
 s1myKzrKGVhEONikBVTZMn973iN97PI1u3Zywxg5rAygQxh4OIUgIn47WVkWLF7ov5Fi8pXwYds
 p2TMzbuVvzdG5q5QekuY+E9u0ZPPzzIyfFr+4H/FqogKybKaJ9b6NkHfOJ8z6th9PeP96vi+gpo
 IfgA=
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_141628_781505_6CD033D8 
X-CRM114-Status: GOOD (  22.63  )
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

From: Duje Mihanović <duje@dujemihanovic.xyz>

The power domain driver shares the APMU clock controller's registers.
Instantiate the power domain driver through the APMU clock driver using
the auxiliary bus.

Also create a separate Kconfig entry for the PXA1908 clock driver to
allow (de)selecting the driver at will and selecting
CONFIG_AUXILIARY_BUS.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
v4:
- Use devm_auxiliary_device_create()

v3:
- Move driver back to pmdomain subsystem, use auxiliary bus to
  instantiate the driver

v2:
- Move to clk subsystem, instantiate the driver from the APMU clock
  driver
- Drop clock handling
- Squash MAINTAINERS patch
---
 MAINTAINERS                        |  2 ++
 drivers/clk/Kconfig                |  1 +
 drivers/clk/mmp/Kconfig            | 10 ++++++++++
 drivers/clk/mmp/Makefile           |  5 ++++-
 drivers/clk/mmp/clk-pxa1908-apmu.c |  7 +++++++
 5 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5b0e4767639b24d89fa760020a9681e5c2001a6e..148848dafac7c3dd50933ec22a3bd26170535d47 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2869,7 +2869,9 @@ ARM/Marvell PXA1908 SOC support
 M:	Duje Mihanović <duje@dujemihanovic.xyz>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+F:	Documentation/devicetree/bindings/clock/marvell,pxa1908.yaml
 F:	arch/arm64/boot/dts/marvell/mmp/
+F:	drivers/clk/mmp/Kconfig
 F:	drivers/clk/mmp/clk-pxa1908*.c
 F:	drivers/pmdomain/marvell/
 F:	include/dt-bindings/clock/marvell,pxa1908.h
diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 4d56475f94fc1e28823fe6aee626a96847d4e6d5..68a9641fc649a23013b2d8a9e9f5ecb31d623abb 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -511,6 +511,7 @@ source "drivers/clk/imx/Kconfig"
 source "drivers/clk/ingenic/Kconfig"
 source "drivers/clk/keystone/Kconfig"
 source "drivers/clk/mediatek/Kconfig"
+source "drivers/clk/mmp/Kconfig"
 source "drivers/clk/meson/Kconfig"
 source "drivers/clk/mstar/Kconfig"
 source "drivers/clk/microchip/Kconfig"
diff --git a/drivers/clk/mmp/Kconfig b/drivers/clk/mmp/Kconfig
new file mode 100644
index 0000000000000000000000000000000000000000..b0d2fea3cda5de1284916ab75d3af0412edcf57f
--- /dev/null
+++ b/drivers/clk/mmp/Kconfig
@@ -0,0 +1,10 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config COMMON_CLK_PXA1908
+	bool "Clock driver for Marvell PXA1908"
+	depends on ARCH_MMP || COMPILE_TEST
+	depends on OF
+	default y if ARCH_MMP && ARM64
+	select AUXILIARY_BUS
+	help
+	  This driver supports the Marvell PXA1908 SoC clocks.
diff --git a/drivers/clk/mmp/Makefile b/drivers/clk/mmp/Makefile
index 062cd87fa8ddcc6808b6236f8c4dd524aaf02030..0a94f2f0856389c8e959981ccafbb02140a7733d 100644
--- a/drivers/clk/mmp/Makefile
+++ b/drivers/clk/mmp/Makefile
@@ -11,4 +11,7 @@ obj-$(CONFIG_MACH_MMP_DT) += clk-of-pxa168.o clk-of-pxa910.o
 obj-$(CONFIG_COMMON_CLK_MMP2) += clk-of-mmp2.o clk-pll.o pwr-island.o
 obj-$(CONFIG_COMMON_CLK_MMP2_AUDIO) += clk-audio.o
 
-obj-$(CONFIG_ARCH_MMP) += clk-of-pxa1928.o clk-pxa1908-apbc.o clk-pxa1908-apbcp.o clk-pxa1908-apmu.o clk-pxa1908-mpmu.o
+obj-$(CONFIG_COMMON_CLK_PXA1908) += clk-pxa1908-apbc.o clk-pxa1908-apbcp.o \
+	clk-pxa1908-mpmu.o clk-pxa1908-apmu.o
+
+obj-$(CONFIG_ARCH_MMP) += clk-of-pxa1928.o
diff --git a/drivers/clk/mmp/clk-pxa1908-apmu.c b/drivers/clk/mmp/clk-pxa1908-apmu.c
index d3a070687fc5b9fb5338f377f82e7664ca0aac29..7594a495a0093e8e22f2cfe3e61a13d23dc3b9c2 100644
--- a/drivers/clk/mmp/clk-pxa1908-apmu.c
+++ b/drivers/clk/mmp/clk-pxa1908-apmu.c
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
+#include <linux/auxiliary_bus.h>
 #include <linux/clk-provider.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -85,6 +86,7 @@ static void pxa1908_axi_periph_clk_init(struct pxa1908_clk_unit *pxa_unit)
 static int pxa1908_apmu_probe(struct platform_device *pdev)
 {
 	struct pxa1908_clk_unit *pxa_unit;
+	struct auxiliary_device *adev;
 
 	pxa_unit = devm_kzalloc(&pdev->dev, sizeof(*pxa_unit), GFP_KERNEL);
 	if (!pxa_unit)
@@ -94,6 +96,11 @@ static int pxa1908_apmu_probe(struct platform_device *pdev)
 	if (IS_ERR(pxa_unit->base))
 		return PTR_ERR(pxa_unit->base);
 
+	adev = devm_auxiliary_device_create(&pdev->dev, "power", NULL);
+	if (IS_ERR(adev))
+		return dev_err_probe(&pdev->dev, PTR_ERR(adev),
+				     "Failed to register power controller\n");
+
 	mmp_clk_init(pdev->dev.of_node, &pxa_unit->unit, APMU_NR_CLKS);
 
 	pxa1908_axi_periph_clk_init(pxa_unit);

-- 
2.51.0


