Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E78A2C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 19:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JW8jFyLPHvei3ZpNWECcPkSmFiI6d1/AJVTjb5PqVkk=; b=YqILU3cMSopuqzaGFulIH43rrR
	ldthFk/4kWhc7dvEwYw0vVvjI+JwxaznGQId1NhxaV3wtrTWjm8bAFi8m0VAY2++uOTuT/zz0i7DH
	eWaCBp3nq+kbpWM/u6oXrKjBAcfJ6cJfi0BUCIKeLlluiD9Y99MUSP02Ka4fjsSzwGfAuhP2uP+ik
	9MLj/tGXk5mF8UcpLBTyMHHA8SfgYNwfgeY2DQwh/UlP84QljBOzIsmC3QGE6yCMUEcjzYCQlt8fw
	v/I7NAExAY+IbI8peK46b3R4KxXS74bqihvloP/C1EX1zpp8SWIUSwGLzNkPWOhCwMTS0kkFlvzuB
	coqNQp6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6YRT-00000007p0J-3Unv;
	Tue, 15 Sep 2026 19:03:43 +0000
Received: from mail-oa2-x10.google.com ([2607:f8b0:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6YRP-00000007oyv-0Dqg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 19:03:40 +0000
Received: by mail-oa2-x10.google.com with SMTP id 586e51a60fabf-466ccdd76a9so161266fac.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 12:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789499017; x=1790103817; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JW8jFyLPHvei3ZpNWECcPkSmFiI6d1/AJVTjb5PqVkk=;
        b=gMNfJrKDDdIptgAaqOR6pLZxL6Pw4BRl6sQLu/vkZ8d8eoRQoL7/lregfRMu/GztWK
         JKfi754F3GJs/ApLPtHS/ddQe3S1RlESW7OX+BZx7iMac8iJEgKXkbwVyWzrXV+aBBgh
         /EwNV3lXuTjmM1Td6DTfiPIkj//xqXdN3klHFtsEzRwRJZkcUKJvUHVQ5V+d8xXe6jU0
         6e6MU5hUTHcv5+4ej2SfkL6rjA/OdlpmprbLaqW2gtXRVotbwVfLI7pJTB9F6GVwY6DE
         +3JZQ3oahJpVRvH6qOYbDlp83+/dEiAznOgYp62r1dS18c+6Jb5P3u6W2751c9DguiPm
         hRYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789499017; x=1790103817;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JW8jFyLPHvei3ZpNWECcPkSmFiI6d1/AJVTjb5PqVkk=;
        b=xpFDPCzUdc37yHtEo6yBLsa6nsMo4sjJvk4pew5eqCEBUcTyvLw8RE6nXEeFg8L6y+
         e+NJAseag5elO8I7eBxZ3+ZU3WAGmxR43O6UcH4agiAg+0sLQuUZu17bwlkmajTqBGYS
         btdc6jIpwvrflLn/UD1OvL6b+5REbGaBiCiaoYSsBMem/RED3/zZDzX8ILi9XNLlbs78
         2A6mkg5UnSyNUZmRoiRIzg7/t3Ss+vaAzAvLEpg7aB4wW7fEwp9CBZqLJVKMp71oVEIj
         mHw1l3Zl8fcEUKsC/XhWVMgqA9nADBrFyJUKwSkr1dNSubkLvUdCBONN8qL7NDfjES+1
         JbVQ==
X-Forwarded-Encrypted: i=1; AKwUvByqnLqFiia5EjN/oVla1jYbntWgQZNmU8Fqry1TDM1FvPLW1IYAQ8EKhXujkYUD0edsUQIAKDi0dBrUnZYrmhmK@lists.infradead.org
X-Gm-Message-State: AFuF++ny8MCCxnfEJ5Is2FG+OrHQKDTmrJe+/ca8MMVV8AmWiT86FxNw
	riGGPBBTOKsGgjq2txfvzmnMmzjcWg0mr+8sxPiHhBXSJS1amkQpf5ve
X-Gm-Gg: AYBFou1xb6kcrp83v+Z4Yj9BAjaQXSNTHl/zjbZNZ0aZfHhU400PgxemCUgr5zhLGMY
	+4kwb6tljAni6wO1mbG6kSTIYseN93FpLPcqpopU86uth9dahhHRJRH4PYwWIrpqe2PohYEPlFa
	O3jkUmHM2Jf4RdZdtcBz5v1Vp8pNd288mBdM+YymAQwNZEUWU5Vi5BNTt+Xb6ucqpuyykp6p74E
	OLa2ayvpOUIJQWK8Kh469MtADh8NWv+RaGweINbGLBatSVfAAWeuTW8IADg4F8lzqRSoWv0sF71
	kxyxxdXbGpemHMKkfTHOg/PkoMXkRUUGSNuGLlEP7cMZpE8RMuExjPGGyFI56LHfBF+a6GuMV+o
	GYaFX81izSfiJuYGeODjkj3e9Prz5ZBSz+uouy7j4pIc248GW3ZjAg89yvJN+x1FoTyS2HTrJfQ
	3nSgrAjbxI4/k4n9HnqksKinOACL7CvsL7DBbyh7yInZ+9ZqGj57MAu6NUEDHsW5RHzAbg2xwb9
	QRoWRQz8vXigOW17vPwcu4oRLMRAzQloVn2tqrnwOi8HP8PsaaMQnkTexxA4MGXaoUC6eyEhOHo
	V+9n6dUv0bclvgVXO0M8xx230w82Dez1meM102DiMaL05cyd7vK9qZHPG4PznkiR7ebE8GNDcVJ
	z9JfWFJTh41BvqLGPcLfaJic=
X-Received: by 2002:a05:6870:e305:b0:475:a112:1279 with SMTP id 586e51a60fabf-481fa3a2804mr6618423fac.38.1789499016683;
        Tue, 15 Sep 2026 12:03:36 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4842546a51bsm836569fac.0.2026.09.15.12.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 12:03:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 15 Sep 2026 13:03:18 -0600
Subject: [PATCH net-next 1/2] dt-bindings: net: allwinner: add H616 EMAC1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-submit-h616-emac1-v1-v1-1-195de0bb1f8a@gmail.com>
References: <20260915-submit-h616-emac1-v1-v1-0-195de0bb1f8a@gmail.com>
In-Reply-To: <20260915-submit-h616-emac1-v1-v1-0-195de0bb1f8a@gmail.com>
To: Richard Genoud <richard.genoud@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_120339_118115_AF1E65E0 
X-CRM114-Status: GOOD (  12.53  )
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

The H616 secondary EMAC uses a separate system-control clock register
and supports only RMII at 10/100 Mbps. Add its distinct compatible
without an older fallback, since using the primary EMAC clock register
would not work.

Constrain the PHY interface mode to RMII, matching the hardware. The
EMAC1 clock register also retains the three-bit TX and five-bit RX delay
chains, so allow the existing Allwinner delay properties for this
compatible.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../bindings/net/allwinner,sun8i-a83t-emac.yaml        | 18 ++++++++++++++++--
 Documentation/devicetree/bindings/net/snps,dwmac.yaml  |  2 ++
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
index 323a669fa982..34def84e6c21 100644
--- a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
+++ b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
@@ -21,6 +21,7 @@ select:
           - allwinner,sun8i-r40-gmac
           - allwinner,sun8i-v3s-emac
           - allwinner,sun50i-a64-emac
+          - allwinner,sun50i-h616-emac1
           - allwinner,sun55i-a523-gmac200
   required:
     - compatible
@@ -33,6 +34,7 @@ properties:
       - const: allwinner,sun8i-r40-gmac
       - const: allwinner,sun8i-v3s-emac
       - const: allwinner,sun50i-a64-emac
+      - const: allwinner,sun50i-h616-emac1
       - items:
           - enum:
               - allwinner,sun20i-d1-emac
@@ -91,6 +93,17 @@ required:
 
 allOf:
   - $ref: snps,dwmac.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: allwinner,sun50i-h616-emac1
+
+    then:
+      properties:
+        phy-mode:
+          const: rmii
+
   - if:
       properties:
         compatible:
@@ -100,6 +113,7 @@ allOf:
               - allwinner,sun8i-h3-emac
               - allwinner,sun8i-v3s-emac
               - allwinner,sun50i-a64-emac
+              - allwinner,sun50i-h616-emac1
 
     then:
       properties:
@@ -109,7 +123,7 @@ allOf:
           maximum: 700
           multipleOf: 100
           description:
-            External RGMII PHY TX clock delay chain value in ps.
+            PHY interface TX clock delay chain value in ps.
 
         allwinner,rx-delay-ps:
           default: 0
@@ -117,7 +131,7 @@ allOf:
           maximum: 3100
           multipleOf: 100
           description:
-            External RGMII PHY TX clock delay chain value in ps.
+            PHY interface RX clock delay chain value in ps.
 
   - if:
       properties:
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 2ed4564ae99d..b20149c3e850 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -57,6 +57,7 @@ properties:
         - allwinner,sun8i-r40-gmac
         - allwinner,sun8i-v3s-emac
         - allwinner,sun50i-a64-emac
+        - allwinner,sun50i-h616-emac1
         - amlogic,meson6-dwmac
         - amlogic,meson8b-dwmac
         - amlogic,meson8m2-dwmac
@@ -623,6 +624,7 @@ allOf:
                 - allwinner,sun8i-r40-gmac
                 - allwinner,sun8i-v3s-emac
                 - allwinner,sun50i-a64-emac
+                - allwinner,sun50i-h616-emac1
                 - loongson,ls2k-dwmac
                 - loongson,ls7a-dwmac
                 - ingenic,jz4775-mac

-- 
2.53.0


