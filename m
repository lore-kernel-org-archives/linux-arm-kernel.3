Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ADA0E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Dec 2024 17:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p/H34LBUZjUXTz+iaRY9rMjPwJeFD2H83GIWRwt32m0=; b=UGntemSwEXSjScvpJz/I+nIQMy
	oiYgcmIr36Qg6zJM8yLTgHLGaq4xdyRcCj+qr2KZY8he1adYzqDWGnMLQhHwB8QaOTVlqc54uL8cd
	KAXeq04H4AaFYydLghwH/bckCgwKLMrQJI1akjtVyRHBOhFI0YnsdgxEMMQSrdFeX8ra84MqxnWHf
	z6KpV8pLiRuf12rT/Nl0pIay68cVo4cWxVRdYp60RYVGRaVl4eLZw6zjnex+75Il/wnsTJdBaPrSf
	dd/bJrKM92NEibp0A9LQXPL6Vq2bc7L98tREDRoMjRaP9yXV8rrud6V62lAPIDTBI23YlAsYHHupl
	4Dp6o72Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPQBo-00000008eNF-0adH;
	Sun, 22 Dec 2024 17:56:28 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPQ91-00000008dlh-3AD8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Dec 2024 17:53:36 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2167141dfa1so30782005ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Dec 2024 09:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734890015; x=1735494815; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p/H34LBUZjUXTz+iaRY9rMjPwJeFD2H83GIWRwt32m0=;
        b=gIviC827WItXLHVyDL99jppkXSDsLoZu44ogGucs6ziE9xGY0wqDns7j2ztsY6ilLn
         ZkmXb2xVW2SrwsORsJMCUSe2FmGnUIdtZntuF81SYe1ItkD8wsWshwdTGuJJotxxsdoE
         ZWwQN2FugmyWqYmbxgpK8NYkYEquJ26a9Mn6HrqbLP+sWByPi1F0lBnccfidcZEJcjch
         oX36gyTXffgo4xR/qHY5+y36GrzpECwGIkvJhWdLv5tnscJWL0cdm7/jOfsxyN08xY4l
         T6h6CA34LM9RfMlCBcvro7URHvmPrbZl/X1+7/HVYVE1onr6bzqCXcQ4dJEPWuEjuiXm
         mg3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734890015; x=1735494815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p/H34LBUZjUXTz+iaRY9rMjPwJeFD2H83GIWRwt32m0=;
        b=gqJx5rMUuXHfpyUmevKKzNNZ8hO1l34a0a+fElvhIvjHdfkivsvEZ66mgTR9Tk63AU
         +Ry/nM615e5+cEQPf6Pl2pxugRfiULpLCcczGu4ERRENh97AIkPEfytu89KMZgXL8+NP
         PMrprrEc/4z0l7ETwVUmZj7Yb7eBFs8mztAroEmJZ/Z3leQQTicQmwyrjKvgpQ0E1i/s
         TVnKabwEgLFrXDNmSMZLaRoaCwpek213YmMl0M4MAE8U4peS9uUwsEd5as0eDHGJYX1o
         eh4p8Fy0vojOEPVJta9IIMiEJ6yByhbGJQHrufPSiAg7N38wDkdXDdgTYZjgtqTUECJx
         l9Yg==
X-Forwarded-Encrypted: i=1; AJvYcCV14rUH1VJkkVfm/aBclE/MfIYerWQPG+MbIBUryXqUNejFgmsTmzEaHHohZoEuNq96AVqIyQ1WcuEzsWsmtHVV@lists.infradead.org
X-Gm-Message-State: AOJu0YycyBWaNeSOlEGA3ZMeEdpwQrqzlog1HlgsKs6pMJ8iUNmg4V1D
	6w6Z5nuKwHSJRvkZsFYYtg5XH1cjcC6tqnnpvcqZpDCWn4M7+yUA
X-Gm-Gg: ASbGncuN+COm0Ocoj5k4CMAwm5K2a3M2rjqtcjWDqiMhOobCGPcjDDN0ydp42vCq/3n
	WZA2RVfogQ453WJKFsGMzGwlSz2ToKz7O8MIeONGRPihtEBR8FM5PgATPR8BDXan+Z538mrCHOe
	NdnhYN4hYsnyZjQbpLVsZEgqu04uu2NM1ucKpKavYggRow7FfLmcS3pDgeyK0574bBw3CQ83+FV
	MevRWJQV1yoxKkCTNEg4lXHJ4DakCwRUj44f+hUOnGJi6gwxhMEt++kMw==
X-Google-Smtp-Source: AGHT+IHvFpLLRyzoQQ5tNKeb07qfw06v3MtCIVEteo/HrQ0DzX1pSwNVX59T/cnT26GV4sClW+vrcA==
X-Received: by 2002:a17:902:da8f:b0:215:98e7:9b1 with SMTP id d9443c01a7336-219e6ca6e4amr133258395ad.5.1734890015061;
        Sun, 22 Dec 2024 09:53:35 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-219dca04c33sm59503685ad.247.2024.12.22.09.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 09:53:34 -0800 (PST)
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
Subject: [PATCH 3/9] arm64: dts: apple: t7001: Add cpufreq nodes
Date: Mon, 23 Dec 2024 01:52:03 +0800
Message-ID: <20241222175314.151437-4-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241222175314.151437-1-towinchenmi@gmail.com>
References: <20241222175314.151437-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_095335_799258_6FB04D4D 
X-CRM114-Status: GOOD (  10.22  )
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
2.47.1


