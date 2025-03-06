Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D13C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 12:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AuN0/pwTHZ9vhnZKyENKczH8fXv0gjKVeEKQIoqI9qs=; b=SXRZTE7n5O9hWLtE7HmIaXu7oM
	ugmevEyH85pDdNEcwhF4rXGytO3CBjSS+s7GgxkjZMGyT8DDpWpqyit8/tfJxAdgPcV6wsutH87Hk
	00fP7ZyZtcxloOKupPS/CJR89cw4nMRtmx8AaqvI0/HOtS8CgUVslHxsz2/yUAXFS0MZeP6W5+Yo9
	LyK59Olccb/Ulx7RZMcQvPHtyX1QZzL4ejg0USvGSnVXtNjM5Nn6vFdLGTMdxzvrxsS484aLVX+iF
	RnN1EtmM9ZDLUuyNX/tmcptoUAtTnH4vmiy8NPMXbymcexCUD0Tj2RSxdKW4DO59momG4iYSl07Qq
	C1/S8vdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqAQJ-0000000AvnK-1VJI;
	Thu, 06 Mar 2025 12:33:59 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq9Cr-0000000Akc6-1cug
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 11:16:02 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43bc4b16135so2966365e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 03:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1741259760; x=1741864560; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AuN0/pwTHZ9vhnZKyENKczH8fXv0gjKVeEKQIoqI9qs=;
        b=BnY3kWn5jeLsYMABpo4Zmb4sC0L5I+QMQwD9aRjA/bN5ktBOF3Vz6X039g/m6PU3Af
         yUzOnx0jW1M6ZHkUPvt8W9DD3lyxL71juIcYIvmv7wuQapXG6FTfCsjA81W1g/OUth4S
         ad7o4q3VljH+wDALviX/YfrSDSAKM1zy0Dlcb0FsKb7a0OMraKIhPkL2oE6DKLhD8eM+
         dMZRwXmEKQOObVAZjwCqeaIlDmc7RnzDihkwYek8yPugE7oyBqwjcscMg2Y5AM8UftUI
         ZPbp5FveBxEfnOCcxtVr+lV5img8jEIZZEabUUscxORRki9f30bpJY4/AiypYYJNNFXg
         3w5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741259760; x=1741864560;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AuN0/pwTHZ9vhnZKyENKczH8fXv0gjKVeEKQIoqI9qs=;
        b=rljXTaTNpotw4PwxKclyOanoP49SDbeqlU9lCMNesqgtTWuL3kBNzPV2ghASYPl7QX
         MRf8mKXNGVOj0SXvFIrWbVYlqj9bLowkxrXpcm9AlP2bfxf6Nf9WA3K6K6DwhuTtzdaC
         Ea6JvqTbjmavjQnKquT1x/Hr+wsD8HFQBzMcGMULYwiLg8NFna/XNu8U4qA0MbTm2ktu
         wwm/nHywR+C7cl0flyzxavD4tgtTS+kblrQoUBNhkCTvOovLJek4lj1LngnX43IwrAbJ
         enf7r8+xrLXpWpHNkTALcsta//o6s32bi0+zYx/f+7byrW1oJM0tn20gE0Ax4mIhov0e
         umkg==
X-Gm-Message-State: AOJu0YxazNptnwfudRODCgda4hItI6YGbI5ZqtYjH29+qHc5X55fLU/O
	pSlfMtRUMs4pI7E+vuJzzchu7Bq1NkeWeD838TGUQZeSk4IP4O/Jy265efnAXdmsRosNlg0YeM9
	4
X-Gm-Gg: ASbGncuk7iYwhMbFk484oCqtnnQkiqu0qO7x2GKaL7DpYLdaE6sxOx1QEFADFKAWfUX
	F2PmDrVifSNJ0pwY+jS6mJ0JogZIiQtIm7erhmNFi46ESau9tV4tkG2q4T0geL2MDDvzTJo9i5P
	znFwuu+brN9p2Xbwt8qQVKGF0NkP8M9hLQkY2cp8W9CjWFAHrdU1rrkeUB7OM04MsxGUQKnj2AD
	fxu6Nj64qIyVWEMz+ZRg4P1hZ+EeTbVafQNOJr7/GHRP7MeRGzpR4nxGzGWEHA+5x2IV9jmH/AS
	eC/KmzDQ8XvEAwZ+M8KkgO3CMu+sMMHHFkyscMVVlg==
