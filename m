Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B1C9E77198
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 13:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iVaSFtlZM3/VWeZtMCCVy8JYGseLcw26+eMrw9jztfQ=; b=Y9Sf67W1IgKUUiQ8IeR3bS+Fic
	9gRgcGPBFapf7YgxGWVImfszOvnzrLTGerZWasvOKK2jvP0FIn/T072BYKgwX+CR0+hflDgQMb2QF
	YO7+9Lr3ZzsOTO3bL3lAakRENafyTXRhn91HVmjJQPsY1hVDeUYhSLjPArkWAZWw5sX6W1cB3qH2S
	K/z3D09L8HTu59lnNU3ISMkUvrGK2rP6EDqrxpkYFIUMWumMPqU7AMqKKkgIwr9yFKANpLSdxwdfx
	PZxJPjbDSGoPKWqzztkSeGMJ+JNMVDMTpV58Xm2rwkRt7R6dqkkq8xGzK9k/MjJCb3n0tl4YuLb7C
	/ZnliNZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV9Du-00000004tNM-2HsE;
	Tue, 07 Jan 2025 13:02:18 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV9AJ-00000004sCX-202Z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 12:58:39 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-385e44a1a2dso1789751f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 04:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736254714; x=1736859514; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iVaSFtlZM3/VWeZtMCCVy8JYGseLcw26+eMrw9jztfQ=;
        b=Ys51TMGz7Arg3minLWhwOE486/dJEf3K4wKgDWYhtutigVrHWuDJ26HZoCRikf2TIL
         j9lLOmMhQIz1wtqo/2SeQqHsDx0GE50B+8/pcFI+LjeZ+8GOBOz4isDu1A39EZ6W9g56
         MxjWPFkUvJ1BQTV4Ku0kAv/GyCLARHVX575Mfh0FQTHZDNzeBdkOZWzEGuW61HaVow/+
         Q7wSPnCX5ynOBovhAMdRGDRdl1A1EXm2e3Jv3OHCj4M4ZjKIUY7QAA1MCvvK80UjMP8N
         FTaDxsU9gO0uQwRCuqyEO45C8yWedH3EnVSal2/nIQJLmTCD+28GUosABqupjZVbafPm
         7H0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736254714; x=1736859514;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iVaSFtlZM3/VWeZtMCCVy8JYGseLcw26+eMrw9jztfQ=;
        b=gOX32gb/puu3sE8CZ42UFa/gtxBqe0vW2Z+pVf36wNk4FCHxwMGxZzAmgfyb6n2dnV
         v0v3ue3ut8ZgF9I2H6uxTEBCHgE3byMFJqVXVfP9QBhR1ink7R5FR8rTPU3wojsxw6eX
         PYMK/R6bi3ImKA6lKVr9tYN9yYT+M9iovPAoIq4C9lohYkFNl6jsqeEBG4gr6HvRA39U
         qb5IhmYJRXZQE5bPFZmRXpJWTiqX/0GEsga5zievAtXg0QCwrBQPWlvc4KmX7qO5dgKS
         sjquD6xCogsH7qCc7h0JZYaAe8Mxcz0SCUa8HiW/s3SKa78ddZWE6qHu57yMZT05uUN2
         DZ6Q==
X-Forwarded-Encrypted: i=1; AJvYcCX8A54x2EG0f4Bewd/Wa/2+iss2lQGBMPn4dC1IN/oOWTis52efG7Mwb0r9wn7lYvKDyN+Hvj3z+i6cW8nHbiJA@lists.infradead.org
X-Gm-Message-State: AOJu0YxCi/jUbxS7rkqN93VQjU5C124hSbf6E6uuTFLQod2WjieDxOAI
	krULfZGqFRl837WDTsHoxU1l0eu/nBbSn6BZSOJX2hVkV1x7GUI2Bf4Dap5LnOw=
X-Gm-Gg: ASbGncsOKvTyHrAeP9UdbFEgvggvuviy+zGTa6SlH9HpxRK00c7p6TwECoRUXpmoKXK
	fBt9/4/P8mJUtGEdBA0xEn/EfwpmH8P/MOZ2SGyQUxRroq22vK2LHNkwk7zb/bQA9Iho57gkvDn
	i3UpZlgE717w/2YWHEFwaamGPZHGY/elh91c1W3KOyTxLXUbIBYznYULNrH6baLblDveIH5THWF
	3iORxt5VoJStWRjbfLG2s3OLocJK681YdBhrUEtXrt+Zf1Db0m4VNrPjal3jkraGu1xBYM=
