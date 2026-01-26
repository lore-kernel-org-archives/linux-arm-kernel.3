Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD945C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 08:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=15BA5riHYfgjJikydQ+3AqLkz5CGwlAFj0WC+7ODSWs=; b=Non6WWxjwU7NGkUK+og68ZmG6d
	u4FzFdphfn7YXNXkCX8A7Y0gSKJ933cBUOKcuq4D6T9tOseQd7o17p/gUBCkOAypfUgcTXqi8wlTX
	ac4wpu34PG9052n75M59u2ajJkZFF6Y0b4jlYMIoPexLxlXbXys1+9U6Ym6ldizt2taVDNv1DtVoa
	WLXGDAByxD2omW/v6RQ2UqwBzN0xI3k6r09EV584K7YCwIQ74coBnBMaXSgsm1qpMzu7fO63GVOiJ
	8dwelQ5PcUpzSNVO4fwfms41u4Sd0FFDkuYlaIgp5n8tdie6CJZwVp5ca/blujI6MTv4nAHjmudUe
	o8MPcC4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkIRR-0000000C8t4-1PGJ;
	Mon, 26 Jan 2026 08:59:25 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkIRP-0000000C8s9-0IdN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 08:59:24 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-352c5bd2769so2785712a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 00:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769417962; x=1770022762; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=15BA5riHYfgjJikydQ+3AqLkz5CGwlAFj0WC+7ODSWs=;
        b=Q3DnTFpZEhPwcsnMlXFHn4hlERNB0Pm9o6Z7QvLKvH6waEBWmwmPn+/AHhzBTkSO5i
         zJZ1j+M1xy5eGCMljhTCP4dk9+N0PkkFiqNKfL7oBAnkh2ERSxuhcGqaoYS2gR9WeR0O
         imTCMEJw7bm4Z0u91B6dRcN7/41PF6mQMUjJ4RenDzjGJm5nj6Tu4q9WyQOEldScQsgL
         kEecANuB8MAEOgH0oq7pBc/X3u5KAxUJUS5zsQOEshHHFt3+nbZXFBYPZemWLC8RkeYf
         YPpmEBY7vOrryu6th7NBpcMEnX9agJ0IS2IVEtyeQDv9uPDCtpq8ueGpfMfzWui5l26Q
         bHiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769417962; x=1770022762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=15BA5riHYfgjJikydQ+3AqLkz5CGwlAFj0WC+7ODSWs=;
        b=APPgOdxqvodJ7C+STizirKOdi/CfKMgF0nNRIfsSb2cdz9tvoS/5/pJnrJdF7Lmyqs
         h1cZPm1yqk6wxu8xFwconnnkdYwFtT6u71CEgxgMSQRK8Ke0VnZLohLXpNV2Hc2yyB4G
         xJBHoQfVdMzoR60LatD4r0ftjUtyzGNmu+/CGHE03TDdEt5t9WEmQ69ysEJLYrK9FLeo
         SJiuXwuU1QK0oyA/2CyO5IEp4mFea63MDYBOh31v9Ig/xIXgZR0uOP3N1gc6LUYooAQs
         uhHSOdo7hV0DfoKiF+BIg9/Ctk0XBVanNJhEa27N11te7XYaxDzJWbIrrh854OWtJTmU
         ZC5w==
X-Forwarded-Encrypted: i=1; AJvYcCWDYLitcHIfnod4f+vVC8b/T40Wt37jdbIfHog4Xt8kdaTrdDOUorGTLlKIRbx59D8IBbSu15VTF+M5DKE3VHla@lists.infradead.org
X-Gm-Message-State: AOJu0YyDTwpapp98BlSry4S17Qw776ah9mkgLZ1kgFShiA5eLleOvrbT
	hiISUNzD04hEBy94oYcaKVAL4bxbI4NDAM+883BFu9lYzxKN+IZ/JE+G
X-Gm-Gg: AZuq6aLyHPcyiMqE2gbezXkTOIy9WUjjslMezsUmXFvtklVjmY7DmsSJ4DOiTiDJw9Z
	j/qST5F4sTgKALMHtgf3kzU+U2OPCRu5Vbx2jZH+tN5p89X0kIkM1GxSW3vAlLusa5JUV33S1X8
	3BtSGiijmsR3WB2lz6/c5jmQ3mHUcApKVPkPpcfmtjBL6VP6rHGTeZZEEnsK+c57e1LSAWisaNE
	k55OnZSt4bNeommeVALQxw04hCCPhSycf+NXQk7Nng9+m5k0YqtitmcGQQYh/ZMmVvIt+HaTCGp
	8gh/bSF//Swujo/PKI7eGAHtutStR6uefjLWek0UQuGIF7+WJLGcVa25HcTe5h42ft7dGGocEBr
	RCfptPktC5cQfqM+IK/Rq2q5RPjti3CLq7ZbaDOA9s0I0lv5SGDT0Q1Gb24W8GLHx1UWfzGWhq3
	kjnqcTxrZ6IyDFuov+l5WEtjpep01R08ADZXMgNqnlHDrquaoZcvpAx8jp/AqNCPfATofprR1Q
X-Received: by 2002:a17:90b:248e:b0:34c:cb3c:f536 with SMTP id 98e67ed59e1d1-353c41d1ec5mr2498102a91.36.1769417962171;
        Mon, 26 Jan 2026 00:59:22 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3536dc3e0ecsm8251798a91.10.2026.01.26.00.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 00:59:21 -0800 (PST)
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
Subject: [PATCH 2/3] arm64: dts: nuvoton: ma35d1: add display controller support
Date: Mon, 26 Jan 2026 16:57:26 +0800
Message-ID: <20260126085727.2568958-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126085727.2568958-1-a0987203069@gmail.com>
References: <20260126085727.2568958-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_005923_121098_E601E922 
X-CRM114-Status: GOOD (  12.02  )
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
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 42 +++++++++++++++++++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 26 ++++++++++++
 2 files changed, 68 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
index f6f20a17e501..406dd7998324 100644
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
@@ -129,3 +165,9 @@ &uart16 {
 	pinctrl-0 = <&pinctrl_uart16>;
 	status = "okay";
 };
+
+&display {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_display>;
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
index e51b98f5bdce..7293b5eff046 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -379,5 +379,31 @@ uart16: serial@40880000 {
 			clocks = <&clk UART16_GATE>;
 			status = "disabled";
 		};
+
+		panel: panel {
+			compatible = "panel-dpi";
+
+			port {
+				panel_in: endpoint@0 {
+					remote-endpoint = <&dpi_out>;
+				};
+			};
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
+
+			port {
+				dpi_out: endpoint@0 {
+					remote-endpoint = <&panel_in>;
+				};
+			};
+		};
 	};
 };
-- 
2.43.0


