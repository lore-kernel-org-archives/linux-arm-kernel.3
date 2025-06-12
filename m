Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70011C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 11:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VGWS+hFBWdcB3VYxnV3ZAvnCxB0FbDboNRXSuMWKNAE=; b=R8TB6NfD9ALONbxK9zlVH0QTqu
	/INR73J8J1L4YR3/zHSYN6LwU9tHbYrnw/pd7opte4C9CBwE2HVmHy6ckRIRX+uAp4l96KMUnxKhm
	X8CWCWUps8Xvh2hRZoaHXTtoZsffkVdcp4XWhNzViVeVjF+wJsUNMVmk75bpU+Lgpcp4K/tTwOQ/+
	Rh2EZV7ddwN3yXs2h43NCPpMiGuGUYSgYMiIPqiiEg/J1JHCCBeMah9cq/SNWfX0Qy/eKC0L2Goue
	vKmxVU4kD98kl1uOzxsjx9Zo0jMmi3KvED3AML7I/KGDlFmM64GisdH0PB74ZMPDYCnkbzxkc27te
	r2rSYKNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPfnP-0000000D6Iv-1ZtQ;
	Thu, 12 Jun 2025 11:08:35 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPefI-0000000Csqd-3H1w
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 09:56:10 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-451ef12bc81so256085e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 02:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749722167; x=1750326967; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VGWS+hFBWdcB3VYxnV3ZAvnCxB0FbDboNRXSuMWKNAE=;
        b=tjDevryQx6BU7RAXp9WlIXaQs4Hr6A+OJGJDqqZsREKTaapuMWHd2qgZvqEds7iau9
         afPS+b6egI3FG4fIAWZZ5Xskzz4OuBHQKuS6bzO4jmZguNuF8V2xZDkYHYIQWlkxc7tw
         MIDhoq92PBSQjzDa3vuryrfhQsbtyg3BKZ6PPTL64F2A81+JdF1I3gNr+vjmhV8qHl4M
         fd0k8ciWZRVl9KEzdGY3C6+uP+JZlztmfMUgt6G9YIKy+sGjCsYQb0pgOH83eNSpaJSE
         +mUwq5plXa4heRLq7oUdipNZmhH8o75rd/gx/cOUmSa6jN2i1DqpdHgnxzBe8etiKLmJ
         ZKig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749722167; x=1750326967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VGWS+hFBWdcB3VYxnV3ZAvnCxB0FbDboNRXSuMWKNAE=;
        b=OBItuPhfYEU7ScMTbXPHLaz5Q3YWS7i+8PCWtgtsQvYjY3MOZtfmZLNraOO4Rq8zIk
         dsUECPZ2bErkdCwvRezjZ6e5cB4Qz1QSlNd47jb+tu6l/vJzEzf+jMUZ2TOpHkLPxBR0
         fp9QCnlOwmS5TmsLZd/DDWYqf8cSLpQ7mVI9QJ/RPUI4pk34kpRLp4TKQubswJjWn2r9
         pcvfmWBQppNxkM2c2pQe+2JQoXrnA+/AgQOxKAGkp0WJ1T5uRHmPh11SxxBYOxQOVOu+
         AZYhMeoLLSkNeRPZdDr3aHIVGFfJywgG5n6kR3fEDyfzTPcimMY8qYtGJVZExEWYk8W6
         P5pw==
X-Forwarded-Encrypted: i=1; AJvYcCVqohA5v4yd1BS3WFIYraTpNFO/YLgq6iGtVuFJWvr9UX7Yeq6YgmkAhQ16sXqY8KrsVDDE56EMIC/Sry37WOLc@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7CpnkXfnVKSFZQfXKxCQIgeBNVoqSojJp3vU0S0/dYX+3VQoB
	Wd51ygDKuh2kQoeWcqXvkKv/P9zbRpoGM14SL6KXJXwej6iwhWbF458aoPBx3voRSVc=
X-Gm-Gg: ASbGncvqmg7mRZNfn1zKlrOQikZaJb7ldaUCy5kPu7Fu5qBQmjUT/3t6AIvBvoqdx6F
	PdWE9w6TJMphdyAhhCGPHnHNPbQRkZhWMjQ+ZPJIavwcnOLoac48nhLKJssba08hwb0V4LM63so
	QFFTllDBxyunJKvnRe1mohFhFKyPF3WUIqI6QyXLs0BY7wFtKbFhHWvtzn17XXjzxTq85okKLvf
	znAYQ2vIlusWzadT+22eETdJK6Mq01FQAjMZ+orP20KXb0frRhh9TtEngsOzYE3ReL3l2BCvco2
	dCEPnDLOHfjK3JaNqpnb7xCP1n9gEyhXorVUDEbd5uL7DuDNdwO2KM/Y8jS/LN3ZKZt748VQ3w=
	=
