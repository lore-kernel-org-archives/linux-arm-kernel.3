Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 499F0E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Dec 2024 18:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N24iLfWKUlFKc1T6bkkvm11QnF/DJ7nQeOyrjdB7/0A=; b=YXZJuIsV22nZsZUQpBB3zW8LEm
	6lxN8+JcxkbZp1yl5xSxTlQ023j5BepiU31KtNY+EFP+KLFSLRorChn2pokqLc/R98543I/0wjUyZ
	78xEvWL/e7vKH1/dFzevVCMXeOvr3gsQr1Lalj+m20EgD2zfojrPQ4NoPPQ/G5kFfi8zqiUQTt+WD
	ITYHf6G1Nh3//Ykpu76nIdfx3ibCb8eRZUCSqlSHng82g8GmJ9EWro8yMoUPMllwZRS5JVxpMcM31
	FOQFbWaZq9zfG/xAPBMs2Z8JTIYISydGVV29/i592iKQ2007XGg9b0fe+XERNmo8L29IPZsNIVGEZ
	AGRzBMIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPQGM-00000008elC-0i9o;
	Sun, 22 Dec 2024 18:01:10 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPQ97-00000008dne-1r0D
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Dec 2024 17:53:42 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-21649a7bcdcso31760775ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Dec 2024 09:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734890021; x=1735494821; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N24iLfWKUlFKc1T6bkkvm11QnF/DJ7nQeOyrjdB7/0A=;
        b=d62xWi5ZyqkDK77AzNmYlwsIX6xirfgXqRzIGqkJQvnCM2MF1cXnKzMuTTZzE+irPi
         mpmIyZJdnVOhk6o13HwJJ37ndWlXfkgB/whju2u3f2pOSuXuP5amoJXzM92gddvGZLRo
         ttbMXg+1J6+bcbIYj1WfxVTvqWc0s2G4iwGdYYnSR2XS11gcsyjRoEjzL3Du+MP/0XYs
         CEe5zZcFZPHugEPAlP5STT2GMzq9GUJoxii3QggjKHZ3b000c+lWavZNX4H4yKXdpypZ
         QilxuWn6grlPxvMzTX7IPt0RhgFNFG5NN9JaoOYsdi1biDnwdH1/MS05umTfuesRaUuJ
         EMcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734890021; x=1735494821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N24iLfWKUlFKc1T6bkkvm11QnF/DJ7nQeOyrjdB7/0A=;
        b=aL0VwrlScqe7NjVffG5cJeOjAMFPMu26c8ZfUior6EZyQc8vlgGMGRWmKAnGS5obr0
         JdVTQZQh/9sfQ8S89atgKo4Nw605DlLo6L6rM3i36Hlzbj2RyuJkhYN2KU8+ww7gMGJw
         03FMVtRSMDAzlMX/1EFneYZmqFw5CzBVD8zxV1zFHVzD8m9nE2a4Tsv2YjA8OPfHOlGS
         9gFoeZ4ly9l4G8buAxn+rCSxdO9KVnMyBV32SCf48FcdZsSZuypr4ilTg7RbzMEtytzc
         yt41evcYCG1/fvuTglU6QHYmAT2iEechB1Qd4F5wR83tcvEbq9h80BSH8J7+Djk1IEp0
         xtlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAtS8TNiFtT/Vb0lRynxVMnvGwX0ArK5jzh5FTtKIjjD5kuwDKKXLc4mv26ratEsB10ufrCOYWLRToZ9mNzPm9@lists.infradead.org
X-Gm-Message-State: AOJu0YxWD+JPybtYLxNNfW1tqJEa8YHfh/6PEREBCGHlR86Kp9jrSij7
	Po6Zc8XPXS8LgtwFkV7K2WMKETE27Mhsn661i1+Fq9JQQtAgdEPk
X-Gm-Gg: ASbGncsHdWDe5R0GNrsJ26gSxBakg3otP07V7LtSVIMHX49IAYhTo3ohtLNBB5clh1r
	oESHsU13D+wfroayVe8v3RUVFDBnkSzYa4JQDU8r5kA23E4IoJdyY/y8bKPbmHRGZflej+v/Le9
	q+bddnth8yToTodiPE88eoF4ZVpy2o9g9ED2vNWSJe0PLZsnqUOyDcgorbvWKdZs+NjpFh/EuCB
	Df9dQdlbsdl91hX/f9JbTa8aa6QsBZgdKI0eVfiRRHYjfH5HfHL1jmDEA==
