Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9939AD2E03C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 09:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JWvqM6WbSL8yBJ9uIsQs4Y6elerLACIaBhqwIy3i/lM=; b=Q9AIsnKi16pYP3Fi6qwZwb/0Us
	dfJKRGulWPubRbobz0EsrnP32xuCP/bAzCT3uWZQEVBZP3sNxF/UrnC+Zng2dI0iEJz1C/d0A3ocD
	vyXhm+EhEO3hQeEKqwZuC9SNz0rLjS3KbakNSnrAWnRQObbJ6pNopGJFJMeSplV9kYLLBlrBUBUwb
	h/LmThnmFF1Ec0X0ojMaEnnYmMa3/gS2C3Z5XFAit2L0awwYgZrtCt89R9UfA6GTk2O/F4OCj0A+n
	HmrS+YaSVDAZhdXtfobLgeMxFSfdgLa16ULhvHpis5esSBU5YWE6B7/CdCpO2HlHyo5R2NcjOs+E6
	GUpjsdMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Y0Y-0000000DrmI-1MZm;
	Wed, 23 Oct 2024 09:50:26 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3XVJ-0000000Dktk-1RkT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 09:18:10 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a9a0472306cso879346766b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 02:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729675088; x=1730279888; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JWvqM6WbSL8yBJ9uIsQs4Y6elerLACIaBhqwIy3i/lM=;
        b=VWz/zoaYuiretlJKMoCO8lzw6+fJooUMCmjMN4v83hNfEwR7MEE/ARaLfg+3UmGEZ1
         aibRI/UX+eLda2ZLHEMWyDn7qQZfDcSnMxM2eS+jrRdk49TfYLVeaXL6PR77cfftTwmc
         x+u/nCV5hB/822lr4M6KMDIn/FjnLntYg3jdjpziztEWTcFVQzbZB5x0wIRtQYL+djF2
         nnCRxcJuS5wgqUl4611PCztTlucIxpvTOeydClWwrXHbwTfVoNloyYW/hW6Cq7lKf7tP
         JWo/wAk/gUeJVqRLW4+EqMjr+S2vmDG70nKN6u82ywLnlQ4SFb3QBjYI7SeIiYrdMWef
         SDJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729675088; x=1730279888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JWvqM6WbSL8yBJ9uIsQs4Y6elerLACIaBhqwIy3i/lM=;
        b=JeXXesVowlI7DBhvroj8Z8DXsCCM+oQlF3kOYrkb1VmJyFtBzoUgkT03w55b8KbmQ0
         xbZhQwHe1O64byiGaRjUW4ESQmzbGXYJMzFuCnK4eCcpLuW00dniiGPX+IfHEq7ro2nh
         yA5pNitCfTpQLKfbW+Z0wQx6+STBL9/GjSaYixEeeZkCTSs43BBXC4DCC66QO03rkKmm
         BpK4Lt1fPce+f6es3FVzHvbL6r6Z1IsePt2DsdhoYte+crUGvyzgZxCVoQl4fPyXlrEk
         GOgQS79hC6//LbVW8lylIAXjGGGEiYOdoiT7OCKguNOcJJzkc0PGohxNqLVSLiZdPSil
         wUnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyDB8aCikELQe0Uqd+Drgvu900VhIrUVX7jS+GHsphTAXBdk5ZtyMoJy9rEdik9wS3WGKSY/UERqq4r1ep7vFy@lists.infradead.org
X-Gm-Message-State: AOJu0YzzJ6UPAGo1e+9z2B2HDBlbPPRK43vcXvNOsQ+wISTySrRXTdnI
	MmV0EreOXArZJ6w8p7lAisyKfk5Q5TBPEDIaBMgGnJ69eKeHyhs8
X-Google-Smtp-Source: AGHT+IHPZUT68y0TLIe4M7G298hT8apKCcI3+GCExQd/LS2JE80+P5LTZvCQS6qAE+vgvK7+YA2xug==
X-Received: by 2002:a17:907:94cd:b0:a99:fce4:e993 with SMTP id a640c23a62f3a-a9abf8cea42mr144608666b.39.1729675087517;
        Wed, 23 Oct 2024 02:18:07 -0700 (PDT)
Received: from ivaylo-T580.. ([77.85.230.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a913704easm449177466b.107.2024.10.23.02.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 02:18:06 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] arm64: dts: exynos8895: Add spi_0/1 nodes
Date: Wed, 23 Oct 2024 12:17:34 +0300
Message-ID: <20241023091734.538682-6-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241023091734.538682-1-ivo.ivanov.ivanov1@gmail.com>
References: <20241023091734.538682-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_021809_411516_8FF7A1E4 
X-CRM114-Status: GOOD (  11.06  )
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

Add nodes for spi_0 (SPI_CAM0) and spi_1 (SPI_CAM1), which
allows using them.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 arch/arm64/boot/dts/exynos/exynos8895.dtsi | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos8895.dtsi b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
index ad50cd4f6..ee393f4f0 100644
--- a/arch/arm64/boot/dts/exynos/exynos8895.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
@@ -282,6 +282,36 @@ pinctrl_peric1: pinctrl@10980000 {
 			interrupts = <GIC_SPI 430 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		spi_0: spi@109d0000 {
+			compatible = "samsung,exynos8895-spi",
+				     "samsung,exynos850-spi";
+			reg = <0x109d0000 0x100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_SPI_CAM0_PCLK>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_SPI_CAM0_SPI_EXT_CLK>;
+			clock-names = "spi", "spi_busclk0";
+			interrupts = <GIC_SPI 435 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&spi0_bus>;
+			pinctrl-names = "default";
+			status = "disabled";
+		};
+
+		spi_1: spi@109e0000 {
+			compatible = "samsung,exynos8895-spi",
+				     "samsung,exynos850-spi";
+			reg = <0x109e0000 0x100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_SPI_CAM1_PCLK>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_SPI_CAM1_SPI_EXT_CLK>;
+			clock-names = "spi", "spi_busclk0";
+			interrupts = <GIC_SPI 436 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&spi1_bus>;
+			pinctrl-names = "default";
+			status = "disabled";
+		};
+
 		cmu_fsys0: clock-controller@11000000 {
 			compatible = "samsung,exynos8895-cmu-fsys0";
 			reg = <0x11000000 0x8000>;
-- 
2.43.0


