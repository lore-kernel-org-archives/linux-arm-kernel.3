Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F190CA9EC7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 10:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U4gXjrYN0DCkNltbrRiGH9pQiOBUm1iOh6yJiBhfVz8=; b=ezKHBNqUakMU+0LVMzCsU+fA00
	m74LbkL1euDcwImKBs/cB7cbuh1/6JMB2M5OB+lpMJ5BgGHm+gagXeTTXCZpppbYndRJzAvGg3UpV
	fTnFbc21dNp2O599HH8caLJ5Ag7Waw2VJ1e/WaFWCA3gOU7NnQ46xaiAP77Bf7RE0XQFME0aOWnAV
	O6t+SJNnkYvB4tt8V8dnZElixml5I7eYeOglDfrW9XEtYLyBY3h1Ge6wbrkf4cB4tn+EvX0czkGYN
	RiOgOtSUcSxCjV+hzSe/E3lbE9Yyr2bDAM8O8FcyhejtUbQ28r/DNYP/HaE8lmV2+dwHESpRWnB8A
	TpB2Ag/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFUnJ-00000007s7K-2wgP;
	Sat, 10 Oct 2026 10:59:13 +0000
Received: from mail-wr1-f54.google.com ([209.85.221.54])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFUnD-00000007rzv-2YVe
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 10:59:09 +0000
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48af27fe287so458574f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 03:59:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791629946; x=1792234746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U4gXjrYN0DCkNltbrRiGH9pQiOBUm1iOh6yJiBhfVz8=;
        b=VophmaSTfo6xaiJ+QxVesysn6KQqEHHF4Tmn8ojnp310XfFJ21RM7tuDy9ihYOXG2Y
         FJWAftyOll7/5vATfKX1UaY+yJZvzLsslfuL2rBrwt30R6H+GI0BGKWWPshd1CMP+/yH
         3ASDhiTvRMuIooP00xUwTMoML3UPO6rR5iF5uGEgELfYAS1eM0K2KI+ddvHjbwJxNlol
         6qwq234lN+jTbwBVHp/VkwLKcC2Fz0SDdy7mtbuMSFe9qp8QONo9mS+Tmm5MkCf84EHN
         QlySLqYcQ35PPoi+3gEufgih485m4YfhkeswSAPanveg/Hm5rBByCwhtynV/D1hhEQIx
         jyGQ==
X-Forwarded-Encrypted: i=1; AKwUvBxaFwfiCv/EnYmzWsn+w3B+rdYThQnr/BjJXchxPEo/PG2SjuopZh2Fc50B61pYsSkEKd8+vKGFtgqWfsQTdz/2@lists.infradead.org
X-Gm-Message-State: AFq9FYJm4RA8RYtAvguJ5NIx0NmlA9iOQF7G/ubEOGP92s5jpBGzxq1n
	CbnweTSAKqvSM7me5eEkXqM99yblPvZfn7AN4W+RKG7bjsiOCwomQaLp
X-Gm-Gg: AYBFou2Ll1+P652qK3WN5tLF6wTqPoL1gZAG/z+n74LIE19eP00PAeoujj25ng65Qxk
	itb8hry8Lk+m6pqF0zfhIlCs2w4I32hQv8ovHNj00+OlO6oRh4fJX4RrNXMSLjA10OKTXL6O79H
	qxlEQcOie+YLY+pe4LCp5pIsHJZ4/fEmgavtg9gFkcDowH79V5IW6IEleTntgpYsLi0BAkS32WW
	1Vn1atBw4lTrtsxRYzyQmlEV1cYUieKUhS/olqSjJ4maPe8DPF2108CFya1xbGx1zKeLOCaaSv7
	YzZc6mFrviQZlnk7VnNp7+/+x62Z3yIJDTobz0eCioa/bMdNQ8vpxNwNrqsK/rfD8V0hnTNCUMc
	xK5wcuG5GnDuC8TC94o3mbQ9Cgqa5s3d0oNA+h9bNeQjSFruZLjIC+WXeJKtGD0lJeNhRhD/DPi
	0zGsZOw8Aswx6CAUFv8DKT12LwiGuFXdsEJXy1S3Wp6RhuSns7hO+juHippl7hwUs77lfxyRfFJ
	ApEZESEqXMr04+1I7aRcM2BfbcFH/B4nSE=
