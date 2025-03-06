Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8789EC28B24
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 20:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fem2BHJ56Zg047K6qtXL+URWCBpvNsPCC9PMf7iwoqY=; b=DcQfepw+XNFn97LXe6gkUQiPhn
	VopTONjlP4uM6ma2j23+BqxuZDRB/uKwzq+ZxC/uqpTtP6b/td7yS1efrYAV/mMMfo5QhHjm4pgh3
	aA7KO73VqFOUtgoFPJyRTvA/z2SMJ48p4kPI4cmMSjn3LfXA1pAWtXgphaNRFISospP5/54ikHxiW
	LYKaGI2t8Cqoe9mVs/J7UaIyrPzQ8pfT/NmjKhuYo9gqtS73FmMSRg0xvUbFtBr2oUJPmB/x8EmaY
	2caSkJBcHBG3N7mz5GEXMRCNWfmdOzDkFodev7kzhQTKAgRiK/lvR4BGZi0GQVloDpnehQdAreR3T
	+LHU+STQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqIEA-0000000CAuL-09Yc;
	Thu, 06 Mar 2025 20:53:58 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqI3i-0000000C9BL-0DHh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 20:43:11 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-391342fc148so30018f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 12:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741293788; x=1741898588; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fem2BHJ56Zg047K6qtXL+URWCBpvNsPCC9PMf7iwoqY=;
        b=Mgg8I0pEOMPCAFAF74Nf5IzqK0J1aYc49J9JLn7uXr+hSRczn0x3xOk6bsLI4/R8/h
         MAOwPQ4RXAEO238aULIrgqxFREc2lLzi6xGVVNWye5u2+Plpda/bHgAQ9WbGMAXB7l3T
         LGmyrius8+73/VQk3s6+r7Dw7yZcW8PcROZ55eJ+92YAwADyAIT6jhDv0Cuxxv5Yd1m+
         qDndN3BTYF8xuOtfZbCjODQMfRcpO192ZZyYWG6z0ljccFHLfjlPV8E0cGRtAIEMmwT9
         v0HyLyqKyOzy5jbKvWkm8akMbIIjLAIGMiSvAL61b1afjqSqggZouOFYlWc6Hq7bz21N
         RebQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741293788; x=1741898588;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fem2BHJ56Zg047K6qtXL+URWCBpvNsPCC9PMf7iwoqY=;
        b=Se6f/QXFZRHi82kt6rFMbpzV+L79Rrljo7FNCEKJ8KnSrF6JWD3Nl5uFTp75eiMNyl
         zK07ipj+UJhPT2rFqnIY6yS3wIkoLx+NnvuYOGL/untxOd6LK3/mtODJZSqaz8lzmy0h
         Lhj+9t4IrUCeX6vzQonBQcpC8AxsUfmYg4Y/GCBiKNsCVavrUokzx/o8ofq+e9TIb6xE
         Vv+UmboGsHd2KTiNy1amO3I7d23Ha7Dys65jCYD940+08uFNPHT0tA91LNDXWA5UzCq6
         jX6/EOPxMbrTtByGTnGlEftr3mQE39BehgshKl0Zl3OTPRjq8GhR29kuLoHx4Srz+arG
         Ef5w==
X-Gm-Message-State: AOJu0YzFoKW9e9nueTOmKQkyDM9yIcomVctIRHsrwSk/Ji7omlynBcb8
	xaQV1WahMcnSgeTpyGstx9SEQo6ewFHTkleki+FXwevBEvlTB6kV0j8wQdX8awY=
X-Gm-Gg: ASbGncsvFS6c5cqpKs92xK/MxfCt8bpGsxH6GNb4YBUfWyeCXaibRgOUt7Y9n37VYv3
	xvI6oARmRYUfZYap2s7Qd9oW0BkMTNPoBBijIHDKOAC+/iVBS4akWinFRn3YVNLFhuYz1xlTFja
	TjisD1zEBp4zCPLXxK15koqp74UirC1NeynC1utPqseaI2oi9Vu7op5ETk30xaK+oA5bK7mbvoN
	I1kZzCuKoq650M6yc0U20tG99bCYBlSrAq8pDjTF/9HDHESlQtrWJX0UUC7xaSccG6TjNaOluBB
	IaM0ZOblER7cqUO1za+fehI1Rko6Au2HrBKtZlfiM23gX7YvsVNswp6D40r4oCs+V94OOpA5AFc
	=
