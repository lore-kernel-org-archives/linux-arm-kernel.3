Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA4F4C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 08:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dC1LPCsdF2Z42Jp+jxNOAqnbNIqpSsoAUsorj5VopVg=; b=1SNnxDm2fRdvAkJH8A9aVpkgvX
	5xpTCngdYQEJYvGdPBLOJUPKKha21MvBX6fJyAg7gmPh2Tb9nYbQV7p3PEzS6DYNxH2jHKsA/cD5F
	wusVkDviIRNIfKD8Z4Ef5byw4tSQmiXvmoJMQnGRn6GB5s2pZutyEb74DVIEx1dtMupXzaXmHuiiO
	AUVEIhpnetxPi0388U8Q5g15yEQQ8t3FXk/NpqW09WPh0E4yHPkLrenef4Z4YeEzS/laRbuWk3O6y
	JW66Gq02EW2fVNC7JzLj779kmRjcB0EFk2dlyxtjqzKZD3rqv97Y9TS2Tmy1uK6/iBzhtf4VxShOk
	RegHK9kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqStH-0000000DWvJ-395A;
	Fri, 07 Mar 2025 08:17:07 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqSqR-0000000DWOn-1i2s
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 08:14:12 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-39130728338so37987f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Mar 2025 00:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741335250; x=1741940050; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dC1LPCsdF2Z42Jp+jxNOAqnbNIqpSsoAUsorj5VopVg=;
        b=DOZCfcuIozlHkaBEilWjygmCxGynMYc5ZbPmDOGjRNWfMa+F992FtbhJJKN7UUbo8M
         ai6dM3QD4rdOf8YJlr49JJl12FDbwTKQYMTFIngvWK3E4boL8bLHB6hGx0ibT4bm8hFy
         hHK/R/K0j1hmp0iA5s/YaW9vQUXWhhZD5/n6SVdOAMo9mV4iFifQt4YpK3PEuS9FxM82
         +lXyIFn07zQK1qB/+mtVYtidVkqhoJEmloYjwcEQvSCfNQl7w/uInAS7p8owezdA0kzV
         G2L8LOBWLy8Z+l7IKhFGi5HmGqkx8j4PmyCT45wuhcUEc5B/laA066/5lC8rOAHVvAtJ
         wURA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741335250; x=1741940050;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dC1LPCsdF2Z42Jp+jxNOAqnbNIqpSsoAUsorj5VopVg=;
        b=SRqA7+l/hcWWIRoezIG6c9/pq3dnDSpvGer3jnhmu+ABug7A0MOKrzWy9yAwPWrzBo
         4A3tSfgB3qtGCExTt4GyC0tkaceuve4jrjBN0lzOZhUPP/7j6L+HVPlBN07imkK5U0sW
         GMmRyvTfCF8umnupP35jpkZTD7tRocWU9+L6hoSKQy9MaxjgaXfMl+4Mb5/uS53o5iiL
         r9BfA6M1vdTXSjtGQiIXQRrGm2CvHtMwxqYlF8YFswkPmP7Sp67kEWZS36ckt/sL9fvX
         pHISantG10VwIY0/1jdtYaAh9ql4XK5obvd1CCiU2Vt0YyihT/zhjqJps/sk9H4jK4I/
         Xlfg==
X-Forwarded-Encrypted: i=1; AJvYcCVA++qKrYFwDyE1We4EJ8ykNM6Pg62me5aPlEd2lt4N/ZDEl3u0sQRDj4C0t7gcKYv+mbrDmF0sgwE3cHJBQUfn@lists.infradead.org
X-Gm-Message-State: AOJu0YzHM8PgciKh+5D3mdR7emUykhG/DBAmhlLVgml6impvsX6nKu0s
	mcQY37E1pqfp37yvBZfOv1WMHRxYXbxG6rI8HoJkuj2HqO0gxO8DyR51P9vgVJM=
X-Gm-Gg: ASbGncszAQTvY5ly2yZCIufw5RVafSns1tU/TQK5mXcC5inOaBp8M+dgWB4EVkNOoQR
	6Q4tdwNrtKi5kTZSJnqqwPQifpgvU10i6UocbFLDpucNZdSk5O37L/1NLLjR9wGzm8igekf4V7z
	sko97YfzIWhKe9kDCEAl04LGBUt3t1MKQsap4Ewcq3f5nyUovCs84lzwmBjPjgyQ1uWKLLa3aqe
	OaUVGfFY7GIjAIij7QbKlCpGddtR0U084F05fjIB16U0a9rkNCnO7U3hjg1jPaE423KxXSfSwqN
	Km7pvRVwLLCyOZa0q+OL0yu9M5+gERNWSCDiTxcXzLS/aJUlEe3Wnmawqeo=
X-Google-Smtp-Source: AGHT+IHUpH+Xyh16N+1wZEqp2m7qpL812EuSHBMLvRKqepcXSU9SdbYHDp2gAq5aCXZu0H8xpH08Dg==
X-Received: by 2002:a5d:6c62:0:b0:38d:be5e:b2a7 with SMTP id ffacd0b85a97d-391353f0678mr390435f8f.10.1741335249622;
        Fri, 07 Mar 2025 00:14:09 -0800 (PST)
Received: from krzk-bin.. ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c01cb82sm4691799f8f.51.2025.03.07.00.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 00:14:09 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Daniel Golle <daniel@makrotopia.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: rng: rockchip,rk3588-rng.: Drop unnecessary status from example
Date: Fri,  7 Mar 2025 09:14:06 +0100
Message-ID: <20250307081406.35242-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_001411_448116_E03DCC57 
X-CRM114-Status: GOOD (  10.86  )
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

Device nodes are enabled by default, so no need for 'status = "okay"' in
the DTS example.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/rng/rockchip,rk3588-rng.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/rng/rockchip,rk3588-rng.yaml b/Documentation/devicetree/bindings/rng/rockchip,rk3588-rng.yaml
index 757967212f55..ca71b400bcae 100644
--- a/Documentation/devicetree/bindings/rng/rockchip,rk3588-rng.yaml
+++ b/Documentation/devicetree/bindings/rng/rockchip,rk3588-rng.yaml
@@ -53,7 +53,6 @@ examples:
         interrupts = <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH 0>;
         clocks = <&scmi_clk SCMI_HCLK_SECURE_NS>;
         resets = <&scmi_reset SCMI_SRST_H_TRNG_NS>;
-        status = "okay";
       };
     };
 
-- 
2.43.0


