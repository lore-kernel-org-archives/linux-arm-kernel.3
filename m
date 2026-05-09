Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D762ACD3447
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 19:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F3EJ0517xJNtY9t4icYdcJ6JRwvMjYIpIptqEEIrShg=; b=J+AzKPePBIG3P8Uyi+nnNKNJNX
	9fC1kl1hW8UShBDtMz20bdHQT+bvf4QPHpnvg5iyH52swb5s8QfVTENaprFdkZVI3zLwe8zLpAH0D
	SNcdHRCCMh8Y8L46623aHM3lWA47pFPR2ETmcAT6/cGUTx3TOxtj07ObmjN2OZAigWoWtlgxlyYav
	0qCWbwI3QSaBHgiESqaVK/5teAib34y6o6xNCToQ5H4Gskc6hKuazbxDY1v/vtfe9Ae1Ww6PF0y4q
	PBq56fQu1S5TOlRVCvE/TdoHn2OkH2Qwu8CO9ttxTxz0mMOP4kHJrFbwOxxmSNxz3/oAGk1nKCBTn
	HckIp2JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLmua-00000009TEZ-1bdF;
	Sat, 09 May 2026 19:00:28 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLmuV-00000009TAh-2l7p
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 May 2026 19:00:25 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4893940bb5eso18194545e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 09 May 2026 12:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778353222; x=1778958022; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F3EJ0517xJNtY9t4icYdcJ6JRwvMjYIpIptqEEIrShg=;
        b=SPXUB6j5ugCITpz6Wi0xYrwyBN/ixmn8gUoMVDQm5axz3jnY8oo+29fVVz3IYC+QYe
         Mz0L7Tz8sYhiX6q0cxk2MkEUjcu/FMsR1lnWy3AmsqDzHVEK2FRGr1B3/VQZFZpvWau/
         HT9Tb4gAzZ72e/HUS3R+2/4xz+aDCAJtPqK+AIyY/+u5EjeD/KmZPlou8jFYVVC9tbkD
         kj4Loxzx8pPdTcaMzK4SdISZOU7yaIdJk379QR2eC+3kxd8yzZxmGvtpytqP8J2ITmEF
         1ZiyjFQB5UWovmQh/jZFTBvlMf7SEINWkunHBndMiUUmDEXVVbsmJQErKxYpY0jtk0Bc
         dB8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778353222; x=1778958022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F3EJ0517xJNtY9t4icYdcJ6JRwvMjYIpIptqEEIrShg=;
        b=nvPbdj096onHu61OZcaKV8y71nI7DEcFry8aTvYzfyKYZ/WH7WU8HcAeyCOWZEE/34
         BdSe64bCsqSN0VZbGtTC9N6vOm8bMLBEZz21lA3y2fQh8VBKeruR3ruiMYYYjusQk0sn
         zMy5m7rIMM3KduIth52lY9xSm/hc4+qrk2/+0/lprQo+1xqEQu3Xl2c2GrxdEPsRmVmT
         imyvnB7fXSiIwmec/zDSSwrhOpQUkPpui7p1Z4kaQhX+UNtmVojfxC0gTZxWCQcnThwH
         JJjihOx4XHXDarIEtbJssb48BNuskg+0QPWldJpGF5HKKLhgYCMuAFxZKCow8JZm4wDv
         0ogQ==
X-Forwarded-Encrypted: i=1; AFNElJ+lWz3Nhma9WG6L8vbemVadQXBIFAx38EpsbjkiYnH2mlqGmxgkov06F4GeAo8rEfBfQdAMdPkn8BPX3k+wcxQE@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2FJ15P/BgF2h/kFk1bnxCU8Di2UUyUILQ9z41EiV8spkSD6jU
	EwfZc48O3yTo37XLqiQ79xOoFxBJCw6Jvp9doH92UGoWZ6hjbH/Q5EKz
X-Gm-Gg: Acq92OEgrhgG7po+C885IGHUZUXMwBL3k4IwMDurwRPm78nK8+OFIAa9ffOk2G9nSCW
	1EWOvUqViwguacy8vPrw559vGoWRqow6ZVp1v3+uvQ4cz2dYB/hnuljboylmvOIyr++ai9S1KnX
	qp4IBUDN6tCu0MAaatYBDnfJnviiXvb7iYwLxpm/0OA/FZt+34yCNrm7/y27TnIZtS6Uy5E1Pkr
	Gjzj5THeyhhAH5pQc05At7QZaurYHMcrvkvHORtQt5JUjKgAW/JQrQmBqwElMzUUZbYLur6BXdM
	xDz8xLqXH3EMfSuVZ+P4ZL7GTbxymmYiawGZl569GXBGDl2/N8nyGgkz9YJ680FNZZvgFuK082d
	Y/ZGTV/C6ydE8zsf9ReHRcQ85hRkwjuEvT2uL2TCWnw+r2S3dI7Eo7pfen+ZdzzyipUOVk7SDZC
	PoW827U+6TwAM1HzNvQ9F7COJVJhikyj6cicEZ6epS72vUs+Uj8hj24ckwhPJYIIxeOlQ=
X-Received: by 2002:a05:600c:1e0f:b0:48e:51f5:2764 with SMTP id 5b1f17b1804b1-48e676c0353mr137860975e9.27.1778353221568;
        Sat, 09 May 2026 12:00:21 -0700 (PDT)
