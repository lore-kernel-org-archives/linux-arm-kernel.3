Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB36E6C605
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 05:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LDohY2f+nbe3GKwMG8gRN5xY+j/Umoif3/N9D3h8dqY=; b=Et0dtfYod9aZk0HMp0Tf+xzKRn
	CTDQRNuEcjkLFLM+tnEmqD3S20b9C9puB534TWq+1O5nkBbYJVBgn00HIpIDAK1BAtxYehlaWyFQp
	LK5z1QB1dAk2f7J39b1CeXLQGHABOHCdTfSbSCd6AnnyitqwZwOk78nds2x9GjyNKDnyJpG6y1XA8
	uaxCFCtFtBGoX0sfQOT1uLPYzv+Y5K6nplO5MgqEK3bATU92LaNVpv6ulNxTwqhx0PEtv7KDxmYAX
	J4MnKCOdliuEP+X2hSKEq417no3E4q/d26NaHc5J2w+4a7Nj/uM3PItJAtPD8wMADWz/Inhf70zAm
	0Ta0hrzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tILMY-00000008JrC-1UPF;
	Tue, 03 Dec 2024 05:22:18 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tILCp-00000008INL-47MI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 05:12:17 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-7251abe0e69so4408227b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 21:12:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733202735; x=1733807535; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LDohY2f+nbe3GKwMG8gRN5xY+j/Umoif3/N9D3h8dqY=;
        b=NmyiDZZgz1FbNwr21XGJ4zes82KX63C1IDKAGUj4mxwsVzksoJxzH5ICNivdqGntUW
         lPdJMrHLCT6/RH0kdjnzhmyC9Tw1jjaEzTsVSex4NmSB5YAgftaJrZuVWU1VWuKWpQf6
         2fu9AgtmzjytY2SVdu1YMy7pVm8uik8QdkHHkJ0DbFi734mBQOPcGIVlQqbIWvyoEg+H
         g8pbhQnicZtZwoje5SzdgH/fGzoXap4DLLvCnr+vzHkpFGQ66BJsC4JiWe3XNl0m8Okx
         SBybE/G62XKh4mgNZ53Ma2sgh3RdWpvbwnXwb0F6V+q16a2QVgsAQDqPxTojkHkh1dMw
         yvNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733202735; x=1733807535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LDohY2f+nbe3GKwMG8gRN5xY+j/Umoif3/N9D3h8dqY=;
        b=Hw1D8gF1zY+nwRkMU+DCn0dcRcydiDhSPD0uuNlCZ5ALhQmcCqtzkwbkAWhfBYoAAM
         PUGk8u+xxcd9DJP8FGvFqoRZeq2CMbYBv7WFgmyN0HKUw+pg9GdOMYMFWy/WTY2+mTt+
         FfpBbnSa1aQig+5387vVlvwQXPGlOHXe4DDnHzFH7yVz9y/q4zS09s1Dtt6jGLmDyrNa
         hH6VQFg8rHP+zZs5AwkIx8bI5AGw/LrGq25x3uE/5pVo6V1R82gyhjDTkSehzj+FKxHL
         80BQYoMR7Iz8k6tMfw5XYfv6nf14MV7LZ/ES92CxTjEffl1rMRkIlUOgRs6elg/eeUzy
         hW2A==
X-Forwarded-Encrypted: i=1; AJvYcCXNk3GdLjlGBF1FlDL+ANfMd1cjZDiWQ8TGQIRmXTutHvuMZMO/+pG7AYX43czaOHcQ/eHsXIQ8kb32G/yUR3iq@lists.infradead.org
X-Gm-Message-State: AOJu0Yxg8+bVENfu4EhCyujI9fHoRfdpoPzj/E7NrNCDr1QFu8ZJ/iuN
	FXADeN3i2t/XXFRf19j2AuPQFYH3ikAE3woHU0AUy2qMBVrlcIj7
