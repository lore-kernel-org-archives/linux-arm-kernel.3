Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F4D0F9D0F4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 19:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rKFuKgv0AEkRD4ZABJqA1y+s2HqCRJHpRMYf+DRn8zE=; b=2KMGSQmP6ODO6xTfYKrpkBSZSr
	aBMSg2DfsjAt/Ae5pKHyU2c+FjYXBj4YXyDGXc0jkTxPc0rkhjP1X+fkwpWFoVvF++VPj/OILYhtT
	abDU91jfv5R19WS8ZHwjL8BBahJskmIbLzzKyj2fO2e7z4rRAXJyc/y1bMXkjb+ZunK9G23gWq6MR
	W5cE9nly6JCqiMXhJzH4YtUwk6sSXDsgHw1zU3sQgZ9Nho3DZw+Rk8DOsqKd9D1JKFi3TeFh0UITL
	Wsk4SN31dyjVRJqh+9bh7QD2WIu3xW2JrFlgY5r9Y1+sA4Ih8Sym6GoqQH15wKiqyNB4YeKXUz9CL
	eAFyjrnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCjq1-00000000ACV-0HRn;
	Tue, 14 Apr 2026 19:54:21 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCjpx-00000000A9i-0bsY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 19:54:18 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-43d70b3e159so1288623f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 12:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776196455; x=1776801255; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rKFuKgv0AEkRD4ZABJqA1y+s2HqCRJHpRMYf+DRn8zE=;
        b=j803T0F+y9g2x6iODDk0JFdKbIk1NkklGW9bm9EBMFARCy0tn4K+gBCWZIng0aOyMC
         sBl8J1s3QLLQCuShMyDpVu5pDCLaj3dxIOjWO3BWDhC4enlk2yG4GaAvIz/FAzG+aNix
         u4AhiqnhCtpJ+OeEbj1d1gY3ADl0y8kyMBxIPOJEUmw3TRj62L66e752tlDIFwJwfczP
         38ibzzXav4WssK7W6fA+p/cb3m/jKi831ULiJUxBh0dZbIHCYXudkH9vrAU168z5SNVP
         f2VXrLLv9//nnKbJYrjWT/d1BQDedTxus2GHlyz4q5xODhTIYO76gJt3FI7Nwx+NoX+a
         pjwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776196455; x=1776801255;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rKFuKgv0AEkRD4ZABJqA1y+s2HqCRJHpRMYf+DRn8zE=;
        b=OwffMVZzu+fce8cOmHCA+vXBIKQk2unL0d2IR1KVdUdUvrxpf6W1iUnlh4qhonb1/V
         MKQemobcPUGOB0UdK1MAK+k/EOA/+95aSQ+fvnMCwvgsWJSFJKROwISVYxm7y3mGuLfY
         SOs0JGL0BvNLHMUpoQANBlHHDYu2m4PtLn2ZXekr7kW97F+pMBJHekHfD2nvMnshyz8D
         Y27Kr2Iw3HJXmgL/lzXfxl5hTHhIws2N0T7WNT3BuwZ+iTUpeB/6SL3oEqxlR14J7X16
         6/ZhO6VCd7JuXUUUuMTjR/sDk2IVnxl7wnuEKNa2k/fdFo7fpnl2NlVmA904AwCBvmTD
         ZLkQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ra1oOS9bCcUDpsj8xB5Z2m+hRmY8lTo06i66aj3g6KPIsF5mCGsPEVMjJqlbU0p1Sa+2AgKtGFnrjJTmevmvC@lists.infradead.org
X-Gm-Message-State: AOJu0Yza17nomhos8bmY0cQGGkh73KHZXNXd/FyhlAoh8ubSmZxnetos
	fG3KF7f0UMkyYtcg7c1oQPZGbdQ8dAytGAngfXFGci9Iqen7MZPEO+Hj
