Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D017CCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 14:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jvcX/auKEZgjRASVFTmjnc1+2Gff5FK7VQN+0M14FnY=; b=LFwEf0H87ZEM2iHWKPTDflSwEw
	HouKhqJnsEURCsC0bsamxxxr4uLC67SPEufVMySZJCI8teWgDSPnz3FbHRXHd5o/ggrPKGd/Q+UCd
	JIBAxC2xX+hSKxa8qDyjVScBdmRf9ZT4c5q08kWMDDFK4Rdo8sVV6RIUNs/XkEU2KxRFXW0LIiwEy
	zNJdINsVzD/07eM0D9LP1LPH24CZ2jHpdf6Mg/IJQeMynJlbIo/Fq3Qh+x32AvEOa53BygH9cFagw
	sWVd30Cpw8faMXmRG7OxikrWO1A5J1E1bxB0+tLLYwE7g0Iqg6QTvBUNjdAnp96fOgtIMQk6oJ0dl
	I2qZ/c7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGIUZ-0000000C1Ai-0PtQ;
	Tue, 04 Nov 2025 14:58:39 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGIUV-0000000C14j-3OSo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 14:58:37 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-640aaa89697so4420198a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 06:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762268314; x=1762873114; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jvcX/auKEZgjRASVFTmjnc1+2Gff5FK7VQN+0M14FnY=;
        b=Y7F6yvP8j4hFnvqvcI0RiGMjeNms+V78/FR920PZwaa766uYf64Dvc+PJTOfkD3TYj
         FJ49WyABtmjVSafCdRJvKH4KVQJFIreAfpE9aqxuVPQrpj3MPza2GaNRNdT/HLp6L9vW
         EifpBfIAs2hWcUgwbEN/FADdWV9s3iNZo3Ey2N6EtZwVAlEbVRwcoJtVZU4LDT5YhT5/
         TxPaZYv5vtVnvx9nhGN/+73J24yCyv3OBOLLaejOkPo4ML4FVIRvQXQo6y3vGWu0Jlit
         we+PV8aemlvtYhAWCd9WgwTzKYA6SMMspzk2aXk0GeXEsqAczCFEQ+OsmJBFKbgosP+Q
         9Lnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762268314; x=1762873114;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jvcX/auKEZgjRASVFTmjnc1+2Gff5FK7VQN+0M14FnY=;
        b=ZP8ndqg6PbqdIIoBf7fZ5VCOaVJJ3msFoe+7hdIl1Em8rZ6hOg2cDbuZavQ/eLFz/n
         QeIoIEwPYNRrMZVvpyhPoud6FCwzdk78weYwx143p0uGOjBJE0lmERLf+ynLJZIerCRm
         mx7IdrYOJt5B4MUIynKSbY5mDVXIU62bubEWp/KJt09IMMibBlmJaWMalJuNvwWXG6Em
         ZbWxN8TvmFBWENvXnelP9bSNL7uVw/8B5wJdyIg3ORLWw+Qjb+eLUsSvxAe9tcVKHTfX
         R8rqDslLg23Lell7xHJdD8Lb8pOmZWx1nLZwxSrXbEtESihRSS2URu1wJBYx4ItlwJzt
         j9bg==
X-Forwarded-Encrypted: i=1; AJvYcCU4mTTMJFI79YNmntkzMs6FFKEL78rCdxNvXoJShFOwQr73ar1GheLiQbn/8HZkCTa37DgTO+y1xDSL0mxbZadR@lists.infradead.org
X-Gm-Message-State: AOJu0YyPVYVadvV53NsvzQxgty+5a4i8mVTbse4iEnmYxMs9vneczjz0
	/PZzv8JOyg5B2Gw840ssRCwmnaiPSMv3TiAF8K3KAmP0KaXK2B6jdjmC
