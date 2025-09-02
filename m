Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E84ACCA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 21:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wB2hOz6NFjWbWAhm1PV1EJGvhxwPuieGYAKDStpXw6s=; b=GpNLkHuXX/230eSNIwX3KVtH8a
	6QZBHzg7Nfjbw2cc5iJPZjVHjfw7h7xVdW6kkDtOe2yVYGsEa/OybEPrlH5DXPzKneuS9/uAoRnx9
	MtUWoeqEIhe8poEGq8V1juHDvCYpALTzrFGafhqNNhRRLFlheZpL6//iY2peG76pG5YT+GA/YEvIW
	Ict4gZShlFcf7TaSnppNzH02r4mG0MeQ6jwSiv4I7DOPYGWlanlJ3wJxZQNKBYAvMoQkw8ilpX6+A
	hR7qXPZ1rrckgi55ygF4pwAvTJ5XssO3UfEthoT72IMI7thF5ux2T0KBVcOLqPaz502OG+hfVeZNn
	hWANuUkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utYmj-00000002BW0-0r3Y;
	Tue, 02 Sep 2025 21:43:25 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utT7z-00000000jWP-04Ro
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 15:41:00 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-61eacd38e75so300934a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 08:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756827657; x=1757432457; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wB2hOz6NFjWbWAhm1PV1EJGvhxwPuieGYAKDStpXw6s=;
        b=pwY9/D2P413LlH6Ca1PtDi08UG+RiQHugDobOrsr3OCmwlb37WU52IWkrHuhJPI08L
         gvuqs685M44pfqGKCXvTvmQ/OV1gMdEb+WaBDzN05YHUTtqvLR7UgFdBsTseh7IRtoyd
         w9YULZDQ4Lyg0JZGYYtkAHYW5areFq84ct90SUqE7sS7S5ctmPOEvRewreEkXVF/7+Co
         lYk+j0BMSdjTFBf1GBFRnMMh3VkBctHZlPYvwBDecHwHIgyFEc2sHzrBstk74Cjq/pqk
         FavhQBN0hp2te/upCCaDTXUG8aNl41xogt5Pj2u7c6Ml37LMhM+WkHsoSXkLbo6yx+8p
         1xTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756827657; x=1757432457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wB2hOz6NFjWbWAhm1PV1EJGvhxwPuieGYAKDStpXw6s=;
        b=f7Hn4r78WS/HZgTarXBwztrMIyODYjMuQ/ySXp8JIQkVVMCS7hbllRChISdygMucKo
         t0WMg6zpADWtvQcV00u6XpmPPgrnEoQy2v7+NwrhF7z6qYDwSe+FBiNuCkDNIlemHqyL
         XHOOWVh6ndQ/TjW7/wQKmBLM3Ohjv0Lh1pb2yLG9ZlbypFRXZLxXXAURb8jfGuywc6pD
         cLGrb2D7dnRkoJCcMvHCaJU6+i87XnHO/SPgm095VqJG/fa1QtZ7+byDNTXNVXwEzHTj
         pp6Nympt+wbtGZC1hj4qmauDH4PIdt+1nc8J8qAjwStQvbulGjI2C4s/WkQibAWyW9b+
         rPaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZjH/NJf9Q1nJVbnwbNtU/KU75JetR+hXZhtWXGY/VIQCS3xXrefJGUiHYinJkJc6bavLQHMZBcIcCdvrPX4yQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5lu+NSsjCpQ4VYTVzG0zsKOlIfchSQHIYVb/5QO+KwZo+A4zA
	RUa4WlJVJ5oO9+0Yk/7xgbH6DNcfnrNNVUEDZCvwwFNlOHWbQjnCyuRUhwHXQb1pIew=