X-Gm-Gg: AeBDieuqtmyNmqy0DGuYijX/je2E4siIG5BmP4bTnqWe8QiszIwRHDepAdV3+pk1eEZ
	QrVbIGi2yrb5uxJLgycyjwCAm6jsWCVmVLiZorBxXeADjM3yuX1Cw5c9Sxf0iip3Qf8fD6YvPOa
	TJQ9lTxcdQ0fAWWt03hSs7UDU8hufqIMv7iMQh8rdMhMdoSKvtAbaGVdJD81RKAE0Ezk4FGgQpy
	4hLpsGikJ5DzK6thEsFHmORMSvNTkfubW2gVb/LGfNkmTH3PnLsVxMvfBV2mPJ/i6avUZrYf5vj
	UjyH6unoqQG/nUu8dJBj/b21srR3QI/2LwLd4C2nIP6iFSsGvNr0h4AM+YLoDS+y2wfP4B51o9w
	TXfDwcDPta7gEJnl5b1Mn1c6+Y0z29W6jkE62uJSLN4fhs11eNNLZK2GJUyFrk8s+WaU63g6euh
	WXm+V33IFM3dUJD8fWYzkzJ/vPtRXJDSNtojO3P1labfbzm/J1hkfVnEOXni6ZtBfBps0U9mzV3
	40maiwsh0O5cecaSGb/Wa/WlNwqG61h5g==
X-Received: by 2002:a05:6000:b0a:b0:43d:6787:9924 with SMTP id ffacd0b85a97d-43d67879ad8mr17176548f8f.2.1776196454943;
        Tue, 14 Apr 2026 12:54:14 -0700 (PDT)
Received: from [127.0.1.1] (93-143-58-160.adsl.net.t-com.hr. [93.143.58.160])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d7400708dsm25595266f8f.25.2026.04.14.12.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 12:54:14 -0700 (PDT)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Date: Tue, 14 Apr 2026 21:51:51 +0200
Subject: [PATCH 2/4] clk: mmp: pxa1908-apbc: Add reset cells
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260414-pxa1908-clk-reset-v1-2-94bae5f3a8cf@dujemihanovic.xyz>
References: <20260414-pxa1908-clk-reset-v1-0-94bae5f3a8cf@dujemihanovic.xyz>
In-Reply-To: <20260414-pxa1908-clk-reset-v1-0-94bae5f3a8cf@dujemihanovic.xyz>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Karel Balej <balejk@matfyz.cz>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5428;
 i=duje@dujemihanovic.xyz; s=20260328; h=from:subject:message-id;
 bh=y12V/0MXZNM4V87Nu8AZ7/dxPVLqCzcuUl4Cuce0an4=;
 b=owGbwMvMwCW2z0j3+uHIyKOMp9WSGDLvzU589HF5hHZ6jMYS244ulq95DUmxvfesJ4gqdRiEV
 O9Y92pNRykLgxgXg6yYIgvzUrlLfKnhEx2KbJNg5rAygQxh4OIUgIkILmZk6JyutO+Th3oDh8DM
 UFUOYcsnV8q/Lao6OGvb3+O/9bm+LGdkuO2RvXP96akb7s5mWBW/UX9jyJ9zJep7N+yLW/Xod5T
 sSRYA
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=9BD463017690089DAA8DC266275F544B3B1B4792
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_125417_227894_8B18DB09 
X-CRM114-Status: GOOD (  15.79  )
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

From: Duje Mihanović <duje@dujemihanovic.xyz>

It has been concluded by comparing the gate clock masks and vendor code
between PXA1908/28 that PXA1908's APBC, similarly to PXA1928's APBC, has
controllable reset lines. Describe these in the driver for correctness.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
 drivers/clk/mmp/clk-pxa1908-apbc.c | 58 +++++++++++++++++++++++++++++---------
 1 file changed, 44 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/mmp/clk-pxa1908-apbc.c b/drivers/clk/mmp/clk-pxa1908-apbc.c
index 3fd7b5e644f3..438ece4f047d 100644
--- a/drivers/clk/mmp/clk-pxa1908-apbc.c
+++ b/drivers/clk/mmp/clk-pxa1908-apbc.c
@@ -7,6 +7,7 @@
 #include <dt-bindings/clock/marvell,pxa1908.h>
 
 #include "clk.h"
+#include "reset.h"
 
 #define APBC_UART0		0x0
 #define APBC_UART1		0x4
