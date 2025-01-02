Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A3A1E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 21:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CCu8j5qgaYDYPnaPdDgFFNsAqlm/hMgJljoqnUl2UNc=; b=I9GroLspP3tTqsXiVs92K/AmsA
	yYKWsU6JBmz8XahwzMqS5EVKT2VHe5qJ0iCVT0u6KLChvyQwvg0d3W4DADtvKMYKcNerczH7zzPtE
	j0qR5hVNihZ2oGCgvVj16d9PejxKdklguDgRE3mz+/iL7hVL0pzn4ua/7YdGJ3mjcXsskYoXQUUYj
	JL7w3T8rN5ZEYw3/9MBNb5cTw8dPlFIJr7ol8Whhc33G6mQRO7SX/BHWFajTQzUng8UmKgI6d9sNp
	dhSgDGeT/Ph7V863MtFakV6f6DlDYJSoLJQZt7aerC4eGPLr5atdE9e1tNmRQDjCcrMrf+87ZIMPr
	i309DELQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTSL9-0000000BSXP-0If1;
	Thu, 02 Jan 2025 21:02:47 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTSHY-0000000BRpa-2DCm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 20:59:05 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5d3f28881d6so16931060a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jan 2025 12:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735851543; x=1736456343; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CCu8j5qgaYDYPnaPdDgFFNsAqlm/hMgJljoqnUl2UNc=;
        b=VGWxVsQqirT0euHX29q3j0yyvXWLqSJtTlLDBDj/SlX7PsEhKbaSsHAiWyyeAss0oY
         tWTdruFA7wDjh0x53Bt0/xECHiysiflSSwOKC6az2/35MUhojMEHE68rrA2WHQrPC+Gg
         ry1sweBRoflJp0xtLOKQyLybf7nBpaFg0BrrggnP7I677JZlO/mYtxvJI5jFNU+BiW5p
         DPzDFIR+Rhv9zCymFtlQBG+ipWr/kQkUuu5DDbRj9CXbmaGN+mGqO861YdnOjV47xVfO
         h3oZj3t2BQDD5szWK1aDC7CF7n0n6M7E2adJZNqhbsTjS3BKuiyQUw6bP8Rg/Sp2ncqR
         m8oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735851543; x=1736456343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CCu8j5qgaYDYPnaPdDgFFNsAqlm/hMgJljoqnUl2UNc=;
        b=biVval6Q1SNWfcuuUr6+LK3Q/qngLOOWeKQlhDsSMtDkl2JwKYYRnX73qOU598e2VE
         xDTZ04cioT7xLtDZV4DqDu8jyOsmu+Dwk649w6/VjpOMqGyO3tKeXwkqk6K8Tsqs4Mge
         cjApA8NqzQvB2RtIAIpbGHGsA8gI2DiE4yEUvGI9b/LbMTT8hhFVrucAXdGUrvVUJAY/
         47e4UnU3f/JhExxY2nCtMr/dygSXM76Jz/24DiNNrBWaCI/3E4T3yLO03JOaQ/3XiGOb
         aYioHIx/YLC3AbAlwsTbsL9imncCbs1I+I3aHJjkJncG1FsxaNQIxBqnl2y5UnWpAc50
         4b/g==
X-Forwarded-Encrypted: i=1; AJvYcCVziSmIVrPya0U7uGVk9/tPGQGq/0tp/3MBlnQxz3wOJGYGFeFLoW8s1IABuPb/ec7f0xkHuTJgCXNN0ByLqwKc@lists.infradead.org
X-Gm-Message-State: AOJu0YzWhJnhhi1ZzPvd2oezmOxLHAwLUZYw5Jz76YQZElX02qs7SVU0
	tvr9IM3Dy8Us8mh4/f+ZhHJCUp0UqRvvcDkSAVWtUmbHECLCXlhxhHZqgA==
X-Gm-Gg: ASbGncvIxzzsXxiL9cvCP7V9LaaULxjQ0wfo0e31oV9KdCZVzR+aRWiOjeaIBm80+Yo
	FpR2KFpldm0q5iJ8dRfBqxIQEvBFpSzGtbkpS82Dn2Lfwx1mVHumgHQf7UjGIYBc40c2hmWfs9/
	wkYdeo107LXcmt6E9LxV1r9fc6a2vy4ceVQZzJst1Oz5b2EpqOm9+KOkZgHfpV/wP/a6IvDpCGQ
	kRVHGnP3na3lnECkPGxELZ/M2oaYgxgyOYbtbl4xIAZfhpFbn2+DWLCUG6ibGFfoDHm1pss04MR
	ph6D7wmC8IA=
