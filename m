Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B3A9CA1016
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 07:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8vGETqveoBt5cMEam5jsZwP+S/bgV2oFw9uuaDskBWE=; b=RAy0VE0e/fVY61p8hQZpnRB/8V
	Z9tzrLs8rsmp+jBTGdPjj5TFZUmawEXMf+XlmueuVTeEcHZwuwnwNDMXXpOAUJbK1RRKSjJdj3juj
	D6e18Y4put14jVpaUL8JZhDHkvzblOQQWDBqAyutm/ibs7AJbxl9Hhk4xB8rj3mFE2Emil8iD7oyi
	uqVvRhBm4ljSHv/hErWe+LUcT5LlSTZ0pE5X0fKHTj3daRpPKTxfSFLHZxPs28xoMpCyYbtkcLmv7
	RRorWiC5SqAQJ38gwdr6N9uHXtNegxwS+wEavTEl++9mwF/GRDlAofhsrKb7rdHRZnsEaNaKclWia
	QuP0PLwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvWHa-0000000FHfF-3ZB1;
	Mon, 08 Sep 2025 07:27:22 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvWC4-0000000FFGS-2cws
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 07:21:41 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3e2055ce973so2064970f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 00:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757316099; x=1757920899; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8vGETqveoBt5cMEam5jsZwP+S/bgV2oFw9uuaDskBWE=;
        b=JKbVZocUP8z5i6Hh43HodhfXCVQpf0aMHmEe9LWybEqKRvUwXaOKw1uWOO8bxL2XBM
         A8h5gVdEYt+cVpF6yp/3Od0v/0OnUZ2ljXoDGeHK3Rs5ppyJDNP5e5lGuSHXAnrSMEXQ
         cwPTfwy32TPIC7H1J9nmBYeAbnMZZh/erFXtisj8gpxJY6gCn4oLd5Pnk5yor7/lN3++
         wug2dMymLCvCK0m6aOSuGBd7CsIAafAQhMzl2aiMRcR+BqQC4sp2PiQKlCrqEcefMLH/
         y7I/E4Ac2I9/+ST3ye10ZbsvU74GYkgXoJg2t3rpppq8Rd85MmFgG96FT6H+/G2bzhQk
         iCYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757316099; x=1757920899;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8vGETqveoBt5cMEam5jsZwP+S/bgV2oFw9uuaDskBWE=;
        b=sEyao6fqjFp45CYvmOautUZA9vcL7wsrPP8zF04FNOO52SciPSOpeW01ZW9qRceSBt
         V1HrYXV7TI22BD8+dPRJSLTeVKyuIqsOB0/gRjeL/EV9rruzH58Vm1Wf0sQcpTv1S+OY
         anSXgZ99Qb7ZDDXdilWH3XdAtGjFAAY66Tu+cDBb0tGocIDxXbAwNtb7HyyeZxrD7VQk
         tvsVYQiC7YAK8x7hc73wXO32uREcMLqXpK9YjN2/D9fzsJFdgYQR7EF9N5FOflNSPy8N
         uIK/p/YCXmQt01i3TA1HgZsS+lxEcyuFlHSDXzRG79P2YZy/JxcsgWjgp6JHaAnWn9qz
         dDNw==
X-Gm-Message-State: AOJu0YxPI4bW+byc9yIiNINRV8X4I11a0jzLKItRPBd8la61GCIXixdz
	6o3xreAqmYr/35i7RAzjTrCgKLmOpkuE3CaBveLvh2q64baA7gFw3FjN5h/aAQ==
