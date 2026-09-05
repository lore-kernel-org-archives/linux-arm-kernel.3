Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B8FC624D6
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 15:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n9Z1qKT7EogtF26L5TwSpOWlLsafa9aGvAtJ1Qh1QBg=; b=k6b0cwlC38JJYz6sDKoGhjp2K3
	XTUs0Xbqwh2y8H/bTlIa+rugqHOgjKIJgQFhI71BqfSViky68gllokoM7+isSA+hbFLOVotaeQUvg
	3yDXrWl61ppUiKQGi7r6AEILrfGByKrdJ1H163x3QqKzp1hyJCzBRK0RJfW/AY5M7YjvW5F6saHQs
	C4pxj67Krrlbjyay6DREO88gnXaH97hyMbpucah9bhZNgRfbKEVih1RgJJvuCMSbkrlXO4Hz8nLDY
	UWuJDoDHiTf4E6LxDLheZdi4jPrSv5H+4olQ1xJ0gajtqVilsAxD6U8GXJHJTMTsqn/M/yU/zaSnu
	1rNhjiJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2sNp-00000004CoB-2F50;
	Sat, 05 Sep 2026 15:32:45 +0000
Received: from mail-wr1-f43.google.com ([209.85.221.43])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2sNk-00000004Ciu-33fd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 15:32:42 +0000
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-482ea739de2so1330659f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Sep 2026 08:32:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788622359; x=1789227159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n9Z1qKT7EogtF26L5TwSpOWlLsafa9aGvAtJ1Qh1QBg=;
        b=dfiTSx0ebmY8tBSPgGp6Vj45jJKl6IkTC7gcrCVO24dSr05G08O46fH2QCAqHxs0RB
         aZQwKY4ddykdWS4R1zAaO+5PAH6lKQtKS/8dS4Gnf1ZCOaUgI/kPfGS3p92LrOYiQ7D0
         4psNVs5fY7M10n20tCePs/C+Ndmxv7nMihr65oPM81ImCvuqD7L6qioPfHDCw08Y7ltf
         FCRGmXKxTA1M6pbLMG21ber6EU4/CTv5PS3tZmZl1tB55sGknVEtz/UViU6bxfVUutNK
         lBmYBNA78K/r5qSPPbzOK4rIxen+87/ErHi3S2d4DFIChWdFKM1KL/OTn1TCGv+MMeXO
         AKNg==
X-Forwarded-Encrypted: i=1; AKwUvBxMBgrt4QuLnY4bSwRFGU0V9lf4kmT93fN4p6e9AubFUJ/xGU0YMI+I09NZe1ZrlnOCdoGqWKnbXtckTTNUfLzw@lists.infradead.org
X-Gm-Message-State: AFuF++nk1nDev1C3IU0hU2rnB6kZzL82ikIlYwJUUZRD29lbdUkeZiFo
	VtUXFKf3lf1xWVFpS4/2m/hXCIeryaPjf0DRSaWa7pQVhkscEaLznLGT
X-Gm-Gg: AYBFou1ewgT31ysrP2ImH/lC7T0tD6rqsROjBrVVhu/+OSnzanD6+QaI7zOkE8garrK
	VJcwJ8iXdwnVHJamVYKeETqQpEhzKUZqayowVVMZA8LqZLtI5gm8YuszdB/9OmjobRs28dYKpRA
	Z7OJV7/7MX3jdpbkb1spiMf7xNFCp9SnoyfgnkWfQUDz0OMbjZjBl4tsRSJiA7wbGKEt0WANasD
	cxkPgdmap6XzWCHS2jtlZyY1/hAgvcxshJ8cUajUx9iKf0gEC0d0n/3e2MWLPe3l7bKwvpJq8SX
	dAJ7r/DFuhu8dbgSi+TrwZ+r2TNhNzpGj9cdGGDXL0O9j1cDOS4dx9kfqbHP9WT7/gwuUk9I0Nx
	wrLn1BpD4pHQkw28OvYFPXXKX68vbvlXCDPFWMPxKL5VXRw4+IEi/Z0yjdPioJ9leJCF2p+vuAJ
	+iSmETCFzrcYfjCZm60iWhuIlxDdY12ETAC4y1WDlWpeUYkjm3a48gr/ba/KsJ4dYsbVFD65BHe
	gKc9oeRSDFzgYvNGExHVnPLRA==
