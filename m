Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06620CA1010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 18:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rgEmhMGkA/7C6rJUz3eu6sKsMgEBOX6IsF8XiLjkFes=; b=OQLB0SOKWjZ2/1Ut98uuA5eKHc
	dzJVc54OT14rfhluXB27YxHM4wEIWFxcQdGx4GofWZfbYjhZDZaaVwKzofEZsiQ4YqLKgroapclVB
	VdEBr773M1db/ikgv2jChVRxzChx5XW7W0erd7zYBsj7altDogSaargU/mhyfuOF2Nv6MfGnzFMTH
	JkxNrw6S61Pk7+qifZqK6i5stsH5wwp4bfPP8FDN/B4ConZtTBFUK7rIf12N/sX5NvZ561GfQMYJd
	EfwnhHEjX/5jV0GHIPoS74hd9TKaaXG4FX75nGhdxbcjmM4Lmz31KHUgIcS1cooniN84wKRMEQqoL
	BARQIchg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uubIo-00000003qRL-3bxI;
	Fri, 05 Sep 2025 18:36:50 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuV5j-00000001Wx8-3iTx;
	Fri, 05 Sep 2025 11:58:57 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-32b02d88d80so1811661a91.0;
        Fri, 05 Sep 2025 04:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757073535; x=1757678335; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rgEmhMGkA/7C6rJUz3eu6sKsMgEBOX6IsF8XiLjkFes=;
        b=aYi4OFtoHsQLtlzxjWkB6Tu/4JOCu+Sw/PhgiSgbxXDO9Lry7iWWVm1rz3wa5jXewn
         4czTNllfKgF/9k9wf8/Ki6r6ekv12ZNyMtjLUcg/T4kiiJr9UxIQNlFlUe90VaUIuQHx
         ae4oSCfLXqUNnJ+nTvIDeGGFm6lNtEbg3W3qCUT6yrWVopVPBbkLYDQK/BFkO41HVVJ1
         6Ohv7EXBHy7DluX0j2T2L0VLwsZUPoz0oImwY4MjaDm1RglOnfh2tvfGMRNxloD49uGM
         I31Br527lbNlWKxbAhbb7L+xsgfeP3sNcxtoc4A5nCTGZ/fHOBocc4VY3EK1lD3zQuJL
         1RfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757073535; x=1757678335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rgEmhMGkA/7C6rJUz3eu6sKsMgEBOX6IsF8XiLjkFes=;
        b=E32iI0b5RfIX+zkvpnu+Z0c9XhkJta95xkTHWFKptuhlqcf2/k+ZlqwK5GjplLPB8e
         4gMZdOf0VNwMCPzhDESuiYsL1T/lxDGdduQmXxPzfmBHlxmX9by13z1Yn00pMXGJuibS
         asg+VEZpqMQceuzVIYd9glWQ0SYsT31lHx4KGWiFj3EXKJLp7jMUqMJ5t4o0X5Uuy/wt
         AXuUg9UidHSYq4cMCthMzfi/FgkFWIWwIQMTkC9+JnLacCX5xUyWWLQO1HmhJzJioPo7
         eyhN60E61YS/QJlBp8IRCzyzsNhPhQrL7fbflGCsW4Ybe1SHvBa+TQx2EoYzdRWlZFS1
         Bi9g==
X-Forwarded-Encrypted: i=1; AJvYcCVGk/qKICjJT5j07f5aGz7soxs5rk5VG0jyeQaxPSJow3VVbGIX9V+hs8iIfqwUfwtDHtuRfscIjbg4gxnpYl1Mcw==@lists.infradead.org, AJvYcCVqCKLUoPbTDUbRI6XyvTCJbJIgMYFrtFD9OtGnys856ZX+sesdIAEuBVvzkLjB73ygbUX3sYReKW3TU5KQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yyhb3fiji8pU8gpJv7/56duee1wcIfNzc2uCgkpOBTtaatauD4Z
	wsfbtWImicLPxDZ3Ldn+cYobnDmF2bFj4W4MsMCoVQLcO/PhVHb15uHs
X-Gm-Gg: ASbGncuzerF5si5POkpT1Z2Zp3BQrsyoIKAl9dqIhvLjV+4zKEvsyCMAXupMzMqMUCx
	b5amUwtq1XeB57YtwpnPEeLQ4FuWhj6FZR/C0aVYxiLFqVdMJofJGuErBy1L0rnE7EmDHwxzIbY
	tVwbKeYwWy/WIOWo45/i710F+R0uX4U71R2dI4X/jLvdKBP9FXmdkxj+FKhAepE43Luu80C5/iI
	Z8gZ8XY7nBlpkuBwWWw9YPVKdIJya8AXClZTspi3yoP77nYkIHiil44/U3dS6xFhHUxsqftFhwE
	NhU5x6xq5f7avOidYuNp9H3gkixL/mBiqjQEp67vkr58VS/pgWHKR6vBtiZJa7nJhWQ1Gq1fW5+
	OEdK2SfY2of7DpkJC0yJF/CjHZ9LqiwA=
X-Google-Smtp-Source: AGHT+IHvSCvKNcr+1RiDaOoEYTS3Fy1NmwNtqF7b9X0oKCKnUTrgEvbzTuDDOwMkAwbrhYYeFjqG/Q==
X-Received: by 2002:a17:90b:5305:b0:32b:a32b:a163 with SMTP id 98e67ed59e1d1-32ba32ba476mr5438345a91.36.1757073535045;
        Fri, 05 Sep 2025 04:58:55 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.216])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-772396d2b97sm19633049b3a.67.2025.09.05.04.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 04:58:54 -0700 (PDT)
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
Subject: [PATCH v3 01/11] arm64: dts: amlogic: Add cache information to the Amlogic GXBB and GXL SoC
Date: Fri,  5 Sep 2025 17:27:32 +0530
Message-ID: <20250905115836.7549-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250905115836.7549-1-linux.amoon@gmail.com>
References: <20250905115836.7549-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_045855_922754_C33EA1D0 
X-CRM114-Status: GOOD (  10.23  )
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

As per S905 and S905X datasheet add missing cache information to
the Amlogic GXBB and GXL SoC.

- Each Cortex-A53 core has 32KB of L1 instruction cache available and
	32KB of L1 data cache available.
- Along with 512KB Unified L2 cache.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi | 27 +++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index 7d99ca44e660c..c1d8e81d95cb9 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -95,6 +95,12 @@ cpu0: cpu@0 {
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
 			clocks = <&scpi_dvfs 0>;
 			#cooling-cells = <2>;
@@ -105,6 +111,12 @@ cpu1: cpu@1 {
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
 			#cooling-cells = <2>;
@@ -115,6 +127,12 @@ cpu2: cpu@2 {
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
 			#cooling-cells = <2>;
@@ -125,6 +143,12 @@ cpu3: cpu@3 {
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
 			#cooling-cells = <2>;
@@ -134,6 +158,9 @@ l2: l2-cache0 {
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


