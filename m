Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A1DD3566B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 04:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qs+TGYRSq+syNgtmamomzVV57rWTcldKeZsL7QkXhHc=; b=3TNqKUW/E/NJM/CFG9P0mDv74p
	iLxG63lZGewuMwFPO0mZdMJLig6oCUmaGwIooTvzhFnORQIY/hLcNuK6SAtM0Yxnvp33cr/lsyS94
	osCs7xNWvSwiol+y/uiIZQve0QPXl+YcbC3OVG24ZtqPopQ3zPcwBk1jmVmExK6nZlZ55EnsePw4n
	fdu7WA0iqjTa4mcAUeJQe5H9xvxw2P86iSeqT9dI8E3Kf2Lj7Ai9xZ4b81dXJ+PCb79UGaO5DXMIl
	mBjUGO4EM0TFqXAJW5qvAm82DANArlLxlpo0qSbI8CDhjz3AqhX6mnbLHIHWUfma7vRPLj1BYG3Tj
	La4Rtqdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlJHv-0000000HDWN-2EXC;
	Thu, 29 Jan 2026 04:05:47 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlJHs-0000000HDVO-38vn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 04:05:45 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-81f4dfa82edso282521b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 20:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769659544; x=1770264344; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qs+TGYRSq+syNgtmamomzVV57rWTcldKeZsL7QkXhHc=;
        b=c2EfimfkO35lZrgvOCQpzWB2EApwf9lwWP+PA0h9uBrd0w34DSR7PBA8Plf+czL7Gm
         +/bBCJQ0DAXPB1P+GHjV5tPxVWkv7olXQvaUoMd3pM/Id+AUye7A4uoEvWopnCiMwPF8
         qKAB3hyWvxbe81mM00uccvzN6g5sFQrdNLriNFQHyJPLmGMmok2+bIPw4WgVoV8iDnbI
         UzAuvjulq20VU/5yEKoZ4ecI/hAGNX39BmzGdJSCNxbJjhwWoNjHn8SSxIBcdMVHSIfG
         Ep8Pp89hRD88WiGkhhnAibzRxG7uhmAOeQlT1fTRT7Jcw3Ovxe4Js8qeKAYGgCYDvJpB
         68sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769659544; x=1770264344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qs+TGYRSq+syNgtmamomzVV57rWTcldKeZsL7QkXhHc=;
        b=sI2AzH1vMNd6WpgoWDD5Cs8mPC27jaaoPeRwBcc2f3XCTPdVYKo650w+7ANA7LwIYz
         GAn0nc71wcAmXZ+0t48jO/1IjYn1K2inRjDV3NRSuE71zPHi8rHjDCpXVPUvRKu9nNE0
         CWAjjE+337OYQX9OykHwtcJQtYvakkNQJ8uk+jttTl2E56g+uXb37Mv4Z+UtnA2vdMZ/
         xOajoPuc4TWKNdovmhNGT6NIdV90yhw3KnrbFi/dI9e8o8GPwQFgjzKS+8eTYkx/VqxC
         3Xn5FqymesWI1rfZEwUUHeEKS1vtlFIBg9BxTdAKZauYRjFUl+5iHNBWuWG76nbjDr0x
         rh7g==
X-Forwarded-Encrypted: i=1; AJvYcCWVqSZ2wl3ACgyHOKA6BhjDfyQSHSs4nI9aiiiGzklMfAF5NgIgwkSsfF30RevhYC7PniQ5UxZrBirvuAr9Lk/H@lists.infradead.org
X-Gm-Message-State: AOJu0YyPBD6yZMMAJSYWtjVKH5WT0cPCA+bPGoZy0URujn7FWCQ8gRD8
	Su4X4eutsn3jbsyyGFsqJ5Y730vZnAJhDGWR9oRSCC4zwQPvwnMZU/aY