X-Google-Smtp-Source: AGHT+IEunL0h4aObpNd5+z2QDBp6DgiOMvQCjH0pMkcARf474VM+a0aBXZwTAGaoL6LJV3WfcEN4Sw==
X-Received: by 2002:a05:6000:2507:b0:3a5:1306:3c30 with SMTP id ffacd0b85a97d-3a55864fb5amr1969533f8f.0.1749722167198;
        Thu, 12 Jun 2025 02:56:07 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5618d6f4fsm1521857f8f.0.2025.06.12.02.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 02:56:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 3/3] arm64: dts: exynos5433: Align i2c-gpio node names with dtschema
Date: Thu, 12 Jun 2025 11:55:50 +0200
Message-ID: <20250612095549.77954-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250612094807.62532-3-krzysztof.kozlowski@linaro.org>
References: 
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1582; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=TO01a4XfI3theHM74fPZdR2rlN2cv6ZWCZ/5/LAF5wA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSqQlqR9SVbtLeGVNgV/bocU+ztoJ0ochVHCGW
 0ZZTgt49FaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEqkJQAKCRDBN2bmhouD
 13yhD/9L0JG01crZn1btgo03LUraAB8RlG7s1bFXIjs7mpanEp9LFfwL3QVNQkC8Z3TBuWsX04l
 tv8RKOraPDIGnMsH3anmIMP1TZzC7gob36faKQenGQHgq7+30QpSCtXLUwYerdQm8KuGzErOiDn
 EZrzoLLfqZFD7xNAId3XJwVAm1KWFeaA5UYaVXFtIPIJ+JKegECLfavtcka9J+pjLp9jU2MUNJB
 qnLO8peY9Qzc3amwjesEABOGVRXvmUOktIqSoaZo7OYyTBkmg7nlFZi5C7FFzGaBFkjd96ZR+CF
 DizXzKK5gcLNnGnJwRdmp+X5NxHUuSWhhjAyudivR90yzQbEgbQcfpZQY8eleILOn7RANTBpaSi
 sn6++5jvP9gqLsH/wutPpNaQf48/CyqPiMK9NMqD8BefVZNeVD/bg2hsq9rJXAJiAjqUTdUxaT0
 /YQkXqAKrNCEevLQDjn1N6aZFq6pLaTKIwCYTWB2ysaeJOXiRrJ16iu933ZDdYE2s0+HeLqJ2/w
 gZsvM5pI6Y3Ja2GHXZzTGxlBNQ5GjHKvkD5kaKoh2IjD13FE5M1kHS552oyp8jnnDSXZcsFiQVV
 5WcNhPBJRPeTO+I3+lZ8UTZ/1mSZyDZGFrbis9J3q2sn4ZeGDLUW7J+E+tAgpAk+e3L0Xt+MoCx Ymk1dDEnlah+vGw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_025608_824619_61B339EF 
X-CRM114-Status: GOOD (  12.34  )
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

New dtschema v2025.6 enforces different naming on I2C nodes thus new
dtbs_check warnings appeared for I2C GPIO nodes:

  exynos5433-tm2.dtb: i2c-gpio-0 (i2c-gpio):
    $nodename:0: 'i2c-gpio-0' does not match '^i2c(@.+|-[a-z0-9]+)?$'
  exynos5433-tm2.dtb: i2c-gpio-0 (i2c-gpio):
    Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'amplifier@31' were unexpected)

Rename the nodes to a generic i2c-[0-9]+ style with numbers continuing
the SoC I2C controller indexing (3 controllers) for simplicity and
obviousness, even if the SoC I2C controller is not enabled on given
board.  The names anyway would not conflict with SoC ones because of
unit addresses.

Verified with comparing two fdt (after fdtdump).

Reported-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Closes: https://lore.kernel.org/all/aCtD7BH5N_uPGkq7@shikoro/
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
index 8f02de8480b6..a1fb354dea9f 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
@@ -85,7 +85,7 @@ homepage-key {
 		};
 	};
 
-	i2c_max98504: i2c-gpio-0 {
+	i2c_max98504: i2c-13 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpd0 1 GPIO_ACTIVE_HIGH>;
 		scl-gpios = <&gpd0 0 GPIO_ACTIVE_HIGH>;
-- 
2.45.2


