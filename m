Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91446C369B5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 14:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dxtx+wYgnayT5+SYG5cHUYe65nSDdAbTREq4fQgE5Vg=; b=hdpPbZlvAEdsdhyR/bEWrHBBza
	8uQtL5r4aZmz4u1S3nApqj+PmGrjDzrwhmO0QKcLGOm3pRVJx92V5nYxjP6rZJMwpXPpE6ZNUrN7D
	i6NVFueur5kczSkrQoqw0eL4ySX1RbATUWrOjVIGJWYKoodbIAf7OVnFQe3G/+7+I9FH8JVIsaXLx
	ejmFWAD3I4pzrgqNNWzwwUWYEnxE9EA9ZLjRxyeWbOx6YnZ8TZo/O8HafCsbAYgLVL2zRhmNXpb72
	k+lJTQZ8+Uh1FhZOj2vbD0PG0YpgOzXiSEJFZWSmTEbmKbcXNxUELozXGJ6rTZJi+uLcbnGFm+Aqw
	LqjbshIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4h2L-000000063XI-2ItK;
	Tue, 15 Apr 2025 14:13:17 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4fqN-00000005pZH-0Jz6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 12:56:52 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-39c14016868so5071683f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 05:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744721809; x=1745326609; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dxtx+wYgnayT5+SYG5cHUYe65nSDdAbTREq4fQgE5Vg=;
        b=aijLrqvsAGkwRXihAznm/UZo+XOM7WoDZHZ/JZjsp69xDIAQLkXMNR6jnGr54U+hK+
         hJ8vj1v+elqja0H+jTv0sF75BJo4MM2nQ+i6K5B5uLES/Ejgb4BhOMilve8yC3G/meYw
         GLjKlgE95W1AYPBX/thvM7Iu3ijui8AolIdxInjNf9Dt0pZZ1PCeIUCQ3NOGE2hlYfT/
         Tcputj3YYDeQcgDPW2Sb/j8z8dxWOb5RQ9Jzfxvw5y15o9pAqnn4OxeWX3jKV766ehlH
         OLcT8f7RyYPX3Sp0y76ms34SFvVjx+DET4wsTQcWHNOTqtjY+EWHzABTosUrREhGx1i7
         TDdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744721809; x=1745326609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dxtx+wYgnayT5+SYG5cHUYe65nSDdAbTREq4fQgE5Vg=;
        b=kQvnP+E2SC2y0C0cFCFTCjvUx6M/Qli4FMD3VMDvqaFQKfdly4C6yl23WsIoXszIzx
         ZisAYcJawg1E5xHsVqai3K1VtV7ITPl8N3MBze7/gRIG5aTfULZFZl7UaB5amVRXti8c
         v93jCCcZFvgnq9N97OKZJc+TTDvbQYU4ckpn9+QlJUzcLvJF0dFvrkpKDLwKbIiQBVC7
         3lSJ/L+xfcx2DJS2F2EI976iv+KDh5Z7yF2KWunc53p2eIZlHL9DI/2Y7OdrfrWrCqsZ
         z/vEfpxlquzUGY2ExB0AOWpDvKyBSXKGECAuirb59n27HazAuOOOPok0tNFGAVZVZkyK
         BVYg==
X-Forwarded-Encrypted: i=1; AJvYcCUBAI5ZD4mAp/5mVSYKROu66EZYVgyaev09848yWOiYqszZxwupypfd4LurHQwF6T/O77PU3jzKj4rotKrYhH4Z@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4W1cMq2cLPDDKzdBovL0moWeC6iUI+t1CjuA8jGc+0Gq+U9SI
	lcjeNjBb14bD7DvOLtOIZD6DdSKy07hojsbIxLzp8o/yNclfGgyI
X-Gm-Gg: ASbGncu625QT2pA5PFsE4JwBqKa2OK1g0/4/LhSH5gPzvW2dXDArOD+q+Q/okQDcZQl
	2xjL9x2wOxImAHpsaCEkOTBpsoBe7pmcDgM3aCLFCNGC6WMiqrTWJfnikcpn5m80e2zzJmLUXJT
	idtebPimk/nCeP7E5vXukhZYlPM3V+wXwLbuXDwmqR4PsuGxB0geqGB83BZqBkxzkBHVyZn1d22
	C1yj2QhqKNWVfU8a1v/a1UlB3hKUF/eWrQwx3XxYZOShcK4wnb5M1pzxPNxJZAd7GmikOlsSiCW
	Wv+shx5y3BJS4oFgiZnSXloGA3kGPVtFd5UWuJLPaf+F+317jLRbb+RpZn9ZUZdn
X-Google-Smtp-Source: AGHT+IHh1oHEy/id+2kXHtxdu/j3+e8kGj1u5Gw07xALuQpAX70pVHKbVNleZqFSuazAXcZb5wjYGw==
X-Received: by 2002:a5d:5f87:0:b0:39c:266c:12a5 with SMTP id ffacd0b85a97d-39ea5201e7fmr11010905f8f.13.1744721809254;
        Tue, 15 Apr 2025 05:56:49 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1883:aa4:a265:bc12])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96bf97sm13922334f8f.25.2025.04.15.05.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 05:56:48 -0700 (PDT)
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
Subject: [PATCH net-next v6 1/4] dt-bindings: net: dwmac: Increase 'maxItems' for 'interrupts' and 'interrupt-names'
Date: Tue, 15 Apr 2025 13:56:39 +0100
Message-ID: <20250415125642.241427-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250415125642.241427-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250415125642.241427-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_055651_116734_13A2DC1F 
X-CRM114-Status: GOOD (  12.26  )
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


