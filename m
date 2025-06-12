Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E1CC7114A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 19:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0sCYZE5IfgD4vq8LpQHj7/SMtKJgfoiLAqLcowjxSDE=; b=Kc+Vyr0oNEOIAj0MvX4Hcp13FI
	m/QYtnY1Zczs55Haz9zY6UXUnteyRgTME0fBnzhOI4VCwJReZsaCSRNgf8JIpi/B6qjpU5Wao6xtN
	YMhDZ6Lx63VrNaY5IT9I8/+9X3Wh2rOCrwfPUKoWz4C/aRVnDLMoDfKoZ3VoNJaTH2RnE9JvbAtjb
	PaZDRoovcxTph5ZqadPP2O7r8aDuchOxfvpw+JmJAXWTPFO0SeC1LL/mlY+RZa7pkD02AylPMTLVS
	ne+HDpQfsCUywM6UkREW4+lTTHFVz2GkUzaq+dSh92gWGA5LyR5SYp8AiMzug9fvNtn9CJbxzZ6LV
	f+QCddTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnor-0000000EGQj-2oxb;
	Thu, 12 Jun 2025 19:42:37 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhyv-0000000DST9-1iNs;
	Thu, 12 Jun 2025 13:28:38 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3a531fcaa05so556545f8f.3;
        Thu, 12 Jun 2025 06:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749734916; x=1750339716; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0sCYZE5IfgD4vq8LpQHj7/SMtKJgfoiLAqLcowjxSDE=;
        b=ZQkk43OAqs9jzPZBoX3Ztbrb+JJe42SuHVgfzew6RCp3pJwxTJZ4JhZ6s+p8L1xPYN
         vObLVPtr0yQIP6Dk1oKsuOSK7Pn59Plvg1zuUp0QwqatLCDASkMk2AZsPLd0etdmOhWO
         maKPfbP4qfAwxxwAGmNqhUC3UF6z+wcGQBwz32dyi9X0tnn6SSFByYJTEZWbXZI5wnce
         AJB68vLDuzrnj2aMNTj9NTKLYaIE1wXnvjcKw/E0PgCA3mwJkBKM+fWLeojbL0B4RH4p
         xmzuZSsdoJk8p1fMmUtl1Gu93e29QxeKVfBKDoDRTkdTsKrHqfSDDurNBlXmTdZOoil8
         BXQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734916; x=1750339716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0sCYZE5IfgD4vq8LpQHj7/SMtKJgfoiLAqLcowjxSDE=;
        b=kci65EOAogSY3Lc8UJY+KvC7b2+FfStL9UbiI0wgrxfs/AUXYixOzxBFaDT+gg0Fn/
         4KRy8VvyzRECIOWNVktRHqiJVuJuT3weZZtheckFMBFS9AFZ0t2hBjS5OZnl/YHg8qNz
         FuohXTITLZmJCubXG42SJ28Yr0HIdURuXdIYRUGMWewpX23oWOFE9A64N2SJfRhr5/fv
         89w3o8lKSy9+wwG7eXBXAwqiXiLfN68SVepwZ8rtQbZktcf2uz2xBcWbmlhdavr4L4Y7
         QVuSaTa+j0TFuy1s7Hf+6w7UE1nEavnGLRaVtYYLCJ2zhYiPOJP2VKVQJ+mYAf8RIDjD
         3itw==
X-Forwarded-Encrypted: i=1; AJvYcCUUhg0GCvDIc+dt/VIpoNw5fbfRs0OKADyM/4VxEg2Vo8SSNkmLNEjHzQfYyWwFWyP0ceRsRYnYD+yjWwNtoG1I@lists.infradead.org, AJvYcCWXHvcr+oeDBCGqdT7jQDo8VQ2kZve4JjO0arUQHA9nW2mr1l64hXPad/lr1b76sMa3t4xB4rv/HwnW1Kg=@lists.infradead.org
X-Gm-Message-State: AOJu0YwNSvvzuSXKtAy18ErJMiTTzqBzAVCaNUNvLcpu/lZ6bzk0zvNn
	IaNukn5dbiPeLZoqF7XsdOauiAScAIo1I+qAUaqZhCAyNnccW30+Cxb/
