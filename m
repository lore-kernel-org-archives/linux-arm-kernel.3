Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D492C43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 16:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gxEnLEysA0x6qP1GhzE2jlVqsDd0b1OoIx2vxLPTsw8=; b=KWCOCU85VB13mHYD5Os8ETH81T
	dsdOi+14mCPBYV2gkCQu1SJ4gMsBJXoM0Tmy2GbCCwSmQVWUDHUn9TC8s8bXuImKlNubNybzRliZV
	fLqcSzz8lBK0C6e58uZqbo5BuVKxkn/D4Br1LRPfHKyyVMcJcNdtR3Ob0Ta/PZfqyIkcvT3uUoj0h
	wp7FWIiD9V0+0pOXLerspGMX9A8sCz89zWORUBsNB6IRZHrbviCQEUQgFVh0SnbSXgAJUFY6m5w9g
	deOFyWKPKj29QGTt3kn80dtKbJiOFRd6coXuoUbnRhgwkjhH/xJMiY34ILEq+D+DSks9wOQ4vDZqF
	23sVntCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whVVX-000000001vJ-30my;
	Wed, 08 Jul 2026 16:52:23 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whVVR-000000001s3-2T9W
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 16:52:18 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-476a130c138so1024368f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 09:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1783529536; x=1784134336; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gxEnLEysA0x6qP1GhzE2jlVqsDd0b1OoIx2vxLPTsw8=;
        b=gXdZodF4qf02VU7PODa/4tQAAojPUNewOs2QvMftqT9Jht5xlfGHMs3cUFIdVsuXDO
         kJH4WefIZruDJ2/mlJF+zSfOe8Q15lhCbfsj8524CnOtizbEHAxiRzXLgpOGpE0wBnDa
         Gtg9F75WXgtflB2f52GUchpCZpiTMsgzPMBAr3QD09lqDybIqPb2Tu7yj8Mv1A8hgvkl
         PBTThcuS2PxJMct8iSAUwKLOk1/reYdIY1uMnX7xeevIv30TXp/9YgCmsx297kl48Ag+
         zCfSDZRKFDumPbjQgPHWXIAGIEAcVY9Dn3LQ/b0przSDG5cSV+Xy8bph7gf6XgS6QUWS
         AZZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783529536; x=1784134336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gxEnLEysA0x6qP1GhzE2jlVqsDd0b1OoIx2vxLPTsw8=;
        b=FzZ8KTTmasTNvN/55ytIVFeZTISVPwkSGwyZpB/ow15eZvhwN/6OKVX5kylCtidWJ7
         wEIaU1YI5nfOPi2WO+oPJwVrC2Kl4uYx3F5BbjK+Ru48ITdJlsG5CGs6TfTSzMnntvP+
         jKkZRCp4zP1omlYHDZJ1mOsBXoNbYk8iJajyg8TVRmgp8lV8qdglB7wii+x6ojuEy/n8
         JygvciYteCdp4ALLuGYTCL0CIO/Ziqz3SUgdYXIjjA4056l9sqgYjapITHRbLKmV6iTz
         ZFkQiSjHbvwYEQAdBAkKEBaXaOjr/4cNIRWXsgN0R4ts0QNWwC5gLqjxYfxZUYoc1CEF
         H4PA==
X-Forwarded-Encrypted: i=1; AHgh+RpNxwr0HycjJl1KywTzFRAyXS54DHoDJV6n4PJHuZ3QJAhqjavPgi12jTQjpdaWijzIqvd2RF5Um4iA0KAHcuHH@lists.infradead.org
X-Gm-Message-State: AOJu0YwqBtoK7jwNYsqnoqmUu/fYkbjTHl8RGWFZPzRpH6a+6P95LFH/
	KCv2eP1L9m6/NKoRkpsmkp2bskcU4WB6GYU6zKwizptAzOuvHEaYSIiEKE6CjQzzKUY=
