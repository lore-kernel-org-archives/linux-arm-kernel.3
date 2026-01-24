Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5926AD715EE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Jan 2026 17:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PpcSO6uERmh9kHErfStBG+F1jw3KRf4ioMZexXinqck=; b=afQ7OQfn8lbWNkqBUf9sKNrbS9
	DpTOjwJpSsz6qjruYKdpKk1dNNPYRqKQBqOmPdslbBJeWeBSLDHoc814iH1YCSM202vKkKHezzJvJ
	tiachP4btkeQryUxu1C2sMQIloE0rs9gkcHvVcv0fqDllFdfir0k9Y8w+ApZeiIr9k33o2PFCn4oh
	yZH9E7IG3pBkKtgNYFptYbALAAvLoTZZJU30bCde5+4JfzJQKs6Xn5fgQDLTjfijjSCwbhS+Trxyv
	9aSq4Gj0FEHaUgC5KVRdaU0v1CURd9ldvRmlGqHHuR7uCgk7VFqHHzJCoyD/EbQztIVbv7FVo7Puj
	EAooik0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjh9h-0000000AOGn-0XFw;
	Sat, 24 Jan 2026 17:10:37 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjh9L-0000000AO6D-1Tt0
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Jan 2026 17:10:17 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b88455e6663so464640766b.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Jan 2026 09:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769274613; x=1769879413; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PpcSO6uERmh9kHErfStBG+F1jw3KRf4ioMZexXinqck=;
        b=iFMWlF1RpO+JCuE5CWpBDMqPwPWk+JbMJzqLqjXf4P5EwHRSGhfSDfpIdInRyZ+uHQ
         Aslwv9ByT+L4eYwye5G578qgjf3wzGQFfRslytu0Xy6itowIYWHnjfLiyjiM2ohFd3wt
         9osfIlnKw5S7LsN7C/rwz21n5QDeqWGcPaCsedRE0AzEQ2b8Q4i4uvjKcoTgKUf1lQ5T
         dW8OhWBHr9mFJr9ZryRReMGWetEzmvEZLVHZ1pEx2dMv/YGGwbMOGuSO+UXpZAYt99jY
         MedcJXAQhWehsv2cHgRwXZTX7Wr8FxyjSudOx/J6u5U+iTHUSqFQpqFi6n4FzZeYMxpj
         YLIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769274613; x=1769879413;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PpcSO6uERmh9kHErfStBG+F1jw3KRf4ioMZexXinqck=;
        b=jNtCUeEyKUxYlbPSjywq77vMTB9ATXFHuUYHagwkC5e5W43yHyDitnPESfvFj+mKIq
         vSEWMq2L63GJtSklEq+KUoFAL883/MsichLodP+OAhA471Ld8a+HYjjW0WZgjlLM+Brf
         rV/gloOhHmqpRZ1R4wytQ+ha5oDM0/OIPaKc/sFqiQ0V+v1duNSAD5gtMgoIUqyQVhH8
         8NTfgx6reVbgYl4pCpewZBtSzCnANL8uE72h4lImfNQ9bKXIxs4eRgMkHXRehYKjyboc
         wm+AcptRt3JQAaA1xuYOx3RIgiHnIEI9oe3+lhif95BIEFAMXN55eWAzU6G8r2QwxTD9
         FttA==
X-Forwarded-Encrypted: i=1; AJvYcCWKtElkiC8Cj0q6eDoq8xXSAPywTAnm+IGCi3u2BYlk54UJ5F7sm2oVRaL4I/9O3WeqbXTFSETL1f7xVE9N7K47@lists.infradead.org
X-Gm-Message-State: AOJu0YxO5rJwAAhRBDAvD790K2BUA5ni7A93NF0Ag3lVp98FJcPdEL5l
	BqgOpRYQZhclRRrwsAXpmgGvpaq4cg1HieKq/DLoCPRD9/Xo9nGEf8kw
