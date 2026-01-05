Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6796EC9833B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 20:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6P8LBmvGnTOHrkGqJNJYNGnVf7vFIplFOGVmqZklygM=; b=A3eCK14IGLpMocOD+Czq2OT49t
	BGzRXQuliWcZ7LMz8j4MpMX7Iad+o+YfAe8X0KWCjEXoR0UI1BYFc6mG2UraN/CKd9GAhChh3EdtL
	2w19TtxSd++GdZxQnCwFZWfN7LSUOMEnezI68eyxFP3Lyd1TOMmpnZzpC1eXl5hx/OUttouVl214N
	QJG2IDcBCjHKrewQJgvSAESTGmBzx8/t/FfY4Ml8pjEk0j55EZGYGQuYS4iLfta28iwV0bapFD4LN
	AUbPiLj/BjpVccQKOq5RbJ3NvSaSZ2Dd0q79C2Ik2SfVNCeyBMk2u8XUHiz33XP+pEekC46lXa+3t
	dOBVEi7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcrUJ-0000000C4RM-1iDy;
	Mon, 05 Jan 2026 20:47:39 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcrUG-0000000C4PR-3Lqx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 20:47:37 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-64b7318f1b0so427428a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 12:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1767646055; x=1768250855; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6P8LBmvGnTOHrkGqJNJYNGnVf7vFIplFOGVmqZklygM=;
        b=Zm9zIceL8BIWeJtRgWF6R12DV1wOsQaRbu4d0q9Y1aCXRfNaftTmvUKrF9STf/B628
         5/66Ywb4RomPviZ5C/CWn1+3Hyz4f0QWJkpDAXXGS8MsK1p5TKAA+ecaBsNqN3XGu9rG
         OQVDQvcN3aGPgPZhQP5TkbZ+nGc+7lgQA9Ty3uPySB+zxOcWw3RU9i6OVg4CZPvWr8eG
         HFfiM4GB110Bjknuo7F3ANgJhONq7OYlJRuILpiXW7vAVDiwQLVCsoDVnXsd4QAe0ZsZ
         cNSlv90//e7f1xLoi+iQ/0lU1ogsRSte4Q7qd6TiGV4THlLXdEjjZZedCeLnBSjPaxM3
         0RDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767646055; x=1768250855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6P8LBmvGnTOHrkGqJNJYNGnVf7vFIplFOGVmqZklygM=;
        b=hQlruzklJh/k9UWgi5WEo9oBDFdYXtlz8Q4CcEn3A0Pgmg/tYhbwHBRx+Sh9AIlRTb
         XPx9p1DqQAONYyaM9z2h5xn803680ZSDftTBy5osySyns+yisxsHlfiSVbbWQspBA9ke
         wJ5JwVao7bgKtNS1t1Co4mcQZkzyt9IN4hMhXYdQGveHxOqGYh9bKxLFrW/rfNKyQq+3
         4yLl1EbQRXgCOjr7KYixPPnPxxr4Rn9SF732cnYgWgVkz2Rfp2LTtcaReaElzTHLWMMg
         /3bbLTifieh7Yba4gP40JHu1Oj4XxT4G1aiTZeSFpsHKt6Y3m1JIemX66T/iNsc/GPKt
         OBIw==
X-Forwarded-Encrypted: i=1; AJvYcCUwtwFP9XFyfW7opXjyBah9pHQTgRI447GlFWhb3HOthLrJls58GJEu9uktru6HLDtzYlAOF/Zi0QmoX9llQ0F/@lists.infradead.org
X-Gm-Message-State: AOJu0YwliKUuVhnFgA0bahTyshIIAZi0ZgKaXyoVgYJsqzMmfmH2q1QT
	EQbk1y9ZrYNSjUba8Sd0nI8NL7igaDzwO+EedqQBVPH9SnkCwr2qY4Yb
