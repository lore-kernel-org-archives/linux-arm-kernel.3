Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77F76C36001
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 14:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YIPPP5ujVDHuio5jUo3vfs/ZWMgoIwqmA1jTNPm5vS8=; b=vAthrKruxUjBWJLzscfFiVLJpY
	NfuSpBQwO/cO+y8lcWUnIbLUtdPHblKwDElqTTZJldOYLmYh+7+osL2NdO42Bx20QZpKgJ4/vSrvt
	jGyb+x/5Xx6b+77dKeoDYVeA/TWXLWkEuVkc/eBHt85Www9Q4ZpXdAc35k0czXrNR11W71v1CQE5/
	YjcJudCiVNf+aSiC7RclUw88URjKicRTDONJ0UaJ6YE5G4Q/GAKfiHv5bc1HmkQ2DD8UrsL/mwOLq
	WWXXDCfmqSuni2e2AlXJy7jJ89OVelY/HDrp8yurlhmldk7hFAkuKlbUk/walBacUrC15n/ac0JIX
	ms+H4Gvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvcyo-0000000F1lI-3axv;
	Fri, 21 Mar 2025 14:04:10 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvctq-0000000F0Ux-1Rip;
	Fri, 21 Mar 2025 13:59:03 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso1802851f8f.0;
        Fri, 21 Mar 2025 06:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742565541; x=1743170341; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YIPPP5ujVDHuio5jUo3vfs/ZWMgoIwqmA1jTNPm5vS8=;
        b=N/+f448kqs3NbHr0b+a0T78dD57V9yME1WsFmHjtyOA/5nOkOnMzWD02gwy5SRj84Q
         LGcs2Uk6Pk1N5HFg83N/L7bYgO7ETLmsiCoDzP4Co1TfO0b7XNYDtqWMNRI2M8SoQrZV
         7vgZQq76rw980QmTWnP+f+h2MehhkpGFFcl3kp/RjYfhGvJrKfW4r6lROWqXUjz9fo3r
         0DmzhxAlBhxlwCP0B5j5vDeoBd0k3BadiIYNqRnYVk+9+R3w05vpS/gWj6KjE4Fj/pZF
         dnmZ16QnMhZpV2cPfEmhNGdyB2B0uSfQgA3n0Tk2D4QbTGdjuBj1ygsBsHtj8bCU5F6x
         Gdgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742565541; x=1743170341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YIPPP5ujVDHuio5jUo3vfs/ZWMgoIwqmA1jTNPm5vS8=;
        b=tHadnJpeXoT4dtKxDrjgvHZk7aNOm6g3va3dZpaBkYEQImhqvtGFH/80qdr2UiHaFL
         pON4tN4t941AyFeOElhOtVLaR7e39vjae69emVbFN6wDNz10LyikLnGj6BMZCLSbha+l
         /s1fO0Xq/PikkLFbAe9KQis5Apz9HqgL2JUODvG7Cz3RvYwh9VFE8uwB0sqhm9O6CnkG
         nHMsL+KF3OeBTEcF6om8gwAo8lLQTrkTLpM+besisPRD9qo36jxoYZ4hC6zypFaJla+Q
         l5PKuj9NYIQdmNZSVpnhX4V3RrjXybzm2GI1NzO+OE48Zsd11t7aseTj+W8HSv1u8w+f
         6NEw==
X-Forwarded-Encrypted: i=1; AJvYcCV1JbMtcxrNH23/ami9UaxVMkMW1Q9DDxz4akyDDJED+LBSNv7lVnJ5ksYKRNaiOk+G7V47yrKGaA3Smvou2Nff@lists.infradead.org, AJvYcCVPrn3vi/qxxHJy1wyOY0nVc0SgXp7iGgzo4IXCzNb3sH7E8apj31sMCQVvZOFiIg37RWozZ6VrAnSI@lists.infradead.org
X-Gm-Message-State: AOJu0YxZNMMQmfMDjDD2NP9pZ/TNOiII1MDOHCXINAri9mhqn0JD/1RK
	DXG3rKGq/u7j8e3NMkIvG+8AjGIKEicP0IRmvwB+7HVVBFFu6lGT