X-Gm-Gg: AfdE7cnaeNCjj2S8WEVlNhH0T/NEj8fpMCqyMil/8uo/EB/JsQ/EWqjy2/RskUIlCEs
	feCUhSr+UhSqZYbfFtKs27FFxJ5scb4XwZN5C4cI5QGWPqjtPJDbP3N16DeGp3B8wCtmlc5YIdR
	fus6+8FOFzKmYyDMRyi8RYKX4EF5dfElDTKbHgIIrhTp5IhCztGwnlZMgCYBsSvJokDTQ6DD5vf
	zxoSmdXG1WZbUm28xaZV7W7fCZf5umz9C3fsePFp9e4vOgzMm3ZnIHCKCxobVZ0VBpet5TklP/r
	dq7qUViv31fvH6R4NRtaPHHTWMVduy154CTIR15C0lbyetAGPcuYgPBo/kOvfRYq5xzd2nNwfbI
	eIkoD8Zp85uq/C/onye/ZvD8LG1UCp1ajGr3XWxt5+xj3oicQHdhLPUYvfwPVXt7Tz3wPNIwsw9
	cI49/xc7OyiztaR8eGk/jtxA1oO+nJbnUi5X3Y7ZxxVjd3wGCzSGZUnhWCxJLHAA6oB4MwPwbYu
	/zxnxAukup/nDbVntlPSF3dM8pbNvnfMmejZR20P1U=
X-Received: by 2002:a05:6000:40cb:b0:475:a05c:c63e with SMTP id ffacd0b85a97d-47df075c7f8mr3562703f8f.31.1783529535977;
        Wed, 08 Jul 2026 09:52:15 -0700 (PDT)
Received: from threadripper-fedora-workstation (dh207-15-57.xnet.hr. [88.207.15.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f214d2sm42902679f8f.33.2026.07.08.09.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 09:52:15 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: conor@kernel.org,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	robh@kernel.org,
	krzk+dt@kernel.org,
	broonie@kernel.org,
	alexandre.belloni@bootlin.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	daniel.machon@microchip.com
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 4/4] arm64: dts: microchip: lan969x: add QSPI nodes
Date: Wed,  8 Jul 2026 18:51:11 +0200
Message-ID: <20260708165201.624271-4-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260708165201.624271-1-robert.marko@sartura.hr>
References: <20260708165201.624271-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_095217_641419_4D831E9E 
X-CRM114-Status: GOOD (  10.02  )
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

Add the required DT nodes for both QSPI controllers.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 arch/arm64/boot/dts/microchip/lan9691.dtsi | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/microchip/lan9691.dtsi b/arch/arm64/boot/dts/microchip/lan9691.dtsi
index a8679ee6da13..7db9378c60a3 100644
--- a/arch/arm64/boot/dts/microchip/lan9691.dtsi
+++ b/arch/arm64/boot/dts/microchip/lan9691.dtsi
@@ -396,6 +396,24 @@ clks: clock-controller@e00c00b4 {
 			clock-names = "cpu", "ddr", "sys";
 		};
 
+		qspi0: spi@e0804000 {
+			compatible = "microchip,lan9691-qspi";
+			reg = <0xe0804000 0x00000100>,
+			      <0x20000000 0x08000000>;
+			reg-names = "qspi_base", "qspi_mmap";
+			interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&fabric_clk>, <&clks GCK_ID_QSPI0>;
+			clock-names = "pclk", "gclk";
+			assigned-clocks = <&clks GCK_ID_QSPI0>;
+			assigned-clock-rates = <100000000>;
+			dmas = <&dma AT91_XDMAC_DT_PERID(1)>,
+			       <&dma AT91_XDMAC_DT_PERID(0)>;
+			dma-names = "tx", "rx";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		sdmmc0: mmc@e0830000 {
 			compatible = "microchip,lan9691-sdhci";
 			reg = <0xe0830000 0x00000300>;
@@ -418,6 +436,21 @@ sdmmc1: mmc@e0838000 {
 			status = "disabled";
 		};
 
+		qspi2: spi@e0834000 {
+			compatible = "microchip,lan9691-qspi";
+			reg = <0xe0834000 0x00000100>,
+			      <0x30000000 0x04000000>;
+			reg-names = "qspi_base", "qspi_mmap";
+			interrupts = <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&fabric_clk>, <&clks GCK_ID_QSPI2>;
+			clock-names = "pclk", "gclk";
+			assigned-clocks = <&clks GCK_ID_QSPI2>;
+			assigned-clock-rates = <100000000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		reset: reset-controller@e201000c {
 			compatible = "microchip,lan9691-switch-reset",
 				     "microchip,lan966x-switch-reset";
-- 
2.55.0


