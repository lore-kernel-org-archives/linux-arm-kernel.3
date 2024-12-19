Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B966E7718A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 20:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yH6hsp2KM99yT0BDbWTUeIR3jr/s6dYxtO7YCFid8y0=; b=U7xGB0MPcg8nWKLry62gff1/Cq
	+oZhnw972U6vjoxyByXPPtUek5nRuoAsodW/XGECIs3mmdpg6ggj0f/zZSl4kjq2AlhaOMfb9jQGq
	fC7PagecdQEqaFvbSmCI5gl/CkesCUMECj2lS14BqdjHpvxTMqh3Z/+nY3cCvZMLHAEQPrKOUnY2N
	xJgi4fx9Feba+d2y6wTGJAT3eZFIuNJlBBQeqIUEOEF9TuxZ6Oaq2W/oH0NHgVZG2qxT9d5lw8I1k
	fZVKFCFcAkkkYQa1UkDC6Ua98kKGy/jsmQ/PmTV/6Ji+NvfzfHsDGgnoC4nqQTkEvWvkTP0WDVqyk
	0O+unc5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOMo9-00000002yJo-2oCa;
	Thu, 19 Dec 2024 20:07:41 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOMfy-00000002wNV-0uMT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 19:59:15 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5d3e9a88793so1982514a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 11:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1734638352; x=1735243152; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yH6hsp2KM99yT0BDbWTUeIR3jr/s6dYxtO7YCFid8y0=;
        b=0sCe0rIMCYTQ4kZA+rzSWJcCo7KOCPKA5uOjG3JojJq90ejYZtvGLkPMNCQfbL17BO
         paParPvG5GSCLCI+FfzJx47Ai2Ewids4aNVzqKXnjPKJbz/DzgCN0EKElAP9gPZP457D
         rjcwFZYI4siWGUCqLbK4inBdb4cEIqkML8V9jQt+gqAgl6OGLXuQyxmAxn/VKWXzwHhL
         PS0TVwYNfnKcg5xOZpB76klX6N7xZV8R64mw8kcpyg1tR//vdDNKb0+ptV/rZ5rUZ/my
         kc8PB2DC1eqtsin4OBRThawe5oHS1B5CcPIBOb80UEnTtTHUeDAlomXVoNuiO5+okq50
         FADQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734638352; x=1735243152;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yH6hsp2KM99yT0BDbWTUeIR3jr/s6dYxtO7YCFid8y0=;
        b=bFbrhwZF9FhcohXgm8EM0qQRPS7Uld6gVmPxxuuYW7t6irFulJ0ANihOg17nvUfbhs
         yTx9v0CCKDAZTpGDP6UHDMQxkJY4xw9D9fbzNkEJ3Hy3eht0UvttbVhduf7iGg8TsZHd
         nPkHMUmqdyvV9w0sJKrMZw5SSAVfrIlpvyR+j2pHU8HTZ3xjCXXcrSzCtOP2CGh3EW5e
         6nV6fLGpFyPNkl/1b+drtJzifwGIil527nBjX/xgX1tcqiOC/jVh3bgXtxgUkEQV8K5J
         hCtdgGa/DkHEUP/yaEJkC74EGp5ALwQz4iLMjXLaPCd8oLoWsZAscpWfQS4IJSctyCTm
         pwaA==
X-Forwarded-Encrypted: i=1; AJvYcCXebDzWNR31BT9CEHzNevOeVUCFe3dYnGpMcvZQRj8okGRWfuGs4ZdIAZi03X1ysM/uj8riWmS733N9Hws8n9nr@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7UbbdMCEKpuUDHCOrfp57tHOx4EZ+xZDK3O3D1u+H+pyBEsp6
	c+rJTqApqFasqBJjLq2wAuGq8AxGXMcJm4jW2FJdp02JUi0c+ZLWhwG88FwkFYY=
