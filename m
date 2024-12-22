Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54490E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Dec 2024 18:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wXwxIenSzuIpC+GwkdjqUR2DofzaS4fQGLg3IB5+muY=; b=irFJY/C7XFDNxd4vPOskHFEZcN
	kmWyKY+aw9BFddn0GYIyePZ9VcjHS/4aF9If5Kvw4aoJxBCEu8nz6ALiancBMUjsIRW+eByJ48/t6
	4RX+DLyLV71GCpn7Okx1U2duRnGcaSBSzZ9ZOacgAvmVSxbSWpMaqOkd/A+eSI/GpQiCa6TDp1/Qw
	h5yJ8ciYK6Bt+PKC+ReAFC1ZWoKecER1C5ScV+S5Kalt79FAjnGY7Sq+kNwFt4EpuaPi2jQADQYxy
	PlQBefaQK37vetUEq9a5mpE+Ie9tvvVwmqYiXuwsp1NvF2pk5eTcbEkv2DTpL8lDNzla4/37ojavo
	I8ZAV12w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPQJl-00000008f2t-25lT;
	Sun, 22 Dec 2024 18:04:41 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPQ9E-00000008dr2-3gTk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Dec 2024 17:53:49 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2165cb60719so32469975ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Dec 2024 09:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734890028; x=1735494828; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wXwxIenSzuIpC+GwkdjqUR2DofzaS4fQGLg3IB5+muY=;
        b=A1EALRKBDR8t8vbANFc9DA6fEdHymTb965i5N/vDn9kn3VdGeEivVlsDEJBAZPM28t
         1pT11P8jZabF9t+Dce7t5fkF8SuqQwr9zENZcr8NZ+O9Uh9AiSAtN0m482/iotinCt1A
         nuq9WX3YJyP4OjFxAQwK1YCardwf565dwJSxKk+ysZT/Z8ch/5l1iVFY+/lpCEpbmkbA
         DfOGYRMueaO7iyY0y6PDoHbVQVjF8rwXNfIM70qEweFehVs+/Nz/HC7ti8Pbo84syclF
         QzXv4YfsqAnqGF9KmcULDPV1dmwLnix/jH/rMEzG5m4kRggp60N+4IVDX4qemC3RoI5s
         mZlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734890028; x=1735494828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wXwxIenSzuIpC+GwkdjqUR2DofzaS4fQGLg3IB5+muY=;
        b=I7fgWFlVPReBGO0Qu5NNXbTt06D/zrZcYC06uyqUVihpZIEDOT5+95ATYbkPD0coPp
         T12NQduU1iNloK49lNVey4WfR6NgqHZY692LtX4gUObedp6OSrkcGl55GOCuflNk+vze
         s6SDWrxA7hhdkdPKg21jU57iaJbRZDh6TAubN2QnuaD19LbJkdEOuCYBuAWyRVll6LRK
         UptxwoIMrcqjL8gJC4WFkZHDSdBfx5lYVeBkWsd3jcg1eRnX9eoKUtitp6cc7BSeVvVW
         fJWCsYpgKFGOVIVW7djVjKyUjaS7VHT2sJxfjC7Cd/MH5scTPxR2ngO6aZ/vEH7/VjuB
         uFvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdpG/w4cd0kyyiNlXMsJ9GM0l+1kzhIH0aaJT94m/SCYXH8ipekj0hPCKHPdFHMJruAnPrM/7UuKwuRsG52fBo@lists.infradead.org
X-Gm-Message-State: AOJu0YxQ2wMYTzJEd/wSfJnDaaN03HP10IllL/OA6X54tGVihBan/Pwo
	vPz5YhinuQqHbjxH9BwTNt03WLJHV+Es2haTNyxwVF/kKo1YA9VX
X-Gm-Gg: ASbGncv3pMcS7tSn8Qb1/HZ7YNI73dgulJdLlpr6g7/a9zh3LfQMJlh+ROu+7EgXW77
	ZF+nhTVKnYMsEh6GYfpJ8kJ+2Z+2QGk/O/LPg3Uq0iuglBVBIIIT/VVfAdNIWXwin+jZmQ3LXft
	UJEZ/kRMs7/k7sdU+Z5R1GamkFw6hIZuAUwCh6R3gfH4/J1ZkLVuRt5VFos0dehTE3kQS/aMYPr
	Xi9hHsKcyE4QKnBTVgj1dVBu7KYh3SEiArFhOi/L4QNY0x+hkAC4+d3rA==
