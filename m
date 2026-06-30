Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF8DAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 09:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fAmctwTyX9ptfNTsOcFrY+BzuI2WSByIHEJFFIRpN/Y=; b=OEQB4UDZKL3asMVuWHmU4RUsQ3
	kYe9DHJVSNwk2s/0BdqK9cs7Gyj2Xy1E5nqwfXyuOEzROvRhwYIFjCsSQpNju8KwKEDghNMmUS8jR
	M95JXGLeiqTE81oNv5t6qyCHT0tqfARV5Be4SWKV7IYoWUB6ZYfuL7x1lNctnAOHSKrPFiWOs0rFx
	L5Fq7nef3e2nFaHebkQtKgCaYOYeae9TFw8q5OklfasPja4h3Beo9lgz1dvQ3tmfGXGEKCF4zcEUs
	BuiqWjq1xKnixnYLXlwczwNu0DWccC0M9fVIfux7ZqZoCNZ8n7er1UGX88F25nOC3qWfpb2f95nbi
	i5E2dYZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUjz-0000000GPYf-2URb;
	Tue, 30 Jun 2026 09:26:51 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUjt-0000000GPSj-1THG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 09:26:47 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-493bab44440so1788665e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 02:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1782811603; x=1783416403; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fAmctwTyX9ptfNTsOcFrY+BzuI2WSByIHEJFFIRpN/Y=;
        b=eJW+SjlmdiAuXumcAStaW3lRqmpR1HOfo2qo/d25+LBT5am5D9XvWUoDG5ut5L/8r9
         8PVbrG216q8I4o7Z9pobmMsS2JI0aE2Iya5n+GmJJ++DNmeaSqd34enfNoSz/KpF7O5l
         uQJdoa+QDxTMLtdCD2l9I2AukUO7bCN07cg1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782811603; x=1783416403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fAmctwTyX9ptfNTsOcFrY+BzuI2WSByIHEJFFIRpN/Y=;
        b=Dv288a/2Tm4ZgCw5dkk0/ASXe4qegfo8xb2P0ySv0ZpKHTq2qhTiujkvA5Efwa6reJ
         8AreTtJ6uRTztLJk0Jtu836X+0qR4NNqAjU+H60fU5A0wo5zpLFDnIIRDfEN9V+i1G45
         cX6JNBQktc3UxPxFbAsnp6ujtmcaJlcrKWP7rWMiE0Z7Zz8Z4pbWurWQ5C6zUUFHfwcA
         ABW1N0/oZfCbr1dh4P3ZYxf06DjpNnZN5rXYstxcDtc7WpRGhaoaTFwYNeDkPtG/pI6G
         yGzbIlZI8D4Ce87LT49Z/oT7l96oO7kWVof6a0CikUeYx/b3P6ivtNEkFraHB7LhvuZU
         UbLA==
X-Forwarded-Encrypted: i=1; AFNElJ84aN0erYhjAiaS37CLv5pCCzoGLSa3+cIx8tsLjj1ouxkwJu9BWaMDeZwDhsJQUp0MJFGO91pEZ2uDAABh2AEY@lists.infradead.org
X-Gm-Message-State: AOJu0YzOYdniQ0xYvRbZbPKTs6vy9UrSkmy9pASHZ/zKV3EjVTk3bgZ5
	+sYcm7J38/76qWXMeFd59vVX9UXQd3HfyjjNl3R2B++HqvRnr0KY2yDX1MDsVF6AFIE=
X-Gm-Gg: AfdE7cn9qfBNUNIZoBPrbLWH8RmM4thAhvQux/mcwtU0WlXmIEqJwnfLtaOQwT94aKa
	gOlOQtR0KoymTOD29DTe+HYHorKZT31DzJh6eMDeXrODgc5nWpZEtQ4FA6PjRXA0LLIEmMqjqSR
	9F7ptbAd3lmsmSR9wqY2mFm0XBG6PNAyXxO61pDqBCJWNeR0+obgnuQJ8EbTjCqGuPzgaDen/2F
	rBYK8krwNuYWWHljYSjjSLHxN//MoxPAajX/ny1yQvXOjPtmZMnYQZAW6UDUN02NT8FZuOmKcPj
	Bo8G75mhEWnIF0NmvhbKBA4SHtl/FYBZ2PNk0wvogbmgXzpc13aaW1fwOpG1UsMkIjzIOFUkkGX
	K8MZKJ0vT78GuMUZLNj8341rAbqrcyK4H0QM2bPZjcItlTkpp8CRHfsPS8Nenpm+E0a3qjQngoD
	d6yZqyqJPjBCujiLRKkJlujraoQCjs64bv4XwLDbPpq6nGE/v09kQGs8LDzIkwtw+5lMokdb/ix
	Wr4DIuha/dOvMn3r69pFflcD+tA6j0TNIYegHLIae/jNko593s+lkFvibfkzPod5t/5eWGrVciS
	kIzaWSQNPid1XQ==
X-Received: by 2002:a05:600c:6088:b0:48a:5f32:62c6 with SMTP id 5b1f17b1804b1-493bc24896cmr14463075e9.11.1782811603595;
        Tue, 30 Jun 2026 02:26:43 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47567a6f0ddsm5669083f8f.37.2026.06.30.02.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:26:43 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	francesco.utel@engicam.com,
	michael@amarulasolutions.com,
	domenico.acri@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v6 04/16] arm64: dts: st: add SDMMC2 support on stm32mp25
Date: Tue, 30 Jun 2026 11:24:33 +0200
Message-ID: <20260630092628.1695560-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630092628.1695560-1-dario.binacchi@amarulasolutions.com>
References: <20260630092628.1695560-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_022645_410412_E84CE276 
X-CRM114-Status: UNSURE (   9.76  )
X-CRM114-Notice: Please train this message.
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

The SDMMC2 controller supports SD cards, eMMC memories and SDIO devices.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v3)

Changes in v3:
- Add power-domains property. Suggested by Sashiko.

 arch/arm64/boot/dts/st/stm32mp251.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index ae36d703532c..44938c036e30 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -1668,6 +1668,22 @@ sdmmc1: mmc@48220000 {
 				status = "disabled";
 			};
 
+			sdmmc2: mmc@48230000 {
+				compatible = "st,stm32mp25-sdmmc2", "arm,pl18x", "arm,primecell";
+				arm,primecell-periphid = <0x00353180>;
+				reg = <0x48230000 0x400>, <0x44230800 0x8>;
+				interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc CK_KER_SDMMC2>;
+				clock-names = "apb_pclk";
+				resets = <&rcc SDMMC2_R>;
+				cap-sd-highspeed;
+				cap-mmc-highspeed;
+				max-frequency = <120000000>;
+				access-controllers = <&rifsc 77>;
+				power-domains = <&CLUSTER_PD>;
+				status = "disabled";
+			};
+
 			ethernet1: ethernet@482c0000 {
 				compatible = "st,stm32mp25-dwmac", "snps,dwmac-5.20";
 				reg = <0x482c0000 0x4000>;
-- 
2.43.0


