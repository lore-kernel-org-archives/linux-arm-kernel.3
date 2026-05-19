Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A58ECD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 22:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zf9iiOefjbtai4lpZb0pjdeUtGQL3N0f8U40x/Ratvg=; b=xDrRYGYt+wiEpInHyX52nT+RJ4
	2rEi2ypcmUN97R0Zjzi5IRWoznDiOTa0XEBHVKhmVAbxelCYeIXXgftTlzHpOvl4pu8fsfMqGocd5
	avWBiNnHds7qTX0acZTLqlvAQ6mkRGuym8zRABpXssN301V2UiHxufpTzKlRr0E/aZzAYyLIou6rD
	c/RdqPQ18yhiJG0rMZO4lQvyWBl8G5rzCgbA4814DghE1cvcNFGo6hJkffWCJOrWB7B7X4p5dHe3a
	DWYr/vLpTSP2EguwJmZtg9ySVoo575+bLejTylVMWUETpSV7sFS+hYcFzKG0YDDOtRyigpWZd91a6
	IpQMGkkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPSc6-00000002uEy-0Dfz;
	Tue, 19 May 2026 22:08:34 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPSc1-00000002uBW-3Qow
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 22:08:30 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so39673135e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 15:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779228508; x=1779833308; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zf9iiOefjbtai4lpZb0pjdeUtGQL3N0f8U40x/Ratvg=;
        b=JkTNsttSXx6dJEhOFD79Yu5JDDHwwKThA9DnyMmoGB7JpxDltNEevQ4JdshcWZcjJt
         afIFQ8ZsGnSmGydMs9q8hw3oAQNAj9FkEVIJVGrQHbYdP+Kc/p7twBm8Z7ohvdMQWkqv
         sXuLtM4lms4TO18m46xfdRTvENS+wsgMK42pDLQiMPBFHUXlpkKiBaIgHzjX+hclKKRD
         Wt/uA0jd6PwgqxlPuxIEkpclS+y9ttyku9UOcmtlGanb/EUutOOBXf+FVhnZYTrCmYdR
         uFwvTLcA6WODrz5yEb+hnHK8g/aan55rB7Vj1sMrAhGps/UJxv7Fjzqm1gbMRds1WR4l
         99rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779228508; x=1779833308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zf9iiOefjbtai4lpZb0pjdeUtGQL3N0f8U40x/Ratvg=;
        b=ebpUwwj6HhrHUDcII+I2olkcRVpO0XOrk0Nx9+N2SawX0d27lBAhgYvfMypZLQuAYm
         A4tE/DRXD+lxIaiF1fkwcwtbVCMw6wInx2mSD35YmiVz87vD21W2sB+VS4Y3hHr0WcoU
         Pf8RGOgK4vvXQUxtEOWDdAYE8M7lbRRXZ9s3YPmI+M0U1glKGvjwEeIrKLqKYHXRi9Xh
         JozuuLZl0HafQAdrd7Awc5v0hbW875bebK13XT8aAf268wJbCLDCGcqgPemnjKx1WH19
         Phe6lIpVwH5F7BbMPAqhSr4yLave91a4yX/HJgjI4wtx+gLmZ8eRP3jpKIRQIz1cwvRi
         Ol/g==
X-Forwarded-Encrypted: i=1; AFNElJ/r4Bvu0jk0xp4ooPjXDGBTMYgUMDZxo7Xx2O4kJPgfABKW5tliSrASHrXpR0/U4KBC2edSsjMES55dRg/BrnM/@lists.infradead.org
X-Gm-Message-State: AOJu0YxJIJxLaxQLw5mclD2LkT/dHySKrUwnOGJg8l0GCHd1luHPytY9
	RTj3smvvO/drM5AzBOE47VVhmXNTHjdoFqHWkNLT4qRx/ZRoNKiEQcjG
X-Gm-Gg: Acq92OH+VHn4pHPCNniHXJoNPKsRBMTvCVgGwEsuqVUjNTeZk/WEKXHr+vTTbdNgDlJ
	6MT2rxcreOQlEHg8rHoRFtyswYBjL1aMxktxgrcb4ZnUe6LX8hH0NVRBZElR5lrK9megrmaEGQe
	OrB2yoTT3e9IdZFu4yHmir/z0KaLk40NC1/mMtRUKLLsE5HYJmUfdsIy2uO/uHA9etTpFtHvGNE
	C8Bt2A8OvVBKrQprSwQDKWvWhxY0MCbF9DnhPB3n2ayKMJb9flKtKg82s5kFb6ACcSLIUT6dtvo
	79dffrX6+LQZF2s2AM17jv0JO8V9NxJNbAGQFfO6L0ub/uk4GLU9/IKQvxeuvAiwjJ6xo8WnA7h
	on0z7UDFYM2ZWlaVFoKUu51JwqVjsh8V9oMp8DbCO7vyKuF03oTT6ree2xIlFzySrIU6RYZBye1
	yPuoxbLXFQaEzqPA1eJG5zsgmJ7Ib9wtVDJOULuzbADdIiBfZ2X73J3kzGCUD8xVluI4sVjF5LL
	L/nbhfU8g==
X-Received: by 2002:a05:600c:a406:b0:487:1fb4:7e1 with SMTP id 5b1f17b1804b1-48fe632a02fmr276048075e9.22.1779228507861;
        Tue, 19 May 2026 15:08:27 -0700 (PDT)
Received: from Ansuel-XPS24 (host-82-55-252-101.retail.telecomitalia.it. [82.55.252.101])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48febe585absm118304005e9.19.2026.05.19.15.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 15:08:27 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v7 2/6] dt-bindings: clock: airoha: Add PHY binding for Serdes port
Date: Wed, 20 May 2026 00:08:07 +0200
Message-ID: <20260519220813.28468-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519220813.28468-1-ansuelsmth@gmail.com>
References: <20260519220813.28468-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_150829_900613_3226B5F3 
X-CRM114-Status: GOOD (  11.24  )
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

Add PHY cell property for Serdes port selection. Currently supported only
for Airoha AN7581 SoC, that support up to 4 Serdes port.

The Serdes port can support both PCIe, USB3 or Ethernet mode.

The available Serdes port can be selected following the dt-binding header
in [2].

[2] <include/dt-bindings/soc/airoha,scu-ssr.h>

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../devicetree/bindings/clock/airoha,en7523-scu.yaml     | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
index eb24a5687639..913ddc16182b 100644
--- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
+++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
@@ -23,6 +23,7 @@ description: |
 
   All these identifiers can be found in:
   [1]: <include/dt-bindings/clock/en7523-clk.h>.
+  [2]: <include/dt-bindings/soc/airoha,scu-ssr.h>.
 
   The clocks are provided inside a system controller node.
 
@@ -50,6 +51,12 @@ properties:
     description: ID of the controller reset line
     const: 1
 
+  '#phy-cells':
+    description:
+      The first cell indicates the serdes phy number, see [2] for the
+      available serdes port.
+    const: 1
+
 required:
   - compatible
   - reg
@@ -65,6 +72,8 @@ allOf:
         reg:
           minItems: 2
 
+        '#phy-cells': false
+
   - if:
       properties:
         compatible:
-- 
2.53.0


