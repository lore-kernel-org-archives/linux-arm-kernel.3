Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6968EC61CE5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 12:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AkhPqPyokGiCNL8dfKTXdO+jBSmWZLLyi7+WMgDPG7A=; b=0PldV1KU0KUwOkk3IQwHCwLZ/T
	vwf5W98aZ9Ov0DBDVJsZWiUOtsA0ka0735atl4t157zCaY9WZAqA+ZXQD4xTPraadHZ+lUSk9InH8
	V+XvkL00EC18VE78Fsr11j+zNZsWyLl3Om1a3s1BNGySI4hufUs/NAAN2bY0aG1zCPrNq7vHJGY7j
	Dh7qg3OpOE5+LXy3CehHqSAtyrAkw12rI2SaYsXBb0hhH5yRrMG3bVMsXF4TGLlisHy+PSPOPoJMs
	gFxTdq2gtdGWqZYFBkBbLi0wnsNYKkPeCrWvpB7Z/ndfqSG9MiAZxoQdIwyw24mhnQEjiRfExGCgj
	YhM+Yo8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMQRf-0000000AsvZ-4AXw;
	Tue, 03 Jun 2025 12:08:44 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMQGs-0000000ArVA-2TNn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 11:57:35 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-450d15e2d25so1114545e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 04:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748951853; x=1749556653; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AkhPqPyokGiCNL8dfKTXdO+jBSmWZLLyi7+WMgDPG7A=;
        b=SRC0Eo4TjjWEJjG1xHX8U7QONYsRov236n1wdYL81gMBSi09nLAhNBA3caNwOl1nIW
         xIqegiWh7jwONZUICHy+s//QbhkUlycFkrFrp4hIVA7/Q9+GFopRGbstqC4mO9vfgBoH
         DbZNOPAy9YLhAwv712FcITlBMgW/o6MpzTWxzR9Txbvo5/GCehkKlRKQranHotFw56dw
         bRvGyghLtNJHB5ttNzQmLK5nfgTF3Cd1uyJG0dXb9hxR1noIB9bKrVBueGyAaRO/K09r
         ducABYLKAyVI1+byets5xCdQVe7DKYjtKMez/AIbJl075kTuLh11xBhftug6oL+pxYmr
         AZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748951853; x=1749556653;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AkhPqPyokGiCNL8dfKTXdO+jBSmWZLLyi7+WMgDPG7A=;
        b=joBqYwx2Lj08m2oaXHROtwUb13MWnb8ls90T8TVvP9tTonA47Q2f/E6VE4iMAq8mAs
         IQLFU0qQzb9bCe73nyl3pgMTC6zAGRbA206m2eleUAsnhSoZBdA0TZHONnxm51YEkufT
         +4ACm8eD6n7isAN/nl6GW/GoypaFLM/15POb3wDEzVNHzX1WDrQAuy491CCwrIsTwpXb
         z55799Q21Re2DgyCdBU0Dlq1NRBn8cm6xY+/D5rBG2t/ImxGXj0kCXFVo3yxhADIpeV2
         oMVhR1/0178b0JZcntFtoAbDXFNBirwBeQPJJGnWBQRAQHtSLnphf6lBjNsI6tBSx/Uk
         UtLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgMvBH7O/CaCJTza63mwA82FS0SvMXyx8neNCe8L6dRKtJIJrkQ5F+uBg+fjvWuNYGdhm5vZg8I2jKLMavh4BH@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+Q8U/wHHXz6iWWoXs/gpRe/SOqCktTcI1MhmO+xnKFhuOzsXb
	hYr+Cr9ezm4sNijYP1BNE0rL6ke37rd7RWZ5wFpi1JSCEIbqXPNpB4L4ATtZMygicKw=
X-Gm-Gg: ASbGncs8egwhZUqPpkg4oEtyG/qZ1qcv9X1OGAykLKoZKtA+hBiyYy8WX+t5Mo+UWkU
	XESLdN//cgDaYFPW5BpNzhp2WfAJQCHDZRDW310zYxtW5owEG8iutQpb6C2p/XjIS9pKxWJVvCa
	vHsp8+ifvug49FKrhk6r4bzd+ZG5vIb7Y5xY3IKAHssFzhIMjPxAlCRRaqtbNZR/P8HcNMp3692
	SCCK/HjNQvIX7m6+G6DXvqOOcIaySFy6+WJJ2BnOlTgdZqYyFqOQRBxykCys8rADwlRLwJc467t
	z87xUI3LB0m1YH2Bat5c41mp3UUMG0cKOstsjPOLRA/0LAQYq95KJiaFfXr9lnVusftZOM4Lany
	8dl5dNUJsyeOg6uXOCcXgOA==
