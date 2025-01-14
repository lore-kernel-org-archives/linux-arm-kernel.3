Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFFF6C02183
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 18:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zpzT+aUzJ1Q97S7iT1IDWutNkzHMdDAlflIDJCmxtro=; b=s+funEg/um3QK4O+Ss3ZBlQgwt
	t8LDKBgyvpeMhYBxd4B87asvHrHzKlltAyleNuGYuLO2VbChSRgmMt7JIPZVW8vZzN1AT3IgyKrUY
	/BTeQl9UwMHH3JA4TxSKWmr1DDvcB5oxVj1orfGsEOZsE3HrEiZ5I58e0fdEzPOeOVyP1UGGT+/kZ
	VPDyQOuKJ8AdXQohXgMzAqLoZnKa+ZumdYJ6nGvbHUK7vqxeZjHnc4yYVYdNHFiB3nUIUlrrobGfp
	NAW94XAY3yBOsRqA/Jb+4U903k3RKuwDkBtx/QraTAHQREGXu/cRB0K+inOw0OeMY3Y4IYK9WbMPI
	W2fPsJMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXlai-00000009PVb-3imn;
	Tue, 14 Jan 2025 18:24:40 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXlWg-00000009Olj-23mz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 18:20:31 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43675b1155bso66422685e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 10:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1736878829; x=1737483629; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zpzT+aUzJ1Q97S7iT1IDWutNkzHMdDAlflIDJCmxtro=;
        b=Ptl5/5cp3vIAL0bZ0VVdxN51VAp5Rp/1j7hD8eRMRuEge1M7FN9U3HRoCWO3TqaKWW
         lk9hYQyErowRD7RLE5ZI/GxwqWtbxMJD3SKv5j1N+yGAANQwSG8FqFnBlzgmjVOlvmc8
         qDOhTalORXOyRKHHsiui38F+xRMncLbnDgoKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736878829; x=1737483629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zpzT+aUzJ1Q97S7iT1IDWutNkzHMdDAlflIDJCmxtro=;
        b=TxVCkphvNuf/Vxvv4TMPbNpqiLA+cTYayjPzQth/FpqLXAOONZEU3g5VzC48pYsey3
         K/z6HNHgj8jakFI+/8Slb6jUQjqV8vR2EHnj5/MzBuJyxVxCTZWCYVdOTSO1wIf9DQxb
         ELN5b8D/nf91mGxGkq0KoJCF75p0eZ6eszuL/7T1X3yo54sfoDXER2vZ5/Tj49Lx56FQ
         YyRyNwHT83bBQpk6SMu1tLIGZ3lrEypfME8trjHatcy5RA8EUIWTX4ovrRXWFI896gAA
         y+6B+YpnfP5EBg3/RUQSbefCV37kW4bMDmPBPiY6wvz2RB5K95JZM2d0xXNMbdJRb3Pi
         NFqw==
X-Forwarded-Encrypted: i=1; AJvYcCUkvLms7y/6v5aTxWMG6VFAQ2Tbbd8TO3v3bdn/+VjQZfgnBGPfWs6+cfFpDy4cO7VdXE0uwHrWvtss005uJebp@lists.infradead.org
X-Gm-Message-State: AOJu0YwrWrGlworkX/29/PnbQ0+tvCUOazaKnLv7B8eHWuzR0ZYDvkPm
	Ls35AyTv2ABZkuxgQ5YG5PONgrBGZq+mItOemOVcZL9oeMNDmRxf2+rXDw8IT2U=
X-Gm-Gg: ASbGnctJB0ixLxSgrtY8I1Qz39Od++z7RfyHUMjB4/lkzvaiRNnpcoulYyXdGPSAYcm
	hZoIS5oN4hFTz6MA+/CFrYxjd6F5uxanM4tRN+VwoBGubfIolB8Ax2XCu+cIniToMRyHPtV5OOO
	1N/grLrfKqF0GK/FLBo+UgMJ2PK/4j9jKL8r4hWjC0TeJjdrcZhJzVZpFpsie0LtiDcirWC8QtE
	DNQR+SCSJmIAyUVGkqiSqJXReGaanwGUcl4usifr8DXrHte71S+B6gfG1eVm5CUAx2NsDHPMRbw
	+9kCzcbeFEOlaMTNokIj0A==
X-Google-Smtp-Source: AGHT+IHnG0SooqxUeZ0EsULhwv0RsoU3JoPUI7vSBUDQG3JQ9VKYcmjmgQ2ZhBW1LT60TAvEZ1greg==
X-Received: by 2002:a5d:6da2:0:b0:385:fc70:7f6 with SMTP id ffacd0b85a97d-38a872fadf3mr22273830f8f.7.1736878828905;
        Tue, 14 Jan 2025 10:20:28 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.147])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38be66b01c7sm278970f8f.22.2025.01.14.10.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 10:20:28 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
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
Subject: [PATCH v4 2/4] dt-bindings: clock: st,stm32-rcc: support spread spectrum clocking
Date: Tue, 14 Jan 2025 19:19:47 +0100
Message-ID: <20250114182021.670435-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250114182021.670435-1-dario.binacchi@amarulasolutions.com>
References: <20250114182021.670435-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_102030_528665_CF81AA61 
X-CRM114-Status: GOOD (  11.81  )
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

(no changes since v3)

Changes in v3:
- Add 'Reviewed-by' tag of Krzysztof Kozlowski

Changes in v2:
- Update the commit message
- Change st,ssc-modmethod type from non-unique-string-array to string

 .../bindings/clock/st,stm32-rcc.yaml          | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml b/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml
index 8f2494a0b28e..f83a6120d65a 100644
--- a/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml
+++ b/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml
@@ -53,6 +53,26 @@ properties:
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
@@ -78,6 +98,10 @@ allOf:
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
@@ -95,6 +119,18 @@ additionalProperties: false
 
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


