Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 268FFC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 06:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4lFy00OTtg40In8pvAKghkkcDK/j3ZCpiu8RgaE7BUc=; b=KDxUTvCrH+lCICOKqq1q9xUNGs
	c029LXD3LWQCMdLP5H837GhumoTZ/SCNCpv+u/a/557dip9MInnUCk4oFkjfIsni+5b75GKb8bGfo
	zmwoZM3s/Z9g6sZPDBsekWl5FxoGbgP+KxjAN0abhzl1bgzD2GKbKf1/92PtyxT15jZgpPwIvMNXy
	c/71Jx273uRRwnbx5yktqSb7juVAHOLOtxs4T9yaQyJYvejCECtpGWRG82naq3Zl6HaBPTwTUFyco
	8dphsqndRNPGTugSanQCoyFAThII+Ncu4TQeweirQOB4nfocOUGuqK55EoZvtHy8Zm0PpyYjmNRaj
	pTLz+z8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7qVZ-0000000D46D-0dNC;
	Thu, 24 Apr 2025 06:56:29 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7pyh-0000000Cyd5-0LLG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 06:22:32 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so3707315e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 23:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745475749; x=1746080549; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4lFy00OTtg40In8pvAKghkkcDK/j3ZCpiu8RgaE7BUc=;
        b=dsJvD+agM7TMcfnsw+dd3f0Ew15ZAAsU+IJtw4venxHJd5ZGdA1zLqnYgYtop130NQ
         zrtRS/U/bJZE4aIk2ecWfUxfoi21n/Lk3mj4NF/T23MG28I21zMhX2LGR/ZUUadY8xc1
         sW9gJwdBICaJJyhCdqBEZSc82Sq1P1NhkpSQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745475749; x=1746080549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4lFy00OTtg40In8pvAKghkkcDK/j3ZCpiu8RgaE7BUc=;
        b=hiGLdC2fGpYLIQYDJVXs58/RHLYwdHT+oS2e7hdTl4bFYf0r/N3HtRU9qZKX0hfV+J
         fSB4AnK/pUdN6lEK3gxCf5dPh8S3Yxnk2HZNUoEFpPlGxt1rQFtZVViAaCIFp0oOA98d
         Y8fgrBZdy7DqmacXfVr3qFv85dSKkxf3LpABaaF7pfQE3+E11KzhZ0aPXnHkQZHE4Eay
         501x8g1CxBmcCd80jZvng/lKoOBeH7brqpNqwm9Jbx//VL7Z8Ar54/tgvJl6Hsx2EZ1u
         La2trLj0T3s/fB04RhQKXf1/ofL3BO9KwltD/g3SJPt7DWRbCyFv7Ssk9XD/WKKMjy0Z
         xZtA==
X-Forwarded-Encrypted: i=1; AJvYcCUMSfQr3VLedWbcOoazFN+oNRcvX9fYD+/o9cx8IHSIUyaHh7LJczyNge/FBcT0N0lXa1XjeoKUub16tCTUawpo@lists.infradead.org
X-Gm-Message-State: AOJu0YzKDAO6yd6mZLHKLf7sqCWQ6Nk8sESBhqvksCzkAGBZ6kGDU5zX
	yqgG/IxdeyNf7wQQuwpB8T3lufQ7o9w6gd5dKj6oU6RGRqaWIlnh3G/u+1ybrag=
X-Gm-Gg: ASbGncuweTo7Bs8eTdv8lctkjydW1RXDxP38lDmqHnLIA2gkWug8nOCsGP62R8U3Yog
	C3H9q4zFgrEgvZzTZTCV0Dry+y1lFQ35ZwNmWKZs/jjsrz0fRMiKRCI48f8bgEq+jDVc1vLun3+
	EW+phaYS9fwERIYUzG/sYlZs9O5jIoCHC69/CXkvnKzAVIyVDxMoDAmuTM7K7QFV+Zhq3ZmWkRy
	d4c9HiRkic5y38FZRkNcymxn5Vn3LnmN6IhA884GBBZrJXF0AJ+xay9RaAnIiYlDJmMbnYTBT2+
	miVTOfi/Pyih8nD6kvRRZEsyk6g8hs46XIhy86Km0gCh0clioxc+9J9leIEu8z8j8DYCNxw8/Vm
	7lGKY
X-Google-Smtp-Source: AGHT+IGGlGn1TKiYozz1AjS13SIEPJhaArHik4vJz2EcfG850BwHredNkQnaeix77ID0kQX88QIyKw==
X-Received: by 2002:a05:600c:2045:b0:439:8490:d1e5 with SMTP id 5b1f17b1804b1-4409c46087amr6406085e9.4.1745475749362;
        Wed, 23 Apr 2025 23:22:29 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2bf8dbsm7243435e9.35.2025.04.23.23.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 23:22:29 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v12 16/19] dt-bindings: clock: imx8m-clock: add PLLs
Date: Thu, 24 Apr 2025 08:21:46 +0200
Message-ID: <20250424062154.2999219-17-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
References: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_232231_122452_ED589F02 
X-CRM114-Status: UNSURE (   9.74  )
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

(no changes since v11)

Changes in v11:
- Fix conflict while rebasing on master

Changes in v7:
- Add 'Reviewed-by' tag of Krzysztof Kozlowski

Changes in v6:
- New

 .../bindings/clock/imx8m-clock.yaml           | 27 ++++++++++++++-----
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
index 4fec55832702..e83f08abd44c 100644
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
@@ -93,6 +93,10 @@ allOf:
             - description: ext2 clock input
             - description: ext3 clock input
             - description: ext4 clock input
+            - description: audio1 PLL input
+            - description: audio2 PLL input
+            - description: dram PLL input
+            - description: video PLL input
 
         clock-names:
           items:
@@ -102,20 +106,31 @@ allOf:
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
         fsl,operating-mode = "nominal";
     };
 
-- 
2.43.0