X-Gm-Gg: ASbGncs9K3dH2/7gXAPfnYpR5OkUu4IhsmLZyO7tv0uF4Oh05UgDFNVztxSrAnaDe01
	CiNBi/O9OZCyr2lXJtfAwEgTbib3LSMHiQ60jHGWtqIgSoQoe49wTQ9vovMQbse++N8YIOtffWz
	G/mO8KqPe+ZZM1QXffL7kBKn0TqKF0hezSOfnGL6zDaX5oQOnvw4hyhYTX1yFnhVdtaq2PotZyP
	Wv8BrdWtgasXkJ6jsgJcQ/wNuv5IKtzqeV7AG71dAa5X5YTpQNDA9Q0rY/CSl/Org==
X-Google-Smtp-Source: AGHT+IGez7ZXWbGwu0FytegBc81dhmqbAWeZxXekCA7fLZFS6HHuQ1Smdyzh3CAF+DgYWIYfQkaTog==
X-Received: by 2002:a05:6a00:13a7:b0:71e:b1dc:f229 with SMTP id d2e1a72fcca58-7257fcac165mr1522181b3a.19.1733202734915;
        Mon, 02 Dec 2024 21:12:14 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-72541848916sm9525047b3a.172.2024.12.02.21.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 21:12:14 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Aun-Ali Zaidi <admin@kodeit.net>,
	Paul Pawlowski <paul@mrarm.io>,
	Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v2 3/3] arm64: dts: apple: t8012: Add PMGR nodes
Date: Tue,  3 Dec 2024 13:10:29 +0800
Message-ID: <20241203051147.110980-4-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241203051147.110980-1-towinchenmi@gmail.com>
References: <20241203051147.110980-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_211216_026447_117F2C83 
X-CRM114-Status: GOOD (  15.63  )
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

Add the two PMGR nodes and all known power state subnodes. Since there
are a large number of them, put them in a separate file to include.

On models with only 1 GB of memory, only two memory channels are used,
and on models with 2 GB of memory, four memory channels are used. The
"apple,always-on" property of the extra memory channel power domains
(ps_dcs2, ps_dcs3) will be removed by loader on models with 1 GB of
memory.

The amount of memory depends on the storage configuration of the Mac.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8012-pmgr.dtsi     | 837 ++++++++++++++++++
 arch/arm64/boot/dts/apple/t8012-touchbar.dtsi |   1 +
 arch/arm64/boot/dts/apple/t8012.dtsi          |  22 +
 3 files changed, 860 insertions(+)
 create mode 100644 arch/arm64/boot/dts/apple/t8012-pmgr.dtsi

