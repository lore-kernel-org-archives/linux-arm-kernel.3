Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B8B1C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 12:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YJUClOvadSj6QX58oHurrlBpkJQ7IYPBO0FnNkQK6nA=; b=VgdQwMdjh1jTOi8ZbtKinujUeZ
	54TO/qra507dl33iayWxYFih5GCqSd82pOxta0g6VFhztGVlluy7OqvMpFCOUxJWc8J1Y2E/iGv9o
	DtmxmCo7Tim/Nqi/FLsj7RLia4ubTnsuMiN+m5tgM1LSS1oVxHcdTgAVCP6oFqKa4T6TFblg2mFTv
	UTI98xMvM8Hq4C0a9xqit369wMAriUJFriPh80UYmTpU6LvqubRbY6VOuRouf0FGRBg/Qe6wXborj
	8dHzkttx6Jd4/BGlvKm9JS2IjucWhw4WJ0USvzL59i+SAe6bzShFIOFwVdLFMuRqIPVzdvqAS/5Qo
	PpZ9Jd8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tew2r-0000000FS6v-23Bz;
	Mon, 03 Feb 2025 12:59:21 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tevsj-0000000FPhf-3789
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 12:48:54 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-21636268e43so95283895ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 04:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738586933; x=1739191733; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJUClOvadSj6QX58oHurrlBpkJQ7IYPBO0FnNkQK6nA=;
        b=kImjar73HGYCqaiCe1zQ8iMuaP9MvSW/Zoptgzm+pj5zUq4j6/7vYc9O4bw18t44Na
         ZUfi6EP0jmBo6NTobuJ+RQ4ejlB9urFnwrYuVx78c8IJH1a2a0mxx7HYPzRawraMI05z
         RWefdC3yjTBDusd6khUtDq5lpBcqSpMS+trTdI2oOjVGIPfYcVTpON01kkoabWtetSpY
         ZI+0zzZB2/NgbmivIz+xYtAq1BvfKNttzjIlYAo1gujsQ7eTZy+OtNY5F/+iPPT8ZjGF
         /Iwy8Ufef+EgKrjkaqqd1nIbJwwtEols19ygrH8eTOMqYT4hd2GpbKsF0hXxg0IcsDLi
         uEbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738586933; x=1739191733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YJUClOvadSj6QX58oHurrlBpkJQ7IYPBO0FnNkQK6nA=;
        b=fDWQiWww1gS/kU02f+BaidpnxGqsA8KcqowWsaSBatYqk+ERLXKQOq8Q7eMGRaELmf
         CngwBqIPlLbR2RxmgwmKWPEgDgPnHQwmzi3Eq7C6LEimeX7lRvBmn8m9HnCcpxKNDhca
         BrH6i3O7pgCCy1FNIP1a6Mrx/pK5A2VUrM5qFteOY0j7jz82J3xVjSgr/dPWl47nC4fQ
         F07cBxbUDUgDFdHWQx+iy6G1lKGKYrTwm+Lxh8nGjcBNI+OfRCDBiKKtUzqTPp4tFkgj
         FwjJbNSB83lNgGWZ+3YbKr+Sb3pqVS2uzFBFeQ6ut8g7ZhV0ktLNw4Z0ejqekIdDi0/D
         FFdQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5285sRIK6PwIBGQBtlUVfswBIjCIuyDaS4E8++Zxye58EWP7Fh2ZvdFt+Ex0zakfuiu50gJhbHdm+ooLqj6nM@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7Th/9J5OhPxFX78aY080mKmYKNNbfXcFQTZdpnFAIbnJ0JPnu
	MhNTSub3eEqVBFr4mYomlPVrJyRFKZEqGBnVKLW0sqBYDxVpepGZurg5JG5g
X-Gm-Gg: ASbGncvs2HxXlVo+pn98aRYKDLADKDWz8tuIQgLLBn8d8+Dwl4cJ88uNrrBT8vcINCY
	eQhNwhQw03adVakZJKnhz1pejY/NNmHkah852HEVABWtQ5er980HchDbrhTDH/2nX5eqp8cG/id
	hrQgj/ThJ4r3QNer8K+N1umVekImlQLvWaTaK7iHJNvjSWqdHheghTbXkESTLbs/SEK0PK2mRfb
	TR75I2SA5UIE9D2IYNqDoiXyTk5QtoamtNz6cW8GWYVObld4afD+Wa7fFvky+XUnVF+R5Svvdq1
	Idpw86gDEH0HJ5BP
X-Google-Smtp-Source: AGHT+IHLS6dbll/fZOAVWOMkLyYlVa8KGHl3l8e4OXqDcFOAKzegus2Ld1uPVya/4zL+Xr1xYMnk0g==
X-Received: by 2002:a05:6a21:6d88:b0:1e1:ac4f:d322 with SMTP id adf61e73a8af0-1ed7a5f947dmr39422757637.14.1738586933175;
        Mon, 03 Feb 2025 04:48:53 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-acebddbb0d4sm7835225a12.10.2025.02.03.04.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:48:52 -0800 (PST)
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
Subject: [PATCH RESEND 7/9] arm64: dts: apple: t8011: Add cpufreq nodes
Date: Mon,  3 Feb 2025 20:43:46 +0800
Message-ID: <20250203124747.41541-8-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203124747.41541-1-towinchenmi@gmail.com>
References: <20250203124747.41541-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_044853_777930_6DC131E3 
X-CRM114-Status: GOOD (  12.54  )
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

