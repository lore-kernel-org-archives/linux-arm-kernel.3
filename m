Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93402CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 12:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pb2pqqKjiQQF/REmK83pr0aP945mNb4ceVK9gk57rPM=; b=VC37393bJvbjx4ahHjNULM/b0U
	9XADWC8x9uiOu/OD2kdMoeHK1bu4YVzbyJMeyrRR3Y7x/BPf+caPCqI0CmKXtE29aAI7wTcILf4Lv
	bLrhspwzHJxGgvgY3R8vvAFrqviO6MLggEg1YJXFlDBkocz3IycuLpOpsBd+n8LIWPRZrh3a4r/oE
	G3SnHXkNW4m47eJDueZGqJCo1v6USJPWLup47881xFvZgGrwX/MFpVaDDLDziw4Irih285CSFCTXU
	vneLeTvL7BwfLBSQlK4sG9zfnhLLulmxJyctUIWmdJjIxgviaLKF0HqGBCCtoVwycqlg2j+fb2ndu
	hJiO7Efw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEog1-000000067XF-1XpH;
	Fri, 31 Oct 2025 12:56:21 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEoft-000000067QK-2dZk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 12:56:14 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4710a1f9e4cso18165565e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 05:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761915372; x=1762520172; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pb2pqqKjiQQF/REmK83pr0aP945mNb4ceVK9gk57rPM=;
        b=t8vaJv1zxX4Uin9yI3SGsBcawFdHI3HoWn6DBv29EJr/HQP/ztMuWXMk8N009oZx7J
         IWLAvRTJj3nBecc4WKCm9916IDSqrbpqmnyPaPQLNGjL0Oe0jqdHTQecy++aXUmvideL
         kGkzBUugJL3a3sTlcvrk+GYtI3DbxSR2/kD9Md7h982favVvet4xPsri6TP+aucsoe3E
         5RD3eXIuUn8Rj2MIffOM+9KIaRnX1wtElPg2vqq47J2aPXqaZMGQs4uZ1h0Ox/oRCGL7
         tPhQb8fUNTLMxiYI07PcLg3p0luuCpXbv8k4mSViumekenOcf2hYcs42PmGh32uqYJov
         p3+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761915372; x=1762520172;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pb2pqqKjiQQF/REmK83pr0aP945mNb4ceVK9gk57rPM=;
        b=ZrAwuhsSQc2eUtYG2c1d7by3v4KdwNsSq59ZfGKB9QJ0oXWbnZ0ctkEQ8MKRxl5BIl
         uNkxCc67+4iijggOaFt+dT5WW85N5Sl0Qa5cIq+Xyn6W9F27SgvC2Jv0zRHBSzrDOW3D
         4eMSn/Szor+HOpzj3CFT3PaggGEb9wImMPccqa0XG07wZPUw5gmwM2uj+6RBsbd7IsUn
         8N0wUPzzcZ0BIaf2m5ym2peWqex1Pwg5BWUe2cWGGW6ZFfnS/fDHkVZ5FlEwMPMrEoSm
         NQ8sUAbcRBWjjZcozpquRxCASWV4ujBAVWraKPbOS6PBITK1weS+gptI3cCW2HsWiUVF
         NPUg==
X-Forwarded-Encrypted: i=1; AJvYcCULQS8d0Fj+XswpPx9Lodhbmq+Nu1cJHVpt4gvQOwJcYWd28hihybQxN8ien1odmLrcItc3JIYR5b8EUKTOiABq@lists.infradead.org
X-Gm-Message-State: AOJu0YyW1/EgRiWF5A6ibPp6oAHEu0e/5F7xtQtFW7ZBteV3Nasu+VOW
	Bu24EvmfhFRhtRmjPmFfTBwgF2lPXZaaML9+xb6Uwsny1w456Y0z0hErLeFkOEJUBfg=
X-Gm-Gg: ASbGncuyeB+PJkSI8wYQEVaTuzmO2QFOraZMlDYZNJGPJ+FguWLsoaFekIeaBRMXvaT
	96s+VTyqEbYuf+SW9ZQee8OQ9NJtjuV9DLyvp844ylUoBaTIZJKeaAVdJNvECT6UTlxjZzSkClv
	f3HaZcmClnMC7jm2iO+XvqptuZiblO3ShAygO5D8KdZ6k96LgV1syFdyH95BpVYDKUKg/lykfEB
	G3gEzLm+0J91hGnl7o+tzdWAvEbJiTsYLbHQBRuZOmaSQII/g0NkhE/sSiMq8BWjSbZH1Fm66rU
	fWa0YjTdV7X5YVqrKdgCtoZjrwIvO+MTa8U41NVrbqy6poLVdNTqU9v/ujoSxrEKnnnk7cKQp96
	BszMUiavXgN68kJoR+/BtfgY65yYrzPHtj6DfV4Y3yZ+HA/Qmwcf1woH7PV1Zruy8jODSHV/P7e
	OWIop2uN8l4wbTBUzNdOV76jsXq3A3IFftmCzCxgV/YEHqm/tPL9gUvfHCCKb8E9o=
X-Google-Smtp-Source: AGHT+IFe9Oi7mS4HMXpo7MbmxHbms/ri8FM7ao6gprXy7xsckpCCyc1QnNO/QiFb7+3HO3HyI8NMYg==
X-Received: by 2002:a05:600c:530f:b0:46f:b327:ecfb with SMTP id 5b1f17b1804b1-4773082d988mr30938645e9.9.1761915371964;
        Fri, 31 Oct 2025 05:56:11 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47732fe1075sm31814585e9.11.2025.10.31.05.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 05:56:11 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 31 Oct 2025 12:56:09 +0000
Subject: [PATCH 10/11] arm64: dts: exynos: gs101: add the chipid node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-gs101-chipid-v1-10-d78d1076b210@linaro.org>
References: <20251031-gs101-chipid-v1-0-d78d1076b210@linaro.org>
In-Reply-To: <20251031-gs101-chipid-v1-0-d78d1076b210@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761915362; l=805;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=6z7Q0cvkHq4tbrD8eYT1HprLcsjew57f94vW5406IBU=;
 b=yYQOtlOsyfkQ+MckjcC3btLUJDkAj1qpgBndKzNfjoyKIYZHO8SXE786LHd7AVTIyfk2xLLcu
 xQlA5cf1F31D9ReKrE2i5sQrvXX/xPObullG3soA9LrWoUzwPegkidt
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_055613_689842_F2230DA6 
X-CRM114-Status: UNSURE (   8.79  )
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

Add the chipid node.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index d06d1d05f36408137a8acd98e43d48ea7d4f4292..11622da2d46ff257b447a3dfdc98abdf29a45b9a 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -467,6 +467,12 @@ opp-2802000000 {
 		};
 	};
 
+	chipid {
+		compatible = "google,gs101-chipid";
+		nvmem-cells = <&product_id>, <&chip_id>;
+		nvmem-cell-names = "product-id", "chip-id";
+	};
+
 	/* ect node is required to be present by bootloader */
 	ect {
 	};

-- 
2.51.1.930.gacf6e81ea2-goog