X-Gm-Gg: ASbGncuGn/4z25KBK62oFKt+L6g71umdVyisD9HNBvwv6DnlvZqGKA1kcpC3FfK+Dqo
	aZwcB3Fdb4F+28JBDVDsryxu9Y+6hRXextqmJF71cb099rzhM2EeXaY1AhvOcWTTvYW/xllW4ka
	akaVUEE98CRKo7B9U54Lj8zcN1XyqWHLBlwE9wtAU61EsWolzVgZ4zXe13ULUbNuJUY+wWYrabl
	/JksV8HNZzJaLaRyNu9HSbSKKXJBSkEVSJOMGNSnLOHu9yezlqm0XcHu/b8bYvxiS29CL4htoQf
	klk9X86P/qqZbpMcxS5uy+ZNf9I+oNNPP2HN/0jzNDUJ1hdULDdGib6olTYwyT8oOvY/xnZ21k8
	=
X-Google-Smtp-Source: AGHT+IF2Rk2EMA7CUDmu9RW+8xww+gs3Pr2zOlxJ5syLEar+9EgPxlxS8SPmYN1F0YFp/SKDPm47gA==
X-Received: by 2002:a05:6000:258a:b0:3a4:f00b:69b6 with SMTP id ffacd0b85a97d-3a560760e2emr3033081f8f.54.1749734915582;
        Thu, 12 Jun 2025 06:28:35 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a561b653d5sm1982809f8f.86.2025.06.12.06.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:28:35 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: sophgo@lists.linux.dev,
	soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Chao Wei <chao.wei@sophgo.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v8 2/6] arm64: dts: sophgo: Add initial SG2000 SoC device tree
Date: Thu, 12 Jun 2025 15:28:10 +0200
Message-ID: <20250612132844.767216-3-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612132844.767216-1-alexander.sverdlin@gmail.com>
References: <20250612132844.767216-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_062837_444765_D8B7245D 
X-CRM114-Status: GOOD (  12.87  )
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

Add initial device tree for the SG2000 SoC by SOPHGO (from ARM64 PoV).

Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 arch/arm64/boot/dts/sophgo/sg2000.dtsi | 86 ++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000.dtsi

diff --git a/arch/arm64/boot/dts/sophgo/sg2000.dtsi b/arch/arm64/boot/dts/sophgo/sg2000.dtsi
new file mode 100644
index 000000000000..51177dfe9ed2
--- /dev/null
+++ b/arch/arm64/boot/dts/sophgo/sg2000.dtsi
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+#define SOC_PERIPHERAL_IRQ(nr)		GIC_SPI (nr)
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <riscv/sophgo/cv180x.dtsi>
+#include <riscv/sophgo/cv181x.dtsi>
+
+/ {
+	compatible = "sophgo,sg2000";
+	interrupt-parent = <&gic>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			compatible = "arm,cortex-a53";
+			device_type = "cpu";
+			reg = <0>;
+			enable-method = "psci";
+			i-cache-size = <32768>;
+			d-cache-size = <32768>;
+			next-level-cache = <&l2>;
+		};
+
+		l2: l2-cache {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-unified;
+			cache-size = <0x20000>;
+		};
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x20000000>;	/* 512MiB */
+	};
+
+	pmu {
+		compatible = "arm,cortex-a53-pmu";
+		interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	psci {
+		compatible = "arm,psci-0.2";
+		method = "smc";
+		cpu_on = <0xc4000003>;
+		cpu_off = <0x84000002>;
+	};
+
+	soc {
+		gic: interrupt-controller@1f01000 {
+			compatible = "arm,cortex-a15-gic";
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			reg = <0x01f01000 0x1000>,
+			      <0x01f02000 0x2000>;
+		};
+
+		pinctrl: pinctrl@3001000 {
+			compatible = "sophgo,sg2000-pinctrl";
+			reg = <0x03001000 0x1000>,
+			      <0x05027000 0x1000>;
+			reg-names = "sys", "rtc";
+		};
+
+		clk: clock-controller@3002000 {
+			compatible = "sophgo,sg2000-clk";
+			reg = <0x03002000 0x1000>;
+			clocks = <&osc>;
+			#clock-cells = <1>;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
+		always-on;
+		clock-frequency = <25000000>;
+	};
+};
-- 
2.49.0