X-Gm-Gg: AZuq6aLaEn+ozTSalKgdYLEK+Nl15//l7+y8q4ZjRDQ2PC0tQ6PtPh5+0XDhTeJecYS
	vPWgpw1eXacKAj4dfINcSPeC6EJcbSX0cVH7f4RVIsGOCFNNd3bXLRNz/Y1W5mMikDUz7tLDe6r
	xNCRMQ6fkIyQ6UmF/UzhRuwEw++X5Yc0cROHU6eLm7loKyDZ2CHkDOSQpUc4/RYG+rKGpm1oAtf
	Aqvr72/Nn6bHR/HR1MFNS6qdDQnFz2XHJWeb9eOGFYsFzthiix/FIEWBgtQkTtCMUsSBgDyuaPF
	mHUIlmEcyr8Fwiw3fP7rSV1L6E1nBIrzK5Ey8x4yikT682t16GnGY4LR2rxvsjIL9Uzn+Tsu6ld
	i4G3aTQfZZtVUNkQQ+HutnHAY+ruHwj40YFizKQthzWeWh5AaqYMv34iitsTN0CJFGgZwSWbM0Q
	t+oiVr5KTGaTw98P0zBt6EBGYRSrvN4nUXJ1cg0TJjehwZxuqVPWGj7sL3/PevEi2nYXJGvOTbC
	KE4EnXDSRt54KtkZEtsskjJgpWd/5qqpZg=
X-Received: by 2002:a17:907:3e26:b0:b86:ef1f:6d19 with SMTP id a640c23a62f3a-b885aea12camr504527666b.59.1769274613142;
        Sat, 24 Jan 2026 09:10:13 -0800 (PST)
Received: from tablet.my.domain (2a01-114f-470e-6200-4c6a-9244-66ab-7c8e.ea.ipv6.supernova.orange.pl. [2a01:114f:470e:6200:4c6a:9244:66ab:7c8e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b3dac6esm302680866b.7.2026.01.24.09.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 09:10:12 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Sat, 24 Jan 2026 18:10:06 +0100
Subject: [PATCH RESEND v7 6/7] clk: bcm21664: Add corresponding bus clocks
 for peripheral clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260124-kona-bus-clock-v7-6-9dffe1bdc08d@gmail.com>
References: <20260124-kona-bus-clock-v7-0-9dffe1bdc08d@gmail.com>
In-Reply-To: <20260124-kona-bus-clock-v7-0-9dffe1bdc08d@gmail.com>
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
 bh=q4XetRZpWDwA/NUIdchOcpPjBPnX8GimF9SrPpwDUXw=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBpdPzsTZipaB0JvAJssglW+uuqQn6TvPb4zKnfO
 +a711OvaL6JAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCaXT87AAKCRCzu/ihE6BR
 aF0GD/9WCEdT2p7uT45LyY3Y2zUgExaXzKNjUZartepNsL20yv9zFA/B56kWfcIBrYdSQqYw2NB
 4WaKyBreyOOC3soUHaZLNwiGUeOhPmlzfFLT7ZFdms+All15mVOoMi/r/tuAgoE1DBpLMnmQOqm
 1jwal0aTMcq+ZpKCbyGKUQyN4fNqqiqDb11LsK8AjjudZnNNdAYdWSZkgv8Qn5YDHvoe0MXf8XO
 FiIoMy32WBYoKncfT6K4Cb8hLn7mWvCFgzgtRxKHT81PIqN/XfKRtnf3bjiAhaVyV/0px/KBweL
 N4QsXE0EtHGRc0dweT9EIIaRLxWW6+e+gN1mrlebgrdBVheHZwyO1bumxOSMM2EY0gSu6Puvk8B
 yLJMDMlzT6iPRTQ1hoFa7HIOBMMa7ttn/Zb4ePFHr3zppzO5hTtFvQ4hnd9eFgPxx+tICiNkKec
 im6SUUi5l8C160jg2LK42YwSD8ueYrPbvuq9YgPUApouo7cTKL1Q7i1Q6zK63hd4HomPyzV0FWy
 m1Y5/Ut17fcJDX6C96wb5659hjR4GXQY9w4+llHEUuouMa7DUBOCNZfHYLcaFJv4jxOMUnavKaS
 MTpwn8Sd/gQzvPYX6runjo1TTJYndkPigWaIQw6JBIVw9M0OB7pxUriutAr7rh1h7f2/BrKsxi3
 lIXOodxiEcs+abA==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260124_091016_495660_51CA124B 
X-CRM114-Status: GOOD (  12.02  )
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
2.52.0


