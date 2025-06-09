Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7196BC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 23:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qj6uAG3CR30tPQ3DnBosD5WTRWZkGf0ig2CTTy+EMb0=; b=eC6sM19cDFYGEtiBvFj8B79kCX
	xeLc+NcoEY41g29fGkwhotuwxWwFbkEdOcH6JJKc0K3qfwliBRN/tj4azADjRVBBx3zNZS7J1egUP
	bFJUwcyjHmzHh6VMUaZ0nBrGvAPqtxfd4JpvSQbP1qURYQfWuqy+jcLfUoQEI6BKXngWwW+B58USb
	GjIm+z8GcmhN/8pLALf4Y7SndMQyQzOF92+kdstY5bSzNXa4aY5THMnjVXWDAYSLoiZ0JPMTgsTaD
	zGD2iHuGx2/uquPLyL9oKmMze8KGPsJhlvTM4sPbItYLd6puuaPU44eI/HDkNq3uX8KDRe+2PR3bU
	rkEtuAcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOmE8-00000005T8Q-0O1l;
	Mon, 09 Jun 2025 23:48:28 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOm7j-00000005SE7-45Fr;
	Mon, 09 Jun 2025 23:41:53 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3a53ee6fcd5so1335377f8f.1;
        Mon, 09 Jun 2025 16:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749512510; x=1750117310; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qj6uAG3CR30tPQ3DnBosD5WTRWZkGf0ig2CTTy+EMb0=;
        b=MrWP1qqyqNWWb0vGb0dBj4yQQzIPNrXL2xfbvqyOCUB2b0yJJUJZQOfi8Rw1UBtzLQ
         is9VTKh0/Yv3StWjQlVhZ9lOT3im7oRpS9G8QFdEdRFS5iU4AijsHe7n2hAMczxRRmJ9
         KutrSfI+SWYVSpWuN+291NbwZ+8u3SYTp4ZV3Kn3ZNAsDyoHlWulNq6ky19sUzK1itLB
         zIPATNnP9/JwMfPxE677s4V2hjsQjUziAs7V/FP3R00GqG+EuH9U+FxYQmoyxY7kbngA
         YKzTTRCpaO2gUwSSOK4QJLSEtTLo/UxnFD76+1/K4UQMjcyrjjJdxcRavyF4bekr8oa0
         injQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749512510; x=1750117310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qj6uAG3CR30tPQ3DnBosD5WTRWZkGf0ig2CTTy+EMb0=;
        b=wfzemyb70XvHHkvMqSkiprLqmmjXPWxM0vvb5jpzfHVy1F4UYeIczNDplmcjxzd+pa
         3zwn3pfkGSg+kvlJxvPXh9upwwwcdPHrdCpLyqeyb3AfV+ePkHgrseVV9j59jH/Qug1H
         Vs8zV0oepdSjmJcLSF8o1ZzAH6PwJGXI5yMnzUvVOsH7U/vDfNb5TMCsLsK8Ieoqu3+S
         rpZBKRKEE55zI0MlYckIS9vFLux7Ykxv999aWX3/lye0Rz4YAkNWEk2JQBeedIHop8oc
         NwG8jCYgTl+2RJDAerUstewhg+VIIUkE/v4rrKkuzaRUG7SAcPyhpH4FVcLnT1NyX0Dn
         J8Zg==
X-Forwarded-Encrypted: i=1; AJvYcCUinbJ7TkL0bSOJ9gChGWlcbDQmttBC+JRiPxjZy4sLKV89XX5+qjD3xMy/iWaO/SmxOqdAPVdVtjs+u77ceSTU@lists.infradead.org, AJvYcCV3/wJ/KaYpa7GqNlDVnvZRHuTzIhdINvOSjBbftqzFz0yh4qPOlRNekV0xlAiBdwAk4ILR8JDbOHki+Fw=@lists.infradead.org
X-Gm-Message-State: AOJu0YxWs9SYsizmMJGcc4SiUofngucu667E0Bs/wGO+S8MBxNpnY1m+
	ZEn/ZXsPExxakV2BDdqZL3svCRPXmNC+jdsLOAfWUBm/FUHRonAmJ7AS
X-Gm-Gg: ASbGncvPAegrWz2OppCaRoof8IOFjjsemBijyMrOOfBJdNhzxKAElkIRskN+9ip9T2e
	GvVG7cHuzOz1I0w6wL2Df3vU6o04MQSe0+Mna9AjP7meZsZfv+qWg319bq037t5yt4JLqHOfcxO
	QgmLLwfE2Z6o0SnTq31W/yimFrJPy0n48uktjlVKawZIFltSWltgPLbym1EOy6rYPtWIXhQB1Y/
	RR00H2NWi1O58JZTjvqZ1VL0gGpwPmCWPsN5EeF6NGJmW4sYc6lqgWzl8JG1N5AZCCe3yCyva5E
	shAp96gt8i8ZyVwwkkaBm1hPDBFg+kEvQZgJOwemGIV/mSakcbAe+K0XTFal6qFZXtcWX+1PSPY
	=
X-Google-Smtp-Source: AGHT+IG4HXf2lSWkvDODDERvUtuiIKNnxnMRw35CA2HnDNQEGWGLzxYU9cPTFbmuYxiabH6Od2fB2A==
X-Received: by 2002:a05:6000:4205:b0:3a3:7987:945f with SMTP id ffacd0b85a97d-3a531ced4e1mr11490073f8f.57.1749512510378;
        Mon, 09 Jun 2025 16:41:50 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244df34sm10849846f8f.71.2025.06.09.16.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 16:41:50 -0700 (PDT)
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
Subject: [PATCH v6 2/6] arm64: dts: sophgo: Add initial SG2000 SoC device tree
Date: Tue, 10 Jun 2025 01:41:13 +0200
Message-ID: <20250609234125.722923-3-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609234125.722923-1-alexander.sverdlin@gmail.com>
References: <20250609234125.722923-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_164152_011259_3DEEC1DC 
X-CRM114-Status: GOOD (  12.77  )
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

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 arch/arm64/boot/dts/sophgo/sg2000.dtsi | 91 ++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000.dtsi

diff --git a/arch/arm64/boot/dts/sophgo/sg2000.dtsi b/arch/arm64/boot/dts/sophgo/sg2000.dtsi
new file mode 100644
index 000000000000..5e69ccfbab56
--- /dev/null
+++ b/arch/arm64/boot/dts/sophgo/sg2000.dtsi
@@ -0,0 +1,92 @@
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
+
+		rst: reset-controller@3003000 {
+			compatible = "sophgo,sg2000-reset";
+			reg = <0x03003000 0x28>;
+			#reset-cells = <1>;
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


