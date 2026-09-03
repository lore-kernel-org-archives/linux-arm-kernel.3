Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32374C624D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 22:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DhGerqxK/QM75//01MhplOsQVgwGpiUbFZaCJT3sfQs=; b=s5QhcTNDX7DDM38BUMroFFsMkv
	rslsjKTKb/0YJuwBHTuPGM5K5Hiqau7WnXSHXo2IAMAfBpCwfHq/tzm+Q1NLvXf88c0ItGiw71XlQ
	uZHCcB3HQ2HqufCNAKfwvqTSRQKHUZb8suByW1dC36qRuqC7A9K4uBYWACSd9aONzSG03/LWUq77K
	7ZaD9LwCxY59bqje5AD8l3NL573k0NuTC4Zc99fOBGE1IfhOsp5YHdT5Zh9/10mbyKGafjUcKcAIA
	28Y3ZEzNd0w3KxPC23UrHcaoAQrglvZHMSJt1NVfoVoNbzgI4ZK/LfWz8xq/AWAgkzns7bITUn+47
	eC9OLUxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2GPA-00000000k23-2o90;
	Thu, 03 Sep 2026 22:59:36 +0000
Received: from mail-wr1-f47.google.com ([209.85.221.47])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2GP3-00000000jva-2XXU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 22:59:30 +0000
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-482e067e908so371859f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 15:59:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788476368; x=1789081168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DhGerqxK/QM75//01MhplOsQVgwGpiUbFZaCJT3sfQs=;
        b=PqUGp05BGRXobmestEdKwV2JE30m4D3/NaoX0kpdOP280ndVgsqX1sX88T+0DPVtaX
         T2ByqHgnmnEivXIEIYdKRNC700QPKMCb8aXhYnrNQfKWxgNjcAqLnjr5S3GnTVbJ1rzr
         EYp0QTWNV6164Ofrtn7eEvTWXbYMEG7jNdb2jVF/9OupLEfead5xslfAP0C79HDiJ3PF
         sMq18vZNW9tx2nlQgZWAMcPjaeBK9u/GlVw7POlK2UbGBELJNexxw0CWnqjyXGYKlUr+
         Z5OZx+dq4KawxKrs2Fa3NIDKSK3VrTpJiI6P04uABj/DPjxLDlCcxq9YtR7xHQXHXsNX
         r4tQ==
X-Forwarded-Encrypted: i=1; AKwUvBx4ArdtbueVSWHb8A36uhuObOfNoXnCi3rfEMvX/XG5y2BpJGLzf+GBtUOG7Abfa0adJP7nMgCMYTNioVk2x7L0@lists.infradead.org
X-Gm-Message-State: AFuF++kqK2/cjnQfaKbgdVNB15QbefF4lrkSvRSiyF3ALa+Dn2GtDzo0
	wBA+qkkLEh5WOFwOn6/c+pyYh/AELGlfryyLNiXQKyq1RdljTFMNT+Oq
X-Gm-Gg: AYBFou1Aez1AVw84y3MPEfzkJVeGdxRJqOuKXLL1zOezPhSNNxL9L6NR6FWvr8lzfp2
	0NCnJ79Tgw0F3EQlCTwWvFYwLeNR3K8D+P18qUw7K4ZWXxFwJVCcI/R/Ojs6iMrJ66scGM3vQOw
	PAkTi3tfvbhNjqUHYRowFprP3EE3ScU27Au1VSFJXkTX6C102CJaa4CyxU6BO8BFZu36rmtIaN1
	t0atHkiS8S1so06mlPhsCgk5o4z0avj9AuV14ivzyPM/2nTlffP+oPpQlTpV02CmwEMW0kxlRYY
	Ba5414xvrl1ACBLlvzsqRhVgllP//oMLDbx1tTufJqwmRrphs1z9JfS8WpQWN6WzTLsDPm+3IBI
	YkgSYszFBrBpKQ4jPeEW5zLi7J59kpsxkKx61nPpETwJAfJJLPBZ3h0VIv94KZYSHwnXwQavciD
	rvB2xzunVKlAP4M1nVXGQkAHBKxiCvrd8+/nlan5Tl66N+4xSYC4Qo3xvWlG+3d8r3Ev69KuUn1
	NuqzaVUEMqV1ia+aXYOFuhwhQ==
X-Received: by 2002:a5d:5f51:0:b0:485:8a46:704b with SMTP id ffacd0b85a97d-4858a467215mr292343f8f.29.1788476367923;
        Thu, 03 Sep 2026 15:59:27 -0700 (PDT)
Received: from threads.localdomain ([84.68.179.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885c5bbdsm1686142f8f.36.2026.09.03.15.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 15:59:27 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Claude Fable 5 <noreply@anthropic.com>
Subject: [PATCH 3/4] arm64: dts: amlogic: t7: add the pipeline clock to the MMC controllers
Date: Thu,  3 Sep 2026 23:59:20 +0100
Message-ID: <20260903225921.2290441-4-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903225921.2290441-1-tanure@linux.com>
References: <20260903225921.2290441-1-tanure@linux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_155929_664966_3816D97A 
X-CRM114-Status: GOOD (  11.91  )
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

Assisted-by: Claude Fable 5 <noreply@anthropic.com>
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 719e111bc3dd..8f3f1c0579a0 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -762,8 +762,9 @@ sd_emmc_a: mmc@88000 {
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
@@ -776,8 +777,9 @@ sd_emmc_b: mmc@8a000 {
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
@@ -790,8 +792,9 @@ sd_emmc_c: mmc@8c000 {
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