X-Gm-Gg: ASbGnct1hPBOY6l7axr2ItRiTI6QcbDH+csPB2FK8Wh9BIBL9AQzuctwkJ1Vp2RpdEC
	+XlAAspGO97gtiQxjVDoCkctyPza95QrPtgG7LeTb+tyqsVbgxOfwmd2UDln1l0Z/O/uiw0m+qi
	5ov/OP13UFT//CxDM6b/sAgQYik/I+qqSrtTxiyywOBT7rPceD/ri7Sa0E6MqG8hlX4pRy9iRkt
	sXdopY0Rw3p9voc7vD9URO1CTW7ArHnhgztH9uVjgZUEpCn9Bc1nzimMgJCod2ai0jtihyQEAhy
	lwgw6FVBtt89qAuiz9kepBFBVnx5U+MIwx3d8xfDHgkmZLTQmElyItTJjbk9pY62So4TIrzaMfZ
	mLNo43KXWF+eY3+8RlpiEVf3irTYUj5MtGO8=
X-Google-Smtp-Source: AGHT+IHHRvnjLjaP0w5j76MN8JSMdM4W9ZQKfUq+NI60zYTqiD7a5mNtTsbJQOEUbeQ7e6wq3tHcfg==
X-Received: by 2002:a05:6000:26d2:b0:3df:b9e7:35ba with SMTP id ffacd0b85a97d-3e6440f0674mr4452980f8f.57.1757316098881;
        Mon, 08 Sep 2025 00:21:38 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:2acd:89a8:83d9:4be5])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3e21e4c0e6fsm13952247f8f.17.2025.09.08.00.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 00:21:38 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Mon, 08 Sep 2025 09:21:25 +0200
Subject: [PATCH] ARM: dts: sti: remove dangling stih407-clock file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-master-v1-1-98efab52f143@gmail.com>
X-B4-Tracking: v=1; b=H4sIAPSDvmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDSwNz3dzE4pLUIt2kJEND0zTTJDPzxBQloOKCotS0zAqwQdGxtbUA90i
 DWlgAAAA=
X-Change-ID: 20250907-master-bb115f5b67ad
To: Patrice Chotard <patrice.chotard@foss.st.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5504; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=Xak1Cuq9EVFZC01eU03q61FejiUCiI7T4pcMfA4/wnI=;
 b=owEBbQKS/ZANAwAKAechimjUEsK1AcsmYgBovoP3xxOfavO5iVXwjoyBYGWLe0mSLtrJfqT9q
 vQI1AU2blKJAjMEAAEKAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCaL6D9wAKCRDnIYpo1BLC
 tX+LD/44ev/qY+hr+l2mbBLGFLqE1Nm4ebIao4amZ8Mmj8wYGMW3x25uQGKqRxe0r4rHpcIox+5
 bPHdDs2RZ8Ni46dS+9KkG94t31RZRzGdYKiZDKmce6Y9FIBBs56xw9pJSv/C+A+iE1HJXoNjJWY
 xOvv9Kth8hZlJ9zSfExbRYE25PEi8TcfnvSdCIF4NqYUWCqD0DVNll35vvlNjCwjUzGR3m7u8Po
 SyB9q8cHk+Ah1xkPYiFyWt3tRPRs2Ww7T+ByiD3HFvchDbUyr9vSpX8PSrJC74LxPb7ialJ7/Wp
 f8nMcK9jpXTDYxX7/t7NiiKAVI6WqgLIDaJ+n+NbACJ6B+pccvcC9V4EopvOQW4PKx/7kg8Qvvf
 ET8hztDfrnaWBCIet3xzzo/OqeIFOHFOhwTWJ7VWU1/y1LyMbTcmwnIp/h//oh5YHFoosRTWjDr
 lyISAGZZkm0cMmccpyqB/aGGJ30uiaU6hKQa00AVdiC30FOmnGz1nXewMpkyCssKIQhBjAVmB86
 UK/nwx1VT4kH292C8Ci9OpoGbYNdV6eQmIP+4sjN7C7mgSMGKgfuXTYSz/hu0812XHWaUejEBBr
 iQ/VGHcOVa5W8NFTjkz3SoMIbVfbhm+XW8j5LmWZn+Ml4T/m5g85qMIQ/enxFwHuY5eS1tvBfJM
 mDOr5TnExcThxpg==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_002140_677072_C30333FE 
X-CRM114-Status: GOOD (  10.42  )
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

