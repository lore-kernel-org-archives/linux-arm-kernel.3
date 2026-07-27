Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92CF4C53219
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 08:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6y8Hcxg9MXxS8AWcFY2VAmn1cCgVHpq4caMsrXoFzEI=; b=0UQVoydNK/DMdrsuOGSkSd0iaq
	+48z7GG31+ktvcINYHG42qul+ClL/RL2VHvIPACpwvQoqfmJxDZh7RGCZGrvrISZxdRR3hkBQmkJy
	kHyj0/M8KLfPgQ+g9uT3G9Di/KzlBMhvvdgwrrfLcyEQ4yiCzC1zYWqpSzeeiLEZohpsDAcS5OXqY
	gjqYJPAiVZnmM7l21mkIcc4U7LFwNqOdtmESlwFnX2G2RoYS79uiS9G2W08J8X9YkD6GGA9iD/jYe
	gr4/FYl1i6iPQ+IPQKL/ai8yn3SO3xZoG6FsMG5ckex6osioAv43On0ood1qwu4X7/h1OD3EF4GOq
	8orQ+/7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woGZW-00000002Dlk-3W1C;
	Mon, 27 Jul 2026 08:20:26 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woGZI-00000002Dep-00Sv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 08:20:13 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-38e041ea211so2505261a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 01:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785140411; x=1785745211; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6y8Hcxg9MXxS8AWcFY2VAmn1cCgVHpq4caMsrXoFzEI=;
        b=fIAPX7rHloohARFTU17FgQ9u/aztsEEdejGGakZQbicMcWjy483Lf7Sk2VqkH20FcT
         b8cmH0YCirQiFb9qmu2fXFrCMmYfXhBOGRpvaL9Ac34fKZvb+vJr/DgQWfzpoem8JTrr
         vtGnfql/7J/SxaiuVp0O+vXmKuDliGLLiaMawD49B67dfVqp6TnJD5al668Q0iuq+IBB
         nwQz4Ss9iSbv0OkMlSN3aMoLVvh7p8kCIiZW39ZGRTO+7jEuF0TUEB108GN8ASKIYbHf
         NErP1zAch6ZLFD9juDCqPusiasa30mQ2jfAAMGzXmEW6cbthYYYCH3jZEAJ4DD0L/fsc
         WJ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785140411; x=1785745211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6y8Hcxg9MXxS8AWcFY2VAmn1cCgVHpq4caMsrXoFzEI=;
        b=Bx4hZfiZ9vta5tRT8T+5tnFHojHIp3MJVMeuunjMgWwGXpK9BWrJhwu3StaEY4Ersw
         2EOmJD9VTlvy2z6PEunZ57p3I7kTuxT0zNOizWPAhk01nVC7NAJ7GhHwP9wsFbt9jh3U
         iz6mxjXqVrRZ6xEixHOwe/PYUl6TmtVLDIP8qCLCjZh8nPicYPjU/lh015S9K05MxxoJ
         bLQMucLXN2t4ys/fEefO/QVOO+LNmK6BKApag1EOU72kaDLDKa+/WQrQUGQyIGhTk8pc
         JdUV/JUqH2ZTA8n7iKl1xMW91fZDe37Ml48VWhMa/oTJ5rwnBbbI7KZJNl5LNV+G2wdV
         o3GA==
X-Forwarded-Encrypted: i=1; AHgh+RqkoRXpm7p9c0HuH2LKoj/ZY6mFnUNxMg3AEmq4Tz/vtvxqT4FOFRqpyNbwj7S2EuZsuyRcJX59joeGSsANh59U@lists.infradead.org
X-Gm-Message-State: AOJu0YwDiwQhfP7kPuNwtDxMqgM7F3swQO156lxSlSjUODVrQzx6Voij
	9bcmZTcnvbZNcA91VYOCumr/FBnYrR0hQsO1NF2mDxxDETI7ZDPzF3Q1
X-Gm-Gg: AR+sD10ocndQRQGCM51b2HUpl/X6vyKZU4n7rNL1rVaf5on1TjB+G2Tk0dkucO6ASeY
	5+XxqwgJuj2keKXHHxZ7L+h+MR6GiosLAPWpl3pSUXiCqGoTWzXppjdCy7Cj96/eMYTuo0DX/9X
	cfFiEjR+SW5frXQYieGxhR+1EyTmsHajB2vMsRSsji0YJ3pSQQetmxwivEUX/tskCf535TQ8HGA
	dbdwnfJco1qpLfFnLDKmk59gjiiQijeOtuxvKW5QZieI8p9UCCb29drkOF07bytKCQIj0KWcv8g
	6KrhwHEvShoTHp4RCCRrlr/lm5QP8OUa9QAxfb6RVDzKs2LwtLTZv0R3NKFtYBuedMOa7X6QEi8
	+Qgn+cb4Fl2zNMWtTjOb3MVExwofSKGVDECZ5K8L5dg8fwFdCIt5LE776V0CunXNiwbs/79BQdr
	IKsfEcLNzAkBFqMSYbZ0HXYcRiPeme4nhayyvqz+nC5KGbL6brUSwDnPgOntO2n3BfncDAYTY=
