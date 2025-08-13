Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B18C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 12:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jPQecaBa2ZbQtikCUaWiWmxdWG34bpxT6oauUx0D2Cc=; b=1r2M1r+5UE5e+BnGc9CcqqGU8F
	b9+9e08Kyd48yNPvuBfexycQWlim4CEiCfVl+IwBHuyeT87KcFUsuipff0U1WJzjYTeTguIqVwoLh
	S5xZA5CR2cMRFVrEzCI9mZ8U+mRWfJBF5xfQhCjPGrA11V+goVgPq5KxNsUrozEGFPGNJrNTs1OCq
	J8KziKMW77BjJlId0rXvGky6qsfqL1QbUcNfAoWcjVxAGBQ8V/XbWuPei/8bMpK27MNnQNleCKt6c
	Yj/rAa0b5MvwxpagXq/jM04x2qSYDLqG7Voj9mzz5wVL74o1HRR6SJxOUHrXY0KtPCdCtz4brteEe
	nt6IEEuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umA9A-0000000DaE4-16cq;
	Wed, 13 Aug 2025 12:00:00 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um9Df-0000000DSFp-323M
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 11:00:36 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-af93c3bac8fso906279866b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 04:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755082834; x=1755687634; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jPQecaBa2ZbQtikCUaWiWmxdWG34bpxT6oauUx0D2Cc=;
        b=IM0ZaUqZ1sgqEBbs3GsMVx0TSv1hnNJqFFnsP1Oj/oqXnEMWWN8xShyEj+sZQKPCtC
         A6uZie0qJvQje9aFFZ7AreYEqf8UKaVc9A2tknollZfqDbP7ZMYqW7OsBlmuOTU+UHnB
         FBKGl48Z06y7gksbNAk1siNkdXQ+eH+fzUW7LQ1pBmKs4auM5BH4dHKKkVcUSBvrPOw9
         HYr3mG9Zo5f6q6d8FVHbcwIxWGAk0t1uKkdzjz4r3O/clwI0wyzt2J9HKHcq6boPWt/t
         GBb1iaIOo0nadurQkKvmNV2kN4kGBjyn1YNzgDC6pZxMlkaX15mE0vMUNmkZG7NpnmI+
         QG9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755082834; x=1755687634;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jPQecaBa2ZbQtikCUaWiWmxdWG34bpxT6oauUx0D2Cc=;
        b=U4vNBdy7OL3bLzOkLjGd1UPRjDcIMVourUnzh2Hsx2tTO+ZEB+p+GBUOGoE951BbkG
         /uUnOLqUbVUl3Gx95qFhzeotk7dx43uy2EdMuTdpO/EzuyjEqtgGuavqMz84JuL8elWq
         AJNe7Q6IXJC948WlCcxyyXFfZm24QF7AD9qMGzHWg/2K7q094xMkm+CJ2nv05NGnQWh1
         oeoLhK8sSDf5gj/Exui+bICLrq23qcCPQevdm8ymWjQYYqkPsOKurgR7QpxjQGkYaCJZ
         /KqcouxnduiWKBVolGSFYf/7E2cFfUQACnqSS/CYvUZgyVmeWzE7ZYCSAru3mAXWPRk6
         o5/g==
X-Forwarded-Encrypted: i=1; AJvYcCWN8SnnxDSPReYADbbivi4oS3Xvvdyp4uwrT/Ek1/atCdDn230uqoKBlN7eZGsGNusNWa9wIxO6Ugb0dBReD7md@lists.infradead.org
X-Gm-Message-State: AOJu0YwN1XRYorO8t0Qi+6EHClPgqe9KHNZ2Qp+sM3tMh8qcTOXeVW1d
	09pEf4dLgiECV2mTD4XiBpTyKNofQiSCNLAexdT8QCkENsjXWC2kcTNe
X-Gm-Gg: ASbGnctlBcBPBpIHFFcaTFdJUc2MpMRPNf3I/t2YQGFwcITHPhoaFQTZlIWVvA5D3S7
	7u17KZqChFsKRPsMU804c0TacxxJhiLsG9EbeKGcC7ARw4K/8xfWEyRtZ2NVUvc6eHmclC4NvES
	qamw4WfF7zgM1EAHN7HrSDdCBSr7GvzwkuOz+k9Ay1XhL3fuWnQHZ8m1XDqVYYqhRBiGtvla3kR
	4pQmDL3RR7f+1S1p7ojJI1U9NBzCL2oXLhfAAF/21qKd1G5lozQuvQ4FI1hAc7nHGaWH6lgTWjS
	YqTxREOMx/7Px+Yfb/4WMCLCYPxsMdu+5QJTpkYGFhhLxYLDIu+8cv4dqSIb3dhyE4VSmsi+S7i
	iZtnUqUvSpZ43CJK9veBr5quwW0AzmqlMqxi/my6lMhgLiq3HEE8DPVtHGrTVjZPQ5A56AmhGmM
	/gyKot
