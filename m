Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 116CBE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Dec 2024 17:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rtAevhAcl5mLOcbysjZVxoXh3giA/+VpnoU+zggYcjc=; b=1KE5+e4GHSuhBKwHumakUyRCFw
	ZvLEOoDD3KftPjTWkHk8WLJHck2RDQDidbLIC09wPs7s55w5az2XzY5KgLMsmyHCWnbIatuTw84XU
	2upePXMUGe3HB2qj9OBRwZTouT+4e6vWifvRFRY6TKp/wW0Ym3NopyiENkVWqnmTIxzqFRkvwgMi/
	s9MjJ+y23xzJbmf+BDoaLV4JX09edGHdGXks4OGem2Nv+5iAEQU8t0YMB0WYppc757TLLVK0tAbwH
	LzAzHJHh9b4MyEHAecHdFfBKI1kbVIf5ceJ/QXnR2n4izelbkO9IogvCx67Hl84mERFI8xHcNw2i+
	2usSu6Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPQAf-00000008e7W-1s1Z;
	Sun, 22 Dec 2024 17:55:17 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPQ8z-00000008dkx-2CBI
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Dec 2024 17:53:34 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2ef6c56032eso2280687a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Dec 2024 09:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734890012; x=1735494812; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rtAevhAcl5mLOcbysjZVxoXh3giA/+VpnoU+zggYcjc=;
        b=VPnLTfqmrUf7L9tL2e+sXjE3wD5cL2SW4mUarGtRCm82l5DHJSLVlLht5rhFvtberi
         kHMki/gX1HY28NaP2yIr+bsUC6zbE/zNkh5PDY+NTX3VwbRG3ossZ0MCEHeH4mb7/qoJ
         wyrkqFRJuWdoR7zCmduNn5xkOSOqc/vMK18WKcabp8WNBtiffxePXqip2LiNqFKKRGag
         7TDCqXj7HPWHDK2dqOHVR/KynixpuobNopVCxrDT23STxHesbEiiS81Wr6T16elq7yTQ
         i6rmx4zKfmBWl2tEaqZ/IIR7Jao6bVGOcZU2GD2Bpt7zGuhbSkW+jFD/+O3fzsOrOXt5
         fp4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734890012; x=1735494812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rtAevhAcl5mLOcbysjZVxoXh3giA/+VpnoU+zggYcjc=;
        b=E7qKJsaRaTFf7p0gR8HIgECm5skoDdTfzTPpfwmvMbO/wZ6zQvaKuJXsbh05vOfTyU
         WcTkJQvmcheeYlnIoVaXC0HLtJqb2m/6Q8sET7HX4l/hHZ/4XKvl1BQIdJvDNjtauzEj
         /enLvl0nuUslfcL+HZNJMdopACt4vtcQmpJ18phJss8BySO+NmhgSY+muXuTh0UQfw2q
         /v6LwpU2ULWuKRKv3CiTWELQyfimyq6i6W+ykpVXtov2S4iQM5CMgdBxYLFkPgAcjFQ1
         5fgb9egJMfXUPzMhl1KpsbJhPWgNcAOUtMXjJ2HuWrN6M661YgH8bE25243QtxcFFWp3
         JZ9w==
X-Forwarded-Encrypted: i=1; AJvYcCWGlrinSe6UaurdKWZ4X7UG0Hqnkiw7eswDBIM91TxioVIgK5e6fnwJJwXcfjhYyYmJgJhOnFkzrixTLpqPBAka@lists.infradead.org
X-Gm-Message-State: AOJu0Yxv0G9EMUp2fTFeKZAqRZ+a+i4DOCFI9W7G5m4v6RgcBxp7NDhW
	sih0bd94k1Fdf0bs8lCW6Bdloq6mIAnXW7zgeoJauf8X7nh2uIP2PkcFJgwT
X-Gm-Gg: ASbGncug1jhdD2su10HuvP0fTTGFGce3omupA9oIIp98qmu/yjRnim18c+0pkCIM68i
	j8iEhNDkXxvvwFN/bF5QxvDs6ku78dw7JhJUg7O49eMqKjES+/EddNTpgAWMAqALUFJdfUrpgWe
	2E5/eNGRelxZy8JrtS2Z5OAhmDFksAlr8PJN0CWoakqCxbxnqp/zui0MkvWcgjSBE6TTq7CnznV
	BjjuCYD9JbeTSve98102pgY1Uaca54oRJhvYA8XEgbU02/Mh+4RL25PZw==
