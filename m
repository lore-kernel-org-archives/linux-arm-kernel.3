Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ECCAC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 13:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AjwlhaAOkrwwhyUyrS6nha6mqO5aPDlQoHWfonPTSAw=; b=e7tvxWndSW4jRFUjViWKopZyI/
	ndVhWVMy1sFHld7WhKlJpsr9repjAtb6TcFlShzbNFQiZjJPjIADtMq9m0L7A0PCh2nnBWrTlZIlI
	vern5hWUdnQxOTdbNXc/VwCzqBbEViJM7gEDpUYYS3WG60FZlvcdd/sIHFPVdBt0MrTr9HU9x8992
	gjBUNhuJP8zE0e78TGW643D4+TL5DRrFIhfCY+Ba0hLLszlfiR5kq8j/IDWEKu0ZDSlZLaiRcjkdk
	3mFoiJQuN55OPoJeYX1lKEc/amsgp02p2/sbjqsjWkTYg6Wnh+1tYm5zDZiUaU3SBB3LYzsJ9Ax0u
	IeVZuxeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqB7q-0000000B1zO-35qM;
	Thu, 06 Mar 2025 13:18:58 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq9RG-0000000Amp5-481B
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 11:30:56 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-390edaee0cfso420127f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 03:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1741260653; x=1741865453; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AjwlhaAOkrwwhyUyrS6nha6mqO5aPDlQoHWfonPTSAw=;
        b=P+uGgmvwIDWBZVao2nO+8+nE5mD0S60uoLtu63xfsgLE/KjsFWaaDvoeVPd9cejjug
         WPzs+E3qVNSipPTHE0IFykuXkPD/WfiR93AyzxqqnpEPDyUkiAqQN3EX1+oGb7d0t+t0
         mUV7VSbm2p4LNbmKAE9X0lP11LtZ7ktuuBrRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741260653; x=1741865453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AjwlhaAOkrwwhyUyrS6nha6mqO5aPDlQoHWfonPTSAw=;
        b=wpPsImsaMzZ99pzfuEAhuuaiWWfE1VnT3L7jFwU7VkMGhJHKB5yQDzghYHjsL1/Xzb
         aC02z4tKrfaWXnqtN8Itarv8TplDQVSubVsvPLz1988cMKyINUaSUA4ks1UXzeMiNn/4
         0TuFeJF2VeyKNVVjWrT127B/3UFEeCNM4YFNsLuGVJ+3UrWi4SbpJiMbClDpkrHsatD6
         UuuPkmVL1QZiPDxsKTjaKvlHG3qVePJgUtnF/vp7FcEqiW6TXjJxqt3cnrjIbwaLJXmA
         jz+zadD2TO4TtCMWVGVhCOXUAgTcOdS0BodLI08jiDx+v8+simgsUJuDy4gvRspccQq9
         DFXg==
X-Forwarded-Encrypted: i=1; AJvYcCVptImiXq6oEH8pyE8mTawBTgc6Yz5Exc7vEfMXdULkC41uwxdp7SoeMB4WLlfZSnaQ0q0DckkhWs90etfeS8EK@lists.infradead.org
X-Gm-Message-State: AOJu0YwxqQ9pGsZL3FI7E6BqIZgQqh3Yi46DqJ3dD9OTegr2+lo8r20s
	F9EJ7xmS5mnFwFWWzf1T2VrEXnHFYs1eNquX8ebti0Kr2b+ezNQjbYq3dLenRSs=
X-Gm-Gg: ASbGncvkGt2Uhj6jdn4bq5c/MmVZkL3zlh6qhFTgOV7YtGseDNiiU2caCMLx5rxU+D9
	yRvWDpdIgLyUmpdU8KSWgRqVOcWXRxCznGXHYha1M18qt/yvBkbKa4co/sWdPi3mbqyclXb21yK
	R/Kt/tH/IUxFFsIDr7KWbhxHrV8eUJhN3UMC1xDSXbnBdk/2/dTFEv+oOKxFI4b0B4Nj+bNPCc7
	BhTgiRBly9hRJSNZNzrjCkF40+99LTlwvaZtfAWZR/9k1BA1miOCL1yY4YnAvk9+2vEayL34mDc
	J6e28Si6kwmGgm/SU9+iXuQVf83KA/6DrIc5im4Z1a1Q0slHgh7yCrSBB3xYwK7zmTnw1tfzTnt
	JU2TrgA==