X-Google-Smtp-Source: AGHT+IHSDfGeiVEQElB/fENv7ebMVITS5qMf817Q635jJxGYv5q8M2DnvFHYEvP8UOy+HWtj+qGhtw==
X-Received: by 2002:a17:90a:dfcd:b0:2ee:964e:67ce with SMTP id 98e67ed59e1d1-2f452dee953mr13986009a91.3.1734890028231;
        Sun, 22 Dec 2024 09:53:48 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-219dca04c33sm59503685ad.247.2024.12.22.09.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 09:53:47 -0800 (PST)
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
Subject: [PATCH 8/9] arm64: dts: apple: t8012: Add cpufreq nodes
Date: Mon, 23 Dec 2024 01:52:08 +0800
Message-ID: <20241222175314.151437-9-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241222175314.151437-1-towinchenmi@gmail.com>
References: <20241222175314.151437-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_095348_920012_94A0C63F 
X-CRM114-Status: GOOD (  12.40  )
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
 arch/arm64/boot/dts/apple/t8012.dtsi | 83 ++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8012.dtsi b/arch/arm64/boot/dts/apple/t8012.dtsi
index 45d24ca091b0..0a3d5a6bd047 100644
--- a/arch/arm64/boot/dts/apple/t8012.dtsi
+++ b/arch/arm64/boot/dts/apple/t8012.dtsi
@@ -32,6 +32,8 @@ cpu0: cpu@10000 {
 			compatible = "apple,hurricane-zephyr";
 			reg = <0x0 0x10000>;
 			cpu-release-addr = <0 0>; /* To be filled by loader */
+			operating-points-v2 = <&fusion_opp>;
+			performance-domains = <&cpufreq>;
 			enable-method = "spin-table";
 			device_type = "cpu";
 		};
@@ -40,11 +42,86 @@ cpu1: cpu@10001 {
 			compatible = "apple,hurricane-zephyr";
 			reg = <0x0 0x10001>;
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
+		 * Apple Fusion Architecture: Hardware big.LITTLE switcher
+		 * that use p-state transitions to switch between cores.
+		 * Only one type of core can be active at a given time.
+		 *
+		 * The E-core frequencies are adjusted so performance scales
+		 * linearly with reported clock speed.
+		 */
+
+		opp01 {
+			opp-hz = /bits/ 64 <172000000>; /* 300 MHz, E-core */
+			opp-level = <1>;
+			clock-latency-ns = <11000>;
+		};
+		opp02 {
+			opp-hz = /bits/ 64 <230000000>; /* 396 MHz, E-core */
+			opp-level = <2>;
+			clock-latency-ns = <140000>;
+		};
+		opp03 {
+			opp-hz = /bits/ 64 <425000000>; /* 732 MHz, E-core */
+			opp-level = <3>;
+			clock-latency-ns = <110000>;
+		};
+		opp04 {
+			opp-hz = /bits/ 64 <637000000>; /* 1092 MHz, E-core */
+			opp-level = <4>;
+			clock-latency-ns = <130000>;
+		};
+		opp05 {
+			opp-hz = /bits/ 64 <756000000>;
+			opp-level = <5>;
+			clock-latency-ns = <130000>;
+		};
+		opp06 {
+			opp-hz = /bits/ 64 <1056000000>;
+			opp-level = <6>;
+			clock-latency-ns = <130000>;
+		};
+		opp07 {
+			opp-hz = /bits/ 64 <1356000000>;
+			opp-level = <7>;
+			clock-latency-ns = <130000>;
+		};
+		opp08 {
+			opp-hz = /bits/ 64 <1644000000>;
+			opp-level = <8>;
+			clock-latency-ns = <135000>;
+		};
+		opp09 {
+			opp-hz = /bits/ 64 <1944000000>;
+			opp-level = <9>;
+			clock-latency-ns = <140000>;
+		};
+		opp10 {
+			opp-hz = /bits/ 64 <2244000000>;
+			opp-level = <10>;
+			clock-latency-ns = <150000>;
+		};
+#if 0
+		/* Not available until CPU deep sleep is implemented */
+		opp11 {
+			opp-hz = /bits/ 64 <2340000000>;
+			opp-level = <11>;
+			clock-latency-ns = <150000>;
+			turbo-mode;
+		};
+#endif
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -52,6 +129,12 @@ soc {
 		nonposted-mmio;
 		ranges;
 
+		cpufreq: performance-controller@202f20000 {
+			compatible = "apple,t8010-cluster-cpufreq", "apple,t8103-cluster-cpufreq", "apple,cluster-cpufreq";
+			reg = <0x2 0x02f20000 0 0x1000>;
+			#performance-domain-cells = <0>;
+		};
+
 		serial0: serial@20a600000 {
 			compatible = "apple,s5l-uart";
 			reg = <0x2 0x0a600000 0x0 0x4000>;
-- 
2.47.1