Received: from jernej-laptop (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-454913049ecsm13254407f8f.19.2026.05.09.12.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 12:00:21 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
X-Google-Original-From: Jernej Skrabec <jernej.skrabec@siol.net>
To: wens@csie.org,
	samuel@sholland.org
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	jernej.skrabec@gmail.com
Subject: [PATCH v2 1/8] clk: sunxi-ng: de2: Fix Display Engine 3.3 definitions
Date: Sat,  9 May 2026 21:00:08 +0200
Message-ID: <20260509190015.79086-2-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260509190015.79086-1-jernej.skrabec@siol.net>
References: <20260509190015.79086-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_120023_726281_290D645E 
X-CRM114-Status: GOOD (  13.25  )
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

From: Jernej Skrabec <jernej.skrabec@gmail.com>

Positions of clocks and resets changed when version 3.3 was introduced.
However, old positions still work, just by luck.

Fix Display Engine 3.3 resets and clocks according vendor driver.

Fixes: be0e9a372787 ("clk: sunxi-ng: ccu: add Display Engine 3.3 (DE33) support")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
Changes from v1:
- new patch

 drivers/clk/sunxi-ng/ccu-sun8i-de2.c | 39 +++++++++++++++++++++++++---
 1 file changed, 36 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
index a6cd0f988859..6ec6c0dc4c26 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
@@ -36,6 +36,13 @@ static SUNXI_CCU_GATE(wb_clk,		"wb",		"wb-div",
 static SUNXI_CCU_GATE(rot_clk,		"rot",		"rot-div",
 		      0x00, BIT(3), CLK_SET_RATE_PARENT);
 
+static SUNXI_CCU_GATE(mixer0_h616_clk,	"mixer0",	"de",
+		      0x04, BIT(0), CLK_SET_RATE_PARENT);
+static SUNXI_CCU_GATE(mixer1_h616_clk,	"mixer1",	"de",
+		      0x04, BIT(1), CLK_SET_RATE_PARENT);
+static SUNXI_CCU_GATE(wb_h616_clk,	"wb",		"de",
+		      0x04, BIT(4), CLK_SET_RATE_PARENT);
+
 static SUNXI_CCU_M(mixer0_div_clk, "mixer0-div", "de", 0x0c, 0, 4,
 		   CLK_SET_RATE_PARENT);
 static SUNXI_CCU_M(mixer1_div_clk, "mixer1-div", "de", 0x0c, 4, 4,
@@ -54,6 +61,9 @@ static SUNXI_CCU_M(wb_div_a83_clk, "wb-div", "pll-de", 0x0c, 8, 4,
 static SUNXI_CCU_M(rot_div_a83_clk, "rot-div", "pll-de", 0x0c, 0x0c, 4,
 		   CLK_SET_RATE_PARENT);
 
+static SUNXI_CCU_GATE(bus_mixer0_h616_clk, "bus-mixer0", "bus-de",
+		      0x08, BIT(0), 0);
+
 static struct ccu_common *sun8i_de2_ccu_clks[] = {
 	&mixer0_clk.common,
 	&mixer1_clk.common,
@@ -74,6 +84,12 @@ static struct ccu_common *sun8i_de2_ccu_clks[] = {
 	&mixer1_div_a83_clk.common,
 	&wb_div_a83_clk.common,
 	&rot_div_a83_clk.common,
+
+	&mixer0_h616_clk.common,
+	&mixer1_h616_clk.common,
+	&wb_h616_clk.common,
+
+	&bus_mixer0_h616_clk.common
 };
 
 static struct clk_hw_onecell_data sun8i_a83t_de2_hw_clks = {
@@ -147,6 +163,17 @@ static struct clk_hw_onecell_data sun50i_a64_de2_hw_clks = {
 	.num	= CLK_NUMBER_WITH_ROT,
 };
 
+static struct clk_hw_onecell_data sun50i_h616_de33_hw_clks = {
+	.hws	= {
+		[CLK_MIXER0]		= &mixer0_h616_clk.common.hw,
+		[CLK_MIXER1]		= &mixer1_h616_clk.common.hw,
+		[CLK_WB]		= &wb_h616_clk.common.hw,
+
+		[CLK_BUS_MIXER0]	= &bus_mixer0_h616_clk.common.hw,
+	},
+	.num	= CLK_NUMBER_WITHOUT_ROT,
+};
+
 static const struct ccu_reset_map sun8i_a83t_de2_resets[] = {
 	[RST_MIXER0]	= { 0x08, BIT(0) },
 	/*
@@ -180,6 +207,12 @@ static const struct ccu_reset_map sun50i_h5_de2_resets[] = {
 	[RST_WB]	= { 0x08, BIT(2) },
 };
 
+static const struct ccu_reset_map sun50i_h616_de33_resets[] = {
+	[RST_MIXER0]	= { 0x00, BIT(0) },
+	[RST_MIXER1]	= { 0x00, BIT(1) },
+	[RST_WB]	= { 0x00, BIT(4) },
+};
+
 static const struct sunxi_ccu_desc sun8i_a83t_de2_clk_desc = {
 	.ccu_clks	= sun8i_de2_ccu_clks,
 	.num_ccu_clks	= ARRAY_SIZE(sun8i_de2_ccu_clks),
@@ -244,10 +277,10 @@ static const struct sunxi_ccu_desc sun50i_h616_de33_clk_desc = {
 	.ccu_clks	= sun8i_de2_ccu_clks,
 	.num_ccu_clks	= ARRAY_SIZE(sun8i_de2_ccu_clks),
 
-	.hw_clks	= &sun8i_h3_de2_hw_clks,
+	.hw_clks	= &sun50i_h616_de33_hw_clks,
 
-	.resets		= sun50i_h5_de2_resets,
-	.num_resets	= ARRAY_SIZE(sun50i_h5_de2_resets),
+	.resets		= sun50i_h616_de33_resets,
+	.num_resets	= ARRAY_SIZE(sun50i_h616_de33_resets),
 };
 
 static int sunxi_de2_clk_probe(struct platform_device *pdev)
-- 
2.54.0


