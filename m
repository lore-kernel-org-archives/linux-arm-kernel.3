Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F100D609D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 11:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lqGYeTvXa+CcRrauQewHltxn0fZOtsvS5bEzws0xGp0=; b=j/RTINaidtLMF9ExQVkBsDZTcR
	br2ShOVFSvTtUenSLdFUftefWyVKDzEhe2Cl7ZwK651v8lge1oBwLSl330KvTXduBqmTDcQkBd3uT
	vtlq3er5in06OcurQ6QIM6Ce423MRh52LsxRHSP5guxfULOLjOPGJx5KSbdudEGLAIg3V48695E/o
	H1nYPYavV5Blfg8SWZDHrfuq2QuMAPSiItkKQLWTbXERLMEtIzOLqOP0pmdO11DfuLyGjBFpGV2rz
	qiKB+W09W2eUsDc6sITrBXy9es+jnDzT8ty+yVFNkmXIAJT4XTpDtJUhBDb7hg1ZtPa1R1kdTtrB3
	VYLgztmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFtr-0000000CxEL-3p6Z;
	Wed, 27 Nov 2024 11:08:03 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFkQ-0000000CvFt-1qrH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 10:58:20 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5cedf5fe237so7796481a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 02:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732705097; x=1733309897; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lqGYeTvXa+CcRrauQewHltxn0fZOtsvS5bEzws0xGp0=;
        b=ChwcpSN7ifaKh2FA+c00VUcGJPXF8iUT9hyHdgvMZ11Mmjn6O2lYpneRnIkddcDBlR
         LMRT1WcDx/Cl7sDuO9dJm2Xgw5g0scwsN+CTW33V9QOJ9LKv+jRPXieE4DBU5NCaWihW
         FSgCsfH2jx/ubJGwC8b0K3HwciLZc5ao/DYzjZII3KTWA0zgEJXZV1GVPYmjkV+WRHWw
         7PgUXL9f4uQPAb3mPBZAX/8FhkvIH9tN40WRfSkfNA1fB9e18XIpsLN2Tq50xWzaYUVi
         4Rtou85fXATcK09rCYodi23h/F8A+Bwo9baU++sKB+ONtN+zAux8zV2wto6V/bL+iPxU
         umHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732705097; x=1733309897;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lqGYeTvXa+CcRrauQewHltxn0fZOtsvS5bEzws0xGp0=;
        b=tgiBVcyH//m5Ph7D3Gvd2bfQ1IWIiyZNkwRFKjmx0STnTImEe/Dph9hniEE/7DEZKX
         G/3BTmg0bovF81qhWbf7/ECyyqSplryed/AsnRd5uwVq/6WZJ/24SSp9e5g2vRfeEPEk
         YQwxPfUsaG+Q7c1W3CWSgyRWDUYOw4yCBBZCZ+qEo9KdLNPzmquxBZLC7j9wXtPsX/gM
         E/KS/vGfqkWcxyG6eUwJ5AQHk9wnYzhS0/7oejIzAK/1hqlK6/mmMeObJnqzdX4T8ufm
         vBF4C/vCKG5zTlNwYeq1MFXmuH0wmd/l76xOYlMmCGIWVZPKlc35IL3HnAJxxUMycOyh
         bLMQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7GhS4w+vivwIdQ7CmuJH8vOCqm94zc7uOs5w0aJ7OTbpby/CyX4dSr2tw2MwB7QfTJxcdFxiiaSig4exyVO1N@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+qEFND6nSjXNDXrzp/JjaCTEfYXgua2xR+VlLYjnhmGzXdZc4
	kSWyQ6mOSnHBxmrwYA+q99wJXjWyIJlfckG2VNrJWM/Q+L/aCF0fELWr0tL+lMA=
X-Gm-Gg: ASbGncuen71EGfNptg7Dg5I+Ep2uDZEjCUTFUvfb/95uUtpJV/X/cLAt2c8SUYI1UuF
	byYZ0H+MpReDF19e8HBib4Sccw86tyZow85KiQMjZV1T7ubt6lRB7hcTSlesetkH/S/yKtOVczH
	RNBVU60hkbBVbERF9EQBjwdC/X1aAk+TRKUSUIuK1VvyBxi+KWsaX/g85PiMiqo+TK86LOfJUsd
	Fs4y297IDv55IWdHjIbz6m07RBcmAJsyU9l8CkaWEr8WeQcLI9JRjA4y83AHQ0xerHmB3kMzpqz
	6H3/Qrbo0G84A3SkmX3IWX/DXbR7sfPhgA==
X-Google-Smtp-Source: AGHT+IGfxl8jje43Ziyzp10Eq1Sbw1hY/V6VsB8QGc/5pAdKJlSGGUSbGZ9QxG2adkSeh2QmDqCL0g==
X-Received: by 2002:a17:907:7637:b0:aa5:4adc:5a1f with SMTP id a640c23a62f3a-aa580f58e93mr163841166b.33.1732705096651;
        Wed, 27 Nov 2024 02:58:16 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa54a6db906sm412183566b.41.2024.11.27.02.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 02:58:16 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 27 Nov 2024 10:58:19 +0000
Subject: [PATCH 9/9] phy: exynos5-usbdrd: allow DWC3 runtime suspend with
 UDC bound (E850+)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241127-gs101-phy-lanes-orientation-phy-v1-9-1b7fce24960b@linaro.org>
