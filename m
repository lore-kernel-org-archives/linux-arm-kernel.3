Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD113C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 03:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=//d0bJWkNr8qRs213bW7gb4xunennUE1PJsDFQia6Eo=; b=iqQXPgFOkyIT1ciWDv4PXz7Eyi
	QJd09Fg0KvPhZGaXOdmB6ktQTwS0+wh+tAHT1gsZH7flrQ3ZWlAfrHn57EPLMbQlS4pVL/lvTVHJo
	nlr9vcsHpKNhhcCmXGZviDZiePHBKCJZIX6/jpCrlr+p+xSbx7tBVG+54QTbPldKmTwD/KeEq+k6z
	VnpqpQJopU2gqmTqO5HvGeM0PNNgGlgFr6LzajPgUuVj6F/mZeRtgyB9uPqpniClxVZUSGskFyulT
	uwN8HMh56DHJb0rfD3aMmPAPtERAMTHr4E6a0EEVUdJMzk4fvHUcJZO03dY3le7pFNTZDcotwruRx
	tZx5uXWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYFdh-0000000HIV5-32dC;
	Sun, 06 Jul 2025 03:02:01 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYFZD-0000000HI73-145J
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 02:57:24 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-55516abe02cso2123791e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Jul 2025 19:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751770641; x=1752375441; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=//d0bJWkNr8qRs213bW7gb4xunennUE1PJsDFQia6Eo=;
        b=ESVrCIdgvIloahLeovfv3A9duUmyLbRKXerMzCblyB0sSnX5385/PEesu6+ayM6MHc
         66gEsvVM8RMJkR3fp2p7XARcP6Yamf80QUjQoY23gqmX87VOnH9EnQFPR2JqoDfyFoAh
         3WPw5ThCflvsihmltHwTvx25jyVhpYtEPyMFlI4wVRorgJsYHoegeIgA/8My4YxIJWi4
         9LA2AJsvN+SRICVwawwGd4U3b5bCODUoVhgqBRzJUMZrBYvu4cR3mhorSfM9tdOOruFY
         TO0F4yd829F+7xkPZ339MZE9HmhwMBisKQ996sDeBhUC6zJtiWwsivZgp2nWPj5OTr/n
         fCfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751770641; x=1752375441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=//d0bJWkNr8qRs213bW7gb4xunennUE1PJsDFQia6Eo=;
        b=fMSSQ6TcrxPMemRy2T7s4NQlT3oRsrRA7WQEKmx2GZoxQ0ySbTSk/Lkik9KtaSTql8
         0xH9qtyrV2NaVLbvA7ep+McrCyiVAYcGDtMKd3hWki0mih5C72nueJ8+usJP3wFhA49B
         toFb6bJGMtiaGBZdd1LDMKKxFD+sjRfiTLBgmpvetGM+DD0pQosnUwHbvh/oCajuSL/D
         XVKlpYaJM3SGpz+je9w/w3qq0MgubU32KnacCsjZcOIazjRXycYyIBkA4G8bdCbd6a0w
         N6b2/WHKAvtyJ3PKTlaE4Xtxmws1PHeyhHb8zme9zt5hVPXIhP+Js04l06DXpsAt778O
         7cbA==
X-Forwarded-Encrypted: i=1; AJvYcCWXlhj4ugfa9BGTUGpKJ5Qh0SPupqk51JtZdHZbKJllMrbOB16WaZGcJ1+g+XEvomViG/kAX1fJ4b4i7+qRFjRb@lists.infradead.org
X-Gm-Message-State: AOJu0YzlFq5M54L4jiJTb9g7WhDGhwO+dhO0y0HHoiLSLirZ/23yT6mR
	JwuDlkCX5Ij5PTwmJnGizR0wokBSvFeQHvtejqu1nlVa1MShkozT24nO
X-Gm-Gg: ASbGncu4IP8nas2T/H0o6KcZLdt/CLnv1nLq3rNuAIQr22J+rXIcrjIH/bdhXP/IYpO
	RwqoJ/6Jq/05GZqcD4VXBVAm2+vopyARdrZaui/J/IKP+YXodRlJs8yczeu3VfLsKZTc5Y2vxzf
	yGFhwousZIvCcpgnEHwWrWUdYttxaDmrOly7OvPgZO3ZvKZGUhktzoCq0Y4uPkGztfUhtWRSmxU
	VMtoVazMi0ml31/GNB0MbO+n8XfduoMSAeYKYrktAyg3Q8jQAJBeRETUTj0feQtyoolevtWYyzq
	zQUPhkKBTwp08FYGrVb/gqmB2VdlzvXJzMV2CzIVBxlYyRYuzsOKnTbk0DE98JOGjtmEiiI=
X-Google-Smtp-Source: AGHT+IFfsqkWZBN4PIBE9st3rtlbs4llavPau1ElbWPXJmYwNfgPZvdeoU9nsBN2bcLjLflD0uCNpA==
X-Received: by 2002:a05:6512:1586:b0:550:e50a:bf49 with SMTP id 2adb3069b0e04-55643823068mr2804124e87.19.1751770641421;
        Sat, 05 Jul 2025 19:57:21 -0700 (PDT)
Received: from localhost.localdomain ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384b7b4fsm788573e87.198.2025.07.05.19.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 19:57:21 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: allwinner: a523: add Mali GPU node
Date: Sun,  6 Jul 2025 10:56:22 +0800
Message-ID: <20250706025625.2707073-2-iuncuim@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250706025625.2707073-1-iuncuim@gmail.com>
References: <20250706025625.2707073-1-iuncuim@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_195723_293644_EA0E0D16 
X-CRM114-Status: GOOD (  11.85  )
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

From: Mikhail Kalashnikov <iuncuim@gmail.com>

The Allwinner A523 SoC features the Mali-G57 MC1 GPU, which belongs
to the Mali Valhall (v9) family. There is a power domain specifically
for this GPU that needs to be enabled to utilize it.

To enable in a specific device, we need to enable the gpu node and specify
the “mali-supply” regulator additionally in the device tree.

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index dd6fa22f9..d3528d498 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -108,6 +108,21 @@ soc {
 		#size-cells = <1>;
 		ranges = <0x0 0x0 0x0 0x40000000>;
 
+		gpu: gpu@1800000 {
+			compatible = "allwinner,sun55i-a523-mali",
+				     "arm,mali-valhall-jm";
+			reg = <0x1800000 0x10000>;
+			interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "job", "mmu", "gpu";
+			clocks = <&ccu CLK_GPU>, <&ccu CLK_BUS_GPU>;
+			clock-names = "core", "bus";
+			power-domains = <&pck600 PD_GPU>;
+			resets = <&ccu RST_BUS_GPU>;
+			status = "disabled";
+		};
+
 		pio: pinctrl@2000000 {
 			compatible = "allwinner,sun55i-a523-pinctrl";
 			reg = <0x2000000 0x800>;
-- 
2.50.0


