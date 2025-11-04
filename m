Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F33CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 14:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YiETutXUQi91zPM9wQrjIsBcMeBokATJ9Dk+OnsfOPY=; b=mqX/Rn5pvIk932denqtBd57dVz
	MRZIB+Wemt0OmpvSlO1Bboby4BlNul7okDCTMZ7wDOI/7K30MYmn02K0qT+1K8XIKiBW32OwdQO9y
	N4UChoeTLSjJDje98/QQZ6NYKdfPXUgaXB8Y3ZMBAKSyyU2sl8bwQO0Td7dTPUhzEzyyY6By5w1cE
	jsg+d2UziKKbIcc+dIJyDdZmJkpKbTmumsg6zGJRpyuj7DuKYanonSybB2CR7CY0OqxqxsEU4myOY
	WX1wB8DjZY+SkMPJ2m0ybegrTxb+tHoCO5BF8c/LYnA375HH0QOaa1ToHo/EsNrOm9UK2cA6M+SD7
	vYX9CpTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGIUb-0000000C1Dc-2kJG;
	Tue, 04 Nov 2025 14:58:41 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGIUX-0000000C17R-3NNj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 14:58:39 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-641018845beso100053a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 06:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762268316; x=1762873116; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YiETutXUQi91zPM9wQrjIsBcMeBokATJ9Dk+OnsfOPY=;
        b=VKyJZ7b0q0StQfXD7GPuGlJAvPloXbGmr2xNPYIpPodkylRdPc2fJfPeXMSPHrztvR
         qi0X1xnjtvVnQrXZX4vkKfB2fhjdUMkH73Yh0VnILFusAaiKgU0d3tq5O/Odi1Cas1QZ
         A5HVjWyhOcQTVaG+QR1d+6V4nPQs/02+VCOssNgAxB17GZD/P6/ZH0yTsIpkebY8Nith
         cKVn0nsjx2sl68nfzyLAz4cnumVg8HU9LnqbCZhXyXbnTi0TgFmGzdMB4SCiMYYav4XY
         p0eMHoJxItQSZv3Yr6CfDQi15COad99ks1qUDsOfwvqltVdq748NA7d8frbJ9ojLudFj
         sTUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762268316; x=1762873116;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YiETutXUQi91zPM9wQrjIsBcMeBokATJ9Dk+OnsfOPY=;
        b=WJFSulSHhzzXDj9TA50VxQD0c0xImn06nYjuVX2BDKUCjDiS0OrbFcgDVk9dyCclvP
         dn/HeoPxJq7Bzg5bjE1zIA7KYaR0c/k9k5ttRtLJbqf5jNcZc6xHrKa33MA5uDCfYOEq
         GmC6fMw7P1VObT+KuP2BTMkWRkQyfgsrbd/GmBj7dh6TPELZdsscr2Gp0W++GXE/9TaG
         CQfaby45z2abg8OjT5lEeT27uFteCxYIK4N+nBd/hknBXuykOvZi/+v5Kmqi+BOJdWet
         nXQeNFe6bFPTSBOtVF5E3NX9TvGGoaipHuIQ0bcITmTpK11cLdjHmELZ9wFBnaXsgbVb
         /k1Q==
X-Forwarded-Encrypted: i=1; AJvYcCW5bG6BmIhLFr+lQ9YEYBnX+iVbBrHeBbj4CrTEv8+xvA9d2dAVigmUUtnErXNum3pM1ALg7nDE/+HbxEUmENrI@lists.infradead.org
X-Gm-Message-State: AOJu0YzuFH9NM8y2FpxGLE71p9j4fAodKc1fI5LqC7V45ZHIp7HYAdJo
	zs53Qt9TD/Sh7Iz/Gp6GKggGKRIO0xHuyxxfnG/D8QvDGlEg0hkF+6Jw
