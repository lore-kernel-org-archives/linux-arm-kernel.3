Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE32C98335
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 20:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hizUAH1iD19ouU6HKSD59ruDhjDWmQAYbT869eukFQc=; b=JoGzj9BM6AnCKPspEm5NwUB/a3
	c0/ri7LdyBWHWDIXM85+CGb6zdbu6001ZFwXkYGhLdm47G3GTclEhX3LhOvMmBOaBY4QS5cZwlQgq
	fXDm8NYiQRk/qdKKNeOj+EUaGb8T1Vq9bQARHybp4f45SXODCsWdbFLlQx23SfNp8i/qTmc7Ut4kn
	D0/Dms9jjvw5JewNfeHjRYnEOM+bUXEFC/Yo6KoNULQX1mGWRSP88rcXK91/KjcVVR8Sudx6sxZta
	hGYQg5RyMfJde4Bvl4e5Iv27lfdiet/VX6lbw1WS7RNLh43Vf8SS+6jHxbyY5kkzisUSNNZPsgL7s
	7eH41kXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcrUL-0000000C4Tc-26eQ;
	Mon, 05 Jan 2026 20:47:41 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcrUI-0000000C4QL-2xgK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 20:47:39 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-b79e7112398so58341466b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 12:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1767646057; x=1768250857; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hizUAH1iD19ouU6HKSD59ruDhjDWmQAYbT869eukFQc=;
        b=m951FwqwF8Sbkr+mZVwqCS4c/vITK0MWFZ5k/uhHVvd6w4AhE1sQ50adqwGjweedmf
         D6sMsVkW8iSgPKFoCaJzl/Ns66X6hFbDRtoM9RhezebQeq4O9TDYd7PyVOsTIYrTN6VY
         xv9ee3oSIki69XA4OKsQ2/F/4pJIXUgBSK0qqaasc8RGuvcp2Ec4S+g4RWaomR/a19h2
         UaSaOzdV1VsdcXzj/Vl1fVB9hyxAXebCFFG8utXn/B+AgiHoE7Fz0ItGQ8o1cEVdrQO+
         RBPOb8f6dnsYjem0tZnvIP4b+UgWvutZ/446Z1NEON7G3PJR4WSGIynSZgBMJSjs1fF3
         2uXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767646057; x=1768250857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hizUAH1iD19ouU6HKSD59ruDhjDWmQAYbT869eukFQc=;
        b=tyyyVTkAHp/AqRA+Hmqzzs7ANeFcbCvuOdNBIN9aPQu/JSGo+HC4+BfjcRAAzFK+uO
         Fu4WazfnETcVzDaVIobxyAzvw/AUouDYUgW053KIa0/ssDxd74OJRtON6C9QLRi74YNR
         bWs5h/AhVK6/5+sX70x08DfPNbVf+A7sv+paK9H5wDhqCryV41ZoLim5KGcH+iWbp0+E
         gJPbZI9upSPuNPk4dIlOgp68JHlUifHpMkt7MEELquJePROiVYVJx0TJo3GNuj1VaSDZ
         ZhJZcBqVM+V8R6u7JX06AHNgkFa1jKojLV749xeUHMRlJvCz9VsjB6hxWhHbnKvUytYr
         8ItA==
X-Forwarded-Encrypted: i=1; AJvYcCWRMIK8X70lV15kXPQOLn4UD5s6FqkhJ8mi/SW/F1y8ApoNR7dTqdv5+HsGAhLfoa656fqCbY6BDDGu0lB92Bnc@lists.infradead.org
X-Gm-Message-State: AOJu0YwnHhN5qx6UGNIPhoXRAszWRS4brwmLU9eJujU22nt5s1Y+Ba+n
	V7Z1O5HHSyeY4iBfFyrRMKK7uDJvr4unW+3Dgm01gkFm+lPZD0Lqtmd2
