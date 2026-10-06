Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C38C1CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 06:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6zokyqVAZo/3wOkzS2UYtFNTlUvQWqnfGSA9wFDnc6s=; b=t7bxN4sTNK8qB8crvFuTWjUtc7
	142O69mxgO3zJDyRDNOUKgln3zN0hzbrxbfCjl+O1dnlYBHLplZi7rX5iy+WfhKxuS5wcjF6Ogfvv
	t1M2QMQ9guvLrCPbNDB1rTSM/s3rTbTCgFyuBvOweCaBoS+FHLQoh8nyEKE9RfYq09rQs1BLyiVLC
	siga3dYDXAACNX7/6fZD/cgxZIcjSQoBFGZomgp9UbRiqgYhvU1eVF24NRa4eKV27L5kkpzz0c6V2
	UeYyPEBSYD0yD1txtwCHWGwPVIJub9KLANHmFBXs20/aNQsPgLRXPwoggI3km2r7Qt0uu5KB6y3j/
	9Gh1Xnhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDynG-000000008GL-2t33;
	Tue, 06 Oct 2026 06:36:54 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDynF-000000008Fx-0KAV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 06:36:54 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-886e61fa30fso142507b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 23:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791268612; x=1791873412; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6zokyqVAZo/3wOkzS2UYtFNTlUvQWqnfGSA9wFDnc6s=;
        b=E/oJTcRLugrvK3Ke6Xk2+e6CaUVJH702rMeQDEtVyTqDYfGqPR99j3k4bGgcKmZr4t
         OB/Wrj/BwlknMPVxuF1SrQjR8GsB487JtBeqB/pGJpvilrecYqRWc8CATxgWtV7qgNZX
         moaTJObomoXDYgV4z+R/i43Kkvc7GBzU54IwBCxCG5/2+xtkTqUTxfpv0hRvPNItD5cM
         GctQ81tz7MBuOxtcdjIKCB4Mf0+jqYSmlMpcTHLr7J8FBPehPJdeCdfJlICQvA898oIE
         MDEtOSHci1GzyVgwnLzUQPheejdOPS4oTknzSX7p9+MiVCaYqmGYJw8sqNTAPZ+dPMJ3
         8TmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791268612; x=1791873412;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6zokyqVAZo/3wOkzS2UYtFNTlUvQWqnfGSA9wFDnc6s=;
        b=YrMriTqrQqUxOFRe8TR4ycwED3n4EnEWZDYL+NCMswhNlEAqh4B9qtg/3HNtEpvRbx
         j/Cz9l0wKozJK65o5kJV0L/eYL6NVpYgb0Eu+8hiVBXEVz16+kGi5Xo+h2WS3mdMTYoq
         yuMYedQOXOAvhSUTPGxPz5r6L6n25o5l3ulbqjWuPhSewRgeRTbXInR/5eJz5ad/cEya
         hJJT1GcFg3SmJexUgT7Gwtx7EkzM8ABLhlwGj1Mutyux5cRnMZOxI5PipVog/YOfy7aK
         3A1Loza5kzhEaXL1QASg9lNEqVeGPtObDyHFO4V6wPxURIhwRHXXDVvneL//j9IZUkYa
         LPPw==
X-Gm-Message-State: AFuF++nQ+CogIr6PjtiZJYr1Fl5UUCea02pKISLVyPZPUN/cQJ21LJ7G
	1PnueemBbcgKSsdYdtQp+TvIxPQ9RukZpDH4Y4CgbPY9ZAFochCN86VW
X-Gm-Gg: AYBFou37T0Cp8vq+p9+o7wB9gVlvtfAz2Iul1kJwDEXuXrR1t5jY/BICm0Hu1dOqNkN
	l4L4haxc410UgV6xp+WiQr69hTXULVlTOY6s4UPA7eoksC5nXS7JbkYpei80IjtRTiEv812/edS
	j8nOUVUXhYrDXpvBvxjbQthxjdeshMRpJW0Xh26k2kRDpuUewhtYJG30kilzuxj0Bow/rURDgMu
	YCJ38VXWeVU11LYXTn4cVDSwaxjovtn7NDjtTkOfDmt0ERaqYclopEYsCQN2//EBczivTS2ORsg
	Xn3SIsyr0w+d3JiMEJGSm9z59A3zEjvbXIh+cLCbdWtVoFHyUkz2uLa2Hk4NZHZLzCD3RHLbbaO
	CB/JS1ySl9AcSGx9STFQm1GajTskOqdlZatITVmyRxYG858g3oBpzmMCCgpIAzHJafXUGPSxFzD
	eCpct7jvjuzpMkxFjR9bHv5w4NgReys+n63GNI4uqNljLoqSwnU8f2ZAP/fHv5P+aqf9B8tu4m9
	KtCYiazHRK9NNb4J3gvHRbxbOqelJUWIAD1wjdo743W1O12TOciV0S+43RiNSfXOtj7dPMA
X-Received: by 2002:a05:6a00:3689:b0:878:6ee:672b with SMTP id d2e1a72fcca58-890deacd37bmr383696b3a.35.1791268611801;
        Mon, 05 Oct 2026 23:36:51 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0c792ce7sm4340790b3a.41.2026.10.05.23.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 23:36:51 -0700 (PDT)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cwweng@nuvoton.com,
	cwweng.linux@gmail.com
Subject: [PATCH] spi: dt-bindings: nuvoton,ma35d1-qspi: Drop redundant SPI example
Date: Tue,  6 Oct 2026 14:36:43 +0800
Message-Id: <20261006063643.198830-1-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_233653_119532_6C6F2E08 
X-CRM114-Status: UNSURE (   9.13  )
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

From: Chi-Wen Weng <cwweng@nuvoton.com>

The SPI and QSPI controllers use the same Devicetree node structure.
The additional SPI example only differs in property values and does not
demonstrate any binding-specific behavior.

Drop the redundant SPI example and keep the existing QSPI example.

Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>
---
 .../bindings/spi/nuvoton,ma35d1-qspi.yaml     | 20 -------------------
 1 file changed, 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml b/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
index 72f2e1e1219a..9ee61f8ac4d6 100644
--- a/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
+++ b/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
@@ -75,24 +75,4 @@ examples:
         };
     };
 
-  - |
-    #include <dt-bindings/interrupt-controller/arm-gic.h>
-    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
-    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
-
-    soc {
-        #address-cells = <2>;
-        #size-cells = <2>;
-
-        spi@40600000 {
-            compatible = "nuvoton,ma35d1-spi";
-            reg = <0 0x40600000 0 0x10000>;
-            interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
-            clocks = <&clk SPI0_GATE>;
-            resets = <&sys MA35D1_RESET_SPI0>;
-
-            #address-cells = <1>;
-            #size-cells = <0>;
-        };
-    };
 ...

base-commit: 4825287f6d2346e9273f35a928d1ef40e68bc58b
-- 
2.25.1


