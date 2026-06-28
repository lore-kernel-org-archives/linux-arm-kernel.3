Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC5DC43327
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Jun 2026 17:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zcI4RF/85Hhir6hatnhEodVMpREEtgWBRDdJx84jUwU=; b=2XyCp1MTVYDen3ETq/i5YcMQeC
	igpz6Kqyy+rDooTCXK5Mn9dgC5TWRjk6x1N1USKfL2FeIcUjuCvFRGrM8AKr/JeZATXVVLgjDzCaY
	soidknh3CrbwSrHDvujyd8pd7iZ/7c7ruK/0htgHijdFIe8KnE6OIPROxbaSA4hKnAbsq9LauXP39
	JHSzgGH7cWyOyXV0B7t8aSiV6A1WS5geGKejj5RwIYHZ8nlMAX1Z/kSiBdFFUxZgtQsX1etba9j2R
	wluRAd2XQXAO7P7o+LBDPJjwvDql3huMh6WdYDbn8N2N1bb8swrmvYOPZhL7Wr/yZojmC2cuStkYN
	79wICUXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdsyW-0000000DE8c-00m4;
	Sun, 28 Jun 2026 17:07:20 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdsyI-0000000DE4q-3UKY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Jun 2026 17:07:07 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4924944fe6bso17168045e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 10:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782666425; x=1783271225; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zcI4RF/85Hhir6hatnhEodVMpREEtgWBRDdJx84jUwU=;
        b=OPtCsxbyaZ75ORX09gYWJq1Sa6+axGgbzVyFifM4lgHgMQ+KoLumJ9IP2Z+Y4TnKxY
         GbVvNdKxOrgfSjQsy409V0AMv1q8/djw6DKzFlnfwYKut7VoOJXfRT+v8rXKJMXdo+As
         6Pj74IJossK79MWrKzKSNmpKERVubBL5AOlWel82jXWcsakS+HJ5GwGgvM9jAv0tNvyg
         97d33HdorgQqK35O/RgZqFSI1Jv1dSxdqRtHepsrRVb9lmsKercsG8tRHCiJdDyAvfby
         ayVqLKwaXnIsKzCRH6g8+S2/8cHlPAor9ZPoagKBiytuEp5WinvaoMan3ETPpwwU/hop
         DLXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782666425; x=1783271225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zcI4RF/85Hhir6hatnhEodVMpREEtgWBRDdJx84jUwU=;
        b=VmB4/pRuh/YpVjycOpd9P//CoBn5jV0/ARLfJYWOTBJjMld0SbD+dqkefKYzQNlYY+
         7zHsP1Me3VilvK5qoGNbBpvIrThMQNFCCAzWCa34tlWYr8b3/kafc5zM1SnSQ98nG9GU
         pV01Hb+s7YzLA2jiDzd7YXsQNku78n2a0BU+eX8f09H1hdt7eG9xXL2E5pTi8afMQ2Ak
         Cye6eotVUPVzAT3+KRD2wWjud9/9d810QsjDO6oVordKOHyScM8idOS0DQQRYAbDm7ov
         IEY+vGa4Wycn1+qGTDz77X4s5JU56f0SX2MKyhGin1zFGyjKudg0L5JxJG7uinG800dN
         k96Q==
X-Forwarded-Encrypted: i=1; AFNElJ/VHQSdkue5NWORDCv+VrckZtaC+WftrEQ9dTND7P/OhuKkYqIuxDMvTut5OYtF27vW7h6adCAKl/RdT951i/NV@lists.infradead.org
X-Gm-Message-State: AOJu0YxtLu6bai7WcKIig7i95ySZjdg5rRo9TWswLCpDetgnli8lhcZ4
	RgO6CIAJcYmyVuN6q8aC+tSZlDUG7QQPwfzzvEnj9+5cecVgXzRt/tMh
X-Gm-Gg: AfdE7clBR612wMB2qBrIPNV5H0GvWSP0c5rUZBniyl/JbhH0/6YqbPYfzEjQebMiWx1
	SGlNuRT3sbK7TfQZzQxxDflQaVjsJULeyrU9YDUSMzKPpye67xNgLKMdiZFq6RCGuf8ZO/FcSjc
	EesERO7yVD10G7mHfIIvJHVht2iV3UZaCfrHEoGqwS4oZTm0MkEQfNb+eFwm6ioX4ghyUSEZQru
	PdO1DzHwf8KrNHSIFTV0XkAp/BEFCTGDjOqsutYbQxNO6lEYFnK+5hhZ7QTgs6XxFpjIbbQ0Trb
	t27WXB5dJmJgzEaPbW45uxfdt94satUEKDxcqfdh9KSWcBszSkKLzLckySNy8EigfhlMx9zvMn9
	iWuw9d1CkcbANy8gaG6pcGcw9VYhBAup0toRge2rKYLKNVunqROxDTkBw31zmpN4B3NBwkmXhy2
	y3f6N+nBJ705kcq5RqMaCey1RFO1YIS5LgEjfeo3iM9s7HIpJOKZw4cuTHmLxpAW90swfvif7uy
	ArkeTT7O0IPyjTMOPjZoyuAaA==
X-Received: by 2002:a05:600c:3b13:b0:492:450c:57cf with SMTP id 5b1f17b1804b1-492668ad60fmr219184025e9.31.1782666424789;
        Sun, 28 Jun 2026 10:07:04 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493a7fd1b0fsm54217195e9.1.2026.06.28.10.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 10:07:04 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	matthias.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v1 4/4] arm64: dts: am62p5-var-som-symphony: add TPM support
Date: Sun, 28 Jun 2026 19:06:49 +0200
Message-ID: <1cc8986ca13373082e93fa390e4003385a2d5638.1782665899.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782665899.git.stefano.r@variscite.com>
References: <cover.1782665899.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_100706_959696_E3EC3EBD 
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

Add the ST33KTPM2XI2C TPM device on the Symphony carrier board.

The TPM reset signal is driven through a PCAL6408 GPIO expander, so add
the corresponding GPIO expander node. Configure the RGB_SEL board signal
through a GPIO hog to keep the board in the expected configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/ti/k3-am62p5-var-som-symphony.dts     | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-var-som-symphony.dts b/arch/arm64/boot/dts/ti/k3-am62p5-var-som-symphony.dts
index 5c41647ff43f..8fe8ec903d3d 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-var-som-symphony.dts
@@ -293,6 +293,28 @@ &main_i2c1 {
 	clock-frequency = <400000>;
 	status = "okay";
 
+	pcal6408: gpio@21 {
+		compatible = "nxp,pcal6408";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		/* RGB_SEL */
+		lvds-brg-enable-hog {
+			gpio-hog;
+			gpios = <7 GPIO_ACTIVE_HIGH>;
+			output-low;
+			line-name = "lvds_brg_en";
+		};
+	};
+
+	st33ktpm2xi2c: tpm@2e {
+		compatible = "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
+		label = "tpm";
+		reg = <0x2e>;
+		reset-gpios = <&pcal6408 4 GPIO_ACTIVE_LOW>;
+	};
+
 	/* Capacitive touch controller */
 	ft5x06_ts: touchscreen@38 {
 		compatible = "edt,edt-ft5206";
-- 
2.47.3


