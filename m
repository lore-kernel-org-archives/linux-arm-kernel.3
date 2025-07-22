Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E21DEC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 13:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bb0r5Zm6I8Szf8jWYWHBvZVhi8hKX4btISpujVINzRY=; b=4gdvCDsb+okV5ZWqvNz6GajhH6
	drDJCu3wIiI5uhWczpWNRx1plJWXfZdMPgwPu0lFgLmpB50+XU4gea2r6QYnO/ISGNA7Ot3Cr3sjX
	F6IXhURDrXvq6rYKn9RClcBUoc6s7E43KVNhFiQxHuMEIbIui8e9QBUOsjx087eZn5sKHYCHJmGpx
	d2IARli/jpuWkLVNW9AYcJRksnIRg6pVSN7onm6npvPL6yuEoiB2gZCSdainR5G1sg1nJk69JkOCD
	ZTut5TfTajlMClPc2PzegmgKdZCvtZwA/FdWHPjXMpNpJI61XUlW2gqws65kTodooUS767inGcjwT
	GU/N/xfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueCyR-00000002XUH-2fTp;
	Tue, 22 Jul 2025 13:24:03 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueC2I-00000002QCV-33PV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 12:23:59 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-ae3703c2a8bso954260266b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Jul 2025 05:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753187037; x=1753791837; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bb0r5Zm6I8Szf8jWYWHBvZVhi8hKX4btISpujVINzRY=;
        b=iIM6M7D7Ko1MPztfec1GWSaXLncaCGSEGZggAn82d59f+UpLf38cZSe1WuVNlknqJb
         YR+Y3OyPwdEqz+N0edQ6vGWhgnr9maiasn0+y09MnVAUmp3vqBMfkbIJvpXfFyR53bk9
         rqB/61HLGvlQ/9pHColoo7PZQ+39jk+ixCy9S8gzE2gyXHU+xPLkwpwCY/sn0N5bfzo0
         JR1XESjEb52YopqY0SSwfifdsi7xLE4N1mpl9vMYMoB+KrlDy2mjn9lo3UboL0XL9aQ6
         jzMtTyNcqfambKrgLWU0AeTN4Y1975fe+hcYGnKOMiJ91OaTBapBFOvj3mnikIDyBooi
         WCfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753187037; x=1753791837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bb0r5Zm6I8Szf8jWYWHBvZVhi8hKX4btISpujVINzRY=;
        b=VpqeuErQNu6qNtbze87wxOGLkQhkzPaLNP3NU4F7C/VZD7obAUW5NGerE7lRehkC0u
         BIa97GP7Pbif2B252hOYmUhHoKO2uqjxbZt+yZLZeYFM9uY55hVXWMPJB8n9xV5Stuue
         ZP78/KJHN7kuJRe3GPovOGskvBTmOZYoHExdxmdWXHV1iEbhblUX03RflI2F++S2PHWk
         6QzrD49MHPwF39dJ3dCKnr0V4hyEPcv9szjlkYMDM/BPGS1ePih7+yUNaSy2G2hSk7rp
         TdvjmnKX7NEupBHFrWb4LhfkuNu2mHC7DVBMSS3VyX/wDKXHJo/7y9eMldRm4K8lVXMG
         6dNg==
X-Forwarded-Encrypted: i=1; AJvYcCXaoK/NXQbp1RrLQKaLhM6M59xTU/Dzm/x5y6/TfBk3FgtVYEusWoSJeL+VdAMznTIk4PX2X01Qn7cwMEdQvFva@lists.infradead.org
X-Gm-Message-State: AOJu0YxYLRL98GEmqVIWGiWcLMvWosiLzCsq/MH0usETxLLlzz1q4LZK
	Ez0yQHetInj3N56Yyr0wm6nTBh4g/aNJl7/BCsDIOzO3sWy1uVPT3w5h
X-Gm-Gg: ASbGncu3zpRnJ0Toc7gx68fyq8NDI3E8mRybyLXZSkg3AkVo0gJw25/Wch2DMFhqe4p
	KJiVNWCSYIG/zbnKYC0+w07Gw1Rbmwakm8Co6H7/pE7sTKdGGGtmgoqOKM2o/nciPIfpkh6M7IW
	0jdAwJN1xAWejQXvgTU5f+/YUGOb3MVY6CXbgDwEQmXEAvfv46iXey6Y3j6bxct/3ifbBPGltlu
	fagAveB8odPSAm86yeMSZXQwiHjpK6zp/Kmt4p/iHMAE0nbqpPf+EjHbFW+4cKoDzuZPlAxXHkp
	ZCwLd+MSNugFg3R44T2A4NrY4EZYqRK+F+HYKcjwRr7bwkgyZxL/OX6MOGOTQNurjMIM1U/spNM
	EE/+ztWtGH+7w7WSo0cSG/ONyUF+uwhoYzUxONwJGhQbOAzCvE3ieVtXk7fyA99Y61RB3nLQ+5Q
	==
X-Google-Smtp-Source: AGHT+IF+NKTSzIYSgh6nyT2wXOJlD/Wp8WpRnKhaJeDZaSgHyAa7CqtI6ndxuhg7gUyHY3hN1foHLQ==
X-Received: by 2002:a17:906:9f91:b0:ae0:ce90:4b6c with SMTP id a640c23a62f3a-aec6a623c37mr1731618166b.49.1753187036792;
        Tue, 22 Jul 2025 05:23:56 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c79a056sm861358466b.14.2025.07.22.05.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 05:23:56 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/4] arm64: dts: exynos2200: fix typo in hsi2c23 bus pins label
Date: Tue, 22 Jul 2025 15:23:47 +0300
Message-ID: <20250722122350.444019-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250722122350.444019-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250722122350.444019-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_052358_767370_F6099CE6 
X-CRM114-Status: GOOD (  11.93  )
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

The '2' in 'hsi2c23' was missed while making the device tree. Fix that so
we can properly reference the node.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi
index f618ff290..5877da7ba 100644
--- a/arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi
@@ -1438,7 +1438,7 @@ i3c11_bus: i3c11-bus-pins {
 		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
 	};
 
-	hsi223_bus: hsi2c23-bus-pins {
+	hsi2c23_bus: hsi2c23-bus-pins {
 		samsung,pins = "gpp11-2", "gpp11-3";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
-- 
2.43.0