@@ -44,22 +45,25 @@ static const char * const uart_parent_names[] = {"pll1_117", "uart_pll"};
 static const char * const ssp_parent_names[] = {"pll1_d16", "pll1_d48", "pll1_d24", "pll1_d12"};
 
 static struct mmp_param_gate_clk apbc_gate_clks[] = {
-	{PXA1908_CLK_TWSI0, "twsi0_clk", "pll1_32", CLK_SET_RATE_PARENT, APBC_TWSI0, 0x7, 3, 0, 0, NULL},
-	{PXA1908_CLK_TWSI1, "twsi1_clk", "pll1_32", CLK_SET_RATE_PARENT, APBC_TWSI1, 0x7, 3, 0, 0, NULL},
-	{PXA1908_CLK_TWSI3, "twsi3_clk", "pll1_32", CLK_SET_RATE_PARENT, APBC_TWSI3, 0x7, 3, 0, 0, NULL},
-	{PXA1908_CLK_GPIO, "gpio_clk", "vctcxo", CLK_SET_RATE_PARENT, APBC_GPIO, 0x7, 3, 0, 0, NULL},
-	{PXA1908_CLK_KPC, "kpc_clk", "clk32", CLK_SET_RATE_PARENT, APBC_KPC, 0x7, 3, 0, MMP_CLK_GATE_NEED_DELAY, NULL},
-	{PXA1908_CLK_RTC, "rtc_clk", "clk32", CLK_SET_RATE_PARENT, APBC_RTC, 0x87, 0x83, 0, MMP_CLK_GATE_NEED_DELAY, NULL},
+	{PXA1908_CLK_TWSI0, "twsi0_clk", "pll1_32", CLK_SET_RATE_PARENT, APBC_TWSI0, 0x3, 3, 0, 0, NULL},
+	{PXA1908_CLK_TWSI1, "twsi1_clk", "pll1_32", CLK_SET_RATE_PARENT, APBC_TWSI1, 0x3, 3, 0, 0, NULL},
+	{PXA1908_CLK_TWSI3, "twsi3_clk", "pll1_32", CLK_SET_RATE_PARENT, APBC_TWSI3, 0x3, 3, 0, 0, NULL},
+	{PXA1908_CLK_GPIO, "gpio_clk", "vctcxo", CLK_SET_RATE_PARENT, APBC_GPIO, 0x3, 3, 0, 0, NULL},
+	{PXA1908_CLK_KPC, "kpc_clk", "clk32", CLK_SET_RATE_PARENT, APBC_KPC, 0x3, 3, 0, MMP_CLK_GATE_NEED_DELAY, NULL},
+	{PXA1908_CLK_RTC, "rtc_clk", "clk32", CLK_SET_RATE_PARENT, APBC_RTC, 0x83, 0x83, 0, MMP_CLK_GATE_NEED_DELAY, NULL},
+	{PXA1908_CLK_PWM1, "pwm1_clk", "pwm01_apb_share", CLK_SET_RATE_PARENT, APBC_PWM1, 0x2, 2, 0, 0, NULL},
+	{PXA1908_CLK_PWM3, "pwm3_clk", "pwm23_apb_share", CLK_SET_RATE_PARENT, APBC_PWM3, 0x2, 2, 0, 0, NULL},
+	{PXA1908_CLK_UART0, "uart0_clk", "uart0_mux", CLK_SET_RATE_PARENT, APBC_UART0, 0x3, 3, 0, 0, &uart0_lock},
+	{PXA1908_CLK_UART1, "uart1_clk", "uart1_mux", CLK_SET_RATE_PARENT, APBC_UART1, 0x3, 3, 0, 0, &uart1_lock},
+	{PXA1908_CLK_THERMAL, "thermal_clk", NULL, 0, APBC_THERMAL, 0x3, 3, 0, 0, NULL},
+	{PXA1908_CLK_IPC_RST, "ipc_clk", NULL, 0, APBC_IPC_RST, 0x3, 3, 0, 0, NULL},
+	{PXA1908_CLK_SSP0, "ssp0_clk", "ssp0_mux", 0, APBC_SSP0, 0x3, 3, 0, 0, NULL},
+	{PXA1908_CLK_SSP2, "ssp2_clk", "ssp2_mux", 0, APBC_SSP2, 0x3, 3, 0, 0, NULL},
+};
+
+static struct mmp_param_gate_clk apbc_gate_no_reset_clks[] = {
 	{PXA1908_CLK_PWM0, "pwm0_clk", "pwm01_apb_share", CLK_SET_RATE_PARENT, APBC_PWM0, 0x2, 2, 0, 0, &pwm0_lock},
-	{PXA1908_CLK_PWM1, "pwm1_clk", "pwm01_apb_share", CLK_SET_RATE_PARENT, APBC_PWM1, 0x6, 2, 0, 0, NULL},
 	{PXA1908_CLK_PWM2, "pwm2_clk", "pwm23_apb_share", CLK_SET_RATE_PARENT, APBC_PWM2, 0x2, 2, 0, 0, NULL},
-	{PXA1908_CLK_PWM3, "pwm3_clk", "pwm23_apb_share", CLK_SET_RATE_PARENT, APBC_PWM3, 0x6, 2, 0, 0, NULL},
-	{PXA1908_CLK_UART0, "uart0_clk", "uart0_mux", CLK_SET_RATE_PARENT, APBC_UART0, 0x7, 3, 0, 0, &uart0_lock},
-	{PXA1908_CLK_UART1, "uart1_clk", "uart1_mux", CLK_SET_RATE_PARENT, APBC_UART1, 0x7, 3, 0, 0, &uart1_lock},
-	{PXA1908_CLK_THERMAL, "thermal_clk", NULL, 0, APBC_THERMAL, 0x7, 3, 0, 0, NULL},
-	{PXA1908_CLK_IPC_RST, "ipc_clk", NULL, 0, APBC_IPC_RST, 0x7, 3, 0, 0, NULL},
-	{PXA1908_CLK_SSP0, "ssp0_clk", "ssp0_mux", 0, APBC_SSP0, 0x7, 3, 0, 0, NULL},
-	{PXA1908_CLK_SSP2, "ssp2_clk", "ssp2_mux", 0, APBC_SSP2, 0x7, 3, 0, 0, NULL},
 };
 
 static struct mmp_param_mux_clk apbc_mux_clks[] = {
@@ -89,6 +93,30 @@ static void pxa1908_apb_periph_clk_init(struct pxa1908_clk_unit *pxa_unit)
 			ARRAY_SIZE(apbc_mux_clks));
 	mmp_register_gate_clks(unit, apbc_gate_clks, pxa_unit->base,
 			ARRAY_SIZE(apbc_gate_clks));
