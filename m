Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5970C71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 14:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=49FSPtlcKL0gc4JMv+U7rRPko4PCd0GRAj32NmJNos4=; b=xZltQxUb3IjOW+Bmlq1iunYA/p
	bhswk9uW7fh3u/2Yp0hCk3Z+O9/PGc4xBzza6o+P2jWjl2LS8YINWgoUSmHMDRd+CP3B4YUsF8vfg
	E9bZrjlvH9b5N//2tEqXoKIHIq1u1ar4jHD6WfkLIPQAytsdRcwunlrKSBMcASGRCBpsvl9ctFOEC
	blpDtxvjii0CtOD6091kitcwaAswmlObZz/JN+6P4shiuq3zsnOsqb0MLTprDkNUxs6MDGrDwsg4w
	mX+Yr8XNHuryLFkQfWBZEVF2nQKWKVuCHGVv5fdfIo2hDzPJe5Stj5ole1kJP0KbIkpL4JkPF4AtV
	2qn7UhNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRWzx-00000007UkB-44Pp;
	Tue, 17 Jun 2025 14:09:13 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRWce-00000007P4C-2wIT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 13:45:10 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-453398e90e9so31043585e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 06:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750167907; x=1750772707; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=49FSPtlcKL0gc4JMv+U7rRPko4PCd0GRAj32NmJNos4=;
        b=I22APiJIK5xdWRhMllq69OVeEgm2XCbiuQvhCNjA7cJDxIsFbLgcrLw7M0m/qykt6T
         +jx0YrGuFFh8oS4C/GcyXOllTxPf4j9SlMAJisRfRgJimxLrqowV31EOtjgsmhjypF1v
         yEden3kYxSrKzGKC61vgydeKQ3BtA9Uq5Nu8SyLXpFp2nYRuGfbHNTtV8K8kM5xyB653
         ZWm60TqPHYLfw+0WNt7Arz2rhnMIVd3B7LTMQMfiW+cSO2PdYIfDrTT/JTRqfSAhE48e
         OoujBdM/lZb4/BCkblnxYSKzPNRMtcQIbOquPXwVYyZ2PkjCG2CqE/qHKYo/UScoow8p
         ZICA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750167907; x=1750772707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=49FSPtlcKL0gc4JMv+U7rRPko4PCd0GRAj32NmJNos4=;
        b=o/cBIzC1PFtD2MAlQPazVs1NGzanTO11xUtvNtV7CSIYwZFOAPO8ALiPyNTBXuujP+
         w52ZH27hpWEai93Kkt8ME8+sB4QRKgb8+nQChPoTIgWYIpfKOD/qTjxLe0uejHZJpkz6
         FD9RdNQcF/k/kDHh3BKniZnif/KPr0vygqqk4qRNIrbSOPfN5KlFKzudXRbEGnFFig9R
         2TJXfqQ9ODEvNwfkJGO9Uy87gJUStvHOAVKpQ0YRTQ6OjfDLolQpM0cRh7wsGoCDElMh
         R0lk6z2TP6oR20zmkN2rbbDdNEd1pRAF0mQPWneE3kUy/LdKXPgCruVgjrNoAnn1jEZB
         O6MA==
X-Gm-Message-State: AOJu0YzYhvHV2Eh7WLW9M4YJm3ExZj1HXyvwlc6d+pUzKwdsUTGRGuSB
	cBeYHbzI3mm177IEOHaHebJrNGhk2rIjtb4fNUPe5rjfnxcsSueKWIst
X-Gm-Gg: ASbGncvcuJujkGXWk/JRlLMoViY/WjE+GEYCvLIc+Kw5nEfhMLZJ9pJV8zyxiTOXPE8
	FhA1ICPmLfuvaHqwOfwkdtAf60kcwe9Inv4wbbJJyl7WP6/BCa4IfdaVJT82c1Y0+ezVvQpgghT
	SOZuDPvuDQQFoWQqajCI8vgqCgHw5Liy8dx1nyenqiXc+w3QK6cndkJZBDTtW9nyJZPGant2dHT
	RG/65YHoVFj1pmrqB5jluQjMHFLkK6Jcjiznyj10e3vRhqQ/ZaEaKKsmBXRUQUPWzZZXiWOGxFC
	DRQZ4H+JI7SvL3J49yVnNa/+rWqDtO/3oj5opI/DSGlCKIJuhnfcEzYgdogbI5q3K4c/RzLjU4d
	k9kvmGlkO7Hc=
X-Google-Smtp-Source: AGHT+IGse8XFsoUh6fMQBcNMM9Sf+3vi5JtHZdT76YAwamnppyqyoyYz15avA1Klfl6ft5GN31V4DQ==
X-Received: by 2002:a05:600c:620b:b0:450:d4a6:79ad with SMTP id 5b1f17b1804b1-4533cb4bea8mr118623195e9.23.1750167906835;
        Tue, 17 Jun 2025 06:45:06 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:a081:30f1:e1c7:6f28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54b7asm14239728f8f.16.2025.06.17.06.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 06:45:06 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v12 1/7] dt-bindings: serial: Added secondary clock for RZ/T2H RSCI
Date: Tue, 17 Jun 2025 14:44:58 +0100
Message-ID: <20250617134504.126313-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617134504.126313-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250617134504.126313-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_064508_748958_B6E991E2 
X-CRM114-Status: GOOD (  12.20  )
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

From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>

At boot, the default clock is the PCLKM core clock (synchronous
clock, which is enabled by the bootloader).
For different baudrates, the asynchronous clock input must be used.
Clock selection is made by an internal register of RCSI.

Add the optional "sck", external clock input.

Also remove the unneeded serial0 alias from the dts example.

Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Hi Rob,
As mentioned in the thread [1] below there are no users of the RSCI binding
hence this change doesn not break any ABI.

[1] https://lore.kernel.org/all/CAMuHMdUThuWxxznhjvcn5cOFCWOkb5u-fRYwTOoenDRY=4H6FA@mail.gmail.com/

Cheers, Prabhakar
---
 .../bindings/serial/renesas,rsci.yaml           | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
index ea879db5f485..1bf255407df0 100644
--- a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
+++ b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
@@ -35,10 +35,15 @@ properties:
       - const: tei
 
   clocks:
-    maxItems: 1
+    minItems: 2
+    maxItems: 3
 
   clock-names:
-    const: fck # UART functional clock
+    minItems: 2
+    items:
+      - const: operation
+      - const: bus
+      - const: sck # optional external clock input
 
   power-domains:
     maxItems: 1
@@ -60,10 +65,6 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/clock/renesas-cpg-mssr.h>
 
-    aliases {
-        serial0 = &sci0;
-    };
-
     sci0: serial@80005000 {
         compatible = "renesas,r9a09g077-rsci";
         reg = <0x80005000 0x400>;
@@ -72,7 +73,7 @@ examples:
                      <GIC_SPI 592 IRQ_TYPE_EDGE_RISING>,
                      <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>;
         interrupt-names = "eri", "rxi", "txi", "tei";
-        clocks = <&cpg CPG_MOD 108>;
-        clock-names = "fck";
+        clocks = <&cpg CPG_MOD 8>, <&cpg CPG_CORE 13>;
+        clock-names = "operation", "bus";
         power-domains = <&cpg>;
     };
-- 
2.49.0


