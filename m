Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1194AC02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 12:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OxMhVB4BuFZ5ApySWrQAxUEWGEe0HLRSWM8qzETXyfg=; b=H2f8VI+d0kg7aH67wvVK5JCP0y
	o+zAn+0HDCTic83KASWFFwKTbuR585pHmediYuDBAtnR5efUmPygU0nWT1PEslWCAL1EMrkYQqaSh
	5afi5htFhniuHOO/DIclhTb5MMcEEAmwcwQXxacr5wVr5gnzok9seKAX4DQNs2qztFDtmzKZR3XSd
	o5K8+seCm0P8g2BtQtDRl0bxEGkKroubo8LnNc3FP/2GgTwwSrbGHZc8KyvdH2gSfV/0DaAPxt1Lm
	uoSnjM5ihVn9nibUFMvETQUoS32Xi8XAX1qszwe9cs+IFASHqhD6KktZ2EjH/+A4BHw/DfkNFyJFD
	7p11OvCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tevwN-0000000FQr9-0oGK;
	Mon, 03 Feb 2025 12:52:39 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tevsW-0000000FPd1-0VD9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 12:48:41 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-21619108a6bso70894885ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 04:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738586919; x=1739191719; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OxMhVB4BuFZ5ApySWrQAxUEWGEe0HLRSWM8qzETXyfg=;
        b=NWHwK7KZeyX8MLXuF0oh2EVVDX9jH0P4MoEekpD9kj64fyxvzk/OCZcc2K6oDmUR8r
         iX+4pcYgSQxFAC/XZMX2WhkfmuJvxsxmWCCD2z+b0mlkMaEbLkHmtnD7Eq+DQiR56H1L
         uy1x7pzFH4AILA4K9xWpg5phpDVSz47xD40zpjRc2ApfTGrjk6F6gGQJXgvW7oDVVLxs
         uT8DO9oHg8zZS11ufarxhN7Ai7zSHWsCcbKNtUyy8cjgRoQjrwIlmKFAYr2MD9w+t3+M
         T0ikX2kwv/mdpnumnJjRl2FysBoFJAhEXSmjkOGMBnZO7yLRqATvcHBGH9L2+JQLFWCg
         hnQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738586919; x=1739191719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OxMhVB4BuFZ5ApySWrQAxUEWGEe0HLRSWM8qzETXyfg=;
        b=IznpbVT1f7ibR00AnhaSihUTs5dpc2iyFJxqWTKCLA/MAnR0vfA7XVzV0IbvdMhOSE
         oAscxaMY2CuKcP/1CFaVnqPgtFWCCbE5shZwEn37TJG02hfHKX6WEWRD+dkANwML/jO+
         7vOtVxysm4OQmUqZpq+zWiODGymImmjWr3mrBHspRPNL427s5RNJPqo6aPWlLtxmXBGX
         0saLCW3Z69k7rSwYb7hKzxZEUw9zzaVpvRwF3NmvWBY7/gNxF9BclAWyqauBEYfhNJ6a
         EpT/+tH3hHVi5lohFUfgG2aQoXkwQbmp3VWS22HRdn0oJ2M/q8PT+QnP1wQvZzufoVv+
         WBWg==
X-Forwarded-Encrypted: i=1; AJvYcCWc2WekeaTNl+n0TBVz0k46Oy12vG2DQ2HAoU3SvVUJKIy3dlw+6tx8IxwpSIceDM9dApUswhK5qlHFM1+KVfkV@lists.infradead.org
X-Gm-Message-State: AOJu0YyY2toZ7hgttJ0H6mFkngQLuFpQYnuCCSH52snDh8yRZijD/DRw
	dbR6Z1BGwqJfZ9vy0T/E8Tfb0wsamrNHaqao1vn4vKFOavaGRLyF
X-Gm-Gg: ASbGncu4mqr9rhqY8WaEJ0l6r7C5jvu76VD4TSUJWiDn4AUgoPOg1LQRH/br/lxpITa
	Sr0jlgne95GkI9LhPhhJRzYIdcctZkrZqFdFp+zbeWXXZRCW2WN+denEzlLHXa+p9qbhKDA8e88
	ZGBJj+ce7/NSWkPynxtGVhUmWt++XhvDBtjscYsxpaexXWu9BASAV6qcWWt3zQVrWR8GYrpYJlX
	pzBfv6A69o1+oq5GK4fF/x5+saWuApyH4wghiGBVhtAfHvRuszki3KKu5yM+y42CQIbX3wSSv6p
	sjGWCvnzJcnn6mpR
X-Google-Smtp-Source: AGHT+IG51KC16Wbu1ERa4z+u0QYHDh0bJ/mjT2XKV4JUnCIVovlm0uf2m3P6dBWpNe7Neb6QdRPlxw==
X-Received: by 2002:a05:6a00:9a6:b0:72f:c513:a5fc with SMTP id d2e1a72fcca58-72fd0c7c731mr32930105b3a.23.1738586919357;
        Mon, 03 Feb 2025 04:48:39 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-acebddbb0d4sm7835225a12.10.2025.02.03.04.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:48:39 -0800 (PST)
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
Subject: [PATCH RESEND 2/9] arm64: dts: apple: t7000: Add cpufreq nodes
Date: Mon,  3 Feb 2025 20:43:41 +0800
Message-ID: <20250203124747.41541-3-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203124747.41541-1-towinchenmi@gmail.com>
References: <20250203124747.41541-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_044840_156281_744ABEC9 
X-CRM114-Status: GOOD (  12.03  )
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
2.48.1


