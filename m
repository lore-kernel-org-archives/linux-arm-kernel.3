Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F6B3CE7B12
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 14:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=edjMCTWbD64BX5sKIzjpYwFWA+LGAzfeHzBim4j35lA=; b=gUc1ZpaZpCExP85lPDiRtR3hDC
	q+p5yFcjrS5vDtRxhuVvnMgsSMxdujOjCFL3mT4e/g4q4QR/95HcLtwFjKalmgNz6f1IppJSbkT/u
	CgWj5H5UaJXt31R9oiIIKl5pwR6EQ05rQbjbJjHnS+OI9qSrCyBfITaPt9vrDNYYl4EXyrbM+U4Ki
	O/HnhlqNAOoo46VQyB2ey3sJBQhb5EQEjD78ubkjoFwMYzg4bdNGVaIuwZtDIQMN2SsJ4E0rZAk6Q
	hq4Y0h4Yt5ypXVweOLP6xlHPB/Bz6CBEhoURsvxICpwEVQr1hizzoLFXK1kOZsgCaXYO8FjsVTRO/
	Qog/dHYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJubt-0000000CL2A-0G8r;
	Fri, 14 Nov 2025 14:17:09 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJubp-0000000CKzN-1GYa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 14:17:06 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-429ce7e79f8so1595872f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 06:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763129823; x=1763734623; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=edjMCTWbD64BX5sKIzjpYwFWA+LGAzfeHzBim4j35lA=;
        b=reALyS76BRQXN94IoT+1+/KXOE1iTjn+8FN/89A7ZWAf5h1Ksg9ASGzAXxFbgEgf3P
         suvnUTr8Yb4z63qqeZIr/+rKuObJZY2cSMDZIOlOjuPtQvlNvq4jYsbdRKbUxnMT8Tve
         tlZ9TJNZ3BlKO5EaverF2qLQKMIZFvgO5Y0oVc8pMAiA0u54m0VskDmuH8h/RO54HwMv
         2QMHLoBnllnQdmH8O40BJn4ggHnHsr/3+14I2S7L29d4TWvXZxVX86MHwsGM8T4yPp96
         PxXyok5QbWDiLtJ1qpZVzPdChuffc+9GJylSFmUJbeD0icJ9mg5u8c6Vm3/j/p7lf8V5
         dkDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763129823; x=1763734623;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=edjMCTWbD64BX5sKIzjpYwFWA+LGAzfeHzBim4j35lA=;
        b=GFrLPaAonIMwW2PX+1URR6Cf+XxxcDaCZZqivp7AUpkUBmiuY9xycehX060E7XlK1g
         rRIrrkXOIb6m8l2+yLuAbaFyWAWox3hsGIjFOL1ZS28cpoKREW+pQQNH8pXnWcGtex1i
         db63h3hhvNNrWlJDSUSkW9YM8K3RlovDDbdOfuHqI84caSq2G+vBe2mPuZlzitaZR5vF
         oPYnRDQP79+hov047i3Lgi8/8pFVvJaPw9OttA8/VAuqYeexRx448dyuGnrkkeNRknh6
         LOu+GtWSJfWVq2kmy/XgwemkieKS+7n+Ir/Mxpkt+OQwHfjIqhunx4t1OWGTThsGdCSw
         TTVQ==
X-Forwarded-Encrypted: i=1; AJvYcCViY739vgwM65C1j7fOTuy6yBYu9umdFvCo8vISRif7xAtd0SAhu1spR5turiPY/GWUY48JeYrOmXV/DDF3LkbK@lists.infradead.org
X-Gm-Message-State: AOJu0YxahtcW+zdDeHCAcyzBZTgFBno+xf7mzN7s3Hv+oRbns7g+3C+P
	wtknl4uPQm7qQyxoXiAwsjn7yOGCs5FiapIo3DqCooRSyMg+xX3zQYz5O71rBSDNzZSnf7/khGl
	584/ZBL0=
X-Gm-Gg: ASbGncsgxDjUIyl0hRyWQzoJkhbM2ajZ3HfB+gaMRubfSYJIB6oEzhOZLsFXdQ6dhTq
	hgXgGksIbJOVa9V7cXubdrCTnStD3JI+axxM4UR/JWy0yxd17ewkVWSflShkYnQ80s4RsaZaM8J
	V1XNt31xN4FKaf3j458rr8uH6t7egvf96xAmdz+iX4WJtgbS1YuJf6M0ucItkXDJ5LXIEHDIbq2
	YFZQZnDY4hBRUIdsHQa5oDOx/D1GFEmD07LHKX4UqQJIUfDxJUyY7SEcLGuPragW+JoJtbYL8yt
	J9/IZZUyBDkVsfxBgvHjousa+exgc4YtQEyV95bzjqmriKwRZaebBAq50ojgXDRbtwJtRUQp9d1
	lbuh4fToFjCybCxjX6xBylAYoj3bycTNUpwkCpUjlXrLaI/flhUa3oZQmFCv2ICcl0ozmKA5tuI
	tnUiJeooF4ecTk/yNHUYkXlg8JY+E46A==