X-Gm-Gg: ASbGnctywR0p0rWJKvW5VAv97HEq0XrKs+qnDjAoVNIBzu7/27l2/q5x3k/NKJVVeWh
	eIu+w+jzvkknxAdFvkuBzRhsiALs24AeY306P0alm3wzJfMkB5gTLKBg/wL3L2tv9aLt6mF0Kaj
	60HvzIfP7y4ZdW+msEWxi6p4+69MiR1mUT7n+rdAa9ahm3Zu7phBH/MCgMOVWHmu+BYqVCUREVn
	iVnRZHuVhjyvh9kKdC2r40QgC1kMPwh/WHP8nLPzAx4Fumga6FEr2Ws2mPDfJl07lgfRm55K1mn
	7CoWIJrOAxUVFH9HIfbEIVLFQfS1UD9vt2AmtGQ1KMQbal020lxRC/QW/8Kg66g/sh30yzyGTI+
	iEO0UXOnjwxaCfmpLJpEvuRmsNKXTq3ZDh1XfQTGDbge3DYmKxkTlmyslUGThaFRA5TDe4NPYT5
	voSn0Gj4oaZGf09mZnGif7alJ/Cf6OFt9fXM4GiUqCwsWi6wk=
X-Google-Smtp-Source: AGHT+IHZUUsGZGBtlaJoXWS1ySzHKciLjAZo/SuEhSLnYmO1pEob8UZ17/Np7x/XSHyNvnKfD+0P5A==
X-Received: by 2002:a05:6402:35ce:b0:640:a9fb:3464 with SMTP id 4fb4d7f45d1cf-640a9fb36ffmr9455039a12.7.1762268313877;
        Tue, 04 Nov 2025 06:58:33 -0800 (PST)