X-Google-Smtp-Source: AGHT+IFygjdX4zks77zDv5lXPN6A8NVx7lOIanCSu8uh0ZExHtyqNilgf2QwtI9ylVeq3rYeVw0p4A==
X-Received: by 2002:a17:907:2d2c:b0:af9:8d62:b1ab with SMTP id a640c23a62f3a-afca4ccded9mr301187966b.10.1755082833843;
        Wed, 13 Aug 2025 04:00:33 -0700 (PDT)
Received: from tablet.my.domain (ip-31-0-121-4.multi.internet.cyfrowypolsat.pl. [31.0.121.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0df10asm2377046966b.59.2025.08.13.04.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 04:00:33 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Wed, 13 Aug 2025 13:00:13 +0200
Subject: [PATCH v6 7/9] clk: bcm281xx: Add corresponding bus clocks for
 peripheral clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-kona-bus-clock-v6-7-f5a63d4920a4@gmail.com>
References: <20250813-kona-bus-clock-v6-0-f5a63d4920a4@gmail.com>
In-Reply-To: <20250813-kona-bus-clock-v6-0-f5a63d4920a4@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Alex Elder <elder@kernel.org>, 
 Stanislav Jakubek <stano.jakubek@gmail.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, linux-arm-kernel@lists.infradead.org, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5998;
 i=aweber.kernel@gmail.com; h=from:subject:message-id;
 bh=I4wRN3KkFekGNXMWJvTYQVypbn2IQ5ZoSclWcZEKoiY=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBonHA+8AUsepJbdIVrRZk3+xeY2c74BI9jKew0E
 ivHMgKs1LGJAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCaJxwPgAKCRCzu/ihE6BR
 aD3pD/93RapZiPZaEaoSCv/y7TXThVF1EnX+u9QI1P8FFlzMgPLVAPDVZyBAfv6cBHGl3CHbBZG
 sKqmdLzOH7fR4HNfnUevaBN9WOiyCyds/zt5BmGm2d03g4ePHuPyAZcm66gCRSCY17laQISc2yv
 K0wQ4GKlDYkHp5zfpaQMIJsV3t7oKMwVxV4l5c6iDeHecoEjZncgD2KGK8mpvughUaoVJ3RNIzx
 mCUh7VjaXRp5AmxQE9VmRrXZE5I18n1EEqxfFZ3fBTZIMv40AqtBd81aCfPTKN3bcMaXewMtEgk
 tF4WnOS/tkE6fJFUa/KDjT8b+1onYDEqGA2cFNT7+6P+PrWyuMhVikAPvcgyHJZwrG5C86q3F7I
 vA6ExpJj/t0AUkFt4qgxqJrumGWrzOZOY5DGXolzVRUtx58iLxFUsbUB/e2XLGtABDhEs2tYOAp
 P0snT/iMC4cf6Y4sPnGz/sv7Cs17Y1XXNqnutNDq96MGl5S3aCR2UuTdz6ItBLBVFEU2PiwsSev
 W/WUpvVgj9EbPctOjX1a0I1yFLWBN5Th3J4R+97LF6jY5s624r2IFx6C1XxfoeFYTRXtuyv/YXS
 gaNPpza0XfmKe4xYxVEeHhX17W5NCcEVu17l2Lpqg6xsWke+TNcjERbWHYHUVqpJv4Ukq+Xe6rH
 UwLJBrY75KDLSzw==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_040035_768168_F810AF92 
X-CRM114-Status: GOOD (  13.08  )
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

Add bus clocks corresponding to peripheral clocks currently supported
by the BCM281xx clock driver.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v4:
- Adapt to CLOCK_COUNT -> CLK_COUNT rename

Changes in v3:
- Adapt to CLOCK_COUNT defines being moved

Changes in v2:
- Add this patch (BCM281xx bus clocks)
---
 drivers/clk/bcm/clk-bcm281xx.c | 127 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 124 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/bcm/clk-bcm281xx.c b/drivers/clk/bcm/clk-bcm281xx.c
index 62c3bf4656259261ae4f7d81dae48c90ab26c04e..13fd8a5ea8fa07bf6f3cca83b6b18e59a8de63df 100644
--- a/drivers/clk/bcm/clk-bcm281xx.c
+++ b/drivers/clk/bcm/clk-bcm281xx.c
@@ -59,7 +59,17 @@ static struct peri_clk_data pmu_bsc_var_data = {
 	.trig		= TRIGGER(0x0a40, 2),
 };
 
-#define BCM281XX_AON_CCU_CLK_COUNT	(BCM281XX_AON_CCU_PMU_BSC_VAR + 1)
+static struct bus_clk_data hub_timer_apb_data = {
+	.gate		= HW_SW_GATE(0x0414, 18, 3, 2),
+	.hyst		= HYST(0x0414, 10, 11),
+};
+
+static struct bus_clk_data pmu_bsc_apb_data = {
+	.gate		= HW_SW_GATE(0x0418, 18, 3, 2),
+	.hyst		= HYST(0x0418, 10, 11),
+};
+
+#define BCM281XX_AON_CCU_CLK_COUNT	(BCM281XX_AON_CCU_PMU_BSC_APB + 1)
 
 static struct ccu_data aon_ccu_data = {
 	BCM281XX_CCU_COMMON(aon, AON),
@@ -70,6 +80,10 @@ static struct ccu_data aon_ccu_data = {
 			KONA_CLK(aon, pmu_bsc, peri),
 		[BCM281XX_AON_CCU_PMU_BSC_VAR] =
 			KONA_CLK(aon, pmu_bsc_var, peri),
+		[BCM281XX_AON_CCU_HUB_TIMER_APB] =
+			KONA_CLK(aon, hub_timer_apb, bus),
+		[BCM281XX_AON_CCU_PMU_BSC_APB] =
+			KONA_CLK(aon, pmu_bsc_apb, bus),
 		[BCM281XX_AON_CCU_CLK_COUNT] = LAST_KONA_CLK,
 	},
 };
@@ -178,7 +192,36 @@ static struct peri_clk_data hsic2_12m_data = {
 	.trig		= TRIGGER(0x0afc, 5),
 };
 
-#define BCM281XX_MASTER_CCU_CLK_COUNT	(BCM281XX_MASTER_CCU_HSIC2_12M + 1)
+static struct bus_clk_data sdio1_ahb_data = {
+	.gate		= HW_SW_GATE(0x0358, 16, 1, 0),
+};
+
+static struct bus_clk_data sdio2_ahb_data = {
+	.gate		= HW_SW_GATE(0x035c, 16, 1, 0),
+};
+
+static struct bus_clk_data sdio3_ahb_data = {
+	.gate		= HW_SW_GATE(0x0364, 16, 1, 0),
+};
+
+static struct bus_clk_data sdio4_ahb_data = {
+	.gate		= HW_SW_GATE(0x0360, 16, 1, 0),
+};
+
+static struct bus_clk_data usb_ic_ahb_data = {
+	.gate		= HW_SW_GATE(0x0354, 16, 1, 0),
+};
+
+/* also called usbh_ahb */
+static struct bus_clk_data hsic2_ahb_data = {
+	.gate		= HW_SW_GATE(0x0370, 16, 1, 0),
+};
+
+static struct bus_clk_data usb_otg_ahb_data = {
+	.gate		= HW_SW_GATE(0x0348, 16, 1, 0),
+};
+
+#define BCM281XX_MASTER_CCU_CLK_COUNT	(BCM281XX_MASTER_CCU_USB_OTG_AHB + 1)
 
 static struct ccu_data master_ccu_data = {
 	BCM281XX_CCU_COMMON(master, MASTER),
@@ -197,6 +240,20 @@ static struct ccu_data master_ccu_data = {
 			KONA_CLK(master, hsic2_48m, peri),
 		[BCM281XX_MASTER_CCU_HSIC2_12M] =
 			KONA_CLK(master, hsic2_12m, peri),
+		[BCM281XX_MASTER_CCU_SDIO1_AHB] =
+			KONA_CLK(master, sdio1_ahb, bus),
+		[BCM281XX_MASTER_CCU_SDIO2_AHB] =
+			KONA_CLK(master, sdio2_ahb, bus),
+		[BCM281XX_MASTER_CCU_SDIO3_AHB] =
+			KONA_CLK(master, sdio3_ahb, bus),
+		[BCM281XX_MASTER_CCU_SDIO4_AHB] =
+			KONA_CLK(master, sdio4_ahb, bus),
+		[BCM281XX_MASTER_CCU_USB_IC_AHB] =
+			KONA_CLK(master, usb_ic_ahb, bus),
+		[BCM281XX_MASTER_CCU_HSIC2_AHB] =
+			KONA_CLK(master, hsic2_ahb, bus),
+		[BCM281XX_MASTER_CCU_USB_OTG_AHB] =
+			KONA_CLK(master, usb_otg_ahb, bus),
 		[BCM281XX_MASTER_CCU_CLK_COUNT] = LAST_KONA_CLK,
 	},
 };
@@ -309,7 +366,51 @@ static struct peri_clk_data pwm_data = {
 	.trig		= TRIGGER(0x0afc, 15),
 };
 
-#define BCM281XX_SLAVE_CCU_CLK_COUNT	(BCM281XX_SLAVE_CCU_PWM + 1)
+static struct bus_clk_data uartb_apb_data = {
+	.gate		= HW_SW_GATE(0x0400, 16, 1, 0),
+};
+
+static struct bus_clk_data uartb2_apb_data = {
+	.gate		= HW_SW_GATE(0x0404, 16, 1, 0),
+};
+
+static struct bus_clk_data uartb3_apb_data = {
+	.gate		= HW_SW_GATE(0x0408, 16, 1, 0),
+};
+
+static struct bus_clk_data uartb4_apb_data = {
+	.gate		= HW_SW_GATE(0x040c, 16, 1, 0),
+};
+
+static struct bus_clk_data ssp0_apb_data = {
+	.gate		= HW_SW_GATE(0x0410, 16, 1, 0),
+};
+
+static struct bus_clk_data ssp2_apb_data = {
+	.gate		= HW_SW_GATE(0x0418, 16, 1, 0),
+};
+
+static struct bus_clk_data bsc1_apb_data = {
+	.gate		= HW_SW_GATE(0x0458, 16, 1, 0),
+	.hyst		= HYST(0x0458, 8, 9),
+};
+
+static struct bus_clk_data bsc2_apb_data = {
+	.gate		= HW_SW_GATE(0x045c, 16, 1, 0),
+	.hyst		= HYST(0x045c, 8, 9),
+};
+
+static struct bus_clk_data bsc3_apb_data = {
+	.gate		= HW_SW_GATE(0x0484, 16, 1, 0),
+	.hyst		= HYST(0x0484, 8, 9),
+};
+
+static struct bus_clk_data pwm_apb_data = {
+	.gate		= HW_SW_GATE(0x0468, 16, 1, 0),
+	.hyst		= HYST(0x0468, 8, 9),
+};
+
+#define BCM281XX_SLAVE_CCU_CLK_COUNT	(BCM281XX_SLAVE_CCU_PWM_APB + 1)
 
 static struct ccu_data slave_ccu_data = {
 	BCM281XX_CCU_COMMON(slave, SLAVE),
@@ -334,6 +435,26 @@ static struct ccu_data slave_ccu_data = {
 			KONA_CLK(slave, bsc3, peri),
 		[BCM281XX_SLAVE_CCU_PWM] =
 			KONA_CLK(slave, pwm, peri),
+		[BCM281XX_SLAVE_CCU_UARTB_APB] =
+			KONA_CLK(slave, uartb_apb, bus),
+		[BCM281XX_SLAVE_CCU_UARTB2_APB] =
+			KONA_CLK(slave, uartb2_apb, bus),
+		[BCM281XX_SLAVE_CCU_UARTB3_APB] =
+			KONA_CLK(slave, uartb3_apb, bus),
+		[BCM281XX_SLAVE_CCU_UARTB4_APB] =
+			KONA_CLK(slave, uartb4_apb, bus),
+		[BCM281XX_SLAVE_CCU_SSP0_APB] =
+			KONA_CLK(slave, ssp0_apb, bus),
+		[BCM281XX_SLAVE_CCU_SSP2_APB] =
+			KONA_CLK(slave, ssp2_apb, bus),
+		[BCM281XX_SLAVE_CCU_BSC1_APB] =
+			KONA_CLK(slave, bsc1_apb, bus),
+		[BCM281XX_SLAVE_CCU_BSC2_APB] =
+			KONA_CLK(slave, bsc2_apb, bus),
+		[BCM281XX_SLAVE_CCU_BSC3_APB] =
+			KONA_CLK(slave, bsc3_apb, bus),
+		[BCM281XX_SLAVE_CCU_PWM_APB] =
+			KONA_CLK(slave, pwm_apb, bus),
 		[BCM281XX_SLAVE_CCU_CLK_COUNT] = LAST_KONA_CLK,
 	},
 };

-- 
2.50.1


