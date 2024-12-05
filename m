Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 944C6E7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 07:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nLOfMOwPIHBPvbwfjRUM/XHx6oKInvatLpnoOXJri+4=; b=AXTAXyTXYsOqhghjnbIO3FShXt
	VAxColtn/q4StVIhiWMks1LzNRPQIajTIY5k0uhgsvYL1EBxoF+Kp5AfvytKi95lyLYoQmnEEB0FV
	47Q4BVN8RutbXE+dEKb3yflqNTjQfcLAWybPtZgjx/lzr1hHUtMBXlys/qFgucMYC6AZ0CS29AnmF
	4UczrtEDSJ2ddc/63w8B2jcGwCEU+TqerwRaDrTWNmI1NAkDPhbK5F3HW1jS+b+ZMBGbXiK/Yqi/I
	rYzfc1WMfQmRxDExwzg7MqvfhCV/UmantfygfVcOQsknUs0dphr+B5sCW/rIZ7qVsZ6QXsYUlWsi5
	JVDDdkPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ6Ro-0000000F3JI-0nLZ;
	Thu, 05 Dec 2024 07:38:52 +0000
Received: from mail-ej1-f41.google.com ([209.85.218.41])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ6MR-0000000F1k1-1eTD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 07:33:20 +0000
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aa578d10d50so82171666b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 23:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733383997; x=1733988797; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nLOfMOwPIHBPvbwfjRUM/XHx6oKInvatLpnoOXJri+4=;
        b=fr2gXkc9eQm0dCvf1bS3I0Iwy2jAeAgVNW6sUqgTaseOxR5+YBWGEAHkE4kGwyH7B+
         /bsrTQgpn+zjcOB8kb3STMO/1aIOClyoDdmoat4P7rp6arNUB5P406KIL48zcuY8ufoi
         AWFugAoi3Qg/yBJsqmTF5aTNayWQAJQYLk5Ay24LcHMFXb6y92liqqIy3pbpQ5AYDyMC
         cWaCYD/AVoNwPcvtxyvEqB5KcbeV9PaD/r+sNAoNxVEvrgKqUwKWR2svSv2U4bu7naZx
         dBeb05Amnwps6QFLI7Ij8zRcdkrSG7CDKJbSAENNAMm2UkYyQf020/DOblOhkKep0MjR
         wTrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733383997; x=1733988797;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nLOfMOwPIHBPvbwfjRUM/XHx6oKInvatLpnoOXJri+4=;
        b=KuEBTnfLnugQV9g2dcQYIIJstdnfMLU86GxAFz41zMWYDBIndqrblK9K5Hs3LMdtCV
         oyBf6wQzfbyKlg7fe08bofCRYDzuJ2LCn89QgCHrQxBslcfJCODh3nIV5fOV/5469+tj
         +9tO5SMudvPmugDXobgrW0xPk5UEB1XF0eanqpm+aRm2So6MpQSqPneOmQubougEWn0Q
         ifUKsBZ8Wl3OdESbTp1W9xY0qhhdQEKeZI5wqBeD79TU6etdo47BxiBAxWRCQM/C5fyN
         lY0UUiEtfOaUCK5KZS1b/fnxQ/wiLK0zNIOpr4hIkUwMZXh7hJZbKGBdhBw2T6IzKfDk
         HwYg==
X-Forwarded-Encrypted: i=1; AJvYcCU2UTgggIHQif9DAf245wrEA2GgfgM1j16S/6PUSh926OxfuqWrC4RrlWuIGP4BMwg+qvaOp/VnXrXqBko4uk1d@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3cCLfPXXuAHTEpiV7oQ9gbnFsPsGcEapG5bStxsZV0GndfTF1
	RY2jW86gak8F4WAzGZJSdDokNtNE5Xp9XDvJQ2CR6I8Csz7PVqJAoIXzmON5Dpg=
X-Gm-Gg: ASbGncvKkbbPpPrJEorC/xdPYo4ARumfyS+yU+/SHywQ0YR1iPjjbqQEk9wRybofTNX
	DSimjJz1SOg0yXd/ppBeBHhz9uh2pT0c3y4flnikVHeXf/iC0YEChwSMN9pYushcgw7kx+4KIR8
	EXIo/mz8jl0bkUv7FFDatFRux7ErmhV1KjxyKYv+B6C6gNuvZoBgucYDRf4YTcIKUGYb1Ka/GkZ
	Rpav8+uBGaM8FggyKcgiRBZNR1uv2jlXtkebSjaESBpQImYoGl7fRFDrIyysQLARK9WG0Vq0prz
	YlW+WWRZhy9fV5JdD8SrXEB10b0dEQDsfg==
X-Google-Smtp-Source: AGHT+IGCfTgApqQL3VCgsM1Ba0voYQrJI0iEao7onrk0A/1wy1VpFBbbhBWXXPKS1vKyVfQVWGrybQ==
X-Received: by 2002:a17:906:4ca:b0:aa5:f431:2960 with SMTP id a640c23a62f3a-aa601766128mr687180766b.7.1733383997478;
        Wed, 04 Dec 2024 23:33:17 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6260888casm53371766b.133.2024.12.04.23.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 23:33:17 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 05 Dec 2024 07:33:19 +0000
Subject: [PATCH v3 8/8] phy: exynos5-usbdrd: allow DWC3 runtime suspend
 with UDC bound (E850+)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241205-gs101-phy-lanes-orientation-phy-v3-8-32f721bed219@linaro.org>
References: <20241205-gs101-phy-lanes-orientation-phy-v3-0-32f721bed219@linaro.org>
In-Reply-To: <20241205-gs101-phy-lanes-orientation-phy-v3-0-32f721bed219@linaro.org>
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
X-CRM114-CacheID: sfid-20241204_233319_429662_37D2F35A 
X-CRM114-Status: GOOD (  15.40  )
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
index 6dcc3c80c1d2..ae42e299ba42 100644
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
@@ -1407,9 +1409,41 @@ static int exynos5_usbdrd_orien_sw_set(struct typec_switch_dev *sw,
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


