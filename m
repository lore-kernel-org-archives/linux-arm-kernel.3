Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFAA1CA1010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 15:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=flm6222xa/92k8Sq5cNvWvnFsG2Um41uLYPha1Yvsys=; b=C97XJAelWpB1K8WmIU9yyhNs23
	0C8G4RifK2b30TU9HA0Rt08mGAWE2KzX7jtpDFIoT9SWlxryLQ7S7tR/+pUJ9iMjW5mSg6qNCOC1D
	G7lT46fsplA+ClkRj5uJv2jPFDgbCc5oIwD7JrDEeZSQ8o+YxfMk7ZwOPv62AEnnFHU/NXiX+RjqH
	eMbioG8V+aYMYluPmXXlkLUiX9CLOXUqyhWWJyJ7F6IxaRjjAKiGO7Bwx8PCij4uHtgUZ0a0FdRan
	jCVmnNxSUCvkew0EJ/Up0aePNz6k7/Mf9sjQHd/fcfKBRI9b462hxAhZec13e73IdVZ9vbDYXfInE
	Mo7JCqZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuYNF-00000002lS3-0yjr;
	Fri, 05 Sep 2025 15:29:13 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuV6E-00000001X5x-21wJ;
	Fri, 05 Sep 2025 11:59:27 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-772301f8ae2so1727298b3a.0;
        Fri, 05 Sep 2025 04:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757073566; x=1757678366; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=flm6222xa/92k8Sq5cNvWvnFsG2Um41uLYPha1Yvsys=;
        b=YswaUhs8BK0KaohNckFhj9c2zdCvotwoZGn1VPlN3AVn7NT2XW7XzHp4hKZP6HcsAk
         HXU+0QZW36oJSdZ3PY2BPiseyTPfLmyg3sLJKazA3d6hwPE5EkwIZya452+OnZ/aG9Dz
         UFP+nnmWEvxZ4gSj0K+zUbVB3IHC4tEhiIauG6qysOH6iFWhaOLPqMQUN0KKp4jWAJLo
         DUmO2VWJb+B2NCdeq4ZV8pturPPOafJnO01sYqNthgcOx7nURiXAp+LF6Adx0ReLCAud
         CJVEKL3ldzDDGy0P7oVja0hHjFDtocAlShPvjHk9rrU+ajWgc9aM0hbdV9vDNkljP16/
         eXbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757073566; x=1757678366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=flm6222xa/92k8Sq5cNvWvnFsG2Um41uLYPha1Yvsys=;
        b=i5W4YhdWtKDnNnl61wuoqpLB2NyClBwBWPPcWcfCD1c37QCsy31Jn9I8JXYyoc1ZHS
         ZkjoDhity6MLJWVEqqX1PBg0xMd9ULmqdq3hCalg6qWfQ0F4d0uXGoiSV0z2qzgmZEli
         6xrr7RkNT/35Tl8ZpdW3oFodm8Qma6Qr3qWDbd8meDK52ssNxTqjPM6nnPB6OjJ5t19L
         nMD658oqosKfItDxPetb/6bESJ0krgEqM4GhNADM97iqheXkhTZFZ1gg7W1RqunqsxnG
         YY/Wod7SePdsTwgD8v2pKqRC22naCb/DWGp1AA8r+wEWAmvc102c0y6L+8sz3zrhGkdM
         hNig==
X-Forwarded-Encrypted: i=1; AJvYcCURjhaN3vPSyBfhRb6Io5ILIYItejef7Sl04IqrD12MjnGCYK4qgH33qR0LF/7bn5kLwU1U97dAePVRDSdL@lists.infradead.org, AJvYcCXQ3bAwQSp7ROaZrzKEL2z61DjYLDEY8yaxy8qWm7j6EqoDfAOJ6dqVwRn3/WkaV0aqfiN3dkxoBNzbKztcgj6JRw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx79vrB52o2AU4sQiGXlHHvplLr4chwZuXzsplPS3Hc1SPi0Hb3
	GFhU/Z3FG2mo2w4tNKjeYeHEdzrQaED0bzaL/a3TGuoKucRAwEoOedgI
X-Gm-Gg: ASbGncuHdPmrBU8ERW+2yEvGBtUkjew1HdISf1Fxcx3ejxs/4e/S+8DQDcmp4OyimGk
	DP60jHsNJA+KFdS5urPqo0FWPFbz6kAptqFhyjg17F7k12YFkbgu9d26gqmR0nPP0YsQuYZpfPO
	m33rZMOcncyCtNQlGOwWMagZFBw7HDVFAUnybPegh588VmgQGLQuR1niF5Ztif6neTHPsi0SUgz
	FqpFUPccLCRDnJsxKVS0uf4ogFPAAgRrmvQxYeCBDuRVyIL3/Ig+nerMmU1+NJUNnI7JGPGzHxp
	Liw8LbCGgV9e/jNloh04+XwPaxMo11Aj6boJsb8sgLdbnJ6W7dF6SMl/nVolPaP0EFwbeAfh6FR
	bqBxHs7+qNni7tu3DS2WZNV01cFFEwmcPvdi56D7x1Q==
X-Google-Smtp-Source: AGHT+IG2Pnmes/eTL7tY/s5et8H9DzEQu33HG6W0BhNZAdeaRHrB5x2FRDCOngLSFjV0GySVEkb77w==
X-Received: by 2002:a05:6a00:896:b0:772:2bc2:b2c1 with SMTP id d2e1a72fcca58-7723e309cc5mr26299134b3a.20.1757073565699;
        Fri, 05 Sep 2025 04:59:25 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.216])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-772396d2b97sm19633049b3a.67.2025.09.05.04.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 04:59:25 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-amlogic@lists.infradead.org (open list:ARM/Amlogic Meson SoC support),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v3 05/11] arm64: dts: amlogic: Add cache information to the Amlogic GXM SoCS
Date: Fri,  5 Sep 2025 17:27:36 +0530
Message-ID: <20250905115836.7549-6-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250905115836.7549-1-linux.amoon@gmail.com>
References: <20250905115836.7549-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_045926_519452_AD81D5C4 
X-CRM114-Status: UNSURE (   9.88  )
X-CRM114-Notice: Please train this message.
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

As per the GXM datasheet add missing cache information to the Amlogic GXM
SoC.

- Each Cortex-A53 core has 32KB of L1 instruction cache available and
	32KB of L1 data cache available.
- Along with 512KB Unified L2 cache.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxm.dtsi | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxm.dtsi
index 411cc312fc62b..514c9bea64230 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm.dtsi
@@ -64,6 +64,12 @@ cpu4: cpu@100 {
 			reg = <0x0 0x100>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
 			next-level-cache = <&l2>;
 			clocks = <&scpi_dvfs 1>;
 			#cooling-cells = <2>;
@@ -75,6 +81,12 @@ cpu5: cpu@101 {
 			reg = <0x0 0x101>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
 			next-level-cache = <&l2>;
 			clocks = <&scpi_dvfs 1>;
 			#cooling-cells = <2>;
@@ -86,6 +98,12 @@ cpu6: cpu@102 {
 			reg = <0x0 0x102>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
 			next-level-cache = <&l2>;
 			clocks = <&scpi_dvfs 1>;
 			#cooling-cells = <2>;
@@ -97,6 +115,12 @@ cpu7: cpu@103 {
 			reg = <0x0 0x103>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
 			next-level-cache = <&l2>;
 			clocks = <&scpi_dvfs 1>;
 			#cooling-cells = <2>;
-- 
2.50.1


