Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89718E6F086
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 20:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cnKll+Mu3yr6wHuUg3E47hI29XfbMlTNI5VvcSPHEnI=; b=E7758hklDmz9YuJE5kYx4DrcT+
	MINXR1rneRBsPvcogq9agb0FR3WvQe19meXbnoOhxl3/NP/t5TzjRX0A7Cg80YLskOe5zbpvGwgqq
	C/8wGMZq004el1+AhJBdZY9MjjZQUrggUVFP1dBQnlJB9qevPWepWWNAoy9zDw9i0FWQA/yrGd35a
	2yoCbWCaS03p8McXdl/L6X+2NYPEGHyDGVSbAybrxdgMhsNlNqsndRWKs4Zq0S6ljyBpGVhe5hgQW
	yH1TPuCS0DQDE4H39U9EiB1ak2ByWYEohIJPsNVB4T2zvS3RMM/xQ9PXr9lmNvgofmxlo4sTs0zgv
	KJH9vH0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY8rG-0000000G2Zn-30tH;
	Tue, 23 Dec 2025 20:19:50 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY8rF-0000000G2ZK-0Lbl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 20:19:50 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-7b9c17dd591so4697040b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 12:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1766521188; x=1767125988; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cnKll+Mu3yr6wHuUg3E47hI29XfbMlTNI5VvcSPHEnI=;
        b=E914dH6f5J4E0uuk4WA3x+3fCMiGf1xrqC0U5WGmyGHOPcwwjYCOxHQNEYhG06pG7D
         /suhTzw62PhSyGPNqfkQfeJMNjmFEkZWK9dupf4wBh9wAMBfu8Z8ys+kYpNFJBpQ+QGS
         vy97R1ZNE+XFKdN4/YLPW4MTPyNEMTwyDiqHYqPVtEpCxFrcp7A2pzPBi9Q5ALzWDLpz
         0wZrltD3i1WuUdCmVRk9aYs1y5d3vPqDA2KttElLn3pGUW58P5CwO6vWjhmxMV3TiOw+
         ZN5vPPpQYTLmr4GCd+4PylBFlL7r65EhBnNTeMiCiI/IeKnblD6AAHR4+lrJhoLkk0EL
         cTQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766521188; x=1767125988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cnKll+Mu3yr6wHuUg3E47hI29XfbMlTNI5VvcSPHEnI=;
        b=ujskWc5JBJKOt2JDsB7I5CL4HYO5wfkTiXlJFeWedDWZ9DTME28N74T1cILu2YcdLn
         aX/RFrF2H1u7MGuMw7tKXz5UNVy8mqODdedIjyH3Vgsg4FoM+St4WZ3CQC4RxzaAANmM
         RgbzJot4L6q8ypmpVa5/AnGRNB+dkyws1KlH+SViWDkA2H8uQrUIXOjUTub/RRMwhQrh
         gyrdDFfqsJ6sD+SAu4PBi9qOXomEzskE1mCSXr0yLFRdiWY3rXnIt2qXoysqfs+kRfRU
         DMaqng7vNnYATDcRFhqzDjdxKjvDXmlIrkbuIOMhOwC2/VBYcFf0cNnVO68DeDK4c1Lu
         DoBg==
X-Forwarded-Encrypted: i=1; AJvYcCWhJPmpjdv+YIG/3A/9tjU/eTSaEnU2fLZ0lKnK3+oxRBOegjihDILAK+9ZLC7i0rahEH73PAemQajkFhbUWfO7@lists.infradead.org
X-Gm-Message-State: AOJu0YzkwwdU6ynvtXU/kRHBrkHFvxq/kOhMGNGMZz8nkTMlzzII0Dp2
	uTZ6i2wzM1qHVr8vMNyB77bbtHR3S+JvCw/FjDpyUG9C3bLPdk+zeRjjkk5/cQv2k+A=
