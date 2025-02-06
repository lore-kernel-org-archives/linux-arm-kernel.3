Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83AE3C02196
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 22:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O/a4xSagbqmb3UAk03PlQCeWIa4LP7rwRFx2VsXaGsc=; b=LdCROdjzvvYVIGoqeebq1k2u0q
	NTd/48qGRSaGl8Mc4BICmLdSDEIweyID7HiQWZf3LSG2twZ1WoyBaa5m7HsjnwS8jNJKy69Ixw095
	nSwCVzTyqU3qQ0CzT42i5yM5cne2wI2H+7sTsA3LJR818lIeRTapQDL08D/j9oYJxd2tvuHw6+Jhu
	o9qLHLjWvZ9rE3nmjrjXdR/RhbF4hhd/3nEejVLqgflHScvbj0RxBpzVBMBw4/5h3SdWh+C4d0Psr
	GNYgtjozn3NB8I7bpK/ye0/vkuYX51EFXNJnnTmEaHHE9Bn0Zb3fsVR1CbTWUrgEx+eBO359koqD9
	Zmmz8BoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgA8M-00000007fE3-2jM5;
	Thu, 06 Feb 2025 22:14:06 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgA4T-00000007eg3-1HKT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 22:10:06 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-5fa22d0b88fso834616eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 14:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1738879804; x=1739484604; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O/a4xSagbqmb3UAk03PlQCeWIa4LP7rwRFx2VsXaGsc=;
        b=XxwOs/tz0qksiNmLuuATzX0ZwuNO5F6i7e4rM52xcaxlqYR+jN9FBmxsImEa9YRftD
         wLiby7J7vOfXm7dW+CPqSbNoEESvPh6tDgoJ0iPcAc/Kv3USP6LKaBHofWd59ubAknhQ
         c9URYZF8rO/sO6Y+MVH+lYsuJE71MVqDSdOzg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738879804; x=1739484604;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O/a4xSagbqmb3UAk03PlQCeWIa4LP7rwRFx2VsXaGsc=;
        b=u5pNp6+xnIKLN+n9xSuVojqWU8eEg1grY6FK4dNhWEojLJte2neOid5xkK0l9h80Vs
         9suXlH1nFCaTnpncz7MWhB+/I2w4YZWv+HII0R6OHvPqmC98M8EuJCGNygu/yIfVn2iK
         /GXXao3+cn46mD7To/+IFH1eVcGSGJJ0aQUMDa+8REmnmQek881yKQwxXN2RvpnyPb+4
         D+13gQVjsOhIeQ9nPdlphSSWEQwSV3MyqW8r719/YMgifAN2OeRciDdBa85aL2bBYlG5
         h7UtPXLuGBw4a7FcT/Z9IgoAUp+EVL/F9pUZi4PFftaKkLwC8ytrySqshW+NK2rSR4x+
         /64Q==
X-Forwarded-Encrypted: i=1; AJvYcCV3XIAaKkqt0t6RXDIlea9KOnQkO0NX2JqV3lheK//Q+cA8rhVaL43YCUGIzi42SvZOTATcW4yzf0/VrRLxYNAA@lists.infradead.org
X-Gm-Message-State: AOJu0Yy53wLoRKru3hDPWjK4L7nMpFyKo7Lii3KB8M43iC7j6UUZO3Q1
	j8P+qZpYm2sLWqzSccN7QBIKa6rePU6+Muzk6M0s7H//hgVGoIP5eqRR5gRPGP9AviwSz7N1VAt
	C+Y6D
X-Gm-Gg: ASbGnctAaUD88uJvhm1Ccmz1NtmYBVeLQIP9KsHY00KZAbnwPv7Dxp734WpNEQ61jBo
	yuLIDoaRh2iZtjPk25qQ0Ceq5ynq2kXP7ojA/yixLyLjZrgj2r955uSyISLV7JRwqyLgdMcg5m5
	RxtqXHpuOsIyFX/J7lGyqWlji0ctAZr6Ukmumo9YIGgoh4kQzrksKvLbTWx0RlqshzLeskYlixR
	j+7mBZZ5rHOIMuEr4/H9tO9bqGXd3vevYPpg86CS2xR5yUTbsD5rgtT2HGreSUtw0C9Fqpaq0cW
	lyRXLeXTyKVTaoWT8J/+5b/NectL4JyIZuI8/zHYDzY8KRFpMrs=
X-Google-Smtp-Source: AGHT+IFUhC9g3GBMlrCIsfgANO5KdvzDEnLHzgT9bVl7MomkcLWvLwEBIiP+tF9jny8ui4xtcfFe6w==
X-Received: by 2002:a05:6820:1689:b0:5f8:b916:2516 with SMTP id 006d021491bc7-5fc5e45b47fmr729717eaf.0.1738879804274;
        Thu, 06 Feb 2025 14:10:04 -0800 (PST)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5fc544cf88esm454109eaf.15.2025.02.06.14.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 14:10:03 -0800 (PST)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: ulf.hansson@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	adrian.hunter@intel.com,
	linux-mmc@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wsa+renesas@sang-engineering.com
Cc: f.fainelli@gmail.com,
	bcm-kernel-feedback-list@broadcom.com,
	Kamal Dasu <kdasu@broadcom.com>
Subject: [PATCH RFC 2/3] dt-bindings: mmc: brcm,sdhci-brcmstb: Add sdio sharing support
Date: Thu,  6 Feb 2025 17:09:39 -0500
Message-Id: <20250206220940.10553-3-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250206220940.10553-1-kamal.dasu@broadcom.com>
References: <20250206220940.10553-1-kamal.dasu@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_141005_344696_85CCD1C1 
X-CRM114-Status: UNSURE (   9.26  )
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

From: Kamal Dasu <kdasu@broadcom.com>

Introduce emmc flash sharing support using hardware semaphore
and SDIO share register to synchronize between TZOS and linux.

Signed-off-by: Kamal Dasu <kdasu@broadcom.com>
---
 .../bindings/mmc/brcm,sdhci-brcmstb.yaml         | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/brcm,sdhci-brcmstb.yaml b/Documentation/devicetree/bindings/mmc/brcm,sdhci-brcmstb.yaml
index eee6be7a7867..b0ee39aeccb1 100644
--- a/Documentation/devicetree/bindings/mmc/brcm,sdhci-brcmstb.yaml
+++ b/Documentation/devicetree/bindings/mmc/brcm,sdhci-brcmstb.yaml
@@ -27,15 +27,23 @@ properties:
           - const: brcm,sdhci-brcmstb
 
   reg:
-    maxItems: 2
+    minItems: 2
 
   reg-names:
     items:
       - const: host
       - const: cfg
+      - const: share        # Optional reg 
+      - const: mmc_sem      # Optional reg
+      - const: flshr_ipis0  # Optional reg
 
   interrupts:
-    maxItems: 1
+    minItems: 1
+
+  interrupt-names:
+    items:
+      - const: SDIO1_0
+      - const: recv_ipi0   # Optional interrupt
 
   clocks:
     minItems: 1
@@ -76,6 +84,7 @@ required:
   - compatible
   - reg
   - interrupts
+  - interrupt-names
   - clocks
   - clock-names
 
@@ -111,7 +120,8 @@ examples:
       supports-cqe;
       non-removable;
       bus-width = <0x8>;
-      interrupts = <0x0 0x27 0x4>;
+      interrupts-extended = <0x1 0x0 0x1f 0x4 0x18 0x11>;
+      interrupt-names = "SDIO1_0", "recv_ipi0";
       clocks = <&scmi_clk 245>;
       clock-names = "sw_sdio";
     };
-- 
2.17.1