X-Received: by 2002:a05:6000:40ce:b0:48d:bb54:77e7 with SMTP id ffacd0b85a97d-48dbb547b24mr8860590f8f.29.1791629945711;
        Sat, 10 Oct 2026 03:59:05 -0700 (PDT)
Received: from threads.localdomain ([84.70.176.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ae17e9sm8709526f8f.57.2026.10.10.03.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 03:59:05 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/8] dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
Date: Sat, 10 Oct 2026 11:58:54 +0100
Message-ID: <20261010105900.247342-3-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261010105900.247342-1-tanure@linux.com>
References: <20261010105900.247342-1-tanure@linux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_035907_665781_A348275E 
X-CRM114-Status: GOOD (  13.19  )
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

The T7 has the same ethernet glue as the G12A, but needs two clocks of
its own. The controller reaches memory through a pipeline stage with a
gate of its own; nothing else claims it, so it is switched off as
unused and the port can no longer finish a transfer. The glue registers
sit in a block clocked together with the MDIO multiplexer, which only
probes after the controller has programmed them: with the clock still
off those writes are lost, and the port keeps whatever delays the
bootloader left behind.

So the T7 gets its own clock list, without the timing adjustment clock
it never uses. The delays follow ethernet-controller.yaml, so the
vendor properties are not valid here.

Assisted-by: LLM
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../bindings/net/amlogic,meson-dwmac.yaml     | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
index 90ef79161ab1..2353dd9181ed 100644
--- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
@@ -23,6 +23,7 @@ select:
           - amlogic,meson-gxbb-dwmac
           - amlogic,meson-axg-dwmac
           - amlogic,meson-g12a-dwmac
+          - amlogic,t7-dwmac
   required:
     - compatible
 
@@ -57,6 +58,56 @@ allOf:
             - const: clkin1
             - const: timing-adjustment
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: amlogic,t7-dwmac
+    then:
+      properties:
+        clocks:
+          items:
+            - description: GMAC main clock
+            - description: First parent clock of the internal mux
+            - description: Second parent clock of the internal mux
+            - description:
+                clock of the pipeline stage inserted in the bus path between
+                the controller and the DRAM. Without it, the controller cannot
+                complete DMA transfers.
+            - description:
+                clock of the register block holding PRG_ETH0 and PRG_ETH1.
+                Without it, the block reads as zero and ignores writes.
+
+        clock-names:
+          items:
+            - const: stmmaceth
+            - const: clkin0
+            - const: clkin1
+            - const: pipeline
+            - const: pclk
+
+        # The TX delay is a quarter of the RGMII clock period per step,
+        # which is 2ns at 1Gbit/s.
+        tx-internal-delay-ps:
+          enum: [0, 2000, 4000, 6000]
+          default: 0
+
+        rx-internal-delay-ps:
+          default: 0
+
+  # Delay definitions for Meson8b and newer
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - amlogic,meson8b-dwmac
+              - amlogic,meson8m2-dwmac
+              - amlogic,meson-gxbb-dwmac
+              - amlogic,meson-axg-dwmac
+              - amlogic,meson-g12a-dwmac
+    then:
+      properties:
         amlogic,tx-delay-ns:
           enum: [0, 2, 4, 6]
           default: 2
@@ -106,6 +157,7 @@ allOf:
           contains:
             enum:
               - amlogic,meson-g12a-dwmac
+              - amlogic,t7-dwmac
     then:
       properties:
         rx-internal-delay-ps:
@@ -143,6 +195,10 @@ properties:
               - amlogic,meson6-dwmac
               - amlogic,meson8m2-dwmac
           - const: snps,dwmac
+      - items:
+          - const: amlogic,t7-dwmac
+          - const: snps,dwmac-5.10a
+          - const: snps,dwmac
 
   reg:
     items:
-- 
2.56.0


