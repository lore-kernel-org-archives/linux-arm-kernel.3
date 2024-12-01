Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D4C6D49771
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Dec 2024 16:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D3wxJM7ICZPpi5BzAOxdFIn3Wi9/0d0QECOuWv9aRo0=; b=XnSD+CVpDA0szvbn9wlzztDREb
	WXjUhTvjGUSECj5YfVLZNlK5KAE4yqJNvK7t7fDnF3WoBk2X+VWIFRXcEPYfVftr2VhElSLvN/5vU
	DayCmeAq2MptHfxYyFjOHbdLnR3zExMIQu4TonDe84q14zCC42M89vD1p1lS3TXMA+Puos2xJ9oVo
	wzHBrE8m42zE30LgqcwHoFk10ufg5EvjBL4uh4yKeZxTVuBrIF4V6q+SwugreHGMc37KwkL5j/SFu
	meUrJjhCyCcGapD3yR8ZrmDK7hj8J+JvRcMcD2v+FZrnp6IhJDs3yUyp7DCBluB7RxDBoEkW7+Np5
	ulOX5ybQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHmT4-000000041ms-342s;
	Sun, 01 Dec 2024 16:06:42 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHmNW-000000040nF-2AxY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Dec 2024 16:00:59 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2ee709715d9so1189228a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Dec 2024 08:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733068857; x=1733673657; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D3wxJM7ICZPpi5BzAOxdFIn3Wi9/0d0QECOuWv9aRo0=;
        b=WtkTmrLDZ9dCb2TkGpE75W/YdkbadDHwCFmVelpl5ExljOOzrC51nMJ4q9odyuENVg
         tJlVKD+XN7HySSaGmrYNOD9e7XyUci7jA7RUZviCQkb3B58XXVZdE6poicPyCJdepS2S
         SrFSHqXMYXvDYSPn1TVDa1iEPEiA+0+n0RogeIbMLXpM6fXI1Cxi4Rn9GKfuqnpOpBnP
         8/6KoocEu//+WLuU/4G/Wx7OzrOotvcKeJfh9McLwTBRvJyaL4mXxiNzoEmwq36RYx4e
         No49IiNs1lGShdp8aqSgVN5s3dsajZHD/ocbG4vgCYq7lqOHH2asQyYL4zaKrbuXKn8G
         w0tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733068857; x=1733673657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D3wxJM7ICZPpi5BzAOxdFIn3Wi9/0d0QECOuWv9aRo0=;
        b=QDLluzX8WM/SWNxYgKs/ZkewKU/WQfD+K3dDB60/CUzWvdKJFFtFu/NoUleUEymN6f
         4zF+7CekOUqKSXMwXMGFVhgH9hbP9pUkFMZS7WK4edvcdPr/4uqPP4Ib3QfowL3QfrAx
         Pkg1ytsC9mck4sjOYCj9MnRbM7UXh5XhqADQRs9wM2Kxk3Uohf603jymCCvmHdB/ErvZ
         DSqwdptwzjQVpDDA5lDRFBgbWHkNC4DkrQkc1eq+2grjfJYa6Pf1hQgDpLkoqrjNtZIB
         13e0JhVulGCMcGB7UIuV0gyvZ87hwvuH9zq/PfYq+R3+LY5p7/XwfCin2AIawOprjlkU
         lhxA==
X-Forwarded-Encrypted: i=1; AJvYcCUCbTfsWBky6MgfnGmdZCFfAcIKMgigWjpSOpTZy0maAuPlUkk6khmtiv6GC+lbERm5INPW1EuIxM6RzloeF1CE@lists.infradead.org
X-Gm-Message-State: AOJu0YwSasEOupP39UhVkAO1tj/8HPyvKzi6mghl6pr4R4BTBm0DEvaC
	auq0zckNTyI4f5fk7hnog1Z0b3qkBPQJSXthiiGfM//YFOFvgktcHEqP+w==