X-Google-Smtp-Source: AGHT+IFPBeJaMEFcgs9P5ku/eO7a9THMpLvlhXfK01aXSRTSwOvnAsWvnf3VluFuAxi1Ku/w/nWpEA==
X-Received: by 2002:a5d:5e09:0:b0:385:f479:ef46 with SMTP id ffacd0b85a97d-38a223fedbemr21216203f8f.13.1736254713733;
        Tue, 07 Jan 2025 04:58:33 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8474c2sm49738610f8f.55.2025.01.07.04.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 04:58:33 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Michael Hennerich <michael.hennerich@analog.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: pwm: Correct indentation and style in DTS example
Date: Tue,  7 Jan 2025 13:58:30 +0100
Message-ID: <20250107125831.225068-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_045835_524148_4D9A9E9A 
X-CRM114-Status: GOOD (  11.81  )
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

DTS example in the bindings should be indented with 2- or 4-spaces and
aligned with opening '- |', so correct any differences like 3-spaces or
mixtures 2- and 4-spaces in one binding.

No functional changes here, but saves some comments during reviews of
new patches built on existing code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/pwm/adi,axi-pwmgen.yaml | 8 ++++----
 .../devicetree/bindings/pwm/brcm,bcm7038-pwm.yaml         | 8 ++++----
 Documentation/devicetree/bindings/pwm/brcm,kona-pwm.yaml  | 8 ++++----
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/pwm/adi,axi-pwmgen.yaml b/Documentation/devicetree/bindings/pwm/adi,axi-pwmgen.yaml
index aa35209f74cf..45e112d0efb4 100644
--- a/Documentation/devicetree/bindings/pwm/adi,axi-pwmgen.yaml
+++ b/Documentation/devicetree/bindings/pwm/adi,axi-pwmgen.yaml
@@ -41,8 +41,8 @@ unevaluatedProperties: false
 examples:
   - |
     pwm@44b00000 {
-       compatible = "adi,axi-pwmgen-2.00.a";
-       reg = <0x44b00000 0x1000>;
-       clocks = <&spi_clk>;
-       #pwm-cells = <3>;
+        compatible = "adi,axi-pwmgen-2.00.a";
+        reg = <0x44b00000 0x1000>;
+        clocks = <&spi_clk>;
+        #pwm-cells = <3>;
     };
diff --git a/Documentation/devicetree/bindings/pwm/brcm,bcm7038-pwm.yaml b/Documentation/devicetree/bindings/pwm/brcm,bcm7038-pwm.yaml
index 119de3d7f9dd..44548a9da158 100644
--- a/Documentation/devicetree/bindings/pwm/brcm,bcm7038-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/brcm,bcm7038-pwm.yaml
@@ -35,8 +35,8 @@ additionalProperties: false
 examples:
   - |
     pwm: pwm@f0408000 {
-       compatible = "brcm,bcm7038-pwm";
-       reg = <0xf0408000 0x28>;
-       #pwm-cells = <2>;
-       clocks = <&upg_fixed>;
+        compatible = "brcm,bcm7038-pwm";
+        reg = <0xf0408000 0x28>;
+        #pwm-cells = <2>;
+        clocks = <&upg_fixed>;
     };
diff --git a/Documentation/devicetree/bindings/pwm/brcm,kona-pwm.yaml b/Documentation/devicetree/bindings/pwm/brcm,kona-pwm.yaml
index e86c8053b366..fd785da5d3d7 100644
--- a/Documentation/devicetree/bindings/pwm/brcm,kona-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/brcm,kona-pwm.yaml
@@ -43,9 +43,9 @@ examples:
     #include <dt-bindings/clock/bcm281xx.h>
 
     pwm@3e01a000 {
-       compatible = "brcm,bcm11351-pwm", "brcm,kona-pwm";
-       reg = <0x3e01a000 0xcc>;
-       clocks = <&slave_ccu BCM281XX_SLAVE_CCU_PWM>;
-       #pwm-cells = <3>;
+        compatible = "brcm,bcm11351-pwm", "brcm,kona-pwm";
+        reg = <0x3e01a000 0xcc>;
+        clocks = <&slave_ccu BCM281XX_SLAVE_CCU_PWM>;
+        #pwm-cells = <3>;
     };
 ...
-- 
2.43.0


