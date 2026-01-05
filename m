Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A30FCD0402
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 20:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=751CuOfDHWCSCZjhCuc+hswoKKu5SgRYZYXOY8EmB64=; b=TWv+kzIweUFF3JBXInhq1p9QdR
	vhWSdSNJ5dCGaOV2FP3ITKxXl6ManN9sX7157DlG8hirD5vZe6IwX/ofewq3VsAed3PruNBJ3L1+B
	91C1fKjlXqsmYZFglwGkip8a+qt3GO6DESorD3aqyyoQOu1Qv+j7NEOSwbW9o9p4wNdqs8VDElm8v
	YS7zkiCwwWKFvh2hdLfUtpss4LREmHrlRhBrAEHlwxk0CE9Tc7Fx9k9cLhqmHpGVdHOFdn6Z5FmdD
	keD+bB6eXHAT03GNG7mSy3c2LlP7hIipg/ZxGxuniXEQPm1+T7+60i8XVu+MqxmqrtiJlXT8zA39H
	eIEaGBgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcrUM-0000000C4Uc-0KxG;
	Mon, 05 Jan 2026 20:47:42 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcrUK-0000000C4RJ-2WLZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 20:47:41 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-64b791b5584so508168a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 12:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1767646059; x=1768250859; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=751CuOfDHWCSCZjhCuc+hswoKKu5SgRYZYXOY8EmB64=;
        b=kexDJhvpGvuIdjL5nPB41W1qD4PaIO4tu88OlY8wwHcJIHmnDF6qL/43yP6emE1XAy
         DT6zHWlbdeBku8ywCeRiPogoabaQ4KIjhFWMzcNo9ehkwW4EnLpoj3KeZPOP94uzgQnr
         UPjiMpXR9YVX/KpCd/7EGCEAvy8TFBzhQ8jIwt9Hyuo8UccVj2rba/bpSoqHhhK7QUAz
         NqOzOrzzoeveTtCNh+gKOadf/T8ovN8oS4rI4db/mC+ZSuipbXaVA/zYfCzDU+AATspE
         FjqLvUIq5QjgUNGis26y4uXG075nItGUsRyXXzmFXuaYs7CDbKzDOW3wpnUgwFRVEgdK
         VT9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767646059; x=1768250859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=751CuOfDHWCSCZjhCuc+hswoKKu5SgRYZYXOY8EmB64=;
        b=PwyDt4g3YaGAdMHHnhGd5n8wveCINAp7nPa5w7ThLHJ15Au3shTm5/N3uGzaeDdwDd
         fVQuJkfMPmqLV6UPC3uhXcZ1Z1mzBdJox9jBzS0rwVH9AuJOc94Og+TTdcSlLu1veHPq
         bPCc+I4fInTeYVgolWyeVmMvpFfYue5bgpruYyH+TOUYmMzjXYwv18WSNA7XrHfIWlAE
         tOInX24UijydRRtRIguB3xugVPQUD/dMJEo8SqOs9jzpwoIP4ngypfC7cy/TCRsVhWpv
         p+fqBJOXkuTn3xsl5+n9WwYo12EVQwY5ed+4EX7J+9viPfaTsJrX+xrBksyFIATfF0Sw
         nFCA==
X-Forwarded-Encrypted: i=1; AJvYcCUbPE2b9MwZgAm0gwIAndj01yKvqXtShXTq5b2OCbJm2D/t1AC/Qw4M2Koi2lgHNwr25JuMUFoFLmA5mYevhZCn@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3aCRzFKQKzMRzcGZV7cPFXlLakqEHsk/3UlEcESzLe3a2YcGx
	k4WlJ/usUEUzxK8g5wgbL3F6BpDRssSAlcJsNvXS6FCAKtbJ6ppXks1C