X-Gm-Gg: AZuq6aJmb766asSHsvo5RTTQrS+IOOvCaYLUOsq83bjvXPqvdwoGTsqr0yyljHy6hXx
	tDorsYeJ5YFUN2bvTQKdP20UTkPi5OBjX98NL9VXt1qeP280rH6ShQDR3S4CmvdEjdBXJomQ7rC
	t9Xx815UdSdETtyJ1keAWGJiAnEjdD9NTJnEGKQmL4Liufxf3Df+TvZF7VUfnnFMadM7HtysriB
	U2k1+sKrR7jbVkTyixEwmlv6OkHODdUm+Z5+FFjsm7DU5RTqa1Gbwby4TC9358/W2/hmwfIN7qE
	JCp4/6jobz/8LqPt8EtOy8aMrjNl485ZTawltfyYuuy0ev8AsGG2OXgetYMA07k4OyS8432kso9
	vfitcoGHYF3q1ENEMc0k+0Cgvu7vY9y8CPd3NiGasDBF+9CygtrdVZQFdEQ+dNSh6nd+LdwVn5N
	qyqbY+TvcbTJx2jTakGgSJLWPUi8hKoA7zjcVyc+anKWyzdd2fdef9jpYck2M3E3M8RaKn/3Xl
X-Received: by 2002:a05:6a00:14d3:b0:823:1cae:10bb with SMTP id d2e1a72fcca58-823692c322cmr7240139b3a.51.1769659543769;
        Wed, 28 Jan 2026 20:05:43 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379c22672sm3857721b3a.51.2026.01.28.20.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 20:05:43 -0800 (PST)
From: Joey Lu <a0987203069@gmail.com>
To: airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	a0987203069@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] arm64: dts: nuvoton: ma35d1: add display controller support
Date: Thu, 29 Jan 2026 12:05:31 +0800
Message-ID: <20260129040532.382693-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260129040532.382693-1-a0987203069@gmail.com>
References: <20260129040532.382693-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_200544_791854_FF075F61 
X-CRM114-Status: GOOD (  11.75  )
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

Enable the Display Control Unit (DCU) for the Nuvoton MA35D1 SoC.

This patch adds the DCU node to the SoC dtsi and enables it on
the MA35D1 SOM board.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 56 +++++++++++++++++++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 14 +++++
 2 files changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
index f6f20a17e501..e596bb452cc9 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
@@ -98,6 +98,42 @@ pinctrl_uart16: uart16-pins {
 			power-source = <1>;
 		};
 	};
+
+	dcu {
+		pinctrl_display: display-pins {
+			nuvoton,pins =
+					   <6 8 6>,  /* VSYNC */
+					   <6 9 6>,  /* HSYNC */
+					   <6 10 6>, /* CLK */
+					   <10 4 6>, /* DE */
+					   <8 8 6>,  /* D0 - D23 */
+					   <8 9 6>,
+					   <8 10 6>,
+					   <8 11 6>,
+					   <8 12 6>,
+					   <8 13 6>,
+					   <8 14 6>,
+					   <8 15 6>,
+					   <7 0 6>,
+					   <7 1 6>,
+					   <7 2 6>,
+					   <7 3 6>,
+					   <7 4 6>,
+					   <7 5 6>,
+					   <7 6 6>,
+					   <7 7 6>,
+					   <2 12 6>,
+					   <2 13 6>,
+					   <2 14 6>,
+					   <2 15 6>,
+					   <7 12 6>,
+					   <7 13 6>,
+					   <7 14 6>,
+					   <7 15 6>;
+			bias-disable;
+			power-source = <1>;
+		};
+	};
 };
 
 &uart0 {
@@ -129,3 +165,23 @@ &uart16 {
 	pinctrl-0 = <&pinctrl_uart16>;
 	status = "okay";
 };
+
+&panel {
+	port {
+		panel_in: endpoint@0 {
+			remote-endpoint = <&dpi_out>;
+		};
+	};
+};
+
+&display {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_display>;
+	status = "okay";
+
+	port {
+		dpi_out: endpoint@0 {
+			remote-endpoint = <&panel_in>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
index e51b98f5bdce..7d9d077f12b2 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -379,5 +379,19 @@ uart16: serial@40880000 {
 			clocks = <&clk UART16_GATE>;
 			status = "disabled";
 		};
+
+		panel: panel {
+			compatible = "panel-dpi";
+		};
+
+		display: display@40260000 {
+			compatible = "nuvoton,ma35d1-dcu";
+			reg = <0x0 0x40260000 0x0 0x2000>;
+			interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk DCU_GATE>, <&clk DCUP_DIV>;
+			clock-names = "dcu_gate", "dcup_div";
+			resets = <&sys MA35D1_RESET_DISP>;
+			status = "disabled";
+		};
 	};
 };
-- 
2.43.0