X-Google-Smtp-Source: AGHT+IFzm80w4v7MGq7RShD43UwRC9a0uGe878X9IA/tQscJ5YnfdRRUF6GIlk32S2NPBCyvya6QAQ==
X-Received: by 2002:a05:6402:540b:b0:5d6:48ef:c19f with SMTP id 4fb4d7f45d1cf-5d81de1c28fmr111938896a12.29.1735851542509;
        Thu, 02 Jan 2025 12:59:02 -0800 (PST)
Received: from ivaylo-T580.. (85-118-76-61.mtel.net. [85.118.76.61])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80676f397sm19231026a12.22.2025.01.02.12.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 12:59:02 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Jaehoon Chung <jh80.chung@samsung.com>
Cc: linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/5] arm64: dts: exynos8895: add syscon nodes for peric0/1 and fsys0/1
Date: Thu,  2 Jan 2025 22:58:43 +0200
Message-ID: <20250102205846.223955-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250102205846.223955-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250102205846.223955-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_125904_560984_9DFDAAC4 
X-CRM114-Status: GOOD (  10.82  )
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

Add syscon nodes for peric0/1, typically used for USI, and fsys0/1,
typically used for PCI.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 arch/arm64/boot/dts/exynos/exynos8895.dtsi | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos8895.dtsi b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
index 4fb9be850..5302a8c1b 100644
--- a/arch/arm64/boot/dts/exynos/exynos8895.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
@@ -228,6 +228,12 @@ cmu_peric0: clock-controller@10400000 {
 				      "usi1", "usi2", "usi3";
 		};
 
+		syscon_peric0: syscon@10420000 {
+			compatible = "samsung,exynos8895-peric0-sysreg", "syscon";
+			reg = <0x10420000 0x2000>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_SYSREG_PERIC0_PCLK>;
+		};
+
 		serial_0: serial@10430000 {
 			compatible = "samsung,exynos8895-uart";
 			reg = <0x10430000 0x100>;
@@ -273,6 +279,12 @@ cmu_peric1: clock-controller@10800000 {
 				      "usi10", "usi11", "usi12", "usi13";
 		};
 
+		syscon_peric1: syscon@10820000 {
+			compatible = "samsung,exynos8895-peric1-sysreg", "syscon";
+			reg = <0x10820000 0x2000>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_SYSREG_PERIC1_PCLK>;
+		};
+
 		serial_1: serial@10830000 {
 			compatible = "samsung,exynos8895-uart";
 			reg = <0x10830000 0x100>;
@@ -380,6 +392,12 @@ cmu_fsys0: clock-controller@11000000 {
 				      "ufs", "usbdrd30";
 		};
 
+		syscon_fsys0: syscon@11020000 {
+			compatible = "samsung,exynos8895-fsys0-sysreg", "syscon";
+			reg = <0x11020000 0x2000>;
+			clocks = <&cmu_fsys0 CLK_GOUT_FSYS0_SYSREG_FSYS0_PCLK>;
+		};
+
 		pinctrl_fsys0: pinctrl@11050000 {
 			compatible = "samsung,exynos8895-pinctrl";
 			reg = <0x11050000 0x1000>;
@@ -398,6 +416,12 @@ cmu_fsys1: clock-controller@11400000 {
 			clock-names = "oscclk", "bus", "pcie", "ufs", "mmc";
 		};
 
+		syscon_fsys1: syscon@11420000 {
+			compatible = "samsung,exynos8895-fsys1-sysreg", "syscon";
+			reg = <0x11420000 0x2000>;
+			clocks = <&cmu_fsys1 CLK_GOUT_FSYS1_SYSREG_FSYS1_PCLK>;
+		};
+
 		pinctrl_fsys1: pinctrl@11430000 {
 			compatible = "samsung,exynos8895-pinctrl";
 			reg = <0x11430000 0x1000>;
-- 
2.43.0