X-Gm-Gg: ASbGncvJtx7ta2by6zmOpKKGbV1XjQVMrhqZDC9n3hmTEeQcvHqASivx9Zu4dv+uWRK
	NnE8Rm2EBxZVH5vlIBqNIGmyu7Ozk9PM0DV4Mzwed2aTef0Xc30IUPH/4kh92rS2BEbcivrOHcB
	+h0YIx9DqjE9pTgTfrYM0Uf1o1TP7M9KGRztms73HdfsUlmNkxBzY0qv3kbG1BL1KBz+ZL2hgMO
	HvfvEbpm0GZwTfrTikbna9A8TCQzOvpIedjAfmgJRXnIj5BRhPR+vSnquS/vvHZz1mGixW7u+lb
	TM3dVnz7EW+hT5lmmo/M51Vee37fSgbcNszi48jbN0rkhiTKcQES5bLZ9OBNMOqqgPyfDXA9DUY
	xKckGC5tZGx8y6JZwSWasQDWYkd5nGthgYDarIHUH9WNprGCAlAxV6bA0tHiIoBbGffmlc2FnCc
	MpIxPk6A9mRe5IVIv42WYeFVh2KoVtmssKbxCOlGZN54rnAWk=
X-Google-Smtp-Source: AGHT+IEm9m/w9mr1Ah54jXoKE1xbMScwRImAvwjuiTBh4hTI8OJ22nQbryQ4R/71ZzmoPFNV84Nqyg==
X-Received: by 2002:a05:6402:90e:b0:640:cc76:ae35 with SMTP id 4fb4d7f45d1cf-640cc76b080mr5264788a12.21.1762268315761;
        Tue, 04 Nov 2025 06:58:35 -0800 (PST)
Received: from tablet.my.domain (83.21.17.47.ipv4.supernova.orange.pl. [83.21.17.47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-640e6a7fcd7sm2288874a12.37.2025.11.04.06.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 06:58:35 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Tue, 04 Nov 2025 15:58:25 +0100
Subject: [PATCH RESEND v7 7/7] clk: bcm281xx: Add corresponding bus clocks
 for peripheral clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-kona-bus-clock-v7-7-071002062659@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6005;
 i=aweber.kernel@gmail.com; h=from:subject:message-id;
 bh=oaleqb9XqZrB+5VSSVHMl0U9JzcMe7IFlSred6/4jZc=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBpChSPDzc0qX79x6O83xMuL+h1vrRyYab9QcJKX
 vTAZcWQZS6JAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCaQoUjwAKCRCzu/ihE6BR
 aGUwD/9rHsz4h33pXwGXH/5ZmWcK9bAgXdjLQJzEJXA2ZvaTR0eYh1aY8S4QyX8yuWSPnsyfzNI
 26sg4lwqP3R/ikGpjup+Thz1EzWvOiapUWActOQisJfzz5E/bY2D9IDkMYb9c9qyspwt2hMRqOS
 dtgPzncqkKCzbn2q+Jx0I634cK9BOMWJwEWBS+B6OcxZYx49scZxMgs3VzCfpkLf9hXxVZGFg19
 33+SbwFvoQaN+wuYxUl1njAieZpbX9Q4cYDRGnQgdAerYKlFQfG8PkFwqLy1PFb/1zEuElNX4Ko
 +cfyw1J7jQxg12P/Itbq9oE3iPpkjsBnFfb7fNcYiSgzFb6IiRqtoDKBPZxI2Ox9J3cRK7ANY+M
 +pNk9YNnMUtOC5qV9bP49m7R4JOQ6aXnMMvtKH0ycKwTa/wY5/3eUDDyGCcnLyAjrEcnfazod6t
 1ZwNq5yLhoOvd5kaJqKCMzW81mogJ7xIrp12Y0GGLaCtNk3NsGbctBd7ARkRbTfCJ5MXJqi4Wj2
 WXySVxv0kIbwnamow75nF2WbWIy9bO/eMRW9G0RHYeZlgPpnOo/j1jGNClDArrqV1XpbERK1k5j
 FRv4w8NT1hXdLrK+vWNagTW8g70u72nAsLdcJLdY/eZ0t0Q5W5XmYRtqkYpCgIgNFrQcivvnRBU
 JidqQz4b+FUw7UQ==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_065837_911284_6EA9E439 
X-CRM114-Status: GOOD (  12.73  )
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

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
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
index 62c3bf465625..13fd8a5ea8fa 100644
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
2.51.1