X-Google-Smtp-Source: AGHT+IEfL0NWZoLLWRUTFCp+4DpyOhfP6ZpCXD8lXd7n6hvyRmuTOarjAISZof3JEfKOs/w46sjnwA==
X-Received: by 2002:a5d:6c6f:0:b0:391:2e7:6811 with SMTP id ffacd0b85a97d-3911f7404b0mr5947283f8f.14.1741259759759;
        Thu, 06 Mar 2025 03:15:59 -0800 (PST)
Received: from localhost ([2001:4091:a245:8327:80ad:8144:3b07:4679])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5e5c768f213sm784211a12.74.2025.03.06.03.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 03:15:59 -0800 (PST)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Thu, 06 Mar 2025 12:14:41 +0100
Subject: [PATCH v5 03/13] dt-bindings: can: m_can: Add wakeup properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250306-topic-am62-partialio-v6-12-b4-v5-3-f9323d3744a2@baylibre.com>
References: <20250306-topic-am62-partialio-v6-12-b4-v5-0-f9323d3744a2@baylibre.com>
In-Reply-To: <20250306-topic-am62-partialio-v6-12-b4-v5-0-f9323d3744a2@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Anand Gadiyar <gadiyar@ti.com>, 
 Chandrasekar Ramakrishnan <rcsekar@samsung.com>, 
 Marc Kleine-Budde <mkl@pengutronix.de>, 
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Vishal Mahaveer <vishalm@ti.com>, 
 Kevin Hilman <khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, Kendall Willis <k-willis@ti.com>, 
 linux-can@vger.kernel.org, Markus Schneider-Pargmann <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1648; i=msp@baylibre.com;
 h=from:subject:message-id; bh=MfFZLvNgPjqf41DYixOzP+LujWeubVPB6G1Uw3Qe6a8=;
 b=owGbwMvMwCGm0rPl0RXRdfaMp9WSGNJPNm9X+56w2K1+/c7Ce/Gfi6IMU0XDit/e/J73zXtzp
 W5s6zTmjlIWBjEOBlkxRZa7Hxa+q5O7viBi3SNHmDmsTCBDGLg4BWAi1SWMDJ/1uafnP3n+07y1
 66coo+WxvoOrREtrviwpnH+vqGLmqkZGhhNuT4pTtrVatqdxV/z9eJT7rnO1YN/Tkwsd4/VS7u/
 U4gYA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_031601_429362_D152747A 
X-CRM114-Status: GOOD (  11.25  )
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

The pins associated with m_can have to have a special configuration to
be able to wakeup the SoC from some system states. This configuration is
described in the wakeup pinctrl state while the default state describes
the default configuration.

Also m_can can be a wakeup-source if capable of wakeup.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 .../devicetree/bindings/net/can/bosch,m_can.yaml       | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/can/bosch,m_can.yaml b/Documentation/devicetree/bindings/net/can/bosch,m_can.yaml
index c4887522e8fe97c3947357b4dbd4ecf20ee8100a..0c1f9fa7371897d45539ead49c9d290fb4966f30 100644
--- a/Documentation/devicetree/bindings/net/can/bosch,m_can.yaml
+++ b/Documentation/devicetree/bindings/net/can/bosch,m_can.yaml
@@ -106,6 +106,22 @@ properties:
         maximum: 32
     minItems: 1
 
+  pinctrl-0:
+    description: Default pinctrl state
+
+  pinctrl-1:
+    description: Wakeup pinctrl state
+
+  pinctrl-names:
+    description:
+      When present should contain at least "default" describing the default pin
+      states. The second state called "wakeup" describes the pins in their
+      wakeup configuration required to exit sleep states.
+    minItems: 1
+    items:
+      - const: default
+      - const: wakeup
+
   power-domains:
     description:
       Power domain provider node and an args specifier containing
@@ -122,6 +138,8 @@ properties:
     minItems: 1
     maxItems: 2
 
+  wakeup-source: true
+
 required:
   - compatible
   - reg

-- 
2.47.2


