Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ECF5C369CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 08:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dxtx+wYgnayT5+SYG5cHUYe65nSDdAbTREq4fQgE5Vg=; b=lenslACXojjnFAkdQ/nVvM8i6N
	3w488UeVLLEsHVzlooPADG9V7fciFOqNfiPwfVOZnbjG3squXQXzs/AoRWuaZCaK34WCTcvSrUcRc
	Z/iSSeAYfTWa8mv/hkc9EGhkceNy74RmtmREIA3iW0yPQugGRUIc8ZSQb7o4OxZ5SC5lqHZEAI9Qy
	gcGm8PvuYcmbdiUPw3OF6NIVd0kVe7g+Oz1Hh6iRwekoxR9NQWdERuXDIlujNfcFSJl57zlZQADxD
	HayRm/oUVOUWgj4kSxQ+IzUZn8qV5TJjSUIHfYaMrmyoUu+CjGsc+V8b2h2itGJDpHrLC72WQLnl0
	2CM6rTkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5KsV-0000000CJzV-3MAS;
	Thu, 17 Apr 2025 08:45:47 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Koq-0000000CIsY-1JJ8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 08:42:01 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-39c1efc457bso246435f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Apr 2025 01:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744879318; x=1745484118; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dxtx+wYgnayT5+SYG5cHUYe65nSDdAbTREq4fQgE5Vg=;
        b=RaD9kj1qB11kgZ92pkIyVpWrgivGmMa0Kb2QXqis/WhWDoKYn8PAkOW4Es2MgsHpd6
         Ra3TGQGjjxl8VGc45qSTuMXVyG9yftKrIDsG+tGwgodFirLuWGiXn/x1JcljWWCR36X1
         pPVs2dr71RmS0pZ9DQyQPQmLDfLIXqaK5RbCYT2hjwmCDaGNkvKo4xGmzbKVjdzCGcLO
         O2QY4TmiMIenvrdbs2+ycvfPYVRxPF3zJOhO65n/oIdHP7UmkOy4qekFPiiU6Okoz3zD
         bkZolkm1s48YRPrQIyry8R8iAaVqxemyRj+MnO2purU7p0MLY2jdhwJkeEYb9UM0JngW
         FLPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744879318; x=1745484118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dxtx+wYgnayT5+SYG5cHUYe65nSDdAbTREq4fQgE5Vg=;
        b=vWrqhGbgnKJgphcRgvqZDZ7M2WwncifPIu80dkIc0F8cAHAvCxlVui1MoZiRAxvpnZ
         SyFaMBT+k6Z9o70bUB4vEKzkbxd3y/Jx3GHDevQwQlrLJ3h0aKp1Pfx1ZVCZrcZ2h5TI
         cCkR54+2u73g2KfJmKyQO4vfQYEFP/aY9GiVueSkvwCQmHNSoVDRnqJG9/BUJ5lruMEz
         +aUsqnS6Rk4Lv0d6Lh5INKxWHaHTtE8txBbWvMBlZSvyjl2PnY46UdCzxA2nqlqTbDo3
         kF+dTGgMxbINeEa3J2vQpZ2DSkxWNy24xnQJR6tw1Ou4CaSTYJembpBY/oNeF/FBZrJU
         J2Mw==
X-Forwarded-Encrypted: i=1; AJvYcCU75IpqgFnS0toQai64F5rObaDvS6z0ZoEaMugCkpJZtGSkvUEzd6yepx3NAP5Fn2MhyujBdtDW265IYwZIXVDM@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/n4D5s/x9Z7BeAhVWYwacOafTpJFaJK4LWdYLvD/QwNZAa3b/
	a0I/Ib1eERRQWg0DJinozeOi6TZPbdEHVpHsAaXwqyKh7xEmCdXY
X-Gm-Gg: ASbGncuV2eSeWNbjFf1w6uPagDYWK5KK1ghMHKqplLT9wdPvTzrnxHQenYtYI4hEHBx
	NV9RWTFuzbT54E/XB9qtpinqQf60dCAcgqrubuXJAUid6Bi5Mpuj9X9ZAgv2xqIF4iLiqHNF/hj
	0LRzdBHgGDNGumvxmEY64hsecWX4aU2HBg//LqBFNKBOx6zhpAXcMCVpMb+gSE5ZSz5CWRasaXm
	Ou9mSJTk2DMe6etfW34xvBn/XZuFhjA4joqHXp0EnLh5E5OQT+/cgwvmIAyndfGMJfH1LAC3fqM
	3mDyncF5g1V9AJ/fI12Ow4w0XstzNPAuvFpDadsps+Rgn14iy8HVQBXn1+vY3L1J
X-Google-Smtp-Source: AGHT+IHgPKXoeOtA0iIqRJCI/YC2Q+S8g/TGS8VwA4DAmEhyGIU1Lls6vFCmEDBaic4nvV7UL9x/mA==
X-Received: by 2002:a05:6000:1449:b0:39a:d20b:5c25 with SMTP id ffacd0b85a97d-39ee5b2f6b7mr4334968f8f.26.1744879318069;
        Thu, 17 Apr 2025 01:41:58 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:3f0f:d684:f4a:34e6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96cf1asm19657712f8f.39.2025.04.17.01.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 01:41:56 -0700 (PDT)
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
Subject: [PATCH net-next v8 1/4] dt-bindings: net: dwmac: Increase 'maxItems' for 'interrupts' and 'interrupt-names'
Date: Thu, 17 Apr 2025 09:40:12 +0100
Message-ID: <20250417084015.74154-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417084015.74154-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250417084015.74154-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_014200_342663_F960DC93 
X-CRM114-Status: GOOD (  10.97  )
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


