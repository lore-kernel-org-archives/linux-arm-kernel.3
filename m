Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CCAFE77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 21:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=68CdHAZCqU/700PS8wNVBBVrBBOJwhpJC23uvX7+CAE=; b=nPN/pqk0lq+ijBV+bAqZD9kbu5
	XOgsWOWomC8Bi0j+ABHg7hykpkASWbHwWhspZapswkDDMI3J2YHiJGcpiMhT/0WJl1Y378+k6gs5M
	/f7/NNwef+MKgn0fSqF5cFQ8aAHqlHwIxqVW3EvqtkSsPjr5xbe4sRSjAx50Xs4FIYH60b3OobDY7
	qPxbWYQ1cogF7+DSo1dhC/Dhz47uNHp+aBexX1yPDwwXQpQp35cmhjqrYqsStWAaBq7IFHPT1VSZS
	d1N95ZGbzt1+iVgoYHGMsqrThxWob4qQIEOCDfEkGGk9xXl1eyFX0WYu1cFa5PC6gO6dLi0MvQ44E
	CDaLJ9cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVzzl-0000000DM4T-0LtP;
	Thu, 09 Jan 2025 21:23:13 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVzw1-0000000DLQp-0HcE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 21:19:22 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5d3e6274015so2108439a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 13:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1736457559; x=1737062359; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=68CdHAZCqU/700PS8wNVBBVrBBOJwhpJC23uvX7+CAE=;
        b=m976qS1ZhfVUli/yk9dvv1v3zG38gCEPPCkcIbMI1F+CLtmE/i9N3o6pdB5hJVlXv3
         Sy/AEhJtDNpIp/mqOP1yZ5ywrzCFKUdTDrPMQYXEBo9KkRx4HG2Aq8bpR3iy9KdNA9D7
         RZPKsl9K2kfZE+RmiIjLDfZOohfxZfPfq+XOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736457559; x=1737062359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=68CdHAZCqU/700PS8wNVBBVrBBOJwhpJC23uvX7+CAE=;
        b=ZTcS8xenl/FjEwJ0pCg7zlr1pZ1i8wsyqahLx2GF2kKCIacjA6fAPdPhHoSnVsaHdj
         f+pRpeGl3aBaVpFmR9jP81bd2d2e9rqJ7MmUhw3dZEfLQ6ozpAPyB/75tMQCzNfjDOUE
         yJmB7uqO2LUbkWRjLnr+aNPLKMmwAc3V2vGCbB9s6gERioZ9EngTvi30V45GDeppVh8j
         tFBWt86Dg1kfmaJkgwOxhCd2nXkDoYxBwrz9wnMPce+HcqeV+1nXa4zCrKe8Qj5UAWkj
         7zk+unSNU6IAv7PiIxmgCFvguIqyz3nMYRDULgNIKcDuhrItyfRQ5rnDkRrgqH4TL7OX
         e6Mw==
X-Forwarded-Encrypted: i=1; AJvYcCVJAMLnx4NGG7cS/78RrEPIy18U+S7Celxoon00pqNx+ynb5AhjS5G+FzkgplFj9SmdRkCu7w85im1sjkiEbyJ4@lists.infradead.org
X-Gm-Message-State: AOJu0YzcYSGeumWp6GrhQvLTQgf6k0sUg0PfPSUbY1wytYvYIlp2f6lL
	hkhrYlsDcMAMkK16EdzaVx7GFoQGyupTBRs4UmjF8WPwdp5BENknXfDufMxxhIk=
X-Gm-Gg: ASbGncvYMkcOlxxNQKklH6P/J3k7r/oIp+dhVK8SylYHzM/NhWDdiR/mw/hybwGRriX
	w30NN8ng2UjdOyOII57JdiiTlklBFm39wYLjYLwy+mVuYUNpsueiykF0agcxFQimwzW/Kzyjc4w
	cH3VYPZi+gYw5OO+lq7zHG9YbE7PDybbbJl7EIYR+KGZLdUsky2PM2XFLK6T/PL/ghktj0ZuWyg
	z0cF7iMFJD9fbj1JX+OO7H6Tv/p07zrHQq+IFv821MQQ489WKWbaMI5vPCSoMbSZzx0GQCoCaYR
	44zFs55iYTexkxI2Jq+SXTQ+EBkcBB1MwNHdS7cBhVXYQJNG8UtZFDEnLWRenrXDyZU8NmISWp5
	LnQf4K8AE1jkwD+ofHw==
X-Google-Smtp-Source: AGHT+IFfiDSYYvGnEgMP2QwNnIkAkHlHP9l0zHJQ4yI1SUJQxTP9wEsEdwJ81wysyqIM0rn1EM70nA==
X-Received: by 2002:a05:6402:4407:b0:5d3:d733:7ad4 with SMTP id 4fb4d7f45d1cf-5d972dfe6abmr8251883a12.3.1736457559390;
        Thu, 09 Jan 2025 13:19:19 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-41-6-15.retail.telecomitalia.it. [79.41.6.15])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d9900c4b56sm925567a12.32.2025.01.09.13.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 13:19:18 -0800 (PST)
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
Subject: [PATCH v2 2/4] dt-bindings: clock: st,stm32-rcc: support spread spectrum clocking
Date: Thu,  9 Jan 2025 22:18:29 +0100
Message-ID: <20250109211908.1553072-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250109211908.1553072-1-dario.binacchi@amarulasolutions.com>
References: <20250109211908.1553072-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_131921_102520_C589868E 
X-CRM114-Status: GOOD (  11.54  )
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
clocking generation is available only for the main PLL of stm32f{4,7}
platforms.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v2:
- Update the commit message
- Change st,ssc-modmethod type from non-unique-string-array to string

 .../bindings/clock/st,stm32-rcc.yaml          | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml b/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml
index 779e547700be..628bbbcf2875 100644
--- a/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml
+++ b/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml
@@ -56,6 +56,26 @@ properties:
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
+    $ref: /schemas/types.yaml#/definitions/string
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
@@ -81,6 +101,10 @@ allOf:
             - description: high speed external (HSE) clock input
             - description: low speed external (LSE) clock input
             - description: Inter-IC sound (I2S) clock input
+        st,ssc-modfreq-hz: false
+        st,ssc-moddepth-permyriad: false
+        st,ssc-modmethod: false
+
     else:
       properties:
         '#clock-cells':
@@ -98,6 +122,18 @@ additionalProperties: false
 
 examples:
   # Reset and Clock Control Module node:
+  - |
+    clock-controller@40023800 {
+        compatible = "st,stm32f42xx-rcc", "st,stm32-rcc";
+        reg = <0x40023800 0x400>;
+        #clock-cells = <2>;
+        #reset-cells = <1>;
+        clocks = <&clk_hse>, <&clk_i2s_ckin>;
+        st,syscfg = <&pwrcfg>;
+        st,ssc-modfreq-hz = <10000>;
+        st,ssc-moddepth-permyriad = <200>;
+        st,ssc-modmethod = "center-spread";
+    };
   - |
     clock-controller@58024400 {
         compatible = "st,stm32h743-rcc", "st,stm32-rcc";
-- 
2.43.0


