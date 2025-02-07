Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D7AC02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 15:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xDJPIIRI6GLKY+Zyqq8NOfeinTkGodpwbMUhAI5OLLM=; b=m68QknUan51sOaZQk47noHpxhm
	mZ7RFoxIa/JKvz2nhQGVbX3Skmct+x3zLgOixF76O8QeWuyS0shzBKhoNJpDBTOd5kKs1OJQgmBBR
	y4DfInHx8u4JoLr6MkrUEuh6dABnqME+AhMNlBTBCO4Js5t0xHfujZicWO6AT1+aSpWriLYae2BYN
	mSxCjNkS/4yZDaIgnN5TqZGxXdcy+a5P5Rb8yHFskApnpD3rmuxQtPsskkGH4zbyI25lh6uLgDCSV
	t/yHW0dwKm4vVdY8nGn1SJdFD0zs4jNQEe19dNgPVSXWp8da2RAF3DA4oxMZjO0GxSFmKidyz5s+c
	MupUnoHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgQlV-0000000AC1H-2qru;
	Fri, 07 Feb 2025 15:59:37 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgQil-0000000ABBC-3zwf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 15:56:49 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-38dc8b5bb0bso558326f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 07:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738943806; x=1739548606; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xDJPIIRI6GLKY+Zyqq8NOfeinTkGodpwbMUhAI5OLLM=;
        b=RMYoB/+5HxD/u3ekkA3X+Jyy8RC3Qg89YmiVqEK+lItBrx7tza2Ft4geUyNRs2IhRV
         181o488VQnXjNhO1bR7zANj447nCxWHDxcKuZmVZF68EYS6HjPOl1kzWI1QfNdCE4fEF
         DyrdVxNFboDlpsF7OrNs0L7CSm7BOXYl4Q2N8Q4qPbgKDDRKpu3VMKOVpm3qXF1WekgM
         6MrharVSH4QMYkaXwDdtzHdDRgKwHTzWLdPucn8POZdnVBRXoxWOTPsZ5jI54r34FZG3
         1oh/xQgoqdzszAWa1r5QjuFoAfN55Y4CFldFqOUEOsPnbynuy1n8LJOc5gZs22dy7Acp
         lM+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738943806; x=1739548606;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xDJPIIRI6GLKY+Zyqq8NOfeinTkGodpwbMUhAI5OLLM=;
        b=lzIrzZ6sRA7te8MZejx+cxhMEGMQMA36knjozBEavsMFs0ztA4DMPH8Xan145cAdCB
         Ch/wnqU5OhAYDhbDpmZl+3RmWUchWbYpQmKR27/VRnpE8iEO1YVXruAWhgsC8SRj7ia0
         /ap+MKZmDP1Cfu2+dHfCUOi7Q5K7ewIKi2d9vEAheQ7LSw6Pg3G/JA/HLpz6b2dXHrEQ
         FAjX2TOJorvMa5LSynsm6rZYZSeHv8CDrBBNJDl1Uk0ZDfTuJX101tPRkcJBhD+QJ5QE
         utO0+KIIwm9fFrwczw4+FxLCkMgQaxGaPAYEgZXFB6PzGIDhzRF0y9MKt/juKkrl1Pf8
         htlg==
X-Gm-Message-State: AOJu0YxI+Qn74hojFMoU8ARLRVQrE84AK0u5jRS1218ynupU4nBXcaXe
	epzL0MKBphfdhMxg1xKa6B9Y5GWK1MdH/k4NDybxensY4cCu5oKwMtq1OrdcJi8+TbHihsH1k1r
	LZ24=
X-Gm-Gg: ASbGnctE/Di+rXK/lNwRv6zUYDzCMYF8xLqvSU2B80xYh0HI31eH3cCQRWuuE482uPP
	Kf0EFmSAT+scMCI5C2toA2MiS3xXGcz9zILe8wDirraksRgeDPaPKpYYRWz3ITVsyOd5pUOFITV
	whnrAq52HgSKQO5bdU3okoIbNWeEuXwHUgBA/SAA8YOcA/kGeoDPDrWm+dulDN+HfnDOJjbvPru
	S2McP5vpGW4YVUTvt9k7zCKHNgjSXn9h1prYjKh0dRahJjb1uH0BCdB2S8evHrx1FmdlTGSWJE0
	CHoVy7VSggMbIzxwsiOyyuzTt/0NPRYmubvQ/guEJBOiA30ABVJI8ovTd7LcrQR/QDDWnJQ=
X-Google-Smtp-Source: AGHT+IHnKFv0qsVS5sklaHz1Yd7IBiDcXh/yMTaA/ZuLIr7eWFDaCoBMx4syf1mCNT3/xbSNPX0bQw==
X-Received: by 2002:a5d:6dab:0:b0:38d:c600:ad30 with SMTP id ffacd0b85a97d-38dc937461dmr3251623f8f.40.1738943806441;
        Fri, 07 Feb 2025 07:56:46 -0800 (PST)
Received: from ta2.c.googlers.com (169.178.77.34.bc.googleusercontent.com. [34.77.178.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc09fc2d9sm4197507f8f.6.2025.02.07.07.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 07:56:46 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 07 Feb 2025 15:56:43 +0000
Subject: [PATCH v4 1/4] arm64: dts: exynos: gs101: add SRAM node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-gs101-acpm-dt-v4-1-230ba8663a2d@linaro.org>
References: <20250207-gs101-acpm-dt-v4-0-230ba8663a2d@linaro.org>
In-Reply-To: <20250207-gs101-acpm-dt-v4-0-230ba8663a2d@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
 peter.griffin@linaro.org, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738943805; l=979;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=gLGpUaEfuGzvyJ3L21mz+M8nf5rblyz9ev0wDFYPZyI=;
 b=W+YHCJGY2GIXCUKGut3Wfq+1GKcVPMtY2lKeBH1krh5h4o/lXoE38WAw1arV4/Dsph/OOfBF0
 hjqR38r5uj9A+fc2ySsi4yNFJXljZTKwquPyuW0/YhFHH+hN/sGvmuM
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_075647_996182_9C310192 
X-CRM114-Status: GOOD (  10.19  )
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

SRAM is used by the ACPM protocol to retrieve the ACPM channels
information, which includes the TX/RX rings among other channel
configuration data. Add the SRAM node.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index c5335dd59dfe..798ed7b4c4c6 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -269,6 +269,14 @@ bldr_log_hist_reserved: bldr-log-hist-reserved@fd900000 {
 		};
 	};
 
+	apm_sram: sram@2039000 {
+		compatible = "mmio-sram";
+		reg = <0x0 0x2039000 0x40000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x0 0x2039000 0x40000>;
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 		#address-cells = <1>;

-- 
2.48.1.502.g6dc24dfdaf-goog


