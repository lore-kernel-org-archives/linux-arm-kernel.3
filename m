Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1798CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 15:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yfusC6FdHMxDdfI3s8bgNXW0JeeMt/mO+ot1XvJ8c04=; b=d1Q+7uzwKb31nsz4Ya7IP8INcn
	o2lkNLTUtd2ZsKR7lnM+XN+d4xJCcSkOIdUXrKSDZDuLpxge4njytYMlKvl3aouinOZZJJxIJbwGg
	JheSd26PWNHEaxnc6Whscn3D4jW5IsKK3Bk3Ls3rjdrtpyfw7dl/eJTGk2reMlNaFh7BX9bm4K0z2
	/KHbkEaRTCLNUi56WqdpH1tGEencENuyQ7P2T2s1Sc3m3sW4L+mJM/W+jeZmBCOEI9JXG7PX4NbNh
	XP4WRI1SLnFmTmYfv9Sr7P4Ex5P3MYA2LqpCt0cYAf3hUi2mLCkmlGoQsRTcAM2bdnPb/fghHp8zZ
	KcDZNbnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuYSq-00000002nKJ-2QLu;
	Fri, 05 Sep 2025 15:35:00 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuV6T-00000001XB6-1Mkc;
	Fri, 05 Sep 2025 11:59:42 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-77238cb3cbbso2219144b3a.0;
        Fri, 05 Sep 2025 04:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757073581; x=1757678381; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yfusC6FdHMxDdfI3s8bgNXW0JeeMt/mO+ot1XvJ8c04=;
        b=leZyK05rAwBi/gR8lNyQZou9hCaRoDYzm3cvAMviVRyxoP/+uMfpTlAZUcy2a/onov
         li8lMSMiwb9mKa1FAX76S6+HrDhLc3CxRNW4B6WlxEzUVb3Fa1GmbpxEbkbxuKI16pjJ
         NGWUq3CLK9KtLK2RC7BGfZwBwX8PrvgijiNu6MMGKjsxRFUbFERNauTZwU5D19mwrcpp
         Sq/o53BGqL4tJ5eljLwG6IYJDfrEzky0DyjvI5WG5IFx8tTUHRSRz0sYW99U0CzMwdnf
         4enFBUtAuDrF3ef/KppaekLk0dlwhspqj7j6ktDF8s78IGuvwEee5eg7F+9uRjjeAT61
         0cvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757073581; x=1757678381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yfusC6FdHMxDdfI3s8bgNXW0JeeMt/mO+ot1XvJ8c04=;
        b=iq0nfv51Ndb+vw3N8mSr5VBNaU9wC94b76MYXb+GuEwU4T78fCTgOTkJazrREFlTGA
         xr5/9vCvEVWh6f0bZr68OhdXUyuoZifGACAy19lXJsLl6JUlwrXSdZKnSe5Y129S4DCc
         l/XykhbkgACHqddOK39KV3jIS/BawcIPpP8E+qheGTz3g1oRroZ1vnXKl+k5MCLrk0Ph
         WFtqxElnyebhR5xDoAEaWDJqhooKR6hos2oLEwiFrgVF9pz9xPEqPfXqcpL6HWnKDDqU
         T/vuRZE8Q39xXvWqe5aj78LdNWgeD5vCAuvIVdEeynu2x5zezqcwuRZhLwXG436T7TZ7
         kF3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUJpm7T9OTYPORfZP1V0Wn8JjS8r999mx3L7jyi7LhA7+pL4hIncFQ4YGIse/TQSsGBQM/FfvbxfGgeGbqg@lists.infradead.org, AJvYcCWZ+WrLjlCzG6fKIrRWrTKTQ1OK4cJxGQUchf6469OeCL1I6WwXWybo8NA+v8fQJ+RQgqL/YekwJpqil5kNHCvzBQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YysK0uYZ3UiLmB8bWh/OOAAgmVF8w86JFKESANkgH6JeG+sD5lG
	9Jt4ZlPx1QAK45TpEYVTzNnr9r/6BaPjkWM6pq3kkw3aOhqBS6vLoPyT
X-Gm-Gg: ASbGnct87lBUTFoEVnwMQGoyatFGS08TFurn7Mm0VpKMHhyTNfK1rW5Kg1dMFS3quD4
	TPCL3OPqG1tbpujuhx82Wi59aEnEBnUBVuTzZJP6nuMm8uUwtqK2kLl8PXoO0iAbzJ2pz18VPLt
	+Xj7pC/Gz3IGBl5JZMUH2AGXTXrOCKfJsLMl8BGo0j7xGlP8wxwc7FsAadqiwcLeQyGmRH9dELE
	NXSQvW/rfNjjMeomLYzKsIkvw39kTvyhhHhmrlxL7BDDW2iRaBmBHGxlMOj9g0MaNl7+Fngkz8u
	nxfgLoUnp1IR86DVqi7OHTrEcyJpLlOLdjJzftMtJ7+qqbVZJUzaqUwmYrX4k30dZi+lFz648UP
	3dfubXr2eV6o6it0rX5dw
X-Google-Smtp-Source: AGHT+IFoZYigQbwEW4Vr8mbtasCWDC6i9hDthzyIkXHkuRGQriltAlc6nbmtWMDmJtJfFGnb4kj3FQ==
X-Received: by 2002:aa7:88cb:0:b0:772:638e:5f72 with SMTP id d2e1a72fcca58-772638e6165mr21255920b3a.25.1757073580767;
        Fri, 05 Sep 2025 04:59:40 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.216])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-772396d2b97sm19633049b3a.67.2025.09.05.04.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 04:59:40 -0700 (PDT)
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
Subject: [PATCH v3 07/11] arm64: dts: amlogic: Add cache information to the Amlogic A4 SoC
Date: Fri,  5 Sep 2025 17:27:38 +0530
Message-ID: <20250905115836.7549-8-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250905115836.7549-1-linux.amoon@gmail.com>
References: <20250905115836.7549-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_045941_361948_69891FF6 
X-CRM114-Status: GOOD (  10.38  )
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

As per A4 datasheet add missing cache information to the Amlogic A4 SoC.

- Each Cortex-A53 core has 32KB of L1 instruction cache available and
	32KB of L1 data cache available.
- Along with 512KB Unified L2 cache.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi | 37 +++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
index 563bc2e662fac..fce45933fa28b 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
@@ -17,6 +17,13 @@ cpu0: cpu@0 {
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
+			next-level-cache = <&l2>;
 		};
 
 		cpu1: cpu@1 {
@@ -24,6 +31,13 @@ cpu1: cpu@1 {
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x1>;
 			enable-method = "psci";
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
+			next-level-cache = <&l2>;
 		};
 
 		cpu2: cpu@2 {
@@ -31,6 +45,13 @@ cpu2: cpu@2 {
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x2>;
 			enable-method = "psci";
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
+			next-level-cache = <&l2>;
 		};
 
 		cpu3: cpu@3 {
@@ -38,6 +59,22 @@ cpu3: cpu@3 {
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x3>;
 			enable-method = "psci";
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
+			next-level-cache = <&l2>;
+		};
+
+		l2: l2-cache0 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-unified;
+			cache-size = <0x80000>; /* L2. 512 KB */
+			cache-line-size = <64>;
+			cache-sets = <512>;
 		};
 	};
 
-- 
2.50.1


