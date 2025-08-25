Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5243CA0FE1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 07:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tE3Wekvqd21lu0tbx2agJJ6vLB1jjjHkZqTR9vvpgx8=; b=SdyjnXoXuBl89lWQz1uq6Qud8n
	GUrgNa1zlYKtQPSsDbBQzoAAVH2wC+9rwEdzQg0y7U96qXIO58xV4ibtKluYxMVpZ7Ff2QY9x0Q4p
	p7jE0iOsgiWxQf8JE0DPX9OCWU/LRApR62jKGwhHuHIdiNjR37SP+Zsq/hpgxjs1pmeTfkWiv1Ti7
	HV8b02n/5nLwP1pkJ+jDAHRV18w6GlkHMUJGAiIaX/r/kQUjA8yYkWt9KVGmDwppysOTIUGKKE1/N
	O0n+bUmsCoUqIF/JwpJBmTkD+JTmqPE6KG4gksSCGSDcWJxaf+VJm6h91XCS8NzF2gT3UvWS0WQFS
	4XdXPfYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqRU5-000000079IC-3PMQ;
	Mon, 25 Aug 2025 07:19:17 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqR5K-000000074vc-2nDl;
	Mon, 25 Aug 2025 06:53:43 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7718408baf7so793855b3a.3;
        Sun, 24 Aug 2025 23:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756104822; x=1756709622; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tE3Wekvqd21lu0tbx2agJJ6vLB1jjjHkZqTR9vvpgx8=;
        b=gozStfMkewtvYMdK6piCnZM8l6ZTQ+b89Oy+yqLMfl00PkTLaJtygCLY92yaxuTvNF
         1oDjFXVR92mXgrq2nWsTW/cDsGGRVX3cjSk7q5KOEqwY/K8AJRL+1eyCwA8ZZXbEOTSb
         cku62snj0+j0HZ8KB9bseEKmKMeJjJw98br3Gl9UIkgpXAYbsEDNrcM7FNfr4lQUylHb
         GvsU8/3TFXNLZ3yrODO9RzhbXoKqUeSG6Dj2NkqMMVdnw3p/lGptpCV6kSTsljGO2MEe
         MmEF4GoVoQdEQoVDnUwogugLjakI9nCAkmYXOReE2oAGYWAB+eQyugvBx6vhjd/Nq4xN
         ULhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756104822; x=1756709622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tE3Wekvqd21lu0tbx2agJJ6vLB1jjjHkZqTR9vvpgx8=;
        b=etoObvxZb4UmzokxO2h4uFLeQrHZFsNbJ/UU/P0pgAiWCVTq9CGNQ+sXRjXTZ9HsAx
         3omJSc4BfwSvgOvgt6gx7tx8vqGkcU91s+BcXDrV0FOqPYi3XNRfSfRNBnFTUHKt0iIS
         Hoy60LBhBskTd+Bn0NaHWgsfEAl5HjpMyQKZ2T4v2FIr0xlB6LGoyezgMw9pCKHPDKbs
         XyIqrNgpKfHJMbv5uy7lm2Q6Qxg5gilDn/yon2IyOP1EXd3TvhCrH58NT1OFlReMvVk9
         9LJzzdODnXzRl5qy+oihY/hAJDryi1WoVc63WtboV+8JD3OBIsl+8Fw5dU5rXvfHrFqz
         32LQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHiMnq8RVw3jOFwORbK+19/sv0yMxKQo4FcO58cn5X/vxN//0Xu5XfSET0/zm37X2zcV8xr6/BurkX54M0fQtvjA==@lists.infradead.org, AJvYcCUMrFzV9JCuzjQ5j98383jImFr0cBuQj6RzySEm0vwWPyq2LCXavvu63cOgMD/IpJvVRxtObhvyCsp3rore@lists.infradead.org
X-Gm-Message-State: AOJu0YywCvaf1w/gyVCzr+FQyqquoHhdfGXyrb+AQhfMxABmIoe0ftu5
	XCYF3I5yYMv5ftw1ba3TxvS1ySCn+SKcCcKRjdJzfIq+Mvo+bXuKpNMZ
X-Gm-Gg: ASbGncsj1T+54FMTmhWrymsWG+OM8OP7/85Y+ADsD4qXPRl8Epo8Kpnd04bmpJRTiZl
	o3cO+OKyCz9cJnTVdqL/J7rECETK2tzx54gqVEudl2EVQ3zr3KuHSzPr15f28sAKZT8aATiGkX7
	nXnZn893rFr7XuxNpf3jRNunUau5faXPL7mXa3FqQbbnZ9al2SWkIajxGI5uLmXvWrdhT+bTbZD
	RjlXVZAQ9b6lck/TTgFMtBfeIfdaUX+oRMbLvH4+VGQulX9RYDmgi/NSDVDLsKKtrTZNxNIwcQG
	jPW/uGZAWAvrRXF0vp6hurUwTE0+Qj0yskP7k4YbtUKyTqlY+1kvGjGRz4xU89EXlg1OjkP3Jkm
	fczEAn+SeQ8lL+zY63P9g
X-Google-Smtp-Source: AGHT+IFI4sVwOwHsrTnCMhJK89ZZD27xDF2iiY7KEmc5KezJ+HdRgm0rt3ypibL1UVs91B3yoI/ivw==
X-Received: by 2002:a05:6a00:3e14:b0:770:57c0:1fce with SMTP id d2e1a72fcca58-77057c02141mr4993573b3a.4.1756104821807;
        Sun, 24 Aug 2025 23:53:41 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.216])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770401ecc51sm6604072b3a.75.2025.08.24.23.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 23:53:41 -0700 (PDT)
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
Subject: [PATCH v2 07/11] arm64: dts: amlogic: Add cache information to the Amlogic A4 SoC
Date: Mon, 25 Aug 2025 12:21:47 +0530
Message-ID: <20250825065240.22577-8-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250825065240.22577-1-linux.amoon@gmail.com>
References: <20250825065240.22577-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_235342_701490_BC959391 
X-CRM114-Status: GOOD (  10.81  )
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

Cache memory significantly reduces the time it takes for the CPU
to access data and instructions, leading to faster program execution
and overall system responsiveness.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi | 37 +++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
index 563bc2e662fa..fce45933fa28 100644
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


