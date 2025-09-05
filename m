Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51305CA1010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 15:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SQRvt9uBTFMXXvpgLZGSa1xJHygjeYjUVBoxX6iZKhU=; b=PGtjvQx9QaH8bVi2DI5stBE5z0
	T48Oh8pZrPlme3zZyGk3wlIbKF2HyZ5/+Hew8CeNLOLx/EZhFf12d8OaG389JfIM0uv+HpBoxF6FX
	Rf3eyW/40NGcWCo+xXc8kwLoC9nmJaCCC9we8gJ2MZdpWkiR0vRzsZESBvLfi5wUb4pSwdR5DQ96Q
	Yv/l6QKJJaTiRB2Y6g2b81wSqQN8VoUusXONyqdeDaSTJbfaaQGvkHY5Z575/fA9K/WZTIGrHtEya
	VLMhswMhVu33K8JNZwQD67808KhaOs7xfQnZdRGi4ZixKy9otY3U3OdfxWwBh/LY1w6hi+NzXoqXI
	DOHsInLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuYKT-00000002kTD-0IVl;
	Fri, 05 Sep 2025 15:26:21 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuV66-00000001X3J-3rGB;
	Fri, 05 Sep 2025 11:59:20 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-7726c7ff7e5so1739822b3a.3;
        Fri, 05 Sep 2025 04:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757073558; x=1757678358; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SQRvt9uBTFMXXvpgLZGSa1xJHygjeYjUVBoxX6iZKhU=;
        b=a0LdtoTuUyzBAJUc+/GignpAy3ZppCorNhHfM4lfgQ1nyNJq4QmtJZJuRlGoGD0VUc
         tmX43Ws/RX0614CBkLWZ+axvf4J//b1PLS75uobk8cyCu4K6TLaMgK6pVhrKSNJewBbx
         5oJsIcdUmZvOE7fCEwE/KIuCC3awINY5/MEi+zISECFAfyIhNCUzB05l0v9QKPQNL9Y+
         S8vUIPgbDUFyyBZO1fKuqshOeRLywhGPkYFlkd0UJ8IHSEwAKQ4qRQE8WmMlRmFK7lZg
         fm74LmDmurIy0rOx4rm1lVgkwoBOn0z2ht7e0yXYy+X4SutHUTqrN5sbPFR+inLD70bw
         t5bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757073558; x=1757678358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SQRvt9uBTFMXXvpgLZGSa1xJHygjeYjUVBoxX6iZKhU=;
        b=g9Xgpozh9I4i9fODrpFIntsKqLNVO5vwBGabvs6Ag5ZLfSl3yR9O0H4ZUr/AtQE9BR
         oJ1owZNQ/4h+4JqPBnpRIKj0QwhiHzFYFLh6fHSaeHR1DfF+uvJ58yDtolw2oAzEvMO5
         b+ooZLpDj4KVEn16PlvsG0KGP6RI/hcflzhkuU3HLGvQWMflUAORAt58HkMRBwdflF3p
         bBPBnyNi0vcFXWCvN/H8f3J+R0j8lJQO1ZLHy5bpv4cv1uLm1tVBjhMRBtHf2bgmgPyT
         YQN4VBYlU9gEh/fj6L8NcbBAKAXqyZjFoOv0n645EtzRlSy8khmTlH30TY6w3XbXnJaX
         VlIw==
X-Forwarded-Encrypted: i=1; AJvYcCUwpEaAa14aLTEGOCfHHaGpp3R3G0GSidK999qnEYvLdynWLWrbb2l1i74cPyPk6AbDxN95NKNbMVfqGQ7h6a5VBg==@lists.infradead.org, AJvYcCXcLukraSVX3dU8wJDRB96lDtkkdtfc723huoTZRAKuselrPBAECBk8PTd5GARSYOQfwcCX7MDPmASCVlGV@lists.infradead.org
X-Gm-Message-State: AOJu0YzRwihFnMS3zmh3xXj4ZNBGZg837vZJ2N/DJDxUPWWFMFMLWseF
	WPxgQqwYYu8WvhNqzkEB3YulC9i3ysgxcURmuIZ8LRCs33Nj7didN82A
X-Gm-Gg: ASbGncsBHrzsWtwTSV44afM0bBB/27qqTxJHsxSVKQVk+D6A6aw5gM0uVtNOdek51tl
	/YKaqoObR013C0h0SDymqyrbPVgz9yENx7EMvm1txuKA//N0nD9/VUAUOLTIEhed/fRHhNg9SYt
	8Xx1bymzw3lojZc4DV5TRKTA9Qx9vLbln2YpQsYP4bFPlzQbTidMX0ioX//Rg0PVVZdnZn+SXI/
	gzfq7H3059FNR5oKCoaong+W/WWwbwxfEuLcgfniCLUUTdvlEA8MKb8fDhQ4vrQddZXJlrGpzHF
	s3LhFggAyhK6aqLlA/taQKSjRfWig94Lng3Xo2ek6R3qU/oCQhVC8rleGDrCRhmw5UMvaCng/Ar
	6/j0+2ntB7uw5ugJaFrFQ
X-Google-Smtp-Source: AGHT+IEA3O6qg8Al08yH+IcVx51Ms5/iMo7ps0M8H6/gioh1Dfty4GNJkVv3B6Xoq2XuN8YcK3anFw==
X-Received: by 2002:a05:6a20:7491:b0:24b:1a6d:298b with SMTP id adf61e73a8af0-24b1a6d2b96mr9339089637.34.1757073558057;
        Fri, 05 Sep 2025 04:59:18 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.216])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-772396d2b97sm19633049b3a.67.2025.09.05.04.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 04:59:17 -0700 (PDT)
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
Subject: [PATCH v3 04/11] arm64: dts: amlogic: Add cache information to the Amlogic AXG SoCS
Date: Fri,  5 Sep 2025 17:27:35 +0530
Message-ID: <20250905115836.7549-5-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250905115836.7549-1-linux.amoon@gmail.com>
References: <20250905115836.7549-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_045918_957232_2C05ECA3 
X-CRM114-Status: GOOD (  10.10  )
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

As per the AXG datasheet add missing cache information to the Amlogic AXG
SoC.

- Each Cortex-A53 core has 32KB of L1 instruction cache available and
	32KB of L1 data cache available.
- Along with 512KB Unified L2 cache.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 2df143aa77ce3..04fb130ac7c6a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -83,6 +83,12 @@ cpu1: cpu@1 {
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
 			clocks = <&scpi_dvfs 0>;
 			dynamic-power-coefficient = <140>;
@@ -94,6 +100,12 @@ cpu2: cpu@2 {
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
 			clocks = <&scpi_dvfs 0>;
 			dynamic-power-coefficient = <140>;
@@ -105,6 +117,12 @@ cpu3: cpu@3 {
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
 			clocks = <&scpi_dvfs 0>;
 			dynamic-power-coefficient = <140>;
@@ -115,6 +133,9 @@ l2: l2-cache0 {
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


