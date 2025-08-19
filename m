Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E273CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 18:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qESptQ/dmYUlk6re8+r+sev9Qhuuz0N3hfWZa+wWogk=; b=yzwQcBEnFUhzugCdlKQEFkVh7z
	MprS3DVn4bx0ZueXgm4RP2C+KcSHn/e5rIHddfm8nwJlBABNukdq0YIkqOXFTKmYETKt5KNQxUADj
	4gJhTAI2nsjLA3HC8CBCDX+Pc6nyGrdUDCPER1/BQHtEgODlM3NDBxcm2vVpTyLsFuRLWZg2pg5MG
	FATOMLKXBKbN4o2k+9UCRj0kHHL9+QqbC05355PjlVSEDW9gQnkKJBJqWRqhLWZf8BLYG/9huQfl/
	vkjqS6rc8Ef62XXD4x4PSEzLYEXabT2ywvnbQi+qtL0z7nVnvlaULqlUF5+n+c+Uk5ZYLdvxKvha/
	6UEXWcIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoQpj-0000000BCDM-2R2D;
	Tue, 19 Aug 2025 18:13:19 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoMCz-0000000AZE5-0RNI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 13:17:02 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-afcc96bb64eso93328366b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 06:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755609420; x=1756214220; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qESptQ/dmYUlk6re8+r+sev9Qhuuz0N3hfWZa+wWogk=;
        b=DWI6UiEcsPqLZIxp5m6AIsU4jLi4W4hMQaCI3AYC/Si/LvqPjOfWcZcOIA6Qaw/4xu
         2ZtoXCG3A9mu2QMFEj774NxMovjpa2FlEIS8wYVluJsgBvtR0qA3pQNjXAMSB2fAuL26
         15WLum3VEvM65QUzc8+aH7GkfrHBHwIwfZJCvwRvkKwiZdeaG9d95idwQfxPHfrFpfCS
         /h6A9nfN29iD2rJNDCA+i5NOPSNfnVkAqqenjiROEn5/wdrnJpB7TtRGEHGzYQOTW/Kb
         we7NNDjUfxm40RHneDr0R9H3/XYEHeDtK5bG35GF8FuMxrMNlmR+Sc1X/TkvY0q2oGsT
         jBlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755609420; x=1756214220;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qESptQ/dmYUlk6re8+r+sev9Qhuuz0N3hfWZa+wWogk=;
        b=qmz+QSqjL//Poo7fbb21ZmKhN47a+ldtVXPNTNPerVS78Qtkhx6jLX59IlYAYoGeqY
         vQFtWdhCSkuzu3wnMvdeejthBQQDWahfe7HiRqunDbraeaOI0QGKLGfrKcWRJjBCX2li
         8y9dkqRD+YJWt4nN8zZYoTaUdTuEweOvgQGuicb42QN5mVkPgE3Tzm+mCeuakWrkbyIo
         QMbat/FyCH6jwYF+izMF6RHn6TIU85/UB5Mb3fWk4UvoSkdj/i8i9QhEZMym1eqYGfrh
         O4bgXYVUAQmd8FNCsVfMwr6Yn60lB7gr8tV1MSvRG/r1q6cL5aJ1KxYFEIPlMYOrEh6L
         IO0g==
X-Forwarded-Encrypted: i=1; AJvYcCVSjuk0anwVxe47c1LnJO2oCPQ84b8wWOiUM6J1p/+EZSwHkpcViKt1sEDSkqbt6tgqgASZYh+/cUDttDTTlNBw@lists.infradead.org
X-Gm-Message-State: AOJu0Yxj1d9cZ7W/DASXHgUAerTE2039VxkaoWfoGWi8UqX1l/LavXm3
	3FKjfdobEbFy5gBWk/q7RsQaChcgExgl7tjMSggeWw438jw8e4UDcUC7WshNLBxxVnE=
X-Gm-Gg: ASbGncsDZS44WKVjZH4zXyhh7PSQyEl76vM1cMTk0ZrG3hNfIvPoAvSvJNw8jz/maLj
	17bLGtTZD4GPv8YF31v1/nDsTjNy9ds0gKqGfFuxmPiCc/BBENv57cdlNqftPVCn9jHDNlD+N5q
	7elTKrdYRT3lyKsGmLMVlaXXRb1pwZXCtok/bLiYO+B4Bmh1ZFOpGADzAGSK3Elmla5nH2jHbKu
	7wSdc1TKauFLUpdO2nBp+gey1ugMFrfWwFqhBl1KfW+TXKRqMWf67gV0p3zckiRdTaMuea24YCT
	EGB8iAgouMYxkHfeetJbZRdZCT88qJ33PooXBQictKaeXT4Hm5zX6jWHwPair9+pvpxTZks3+4o
	nyJEal4ek51ACS3dGehKFwROlhEaTv+JI5w==
