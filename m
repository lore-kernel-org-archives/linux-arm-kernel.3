Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8974BE77197
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 18:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DBSWyldngVnQclvBLd3GqHALlVJ1Kxh3yvgFvrg0xjA=; b=H9GpmeXzWM3c61DOOEIUeu3yb3
	ArMFZMncwnohH5XoKmzftJ9PBOUJtkY/MtF4FlWq9LVhbbDfkb9he04YStSeo2Ky+aMV+w6l7oHLG
	NNIpzyOBcsqzBbRfjxWdpUczd96JLmacO7qwAik+zkE1OdayvjTsIjIldd6GyhmFrYhdR9RXJMf5U
	/EqYY/fZRWKqTHmRn+vMdNnxQlkyqhXkOjowGWehgomx3OcZcWof1uuIMGdsTgXBhuQn9/AiSfoNX
	ArdWw4WrVZ5ysLPdD54we8TV6k0Z2X0h/Zb6pwebFu4lOpvNG0dQoLIiyYCU8NwjU2/T07zzok8mM
	+rs50jaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUVFk-0000000HFcV-2Ytx;
	Sun, 05 Jan 2025 18:21:32 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUVA4-0000000HEwf-2YAX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jan 2025 18:15:41 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-aaeecbb7309so1615208466b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jan 2025 10:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1736100939; x=1736705739; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DBSWyldngVnQclvBLd3GqHALlVJ1Kxh3yvgFvrg0xjA=;
        b=mxZGyrtcWKuaihUl2wom5gpp+t2Ts3d4fAQfbOVBOX9akl/9eoMXyZrVQkGpIvFBVZ
         k2SrzuTnMk4rca0p6Uu1YNfv2MMmrv7/DykShFuWasIv0UGSNREFRPzk/X6W2rVvl8NT
         0vgnCs0+S5I0OAdR6YpKMDDEejBW8W/1o8tSQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736100939; x=1736705739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DBSWyldngVnQclvBLd3GqHALlVJ1Kxh3yvgFvrg0xjA=;
        b=dg0cp9yGs8w0mV36jM2LE8ai/BNXWoH8rKezWDtE0UoaSD2oJukMNJ+mQfLNN9EaVZ
         JBeC5j7/z9/BkAJ3YLV7it70Mexs9GuAQclTSb2XXL1aesgZqfmx9o+Q6x8mmAQrrABt
         1A1MTX6SEXE0pg8sGFTmfdGMtL07ceYoIt+zNF76SDjmNW2AkRscBDurd+iFKUZRWV6N
         QHvydIIGCQZzhRM/5jcU5UZzKn3wMT016/eL31wt2qHL45BwLtNSVazHE2zoDABKGvIY
         sofFTFvucIBHnSarwxuARLsCHI5pGT7B3FOIkTOFcHT2uwcpXTzzj/65lY8q8YROmBYC
         Gnvw==
X-Forwarded-Encrypted: i=1; AJvYcCVq9MmyqN1m6LChzgmDtKqi8KMNUeYqisJ5TpWcJgTvqn22KDGiamI0uQ9zJu9PBlPfIUsBOjlTPmyAlEPW1n5S@lists.infradead.org
X-Gm-Message-State: AOJu0Yxlzx8ieosLBgII8duPvn9V+5tNy88Ue6NpagAPxhCOdo/bUT0N
	MMugNeBEPca4J4M+TRGKiBgWWIkvAQGuDxrHAL2X5HUd0THIZSrtCkA7ABxnR10=
X-Gm-Gg: ASbGncsFg+/f90mzLmTdSYWmgjUDEQcN/Dl+zOOG3LnGR6wdID36Y0lLD55Svp3tgZi
	3NkxqWRybFosHJTd8/xKnH/HzW+t04CeC0dLEh7hafE+9QexV0gPYMOiWHBBCMYUkwnmAOafEB2
	/9SJoVOlmYeFCZwu6kMCiJ9ugKAKfmVR9GZVJdYpHknlWnHx/WJXO17aHa71ZmqIRIlycpsX8zn
	oGwvgwYBQjPcA2PGw2FPbB6spiDc2OqiCefxNV+FXPkbfFOhLyju/CFqI8j7iNAubdQ5mICntNY
	8tm8KYOCr5wTxt6KU/I4yV+9D3fpT5Bo3Mo56JnF1PbPDrFuJqEMz4MQEeoRxtcaa12KQy5abFL
	aV/sW3cHfEeRUtHzP+g==
X-Google-Smtp-Source: AGHT+IEouP5DBWHZTHTQqFEZUf+3uEYRS8Zu6JvRBqEkbBu3GJtaa/Q5Qj6PinpQXdyRMCSrqc9f7w==
X-Received: by 2002:a17:907:3e90:b0:aa6:abb2:be12 with SMTP id a640c23a62f3a-aac3354ff4dmr3925314866b.37.1736100938804;
        Sun, 05 Jan 2025 10:15:38 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-41-6-15.retail.telecomitalia.it. [79.41.6.15])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e82f178sm2138185066b.38.2025.01.05.10.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 10:15:38 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 4/6] dt-bindings: clock: st,stm32-rcc: support spread spectrum clocking
Date: Sun,  5 Jan 2025 19:14:16 +0100
Message-ID: <20250105181525.1370822-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250105181525.1370822-1-dario.binacchi@amarulasolutions.com>
References: <20250105181525.1370822-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_101540_643943_C5670158 
X-CRM114-Status: GOOD (  10.24  )
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

The addition of DT bindings for enabling and tuning spread spectrum
clocking generation is available only for the main PLL.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 .../bindings/clock/st,stm32-rcc.yaml          | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml b/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml
index ae9e5b26d876..c345d3ff3fc4 100644
--- a/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml
+++ b/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml
@@ -77,6 +77,26 @@ properties:
       Phandle to system configuration controller. It can be used to control the
       power domain circuitry.
 
+  st,ssc-modfreq-hz:
+    description:
+      The modulation frequency for main PLL (in Hz)
+
+  st,ssc-moddepth-permyriad:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The modulation rate for main PLL (in permyriad, i.e. 0.01%)
+    minimum: 25
+    maximum: 200
+
+  st,ssc-modmethod:
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    description:
+      The modulation techniques for main PLL.
+    items:
+      enum:
+        - center-spread
+        - down-spread
+
 required:
   - compatible
   - reg
@@ -97,6 +117,10 @@ allOf:
           const: 1
           description: |
             The clock index for the specified type.
+        st,ssc-modfreq-hz: false
+        st,ssc-moddepth-permyriad: false
+        st,ssc-modmethod: false
+
     else:
       properties:
         '#clock-cells':
@@ -118,6 +142,9 @@ examples:
         reg = <0x40023800 0x400>;
         clocks = <&clk_hse>, <&clk_i2s_ckin>;
         st,syscfg = <&pwrcfg>;
+        st,ssc-modfreq-hz = <10000>;
+        st,ssc-moddepth-permyriad = <200>;
+        st,ssc-modmethod = "center-spread";
     };
 
   - |
-- 
2.43.0


