Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A86CA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 08:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tB0xtSwA0keDPf16UgDp3Oe50ABzW8mrbEXvFRXPXyk=; b=kxarn090+E5WZD7xb63sPm2Uga
	JE7g1UHLlUF1WZKbUUgjwy3XBNQw4OMqYEEXHLMWq+XEY7aZWxbTn9Ulpn743wKqQghiVc3VO65g1
	s4smuGqXGOncxJqAfFGZ4NAjAapgtvAoHJksXOoHzhEK5qayB2lxzPQWlM0fc1BFzNuODvsomXLOb
	PxzMEQKdlhplXuN0JwHmPH0LaGIx0jZQYE/Ct0wppu8Ov7IdUheZmn3e2Jh8birPg7um8VRb1hidk
	Ee+GBkfsu/U0Sle8nKLzSYAYcxP3bjubHGoR4YC+20XpTv/mgoWbhsvnUQGP9Tb8U2D/znl6ey56b
	syJH/FQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMz6-00000001wbs-3g5G;
	Wed, 07 Oct 2026 08:26:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMz0-00000001wVV-4BPE
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 07 Oct 2026 08:26:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=tB0xtSwA0keDPf16UgDp3Oe50ABzW8mrbEXvFRXPXyk=; b=bwD8HDBR9ABMQNS6bYbyXAqyW+
	WzkFmqK6/qhg0AfnWgcNcbTiOVTKJ/l65IIfR+3V7IYqo/OrTsjpp+3MmXeO3aOxwErD8wZW5dj9u
	RqoI3qnaSD8i97LcMgnYJxV+Gvn6x+itmFTzEkEkEDdMn9StR4HuS4OxymwNd0cTDUcBdEFFMlHPa
	a6AfWlY3lHCbY+BpukscFMFKn1RZO7HAeiIGvF1jDbnL4jg+yygrd2KhjmF98luiW0Y3t8qeWX2SM
	pkxCPCdbjHu9SKR8u3xwcDIFgdJKjYTWrQJfsPF2ZJI5Pdc5tpBH7ieGlshNN1W2iF3HI8dCOpl5r
	ewuFMCRQ==;
Received: from mail-wr1-f45.google.com ([209.85.221.45])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xEMyu-00000009L06-3RpP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 08:26:36 +0000
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48b042c0759so1243709f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 01:26:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791361591; x=1791966391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tB0xtSwA0keDPf16UgDp3Oe50ABzW8mrbEXvFRXPXyk=;
        b=Zk/wfcQeH73/7jMaYnoFI4PDunbtxuwf5m5SscVCNAzssWNANweuMT2jEHGTqpAHBi
         dR3f5qNDoKlJyE+8vYLgxc/IdJOxp/1EGsz5gRm+OTIWROAJ/s3UOXLCRI6sxxesEVz7
         Eu58+ReRwjNiS1jHF+h4y0fE78qWgrtryG3/tTdVI/suB9NlOCkM7Yx1CFJzGivHCn2f
         COkbdp/3Siw9j1be1u+g71hBsCGS4EfsH3a8dahxtwcbENBl502v5M5nbTYVr9Fenve3
         sL2pLVjfLIGeIZ524Z54HyOF+U1KUGBEO+w1FhgW1eE3STvtvn7+mZFhLWBlp7YscO1X
         5C6Q==
X-Forwarded-Encrypted: i=1; AKwUvBxSaH4GmkczO8RffyZXNr7IF3RCMaZEbCcYeQB9FmM+mgKSvENxE7yxpGh8CTdLxiFD2V3+Tw/wYVji+jBr5zmG@lists.infradead.org
X-Gm-Message-State: AFq9FYKGGYzz/31wyBPIegwYMoJZd+FT0HFd5WqPzAsooas4V0frLect
	qQcy+/Z/anIgwek5yFRc7oBtz5P6zhwdTJdebz7FU0Mh94tmrY/Lv5Eq