X-Gm-Gg: AY/fxX63W3ktrb+iHagH+eeSbO67cWWMQFaUebe+ECBmZy7vwVQg63hIuhp9ImN4+MZ
	6HGC5hYXupkjI5oAkpaRiRu7kZv6YTHQHLxtx4Jc7hwiWRbbm+QKMhS34/H00cnBIvhhYhOOmPe
	xIR+f5SX6w+gj2hvOSZe63EXxpYDxEcxU4peCIdGbV0GLb0E2yh7eVd+cNPsF2XQmqBeocsLJ4O
	zVaingV7O0EZmyiOPDo9o1MqVDA9hIZRv+KuaxCHlECrZ/eR/5TfBpfn7urhRPgTv38RzPhZma7
	qcyVqhFEVR0ta/copk7bVfa1Ve9NepR123HHLJis5j7o+QXcd/qUjeORHPxNZoV2ROtVG9Ld+uz
	jZMpNNaeNzTBg8UAL2/g/D5RXIBqiQuer5dYNSeSw1nWGnjaN8yp4QSrX8bN9vnoaTmdiayrDO/
	y07+EWelloTJqDEYTLwJtLtnadrIOH+dQbAak/T8W5Tv8DOedViy/8j/dpvxVkA3XGlnQC3ss58
	/RuplHS
X-Google-Smtp-Source: AGHT+IE+Anjl+JtTMJZqrlQreb+g+wMpx+gUdAmyeFe7d/HK4xJHxIHW6brkXbwTDShJoU/zn1Vu9Q==
X-Received: by 2002:a05:6a20:939f:b0:366:1fea:9b54 with SMTP id adf61e73a8af0-376a96b9a4fmr12941961637.39.1766521187944;
        Tue, 23 Dec 2025 12:19:47 -0800 (PST)
Received: from fedora (dh207-15-53.xnet.hr. [88.207.15.53])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c1e7cbfa619sm12567549a12.36.2025.12.23.12.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 12:19:47 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	vkoul@kernel.org,
	andi.shyti@kernel.org,
	lee@kernel.org,
	andrew+netdev@lunn.ch,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linusw@kernel.org,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	olivia@selenic.com,
	radu_nicolae.pirea@upb.ro,
	richard.genoud@bootlin.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	broonie@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	lars.povlsen@microchip.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v3 01/15] include: dt-bindings: add LAN969x clock bindings
Date: Tue, 23 Dec 2025 21:16:12 +0100
Message-ID: <20251223201921.1332786-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251223201921.1332786-1-robert.marko@sartura.hr>
References: <20251223201921.1332786-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_121949_124277_2350912D 
X-CRM114-Status: GOOD (  10.82  )
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

Add the required LAN969x clock bindings.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v2:
* Rename file to microchip,lan9691.h

 include/dt-bindings/clock/microchip,lan9691.h | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 include/dt-bindings/clock/microchip,lan9691.h

diff --git a/include/dt-bindings/clock/microchip,lan9691.h b/include/dt-bindings/clock/microchip,lan9691.h
new file mode 100644
index 000000000000..260370c2b238
--- /dev/null
+++ b/include/dt-bindings/clock/microchip,lan9691.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_CLK_LAN9691_H
+#define _DT_BINDINGS_CLK_LAN9691_H
+
+#define GCK_ID_QSPI0		0
+#define GCK_ID_QSPI2		1
+#define GCK_ID_SDMMC0		2
+#define GCK_ID_SDMMC1		3
+#define GCK_ID_MCAN0		4
+#define GCK_ID_MCAN1		5
+#define GCK_ID_FLEXCOM0		6
+#define GCK_ID_FLEXCOM1		7
+#define GCK_ID_FLEXCOM2		8
+#define GCK_ID_FLEXCOM3		9
+#define GCK_ID_TIMER		10
+#define GCK_ID_USB_REFCLK	11
+
+/* Gate clocks */
+#define GCK_GATE_USB_DRD	12
+#define GCK_GATE_MCRAMC		13
+#define GCK_GATE_HMATRIX	14
+
+#endif
-- 
2.52.0


