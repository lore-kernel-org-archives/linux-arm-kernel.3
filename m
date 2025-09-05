Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBF3ECA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 15:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EYuNyG2GAqaie93/7NeU7tj1oNpzzcQbM9L/utkdmAE=; b=ktu67m+zEWD+WspVOhlL/E+kX3
	HNg/7MtuQ6WUUUOPxQSs2MfvPPmudjyQuz+PpMRzFupn19w0YNTFTl+LULg18KxZumMNFf2t6Awc3
	UmMX4ijbZ/UjnkTENTDcKJTEwjB8xWmp9+R0sIQo3Fe5FlBLTDbS7X/7oTHk3O7F3RO24iWvH32az
	2YwC30nFJGa+WfIbgpw7LYyiqc1tvigDacPfdFXeVy6y8uJhtTLkGWaPJKqa4DoSYuxdpCR7+7MZe
	N42LKhdFTwJeRR/85FF0cwowLNMzd28fpkpIjAaG3IJpx5SA8LXbwnhrx99vXYAOtGDL3vqrdIWpF
	t+y9wDGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuYHf-00000002jGh-3PoV;
	Fri, 05 Sep 2025 15:23:27 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuV5z-00000001X0k-0eOM;
	Fri, 05 Sep 2025 11:59:12 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-7722c8d2694so1863755b3a.3;
        Fri, 05 Sep 2025 04:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757073550; x=1757678350; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EYuNyG2GAqaie93/7NeU7tj1oNpzzcQbM9L/utkdmAE=;
        b=Yt25TIxSasusid7NG3sWzZMsa74W+U/vKg5g4YmVIvTocUVfR8nLQsaBd59JKzRPPE
         jsJZl9quQL3HUrER/nv9WuvlxmdmCHB3z8WzztRg8WxVbhEuuifATkGnwPizplYQE2Ze
         +oyn89Qwb/rvesUBaJYOLYo8v9mAQyiOg6orTL7HVpYtGA3lLujplrH4gLIWxzJpXmOL
         UtbAvZPCfv+1NnupJGTeeaC4XENK1pLh2nrnFEINF46HUnev7gNoBJaXs8fErx4cEi/V
         Ps3r2G2OuyF88sS0cKWv3PMf17PLnngjM5W0n4r3cyl8uKZIXf3vVNGHkF+Hy0MU6QcR
         Yhbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757073550; x=1757678350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EYuNyG2GAqaie93/7NeU7tj1oNpzzcQbM9L/utkdmAE=;
        b=CX8l5hMUC4mj5muM/3fkRLT1cjg9Rn9iRwW0dNqpCVdzGuFuvR4gflBdwT/BKXr+2V
         FV1TmMhogmzxCgRkWFKN/wlI04PwunKlAtVpEigerow+tVCPimFupT2FvIXS9Q2tCCIz
         rmtJKkhATXBaRkjggZkSsO93fpjWDDuyOJb/BN7y1KrwCfxq8bBxlVBtFYpWsqTVnb4I
         2T6U7hURWBue58cceKQDsfZAxj6E2K2FAokbBfbbH03fCWsMi2mhShmSa9Ibsol/TrBr
         W6cv9LNPlV+pCfxNpd5/9EH1y8wO+RjyKiTx1NVYspS/kFzvO4O6o8OdPExfCa5obbzS
         dMhg==
X-Forwarded-Encrypted: i=1; AJvYcCVHylR4d15WvHVVFtC9ahlcNxvFPzpjAn04WHv+j7B3KhobR8FAgXLQASEqd+hxZadl6XlD3STXLzhXdIFZeNp2Pg==@lists.infradead.org, AJvYcCVhv+ZUezCJQ0CRLpgsJNAzJYH7mvtowVKAcmo9LbImFDBX+z4GYtZS3OB3XP8mtMfYYVtj+BUQE4g2FtZ+@lists.infradead.org
X-Gm-Message-State: AOJu0Ywytl/Hyy7yAjGlEAHvFxM397rEMgZmZM5Rjky7Qo1ybXLXsPrJ
	isBkXRpEo1HswMsaYGlLoKPpSzsXMoESyUApbkmAABagji9vyQBqma00
X-Gm-Gg: ASbGncslliN8A49Tic8FuXEUctCQrjukpwlc39QfbrVlACmceUOL0MbpqDioDMz+Ada
	HdKmEqEHUJbMo3rFrSZD9wMOjYtVDOcdu09PXKkHcFeU/Sh4ltylPnic95gsfJlqDkVh/MZSnkw
	pFJEVZSkGkXHCK2aj6/FtcPeQ60czyyMnSizVv8veN6tPzlYN9tux75YSWaWq1Zyr5U+WjLUbaR
	JSBOlXZsgCVs0VdmE1nzuDhAyEEUpqi7hHo93AljCy5qnxbNcLHrchPQsG0XuTQJdYwBCG0UpT7
	GjBNSsiHk2zn5Z0cQjHr25oub/vkAvTMo4In1FD083hI5tuAaBITE0boiFdDl/4iBsPlVPd4m1a
	i+ZrbXXYYEhH7PWKIpM0o
X-Google-Smtp-Source: AGHT+IHGB/yjSbbs04l00A0cSu2Dz7NKsJx4kcQ5AewH3kzpAjOf8+eC8mvbiziKgtWS8cvIJPgkzw==
X-Received: by 2002:a05:6a00:189e:b0:772:2a2d:5837 with SMTP id d2e1a72fcca58-7723e0d33a7mr24141035b3a.0.1757073550226;
        Fri, 05 Sep 2025 04:59:10 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.216])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-772396d2b97sm19633049b3a.67.2025.09.05.04.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 04:59:09 -0700 (PDT)
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
Subject: [PATCH v3 03/11] arm64: dts: amlogic: Add cache information to the Amlogic G12A SoCS
Date: Fri,  5 Sep 2025 17:27:34 +0530
Message-ID: <20250905115836.7549-4-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250905115836.7549-1-linux.amoon@gmail.com>
References: <20250905115836.7549-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_045911_193317_0199C2FF 
X-CRM114-Status: GOOD (  10.41  )
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

As per the S905X2 datasheet add missing cache information to the Amlogic
G12A SoC.

- Each Cortex-A53 core has 32KB of L1 instruction cache available and
	32KB of L1 data cache available.
- Along with 512KB Unified L2 cache.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 27 +++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index deee61dbe0741..1321ad95923d2 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -17,6 +17,12 @@ cpu0: cpu@0 {
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
 			next-level-cache = <&l2>;
 			#cooling-cells = <2>;
 		};
@@ -26,6 +32,12 @@ cpu1: cpu@1 {
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x1>;
 			enable-method = "psci";
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
 			next-level-cache = <&l2>;
 			#cooling-cells = <2>;
 		};
@@ -35,6 +47,12 @@ cpu2: cpu@2 {
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x2>;
 			enable-method = "psci";
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
 			next-level-cache = <&l2>;
 			#cooling-cells = <2>;
 		};
@@ -44,6 +62,12 @@ cpu3: cpu@3 {
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x3>;
 			enable-method = "psci";
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
 			next-level-cache = <&l2>;
 			#cooling-cells = <2>;
 		};
@@ -52,6 +76,9 @@ l2: l2-cache0 {
 			compatible = "cache";
 			cache-level = <2>;
 			cache-unified;
+			cache-size = <0x80000>; /* L2. 512 KB */
+			cache-line-size = <64>;
+			cache-sets = <512>;
 		};
 	};
 
-- 
2.50.1