X-Google-Smtp-Source: AGHT+IHL7jYF6WGNufs+vkyuP/U+Oh47CgmLkTpkbSqQCZMz0n5GmB64VlJIPQWWhQES2TnYh0lzKg==
X-Received: by 2002:a05:6000:1ace:b0:42b:3978:1587 with SMTP id ffacd0b85a97d-42b59381be5mr3622429f8f.36.1763129823112;
        Fri, 14 Nov 2025 06:17:03 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([145.224.65.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f21948sm10150958f8f.43.2025.11.14.06.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 06:17:02 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 14 Nov 2025 14:16:49 +0000
Subject: [PATCH v5 2/4] arm64: dts: exynos: gs101: add samsung,sysreg
 property to CMU nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-automatic-clocks-v5-2-efb9202ffcd7@linaro.org>
References: <20251114-automatic-clocks-v5-0-efb9202ffcd7@linaro.org>
In-Reply-To: <20251114-automatic-clocks-v5-0-efb9202ffcd7@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2743;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=vvDiIFEQdPmovAX4ucJVT5BHyDxpJSnywN/cD8nxJX8=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpFznYdDgdArWryoZNC0/MrWhCS17nZdqxVoSZo
 s+gr5SKBWSJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaRc52AAKCRDO6LjWAjRy
 unTzEACJjrMTtBxf19XpqpgBtDyjz86m/+UVUDhvGd6wILF5z7VHYoMoTZlkroiPR0bxvPESYxu
 OzdQYB3YuizxqAdtoGu8EeDpccS/dtxrTq3c9FyaFmHcu23Y6W5cmdVBWhh8Ols6QxQDG24eXbX
 NmxJyPV38QVFWKjUgfHn1deA8n/th2NM7WPoe9T8EmJzVSehOI3Ej5trqlSIeNodZ4LKzat9ACg
 ulhJKbHa05oZ1E4A+Qp6h+6RsZ2wtU3c+4xz4QlYJbpRniJgy3j75DiqGw1g3CTOaK4a2cL1BM3
 oe3z8pX/l5G6F7LpFrYDkuN8sWULDhzArwt/eGv0O4Q0A4AJL0pqYlDlzb2+9uPvzaT3hK9hxW1
 qmLwGTV49uzv/f1qGJl+qp24mZXJ6TIDEkeziMF6PbOUXTg+3TP/RT3gdyhracN1TSSIkmK54jq
 ciepYZeeld+hRWrOukqUCEliBOs7TegJFOCQ8EFePRqX+v2xEQ9s+YcBn2rSes5VZ6jPDmi7PKC
 TqyKbWmVsqgrR+OqWpfSVAiMBURrB/Y67XnyCxasSdwscUscee8Idv2r0Ycovtvo5sscawSokUj
 SRlVHvq31ENpeC8yM3Ryz4nwCZAp4Gs/DtOfSgtFEbJIiLvNnI2jmsl1d2t2Qu66wdu/5yALgNK
 kNBZXqX+5cV4xGQ==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_061705_372282_1D9C5B5D 
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

With the exception of cmu_top, each CMU has a corresponding sysreg bank
that contains the BUSCOMPONENT_DRCG_EN and optional MEMCLK registers.
The BUSCOMPONENT_DRCG_EN register enables dynamic root clock gating of
bus components and MEMCLK gates the sram clock.

Now the clock driver supports automatic clock mode, provide the
samsung,sysreg property so the driver can enable dynamic root clock
gating of bus components and gate sram clock.

Note without the property specified the driver simply falls back to
previous behaviour of not configuring these registers so it is not an ABI
break.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes in v4:
- Update commit message (Peter)
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index d06d1d05f36408137a8acd98e43d48ea7d4f4292..c39ca4c4508f046ca16ae86be42468c7245561b8 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -578,6 +578,7 @@ cmu_misc: clock-controller@10010000 {
 			clocks = <&cmu_top CLK_DOUT_CMU_MISC_BUS>,
 				 <&cmu_top CLK_DOUT_CMU_MISC_SSS>;
 			clock-names = "bus", "sss";
+			samsung,sysreg = <&sysreg_misc>;
 		};
 
 		sysreg_misc: syscon@10030000 {
@@ -662,6 +663,7 @@ cmu_peric0: clock-controller@10800000 {
 				 <&cmu_top CLK_DOUT_CMU_PERIC0_BUS>,
 				 <&cmu_top CLK_DOUT_CMU_PERIC0_IP>;
 			clock-names = "oscclk", "bus", "ip";
+			samsung,sysreg = <&sysreg_peric0>;
 		};
 
 		sysreg_peric0: syscon@10820000 {
@@ -1208,6 +1210,7 @@ cmu_peric1: clock-controller@10c00000 {
 				 <&cmu_top CLK_DOUT_CMU_PERIC1_BUS>,
 				 <&cmu_top CLK_DOUT_CMU_PERIC1_IP>;
 			clock-names = "oscclk", "bus", "ip";
+			samsung,sysreg = <&sysreg_peric1>;
 		};
 
 		sysreg_peric1: syscon@10c20000 {
@@ -1566,6 +1569,7 @@ cmu_hsi0: clock-controller@11000000 {
 				 <&cmu_top CLK_DOUT_CMU_HSI0_USBDPDBG>;
 			clock-names = "oscclk", "bus", "dpgtc", "usb31drd",
 				      "usbdpdbg";
+			samsung,sysreg = <&sysreg_hsi0>;
 		};
 
 		sysreg_hsi0: syscon@11020000 {
@@ -1637,6 +1641,7 @@ cmu_hsi2: clock-controller@14400000 {
 				 <&cmu_top CLK_DOUT_CMU_HSI2_UFS_EMBD>,
 				 <&cmu_top CLK_DOUT_CMU_HSI2_MMC_CARD>;
 			clock-names = "oscclk", "bus", "pcie", "ufs", "mmc";
+			samsung,sysreg = <&sysreg_hsi2>;
 		};
 
 		sysreg_hsi2: syscon@14420000 {
@@ -1697,6 +1702,7 @@ cmu_apm: clock-controller@17400000 {
 
 			clocks = <&ext_24_5m>;
 			clock-names = "oscclk";
+			samsung,sysreg = <&sysreg_apm>;
 		};
 
 		sysreg_apm: syscon@17420000 {

-- 
2.52.0.rc1.455.g30608eb744-goog