+	mmp_register_gate_clks(unit, apbc_gate_no_reset_clks, pxa_unit->base,
+			ARRAY_SIZE(apbc_gate_no_reset_clks));
+}
+
+/* Taken from clk-of-pxa1928.c */
+static void pxa1908_clk_reset_init(struct device_node *np,
+				   struct pxa1908_clk_unit *pxa_unit)
+{
+	struct mmp_clk_reset_cell *cells;
+	int nr_cells = ARRAY_SIZE(apbc_gate_clks);
+
+	cells = kzalloc_objs(*cells, nr_cells);
+	if (!cells)
+		return;
+
+	for (int i = 0; i < nr_cells; i++) {
+		cells[i].clk_id = apbc_gate_clks[i].id;
+		cells[i].reg = pxa_unit->base + apbc_gate_clks[i].offset;
+		cells[i].bits = BIT(2);
+		cells[i].flags = 0;
+		cells[i].lock = apbc_gate_clks[i].lock;
+	};
+
+	mmp_clk_reset_register(np, cells, nr_cells);
 }
 
 static int pxa1908_apbc_probe(struct platform_device *pdev)
@@ -107,6 +135,8 @@ static int pxa1908_apbc_probe(struct platform_device *pdev)
 
 	pxa1908_apb_periph_clk_init(pxa_unit);
 
+	pxa1908_clk_reset_init(pdev->dev.of_node, pxa_unit);
+
 	return 0;
 }
 

-- 
2.53.0