X-Google-Smtp-Source: AGHT+IHrEeyZfY9AxpVM023cb5jmtDaJMaJBllSguHY5Co+8WkZqWGk8TEfsF2KY220yHb4QBK80CA==
X-Received: by 2002:a5d:47a2:0:b0:38f:28dc:db58 with SMTP id ffacd0b85a97d-39132d66aecmr438953f8f.10.1741293788547;
        Thu, 06 Mar 2025 12:43:08 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([145.224.67.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bdd9470e2sm30081715e9.33.2025.03.06.12.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 12:43:08 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 06 Mar 2025 20:42:38 +0000
Subject: [PATCH v3 4/4] pinctrl: samsung: Add filter selection support for
 alive bank on gs101
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250306-pinctrl-fltcon-suspend-v3-4-f9ab4ff6a24e@linaro.org>
References: <20250306-pinctrl-fltcon-suspend-v3-0-f9ab4ff6a24e@linaro.org>
In-Reply-To: <20250306-pinctrl-fltcon-suspend-v3-0-f9ab4ff6a24e@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 andre.draszik@linaro.org, tudor.ambarus@linaro.org, willmcvicker@google.com, 
 semen.protsenko@linaro.org, kernel-team@android.com, 
 jaewon02.kim@samsung.com, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5693;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=AamfFD2BRSllOH2t+3HFL8aEOK6cAWC0xj27tH28/zs=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBnygjTd1L6tDY6tRfMy0W1Arkbde2BmYW/fNK57
 3LRpgrGNY+JAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCZ8oI0wAKCRDO6LjWAjRy
 ustdD/9DYc5Hd2mErlBUZrqIzZpcf+Q0IYKa0auc+0N87j/47bOmaMPx1hEu0GSshAnlowCjF7t
 61QDuP1Nr9Eoib8h+icCOG0QiA5vH7eQl7C1/qh56hxP+c831MkFjzTUsusftjriFZl7wzLSMHf
 m6qJB65lCvM1aWVqBd9j9LYs8EYDxSeO7WMr42P3TqU6k0D5gRN2RcHNetdqnkehHhPKLXna/Vw
 UjKfGET2XoIsSGHpB96dTcnaCRgnCIExBYg5guwlMXYGpZrVKinAEzd38U/zKlNbY9aAtZS+s9z
 CRRVhRDeK1VX3P4s4+D1YQrvfAKD5TYZMLhxlJ8vC5XWhqYpxi4rRNvR2K+l5iG9r1EbU0sbeGU
 n86EPTTH94NCpkZ/UYPeIZrNqI1c/8dcjXNBD3IpcgIUpRmIGFgrkogIpQptIc/kzGdNbbBY1Y6
 1gKWbtVVz2nKIrvd0Kt2LMrOa32cjYoP7KbuPq36q2jeus2t9cra0Bdb2cPbdPl/BwquIzfId8A
 O2NIp4jqEnBVc6+Djh1M//DsbyTOD+6cjaaFax9bfP0vXWBDtqQ2A0k4VNkiDAgIMpR2cwqp7l0
 w1d4AFBRUI9lXQjg7n1vDBmFk5qnH46qchc+oRmcPuXXppTzfZTlEzA4MiiCDSBKXYFs7XWWwNo
 hrak8vzTgUVOlQA==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_124310_098686_A7880443 
X-CRM114-Status: GOOD (  21.53  )
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

Newer Exynos based SoCs have a filter selection bitfield in the filter
configuration registers on alive bank pins. This allows the selection of
a digital or analog delay filter for each pin. Add support for selecting
and enabling the filter.

On suspend we set the analog filter to all pins in the bank (as the
digital filter relies on a clock). On resume the digital filter is
reapplied to all pins in the bank. The digital filter is working via
a clock and has an adjustable filter delay flt_width bitfield, whereas
the analog filter uses a fixed delay.

The filter determines to what extent signal fluctuations received through
the pad are considered glitches.

The code path can be exercised using
echo mem > /sys/power/state
And then wake the device using a eint gpio

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---

Changes since v2:
* Ensure EXYNOS_FLTCON_DIGITAL bit is cleared (Andre)
* Make it obvious that exynos_eint_set_filter() is conditional on bank type (Andre)

Changes since v1:
* Remove eint_flt_selectable bool as it can be deduced from EINT_TYPE_WKUP (Peter)
* Move filter config comment to header (Andre)
* Rename EXYNOS_FLTCON_DELAY to EXYNOS_FLTCON_ANALOG (Andre)
* Remove misleading old comment (Andre)
* Refactor exynos_eint_update_flt_reg() into a loop (Andre)

Note: this patch was previously sent as part of the initial gs101/ Pixel 6
series and was dropped in v6. This new version incorporates the review
feedback from Sam Protsenko here in v5.

Link: https://lore.kernel.org/all/20231201160925.3136868-1-peter.griffin@linaro.org/T/#m79ced98939e895c840d812c8b4c2b3f33ce604c8

Changes since previous version
* Drop fltcon_type enum and use bool eint_flt_selectable (Sam)
* Refactor and add exynos_eint_update_flt_reg() (Sam)
* Rename function to exynos_eint_set_filter() for easier readability (Sam)
* Remove comments and `if bank->fltcon_type != FLT_DEFAULT)` checks and indentation (Sam)
---
 drivers/pinctrl/samsung/pinctrl-exynos.c | 37 +++++++++++++++++++++++++++++++-
 drivers/pinctrl/samsung/pinctrl-exynos.h | 20 +++++++++++++++++
 2 files changed, 56 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index 9cffbe9ee64aa5236026978ac2466b709da5bffc..1176efc0ef0464d1a6fc70b0a04f5ddd73ef88a4 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -369,6 +369,37 @@ struct exynos_eint_gpio_save {
 	u32 eint_mask;
 };
 
+static void exynos_eint_update_flt_reg(void __iomem *reg, int cnt, int con)
+{
+	unsigned int val, shift;
+	int i;
+
+	val = readl(reg);
+	for (i = 0; i < cnt; i++) {
+		shift = i * EXYNOS_FLTCON_LEN;
+		val &= ~(EXYNOS_FLTCON_DIGITAL << shift);
+		val |= con << shift;
+	}
+	writel(val, reg);
+}
+
+/*
+ * Set the desired filter (digital or analog delay) and enable it to
+ * every pin in the bank. Note the filter selection bitfield is only
+ * found on alive banks. The filter determines to what extent signal
+ * fluctuations received through the pad are considered glitches.
+ */
+static void exynos_eint_set_filter(struct samsung_pin_bank *bank, int filter)
+{
+	unsigned int off = EXYNOS_GPIO_EFLTCON_OFFSET + bank->eint_fltcon_offset;
+	void __iomem *reg = bank->drvdata->virt_base + off;
+	unsigned int con = EXYNOS_FLTCON_EN | filter;
+
+	for (int n = 0; n < bank->nr_pins; n += 4)
+		exynos_eint_update_flt_reg(reg + n,
+					   min(bank->nr_pins - n, 4), con);
+}
+
 /*
  * exynos_eint_gpio_init() - setup handling of external gpio interrupts.
  * @d: driver data of samsung pinctrl driver.
@@ -828,8 +859,10 @@ void gs101_pinctrl_suspend(struct samsung_pin_bank *bank)
 				 bank->name, save->eint_fltcon1);
 		pr_debug("%s: save    mask %#010x\n",
 			 bank->name, save->eint_mask);
-	} else if (bank->eint_type == EINT_TYPE_WKUP)
+	} else if (bank->eint_type == EINT_TYPE_WKUP) {
 		exynos_set_wakeup(bank);
+		exynos_eint_set_filter(bank, EXYNOS_FLTCON_ANALOG);
+	}
 }
 
 void exynosautov920_pinctrl_suspend(struct samsung_pin_bank *bank)
@@ -883,6 +916,8 @@ void gs101_pinctrl_resume(struct samsung_pin_bank *bank)
 			writel(save->eint_fltcon1, eint_fltcfg0 + 4);
 		writel(save->eint_mask, regs + bank->irq_chip->eint_mask
 		       + bank->eint_offset);
+	} else if (bank->eint_type == EINT_TYPE_WKUP) {
+		exynos_eint_set_filter(bank, EXYNOS_FLTCON_DIGITAL);
 	}
 }
 
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl/samsung/pinctrl-exynos.h
index 773f161a82a38cbaad05fcbc09a936300f5c7595..66acbd08d3445ca6ee7358d3c4a6cb2be5d82842 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.h
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
@@ -52,6 +52,26 @@
 #define EXYNOS_EINT_MAX_PER_BANK	8
 #define EXYNOS_EINT_NR_WKUP_EINT
 
+/*
+ * EINT filter configuration register (on alive banks) has
+ * the following layout.
+ *
+ * BitfieldName[PinNum][Bit:Bit]
+ * FLT_EN[3][31] FLT_SEL[3][30] FLT_WIDTH[3][29:24]
+ * FLT_EN[2][23] FLT_SEL[2][22] FLT_WIDTH[2][21:16]
+ * FLT_EN[1][15] FLT_SEL[1][14] FLT_WIDTH[1][13:8]
+ * FLT_EN[0][7]  FLT_SEL[0][6]  FLT_WIDTH[0][5:0]
+ *
+ * FLT_EN	0x0 = Disable, 0x1=Enable
+ * FLT_SEL	0x0 = Analog delay filter, 0x1 Digital filter (clock count)
+ * FLT_WIDTH	Filtering width. Valid when FLT_SEL is 0x1
+ */
+
+#define EXYNOS_FLTCON_EN		BIT(7)
+#define EXYNOS_FLTCON_DIGITAL		BIT(6)
+#define EXYNOS_FLTCON_ANALOG		(0 << 6)
+#define EXYNOS_FLTCON_LEN		8
+
 #define EXYNOS_PIN_BANK_EINTN(pins, reg, id)		\
 	{						\
 		.type		= &bank_type_off,	\

-- 
2.49.0.rc0.332.g42c0ae87b1-goog