X-Google-Smtp-Source: AGHT+IEg8a2b47NedlvviLuwG8st+X2x0l+Y/YjWI2l2AzTIN3x0F4/UgFHHn1iSDfVurcfwrHIMew==
X-Received: by 2002:a17:907:2dac:b0:ad8:8e05:e5e9 with SMTP id a640c23a62f3a-afddcb7f48fmr110735966b.2.1755609419572;
        Tue, 19 Aug 2025 06:16:59 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdcfccea7sm1005948066b.67.2025.08.19.06.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 06:16:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Tony Lindgren <tony@atomide.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/4] ARM: dts: omap: dm814x: Split 'reg' per entry
Date: Tue, 19 Aug 2025 15:16:52 +0200
Message-ID: <20250819131651.86569-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=980; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=+VLxqH0ESqnHDuk3E8kCPOtSdGHTD/8yFJeuZ9BiCYs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBopHlDEWYdXbyxtFtlpDztgTjcbe3aHp61Er42M
 sDr4UPxApaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKR5QwAKCRDBN2bmhouD
 11jVD/9UYLfz5ELR6Fcra1tWfRFifgZ5ZybkjRh8OL+71XNyumO9EegMvfET0kkKjxUkuY4uT+U
 fCZsJMPevZYPepjPp+yuaWGL0EI8o+jxrOBKshhFfvl+Y6DTQ/FaNgMkrNWztTV6olKaZOVWTXw
 f+r2lj2mfZFsIP5LgfVsOdhuJAkYGZptmHb2hOTHbW3VPWjD6hHxbHBSOV/ENzWEl0T8/Gb++Uu
 IdbbFyDNR81ouf4Ff23mvNjZc73zVt54vwUgZKZWPCtEVWjCbBWe2S1FxgpSqZaW4gpbtXNgg68
 soBWg43YrHaT1TLCzjdpnlht5Mih0Y3EnHaLZTtWAvX4n+JW8gs6s7KuHzflipQqRqycNryh2Ua
 4BijL9irYBIvIIOqEj0NKdRxciMJOEhbebiv9GLfqH4+UiBdUmYNBgZzg3rberIORc9lPQ3iHRr
 s0EadnuYQ7iIID1oIUD1ZElMN4iPJbctQl4rJmfRR09P83zOMcQp2spkwU/qqoEVx2uowOowHs/
 cJMDIRB37EnSpL+rHdyb8F1tFa1X945OECQupe3I3WRH6MLo34pDpN//wE1C8n7+0ZF2BB+zeTd
 FMUOWWgwBQ0CB6caKMfL7BJ69MiQiB3hA33MreO26vremnzLj5X0QQfwcf5UURmNT2b8E/rzieq wuCoQDSCL4jLtkA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_061701_142861_B2DF6BC0 
X-CRM114-Status: GOOD (  10.72  )
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

Multiple entries in 'reg' should be encoded in separate <>.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/ti/omap/dm814x.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/dm814x.dtsi b/arch/arm/boot/dts/ti/omap/dm814x.dtsi
index a8cd724ce4bc..27d1f35a31fd 100644
--- a/arch/arm/boot/dts/ti/omap/dm814x.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dm814x.dtsi
@@ -155,10 +155,10 @@ &cppi41dma 26 1 &cppi41dma 27 1
 
 			cppi41dma: dma-controller@47402000 {
 				compatible = "ti,am3359-cppi41";
-				reg =  <0x47400000 0x1000
-					0x47402000 0x1000
-					0x47403000 0x1000
-					0x47404000 0x4000>;
+				reg = <0x47400000 0x1000>,
+				      <0x47402000 0x1000>,
+				      <0x47403000 0x1000>,
+				      <0x47404000 0x4000>;
 				reg-names = "glue", "controller", "scheduler", "queuemgr";
 				interrupts = <17>;
 				interrupt-names = "glue";
-- 
2.48.1


