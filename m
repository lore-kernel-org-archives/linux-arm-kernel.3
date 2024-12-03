Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B30BFE64A84
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 12:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uFpsvHW8LAP7lW2ogoOJaMBxsAjFS0igr/BkJ+LMT9c=; b=o4tNti3mtTxhmbJGfWbK7l2eYJ
	zlPpOXWf9HWKkTgPW3sR+ll++eJgFBXEcaNAk0+5HT9DWm9ZdPaPYkxBp45W7JrypOZ4kNulIiybM
	uscjAYfqhrnE6pIk2QZ8ux1t+3bGO/gVEMgUTYmMtDXs4omksgAbeuAti6v4yug6TXaeo4330f9Fk
	plTgVqW7oHNdaCwMywPfSxbjVb+r5YZVLxID3sr8R3Yc3YCSEjCJljBo1DAr0S3fDCS8EtNcHz+mp
	X8OaBpViBYYqqRjYTP64E2ofYCXYoXWoC1uayifSLYj5nWhrleaHVDsTjvouzoUgnKst6qD1t41Po
	awN6ocvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIRvg-00000009Pla-07B8;
	Tue, 03 Dec 2024 12:23:00 +0000
Received: from mail-ej1-f50.google.com ([209.85.218.50])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIRmv-00000009NiL-3PNG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 12:13:59 +0000
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aa5f1909d6fso140855666b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 04:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733228035; x=1733832835; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uFpsvHW8LAP7lW2ogoOJaMBxsAjFS0igr/BkJ+LMT9c=;
        b=FfT1xiOvqPM07Wqtgxivikd+AlZmNLDoMT07+8NQ7YSZl4lROIgkUqM1wCFuqM60MB
         pxwVEl+ewohg9tFxrqH3L+nVxnVfJGv9KLFqlnxISKf2NGSOBgE9vml3qOFO8igH0E4w
         ksA1lZAe/zpvk4f1y2C06U7aTCmjoKcaf2NrWcdjdwcAntzQRwBNPJOkYcEjOYXfLIOi
         1xAWlbcrDTc55qRor56Xqj9DBfRKrREwCTHQkxSQIpIU0d6WZWR5+OMXqVUuNsUvNyAX
         ofq4EXMAbYarc0CaVDaAG8wjKYBpIT/kRwIXumBdk0MltIst1e2/xeNRmNgrLqHxaX+1
         1wZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733228035; x=1733832835;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uFpsvHW8LAP7lW2ogoOJaMBxsAjFS0igr/BkJ+LMT9c=;
        b=miCn6xUjiiO4yBQbhNdCBx5T+S8WhElV/tVsJHjYhQvOEYzNJ2m6zUu6wiZgw7jhYW
         wRvTkiPFLkbvaK7BdP/783WmdSgIZK1bOxRwlJfj5Yp0tuwDalFTThdh8hVZT4e5y70G
         mrxiP0iKK8CGkXSTw+Iz4KDJDByjr4A3NjHEasm+g382fjKrv+ZttkEy8r0AFsOysqbe
         AttHm6U9dL8aykTzlvFVk5WQ2AQitV70hJ9iEaMvbQJaRnu3KRBlyUydkiSYEL+l7ZFd
         T0ER3+4HRrY5OIYwYxzFqiLZ3JfY5dprXCE5tJVFh6B7TJQYt5K/JQSgMI7a13sDAAWA
         zirQ==
X-Forwarded-Encrypted: i=1; AJvYcCVU5U/N38o8XWjhWT1cD4hG/E/3wjEeIfu1DlTcIlGrf+U5iGHZUDIk6z035nnxPL9p/gBRb8X6jd/nGhsgDobv@lists.infradead.org
X-Gm-Message-State: AOJu0YzfMoGRq4RzRnSW6vHIzq05EhDGAjl6XB7qLb/MqN64itW2u4X9
	axhT2GBPijInIpDuNapY67VaQzoCUZn31ft+Sz0lKXEmDc0n4GRTWfy6xadlagc=
X-Gm-Gg: ASbGncuI0BQNlXbZrtem0x9hecjcSVv2Oa00pk9FG2uetbIv0+tRFuwFFmUXPZ22ZT8
	GW1w6fN/ntfYuQQ3js0M9yLtjzVHc9F2Jgzdx1P/wEE8AXi2hz6kDi1tTqfu0PUDn4ID/282yzx
	IpFgDEKyC5JCZxn+r5ktiKchv4VqQ4YwX2/U3PHOJb6X1WBVQMKDxxqlq36Ej+ZWgRGNH/HaLgW
	LnWgE4ZHiCoP2DaiQKK/kYWMJBB6TMjyXdzkWUyTeVcZP799mz5psajW0SQu7WCViVHDVLEWhih
	jbnx7pNCTeHNRAAKGVS/dfDhdaYBvmdM7g==
X-Google-Smtp-Source: AGHT+IGdrwALKg1GTwldZJOY7VYAVcWh5tQKqLrkKr8AXomCGAvvPrif7tTk5yapUjTCTN1a7cYNbg==
X-Received: by 2002:a17:906:4c1:b0:aa5:427e:6c76 with SMTP id a640c23a62f3a-aa5f7aaed08mr164681466b.0.1733228035286;
        Tue, 03 Dec 2024 04:13:55 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5996c245bsm607603766b.8.2024.12.03.04.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 04:13:54 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 03 Dec 2024 12:13:56 +0000
Subject: [PATCH v2 8/8] phy: exynos5-usbdrd: allow DWC3 runtime suspend
 with UDC bound (E850+)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241203-gs101-phy-lanes-orientation-phy-v2-8-40dcf1b7670d@linaro.org>
References: <20241203-gs101-phy-lanes-orientation-phy-v2-0-40dcf1b7670d@linaro.org>
In-Reply-To: <20241203-gs101-phy-lanes-orientation-phy-v2-0-40dcf1b7670d@linaro.org>
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
X-CRM114-CacheID: sfid-20241203_041357_894147_E43C32A3 
X-CRM114-Status: GOOD (  16.03  )
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
index b1914c6c806d..94e4f78340ff 100644
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
@@ -1408,9 +1410,44 @@ static int exynos5_usbdrd_orien_sw_set(struct typec_switch_dev *sw,
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


