Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B25C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 12:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/LkP12Dy2J2B7t0xjl9+9JD7vtd93pwtcrc12+hgZoc=; b=o5P39kxp1uaa2tEvVCUXzvVtyR
	UMJaoLkjzTfK2YFjtOEN2gSLj/5BU0EvEgaaDdFpPctLj+52E/Ia9u0ft/+vdgIO7kGINtaO7REub
	59qgUvBrPXQwNaDH8OGWuseyfs7HYuRju4wdPaTEv2iZHfhiLcTmaclpwOdLyPWWO4frDPuh3SM02
	8lhtnrO7IrnFQ7hO3npKWyxX1A7B68Xt/Cy4J9lyGFKn1fomZ69xSMWeESHJaXJfOW/BgAggadIF2
	1+EqHhpo47W3kGCa9WJy05nhZg6+/CtiP2AWK7hjUOshGI9yJRhr9ccknbijVfub3CKFLwhWj2cTZ
	Derzh+RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tevxf-0000000FR99-3aya;
	Mon, 03 Feb 2025 12:53:59 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tevsY-0000000FPdM-3JsJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 12:48:43 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2161eb94cceso50751215ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 04:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738586922; x=1739191722; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/LkP12Dy2J2B7t0xjl9+9JD7vtd93pwtcrc12+hgZoc=;
        b=K+M92uU/uf7zRR08lOajIy4NPdUFhcZY9PZEv41kaQGfDa6PfI+W2Q2QY1Nuy1SZA4
         6RE0GG/dm9D2Tt782pAwy6OqULigbhAZlc7Zxh/OerTI+3AxJ+JGuNam1v8DLodlee8g
         s4OyUcuLean0EwM6lCqRjnAZpsC3gKrtB+H4fChr7pE2DKvxvZHrs0Ij+G+BVCGoNBV4
         ndwJxSVyyEGyTTkMdAjq4hD1x8wa0UVV+gklvqfsb0OAWM+zhE4viZssI7pqjgGVudFX
         LvWI7/U+m8dqX5gDuPilxQcMn12TtKuHt9t1XzjXOQ6FfYytVRpRTBTlWizHAIuGd2rJ
         eBgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738586922; x=1739191722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/LkP12Dy2J2B7t0xjl9+9JD7vtd93pwtcrc12+hgZoc=;
        b=c6YVqKWnD7bkHug6HyGA6PbWQt8UbZI3HmT2QIB6G4mcKVCpUIrjl6SQY+bxa68+YV
         DVGjofjtMEk6325dCpar7OHWXxnwAQ6DyIubWRDx2w3x14euXMUKIzfC/YHEuyP2LxMo
         DHlK8CqiErRnykXWd9R/XPmMyo7PLhC3skTNpbJPhGIbCKygB0AjA/h5N0Zzm27qjlL8
         txfFBacws51p7yzVPZVrIZoszvSkGTVF5+VglsdqFjpwf1SFNxtmczRoMm1UAWkhw6DJ
         xkCxAT4nvLg8nsutT+Ml56nOYtENLwN7j+7fgtY/MYUKFLC/4HRZYGM1P8Ifl7tDiIQP
         KWdg==
X-Forwarded-Encrypted: i=1; AJvYcCWm9hYmScRKMxOd6EwBMjh77RE655BpbXqKaLyitP4S6A0/TOVEivtmZV96li7pi1HS9SW33OEK4jZapcHdrk3s@lists.infradead.org
X-Gm-Message-State: AOJu0Yzo2iKlRxteqQVUYI31t/lsOEPAxApHxQsjVa8GSpMVkNO5nrZ2
	Hg9ir1h5IVbi4Qr+A2jks7ebwUKxn4xVVTZI44x/ysKSYR2QYSxA
