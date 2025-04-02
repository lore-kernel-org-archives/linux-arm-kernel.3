Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F433C36017
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 15:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RT1SeGSA5GQ1fXoKXVvanXrAwd9U3trQ/c8CMPHycCA=; b=UdXPnI1X1bluiIy/Y4Y5xHgHBD
	nlhos+WPQ55MhicELqJcd9dP+psnmjmd7Ba8L4aNZnLqfRHny1APFk2ugV1Iv32g+u9uJ1iNtBQxD
	Bk4FsarN3AYNUYMVNJVguuewherPVjLM3MRe+eqwmtCg0bdckXAAw7474utyCo8ncw32EicC07JCi
	mW3yVMGH5918TigjdPgyhCL8ZDky4bTeR7aCGpZQTWN8dlmBeEwAZoT9vAbQQNoH4skaqjJq7L11n
	eUG+8GqhFX/PmAevb+wGOFwljZT2FAAQ95rx28t3xk3P4wdBAPwYBNs5fvKpEPiF2XsGcOIXoXEXz
	omBTYlhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u000x-00000006WA2-0sf1;
	Wed, 02 Apr 2025 15:28:27 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzzqb-00000006UTY-39Ic
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 15:17:47 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso74906865e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 08:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743607064; x=1744211864; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RT1SeGSA5GQ1fXoKXVvanXrAwd9U3trQ/c8CMPHycCA=;
        b=kDMO40Nujnx8aFJzNvfNa8K6jImy6JLeT//GDiO7X7OWL1OAzmvazS02FfdNp9yUKw
         i4ZGqgr38Vu762xxialBI/RIpo8qFctwAZTtJ9PUOHJEOCstF0z0h462wbkrNi29J+Wy
         OXA7nj/KvZ6qAzp8yN24YnDuOPd166BTKhFfd0vG8DZbh68PsoO5Wz6eNcdEKC4YdqdJ
         Ya1y29heOYvd9C1FVLI0OOVBNAhj1bysZpIGzv8MzG7MnbkyWAoPV61czhUSoGAbUc/W
         XuZ3wcQfjGNhf60ARoauuwkxxWOHPH40VJygSvLQfNBb4/iYje4gd8X07Gmf41vGMJzm
         B1Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743607064; x=1744211864;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RT1SeGSA5GQ1fXoKXVvanXrAwd9U3trQ/c8CMPHycCA=;
        b=eEeZD6tIyN46L/i+Tj2ST+08rZPPhkk6W3SS1gtPff8+jbEG3jdrAoKPzxTLfvHMlc
         0VuDewOtXdREFf2paJCK8oD/LTmWT1sws2gvws4whS9NpNhePaYWJZshcNFAkpWHDr8M
         kNqbO8kSSP2v0RUyoS1NSxpIvZu5+WDLv/JOOeKlAPYa1WjqgDIEo7xswlQLsy/tPCQ9
         jEhKDTrWjfmFjcmN2bqPugAUytoYDEYIrvjm1rVxBQJ374KuJYp6PZl7KX/n3pN7kHJE
         /cqH3zMMXzSw4lC/pEXjNe4BVa8VGwozFcpg6Jbhuz9fmhj+9ZE0zwMMenkqVH5PR2rz
         KZpQ==
X-Gm-Message-State: AOJu0YyhCfHm8SKFEzEjxg4lBQep2EH0sfCAvuT1oOvgf6sqNQv8dZga
	3J0z8mbL67YH+T6iVpyag4Bi8vOVuSQZKsbB+L8Kmxms5Oc993MRX5jLjS21lkA=
X-Gm-Gg: ASbGncsi0+d1W+FqqYeIDesMz/TwGo3vmViPq3j19ZG2xPnsFi0rGDJDyqw4Xi0znUX
	d2AW9irgJNOdiUccwl7/Uvq9zWk9h6RxmSSaNfMhDoSdOB2G4DUUVnNBIwEAx+ltxHCupgADRND
	mxgzXz9RHEBPXyHY+03WWeZpci5nGwyzV74RrfSQQQMe5cgwSYwcTZ4Z1E5mdjA0TswY0qe1FNI
	rzeRqayAVkoTuiqkDoVSANiuLOwZFJXvOdAT4yGQdg1rJh0WXuCrknwXC0kmAEybl/AGTyez2PF
	2So/9O9rJdOXXwoAh/DQG8o9jBA7GtqH8VnG2l1q/w2YC7uOtEToM8tIHpteurjX9CG7LceSE+8
	yEjs/6go6
