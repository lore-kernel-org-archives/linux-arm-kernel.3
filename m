Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A0BC54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 May 2025 19:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1Ucq3gyLAIGSeXu4sFQOwhmUA0D2m+wAOAZQ5q93w2I=; b=LJ3+H8Yvm3nV01h3XkIkD4975R
	ShU3JNTMbqVh/tLI4cZtMRrTPtzPaycW31yDjm3amdH3QeMbYbxHnDfivz4wik1uYUeoXMiLMoHhp
	C4qgC9FvxHKGec/jU2b2A7C8dc4GAQwA/1oKyELp4yEkA9R7oa2j6eUKeC0z7a87U/VFBUP4cxXs2
	dSx4Q5yGi+J4QJt4GVcxtC4QqLH8yWeX+RzjjzpaHbxiO5oy8kPqRPpc1YcHQCEDm95rZfw+NfGr/
	hKFbrNT4rJY20U+uro5U1+p0F9nCZ1atWWyHZpNYY05Rm69yM0HsjAEHEB1abI+lRd5+hhTXjDxqp
	njfZ2SRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJGoU-00000007YaD-2fFC;
	Sun, 25 May 2025 19:15:14 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJGmP-00000007YS4-1y2u
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 May 2025 19:13:06 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-ad56886dd60so21740966b.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 May 2025 12:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748200384; x=1748805184; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1Ucq3gyLAIGSeXu4sFQOwhmUA0D2m+wAOAZQ5q93w2I=;
        b=Jbp6fjcgfVqKDbP6ooUQHSmdmqnw4OF0+sRl8N/D7Huoet9S/For/nAGsIrntUUtCm
         YknifZmFdYk5jMvYrJn48RmfpBc2+CHFDuIl4DSg4ivz52JA7cyaObIIb/pjXQD+dxcF
         ugYz3UJLPXkzQbThMCCxBDBhGZhKqk3A9tWc1QApPu0Wwn8z6rbsJfGGAfDcxT5iJGsw
         ov+BHcteDEynv4uyK6WuoOpxu6Rk8+CU8Q1gDuGfkT+v2mhGS65wkRO9CHnBJuZsuq6h
         lYSi/REIX+LkSE+J9GlkraHnxzBVIa2FDb8e6j5nVkohe94JzH9bKX1ecOzHwT/VZ6aa
         IfhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748200384; x=1748805184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Ucq3gyLAIGSeXu4sFQOwhmUA0D2m+wAOAZQ5q93w2I=;
        b=hi2sTmtOIKKRFrld9CB+U77+DhFrFf63Mgd9j4Q4AfVyM2oeMdtq+NuOI6jeV+ScD0
         lMeG0hepEFH6cRpXBghZy/sLVPs+JIzyAxjaEj5NTCcwObzmcSxHVg7v3WJA8Y7goNl3
         HoyQqMRXvra6ZO9iJ6eNK+rq3zBoXufHSUlQ/0xYdcCutNKOHFYPL/99QM89RK3cS/1s
         XXtqOUgmqmyUIh8GT6vc5YJEqqbgX/zjVTBLVXm2jJ9BkWt1nlBiNXxy8V1jm8AYbVJ4
         MRuWHxVpdZIBYzmgGXkXfwiLJY/lqyaOY3Idt30YEN8dRd46MlnhOWupryZf8YOmH05w
         wdrg==
X-Forwarded-Encrypted: i=1; AJvYcCVsUwdJoFnj9ShUqYXOoB0R4552HNrGv/Iku5QuYRqAMqlLzQhRO2uzL+Vtun5uB3j5rfirYI5m/hLNvc4mHsYv@lists.infradead.org
X-Gm-Message-State: AOJu0Yxw41xYmejajy9LnJezMnfxuLOVQqtEk0QVdjOMrSWJejk41C86
	u79ntUBbW5GQCHYA73MBrjRkb0dNAxonjnjcrL8CKK7iS5yyPcfQ2n8nfqdBU6rDoZg=
X-Gm-Gg: ASbGnctMqnbmxhm4+dOqT0L25EW/Nl6LgUz/Us9FnAp2QaiV8ZUl4iKE3jsFurxy7ix
	AcrH4dPzAj7VsqLVzmGPFXVTlXswNFdt9aggIA3kZZGO3sKF/MZTZnswNkcXRQI3jlzVvCVOnln
	p00ZFeANOpU5W7LdI/oSiMN+9gNISamwdGLVS+Pygj2qoCRZUbIfMilHYMXMMvpT6WH+HLKsx6o
	YenkJ/GAFIMl38REFkkf9QTE4ZOkPSZtlwB7SBqw8OwFMqGdOszKQ6CQ4ZUPr7JOt1xTtSU3+1/
	Ka7hykqPqA6LnB0LwZlGIshM03zBly5FpOWQoY9ivfBhqlP2HJe3odHhK0wj+w==