X-Received: by 2002:a17:90b:3806:b0:37c:18e0:90dc with SMTP id 98e67ed59e1d1-38f29523451mr7212928a91.16.1785140411114;
        Mon, 27 Jul 2026 01:20:11 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f292aed12sm2629156a91.4.2026.07.27.01.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 01:20:10 -0700 (PDT)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Zi-Yu Chen <zychennvt@gmail.com>
Subject: [PATCH v7 3/3] arm64: dts: nuvoton: Add I2C nodes for MA35D1 SoC
Date: Mon, 27 Jul 2026 16:18:59 +0800
Message-Id: <20260727081859.1737223-4-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260727081859.1737223-1-zychennvt@gmail.com>
References: <20260727081859.1737223-1-zychennvt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_012012_051647_6F3642EE 
X-CRM114-Status: GOOD (  10.90  )
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

Add I2C controller nodes to the MA35D1 SoC dtsi file.
Also, enable the I2C2 interface on the MA35D1 SOM board and
configure its pinctrl to allow communication with the onboard
NAU8822 audio codec

Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
---
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 20 ++++++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 72 +++++++++++++++++++
 2 files changed, 92 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
index a029b660e8dc..422468dbc3bf 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
@@ -57,6 +57,18 @@ &clk {
 			   "integer";
 };
 
+&i2c2 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c2>;
+
+	nau8822: audio-codec@1a {
+		compatible = "nuvoton,nau8822";
+		reg = <0x1a> ;
+		nuvoton,spk-btl;
+	};
+};
+
 &pinctrl {
 	uart-grp {
 		pinctrl_uart0: uart0-pins {
@@ -100,6 +112,14 @@ pinctrl_uart16: uart16-pins {
 			power-source = <1>;
 		};
 	};
+
+	i2c-grp {
+		pinctrl_i2c2: i2c2-pins {
+			nuvoton,pins = <1 8 4>,
+				       <1 9 4>;
+			bias-disable;
+		};
+	};
 };
 
 &uart0 {
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
index 7228ad4735b5..28488889f564 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -372,6 +372,78 @@ uart15: serial@407f0000 {
 			status = "disabled";
 		};
 
+		i2c0: i2c@40800000 {
+			compatible = "nuvoton,ma35d1-i2c";
+			reg = <0x0 0x40800000 0x0 0x1000>;
+			interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk I2C0_GATE>;
+			clock-frequency = <100000>;
+			resets = <&sys MA35D1_RESET_I2C0>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c1: i2c@40810000 {
+			compatible = "nuvoton,ma35d1-i2c";
+			reg = <0x0 0x40810000 0x0 0x1000>;
+			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk I2C1_GATE>;
+			clock-frequency = <100000>;
+			resets = <&sys MA35D1_RESET_I2C1>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c2: i2c@40820000 {
+			compatible = "nuvoton,ma35d1-i2c";
+			reg = <0x0 0x40820000 0x0 0x1000>;
+			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk I2C2_GATE>;
+			clock-frequency = <100000>;
+			resets = <&sys MA35D1_RESET_I2C2>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c3: i2c@40830000 {
+			compatible = "nuvoton,ma35d1-i2c";
+			reg = <0x0 0x40830000 0x0 0x1000>;
+			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk I2C3_GATE>;
+			clock-frequency = <100000>;
+			resets = <&sys MA35D1_RESET_I2C3>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c4: i2c@40840000 {
+			compatible = "nuvoton,ma35d1-i2c";
+			reg = <0x0 0x40840000 0x0 0x1000>;
+			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk I2C4_GATE>;
+			clock-frequency = <100000>;
+			resets = <&sys MA35D1_RESET_I2C4>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c5: i2c@40850000 {
+			compatible = "nuvoton,ma35d1-i2c";
+			reg = <0x0 0x40850000 0x0 0x1000>;
+			interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk I2C5_GATE>;
+			clock-frequency = <100000>;
+			resets = <&sys MA35D1_RESET_I2C5>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
 		uart16: serial@40880000 {
 			compatible = "nuvoton,ma35d1-uart";
 			reg = <0x0 0x40880000 0x0 0x100>;
-- 
2.34.1