Following the removal of B2120 board support, the st/stih407-clock.dtsi
file has been left unused.  Remove it.

Fixes: dee546e1adef ("ARM: sti: drop B2120 board support")
Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 arch/arm/boot/dts/st/stih407-clock.dtsi | 210 --------------------------------
 1 file changed, 210 deletions(-)

diff --git a/arch/arm/boot/dts/st/stih407-clock.dtsi b/arch/arm/boot/dts/st/stih407-clock.dtsi
deleted file mode 100644
index 350bcfcf498bc410ebdb4fd00f2e1ea496a9c8be..0000000000000000000000000000000000000000
--- a/arch/arm/boot/dts/st/stih407-clock.dtsi
+++ /dev/null
@@ -1,210 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (C) 2014 STMicroelectronics R&D Limited
- */
-#include <dt-bindings/clock/stih407-clks.h>
-/ {
-	/*
-	 * Fixed 30MHz oscillator inputs to SoC
-	 */
-	clk_sysin: clk-sysin {
-		#clock-cells = <0>;
-		compatible = "fixed-clock";
-		clock-frequency = <30000000>;
-	};
-
-	clk_tmdsout_hdmi: clk-tmdsout-hdmi {
-		#clock-cells = <0>;
-		compatible = "fixed-clock";
-		clock-frequency = <0>;
-	};
-
-	clocks {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges;
-
-		/*
-		 * A9 PLL.
-		 */
-		clockgen-a9@92b0000 {
-			compatible = "st,clkgen-c32";
-			reg = <0x92b0000 0x10000>;
-
-			clockgen_a9_pll: clockgen-a9-pll {
-				#clock-cells = <1>;
-				compatible = "st,stih407-clkgen-plla9";
-
-				clocks = <&clk_sysin>;
-			};
-
-			clk_m_a9: clk-m-a9 {
-				#clock-cells = <0>;
-				compatible = "st,stih407-clkgen-a9-mux";
-
-				clocks = <&clockgen_a9_pll 0>,
-					 <&clockgen_a9_pll 0>,
-					 <&clk_s_c0_flexgen 13>,
-					 <&clk_m_a9_ext2f_div2>;
-
-				/*
-				 * ARM Peripheral clock for timers
-				 */
-				arm_periph_clk: clk-m-a9-periphs {
-					#clock-cells = <0>;
-					compatible = "fixed-factor-clock";
-
-					clocks = <&clk_m_a9>;
-					clock-div = <2>;
-					clock-mult = <1>;
-				};
-			};
-		};
-
-		clockgen-a@90ff000 {
-			compatible = "st,clkgen-c32";
-			reg = <0x90ff000 0x1000>;
-
-			clk_s_a0_pll: clk-s-a0-pll {
-				#clock-cells = <1>;
-				compatible = "st,clkgen-pll0-a0";
-
-				clocks = <&clk_sysin>;
-			};
-
-			clk_s_a0_flexgen: clk-s-a0-flexgen {
-				compatible = "st,flexgen", "st,flexgen-stih407-a0";
-
-				#clock-cells = <1>;
-
-				clocks = <&clk_s_a0_pll 0>,
-					 <&clk_sysin>;
-			};
-		};
-
-		clk_s_c0: clockgen-c@9103000 {
-			compatible = "st,clkgen-c32";
-			reg = <0x9103000 0x1000>;
-
-			clk_s_c0_pll0: clk-s-c0-pll0 {
-				#clock-cells = <1>;
-				compatible = "st,clkgen-pll0-c0";
-
-				clocks = <&clk_sysin>;
-			};
-
-			clk_s_c0_pll1: clk-s-c0-pll1 {
-				#clock-cells = <1>;
-				compatible = "st,clkgen-pll1-c0";
-
-				clocks = <&clk_sysin>;
-			};
-
-			clk_s_c0_quadfs: clk-s-c0-quadfs {
-				#clock-cells = <1>;
-				compatible = "st,quadfs-pll";
-
-				clocks = <&clk_sysin>;
-			};
-
-			clk_s_c0_flexgen: clk-s-c0-flexgen {
-				#clock-cells = <1>;
-				compatible = "st,flexgen", "st,flexgen-stih407-c0";
-
-				clocks = <&clk_s_c0_pll0 0>,
-					 <&clk_s_c0_pll1 0>,
-					 <&clk_s_c0_quadfs 0>,
-					 <&clk_s_c0_quadfs 1>,
-					 <&clk_s_c0_quadfs 2>,
-					 <&clk_s_c0_quadfs 3>,
-					 <&clk_sysin>;
-
-				/*
-				 * ARM Peripheral clock for timers
-				 */
-				clk_m_a9_ext2f_div2: clk-m-a9-ext2f-div2s {
-					#clock-cells = <0>;
-					compatible = "fixed-factor-clock";
-
-					clocks = <&clk_s_c0_flexgen 13>;
-
-					clock-output-names = "clk-m-a9-ext2f-div2";
-
-					clock-div = <2>;
-					clock-mult = <1>;
-				};
-			};
-		};
-
-		clockgen-d0@9104000 {
-			compatible = "st,clkgen-c32";
-			reg = <0x9104000 0x1000>;
-
-			clk_s_d0_quadfs: clk-s-d0-quadfs {
-				#clock-cells = <1>;
-				compatible = "st,quadfs-d0";
-
-				clocks = <&clk_sysin>;
-			};
-
-			clk_s_d0_flexgen: clk-s-d0-flexgen {
-				#clock-cells = <1>;
-				compatible = "st,flexgen", "st,flexgen-stih407-d0";
-
-				clocks = <&clk_s_d0_quadfs 0>,
-					 <&clk_s_d0_quadfs 1>,
-					 <&clk_s_d0_quadfs 2>,
-					 <&clk_s_d0_quadfs 3>,
-					 <&clk_sysin>;
-			};
-		};
-
-		clockgen-d2@9106000 {
-			compatible = "st,clkgen-c32";
-			reg = <0x9106000 0x1000>;
-
-			clk_s_d2_quadfs: clk-s-d2-quadfs {
-				#clock-cells = <1>;
-				compatible = "st,quadfs-d2";
-
-				clocks = <&clk_sysin>;
-			};
-
-			clk_s_d2_flexgen: clk-s-d2-flexgen {
-				#clock-cells = <1>;
-				compatible = "st,flexgen", "st,flexgen-stih407-d2";
-
-				clocks = <&clk_s_d2_quadfs 0>,
-					 <&clk_s_d2_quadfs 1>,
-					 <&clk_s_d2_quadfs 2>,
-					 <&clk_s_d2_quadfs 3>,
-					 <&clk_sysin>,
-					 <&clk_sysin>,
-					 <&clk_tmdsout_hdmi>;
-			};
-		};
-
-		clockgen-d3@9107000 {
-			compatible = "st,clkgen-c32";
-			reg = <0x9107000 0x1000>;
-
-			clk_s_d3_quadfs: clk-s-d3-quadfs {
-				#clock-cells = <1>;
-				compatible = "st,quadfs-d3";
-
-				clocks = <&clk_sysin>;
-			};
-
-			clk_s_d3_flexgen: clk-s-d3-flexgen {
-				#clock-cells = <1>;
-				compatible = "st,flexgen", "st,flexgen-stih407-d3";
-
-				clocks = <&clk_s_d3_quadfs 0>,
-					 <&clk_s_d3_quadfs 1>,
-					 <&clk_s_d3_quadfs 2>,
-					 <&clk_s_d3_quadfs 3>,
-					 <&clk_sysin>;
-			};
-		};
-	};
-};

---
base-commit: be5d4872e528796df9d7425f2bd9b3893eb3a42c
change-id: 20250907-master-bb115f5b67ad

Best regards,
-- 
Raphael Gallais-Pou <rgallaispou@gmail.com>