X-Gm-Gg: AY/fxX6n7naT1J371OAQPvyV666uL9ijjH26ljVV0S5U2RgtGV0zS1E6nMDiQ5K7xWx
	UBXAx5xVR09PyNB2aIWQSDpFGUr3VUNYOcFin047Xdl9nLYb85hwL55lOf3GQxjTwC80mf180GQ
	Ckopw3GFU5/1TWnwY7wxmUI0iLQrsnOP1y0HpLpH1V4i6lou3LxFIAv57CarhN7Aj9rQNp/CVVO
	P7SJdEW3G3KV32sVJjFcgVvYd4nRrkdPyax0uuGlWELMzgBhNpQLccf1pYpGBhE/Lc2G1uv5FeM
	wwr2k3C0xIeDGZsMqHnCiMsCNc2PI+C7PriDxwZPF43GGw4oAoEZPzL0dYIdw9uG1uGlauwXeBm
	IbwurwlsA5HuxbjT8tGyzbd/lvaCrJUHU6Eo4bFAppQLtPfGD9vXj4JZvnNrKT8OmLx0y/O1QOh
	c7RH2cP2EQX0u8YqzuUT6z3LfUunlIE1dYGIMbsc40vTtt58Cir9bUcOTdS2sNJjXZ8z/SRx6fo
	A/CO7YdtGi0GE/dJGFzlZ4OeKluziWj+kj2ze2hoA==
X-Google-Smtp-Source: AGHT+IGG1LQBfEPmFlrxpYd8DB9+gcGLWD908SEefSfmMK/DBGdhRfme546/4V60Eq3pmIsZOVk88A==
X-Received: by 2002:a17:907:944f:b0:b83:13c3:d495 with SMTP id a640c23a62f3a-b8426bb91abmr96266166b.37.1767646054735;
        Mon, 05 Jan 2026 12:47:34 -0800 (PST)
Received: from blackbox (dynamic-2a02-3100-a8ad-5500-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:a8ad:5500:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b842a233ef3sm26240566b.1.2026.01.05.12.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 12:47:33 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jian.hu@amlogic.com,
	jbrunet@baylibre.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1 1/3] clk: meson: gxbb: Limit the HDMI PLL OD to /4 on GXL/GXM SoCs
Date: Mon,  5 Jan 2026 21:47:08 +0100
Message-ID: <20260105204710.447779-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105204710.447779-1-martin.blumenstingl@googlemail.com>
References: <20260105204710.447779-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_124736_853267_F9C7A61B 
X-CRM114-Status: GOOD (  15.54  )
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

GXBB has the HDMI PLL OD in the HHI_HDMI_PLL_CNTL2 register while for
GXL/GXM the OD has moved to HHI_HDMI_PLL_CNTL3. At first glance the rest
of the OD setup seems identical.

However, looking at the downstream kernel sources as well as testing
shows that GXL only supports three OD values:
- register value 0 means: divide by 1
- register value 1 means: divide by 2
- register value 2 means: divide by 4

Using register value 3 (which on GXBB means: divide by 8) still divides
by 4 as verified using meson-clk-measure. Downstream sources are also
only using OD register values 0, 1 and 2 for GXL (while for GXBB the
downstream kernel sources are also using value 3).

Add clk_div_table and have it replace the CLK_DIVIDER_POWER_OF_TWO flag
to make the kernel's view of this register match with how the hardware
actually works.

Fixes: 69d92293274b ("clk: meson: add the gxl hdmi pll")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/gxbb.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 5a229c4ffae1..0788b9b1ed21 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -349,12 +349,19 @@ static struct clk_regmap gxbb_hdmi_pll = {
 	},
 };
 
+static const struct clk_div_table gxl_hdmi_pll_od_div_table[] = {
+	{ .val = 0, .div = 1 },
+	{ .val = 1, .div = 2 },
+	{ .val = 2, .div = 4 },
+	{ /* sentinel */ }
+};
+
 static struct clk_regmap gxl_hdmi_pll_od = {
 	.data = &(struct clk_regmap_div_data){
 		.offset = HHI_HDMI_PLL_CNTL + 8,
 		.shift = 21,
 		.width = 2,
-		.flags = CLK_DIVIDER_POWER_OF_TWO,
+		.table = gxl_hdmi_pll_od_div_table,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "hdmi_pll_od",
@@ -372,7 +379,7 @@ static struct clk_regmap gxl_hdmi_pll_od2 = {
 		.offset = HHI_HDMI_PLL_CNTL + 8,
 		.shift = 23,
 		.width = 2,
-		.flags = CLK_DIVIDER_POWER_OF_TWO,
+		.table = gxl_hdmi_pll_od_div_table,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "hdmi_pll_od2",
@@ -390,7 +397,7 @@ static struct clk_regmap gxl_hdmi_pll = {
 		.offset = HHI_HDMI_PLL_CNTL + 8,
 		.shift = 19,
 		.width = 2,
-		.flags = CLK_DIVIDER_POWER_OF_TWO,
+		.table = gxl_hdmi_pll_od_div_table,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "hdmi_pll",
-- 
2.52.0