X-Google-Smtp-Source: AGHT+IEIdRGgKrmg9eIPwusMN4coMc3y/Fl5QTtPAy4hr0BEuWlRYIqpATHkHHaKQ/oVeyqsm4Wl5g==
X-Received: by 2002:a5d:5f52:0:b0:3a4:dcfb:6f98 with SMTP id ffacd0b85a97d-3a4f8984976mr4415811f8f.14.1748951852870;
        Tue, 03 Jun 2025 04:57:32 -0700 (PDT)
Received: from [172.16.23.13] (adsl-84-227-104-5.adslplus.ch. [84.227.104.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe6c7adsm17671666f8f.26.2025.06.03.04.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 04:57:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 03 Jun 2025 13:57:11 +0200
Subject: [PATCH 4/5] dt-bindings: mailbox: nvidia,tegra186-hsp: Use generic
 node name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250603-dt-bindings-mailbox-cleanup-v1-4-724407563997@linaro.org>
References: <20250603-dt-bindings-mailbox-cleanup-v1-0-724407563997@linaro.org>
In-Reply-To: <20250603-dt-bindings-mailbox-cleanup-v1-0-724407563997@linaro.org>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Nishanth Menon <nm@ti.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Sven Peter <sven@svenpeter.dev>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Suman Anna <s-anna@ti.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, asahi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1323;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=H+6vQ8kkEeYZu8N/t6R0JhPBnLddxAjO0+PqCquNCao=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoPuMeEkx3emRaicraRsdlG7Qk+79kckwyGvqvt
 XqsNEE9H/CJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaD7jHgAKCRDBN2bmhouD
 18v0D/9K1Jmn28bJcnZym4p7/2l524kGy0WHkj1kJ7p663rVCLXVsBqAtmClz1Ha+PdTJMfdeEd
 MfIY8cyQL0enStoD7Qwhc0OKP+kdk2x81uco+5g8XkwZw00MqrEV6xeQ/a+584D4uM9Y4mUuzpY
 xb0R6Rzh06VO7eZWvGttFDTtgMPQEezaSJ0rXDyUbkjQLVY2BZ3oi73oZ0KuqA76/boFe5Iu68G
 HpxQAeT1mUZWCaf5+8v9+H3A1ad4qKHAQXylPTO29W0kWmEIGfWKmMnhZ97iks1gzkZVeaEz9sK
 Kicl/QruPMpE1oCHrMwmoQXNl4Wrx1YJmyxGKFhg97uOzpZTnEP2P54wvwE2FD2Tpt2T4dpItgS
 La4JmIJO1MTb2CWQBy42+ymq/Rus7qrUH8VsbNUZIhYtz5z8snJFzzzfD9LQFhcs31ufhfATuPB
 aakw+bOPf9khBRBGBkqPpfKoHTg/T+5wJPmNdT3BSHz+3o+Zx7x0PPO5fCa/G62Cvf2rQKGipUq
 Ow7hIntbw4FA8pe79J8wK3mK0JY0aCydyWV76u9g7W4CbBKeiq5l1gOJDPqncQ8Hv/HLQrAt0ny
 L+cdfkucZCFNmHgazW46Bdxf4u6CuN8JHeIIXwPBYPqmm7clEHdJ2OsrfYhvp2P3Xt+bBdTJLjo
 6Cv9kBlwsqkJehQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_045734_655753_0BDDFE4A 
X-CRM114-Status: GOOD (  10.59  )
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

According to Devicetree specifications, device node names should be
generic, thus Mailbox provider should be called "mailbox", not "hsp".

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml b/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml
index 2d14fc9489998a8dbe5356e2422748a228693d7a..e1a44e4ae6f91eaa1cd81b357e9e5caeaaf0f5bb 100644
--- a/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml
+++ b/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml
@@ -59,9 +59,6 @@ description: |
         <dt-bindings/mailbox/tegra186-hsp.h>
 
 properties:
-  $nodename:
-    pattern: "^hsp@[0-9a-f]+$"
-
   compatible:
     oneOf:
       - const: nvidia,tegra186-hsp
@@ -111,7 +108,7 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/mailbox/tegra186-hsp.h>
 
-    hsp_top0: hsp@3c00000 {
+    hsp_top0: mailbox@3c00000 {
         compatible = "nvidia,tegra186-hsp";
         reg = <0x03c00000 0xa0000>;
         interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;

-- 
2.45.2


