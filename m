Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A70D2E03A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 09:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kfSJ3goGyuRaHJXch2lqsHfgL1Ebv3D8AvFeN2iYsaQ=; b=oxmRhWH+vVk7akJDU9RjB0w5KA
	tOYfapC3fk9EUlm5yTXawzGPxb98YNrd3KxVLXTeWrXBMylkYTZAl0K/DpIycEfcQDr1ADWZmjYl+
	1Q8S6LVJl5N5sDL3bGW5RDHU+opym/GsIMuBmTuuj/6x4fnBIIpAyB4MuTVTuBup/hNZGZGDKzZMB
	dOCMWTa8Scdzi40RV8sYEd1/aHW79AKJ09QZWn8aHKChzNHlGfcP5Ihqo7F7VXsQGwrz++/nvrqXg
	5y5ZeiS9GK+6aIoCPukuhhLS0VYCIFAdy10vMVfE0YGbsADGMFtmUQ9Vx/yuKCwoKDra8n7unPjEb
	iNv8olQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Xxa-0000000DrHZ-0OH6;
	Wed, 23 Oct 2024 09:47:22 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3XVG-0000000Dksk-1ezl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 09:18:07 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a99f646ff1bso781121366b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 02:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729675085; x=1730279885; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kfSJ3goGyuRaHJXch2lqsHfgL1Ebv3D8AvFeN2iYsaQ=;
        b=U6fXcNvJsMAHDwHaxduoUSWYy+DjFn7o3C6W0RG4EeE5dKY0uIIjxblIaMz4b7KmtB
         WkmC9TYF4tJ6AyA7xlJdoDBqNR+fbhsi9mo76EtWpoT+yboOWGzCA6ZpkvT/G7BFXJ8m
         6ezgyXDX+bxf1Duz2YEA80vVjzWi7ridNCmvpkc8Tie47IQxMRsUYA7A92nertpTmXjC
         Akbm0pT8UGl351sFboqta3muB5RHJZ3OBYf3xU8UpIjN3ep8zoW8UZ0Rll40BQdQcUnh
         9SWoBlo7DPHW9h7yrBglwDWvxdxFylZFA0i5dRYigU1sHjwrGo+0HJOtxAh6A4XEeGTl
         nqVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729675085; x=1730279885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kfSJ3goGyuRaHJXch2lqsHfgL1Ebv3D8AvFeN2iYsaQ=;
        b=imixY17fYcj/IHe8p6yqpiS7bfTVKksAfxYhcXizvxlemKCuBeoX5Gg0K6JttsedPC
         BiPuTu9oweFqHNl1JFvJPkF0WF3I3J0wCbNLok9nyPcjJ038JoNdnaZzWFcFATzYKLsa
         Nu0is1/yWcrz9IUZeT6ipZVbmcqbGZuLwh7B2xY/ZS5gwj4m7QKtoTcVIvs2gg3WOjs1
         yRasECRtvdscm6XIknNSn9c061nRcnsoJPMkT+GOwPgWiTj+kWWbUj8AZl7Z1H+j/ZsJ
         lDUXHPRIPC6pFGZzSzGq0D0SBkcNfhbh+D6Erhp8zN+NFMFvaM87xiSVcy/2gI3vsAZ3
         8UoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQ/Hw5PqU31fSPR/6rg9V53hPrxxDWSud8AH5XKK5pISOykmYNHKOgHh6V4GvXMwJQ0JImMHBbkKbdXikLx50L@lists.infradead.org
X-Gm-Message-State: AOJu0YxiDYVUf5b6O6+VfyYBpIQGYr4WaRsHebP+hgqLBzPBbFrDZVO0
	gbP1tXoNBJHa+OqcDCtShZvZYQOHWCBOE07kzkTHJLtzGPhfO++2
X-Google-Smtp-Source: AGHT+IGYWODJQDqAaPTqsDeOmTzV4/QsOyea2V6dUAxZoTfvJg9cVb3tOVnwjU1Btpto5hYmv1Rgog==
X-Received: by 2002:a17:907:97d6:b0:a9a:3fd8:9c95 with SMTP id a640c23a62f3a-a9abf92ccfdmr176955066b.47.1729675084716;
        Wed, 23 Oct 2024 02:18:04 -0700 (PDT)
Received: from ivaylo-T580.. ([77.85.230.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a913704easm449177466b.107.2024.10.23.02.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 02:18:04 -0700 (PDT)
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
Subject: [PATCH v2 3/5] arm64: dts: exynos8895: Add Multi Core Timer (MCT) node
Date: Wed, 23 Oct 2024 12:17:32 +0300
Message-ID: <20241023091734.538682-4-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241023091734.538682-1-ivo.ivanov.ivanov1@gmail.com>
References: <20241023091734.538682-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_021806_481123_18DEB378 
X-CRM114-Status: GOOD (  10.46  )
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

MCT has one global timer and 8 CPU local timers. The global timer
can generate 4 interrupts, and each local timer can generate an
interrupt making 12 interrupts in total.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 arch/arm64/boot/dts/exynos/exynos8895.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos8895.dtsi b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
index 54037b0dc..e6c8a4966 100644
--- a/arch/arm64/boot/dts/exynos/exynos8895.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
@@ -169,6 +169,26 @@ cmu_peris: clock-controller@10010000 {
 			clock-names = "oscclk", "bus";
 		};
 
+		timer@10040000 {
+			compatible = "samsung,exynos8895-mct",
+				     "samsung,exynos4210-mct";
+			reg = <0x10040000 0x800>;
+			clocks = <&oscclk>, <&cmu_peris CLK_GOUT_PERIS_MCT_PCLK>;
+			clock-names = "fin_pll", "mct";
+			interrupts = <GIC_SPI 455 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 457 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 459 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 460 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 463 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		gic: interrupt-controller@10201000 {
 			compatible = "arm,gic-400";
 			reg = <0x10201000 0x1000>,
-- 
2.43.0