X-Google-Smtp-Source: AGHT+IGf+2TeC9QK6dYZbJRoR56I7p53ILlhtD29asCKt0/mN+wu+zXhz6Rm84i7lO34hXxNMSklQA==
X-Received: by 2002:a17:907:2ceb:b0:ad5:1ba6:2177 with SMTP id a640c23a62f3a-ad85b07045emr167132666b.1.1748200383657;
        Sun, 25 May 2025 12:13:03 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d4cbe90sm1554533466b.165.2025.05.25.12.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 12:13:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] memory: stm32_omm: Use syscon_regmap_lookup_by_phandle_args
Date: Sun, 25 May 2025 21:13:00 +0200
Message-ID: <20250525191300.50873-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2266; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=UodeGMQ8/36hFynpdApuECu5dDrxfqy7USHoaaccAzU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoM2u8ux0aH1Fna9DGhdBNraJjTPdmFk5vieE69
 Bby+tFVA0GJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDNrvAAKCRDBN2bmhouD
 17PsD/9JDR2rnMkSvRHRyOxDJn9SHRhKbdOGbr/z2BZUD2Q3Udhuoagd9HJVcK/w8YczZc4hURK
 lU8HwJvJQmqZeNl52AbkfdE8AQwCm3Gq527piNZIF670p3fu4fvO6TTCfr0/7pQ0EypWkBTUMAq
 g3ntprR9Ltc0PvMRv6JoILjlg6iFlt+RPV1uWm9Dgs04QX40e9IoEmD/s/eX22eKaAMQKWiqInb
 i95/ALzUOFJK0UCt3WclL5kUv+Nm1jfgr27hV1A8uHuWQox2jpxqG+M2DxVenEhV8trKn7kaPPj
 AfYUg9qHg2KcZRAxoitg157g0y51YJDMWzRIyBRJuhO4b0H+w0X05yLS06CpdyY7dBQpjFFXv0G
 choT6n8YDDBtNDizwrSFeULMn0ASaThqtVctlLgzTUnbK+2br1abXSYlqOwaMiA7+twzcsX0yBa
 6+ko27RDUB7Kbu4FPFa5Iwl5VUqXK/oleCKlFPDdcGj/qYBEYASbYoH4wKYXy2OeKD3vFQHzL3x
 4qvgO67NFLfAV5+qEpCKQ9LcmImXPccX4GmIpiX96mGIm1gmmmwV5bCuNVOS5XlxHHpuyD4mLzb
 DLz3cX+M4ExbFfiSOMwBZQkd3UEOIohp5u2llvVQJY8ncZ+byPDkrSrYrUPLOMJV2JWJnR0tvzW 88dCxUyJBpvPfPg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_121305_521273_3290B16B 
X-CRM114-Status: GOOD (  11.22  )
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

Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
syscon_regmap_lookup_by_phandle() combined with getting the syscon
argument.  Except simpler code this annotates within one line that given
phandle has arguments, so grepping for code would be easier.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Not tested on hardware.
---
 drivers/memory/stm32_omm.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/memory/stm32_omm.c b/drivers/memory/stm32_omm.c
index 79ceb1635698..bee2ecc8c2b9 100644
--- a/drivers/memory/stm32_omm.c
+++ b/drivers/memory/stm32_omm.c
@@ -46,7 +46,7 @@ static int stm32_omm_set_amcr(struct device *dev, bool set)
 	struct regmap *syscfg_regmap;
 	struct device_node *node;
 	struct resource res, res1;
-	u32 amcr_base, amcr_mask;
+	unsigned int syscon_args[2];
 	int ret, idx;
 	unsigned int i, amcr, read_amcr;
 
@@ -98,29 +98,20 @@ static int stm32_omm_set_amcr(struct device *dev, bool set)
 		of_node_put(node);
 	}
 
-	syscfg_regmap = syscon_regmap_lookup_by_phandle(dev->of_node, "st,syscfg-amcr");
+	syscfg_regmap = syscon_regmap_lookup_by_phandle_args(dev->of_node, "st,syscfg-amcr",
+							     2, syscon_args);
 	if (IS_ERR(syscfg_regmap))
 		return dev_err_probe(dev, PTR_ERR(syscfg_regmap),
 				     "Failed to get st,syscfg-amcr property\n");
 
-	ret = of_property_read_u32_index(dev->of_node, "st,syscfg-amcr", 1,
-					 &amcr_base);
-	if (ret)
-		return ret;
-
-	ret = of_property_read_u32_index(dev->of_node, "st,syscfg-amcr", 2,
-					 &amcr_mask);
-	if (ret)
-		return ret;
-
 	amcr = mm_ospi2_size / SZ_64M;
 
 	if (set)
-		regmap_update_bits(syscfg_regmap, amcr_base, amcr_mask, amcr);
+		regmap_update_bits(syscfg_regmap, syscon_args[0], syscon_args[1], amcr);
 
 	/* read AMCR and check coherency with memory-map areas defined in DT */
-	regmap_read(syscfg_regmap, amcr_base, &read_amcr);
-	read_amcr = read_amcr >> (ffs(amcr_mask) - 1);
+	regmap_read(syscfg_regmap, syscon_args[0], &read_amcr);
+	read_amcr = read_amcr >> (ffs(syscon_args[1]) - 1);
 
 	if (amcr != read_amcr) {
 		dev_err(dev, "AMCR value not coherent with DT memory-map areas\n");
-- 
2.45.2