X-Google-Smtp-Source: AGHT+IEfOwJ3U9W+UweF0jknq2Ss6l2OIz6iPXfOBXoRPosT9OX3PknrAeuTJncg0JkltpB5GeYkjw==
X-Received: by 2002:a17:902:f688:b0:215:a172:5fb9 with SMTP id d9443c01a7336-219e70dbe56mr133375005ad.48.1734890020756;
        Sun, 22 Dec 2024 09:53:40 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-219dca04c33sm59503685ad.247.2024.12.22.09.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 09:53:40 -0800 (PST)
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
Subject: [PATCH 5/9] arm64: dts: apple: s8001: Add cpufreq nodes
Date: Mon, 23 Dec 2024 01:52:05 +0800
Message-ID: <20241222175314.151437-6-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241222175314.151437-1-towinchenmi@gmail.com>
References: <20241222175314.151437-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_095341_500040_27C29D55 
X-CRM114-Status: GOOD (  10.74  )
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

Add cpufreq nodes for Apple A9X SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s8001.dtsi | 59 ++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s8001.dtsi b/arch/arm64/boot/dts/apple/s8001.dtsi
index 23ee3238844d..7f7cb8afd3d3 100644
--- a/arch/arm64/boot/dts/apple/s8001.dtsi
+++ b/arch/arm64/boot/dts/apple/s8001.dtsi
@@ -32,6 +32,8 @@ cpu0: cpu@0 {
 			compatible = "apple,twister";
 			reg = <0x0 0x0>;
 			cpu-release-addr = <0 0>; /* To be filled in by loader */
+			operating-points-v2 = <&twister_opp>;
+			performance-domains = <&cpufreq>;
 			enable-method = "spin-table";
 			device_type = "cpu";
 		};
@@ -40,11 +42,62 @@ cpu1: cpu@1 {
 			compatible = "apple,twister";
 			reg = <0x0 0x1>;
 			cpu-release-addr = <0 0>; /* To be filled in by loader */
+			operating-points-v2 = <&twister_opp>;
+			performance-domains = <&cpufreq>;
 			enable-method = "spin-table";
 			device_type = "cpu";
 		};
 	};
 
+	twister_opp: opp-table {
+		compatible = "operating-points-v2";
+
+		opp01 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-level = <1>;
+			clock-latency-ns = <800>;
+		};
+		opp02 {
+			opp-hz = /bits/ 64 <396000000>;
+			opp-level = <2>;
+			clock-latency-ns = <53000>;
+		};
+		opp03 {
+			opp-hz = /bits/ 64 <792000000>;
+			opp-level = <3>;
+			clock-latency-ns = <18000>;
+		};
+		opp04 {
+			opp-hz = /bits/ 64 <1080000000>;
+			opp-level = <4>;
+			clock-latency-ns = <21000>;
+		};
+		opp05 {
+			opp-hz = /bits/ 64 <1440000000>;
+			opp-level = <5>;
+			clock-latency-ns = <25000>;
+		};
+		opp06 {
+			opp-hz = /bits/ 64 <1800000000>;
+			opp-level = <6>;
+			clock-latency-ns = <33000>;
+		};
+		opp07 {
+			opp-hz = /bits/ 64 <2160000000>;
+			opp-level = <7>;
+			clock-latency-ns = <45000>;
+		};
+#if 0
+		/* Not available until CPU deep sleep is implemented */
+		opp08 {
+			opp-hz = /bits/ 64 <2160000000>;
+			opp-level = <8>;
+			clock-latency-ns = <45000>;
+			turbo-mode;
+		};
+#endif
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -52,6 +105,12 @@ soc {
 		nonposted-mmio;
 		ranges;
 
+		cpufreq: performance-controller@202220000 {
+			compatible = "apple,s8000-cluster-cpufreq", "apple,t8103-cluster-cpufreq", "apple,cluster-cpufreq";
+			reg = <0x2 0x02220000 0 0x1000>;
+			#performance-domain-cells = <0>;
+		};
+
 		serial0: serial@20a0c0000 {
 			compatible = "apple,s5l-uart";
 			reg = <0x2 0x0a0c0000 0x0 0x4000>;
-- 
2.47.1


