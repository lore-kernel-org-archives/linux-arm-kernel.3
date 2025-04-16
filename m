Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 660C8C369BD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 10:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dxtx+wYgnayT5+SYG5cHUYe65nSDdAbTREq4fQgE5Vg=; b=SBQF0rHNfqU7t+6HNoXVZM3mwa
	xnXOK9UIOeoufPdgJPrTjxsFm38dUYQxMXsitS4pxUoKEpsrGLxv5J6BHyDDopCL3K0aJvSPl/MtX
	XWtjXt5ONYH3+EIdilVI2+HqgTCes+iMtNI1TDLXSSlsPq9g68mkQzrhUYKh72UggoXRr/A12e/aR
	t9TRPKOthFpC9f3sLlYCoBLdcTNg9wMMuJXww8Dbfne1psrRC8vWtBHjFYf7N+4IJfF3l1LWAVOrx
	RJNbn6PC1R0Wli6Z/a5c2oeMQs+DhAaNVFZEadvHkfGTYkFnn0uSmLYk2zk5YyjPAgTO1fJYmfIck
	Wu2DRE8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u50Fc-00000009Fty-1vMw;
	Wed, 16 Apr 2025 10:44:16 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u50Bu-00000009F8a-1fXp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 10:40:28 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-39c266c1389so4627094f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 03:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744800025; x=1745404825; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dxtx+wYgnayT5+SYG5cHUYe65nSDdAbTREq4fQgE5Vg=;
        b=BSx7D4eg++D5d98U9PnRw2wmTx8b0KvPsp9O8AGG5ucnp6Fy9kCdd/vQcffMbvTW4L
         xOANsVa7d6MPW4t6iG9F1a3n8nbMc4UpRZzLcjeU0bTthgLpuDhssx9AB95+6p6H+MNd
         2wcogEf5bfmDjArn7BtT+LSVBosoXmgyMNWEP+QOGfs6UEbgAEaDLBDXUrwTzBtV1tiM
         7GBbCTYt1jcdH28GBIsk19f70npf6hEXDryHMJbD4GV8uuMff/7zqFnWKVOcsNxYgeBt
         FirA+7ph2mA0/mVoWYqo2mKGvkyZrRIm7y50FIcDgnIQhlZ2+VODMm2voVmEivWsmt8a
         XgsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744800025; x=1745404825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dxtx+wYgnayT5+SYG5cHUYe65nSDdAbTREq4fQgE5Vg=;
        b=GuxFObmnUplQnSFlait/mv6jWGjb81q4Os8csQ4rudxkRl2lfqyhy201oK19z5z0s5
         GJA8kDAbUXspDeQf+p13dPdc2d6VmXgblu91GtLFuP3pRaCkq4eyVL+GcGyZOWDIz9KQ
         fUsZ3HK2m5ZB6xebdEYLzduTNGI7ZJCIfUA63Q8WCVVf4Ij3SdOL+f/QpK/GHGm6oIHL
         8WNSDnbR+TrOZE4g+/YwirBHektvtuM+S1RF8Tcu86yl2VDlHYXFgfjxjq2LLvFrohiy
         5a/TJq7e3atOPRX/gtn7sJBIZWQCncXuXYuGGZrXnRpXpCeRh1fcDnd5RAXDiC1fRiA4
         zg/w==
X-Forwarded-Encrypted: i=1; AJvYcCU0PF3XiWyH9hnMov82iwdIUX2B3NtH81mV8MqAyLm3hfg78YoZ2q9hXsNxvpKl6ERuf715IJhy9svlbkvr42JS@lists.infradead.org
X-Gm-Message-State: AOJu0YwOPVsSNw8phPtv7LG8xYYQNkdsT8eBPjgzQctK7+ZPcDFx2Sl6
	AwmuvwJMFX8JZDPioKjT8bhrswNtlpnMZQXSygoVBPj7lfHcMFTp
X-Gm-Gg: ASbGnctnwmRIpCehOza5Xditu23p32CzEk8+K1BKG7nfh/xBuiVH/drxgvKEE/XgLIF
	dDUCxo7NyIYDbe9MrsPI10BncrKBhSbJEj+Bn7H8eUwNehrUVSh5CQnG/nn+LPpH4aAwujEGTCo
	a8hwpgtBMElGR+Ig4bByHzzPATMtp4ohIf33cgjkMl/aekKN+uKjo9rRTZOdg6VmJpukdO5r5G+
	de3xGq+l5JvUzARf7S7AH/u9qRXgVBSfn6++NRogjZs2a9odCnTABTVa6l3xct8k1UctKOMuGQF
	xNuj0a8bLhyw7W6u2hx6+hNzxG4ybu69cdU9y4YkZ5dLc76LfPR1/N9n5F6vHbDQHzJ5DZWsIFh
	z
X-Google-Smtp-Source: AGHT+IHjVa5WDXcZCkMbAi3WRxmtcXMiaUdkFnUUCMfrR94dmm4AfGyFddim6DuqjvutFE0yMpkmTA==
X-Received: by 2002:a5d:5f49:0:b0:390:eebc:6f32 with SMTP id ffacd0b85a97d-39ee5bade02mr1377171f8f.48.1744800024211;
        Wed, 16 Apr 2025 03:40:24 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:b4a2:e121:10d6:ac54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae964089sm16824975f8f.15.2025.04.16.03.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 03:40:23 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v7 1/4] dt-bindings: net: dwmac: Increase 'maxItems' for 'interrupts' and 'interrupt-names'
Date: Wed, 16 Apr 2025 11:40:12 +0100
Message-ID: <20250416104015.47788-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250416104015.47788-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250416104015.47788-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_034026_452254_913D2CE5 
X-CRM114-Status: GOOD (  11.61  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Increase the `maxItems` value for the `interrupts` and `interrupt-names`
properties to 11 to support additional per-channel Tx/Rx completion
interrupts on the Renesas RZ/V2H(P) SoC, which features the
`snps,dwmac-5.20` IP.

Refactor the `interrupt-names` property by replacing repeated `enum`
entries with a `oneOf` list. Add support for per-channel receive and
transmit completion interrupts using regex patterns.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/net/snps,dwmac.yaml   | 24 ++++++++++++-------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 78b3030dc56d..4d4fcaeca8a8 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -114,19 +114,25 @@ properties:
 
   interrupts:
     minItems: 1
-    items:
-      - description: Combined signal for various interrupt events
-      - description: The interrupt to manage the remote wake-up packet detection
-      - description: The interrupt that occurs when Rx exits the LPI state
-      - description: The interrupt that occurs when HW safety error triggered
+    maxItems: 11
 
   interrupt-names:
     minItems: 1
+    maxItems: 11
     items:
-      - const: macirq
-      - enum: [eth_wake_irq, eth_lpi, sfty]
-      - enum: [eth_wake_irq, eth_lpi, sfty]
-      - enum: [eth_wake_irq, eth_lpi, sfty]
+      oneOf:
+        - description: Combined signal for various interrupt events
+          const: macirq
+        - description: The interrupt to manage the remote wake-up packet detection
+          const: eth_wake_irq
+        - description: The interrupt that occurs when Rx exits the LPI state
+          const: eth_lpi
+        - description: The interrupt that occurs when HW safety error triggered
+          const: sfty
+        - description: Per channel receive completion interrupt
+          pattern: '^rx-queue-[0-3]$'
+        - description: Per channel transmit completion interrupt
+          pattern: '^tx-queue-[0-3]$'
 
   clocks:
     minItems: 1
-- 
2.49.0


