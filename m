Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C2D6C02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 16:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z3dWOoof3Xw/2OHGbRzCfoAg04gz2ejhFyHKSGYevMQ=; b=oH8GUlDHJuXqgLYVXF/TqFymbm
	LZTztly+DF88WU0NU0aeI1qVEU4znF4BO1/H2YjhwdHEXdO8bEXc6yWoXKgpSx9kp4k9Zh2XV56Id
	Twz0uNSOz3nVUOJyTLVlX/oedYmFZKdKp3GNHbeVaV6pdcf7Nn27/osgRAAgEMiiKedyWdZitO69l
	u9yh5d+kubCpK6stiqC65mVNoQ6RU3YY2hPS+zrjpf8FtFy/rFmpN7zwhi3939Oh0+EEmd+fUabiX
	USbo/NVzA6FVz+i7gmIxYfiUpIjq54hDxgI13PvfGKOcGJz2XyMjr/bMYrGuqipfISKzaoIs8e0P2
	DUy4bANQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgQpY-0000000ACrn-1H74;
	Fri, 07 Feb 2025 16:03:48 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgQip-0000000ABCT-0Jlc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 15:56:52 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-38dc9eba8a1so715376f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 07:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738943809; x=1739548609; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z3dWOoof3Xw/2OHGbRzCfoAg04gz2ejhFyHKSGYevMQ=;
        b=AiHFGTCKWgCxkG59YRpL5eJ0HhdsQZO932dyWXzscck2YqMWQX3SsHlNPlepCbk1mi
         uNiRb8K2ZbgrLcxc+jO9WR2xLw5ML8sb1S1d8U7/r3sl5qzPF0hSjl0W+cA3GloJvpZR
         nBY8o938bLAASIgkf9ybzcsItGp2GD46nuP4Ht5bmwA0UooKWRj8puUR3MllnetfMJn+
         vACj9GtkTl1TYOAhabGw90PoTUgGJtIuM2SLTUkQVuWIQIPy2EJ47NuouTskslSVVfb3
         WPzeAuxEl8JOz1YpbNaB6kOrpuKs4eCm0dMXQsS5D2V68ruLHOGccrYBuCFwbH/sT9BM
         g7LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738943809; x=1739548609;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z3dWOoof3Xw/2OHGbRzCfoAg04gz2ejhFyHKSGYevMQ=;
        b=V5HBfTB/nX8efaIKVZLvtnZaoeDI1wUOewuYz92L+GBCeUyGiWl8gW7vCnQbC2bCPS
         /PfbQUQEwYW3qj6oVetderXI3pqProYJZB/JcAJBoJuNUSxFTOhVaY/ORhgTSaPSEFOo
         RaQWz2AdLsl2pxIf9jOquvs6xR4Hm9SSIYKH3qxbaWzwiHRs0sWJEBEeTcCJaj3T+GK+
         VJq6YB7qD6JTcFiDKyRRhCiOhQ0pBDsCa66RhFSZvc1Ke5ejVpAn/P+D8q+HAHhD9ypG
         sYXBUbygEjN3XTSU59w+Q4kwxxbwpEnL9t+67OH0O+b0q57JLkVFToSwZDRlB0DSySq3
         P5nA==
X-Gm-Message-State: AOJu0Yx2OJeNH1WRq90uXbLiCzj6ek6wUQzSqyGN2Auj7YoXBWNxQ7LW
	T5O5Pj5VPhrKpoaubpq6fiZ7c5Sb5Od7Q7AN7sYrrd22MJGYv/MayGNSVpn5M7A=
X-Gm-Gg: ASbGncuHoDSbu0sJg3q+s3cYt6QX5c8fAFCMCPcbVQTOEdsaIrTh3j16bKn/lTrdin2
	L86Ci/D2oTYJk7wyQ37VG/wENr+VP8R0n4Rz+lxe5IQGAKMtOFAz1eyRAupN6Rr87EL2mxCnMgE
	Ep7yALGUxaVIFH1bJ18m09Ghax6+sROEB8jJW3y3zdztZKuxzrmhrVxi9FobnMbAujlQ1L0L83f
	7/Iu5s9WSW6Rx/Z8Sdd3EKsF1tB7xsmObPaPn4PZGu1bNPjFZz2Eewq4SCzjVKhmVQZ0PWRPxeJ
	n0CI24sEkTX6EzElPzcKCQ1u71es1ZZC7yDr+OtF+9E2TdOGXmEwhhPzM1YS8+35JF3atPY=
X-Google-Smtp-Source: AGHT+IHi7d+qk0bKlKvNvtjux0Ae8ZnowO4Boe9Bx+bhD4ZewXY1Ic6zG9Cm+U7d/qkhyLu5UCqFyg==
X-Received: by 2002:a5d:6c66:0:b0:38c:2745:2dd8 with SMTP id ffacd0b85a97d-38dc9138771mr2372188f8f.37.1738943807901;
        Fri, 07 Feb 2025 07:56:47 -0800 (PST)
Received: from ta2.c.googlers.com (169.178.77.34.bc.googleusercontent.com. [34.77.178.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc09fc2d9sm4197507f8f.6.2025.02.07.07.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 07:56:47 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 07 Feb 2025 15:56:45 +0000
Subject: [PATCH v4 3/4] arm64: dts: exynos: gs101: add ACPM protocol node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-gs101-acpm-dt-v4-3-230ba8663a2d@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738943805; l=954;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=LqA0TnpriX6BG6wFMMTRQwjG15Mb4xWdLzul4jT3ckw=;
 b=DWBaLZg5xR+Gle2U+lAVVq/Oxzacpni3Vbk3bF4m1w4g94PpWCXFJwkjJtFjtSG95lUHggbvy
 nnlqQIL2mvZBPYsiLt7N1rZwTwLCF/sYW5PVuaCUUv14pSHoqCEgTg3
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_075651_117334_82E84CD3 
X-CRM114-Status: UNSURE (   9.81  )
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

Add the ACPM protocol node. ACPM protocol provides interface for all
the client drivers making use of the features offered by the
Active Power Management (APM) module.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 25ba262e3b3c..cc97c08fa9b2 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -277,6 +277,14 @@ apm_sram: sram@2039000 {
 		ranges = <0x0 0x0 0x2039000 0x40000>;
 	};
 
+	firmware {
+		acpm_ipc: power-management {
+			compatible = "google,gs101-acpm-ipc";
+			mboxes = <&ap2apm_mailbox>;
+			shmem = <&apm_sram>;
+		};
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 		#address-cells = <1>;

-- 
2.48.1.502.g6dc24dfdaf-goog