X-Gm-Gg: ASbGncstcJsafGo9++SHdfO/ofLtTkzh9G/FRyIaWtYBjXmsXkpRAjn72lJxqEeFBI+
	h06BSYx/YMm6hxDBMXm9LztLt8kixw3so3jODhH4AQDIQrPlB86b+kOYG1phW1hLD5B+isAf4iy
	BTDQUPTeGwEJXV4qMuPpqTNyiALwQGt56EPQFisZfJKEcP+XCGqiSJcLWL5rwMNFbmJwA+n2Un/
	hJAFsoWBen5BMWC5RMvWBD7DPSqT8FtEE3LMBk5yQh1QF/R1Lo4RPetEpuwv1A4YA==
X-Google-Smtp-Source: AGHT+IHZvr5En4309+/L97Hub0U64RSLjeGTHed9RELZyVvZf5+eEKlmKrnXpw5gpYizz4NYr3osXw==
X-Received: by 2002:a17:90b:4c8e:b0:2ee:8430:b834 with SMTP id 98e67ed59e1d1-2ee8430bb49mr7997985a91.4.1733068857192;
        Sun, 01 Dec 2024 08:00:57 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2ee6ebc4a73sm2395173a91.0.2024.12.01.08.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 08:00:56 -0800 (PST)
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
Cc: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v4 05/10] arm64: dts: apple: t7001: Add PMGR node
Date: Sun,  1 Dec 2024 23:56:42 +0800
Message-ID: <20241201155820.29259-6-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241201155820.29259-1-towinchenmi@gmail.com>
References: <20241201155820.29259-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_080058_560155_3A1E7B63 
X-CRM114-Status: GOOD (  14.99  )
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

This adds the PMGR node and all known power state subnodes. Since there
are a large number of them, let's put them in a separate file to include.

Acked-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t7001-air2.dtsi |   1 +
 arch/arm64/boot/dts/apple/t7001-pmgr.dtsi | 650 ++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t7001.dtsi      |  13 +
 3 files changed, 664 insertions(+)
 create mode 100644 arch/arm64/boot/dts/apple/t7001-pmgr.dtsi