Add cpufreq nodes for Apple A10 SoC. There is a transparent hardware
big.LITTLE switcher in this SoC. Spoof E-core p-state frequencies such
that CPU capacity does not appear to change when switching between core
types.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8011.dtsi | 79 ++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8011.dtsi b/arch/arm64/boot/dts/apple/t8011.dtsi
index 6c4ed9dc4a50..3a3d5b615a6a 100644
--- a/arch/arm64/boot/dts/apple/t8011.dtsi
+++ b/arch/arm64/boot/dts/apple/t8011.dtsi
@@ -32,6 +32,8 @@ cpu0: cpu@0 {
 			compatible = "apple,hurricane-zephyr";
 			reg = <0x0 0x0>;
 			cpu-release-addr = <0 0>; /* To be filled by loader */
+			operating-points-v2 = <&fusion_opp>;
+			performance-domains = <&cpufreq>;
 			enable-method = "spin-table";
 			device_type = "cpu";
 		};
@@ -40,6 +42,8 @@ cpu1: cpu@1 {
 			compatible = "apple,hurricane-zephyr";
 			reg = <0x0 0x1>;
 			cpu-release-addr = <0 0>; /* To be filled by loader */
+			operating-points-v2 = <&fusion_opp>;
+			performance-domains = <&cpufreq>;
 			enable-method = "spin-table";
 			device_type = "cpu";
 		};
@@ -48,11 +52,80 @@ cpu2: cpu@2 {
 			compatible = "apple,hurricane-zephyr";
 			reg = <0x0 0x2>;
 			cpu-release-addr = <0 0>; /* To be filled by loader */
+			operating-points-v2 = <&fusion_opp>;
+			performance-domains = <&cpufreq>;
 			enable-method = "spin-table";
 			device_type = "cpu";
 		};
 	};
 
+	fusion_opp: opp-table {
+		compatible = "operating-points-v2";
+
+		/*
+		 * Apple Fusion Architecture: Hardwired big.LITTLE switcher
+		 * that use p-state transitions to switch between cores.
+		 *
+		 * The E-core frequencies are adjusted so performance scales
+		 * linearly with reported clock speed.
+		 */
+
+		opp01 {
+			opp-hz = /bits/ 64 <172000000>; /* 300 MHz, E-core */
+			opp-level = <1>;
+			clock-latency-ns = <12000>;
+		};
+		opp02 {
+			opp-hz = /bits/ 64 <230000000>; /* 396 MHz, E-core */
+			opp-level = <2>;
+			clock-latency-ns = <135000>;
+		};
+		opp03 {
+			opp-hz = /bits/ 64 <448000000>; /* 768 MHz, E-core */
+			opp-level = <3>;
+			clock-latency-ns = <105000>;
+		};
+		opp04 {
+			opp-hz = /bits/ 64 <662000000>; /* 1152 MHz, E-core */
+			opp-level = <4>;
+			clock-latency-ns = <115000>;
+		};
+		opp05 {
+			opp-hz = /bits/ 64 <804000000>;
+			opp-level = <5>;
+			clock-latency-ns = <122000>;
+		};
+		opp06 {
+			opp-hz = /bits/ 64 <1140000000>;
+			opp-level = <6>;
+			clock-latency-ns = <120000>;
+		};
+		opp07 {
+			opp-hz = /bits/ 64 <1548000000>;
+			opp-level = <7>;
+			clock-latency-ns = <125000>;
+		};
+		opp08 {
+			opp-hz = /bits/ 64 <1956000000>;
+			opp-level = <8>;
+			clock-latency-ns = <135000>;
+		};
+		opp09 {
+			opp-hz = /bits/ 64 <2316000000>;
+			opp-level = <9>;
+			clock-latency-ns = <140000>;
+		};
+#if 0
+		/* Not available until CPU deep sleep is implemented */
+		opp10 {
+			opp-hz = /bits/ 64 <2400000000>;
+			opp-level = <10>;
+			clock-latency-ns = <140000>;
+			turbo-mode;
+		};
+#endif
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -60,6 +133,12 @@ soc {
 		nonposted-mmio;
 		ranges;
 
+		cpufreq: performance-controller@202f20000 {
+			compatible = "apple,t8010-cluster-cpufreq", "apple,t8103-cluster-cpufreq", "apple,cluster-cpufreq";
+			reg = <0x2 0x02f20000 0 0x1000>;
+			#performance-domain-cells = <0>;
+		};
+
 		serial0: serial@20a0c0000 {
 			compatible = "apple,s5l-uart";
 			reg = <0x2 0x0a0c0000 0x0 0x4000>;
-- 
2.48.1