diff --git a/arch/arm64/boot/dts/apple/t8012-pmgr.dtsi b/arch/arm64/boot/dts/apple/t8012-pmgr.dtsi
new file mode 100644
index 000000000000..35a462edd4af
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8012-pmgr.dtsi
@@ -0,0 +1,837 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * PMGR Power domains for the Apple T8012 "T2" SoC
+ *
+ * Copyright (c) 2024 Nick Chan <towinchenmi@gmail.com>
+ */
+
+&pmgr {
+	ps_cpu0: power-controller@80000 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80000 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "cpu0";
+		apple,always-on; /* Core device */
+	};
+
+	ps_cpu1: power-controller@80008 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80008 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "cpu1";
+		apple,always-on; /* Core device */
+	};
+
+	ps_cpm: power-controller@80040 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80040 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "cpm";
+		apple,always-on; /* Core device */
+	};
+
+	ps_sio_busif: power-controller@80158 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80158 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "sio_busif";
+	};
+
+	ps_sio_p: power-controller@80160 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80160 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "sio_p";
+		power-domains = <&ps_sio_busif>;
+	};
+
+	ps_iomux: power-controller@80150 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80150 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "iomux";
+	};
+
+	ps_sbr: power-controller@80100 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80100 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "sbr";
+		apple,always-on; /* Apple fabric, critical block */
+	};
+
+	ps_aic: power-controller@80108 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80108 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "aic";
+		apple,always-on; /* Core device */
+	};
+
+	ps_gpio: power-controller@80110 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80110 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "gpio";
+	};
+
+	ps_pcie_down_ref: power-controller@80138 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80138 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pcie_down_ref";
+	};
+
+	ps_pcie_stg0_ref: power-controller@80140 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80140 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pcie_stg0_ref";
+	};
+
+	ps_pcie_stg1_ref: power-controller@80148 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80148 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pcie_stg1_ref";
+	};
+
+	ps_mca0: power-controller@80170 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80170 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "mca0";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_mca1: power-controller@80178 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80178 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "mca1";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_mca2: power-controller@80180 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80180 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "mca2";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_mca3: power-controller@80188 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80188 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "mca3";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_mca4: power-controller@80190 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80190 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "mca4";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_mca5: power-controller@80198 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80198 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "mca5";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_i2c0: power-controller@801a8 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801a8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "i2c0";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_i2c1: power-controller@801b0 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801b0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "i2c1";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_i2c2: power-controller@801b8 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801b8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "i2c2";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_i2c3: power-controller@801c0 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801c0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "i2c3";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_spi0: power-controller@801e0 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801e0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "spi0";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_spi1: power-controller@801e8 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801e8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "spi1";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_spi2: power-controller@801f0 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801f0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "spi2";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_spi3: power-controller@801f8 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801f8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "spi3";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_pwm0: power-controller@801a0 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801a0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pwm0";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_sio: power-controller@80168 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80168 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "sio";
+		power-domains = <&ps_sio_p>;
+		apple,always-on; /* Core device */
+	};
+
+	ps_isp_sens0: power-controller@80120 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80120 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "isp_sens0";
+	};
+
+	ps_isp_sens1: power-controller@80128 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80128 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "isp_sens1";
+	};
+
+	ps_isp_sens2: power-controller@80130 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80130 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "isp_sens2";
+	};
+
+	ps_pms: power-controller@80118 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80118 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pms";
+		apple,always-on; /* Core device */
+	};
+
+	ps_i2c4: power-controller@801c8 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801c8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "i2c4";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_i2c5: power-controller@801d0 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801d0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "i2c5";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_i2c6: power-controller@801d8 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801d8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "i2c6";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_usb: power-controller@80268 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80268 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "usb";
+	};
+
+	ps_usbctrl: power-controller@80270 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80270 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "usbctrl";
+		power-domains = <&ps_usb>;
+	};
+
+	ps_usb2host0: power-controller@80278 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80278 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "usb2host0";
+		power-domains = <&ps_usbctrl>;
+	};
+
+	ps_usb2host1: power-controller@80288 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80288 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "usb2host1";
+		power-domains = <&ps_usbctrl>;
+	};
+
+	ps_rtmux: power-controller@802a8 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x802a8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "rtmux";
+	};
+
+	ps_media: power-controller@802d8 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x802d8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "media";
+	};
+
+	ps_isp_sys: power-controller@802d0 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x802d0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "isp_sys";
+		power-domains = <&ps_rtmux>;
+	};
+
+	ps_msr: power-controller@802e8 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x802e8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "msr";
+		power-domains = <&ps_media>;
+	};
+
+	ps_jpg: power-controller@802e0 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x802e0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "jpg";
+		power-domains = <&ps_media>;
+	};
+
+	ps_disp0_fe: power-controller@802b0 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x802b0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "disp0_fe";
+		power-domains = <&ps_rtmux>;
+	};
+
+	ps_disp0_be: power-controller@802b8 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x802b8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "disp0_be";
+		power-domains = <&ps_disp0_fe>;
+	};
+
+	ps_uart0: power-controller@80200 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80200 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart0";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart1: power-controller@80208 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80208 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart1";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart2: power-controller@80210 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80210 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart2";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart3: power-controller@80218 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80218 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart3";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart4: power-controller@80220 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80220 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart4";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_dpa: power-controller@80228 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80228 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "dpa";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_hfd0: power-controller@80230 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80230 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "hfd0";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_mcc: power-controller@80240 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80240 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "mcc";
+		apple,always-on; /* Memory cache controller */
+	};
+
+	ps_dcs0: power-controller@80248 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80248 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "dcs0";
+		apple,always-on; /* LPDDR4 interface */
+	};
+
+	ps_dcs1: power-controller@80250 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80250 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "dcs1";
+		apple,always-on; /* LPDDR4 interface */
+	};
+
+	ps_dcs2: power-controller@80258 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80258 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "dcs2";
+		/* Not used on some devicecs, to be disabled by loader */
+		apple,always-on; /* LPDDR4 interface */
+	};
+
+	ps_dcs3: power-controller@80260 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80260 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "dcs3";
+		/* Not used on some devicecs, to be disabled by loader */
+		apple,always-on; /* LPDDR4 interface */
+	};
+
+	ps_usb2host0_ohci: power-controller@80280 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80280 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "usb2host0_ohci";
+		power-domains = <&ps_usb2host0>;
+	};
+
+	ps_usbotg: power-controller@80290 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80290 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "usbotg";
+		power-domains = <&ps_usbctrl>;
+	};
+
+	ps_smx: power-controller@80298 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80298 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "smx";
+		apple,always-on; /* Apple fabric, critical block */
+	};
+
+	ps_sf: power-controller@802a0 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x802a0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "sf";
+		apple,always-on; /* Apple fabric, critical block */
+	};
+
+	ps_mipi_dsi: power-controller@802c8 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x802c8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "mipi_dsi";
+		power-domains = <&ps_disp0_be>;
+	};
+
+	ps_pmp: power-controller@802f0 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x802f0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pmp";
+	};
+
+	ps_pms_sram: power-controller@802f8 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x802f8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pms_sram";
+	};
+
+	ps_pcie_up_af: power-controller@80320 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80320 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pcie_up_af";
+		power-domains = <&ps_iomux>;
+	};
+
+	ps_pcie_up: power-controller@80328 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80328 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pcie_up";
+		power-domains = <&ps_pcie_up_af>;
+	};
+
+	ps_venc_sys: power-controller@80300 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80300 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "venc_sys";
+		power-domains = <&ps_media>;
+	};
+
+	ps_ans2: power-controller@80308 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80308 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "ans2";
+		power-domains = <&ps_iomux>;
+	};
+
+	ps_pcie_down: power-controller@80310 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80310 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pcie_down";
+		power-domains = <&ps_iomux>;
+	};
+
+	ps_pcie_down_aux: power-controller@80318 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80318 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pcie_down_aux";
+	};
+
+	ps_pcie_up_aux: power-controller@80330 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80330 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pcie_up_aux";
+		power-domains = <&ps_pcie_up>;
+	};
+
+	ps_pcie_stg0: power-controller@80338 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80338 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pcie_stg0";
+		power-domains = <&ps_ans2>;
+	};
+
+	ps_pcie_stg0_aux: power-controller@80340 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80340 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pcie_stg0_aux";
+	};
+
+	ps_pcie_stg1: power-controller@80348 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80348 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pcie_stg1";
+		power-domains = <&ps_ans2>;
+	};
+
+	ps_pcie_stg1_aux: power-controller@80350 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80350 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pcie_stg1_aux";
+	};
+
+	ps_sep: power-controller@80400 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80400 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "sep";
+		apple,always-on; /* Locked on */
+	};
+
+	ps_isp_rsts0: power-controller@84000 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x84000 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "isp_rsts0";
+		power-domains = <&ps_isp_sys>;
+	};
+
+	ps_isp_rsts1: power-controller@84008 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x84008 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "isp_rsts1";
+		power-domains = <&ps_isp_sys>;
+	};
+
+	ps_isp_vis: power-controller@84010 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x84010 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "isp_vis";
+		power-domains = <&ps_isp_sys>;
+	};
+
+	ps_isp_be: power-controller@84018 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x84018 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "isp_be";
+		power-domains = <&ps_isp_sys>;
+	};
+
+	ps_isp_pearl: power-controller@84020 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x84020 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "isp_pearl";
+		power-domains = <&ps_isp_sys>;
+	};
+
+	ps_venc_pipe4: power-controller@88000 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x88000 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "venc_pipe4";
+	};
+
+	ps_venc_pipe5: power-controller@88008 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x88008 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "venc_pipe5";
+	};
+
+	ps_venc_me0: power-controller@88010 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x88010 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "venc_me0";
+	};
+
+	ps_venc_me1: power-controller@88018 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x88018 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "venc_me1";
+	};
+};
+
+&pmgr_mini {
+	ps_spmi: power-controller@80058 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80058 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "spmi";
+		apple,always-on; /* Core AON device */
+	};
+
+	ps_nub_aon: power-controller@80060 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80060 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "nub_aon";
+		apple,always-on; /* Core AON device */
+	};
+
+	ps_smc_fabric: power-controller@80030 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80030 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "smc_fabric";
+		apple,always-on; /* Core AON device */
+	};
+
+	ps_smc_aon: power-controller@80088 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80088 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "smc_aon";
+		apple,always-on; /* Core AON device */
+	};
+
+	ps_debug: power-controller@80050 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80050 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "debug";
+	};
+
+	ps_nub_sram: power-controller@801a0 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801a0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "nub_sram";
+		apple,always-on; /* Core AON device */
+	};
+
+	ps_nub_fabric: power-controller@80198 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80198 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "nub_fabric";
+		apple,always-on; /* Core AON device */
+	};
+
+	ps_smc_cpu: power-controller@801a8 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801a8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "smc_cpu";
+		power-domains = <&ps_smc_fabric &ps_smc_aon>;
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/t8012-touchbar.dtsi b/arch/arm64/boot/dts/apple/t8012-touchbar.dtsi
index f4a8b12437f0..fc4a80d0c787 100644
--- a/arch/arm64/boot/dts/apple/t8012-touchbar.dtsi
+++ b/arch/arm64/boot/dts/apple/t8012-touchbar.dtsi
@@ -12,6 +12,7 @@ chosen {
 		framebuffer0: framebuffer@0 {
 			compatible = "apple,simple-framebuffer", "simple-framebuffer";
 			reg = <0 0 0 0>; /* To be filled by loader */
+			power-domains = <&ps_disp0_fe &ps_disp0_be &ps_mipi_dsi>;
 			/* Format properties will be added by loader */
 			status = "disabled";
 		};
diff --git a/arch/arm64/boot/dts/apple/t8012.dtsi b/arch/arm64/boot/dts/apple/t8012.dtsi
index 45d24ca091b0..907ba127be79 100644
--- a/arch/arm64/boot/dts/apple/t8012.dtsi
+++ b/arch/arm64/boot/dts/apple/t8012.dtsi
@@ -61,19 +61,30 @@ serial0: serial@20a600000 {
 			/* Use the bootloader-enabled clocks for now. */
 			clocks = <&clkref>, <&clkref>;
 			clock-names = "uart", "clk_uart_baud0";
+			power-domains = <&ps_uart0>;
 			status = "disabled";
 		};
 
+		pmgr: power-management@20e000000 {
+			compatible = "apple,t8010-pmgr", "apple,pmgr", "syscon", "simple-mfd";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			reg = <0x2 0xe000000 0 0x8c000>;
+		};
+
 		aic: interrupt-controller@20e100000 {
 			compatible = "apple,t8010-aic", "apple,aic";
 			reg = <0x2 0x0e100000 0x0 0x100000>;
 			#interrupt-cells = <3>;
 			interrupt-controller;
+			power-domains = <&ps_aic>;
 		};
 
 		pinctrl_ap: pinctrl@20f100000 {
 			compatible = "apple,t8010-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x0f100000 0x0 0x100000>;
+			power-domains = <&ps_gpio>;
 
 			gpio-controller;
 			#gpio-cells = <2>;
@@ -130,6 +141,14 @@ pinctrl_nub: pinctrl@2111f0000 {
 				     <AIC_IRQ 166 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		pmgr_mini: power-management@211200000 {
+			compatible = "apple,t8010-pmgr", "apple,pmgr", "syscon", "simple-mfd";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			reg = <0x2 0x11200000 0 0x84000>;
+		};
+
 		wdt: watchdog@2112b0000 {
 			compatible = "apple,t8010-wdt", "apple,wdt";
 			reg = <0x2 0x112b0000 0x0 0x4000>;
@@ -141,6 +160,7 @@ wdt: watchdog@2112b0000 {
 		pinctrl_smc: pinctrl@212024000 {
 			compatible = "apple,t8010-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x12024000 0x0 0x1000>;
+			power-domains = <&ps_smc_cpu>;
 
 			gpio-controller;
 			#gpio-cells = <2>;
@@ -174,3 +194,5 @@ timer {
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
 };
+
+#include "t8012-pmgr.dtsi"
-- 
2.47.1


