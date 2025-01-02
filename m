Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5151CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 20:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rmY76TFyzj2il9epOaYcMs/IMVJsV0h7xrRhDa5+gs4=; b=mAZe+uhRjeetE6kxnG4zVlVJNX
	s3Entm9faUd1hkvTHZndcvkMuZ9697vh+tVZrzipV4ADIA9EnvJtEQacqLQKzIQbtkiXYYFcTaNEF
	awXZVIuvxSsGMb+eKxB2rGikJI3o0sRRQZqILHVpV/bc3N7s5PjoulholSM71qUP9ipS5Pt2JVi95
	WfGe8/KC7LtcGcB8ESYJcptEkTIuCENZqeed3zozoc6WTf4cpXWfhlb47pM64IehVZiT21tg0fW6w
	o2kdMM009CplG5DobBzGvHJd1Lb+wlZvlL7pQLmSX0qUHUniFBiECa0ZD9SJBzZPsM8l4mQ8anexE
	MysrOARw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTS2M-0000000BPtX-0oXi;
	Thu, 02 Jan 2025 20:43:22 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTRzx-0000000BPQC-005f
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 20:40:54 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-aaef00ab172so1131678666b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jan 2025 12:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735850451; x=1736455251; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rmY76TFyzj2il9epOaYcMs/IMVJsV0h7xrRhDa5+gs4=;
        b=U4g2/n6IXS/I21ie7HQKbPHm2C4HsiZBmIdohEHa7LltHBK1Coss8E6hDUvkgCZoJ4
         M7lEYWBSTGst0lxBE7l2R2jMYjG/htJFyVYISgB1Sv3Yql6A7zv12RZBbKkVVlI+wYMN
         iS19JszzbBXL0BmTtbC3HOCe+MgPKT4d0JWllMX20NL9dbnBMZc6YghNaKGPsgDCtipp
         NJoaboGwgQPyUXfaGSEggkXS8hpr45YToys9P0Tqwowz7A/jbCupKEjGpSk+09yyLmfH
         wkCjStU9hcCuvaRZdZ6AA1R2JjF1+UIgzO0NpMMEqBcjJAaoGEsvIRey3iQI3oc9aNjo
         owMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735850451; x=1736455251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rmY76TFyzj2il9epOaYcMs/IMVJsV0h7xrRhDa5+gs4=;
        b=JVa8LfcgM8IWIfl+sJPq88ra2ho1GaVmqGiC9K/F1HgxQs2F9FWo6jpr9pc3G6OGpi
         ey3nxE9tGq3uqBRh7D+yFPP0XhSl56DYlXOnnCeC5VHkaA6ylJHgXQv4BdPNmwkhuQhx
         Sy01Q+I+TP1o7KaepcYBO8h4QLcgPJayuli3ZT3MoyOO1NCWSwmy5gPYMXHG6cbOiZEH
         OFW2ioZwX9aYG8UyLL33+jaezUr7p7CIf5vIpmfxnbSTc02loe9P1A79BEOkcJLtIRaT
         agCAWBoFD/GDLIUR7iafkqjTAtayKibRk8E5Ytrr5xkrA7KvBojGZ6U0xaM6fc5fL5yR
         FavA==
X-Forwarded-Encrypted: i=1; AJvYcCWBYpd2wCGTCf1xqSQJPtQHEqusBH05lHWN5KrrO51kyDYjLj9pLzbY1DI/+hI59vatxG1hHvrHnVqs74nUSrxn@lists.infradead.org
X-Gm-Message-State: AOJu0Yxjbp2uj4GSGiJwKuQJl9pwTDIYkYUezbR6v75x9MIaf51BFgDw
	v3GuUalCvPUKsIi/0TEhAxThFpjdgQsc8+/qLRgO+H1EKDq21LVI
X-Gm-Gg: ASbGncs4uDVRm9zblmhXfDUQEmN1uOzVyG8cy14V19e8OY7CJ17cwRzB7+0nX72WzIX
	6PMxn8ifIyTcogq/rIhWvBw8JzhUxRkFhHqGoFKrnrZN0AiPKcq3/ibLjYtD++TX9CKPbIFA1q7
	hONM2BfRcPwKBh+SuurKSZZJtJxp02TLc9NsQ1DpmDYdtbqnrbk96Cz45xKBXfk4uHCXeypDq2K
	AyttAphuneiC50g/E3xEWbcgSHwKGlerq5AWMSK7EyC5xZd+ohdxi+LgcrGjEEHN2eNeJwMQOmv
	eePnUTAr88w=