X-Google-Smtp-Source: AGHT+IGSCIcSTKiT7I3EfkCIRWduueONT660Ga+g5wK4QQGoA8bK63FcMx77szIfKMFdz74Of9fxSA==
X-Received: by 2002:a05:6000:1ac9:b0:390:de58:d7fe with SMTP id ffacd0b85a97d-3911f7d1074mr7102679f8f.51.1741260653419;
        Thu, 06 Mar 2025 03:30:53 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:4703:aa8c:6eab:8161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfb79b9sm1749650f8f.3.2025.03.06.03.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 03:30:53 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Stephen Boyd <sboyd@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v10 15/18] dt-bindings: clock: imx8m-clock: add PLLs
Date: Thu,  6 Mar 2025 12:28:04 +0100
Message-ID: <20250306112959.242131-16-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306112959.242131-1-dario.binacchi@amarulasolutions.com>
References: <20250306112959.242131-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_033055_019654_43DE5F59 
X-CRM114-Status: UNSURE (   9.90  )
X-CRM114-Notice: Please train this message.
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

Though adding the PLLs to clocks and clock-names properties will break
the ABI, it is required to accurately describe the hardware. Indeed,
the Clock Control Module (CCM) receives clocks from the PLLs and
oscillators and generates clocks for on-chip peripherals.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

(no changes since v7)

Changes in v7:
- Add 'Reviewed-by' tag of Krzysztof Kozlowski

Changes in v6:
- New

 .../bindings/clock/imx8m-clock.yaml           | 27 ++++++++++++++-----
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
index c643d4a81478..d96570bf60dc 100644
--- a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
@@ -29,12 +29,12 @@ properties:
     maxItems: 2
 
   clocks:
-    minItems: 6
-    maxItems: 7
+    minItems: 7
+    maxItems: 10
 
   clock-names:
-    minItems: 6
-    maxItems: 7
+    minItems: 7
+    maxItems: 10
 
   '#clock-cells':
     const: 1
@@ -86,6 +86,10 @@ allOf:
             - description: ext2 clock input
             - description: ext3 clock input
             - description: ext4 clock input
+            - description: audio1 PLL input
+            - description: audio2 PLL input
+            - description: dram PLL input
+            - description: video PLL input
 
         clock-names:
           items:
@@ -95,20 +99,31 @@ allOf:
             - const: clk_ext2
             - const: clk_ext3
             - const: clk_ext4
+            - const: audio_pll1
+            - const: audio_pll2
+            - const: dram_pll
+            - const: video_pll
 
 additionalProperties: false
 
 examples:
   # Clock Control Module node:
   - |
+    #include <dt-bindings/clock/imx8mm-clock.h>
+
     clock-controller@30380000 {
         compatible = "fsl,imx8mm-ccm";
         reg = <0x30380000 0x10000>;
         #clock-cells = <1>;
         clocks = <&osc_32k>, <&osc_24m>, <&clk_ext1>, <&clk_ext2>,
-                 <&clk_ext3>, <&clk_ext4>;
+                 <&clk_ext3>, <&clk_ext4>,
+                 <&anatop IMX8MM_ANATOP_AUDIO_PLL1>,
+                 <&anatop IMX8MM_ANATOP_AUDIO_PLL2>,
+                 <&anatop IMX8MM_ANATOP_DRAM_PLL>,
+                 <&anatop IMX8MM_ANATOP_VIDEO_PLL>;
         clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
-                      "clk_ext3", "clk_ext4";
+                      "clk_ext3", "clk_ext4", "audio_pll1", "audio_pll2",
+                      "dram_pll", "video_pll";
     };
 
   - |
-- 
2.43.0


