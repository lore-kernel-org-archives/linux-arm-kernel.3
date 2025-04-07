Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDEB7C369A3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 12:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fG6cklCkHNYJxMIIK0GDMVqFSaYHTVH2UbG4fjsK7gc=; b=z6eoohThhOiPrzbhHyxcLYXCI2
	4RsayDqZY5pVCKUJtqRXThma9zGHmS+/Xxc1aBq5eEYaQax8/urp5dLE9+3mmycwVeLz7nk86Kg2T
	ntRVrDPlIMnF7hsuqYL4QAFiNQF5JbYl/0oJ2ErZ2bUQX3AUYu3l0p9+G6LUjQvQBg77DLN7SAdFi
	N2p1T6Qc5QSjzVGpIymYZTuOAVTj8XbHhcThTJgmc4+EYoDAfYjPikSs6c1ZL6y78x/JLRiU9y2Ja
	9U51ACg/lHTKDGDlbb+hegJ914fjVQzFRcEJCB/5izCXlRB9qYQYKS/rv0j4/POdDpWSDXjPsaEhy
	xaYjA/GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1lhf-00000000GxX-14uH;
	Mon, 07 Apr 2025 12:35:51 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1lCL-0000000090s-01oZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 12:03:30 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-39c266c2dd5so3700269f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Apr 2025 05:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744027407; x=1744632207; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fG6cklCkHNYJxMIIK0GDMVqFSaYHTVH2UbG4fjsK7gc=;
        b=Y2XiTFMRXC6hq7EBJYAb7i+PtxyECOSoi60Q5RjO3ZnE1yHx49r4OO56G7QTuBMwi8
         9rK4+2fufJjSlfKGgPBLSaPmkyGsLvZF8WR2MoWKWqIGBYeXlwfi8yRTqzM4kc4y7ZXK
         1/ZBaQGHrsP66xce7+aEF4nAk3RL50JvqQNu9hRiV4bT9h2mE8k5CCicx9ZqZ3mXmIU2
         PNde0su2OROhcCvswvUH4vIvDfiGQljK3cBAJFDq7Wg8Vd8pS9HM1a7COz3aUVicHWzc
         Q4Cp5AYjwldI5g5s3uAMu8CmTdjLFlBvwe+4md+T1QLYAmJjhm/JvG+boRySvqQtEtwo
         MtrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744027407; x=1744632207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fG6cklCkHNYJxMIIK0GDMVqFSaYHTVH2UbG4fjsK7gc=;
        b=FcvvS04SCS78pnsftkGW2vOSwUQQch1pPNC305omtSI7WoHXED+bkDLGpvnobApWq4
         Wn4KzCYhmS5Vrjzg/wpkV663cSSbCFInqpl/84A8ODtG6h+5mrwjg/G/F1yrzP2dXZ0z
         l1GKOpM0FeRnrfGNO2Oc2GLryE8aAMLrj6q2mmw5vChf/VeZmYF4T6VIXYcuDr200JBI
         kHHLTs58mtYzquuy+sRnd1w6tO12vdmOUdhG3ax7KFZo9WsYtOw6Wao4J9QlL8Rv8cD0
         YvAfAQQwKiwhqj7Es7O9kbyNdAmZ7OV546iu/nWp0Tl0JPv8zwHtl3VkbeQFE39shKFb
         7OwA==
X-Forwarded-Encrypted: i=1; AJvYcCXznBpu7Dv5dPhnSfHRfs+Obzjj8B0wUM15PGMuB2ZjmuRHn3J/LHptFxdSKHmpAJo+ZNb6lj4k2nnFi9VWjtbv@lists.infradead.org
X-Gm-Message-State: AOJu0Yznpx9vCxoSvNRwhwbwBR+A5Tw1ZWAewTD7+BsP//Q3VjsGdCud
	Sei52YnpR2/INQ/GNlhtJ2LKZZWyb3Dg4X20zjl3NUSxqluikb63
X-Gm-Gg: ASbGnctqLW0KwmKEYPTLNo1m2fLMsh8uF48bdupRvFkvkxbM6IeNV9EPRbxjz5b8iiv
	PF+1hCr9iyJtGCdSr+5hygKFWorOzvpSbIiB+HMwtT9V+HaTpZNcIkJZiXJcmnOE996m7qdDZ9o
	kPjkTlWQ5uhAy5o+IF6VeXfPBZOeLOmNKYnZZoKeJQgPOO0IfyrEsJ2QeAPuj4py7OligqamO1W
	IhSC8KRSC1O8QVM3KRucwFviyQxqDbb66/eNlFRAVNQ6rekhaR1slWCUie7BXPRKus3ym10Ec5H
	LzmttNrpEsoPuaEOvKNvz5lh1ThdYPBfaTYjOnyWauAwmD9gR77SufJhmDOLpUdKHEXXIg==
X-Google-Smtp-Source: AGHT+IEbZIVKSwKGcZGaZkVGFNqeu45TBBjhVhTZoMPStlgPwCbQmNhtEp6XGXu00ZWclskzPkReog==
X-Received: by 2002:a05:6000:2407:b0:39c:1efb:ee8a with SMTP id ffacd0b85a97d-39d0de67a97mr9832691f8f.38.1744027406917;
        Mon, 07 Apr 2025 05:03:26 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:78b9:80c2:5373:1b49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d943sm11986976f8f.74.2025.04.07.05.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 05:03:26 -0700 (PDT)
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
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v5 1/3] dt-bindings: net: dwmac: Increase 'maxItems' for 'interrupts' and 'interrupt-names'
Date: Mon,  7 Apr 2025 13:03:15 +0100
Message-ID: <20250407120317.127056-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407120317.127056-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250407120317.127056-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_050329_046328_79E9F079 
X-CRM114-Status: GOOD (  12.74  )
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
v4->v5
- No change

v3->v4
- Fixed maxItems for interrupt-names property
- Added RB tag from Rob

v2->v3
- Dropped adding `additionalItems`
- Moved interrupts description into interrupt-names
- Replaced enum with a oneOf and added Rx/Tx regex patterns

v1->v2
- No change
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