X-Gm-Gg: ASbGncvuCMoi7obOynu5kk+NLID9mjnsk8aM4CEr/ze6twNWwIqQpLtV/uT32QbrXYp
	1jpZK/Y0eYqiX7TNZ/yTgGI0eXaVv6WedKa4KfPPTPoluobyGMYiHE/DfasAU4YiUA6/81Nv1+P
	GSS4rZJMVdE/LuZf83pwlWZe/YiAecEtZ88VLjrJZh8oxExgpvTMlkRrXM4ySVqD09Z2605twZz
	04sHxGaUDsiCze1MrZtMr01exrxFtrK4dh2EgIkuqHkOw36Rp4B/smCNIBtyx0B85ohZQi6muOq
	S/l8cR9oIRPAM5mgwh8dfWQJKKtzSJeFYUHl9DvLIPUl5gTLtNy2vBszpuSIQ2SZn4+/9aq26zU
	h/4p16hkprA4MM52OSgoJoeyHTNZz9VM=
X-Google-Smtp-Source: AGHT+IFPFP42aVOYqjs1M5n27C94uUx314miaX7k0Qe1RphsqIE1/Aq6oAnk++IxGDHQycnfkPWZLg==
X-Received: by 2002:a5d:6485:0:b0:391:4231:414 with SMTP id ffacd0b85a97d-3997f9397e6mr3645126f8f.40.1742565540690;
        Fri, 21 Mar 2025 06:59:00 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9e6651sm2437162f8f.75.2025.03.21.06.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 06:59:00 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v3 02/10] dt-bindings: phy: samsung,usb3-drd-phy: add exynos2200 support
Date: Fri, 21 Mar 2025 15:58:46 +0200
Message-ID: <20250321135854.1431375-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250321135854.1431375-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250321135854.1431375-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_065902_382964_76E2DAA7 
X-CRM114-Status: GOOD (  10.65  )
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

Document support for Exynos2200. As the USBDRD 3.2 4nm controller
consists of Synopsys eUSB2.0 phy and USBDP/SS combophy, which will
be handled by external drivers, define only the bus clocked used
by the link controller.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../bindings/phy/samsung,usb3-drd-phy.yaml    | 38 +++++++++++++++++--
 1 file changed, 34 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index 16321cdd4..819e4afe6 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -26,6 +26,7 @@ properties:
   compatible:
     enum:
       - google,gs101-usb31drd-phy
+      - samsung,exynos2200-usb32drd-phy
       - samsung,exynos5250-usbdrd-phy
       - samsung,exynos5420-usbdrd-phy
       - samsung,exynos5433-usbdrd-phy
@@ -33,24 +34,32 @@ properties:
       - samsung,exynos850-usbdrd-phy
 
   clocks:
-    minItems: 2
+    minItems: 1
     maxItems: 5
 
   clock-names:
-    minItems: 2
+    minItems: 1
     maxItems: 5
     description: |
-      At least two clocks::
+      Typically two clocks::
         - Main PHY clock (same as USB DRD controller i.e. DWC3 IP clock), used
           for register access.
         - PHY reference clock (usually crystal clock), used for PHY operations,
           associated by phy name. It is used to determine bit values for clock
           settings register.  For Exynos5420 this is given as 'sclk_usbphy30'
-          in the CMU.
+          in the CMU. It's not needed for Exynos2200.
 
   "#phy-cells":
     const: 1
 
+  phys:
+    maxItems: 1
+    description:
+      Phandle to USBDRD-underlying high-speed PHY
+
+  phy-names:
+    const: hs
+
   port:
     $ref: /schemas/graph.yaml#/properties/port
     description:
@@ -137,6 +146,27 @@ allOf:
         - vdda-usbdp-supply
         - vddh-usbdp-supply
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynos2200-usb32drd-phy
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names:
+          items:
+            - const: phy
+        reg:
+          maxItems: 1
+        reg-names:
+          maxItems: 1
+      required:
+        - phys
+        - phy-names
+
   - if:
       properties:
         compatible:
-- 
2.43.0


