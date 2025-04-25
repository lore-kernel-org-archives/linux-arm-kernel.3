Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21CF3C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 14:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3/rwz0LBVxX8dQciGKZqxZOjxzzbTePOJod0t/Mvhpo=; b=mXztCqYbyJFPfe5Ud2jaF+WEMy
	eFJmcfIhhEJHWQM1RQ87aC4EEMFeUisjCytQ3LrLH7ZkXiaQAWr7oczTtHA6fiU3kkIRh8HugmLAZ
	KO8hHGaMITJekR7r3bomOsouo+1RWBewxrVp5Lt6tQSl8dm5oQP1OhvjPtvJq/IR1VMKBOrPCVaCT
	R/h6kLjAe6w6BeYKXAqwucVu4hA5amy1h04MFLHd24VEtUymqC5tuFf/qSJLnr/tYLrIV0WjdqTKa
	kP4yWCytOLNM0GIGPL+oPujtUZfxszNcGjPbJ3rmcopmhQnAiR+b4IWqy+PsyIwjLE4eitt2gXYAM
	mOuxIH9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8JvN-0000000HQ0v-1HTb;
	Fri, 25 Apr 2025 14:21:05 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8J61-0000000HHBd-2LeV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 13:28:02 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-309f3bf23b8so1784241a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 06:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745587681; x=1746192481; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3/rwz0LBVxX8dQciGKZqxZOjxzzbTePOJod0t/Mvhpo=;
        b=SUYQm6S1CTAVO7B5JKLbHzY0tAOmoPbO+8ud0FSfScf5jn+txiV6NADMqSvi++pvk4
         qgeSNNGJVgPkUr0eUIzUKRnoh/debuDpKgZpgllY6/E2VZYhcVj4fUOO+rN5ryN3IQLc
         141hSePJzJBagI6pLyN2uJsvoet+abNojivkgLuazfVSJ4cx2HN7AIG8u1wtvV3ATPo2
         o1lLfUOtMfEI3F9AGTpKz2TwlT17n7CNkEdsgJq8HvGyYhYo62FI9TDkV4w/Vh9Vuy3u
         rGgTup+qq6Y0iZutq7CSPASUoBP8ItmceQMIzTv8zhKWyH8F5I2V0mECwQU0xDdVWirY
         lcog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745587681; x=1746192481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3/rwz0LBVxX8dQciGKZqxZOjxzzbTePOJod0t/Mvhpo=;
        b=FJ1Ig3IL03mnBVs3o0XJFsTJiqQsSrFEbt0OsaPRWr2siHK+s+NWNRapEei7IT50xd
         p2vOIbl5E6AUyrrJgyCR4oyjTtiG6+emYAWwO1dWMEdKHmxi/7oikfTInx3ETJx+gRAm
         9guXoMIR010bdBi6lX7PwOAoy93B6nnRFmtubei5lxesHTdQje+cHf2LTBgslAU4SMsq
         BpkYFJN2wyem6qNqcFfuORYob1oO5uw50SAMdyiOk2Cu/UKkiRtd6d9YZq8NrTqFUs4M
         a5zlEob9BjJnd5PQcyqN13vN67PNv7boV8kEsJZHNa1rQ6iDDV/YskG5MUFjXXgx2LaL
         nNvA==
X-Forwarded-Encrypted: i=1; AJvYcCWood5u7nsF8UdtKSZJ003OzNsEvkPma5/166pufBzSjfPMqpQ6ETZCL0eszvYZhqCuyJGjyTwS86K29DWQa4LR@lists.infradead.org
X-Gm-Message-State: AOJu0YzkASP+motR3GRuZ/fKqzhUQ0xu/2Ha8EB3Pc4/gQTsv+r1mZGq
	DuKheVQuh0QPDyKf/S0CSwkr10y5x5GfG4eqoEabBSSLzV8CR/NL
X-Gm-Gg: ASbGncs65EkhoXQXzDeqRqbM8qhwKnWi+Wdtl9Hj4CeIy3X/jewE2rJWHdCEhBVw+eK
	qkPivAWnMb+qxNGU0kgG1zfWbYSPQRPoBVo8aqCQAeRzLUi77Ea+jl0YUwqrkSm17ObNMhwQF9z
	4UXs68/bsVJz79NPJI0tBKQ0OZoVM/Su3xKKvy4n6m4mklyTakITN4pMLQ40jSXQdvIjFhCG4Lx
	Pqczi7/75dYKQa7loXZWREq2AdOmR1g6SRY4xKCPT9Aap1nNib7BtvsX8NQpK1PJwptezwuYPLY
	kH0U9UpJCG9lKpgqCC5xH7n9gSlA4cWvgIb3Cnq6pg92ww+6f8IZJg==
X-Google-Smtp-Source: AGHT+IGykUnFwi9vJFShvrAmDEHYOLtn/JAzsUWpn67Vgk7sIGoof9b7Af7D2CTZMEiJNgM6UmdfxA==
X-Received: by 2002:a17:90b:2b86:b0:2ee:9e06:7db0 with SMTP id 98e67ed59e1d1-309f7ddfe5fmr3852489a91.11.1745587680841;
        Fri, 25 Apr 2025 06:28:00 -0700 (PDT)
Received: from localhost.localdomain ([110.44.101.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f7752a03sm1564313a91.18.2025.04.25.06.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 06:28:00 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-kernel@vger.kernel.org (open list:MAXIM PMIC AND MUIC DRIVERS FOR EXYNOS BASED BO...),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES),
	linux-samsung-soc@vger.kernel.org (open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v1 02/10] ARM: dts: exynos: Add rtc clock definitions for MAX77686 PMIC for Exynos4412 Odroid
Date: Fri, 25 Apr 2025 18:56:22 +0530
Message-ID: <20250425132727.5160-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425132727.5160-1-linux.amoon@gmail.com>
References: <20250425132727.5160-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_062801_594270_41177513 
X-CRM114-Status: GOOD (  15.07  )
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

The MAX77686A includes a crystal driver with an external load capacitance.
When enabled, the crystal driver starts in low power mode. The
LowJitterMode bit controls the crystal driver, allowing it to switch
between low power mode and low jitter mode (high power mode).
Setting the LowJitterMode bit to 1 activates low jitter mode on
three channels simultaneously. These three 32khz buffer outputs
(32KHAP, 32KHCP, P32KH) are independently enabled/disabled over I2C.

The 32khz_ap output is typically routed to the AP Processor, while the
32khz_cp and 32khz_pmic outputs are intended for BT, WLAN, BB,
or peripheral chipsets.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm/boot/dts/samsung/exynos4412-odroid-common.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/samsung/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/samsung/exynos4412-odroid-common.dtsi
index 93ddbd4b0a18..03943c666d11 100644
--- a/arch/arm/boot/dts/samsung/exynos4412-odroid-common.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4412-odroid-common.dtsi
@@ -289,6 +289,13 @@ max77686: pmic@9 {
 		reg = <0x09>;
 		#clock-cells = <1>;
 
+		max77686_osc: clocks {
+			compatible = "max77686-rtc";
+			#clock-cells = <1>;
+			clock-output-names = "32khz_ap",
+				"32khz_cp", "32khz_pmic";
+		};
+
 		voltage-regulators {
 			ldo1_reg: LDO1 {
 				regulator-name = "VDD_ALIVE_1.0V";
-- 
2.49.0