X-Gm-Gg: AY/fxX6Yi2am26rt0wWmv3QYGCaOtxTAFKBWjK9GE32Y2PZKSxb9gTCLq70R16b+9B5
	59yxrLx7cRNPJLKYitMMMcTRWBK5dn7JzYtS1HD6g5EYRgT2canLxxxbxWZe7yngrhx7EwxdihB
	A8TFLHv5AbSO+BMQ+0lRQgGEFbit0BJNr15zC33kTX8JT4W3xlM9hUYR/dCwTA9gVO7VDgnYnyM
	OIEqEYoQDM4gJb20XVzujeOptsVQFz6OIss2PZE2KAszjzVzXRlRB4pDGOwh9vHxS0RfCMvuSyJ
	x8U98zqUe5i2CshqkfV7CK7H6nFwh3socs2kipX7qAlYCDmvuXT9HkSdR4Wac559WewfI6AP1Oy
	0jAPli92/N9zhfOXyRxQzbOKFqhrox2sG1bGggOdOpL3dVPeCy3jPPuZ4Qt8dO6nrkxyShqRwbt
	Dh6PDAVE9CnVhbTtwZMtWwKeoKgy/DJ4wii9T4yS+ih62Vnb4vpK5su16XrxwBw4GQMMvq2ub8m
	kOOXfneKalcCZtvoxSUJMWwtv4lcISKIq70JPmlFA==
X-Google-Smtp-Source: AGHT+IHoFwU8UR+te3U4dWAJlcYcZOAjrsIoaFipeIJMAXppeowFkGiwsu7iqdcxUVE1fCrIPqg8ww==
X-Received: by 2002:a17:907:3c8e:b0:b79:f965:1ce1 with SMTP id a640c23a62f3a-b8426bedeb1mr92268466b.42.1767646056667;
        Mon, 05 Jan 2026 12:47:36 -0800 (PST)
Received: from blackbox (dynamic-2a02-3100-a8ad-5500-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:a8ad:5500:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b842a233ef3sm26240566b.1.2026.01.05.12.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 12:47:35 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jian.hu@amlogic.com,
	jbrunet@baylibre.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1 2/3] clk: meson: g12a: Limit the HDMI PLL OD to /4
Date: Mon,  5 Jan 2026 21:47:09 +0100
Message-ID: <20260105204710.447779-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105204710.447779-1-martin.blumenstingl@googlemail.com>
References: <20260105204710.447779-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_124738_765252_1022FE88 
X-CRM114-Status: GOOD (  15.24  )
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
G12A/G12B/SM1 the OD has moved to HHI_HDMI_PLL_CNTL0. At first glance
the rest of the OD setup seems identical.

However, looking at the downstream kernel sources as well as testing
shows that G12A/G12B/SM1 only supports three OD values:
- register value 0 means: divide by 1
- register value 1 means: divide by 2
- register value 2 means: divide by 4

Downstream sources are also only using OD register values 0, 1 and 2
for G12A/G12B/SM1 (while for GXBB the downstream kernel sources are also
using value 3 which means: divide by 8).

Add clk_div_table and have it replace the CLK_DIVIDER_POWER_OF_TWO flag
to make the kernel's view of this register match with how the hardware
actually works.

Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/g12a.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 185b6348251d..19057d2dff47 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -777,12 +777,19 @@ static struct clk_regmap g12a_hdmi_pll_dco = {
 	},
 };
 
+static const struct clk_div_table g12a_hdmi_pll_od_div_table[] = {
+	{ .val = 0, .div = 1 },
+	{ .val = 1, .div = 2 },
+	{ .val = 2, .div = 4 },
+	{ /* sentinel */ }
+};
+
 static struct clk_regmap g12a_hdmi_pll_od = {
 	.data = &(struct clk_regmap_div_data){
 		.offset = HHI_HDMI_PLL_CNTL0,
 		.shift = 16,
 		.width = 2,
-		.flags = CLK_DIVIDER_POWER_OF_TWO,
+		.table = g12a_hdmi_pll_od_div_table,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "hdmi_pll_od",
@@ -800,7 +807,7 @@ static struct clk_regmap g12a_hdmi_pll_od2 = {
 		.offset = HHI_HDMI_PLL_CNTL0,
 		.shift = 18,
 		.width = 2,
-		.flags = CLK_DIVIDER_POWER_OF_TWO,
+		.table = g12a_hdmi_pll_od_div_table,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "hdmi_pll_od2",
@@ -818,7 +825,7 @@ static struct clk_regmap g12a_hdmi_pll = {
 		.offset = HHI_HDMI_PLL_CNTL0,
 		.shift = 20,
 		.width = 2,
-		.flags = CLK_DIVIDER_POWER_OF_TWO,
+		.table = g12a_hdmi_pll_od_div_table,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "hdmi_pll",
-- 
2.52.0