X-Gm-Gg: ASbGncvSKmL14E0xdKT43SwN4QTOB8PKzwXRwjVo7FD/Uer29JS/87mvtf/6vyDNdIM
	b5xy1VCVicsth9g5K7jfQwujxlMtziYB2lFe9Sf2FK07D+qNZfuTIv+W8Sd18DgGtlYEbkjktmI
	hXpQzPl2pUFKiNwN+brI/oFLE4T0jXGbPSaRTSb5O1OPFch30D6pv8vRrtBE7402/mJrPjdjKnF
	lbxTP44xxlAKcSH4Ogb8iDb6a5/BCa6OBzByj0N57dVBZZJTcWAi3Z6JNTBbnZb5VVGH4Qg74pT
	gq3u0jxR7ip9GkX1
X-Google-Smtp-Source: AGHT+IGbtAfT5l94kOHzzGOxTNJFkUHwyUD0cdCtuhNKa/qwE630Sx/u+J6An+CM+1rznyqoo3fjCw==
X-Received: by 2002:a17:902:d510:b0:216:2af7:a2a3 with SMTP id d9443c01a7336-21dd7e5a6f0mr368751385ad.53.1738586922124;
        Mon, 03 Feb 2025 04:48:42 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-acebddbb0d4sm7835225a12.10.2025.02.03.04.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:48:41 -0800 (PST)
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
Subject: [PATCH RESEND 3/9] arm64: dts: apple: t7001: Add cpufreq nodes
Date: Mon,  3 Feb 2025 20:43:42 +0800
Message-ID: <20250203124747.41541-4-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203124747.41541-1-towinchenmi@gmail.com>
References: <20250203124747.41541-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_044842_828566_BDB35B21 
X-CRM114-Status: GOOD (  10.57  )
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

Add the cpufreq nodes for Apple A8X SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t7001.dtsi | 52 ++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t7001.dtsi b/arch/arm64/boot/dts/apple/t7001.dtsi
index a76e034c85e3..15fd91d12f30 100644
--- a/arch/arm64/boot/dts/apple/t7001.dtsi
+++ b/arch/arm64/boot/dts/apple/t7001.dtsi
@@ -35,6 +35,8 @@ cpu0: cpu@0 {
 			compatible = "apple,typhoon";
 			reg = <0x0 0x0>;
 			cpu-release-addr = <0 0>; /* To be filled in by loader */
+			performance-domains = <&cpufreq>;
+			operating-points-v2 = <&typhoon_opp>;
 			enable-method = "spin-table";
 			device_type = "cpu";
 		};
@@ -43,6 +45,8 @@ cpu1: cpu@1 {
 			compatible = "apple,typhoon";
 			reg = <0x0 0x1>;
 			cpu-release-addr = <0 0>; /* To be filled in by loader */
+			performance-domains = <&cpufreq>;
+			operating-points-v2 = <&typhoon_opp>;
 			enable-method = "spin-table";
 			device_type = "cpu";
 		};
@@ -51,11 +55,53 @@ cpu2: cpu@2 {
 			compatible = "apple,typhoon";
 			reg = <0x0 0x2>;
 			cpu-release-addr = <0 0>; /* To be filled by loader */
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
+			clock-latency-ns = <49000>;
+		};
+		opp03 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-level = <3>;
+			clock-latency-ns = <31000>;
+		};
+		opp04 {
+			opp-hz = /bits/ 64 <840000000>;
+			opp-level = <4>;
+			clock-latency-ns = <32000>;
+		};
+		opp05 {
+			opp-hz = /bits/ 64 <1128000000>;
+			opp-level = <5>;
+			clock-latency-ns = <32000>;
+		};
+		opp06 {
+			opp-hz = /bits/ 64 <1392000000>;
+			opp-level = <6>;
+			clock-latency-ns = <37000>;
+		};
+		opp07 {
+			opp-hz = /bits/ 64 <1512000000>;
+			opp-level = <7>;
+			clock-latency-ns = <41000>;
+		};
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -63,6 +109,12 @@ soc {
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