X-Gm-Gg: AYBFou0f4W1ieDg2ZhusmAbq5t+iL1w5tp0vufsuOk6obMWlBBsDh4+jqMucHcYElny
	23VYhnd6+Z/eEiUGROumFjltE+0k+mgYaMzEqlrXho7DqlRNb+OxLWkaGBVc5+XTlD0YogTzJxn
	gijxqovWDlalEdMAKDOoloiLbh2d9fKt5A9Sb2isuHCT8A9THrzodkhdg2wD2Vkchm3J8iTmFOv
	qrngwt8cXk+zr7zMSvdkYZ/U77RkvBocfwV0TJkWyeH/z0OBoZG+d/zRPKyP8hg3eSXIAonOy5j
	OrKbzMLbLvJKY0yznbTwCZCrlivy1GdIQiN5QlQ361Wsw9sMbTBFROABsJoGx4zZbNNiB1sWMdZ
	U6PN+5yJiDqLyz76S27URlqWQK2UH2sVxs0xVSSwxjmD/mPaE3N8nVnoOt2cT/7wMe0pVPtZmmx
	JI6d6yGmCeAdDcZTZT8yC+Z1vURd7xgz2+07WeqoWezgZbUudqtBx+4vDlfmOb/hRyg050jUCmK
	ndJ3ueub0edy8yrlM0yF8Jc/U8cvIyiRD4=
X-Received: by 2002:a05:6000:4210:b0:48a:fa0a:34d8 with SMTP id ffacd0b85a97d-48c7277eb69mr2959645f8f.38.1791361591588;
        Wed, 07 Oct 2026 01:26:31 -0700 (PDT)
Received: from threads.localdomain ([84.70.176.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3b502sm4251370f8f.52.2026.10.07.01.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:26:31 -0700 (PDT)
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
Subject: [RFC PATCH v2 3/7] dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
Date: Wed,  7 Oct 2026 09:26:23 +0100
Message-ID: <20261007082627.63807-4-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261007082627.63807-1-tanure@linux.com>
References: <20261007082627.63807-1-tanure@linux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_092633_112532_8477EA24 
X-CRM114-Status: GOOD (  14.97  )
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

The T7 has the same ethernet glue as the G12A, but the controller
reaches memory through a pipeline stage that this SoC inserts in the
bus path. That stage has a gate of its own, which no other member of
the family has, and nothing else in Linux claims it. It is therefore
switched off as unused, and the port can then no longer finish a
transfer.

Describing it needs a fourth clock, and the fourth clock of the
existing list drives the timing adjustment logic, which the T7 never
uses. So the T7 gets a list of its own with the gate in that place,
under the name the SD and eMMC controllers already use.

Assisted-by: LLM
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../bindings/net/amlogic,meson-dwmac.yaml     | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
index 90ef79161ab1..96118b4d1560 100644
--- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
@@ -23,6 +23,7 @@ select:
           - amlogic,meson-gxbb-dwmac
           - amlogic,meson-axg-dwmac
           - amlogic,meson-g12a-dwmac
+          - amlogic,t7-dwmac
   required:
     - compatible
 
@@ -57,6 +58,47 @@ allOf:
             - const: clkin1
             - const: timing-adjustment
 
+  # The T7 applies the RGMII RX delay through PRG_ETH1 and never enables the
+  # timing adjustment logic, so it has no timing-adjustment clock. What it does
+  # need is the gate of the pipeline stage the controller reaches DRAM through.
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
+
+        clock-names:
+          items:
+            - const: stmmaceth
+            - const: clkin0
+            - const: clkin1
+            - const: pipeline
+
+  # Delay definitions for Meson8b and newer (including T7)
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
+              - amlogic,t7-dwmac
+    then:
+      properties:
         amlogic,tx-delay-ns:
           enum: [0, 2, 4, 6]
           default: 2
@@ -106,6 +148,7 @@ allOf:
           contains:
             enum:
               - amlogic,meson-g12a-dwmac
+              - amlogic,t7-dwmac
     then:
       properties:
         rx-internal-delay-ps:
@@ -143,6 +186,10 @@ properties:
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


