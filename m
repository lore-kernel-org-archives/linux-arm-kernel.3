Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B37CCA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 07:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xsp4A9QUDHrrntxTF4ehOQtpgTlQEXfE6cbGWIJiBdA=; b=gr5t2KEyZZ8wEMxVWN694Pc7/5
	20hpbrDnNP+MypHqyt8kQn1xcXFeUfkji4YdOqKJM2Zr4vI26GPPtCOrtoJ1iDHrAaydZpRWOEK+V
	iGzPcTWIIjwQbhOK0xRQxo4YCluzikdvpKNBe0A9szxy8kqFr81khfoAdqRrOJyYh/PACo8A0QWAI
	+ApML3gyiqQsJi1oeHGpuIcXZbYA43Bd2Z1gqRoOMdjL2ukdWmSdyYPD2Fhtw8gl7ayM8JQomzBup
	bGdQTUopNqyKNQgwydL1BjhRVXDa3De/90IH1bmAcS+wF6GaIKPsNU0W6PV5V+wGb62kYrEM89/vr
	qW4X8z3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqRwn-00000007D9H-2ynh;
	Mon, 25 Aug 2025 07:48:57 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqR55-000000074sF-3yn9;
	Mon, 25 Aug 2025 06:53:29 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-76e2e6038cfso4421011b3a.0;
        Sun, 24 Aug 2025 23:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756104807; x=1756709607; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xsp4A9QUDHrrntxTF4ehOQtpgTlQEXfE6cbGWIJiBdA=;
        b=QRdKmyNs4O6KpDbHsI8utKBHU5EBZIf2rKBEmGFDZM958hp1Dg6vYGQ3fcMKYGo6tN
         UJw7c0pDdsqNqoMPpHw/tSfgKslVBttTsNAriv289I9+xE9gauMGEgyr3wz0GtYVpf6e
         W0tnXJYgoM0hDaIlcSWML+1SxYBH5RuDokjis4Kc1WnHCedbypA7i48Qg6Yj7GVT2Yf5
         poRyqd7Ym7yEr2t9YoAtJLtQ/++4BVEimRlLWW7EAcAoN3hooOf+BXhJpZLIDmABsERA
         PJojx+lEd3IYvLYPBuONTgXcnB9lRtvOqVnpjc8n/WC1H3f6fVwOUgbywD1bPXdsWSXd
         KVRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756104807; x=1756709607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xsp4A9QUDHrrntxTF4ehOQtpgTlQEXfE6cbGWIJiBdA=;
        b=mIpXwbdKbpcBD0kiHDHl59GSPTlqaS4oheo1vn50KuuVbH3rJ7BBoOv+JvdP08Ulu9
         jofg4o5lZdSZuSASgvQxkIUf8NWIz+Ej6Qat6TTZAUdhV1uhYfM3wd8GTbqv/SIJ+x+I
         XuDHmCBv+XqoW+hpjeaKroqtarrTiDGJZEB/1XD97ZC5sIL8LYOGIbJ+CRyBQ9jRnX1l
         NRxAAXQzupFH30BhIzDI/oDPASgJE8uqDnpE2MTh/6DTzVKrI++57CD/5uchjLVsgZJM
         FCY7IBZq/r/fGnMEWB/lAuNGIuVTTUcepQ7/YUa20kC6uQXQPhKCkdxItbGuT3ev0Bj4
         X+0w==
X-Forwarded-Encrypted: i=1; AJvYcCUHX54/4hKByz9yzGM5uwFgosP+0jDE53C2INhbrRyzGbHHRSOuRp4S51wvbipz6DkDeKaGMew2+JUgBdBS@lists.infradead.org, AJvYcCWOxdXkLHT1B+gPc7+1ztUlwAftHevHCT3UPeINo8RftGY3zF7vbOJKipoJHVippTQdyMAmFI2hwddmJe90uU8xPQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwgkZSCKuLJi7iMT1mt90FhWRRKljX6jQUehnvmtApgoj1fqpmi
	Nqq51ZZXXTmKP5sGZR7VPQ7zsFEo9vC/fYT1Y2jLplfc2e4eEDjuM8Y5
X-Gm-Gg: ASbGncvx2rA8Mn5DOBjp74V+iyVeymqiiY2Exb2te3tbFYE09eINDIWlH0cTw/eJfgK
	Dni+UDf4iIMxHqTVmDW5trYPnww2S8KuUR6KKPZbKlU9U7HRQV6LaGfJYPlUzZlCB23XdjaCG6t
	KlS5ptrF03m1aHdDTBiPRDymMHqrsh+si9/FVuYQBqdCpKBdeQzfVkbfberYEXx3jeT8mO0CpKJ
	epYeHHQDiQuT0Qn/sGuqrdcfOK/er8uPAselEISRcZP8T/4Dk2zF+dSvZsDmk2PqIVdvwJPNzeB
	apF7miwPvDAZ1AGsFgNFhqflz9t4LQYUw+VvaMo+GW91cvLzRdb7LSIq3zY3bPCPtBYKStuoTuD
	91AgkK8WKfbzrBie4QJ1w
X-Google-Smtp-Source: AGHT+IFBMgVXT0rvRm5EwJGuNlbxSehRl6q7h630ldMnG+iKbmmnfCi3ZZ8Wk9ASWeGQSTen7EJPdA==
X-Received: by 2002:a05:6a00:2e95:b0:76b:d746:733a with SMTP id d2e1a72fcca58-7702fadbe8bmr13687132b3a.21.1756104807114;
        Sun, 24 Aug 2025 23:53:27 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.216])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770401ecc51sm6604072b3a.75.2025.08.24.23.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 23:53:26 -0700 (PDT)
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
Subject: [PATCH v2 05/11] arm64: dts: amlogic: Add cache information to the Amlogic GXM SoCS
Date: Mon, 25 Aug 2025 12:21:45 +0530
Message-ID: <20250825065240.22577-6-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250825065240.22577-1-linux.amoon@gmail.com>
References: <20250825065240.22577-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_235327_985049_CA532883 
X-CRM114-Status: GOOD (  10.30  )
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

Cache memory significantly reduces the time it takes for the CPU
to access data and instructions, leading to faster program execution
and overall system responsiveness.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxm.dtsi | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxm.dtsi
index 411cc312fc62..514c9bea6423 100644
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