X-Google-Smtp-Source: AGHT+IE5T9x2LokF/7UC1tURsDfuW1k26Innzw0G2AdhWMic7tozgkLbmExTBk9HOsPRH2vw7/EYyA==
X-Received: by 2002:a05:6402:27d2:b0:5d0:c697:1f02 with SMTP id 4fb4d7f45d1cf-5d81ddc0609mr101355271a12.17.1735850450777;
        Thu, 02 Jan 2025 12:40:50 -0800 (PST)
Received: from ivaylo-T580.. (85-118-76-61.mtel.net. [85.118.76.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe490asm1814251866b.98.2025.01.02.12.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 12:40:50 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/3] dt-bindings: soc: samsung: usi: add USIv1 and samsung,exynos8895-usi
Date: Thu,  2 Jan 2025 22:40:14 +0200
Message-ID: <20250102204015.222653-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250102204015.222653-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250102204015.222653-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_124053_045471_1126B5AF 
X-CRM114-Status: GOOD (  15.13  )
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

Add constants for choosing USIv1 configuration mode in device tree.
Those are further used in the USI driver to figure out which value to
write into SW_CONF register. Modify the current USI IP-core
bindings to include information about USIv1 and a compatible for
exynos8895.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../bindings/soc/samsung/exynos-usi.yaml      | 22 ++++++++++++++-----
 include/dt-bindings/soc/samsung,exynos-usi.h  |  8 +++++++
 2 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
index f80fcbc31..50db63a8a 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
@@ -11,11 +11,21 @@ maintainers:
   - Krzysztof Kozlowski <krzk@kernel.org>
 
 description: |
-  USI IP-core provides selectable serial protocol (UART, SPI or High-Speed I2C).
-  USI shares almost all internal circuits within each protocol, so only one
-  protocol can be chosen at a time. USI is modeled as a node with zero or more
-  child nodes, each representing a serial sub-node device. The mode setting
-  selects which particular function will be used.
+  The USI IP-core provides configurable support for serial protocols, enabling
+  different serial communication modes depending on the version.
+
+  In USIv1, configurations are available to enable either one or two protocols
+  simultaneously in select combinations - High-Speed I2C0, High-Speed
+  I2C1, SPI, UART, High-Speed I2C0 and I2C1 or both High-Speed
+  I2C1 and UART.
+
+  In USIv2, only one protocol can be active at a time, either UART, SPI, or
+  High-Speed I2C.
+
+  The USI core shares internal circuits across protocols, meaning only the
+  selected configuration is active at any given time. USI is modeled as a node
+  with zero or more child nodes, each representing a serial sub-node device. The
+  mode setting selects which particular function will be used.
 
 properties:
   $nodename:
@@ -31,6 +41,7 @@ properties:
           - const: samsung,exynos850-usi
       - enum:
           - samsung,exynos850-usi
+          - samsung,exynos8895-usi
 
   reg:
     maxItems: 1
@@ -106,6 +117,7 @@ if:
       contains:
         enum:
           - samsung,exynos850-usi
+          - samsung,exynos8895-usi
 
 then:
   properties:
diff --git a/include/dt-bindings/soc/samsung,exynos-usi.h b/include/dt-bindings/soc/samsung,exynos-usi.h
index a01af169d..5fbeb426b 100644
--- a/include/dt-bindings/soc/samsung,exynos-usi.h
+++ b/include/dt-bindings/soc/samsung,exynos-usi.h
@@ -9,6 +9,14 @@
 #ifndef __DT_BINDINGS_SAMSUNG_EXYNOS_USI_H
 #define __DT_BINDINGS_SAMSUNG_EXYNOS_USI_H
 
+#define USI_V1_NONE		0
+#define USI_V1_I2C0		1
+#define USI_V1_I2C1		2
+#define USI_V1_I2C0_1		3
+#define USI_V1_SPI		4
+#define USI_V1_UART		5
+#define USI_V1_UART_I2C1	6
+
 #define USI_V2_NONE		0
 #define USI_V2_UART		1
 #define USI_V2_SPI		2
-- 
2.43.0