X-Gm-Gg: ASbGncu06niZasPkhk41zmk6c7z4DTBZAgeZoPxXhwQzp3smxSOTpFeGtF29BJ2I1EZ
	61+WmFbrH29gPDLiY1U9Sru0XslR4tbJ6ouYKTFXLVJEndG2LR7RSMSxi9VEcVoCLzqH4yDF0FG
	p4RGr2BmyTYj2P7mEbkz0HS70lEej7m2U8XDkOAWZ0XZmi/5uCjxAPbkySLncwqGpgZhHWUtzG9
	mB7UkCdm9glbAjEgq3/bzV45cxTxcTvDP4ZDWwAEMjCyAdIJQ==
X-Google-Smtp-Source: AGHT+IGtcrLbNDzvZMlctOsefUcwsi1FQVpwzQvY/+MU9MQ42A/89PCMdpAPKvI3wEO2j49f+U5l6w==
X-Received: by 2002:a17:907:1c21:b0:aa6:a844:8791 with SMTP id a640c23a62f3a-aac334e4c53mr4967266b.45.1734638352144;
        Thu, 19 Dec 2024 11:59:12 -0800 (PST)
Received: from localhost ([2001:4090:a244:82f5:6854:cb:184:5d19])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f066112sm97044866b.179.2024.12.19.11.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 11:59:11 -0800 (PST)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Thu, 19 Dec 2024 20:57:58 +0100
Subject: [PATCH v6 7/7] arm64: dts: ti: k3-am62p-mcu: Mark mcu_mcan0/1 as
 wakeup-source
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-topic-mcan-wakeup-source-v6-12-v6-7-1356c7f7cfda@baylibre.com>
References: <20241219-topic-mcan-wakeup-source-v6-12-v6-0-1356c7f7cfda@baylibre.com>
In-Reply-To: <20241219-topic-mcan-wakeup-source-v6-12-v6-0-1356c7f7cfda@baylibre.com>
To: Chandrasekar Ramakrishnan <rcsekar@samsung.com>, 
 Marc Kleine-Budde <mkl@pengutronix.de>, 
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>
Cc: linux-can@vger.kernel.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, 
 Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Simon Horman <horms@kernel.org>, 
 Vincent MAILHOL <mailhol.vincent@wanadoo.fr>, 
 Markus Schneider-Pargmann <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1218; i=msp@baylibre.com;
 h=from:subject:message-id; bh=9F9vMEKbj2mOv4/2m1bk48Pas2jClZzC2oJ41WmTRoc=;
 b=owGbwMvMwCGm0rPl0RXRdfaMp9WSGNJTqv6vDM53mtt799LchQ9dnrOdWPhRaW/tZw/JJwmz6
 /8e3hfr1FHKwiDGwSArpshy98PCd3Vy1xdErHvkCDOHlQlkCAMXpwBMxKaQkeG5d3Feyttqw1Ub
 Pdg9FfZ56UeKdQcf2PCMl8nyqHjlX2aG/7HSKXuyoy/ytLu+i3tysyw19XrS9rqWiMOaex4Y/Zz
 VxQAA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_115914_261905_02ED85FF 
X-CRM114-Status: GOOD (  11.45  )
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

From: Vibhore Vardhan <vibhore@ti.com>

mcu_mcan0 and mcu_mcan1 can be wakeup sources for the SoC. Mark them
accordingly in the devicetree. Based on the patch for AM62a.

Signed-off-by: Vibhore Vardhan <vibhore@ti.com>
Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi
index b33aff0d65c9def755f8dda9eb9feda7bc74e5c8..cf57f954dd3e31a8747c833bcc583dbc6ba21d03 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi
@@ -173,6 +173,7 @@ mcu_mcan0: can@4e08000 {
 		interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-names = "int0", "int1";
+		wakeup-source = "suspend", "poweroff";
 		status = "disabled";
 	};
 
@@ -188,6 +189,7 @@ mcu_mcan1: can@4e18000 {
 		interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-names = "int0", "int1";
+		wakeup-source = "suspend", "poweroff";
 		status = "disabled";
 	};
 

-- 
2.45.2