X-Google-Smtp-Source: AGHT+IF2KoPvt/ETH1hPxEDJoTm61CI8csX/SPatjjjJtYa8dbIbPi5ngLMR/RAK693YnfRC+n3frg==
X-Received: by 2002:a17:90b:548e:b0:2ee:741c:e9f4 with SMTP id 98e67ed59e1d1-2f452e220c3mr14926747a91.11.1734890012557;
        Sun, 22 Dec 2024 09:53:32 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-219dca04c33sm59503685ad.247.2024.12.22.09.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 09:53:32 -0800 (PST)
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
Subject: [PATCH 2/9] arm64: dts: apple: t7000: Add cpufreq nodes
Date: Mon, 23 Dec 2024 01:52:02 +0800
Message-ID: <20241222175314.151437-3-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241222175314.151437-1-towinchenmi@gmail.com>
References: <20241222175314.151437-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_095333_565343_2C31F765 
X-CRM114-Status: GOOD (  11.78  )
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

Add cpufreq nodes for Apple A8 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t7000-6.dtsi     |  4 ++
 arch/arm64/boot/dts/apple/t7000-j42d.dts   |  4 ++
 arch/arm64/boot/dts/apple/t7000-mini4.dtsi |  4 ++
 arch/arm64/boot/dts/apple/t7000.dtsi       | 46 ++++++++++++++++++++++
 4 files changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t7000-6.dtsi b/arch/arm64/boot/dts/apple/t7000-6.dtsi
index f60ea4a4a387..0d08e2589449 100644
--- a/arch/arm64/boot/dts/apple/t7000-6.dtsi
+++ b/arch/arm64/boot/dts/apple/t7000-6.dtsi
@@ -48,3 +48,7 @@ switch-mute {
 		};
 	};
 };
+
+&typhoon_opp06 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/apple/t7000-j42d.dts b/arch/arm64/boot/dts/apple/t7000-j42d.dts
index 2231db6a739d..24fe5a99f3ab 100644
--- a/arch/arm64/boot/dts/apple/t7000-j42d.dts
+++ b/arch/arm64/boot/dts/apple/t7000-j42d.dts
@@ -29,3 +29,7 @@ framebuffer0: framebuffer@0 {
 &serial6 {
 	status = "okay";
 };
+
+&typhoon_opp06 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/apple/t7000-mini4.dtsi b/arch/arm64/boot/dts/apple/t7000-mini4.dtsi
index c64ddc402fda..773c69449902 100644
--- a/arch/arm64/boot/dts/apple/t7000-mini4.dtsi
+++ b/arch/arm64/boot/dts/apple/t7000-mini4.dtsi
@@ -49,3 +49,7 @@ switch-mute {
 		};
 	};
 };
+
+&typhoon_opp06 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/apple/t7000.dtsi b/arch/arm64/boot/dts/apple/t7000.dtsi
index a7cc29e84c84..4105cf70391b 100644
--- a/arch/arm64/boot/dts/apple/t7000.dtsi
+++ b/arch/arm64/boot/dts/apple/t7000.dtsi
@@ -33,6 +33,8 @@ cpu0: cpu@0 {
 			compatible = "apple,typhoon";
 			reg = <0x0 0x0>;
 			cpu-release-addr = <0 0>; /* To be filled in by loader */
+			performance-domains = <&cpufreq>;
+			operating-points-v2 = <&typhoon_opp>;
 			enable-method = "spin-table";
 			device_type = "cpu";
 		};
@@ -41,11 +43,49 @@ cpu1: cpu@1 {
 			compatible = "apple,typhoon";
 			reg = <0x0 0x1>;
 			cpu-release-addr = <0 0>; /* To be filled in by loader */
+			performance-domains = <&cpufreq>;
+			operating-points-v2 = <&typhoon_opp>;
 			enable-method = "spin-table";
 			device_type = "cpu";
 		};
 	};
 
+	typhoon_opp: opp-table {
+		compatible = "operating-points-v2";
+
+		opp01 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-level = <1>;
+			clock-latency-ns = <300>;
+		};
+		opp02 {
+			opp-hz = /bits/ 64 <396000000>;
+			opp-level = <2>;
+			clock-latency-ns = <50000>;
+		};
+		opp03 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-level = <3>;
+			clock-latency-ns = <29000>;
+		};
+		opp04 {
+			opp-hz = /bits/ 64 <840000000>;
+			opp-level = <4>;
+			clock-latency-ns = <29000>;
+		};
+		opp05 {
+			opp-hz = /bits/ 64 <1128000000>;
+			opp-level = <5>;
+			clock-latency-ns = <36000>;
+		};
+		typhoon_opp06: opp06 {
+			opp-hz = /bits/ 64 <1392000000>;
+			opp-level = <6>;
+			clock-latency-ns = <42000>;
+			status = "disabled"; /* Not available on N102 */
+		};
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -53,6 +93,12 @@ soc {
 		nonposted-mmio;
 		ranges;
 
+		cpufreq: performance-controller@202220000 {
+			compatible = "apple,t7000-cluster-cpufreq", "apple,s5l8960x-cluster-cpufreq";
+			reg = <0x2 0x02220000 0 0x1000>;
+			#performance-domain-cells = <0>;
+		};
+
 		serial0: serial@20a0c0000 {
 			compatible = "apple,s5l-uart";
 			reg = <0x2 0x0a0c0000 0x0 0x4000>;
-- 
2.47.1