X-Received: by 2002:a05:600c:a0a:b0:495:5890:8f6c with SMTP id 5b1f17b1804b1-49cf820ccdcmr130205405e9.7.1788622358693;
        Sat, 05 Sep 2026 08:32:38 -0700 (PDT)
Received: from threads.localdomain ([84.68.179.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm16691913f8f.25.2026.09.05.08.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 08:32:38 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Chuan Liu <chuan.liu@amlogic.com>,
	Jian Hu <jian.hu@amlogic.com>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] arm64: dts: amlogic: t7: add the pipeline clock to the MMC controllers
Date: Sat,  5 Sep 2026 16:32:33 +0100
Message-ID: <20260905153234.133217-4-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260905153234.133217-1-tanure@linux.com>
References: <20260905153234.133217-1-tanure@linux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_083240_796789_74F37B50 
X-CRM114-Status: GOOD (  11.26  )
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

The SD/eMMC controllers reach the DRAM through a pipeline stage that
the hardware design inserts in the bus path to the NIC_MATRIX fabric,
clocked by CLKID_SYS_AMPIPE_NAND. When that clock is disabled, a
controller that starts a DMA transfer can never complete it.

Reference the clock from the three MMC controller nodes so the driver
keeps it running, instead of relying on the clock being marked critical
in the clock controller.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index c3dc479b137d..dbb4a95652c6 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -730,8 +730,9 @@ sd_emmc_a: mmc@88000 {
 				interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clkc_periphs CLKID_SYS_SD_EMMC_A>,
 					 <&clkc_periphs CLKID_SD_EMMC_A>,
-					 <&scmi_clk CLKID_FCLK_DIV2>;
-				clock-names = "core", "clkin0", "clkin1";
+					 <&scmi_clk CLKID_FCLK_DIV2>,
+					 <&clkc_periphs CLKID_SYS_AMPIPE_NAND>;
+				clock-names = "core", "clkin0", "clkin1", "pipeline";
 				resets = <&reset RESET_SD_EMMC_A>;
 				assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_A_SEL>;
 				assigned-clock-parents = <&xtal>;
@@ -744,8 +745,9 @@ sd_emmc_b: mmc@8a000 {
 				interrupts = <GIC_SPI 177 IRQ_TYPE_EDGE_RISING>;
 				clocks = <&clkc_periphs CLKID_SYS_SD_EMMC_B>,
 					 <&clkc_periphs CLKID_SD_EMMC_B>,
-					 <&scmi_clk CLKID_FCLK_DIV2>;
-				clock-names = "core", "clkin0", "clkin1";
+					 <&scmi_clk CLKID_FCLK_DIV2>,
+					 <&clkc_periphs CLKID_SYS_AMPIPE_NAND>;
+				clock-names = "core", "clkin0", "clkin1", "pipeline";
 				resets = <&reset RESET_SD_EMMC_B>;
 				assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_B_SEL>;
 				assigned-clock-parents = <&xtal>;
@@ -758,8 +760,9 @@ sd_emmc_c: mmc@8c000 {
 				interrupts = <GIC_SPI 178 IRQ_TYPE_EDGE_RISING>;
 				clocks = <&clkc_periphs CLKID_SYS_SD_EMMC_C>,
 					 <&clkc_periphs CLKID_SD_EMMC_C>,
-					 <&scmi_clk CLKID_FCLK_DIV2>;
-				clock-names = "core", "clkin0", "clkin1";
+					 <&scmi_clk CLKID_FCLK_DIV2>,
+					 <&clkc_periphs CLKID_SYS_AMPIPE_NAND>;
+				clock-names = "core", "clkin0", "clkin1", "pipeline";
 				resets = <&reset RESET_SD_EMMC_C>;
 				assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_C_SEL>;
 				assigned-clock-parents = <&xtal>;
-- 
2.55.0


