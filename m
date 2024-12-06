Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E38E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 16:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uFUL3kCwx3cUbzg7B5UVd/jZ4AQMlp0js1yIPxGumCU=; b=wIYcirNHsT867Sn9RUP7ZLI+0Y
	2xb1f4Gq7YOkxGAV0qZGVdfdmIc1aglLEuBQg3iuudqNy0L+7C+NIpjZPvd0rx8C+VyQhdQq8zedv
	I4G9PSmRzcHtd7sdVxIx+OhtjCv0MLU7dVBQvgxTyxNs1llomr4aolSWSvcosH1hNNiB4mZLVE//n
	JKbBQ5pOktNBuGlkj2fCM8RxB1NymsMFO0hwWmh1DcEj+eXG0JSDErzO0aOuzn48v8A0xweLhUwY2
	BV+rbm2b/1QI2sag0+qeVlnjq/P/jFNE9s3Ncs9K7jU28DKmF4bKIcmxbmVpjbwlAtPGSqMxjAZX1
	DB3x2qDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJbMR-00000002CYj-0ZQ5;
	Fri, 06 Dec 2024 16:39:23 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJbER-00000002AG7-1aZS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 16:31:09 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-aa642e45241so115210166b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 08:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733502665; x=1734107465; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uFUL3kCwx3cUbzg7B5UVd/jZ4AQMlp0js1yIPxGumCU=;
        b=U1RMAdwDHmwwJ/9S4iAJ+o3H7Q8+HWcWVhzfwXmQH7fLJrl6Ju+KdIULNhQw9jCnXf
         QGy2vOTod93SGUxi2uyDXJR+hf3iijB52xzt7d5kzPuGHjPL0iqYUjyOuxPnC1h6TdBV
         ttE56Z197btBsm3o3/ijmt0Gl8q3l49JKqdhvQ/3hQTuGVxDx2fDGInUc+AhYO1FDF4X
         mQhzuHG8IgocPVD7s2jgd325ax2cFP3t7WbF70fTXQt6O+RknCX6cFShd3yHuJU1oEwf
         qcWzb0X5rYjNKNuIKv2KqP4Jp38tJGiJ0ML3x6cQ/Isf/kPTbLhTSaDT4Fp5JVl6Ymoy
         lL4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733502665; x=1734107465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uFUL3kCwx3cUbzg7B5UVd/jZ4AQMlp0js1yIPxGumCU=;
        b=EP5e+Jh6ek8FQUQUK1FfAcOgSP/iIvVtFRpPYERlsz64t6jJ2yVEi2nmQl3bh8l1Cc
         tlenB3ws2zef4GCGASwmMmciXwVFgqikKZwJKQ+Cb12lrhc2hB8TFwPPRm2qAyIOIsAU
         yD5bLZ1prGW4leptRaVmwXzwBgYCdZE3Ytiro4EI4L/+ua4ic/ks+PQlVj1x8vS3zXa2
         GdfqRRMZdmSXEvR8IhMo8sIaAdTeG0a2MMGPpua+XDwQD97Eshpk9rCwI1dOpIlzwc0P
         J52LxtKkJhPS2Zm4RlXKWrsqUCfEBPHrVF1OxvWeQLO8jUiV0+vUJgP8V8a7zla8iIlh
         cM/w==
X-Forwarded-Encrypted: i=1; AJvYcCUUafoEUczOXh42sQyiNSJkzeYPQRUfqm8es2BLd8zlV6y9pWMXRzkdTb7kFs/wWjHxxX+D0Wf8FFeJjN+EzS1b@lists.infradead.org
X-Gm-Message-State: AOJu0YyBgbCBt8SNaO/PXk/n5fNqeZLe8jSfD449jUTKR8b2nrhk9UUo
	nSneQE4riG55IFkUljNbr5BcoUuSYsiA9tNRgrK/yaploKLvlK3nsgVXs4GmPXc=
X-Gm-Gg: ASbGncvpwHiY4p6h+UYImdUCX0g8SjJr9cQQLLM8LdSUCGs7ncNq3q0C/B2x1/wUt+G
	faiz0V/8h9zibiKbHWJdaiuMuXCruPUtzlXBLG6WYU3KPxqGktfV6F/lBuaaUfa/mKq5BLdhLgq
	2gsohRZawgQVsqhoQuCNEZYQCPvvBjG6Fqv/oN6/azcGi0zabUywFllRsGnsWLSFbXpDnFBPlgS
	qVvx6D/fO5K1PAGSoslFRTv3GI2jTB+BG7iBDQFiMY+3L/HLtYgNpqELxqvC9g7l/GhObim1CuX
	Tm+nW4qj9FWyeeY1cJZXMYmPAutSH+wygA==
X-Google-Smtp-Source: AGHT+IFdGgwrC3n71nQi/9MjgKXvQ3xt8s29XoT1ICJHQ14fSF1EZzWFJtu/VD99oVNhBiVQ1DgX2Q==
X-Received: by 2002:a17:906:310d:b0:aa6:2ff8:d62d with SMTP id a640c23a62f3a-aa63a2419ccmr313287766b.45.1733502665369;
        Fri, 06 Dec 2024 08:31:05 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6260e8af8sm257710266b.191.2024.12.06.08.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 08:31:05 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 06 Dec 2024 16:31:07 +0000
Subject: [PATCH v4 7/7] phy: exynos5-usbdrd: allow DWC3 runtime suspend
 with UDC bound (E850+)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241206-gs101-phy-lanes-orientation-phy-v4-7-f5961268b149@linaro.org>
References: <20241206-gs101-phy-lanes-orientation-phy-v4-0-f5961268b149@linaro.org>
In-Reply-To: <20241206-gs101-phy-lanes-orientation-phy-v4-0-f5961268b149@linaro.org>
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
X-CRM114-CacheID: sfid-20241206_083107_434771_3EC0EA8E 
X-CRM114-Status: GOOD (  14.85  )
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
v3:
* update exynos5_usbdrd_orien_sw_set() to not test against previous
  orientation
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 50 +++++++++++++++++++++++++++-----
 1 file changed, 42 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 8fc15847cfd8..bac1dc927b26 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -1137,13 +1137,15 @@ static void exynos850_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
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
@@ -1404,9 +1406,41 @@ static int exynos5_usbdrd_orien_sw_set(struct typec_switch_dev *sw,
 				       enum typec_orientation orientation)
 {
 	struct exynos5_usbdrd_phy *phy_drd = typec_switch_get_drvdata(sw);
+	int ret;
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