Received: from tablet.my.domain (83.21.17.47.ipv4.supernova.orange.pl. [83.21.17.47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-640e6a7fcd7sm2288874a12.37.2025.11.04.06.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 06:58:33 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Tue, 04 Nov 2025 15:58:24 +0100
Subject: [PATCH RESEND v7 6/7] clk: bcm21664: Add corresponding bus clocks
 for peripheral clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-kona-bus-clock-v7-6-071002062659@gmail.com>
References: <20251104-kona-bus-clock-v7-0-071002062659@gmail.com>
In-Reply-To: <20251104-kona-bus-clock-v7-0-071002062659@gmail.com>
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
 phone-devel@vger.kernel.org, Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5074;
 i=aweber.kernel@gmail.com; h=from:subject:message-id;
 bh=DSWwOgT5tbBOJuCemE10iAhhCX0NXJ6//wZV+1vI2/8=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBpChSO58K/GaAyCzMSSY6ye7b4jny16XKR0l4zJ
 o79TmPUjR2JAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCaQoUjgAKCRCzu/ihE6BR
 aHHWD/4v2Qw9VrLNQZSN7Q30cKwEsR+zIfo+zZKngZivHpxP+mnxJ+ZERE2Kb6ZVbiM0RKRHZqL
 irpncIkpgvOctJQJJobF1UyWg8IYBjAVWiLh5YOYOwLqOGKnNIAesJU/VrNEKJlgRTPwDMXhxYN
 Rdn+Ldgmlcd/gHzrBXJvxrx09gUKf29bu/NQBFyTbTmn9WGAFjwT+SCfhegtROGg/OLZe7wUB5x
 qVXne26FI04QT8rh5N/McogfQGyjUebaMZ6wgGI9yCBS2alCsd7IcNVVYUMB0OzZEJV6Anx1gxZ
 3d2hj8qT7ViH2V47LnXvGQ0EnX2DNVqgVnIkh2dMBjlqWFEcEUTI/9PchHkkrJyqe3sfV0B8bv0
 nA7Ti3muhkf4irAvWbAhLncBY7GdumksSwMX0pBRQEauNa8NB7QjRzgWW3oR5TWNlN0Y8XlPGCH
 7a/ykBIBNYMVaFnCvXCb1YIbTBiCauE8/OsGjFYtm1+mIG1615SJaY6yrzrDGGc2NIZfmJlCmO2
 JKekrls9PRkoOIyVA8BJRxz99814xAi+iyTx77LZ3aEB0693iFekVB4G0d+wlfweOSpYUzikaIa
 5iw4Dps9sSt1uuiV1SrqftCrpvvvzqEfYINTLCrdT72sM+EolBKY02e3zIZ7HvDylICEl5PTwht
 CgHk1kiLT4YXYiw==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_065835_906706_054BC9A3 
X-CRM114-Status: GOOD (  12.82  )
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

Now that bus clock support has been implemented into the Broadcom Kona
clock driver, add bus clocks corresponding to HUB_TIMER, SDIO, UART and
BSC, as well as the USB OTG bus clock.

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v4:
- Adapt to CLOCK_COUNT -> CLK_COUNT rename
- Change commit summary to match equivalent BCM281xx commit

Changes in v3:
- Adapt to CLOCK_COUNT defines being moved

Changes in v2:
- Adapt to dropped prereq clocks
---
 drivers/clk/bcm/clk-bcm21664.c | 89 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 86 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/bcm/clk-bcm21664.c b/drivers/clk/bcm/clk-bcm21664.c
index 14b7db824704..4223ac1c35a2 100644
--- a/drivers/clk/bcm/clk-bcm21664.c
+++ b/drivers/clk/bcm/clk-bcm21664.c
@@ -41,7 +41,12 @@ static struct peri_clk_data hub_timer_data = {
 	.trig		= TRIGGER(0x0a40, 4),
 };
 
-#define BCM21664_AON_CCU_CLK_COUNT	(BCM21664_AON_CCU_HUB_TIMER + 1)
+static struct bus_clk_data hub_timer_apb_data = {
+	.gate		= HW_SW_GATE(0x0414, 18, 3, 2),
+	.hyst		= HYST(0x0414, 10, 11),
+};
+
+#define BCM21664_AON_CCU_CLK_COUNT	(BCM21664_AON_CCU_HUB_TIMER_APB + 1)
 
 static struct ccu_data aon_ccu_data = {
 	BCM21664_CCU_COMMON(aon, AON),
@@ -52,6 +57,8 @@ static struct ccu_data aon_ccu_data = {
 	.kona_clks	= {
 		[BCM21664_AON_CCU_HUB_TIMER] =
 			KONA_CLK(aon, hub_timer, peri),
+		[BCM21664_AON_CCU_HUB_TIMER_APB] =
+			KONA_CLK(aon, hub_timer_apb, bus),
 		[BCM21664_AON_CCU_CLK_COUNT] = LAST_KONA_CLK,
 	},
 };
@@ -126,7 +133,27 @@ static struct peri_clk_data sdio4_sleep_data = {
 	.gate		= HW_SW_GATE(0x0360, 18, 2, 3),
 };
 
-#define BCM21664_MASTER_CCU_CLK_COUNT	(BCM21664_MASTER_CCU_SDIO4_SLEEP + 1)
+static struct bus_clk_data sdio1_ahb_data = {
+	.gate		= HW_SW_GATE(0x0358, 16, 0, 1),
+};
+
+static struct bus_clk_data sdio2_ahb_data = {
+	.gate		= HW_SW_GATE(0x035c, 16, 0, 1),
+};
+
+static struct bus_clk_data sdio3_ahb_data = {
+	.gate		= HW_SW_GATE(0x0364, 16, 0, 1),
+};
+
+static struct bus_clk_data sdio4_ahb_data = {
+	.gate		= HW_SW_GATE(0x0360, 16, 0, 1),
+};
+
+static struct bus_clk_data usb_otg_ahb_data = {
+	.gate		= HW_SW_GATE(0x0348, 16, 0, 1),
+};
+
+#define BCM21664_MASTER_CCU_CLK_COUNT	(BCM21664_MASTER_CCU_USB_OTG_AHB + 1)
 
 static struct ccu_data master_ccu_data = {
 	BCM21664_CCU_COMMON(master, MASTER),
@@ -151,6 +178,16 @@ static struct ccu_data master_ccu_data = {
 			KONA_CLK(master, sdio3_sleep, peri),
 		[BCM21664_MASTER_CCU_SDIO4_SLEEP] =
 			KONA_CLK(master, sdio4_sleep, peri),
+		[BCM21664_MASTER_CCU_SDIO1_AHB] =
+			KONA_CLK(master, sdio1_ahb, bus),
+		[BCM21664_MASTER_CCU_SDIO2_AHB] =
+			KONA_CLK(master, sdio2_ahb, bus),
+		[BCM21664_MASTER_CCU_SDIO3_AHB] =
+			KONA_CLK(master, sdio3_ahb, bus),
+		[BCM21664_MASTER_CCU_SDIO4_AHB] =
+			KONA_CLK(master, sdio4_ahb, bus),
+		[BCM21664_MASTER_CCU_USB_OTG_AHB] =
+			KONA_CLK(master, usb_otg_ahb, bus),
 		[BCM21664_MASTER_CCU_CLK_COUNT] = LAST_KONA_CLK,
 	},
 };
@@ -231,7 +268,39 @@ static struct peri_clk_data bsc4_data = {
 	.trig		= TRIGGER(0x0afc, 19),
 };
 
-#define BCM21664_SLAVE_CCU_CLK_COUNT	(BCM21664_SLAVE_CCU_BSC4 + 1)
+static struct bus_clk_data uartb_apb_data = {
+	.gate		= HW_SW_GATE_AUTO(0x0400, 16, 0, 1),
+};
+
+static struct bus_clk_data uartb2_apb_data = {
+	.gate		= HW_SW_GATE_AUTO(0x0404, 16, 0, 1),
+};
+
+static struct bus_clk_data uartb3_apb_data = {
+	.gate		= HW_SW_GATE_AUTO(0x0408, 16, 0, 1),
+};
+
+static struct bus_clk_data bsc1_apb_data = {
+	.gate		= HW_SW_GATE_AUTO(0x0458, 16, 0, 1),
+	.hyst		= HYST(0x0458, 8, 9),
+};
+
+static struct bus_clk_data bsc2_apb_data = {
+	.gate		= HW_SW_GATE_AUTO(0x045c, 16, 0, 1),
+	.hyst		= HYST(0x045c, 8, 9),
+};
+
+static struct bus_clk_data bsc3_apb_data = {
+	.gate		= HW_SW_GATE_AUTO(0x0470, 16, 0, 1),
+	.hyst		= HYST(0x0470, 8, 9),
+};
+
+static struct bus_clk_data bsc4_apb_data = {
+	.gate		= HW_SW_GATE_AUTO(0x0474, 16, 0, 1),
+	.hyst		= HYST(0x0474, 8, 9),
+};
+
+#define BCM21664_SLAVE_CCU_CLK_COUNT	(BCM21664_SLAVE_CCU_BSC4_APB + 1)
 
 static struct ccu_data slave_ccu_data = {
 	BCM21664_CCU_COMMON(slave, SLAVE),
@@ -254,6 +323,20 @@ static struct ccu_data slave_ccu_data = {
 			KONA_CLK(slave, bsc3, peri),
 		[BCM21664_SLAVE_CCU_BSC4] =
 			KONA_CLK(slave, bsc4, peri),
+		[BCM21664_SLAVE_CCU_UARTB_APB] =
+			KONA_CLK(slave, uartb_apb, bus),
+		[BCM21664_SLAVE_CCU_UARTB2_APB] =
+			KONA_CLK(slave, uartb2_apb, bus),
+		[BCM21664_SLAVE_CCU_UARTB3_APB] =
+			KONA_CLK(slave, uartb3_apb, bus),
+		[BCM21664_SLAVE_CCU_BSC1_APB] =
+			KONA_CLK(slave, bsc1_apb, bus),
+		[BCM21664_SLAVE_CCU_BSC2_APB] =
+			KONA_CLK(slave, bsc2_apb, bus),
+		[BCM21664_SLAVE_CCU_BSC3_APB] =
+			KONA_CLK(slave, bsc3_apb, bus),
+		[BCM21664_SLAVE_CCU_BSC4_APB] =
+			KONA_CLK(slave, bsc4_apb, bus),
 		[BCM21664_SLAVE_CCU_CLK_COUNT] = LAST_KONA_CLK,
 	},
 };

-- 
2.51.1