diff --git a/arch/arm64/boot/dts/apple/t7001-air2.dtsi b/arch/arm64/boot/dts/apple/t7001-air2.dtsi
index 19fabd425c52..e4ec8c1977de 100644
--- a/arch/arm64/boot/dts/apple/t7001-air2.dtsi
+++ b/arch/arm64/boot/dts/apple/t7001-air2.dtsi
@@ -20,6 +20,7 @@ chosen {
 		framebuffer0: framebuffer@0 {
 			compatible = "apple,simple-framebuffer", "simple-framebuffer";
 			reg = <0 0 0 0>; /* To be filled by loader */
+			power-domains = <&ps_disp0 &ps_dp>;
 			/* Format properties will be added by loader */
 			status = "disabled";
 		};
diff --git a/arch/arm64/boot/dts/apple/t7001-pmgr.dtsi b/arch/arm64/boot/dts/apple/t7001-pmgr.dtsi
new file mode 100644
index 000000000000..7321cfdcd189
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t7001-pmgr.dtsi
@@ -0,0 +1,650 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * PMGR Power domains for the Apple T7001 "A8X" SoC
+ *
+ * Copyright (c) 2024, Nick Chan <towinchenmi@gmail.com>
+ */
+
+&pmgr {
+	ps_cpu0: power-controller@20000 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20000 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "cpu0";
+		apple,always-on; /* Core device */
+	};
+
+	ps_cpu1: power-controller@20008 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20008 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "cpu1";
+		apple,always-on; /* Core device */
+	};
+
+	ps_cpu2: power-controller@20010 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20010 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "cpu2";
+		apple,always-on; /* Core device */
+	};
+
+	ps_cpm: power-controller@20040 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20040 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "cpm";
+		apple,always-on; /* Core device */
+	};
+
+	ps_sio_p: power-controller@201f8 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x201f8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "sio_p";
+	};
+
+	ps_lio: power-controller@20100 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20100 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "lio";
+		apple,always-on; /* Core device */
+	};
+
+	ps_iomux: power-controller@20108 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20108 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "iomux";
+		apple,always-on; /* Core device */
+	};
+
+	ps_aic: power-controller@20110 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20110 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "aic";
+		apple,always-on; /* Core device */
+	};
+
+	ps_debug: power-controller@20118 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20118 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "debug";
+	};
+
+	ps_dwi: power-controller@20120 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20120 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "dwi";
+	};
+
+	ps_gpio: power-controller@20128 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20128 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "gpio";
+	};
+
+	ps_mca0: power-controller@20130 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20130 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "mca0";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_mca1: power-controller@20138 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20138 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "mca1";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_mca2: power-controller@20140 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20140 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "mca2";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_mca3: power-controller@20148 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20148 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "mca3";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_mca4: power-controller@20150 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20150 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "mca4";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_pwm0: power-controller@20158 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20158 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pwm0";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_i2c0: power-controller@20160 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20160 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "i2c0";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_i2c1: power-controller@20168 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20168 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "i2c1";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_i2c2: power-controller@20170 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20170 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "i2c2";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_i2c3: power-controller@20178 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20178 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "i2c3";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_spi0: power-controller@20180 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20180 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "spi0";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_spi1: power-controller@20188 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20188 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "spi1";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_spi2: power-controller@20190 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20190 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "spi2";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_spi3: power-controller@20198 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20198 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "spi3";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart0: power-controller@201a0 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x201a0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart0";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart1: power-controller@201a8 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x201a8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart1";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart2: power-controller@201b0 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x201b0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart2";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart3: power-controller@201b8 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x201b8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart3";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart4: power-controller@201c0 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x201c0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart4";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart5: power-controller@201c8 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x201c8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart5";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart6: power-controller@201d0 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x201d0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart6";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart7: power-controller@201d8 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x201d8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart7";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart8: power-controller@201e0 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x201e0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart8";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_aes0: power-controller@201e8 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x201e8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "aes0";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_sio: power-controller@201f0 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x201f0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "sio";
+		power-domains = <&ps_sio_p>;
+		apple,always-on; /* Core device */
+	};
+
+	ps_usb: power-controller@20248 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20248 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "usb";
+	};
+
+	ps_usbctrl: power-controller@20250 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20250 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "usbctrl";
+		power-domains = <&ps_usb>;
+	};
+
+	ps_usb2host0: power-controller@20258 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20258 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "usb2host0";
+		power-domains = <&ps_usbctrl>;
+	};
+
+	ps_usb2host1: power-controller@20268 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20268 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "usb2host1";
+		power-domains = <&ps_usbctrl>;
+	};
+
+	ps_usb2host2: power-controller@20278 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20278 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "usb2host2";
+		power-domains = <&ps_usbctrl>;
+	};
+
+	ps_disp_busmux: power-controller@202a8 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x202a8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "disp_busmux";
+	};
+
+	ps_disp1_busmux: power-controller@202c0 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x202c0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "disp1_busmux";
+	};
+
+	ps_media: power-controller@202d8 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x202d8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "media";
+	};
+
+	ps_isp: power-controller@202d0 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x202d0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "isp";
+	};
+
+	ps_msr: power-controller@202e0 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x202e0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "msr";
+		power-domains = <&ps_media>;
+	};
+
+	ps_jpg: power-controller@202e8 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x202e8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "jpg";
+		power-domains = <&ps_media>;
+	};
+
+	ps_disp0: power-controller@202b0 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x202b0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "disp0";
+		power-domains = <&ps_disp_busmux>;
+	};
+
+	ps_disp1: power-controller@202c8 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x202c8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "disp1";
+		power-domains = <&ps_disp1_busmux>;
+	};
+
+	ps_pcie_ref: power-controller@20220 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20220 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pcie_ref";
+	};
+
+	ps_hsic0_phy: power-controller@20200 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20200 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "hsic0_phy";
+		power-domains = <&ps_usb2host1>;
+	};
+
+	ps_hsic1_phy: power-controller@20208 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20208 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "hsic1_phy";
+		power-domains = <&ps_usb2host2>;
+	};
+
+	ps_ispsens0: power-controller@20210 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20210 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "ispsens0";
+	};
+
+	ps_ispsens1: power-controller@20218 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20218 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "ispsens1";
+	};
+
+	ps_mcc: power-controller@20230 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20230 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "mcc";
+		apple,always-on; /* Memory cache controller */
+	};
+
+	ps_mcu: power-controller@20238 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20238 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "mcu";
+		apple,always-on; /* Core device */
+	};
+
+	ps_amp: power-controller@20240 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20240 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "amp";
+		apple,always-on; /* Core device */
+	};
+
+	ps_usb2host0_ohci: power-controller@20260 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20260 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "usb2host0_ohci";
+		power-domains = <&ps_usb2host0>;
+	};
+
+	ps_usbotg: power-controller@20288 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20288 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "usbotg";
+		power-domains = <&ps_usbctrl>;
+	};
+
+	ps_smx: power-controller@20290 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20290 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "smx";
+		apple,always-on; /* Apple fabric, critical block */
+	};
+
+	ps_sf: power-controller@20298 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20298 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "sf";
+		apple,always-on; /* Apple fabric, critical block */
+	};
+
+	ps_cp: power-controller@202a0 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x202a0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "cp";
+		apple,always-on; /* Core device */
+	};
+
+	ps_dp: power-controller@202b8 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x202b8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "dp";
+		power-domains = <&ps_disp0>;
+	};
+
+	ps_vdec: power-controller@202f0 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x202f0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "vdec";
+		power-domains = <&ps_media>;
+	};
+
+	ps_ans: power-controller@20318 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20318 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "ans";
+	};
+
+	ps_venc: power-controller@20300 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20300 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "venc";
+		power-domains = <&ps_media>;
+	};
+
+	ps_pcie: power-controller@20308 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20308 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pcie";
+	};
+
+	ps_pcie_aux: power-controller@20310 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20310 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pcie_aux";
+	};
+
+	ps_gfx: power-controller@20320 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20320 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "gfx";
+	};
+
+	ps_sep: power-controller@20400 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20400 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "sep";
+		apple,always-on; /* Locked on */
+	};
+
+	ps_venc_pipe: power-controller@21000 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x21000 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "venc_pipe";
+		power-domains = <&ps_venc>;
+	};
+
+	ps_venc_me0: power-controller@21008 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x21008 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "venc_me0";
+		power-domains = <&ps_venc>;
+	};
+
+	ps_venc_me1: power-controller@21010 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x21010 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "venc_me1";
+		power-domains = <&ps_venc>;
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/t7001.dtsi b/arch/arm64/boot/dts/apple/t7001.dtsi
index a76e034c85e3..c471f57cca0e 100644
--- a/arch/arm64/boot/dts/apple/t7001.dtsi
+++ b/arch/arm64/boot/dts/apple/t7001.dtsi
@@ -72,9 +72,18 @@ serial0: serial@20a0c0000 {
 			/* Use the bootloader-enabled clocks for now. */
 			clocks = <&clkref>, <&clkref>;
 			clock-names = "uart", "clk_uart_baud0";
+			power-domains = <&ps_uart0>;
 			status = "disabled";
 		};
 
+		pmgr: power-management@20e000000 {
+			compatible = "apple,t7000-pmgr", "apple,pmgr", "syscon", "simple-mfd";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			reg = <0x2 0xe000000 0 0x24000>;
+		};
+
 		wdt: watchdog@20e027000 {
 			compatible = "apple,t7000-wdt", "apple,wdt";
 			reg = <0x2 0x0e027000 0x0 0x1000>;
@@ -88,11 +97,13 @@ aic: interrupt-controller@20e100000 {
 			reg = <0x2 0x0e100000 0x0 0x100000>;
 			#interrupt-cells = <3>;
 			interrupt-controller;
+			power-domains = <&ps_aic>;
 		};
 
 		pinctrl: pinctrl@20e300000 {
 			compatible = "apple,t7000-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x0e300000 0x0 0x100000>;
+			power-domains = <&ps_gpio>;
 
 			gpio-controller;
 			#gpio-cells = <2>;
@@ -121,3 +132,5 @@ timer {
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
 };
+
+#include "t7001-pmgr.dtsi"
-- 
2.47.1