X-Google-Smtp-Source: AGHT+IHFo1V7olRxYCuDmHeY5rzVFfk8a7h1ctHGDdUeLAMnTEwORauybS7JaON5yanV/uSmOQw9DQ==
X-Received: by 2002:a5d:5c84:0:b0:390:f9a5:bd79 with SMTP id ffacd0b85a97d-39c29767c8emr2464302f8f.26.1743607064139;
        Wed, 02 Apr 2025 08:17:44 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.66.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b663860sm17469190f8f.39.2025.04.02.08.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 08:17:43 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 02 Apr 2025 16:17:33 +0100
Subject: [PATCH v6 4/4] pinctrl: samsung: Add filter selection support for
 alive bank on gs101
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250402-pinctrl-fltcon-suspend-v6-4-78ce0d4eb30c@linaro.org>
References: <20250402-pinctrl-fltcon-suspend-v6-0-78ce0d4eb30c@linaro.org>
In-Reply-To: <20250402-pinctrl-fltcon-suspend-v6-0-78ce0d4eb30c@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5531;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=AujZQXa7GXfZ//2SBfjSJDuHvl2+ROHYQOi0tdHKgdk=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBn7VUQGniN8W+uLmpOtptdW5cgPSdCqV6b5hk7D
 Qw8dbFgKwaJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCZ+1VEAAKCRDO6LjWAjRy
 unn/D/48Ey3dk5oqJw+GiAHkYpQd+iXupMawkzqXjhGuwM4Mz8zWN+54tcnACYE7hgoKZ5abTiq
 nA14otuXvKKgePX9szClRgF2SoNUFp6xjIjOwDj5XAzhG+4WCizAukoYhnlIoQQ5Ba1Fhp9dfw6
 sQbTaFQqrL1zmOBNxQsnQbv/YrrwTpLZPa8OnbA5TBXR6TLW9AtFpFhp4zDReRc8azFWt5uyR7R
 wgXwRv2POp9OLMH2fzZy/HRYdIyxmeJ+A2gAdSffkGdmz6LBJfaXamtOhB+52bPpcV1+8Sl8+3J
 V5YL91z2loW58fjLMQ3RO4qOwRkLGeDSAtZwecyNRzOk4qrGlxJ1FKfbSuabG3O9E5MxUXyUTKV
 q6a0XReTnUfABBG0Ibn0hkg7npOy//eo2D9H1EtTR3qfCqmKIFZmA0SL5DU3qLI4VnnP2YnFAbN
 XCwm60t/1w+soWbj+wxp3+NUCnOaX3ts2/SKgn8KjWinHQeI/UlrbVtJgFMSWHGXkZ6hmD87h3K
 b2Aif+soPFiqmbgaZ1pSTkjysSjfAVxilYUT6Oxbynu6s9yJgeQJlWtbxdp7VCXnhPEKPyDfxww
 Q6S++vCHolnvVQdzmmN0XbQz4M6dXRYZ7fyRVB/wRCYCGvhg1ca+OjuNwlX7DuvYfJiwjWS2Ydi
 eKtcJUvaeNpNrcw==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_081745_789720_C301D7C6 
X-CRM114-Status: GOOD (  20.69  )
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

Reviewed-by: André Draszik <andre.draszik@linaro.org>
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
 drivers/pinctrl/samsung/pinctrl-exynos.c | 34 ++++++++++++++++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-exynos.h | 20 +++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index 0879684338c772e484174a94ac2c274cc7d932ed..f3e1c11abe55032ee4ed7eb4db861dbb1e60c2bf 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -370,6 +370,37 @@ struct exynos_eint_gpio_save {
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
@@ -832,6 +863,7 @@ void gs101_pinctrl_suspend(struct samsung_pin_bank *bank)
 			 bank->name, save->eint_mask);
 	} else if (bank->eint_type == EINT_TYPE_WKUP) {
 		exynos_set_wakeup(bank);
+		exynos_eint_set_filter(bank, EXYNOS_FLTCON_ANALOG);
 	}
 }
 
@@ -887,6 +919,8 @@ void gs101_pinctrl_resume(struct samsung_pin_bank *bank)
 			writel(save->eint_fltcon1, eint_fltcfg0 + 4);
 		writel(save->eint_mask, regs + bank->irq_chip->eint_mask
 		       + bank->eint_offset);
+	} else if (bank->eint_type == EINT_TYPE_WKUP) {
+		exynos_eint_set_filter(bank, EXYNOS_FLTCON_DIGITAL);
 	}
 }
 
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl/samsung/pinctrl-exynos.h
index 2bee52b61b9317ff79c618c1dc53e98242805087..362dc533186fb4ab9926b38b8d34af07690f783d 100644
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
2.49.0.504.g3bcea36a83-goog


