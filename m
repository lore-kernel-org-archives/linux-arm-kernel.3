Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F10CAC59F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 10:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t96kEL8qjy4YgliK0l0rnhpDDiQlebw3W1jReBJnKWs=; b=pvY0bigIoyf9zEhs/PcTLvN6A6
	hnYVCXF18q+vQ99YyZzRbvddA45Kafh/Lq1X8mzYvzktmKcAKYB1Vh0Kr/sbq31k8IIbw+dL/Zzlu
	nG/lQ4nzjCXKQ12bs6/Y09thRlFNS5im4541He0POq8M+4nMg+QZhFF1DNocHY3YjzAqsqhUqmewL
	YxmDrh8bkgI17iUiB37toSVUoeAvLU5bvMtrfDau5A+ZhBiQB6vEsBeFrMZgLqDlwGmllkddVSs7z
	XHc4HypACIoS9BlIfmJ2A4aYSH2TDvmjiCTqoYlgs6EhfAhs6C3ic0gTNOjkRPp8G3dEcub7WHSO+
	xPPq0CrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uypFL-0000000AwzP-3F8L;
	Wed, 17 Sep 2025 10:18:43 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uypFG-0000000Awvb-1x2e
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 10:18:39 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-b54a8c2eb5cso5106097a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 03:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758104318; x=1758709118; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t96kEL8qjy4YgliK0l0rnhpDDiQlebw3W1jReBJnKWs=;
        b=ka1vntnpeDkq8ikYKAy1RfEahPaJxshhZURqdR+w6Gb5ecV1fN0TJdl3kY7EjcHhzh
         AXTx9Ji0FLtRbi8b6Wm6FkgaLjK1dvu1d308Z3T/0MZRCd4BcqF5ACoH9pEdasGgMC/7
         GCVcBJ3a3t8G1cC0xNkw+Bpvo/aPaB5WjdWqMTZXXVX4taZi02gOy52wEzYGtp+r4BuW
         cXOuZHnR1/8s/JhV/snm/+Ly7/ZXkQfUeD6WFNioH5oDnmDunWMZ2+UaORxLwbJgdLBp
         crNQ9U2/JhD9A0HVGwdP6c1hDe2AmVBcgvuNimX1BephfpaYMJQboejMabaHYntddoAm
         wn7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758104318; x=1758709118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t96kEL8qjy4YgliK0l0rnhpDDiQlebw3W1jReBJnKWs=;
        b=oKusUpMRr/crucTtx8Aqb2oCSNISxA867djFZa+L6S6v7b35tU/Y/Fyf3Rf2MQiR9d
         PtYzsWqjC63IzJJcPi+cQ9VNC/ngwE+kawb130G/06LBeTE+Da5+gPb0278AcatefkqW
         F4buGWCqfBH1V5Ed3rmSgvsGyf9yGXatIUjyxsbk9R8qts153KmT4RGH5X4ilY5LNOjw
         z8Yv5HUz88U9lrlgQBtbvkGdPfaUZuxfTOZV1RlJEFWeBIyTCyNXIkZXD8zElM/siBIb
         NUUdbp06LnY3IoTMkDQm0BslhrbPMGdceApMuMgQ1U8SyRRXUyQrK6r/Dt6auNbcrKyn
         /c+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXX01ssySfiqrdI5aekz25c9iQ9op4ROQbX8JgKx/ufBp+XzX1Gs3ActLMqS/dWf6jdSNBs0bOUxqUeUBICi/m7@lists.infradead.org
X-Gm-Message-State: AOJu0YyqB0EMuG+gyC0+AMTlnQDVds54wH9G9PY8cqu4Xznent1HNKOq
	xojGaUV1jqS1JxSMRT2Dp27ZUQS+Svxy5nR0NGvd4RMMOqBUdkAeOCKU