References: <20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7fce24960b@linaro.org>
In-Reply-To: <20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7fce24960b@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_025818_501911_6435EA55 
X-CRM114-Status: GOOD (  15.87  )
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

To make USB runtime suspend work when a UDC has been bound, the phy
needs to inform the USBDRD controller (DWC3) that Vbus and bvalid are
gone, so that it can in turn raise the respective gadget interrupt with
event == DWC3_DEVICE_EVENT_DISCONNECT, which will cause the USB stack
to clean up, allowing DWC3 to enter runtime suspend.

On e850 and gs101 this isn't working, as the respective signals are not
directly connected, and instead this driver uses override bits in the
PHY IP to set those signals. It currently forcefully sets them to 'on',
so the above mentioned interrupt will not be raised, preventing runtime
suspend.

To detect that state, update this driver to act on the TCPC's
orientation signal - when orientation == NONE, Vbus is gone and we can
clear the respective bits. Similarly, for other orientation values we
re-enable them.

This makes runtime suspend work on platforms with a TCPC (like Pixel6),
while keeping compatibility with platforms without (e850-96).

With runtime suspend working, USB-C cable orientation detection now
also fully works on such platforms, and the link comes up as Superspeed
as expected irrespective of the cable orientation and whether UDC /
gadget are configured and active.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 53 +++++++++++++++++++++++++++-----
 1 file changed, 45 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 2010d25ee817..4882158df1a5 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -1136,13 +1136,15 @@ static void exynos850_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
 	reg |= LINKCTRL_BUS_FILTER_BYPASS(0xf);
 	writel(reg, regs_base + EXYNOS850_DRD_LINKCTRL);
 
-	reg = readl(regs_base + EXYNOS850_DRD_UTMI);
-	reg |= UTMI_FORCE_BVALID | UTMI_FORCE_VBUSVALID;
-	writel(reg, regs_base + EXYNOS850_DRD_UTMI);
-
-	reg = readl(regs_base + EXYNOS850_DRD_HSP);
-	reg |= HSP_VBUSVLDEXT | HSP_VBUSVLDEXTSEL;
-	writel(reg, regs_base + EXYNOS850_DRD_HSP);
+	if (!phy_drd->sw) {
+		reg = readl(regs_base + EXYNOS850_DRD_UTMI);
+		reg |= UTMI_FORCE_BVALID | UTMI_FORCE_VBUSVALID;
+		writel(reg, regs_base + EXYNOS850_DRD_UTMI);
+
+		reg = readl(regs_base + EXYNOS850_DRD_HSP);
+		reg |= HSP_VBUSVLDEXT | HSP_VBUSVLDEXTSEL;
+		writel(reg, regs_base + EXYNOS850_DRD_HSP);
+	}
 
 	reg = readl(regs_base + EXYNOS850_DRD_SSPPLLCTL);
 	reg &= ~SSPPLLCTL_FSEL;
@@ -1407,9 +1409,44 @@ static int exynos5_usbdrd_orien_sw_set(struct typec_switch_dev *sw,
 				       enum typec_orientation orientation)
 {
 	struct exynos5_usbdrd_phy *phy_drd = typec_switch_get_drvdata(sw);
+	int ret;
+
+	if (phy_drd->orientation == orientation)
+		return 0;
+
+	ret = clk_bulk_prepare_enable(phy_drd->drv_data->n_clks, phy_drd->clks);
+	if (ret) {
+		dev_err(phy_drd->dev, "Failed to enable PHY clocks(s)\n");
+		return ret;
+	}
+
+	scoped_guard(mutex, &phy_drd->phy_mutex) {
+		void __iomem * const regs_base = phy_drd->reg_phy;
+		unsigned int reg;
+
+		if (orientation == TYPEC_ORIENTATION_NONE) {
+			reg = readl(regs_base + EXYNOS850_DRD_UTMI);
+			reg &= ~(UTMI_FORCE_VBUSVALID | UTMI_FORCE_BVALID);
+			writel(reg, regs_base +  EXYNOS850_DRD_UTMI);
+
+			reg = readl(regs_base + EXYNOS850_DRD_HSP);
+			reg |= HSP_VBUSVLDEXTSEL;
+			reg &= ~HSP_VBUSVLDEXT;
+			writel(reg, regs_base + EXYNOS850_DRD_HSP);
+		} else {
+			reg = readl(regs_base + EXYNOS850_DRD_UTMI);
+			reg |= UTMI_FORCE_VBUSVALID | UTMI_FORCE_BVALID;
+			writel(reg, regs_base +  EXYNOS850_DRD_UTMI);
+
+			reg = readl(regs_base + EXYNOS850_DRD_HSP);
+			reg |= HSP_VBUSVLDEXTSEL | HSP_VBUSVLDEXT;
+			writel(reg, regs_base + EXYNOS850_DRD_HSP);
+		}
 
-	scoped_guard(mutex, &phy_drd->phy_mutex)
 		phy_drd->orientation = orientation;
+	}
+
+	clk_bulk_disable(phy_drd->drv_data->n_clks, phy_drd->clks);
 
 	return 0;
 }

-- 
2.47.0.338.g60cca15819-goog