X-Gm-Gg: AY/fxX5DZZTMalhgRG7A7iTVDP3KjwbCaNWOxczyCQF0y6C+VHcCd/EoEOb5vT3ADaI
	009QI9bKX/Y2HHctN4XGy6XpYw2vCAozIojigEg/WiB1J5uqG0XIANPD5MTMXwt/KNJUzI0IWyM
	hyVsM1hVogR1/S27dNc4vP47gN0bAwVc0ecRp90rWukrYVBP8pTEzbpAQilGXBLsy8T2W0tI/bh
	IXyHIXj+bnowt++z/WoLp1tfqXH/NdhtRUZhYSJ7e5s7Ebngat8PZDkpgN19BHSDk6N5w4c4PPv
	bBS7p9Tr6pgkFFeujH5Z7Xaafg2Jy4pJBE4Qz/gaB3oxOIWHwfS7DaBgGndihCir+sfUBel9UF9
	QS+QfulgI+1ZTFnrAG4NLMp8YO3jWNhJGddfSOdzvfOTTaPB9I5ODzRXSALXGLEgZGblONWJKmX
	aTCP8wlDZXxquSRDgSO/HH9ZqvzNNoYkvEXI0LJWnM5qjkpcFv7LwmHFeHK62CN7jHPRqMLyvyS
	zlTQa8RHjWysCZvhUQqfzJ8U3mpQMF0qz+lxg3qdg==
X-Google-Smtp-Source: AGHT+IHscVxlfHz208YtyaMmjqXOYh5awKkGUsfs0wVHVO6V3dthos7Mjn3E5Y2bxNVyJyfpmXuwsw==
X-Received: by 2002:a17:907:2d8c:b0:b40:b54d:e687 with SMTP id a640c23a62f3a-b8426bf1761mr111212866b.47.1767646058523;
        Mon, 05 Jan 2026 12:47:38 -0800 (PST)
Received: from blackbox (dynamic-2a02-3100-a8ad-5500-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:a8ad:5500:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b842a233ef3sm26240566b.1.2026.01.05.12.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 12:47:38 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jian.hu@amlogic.com,
	jbrunet@baylibre.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1 3/3] clk: meson: gxbb: use the existing HHI_HDMI_PLL_CNTL3 macro
Date: Mon,  5 Jan 2026 21:47:10 +0100
Message-ID: <20260105204710.447779-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105204710.447779-1-martin.blumenstingl@googlemail.com>
References: <20260105204710.447779-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_124740_655292_5323BDD2 
X-CRM114-Status: GOOD (  14.44  )
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

There's no need to calculate HHI_HDMI_PLL_CNTL + 8 when we have a
HHI_HDMI_PLL_CNTL3 macro that has the correct offset already. No
functional changes, this makes it easier to compare the driver with the
datasheets.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/gxbb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 0788b9b1ed21..0900f4e44764 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -358,7 +358,7 @@ static const struct clk_div_table gxl_hdmi_pll_od_div_table[] = {
 
 static struct clk_regmap gxl_hdmi_pll_od = {
 	.data = &(struct clk_regmap_div_data){
-		.offset = HHI_HDMI_PLL_CNTL + 8,
+		.offset = HHI_HDMI_PLL_CNTL3,
 		.shift = 21,
 		.width = 2,
 		.table = gxl_hdmi_pll_od_div_table,
@@ -376,7 +376,7 @@ static struct clk_regmap gxl_hdmi_pll_od = {
 
 static struct clk_regmap gxl_hdmi_pll_od2 = {
 	.data = &(struct clk_regmap_div_data){
-		.offset = HHI_HDMI_PLL_CNTL + 8,
+		.offset = HHI_HDMI_PLL_CNTL3,
 		.shift = 23,
 		.width = 2,
 		.table = gxl_hdmi_pll_od_div_table,
@@ -394,7 +394,7 @@ static struct clk_regmap gxl_hdmi_pll_od2 = {
 
 static struct clk_regmap gxl_hdmi_pll = {
 	.data = &(struct clk_regmap_div_data){
-		.offset = HHI_HDMI_PLL_CNTL + 8,
+		.offset = HHI_HDMI_PLL_CNTL3,
 		.shift = 19,
 		.width = 2,
 		.table = gxl_hdmi_pll_od_div_table,
-- 
2.52.0