X-Gm-Gg: ASbGnctDsfT8VvjJlHT55MmIZzaQGnSqxLpT0EZruBQlCQA8AwqG8PxqB3QG3FXoQhI
	PYRpwoN4wObvZUw8nhqMeAddPiR7shaxsEieHeSoPZDtuDZ0ordnh4maUC9BeUe53K7v4JMmDxk
	WMSjWwGXLK1cc954LRPjmGsYzTyQNyyHIVYXtuV0XMFD5julkZK9Gtds/hiKMfD2vyG+2xRUdQj
	ABmI6s7yyLx6rRMBHpFohN1QskPPf5+or2qCqaZ+PeAk9MXxSXBT9PVNdpEQRXF3FSt09bDtnFj
	g4+kYr8m7UO3cY5mzEFTGWaCmSjUvUeq9K9793TOA7PoACdKAiKWnOGKG2T/Ykafp44LP1ibOlx
	eQL+ecopPINSZUTOgigFIFp57USTI3ZP7pw==
X-Google-Smtp-Source: AGHT+IEWMtUipiwvP55o7SnFFNedcIB9J8Y92SnsL3bGTAtWU6+jlkNHHkULu5G9fMF+Xt5W8a2bmQ==
X-Received: by 2002:a17:907:3cc3:b0:afc:ebfd:c285 with SMTP id a640c23a62f3a-aff0edc4d6cmr819502266b.1.1756827657134;
        Tue, 02 Sep 2025 08:40:57 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0438102debsm418746666b.66.2025.09.02.08.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 08:40:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Matthew Gerlach <matthew.gerlach@altera.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/2] dt-bindings: net: altr,socfpga-stmmac: Constrain interrupts
Date: Tue,  2 Sep 2025 17:40:52 +0200
Message-ID: <20250902154051.263156-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=968; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=sFLVskm/GZvqeQI/f+rrxfYgvGE1+3DHh+EYMzpJNhc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBotxAEs7Pi4pRQzSl+H723I8RHNxnqQ8YsTSkC4
 vkxAmnxXj+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLcQBAAKCRDBN2bmhouD
 1+k/D/0UuXc2i9vi5ZJEk2QSnLsML7RPV42gQabAHH1WKmWnL4CAxBu79LPPNM4a7I1ooZ1jhtF
 Mr0HfnWsGPBrGmp8I1/uv/bXwxzHoXkai/Nz6y8C7yM+JNberjHA+TiBdQVzwbVM3RrI3EPANB3
 lWmBIcSxHKokKT6EaVY1AKnmFgurZZ6y0eBstHMsdJ6ELNsyPVyS6BaAUipo++or72IL3/XbP8t
 o30+Rbvby6HDByLMYbdefwjD4wAzJUzz8Y4uN+rOxXGvErZC3E1bvX2mJG5WVYkRRwTSN+cWw3R
 YUEAJdS3sN0m7TIPexcrKhSmyvNL+7CebE/kX8UNOcms6KyQpmTkmoiwlKEITwCuKHu7rqCcloj
 kXbG0f20Poz5QjpvoBJMOu13+2qCJcWhUCRNVXOGGHVR1EEKa71BYZzwH+6eM1Di4nxFa901haa
 MPJ/wDC6mZ5vqxoKG1aMzF8c5gTYUdO8z/1pyNpGzkwLLdQdFo+k33FRQmngLKLdN3TmFgHHaya
 RVG8d1yntleXzsQP6HRY2mICIMlwAy2wmRJpiusUUYtjnOE96Z3zIcA3TBfTXlXA92EGeJtuUKv
 O16pHUiaXsjIP1644k6rtwNhNVpYEVZ1NJokD2I0xZ5+2h1/Xa7D3vHI9tqIkagc3GnIv4q92i7 pJ52l3zbCm7aBLQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_084059_069037_571035D3 
X-CRM114-Status: GOOD (  10.25  )
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

STMMAC on SoCFPGA uses exactly one interrupt in in-kernel DTS and common
snps,dwmac.yaml binding is flexible, so define precise constraint for
this device.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Minor typo in commit msg.
---
 .../devicetree/bindings/net/altr,socfpga-stmmac.yaml       | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
index 3a22d35db778..fc445ad5a1f1 100644
--- a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
+++ b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
@@ -62,6 +62,13 @@ properties:
       - const: stmmaceth
       - const: ptp_ref
 
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    items:
+      - const: macirq
+
   iommus:
     minItems: 1
     maxItems: 2
-- 
2.48.1