X-Gm-Gg: ASbGncvt+7J4P/y1AQoE0JR2fmV7Q/yTke5LxZuOPZSMoV1wV9NiR9un679pY0XJ3kp
	tJ7Li/U77FHpPW7FCw8ac47LYV8mLXjkzmoX6zpsMBtIAzAgHEbxsDooTDsn6vdH/wZMKknFbUH
	/PfeysKurZ2RlexwBNKc6dMYOO+WhRu/rpli4JE2FyprO244Po03C/B2w8xEy4Fr0XdhaaVHyD7
	jnh94SWYomqXfYwl/KFc5GlB8WdmPDQtlNeYxfYYcegsQyX0w4GF52A1QEMLkfqEINXSx47FeOz
	+OBTbNxGjxcgf79gBeSJx5VqJla/0TJ0Yu56lEkCExlzCJVbSpULD+RSKvSPzhvYyv8J86Sm1wK
	wRzta2ogw/NVGQukuGd+BqadSisCQaFnQz7uGunSBI2HjC0qGJUU/s4yntUBh9J7GYOoQ2NzSkD
	hxXbFaBraByhSh61NlDU/yL2uzSA==
X-Google-Smtp-Source: AGHT+IFwCJZiejFhBOaCOBZZ9XSV1F4l94l6zN4IWDTuh2gTutWzk7T5JzgCvehFOl7X++T/mgLFCw==
X-Received: by 2002:a17:903:2f0b:b0:24c:92b5:2175 with SMTP id d9443c01a7336-26812191675mr18151565ad.24.1758104317549;
        Wed, 17 Sep 2025 03:18:37 -0700 (PDT)
Received: from eric-eric0420.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-267f4d286aesm28588755ad.63.2025.09.17.03.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 03:18:37 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: peteryin.openbmc@gmail.com
Subject: [PATCH v1 2/4] ARM: dts: aspeed: harma: use power-monitor instead of power-sensor
Date: Wed, 17 Sep 2025 18:18:23 +0800
Message-ID: <20250917101828.2589069-3-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250917101828.2589069-1-peteryin.openbmc@gmail.com>
References: <20250917101828.2589069-1-peteryin.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_031838_524991_E7EE3B94 
X-CRM114-Status: GOOD (  10.99  )
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

Revise the node name from "power-sensor" to "power-monitor"
in the Harma device tree to follow Device Tree naming convention.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-harma.dts  | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index 41ae86180534..bcef91e6eb54 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -190,25 +190,25 @@ pwm@5e{
 		#size-cells = <0>;
 	};
 
-	power-sensor@40 {
+	power-monitor@40 {
 		compatible = "ti,ina238";
 		reg = <0x40>;
 		shunt-resistor = <1000>;
 	};
 
-	power-sensor@41 {
+	power-monitor@41 {
 		compatible = "ti,ina238";
 		reg = <0x41>;
 		shunt-resistor = <1000>;
 	};
 
-	power-sensor@44 {
+	power-monitor@44 {
 		compatible = "ti,ina238";
 		reg = <0x44>;
 		shunt-resistor = <1000>;
 	};
 
-	power-sensor@45 {
+	power-monitor@45 {
 		compatible = "ti,ina238";
 		reg = <0x45>;
 		shunt-resistor = <1000>;
@@ -264,25 +264,25 @@ pwm@5e{
 		#size-cells = <0>;
 	};
 
-	power-sensor@40 {
+	power-monitor@40 {
 		compatible = "ti,ina238";
 		reg = <0x40>;
 		shunt-resistor = <1000>;
 	};
 
-	power-sensor@41 {
+	power-monitor@41 {
 		compatible = "ti,ina238";
 		reg = <0x41>;
 		shunt-resistor = <1000>;
 	};
 
-	power-sensor@44 {
+	power-monitor@44 {
 		compatible = "ti,ina238";
 		reg = <0x44>;
 		shunt-resistor = <1000>;
 	};
 
-	power-sensor@45 {
+	power-monitor@45 {
 		compatible = "ti,ina238";
 		reg = <0x45>;
 		shunt-resistor = <1000>;
@@ -374,7 +374,7 @@ power-monitor@40 {
 		reg = <0x40>;
 	};
 
-	power-sensor@45 {
+	power-monitor@45 {
 		compatible = "ti,ina238";
 		reg = <0x45>;
 		shunt-resistor = <500>;
@@ -520,7 +520,7 @@ imux28: i2c@0 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0>;
-			power-sensor@20 {
+			power-monitor@20 {
 				compatible = "mps,mp5990";
 				reg = <0x20>;
 			};
-- 
2.43.0


