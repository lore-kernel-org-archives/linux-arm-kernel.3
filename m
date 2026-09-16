Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51E52C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 03:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=acNZzyf/OWXjg5U+vhwU7dGtHUd/8SQbsA8hrhEspe8=; b=I1s2LrtHUtEffRnvEufXgyXQaA
	jBAGVv1AmHWkF/tI3tif825se0aIb09qg8S6XWXZXjK+mHbyeJ1eNoG7QC2gXsFhlPySheSEtbSRj
	1aeQWP8FDo2AQFRb7Oq2wmWmysn95BDF2ojP/0tbw96Z2BerOmV74oV1QNExwFuCCZo4/59tLfPRt
	BaxKQHaZvI2VN1A0GJATEtW6tFAa7ixeMGf6Cdw76r7N/bfUavKbiKsxsnVYlcA70EWySIFYKqr+f
	L7Rk+Egpt0O5/SO/Om4O0f9BP831bprzNkOguOmwN9kIXiN3+k08wdqsB6FGzMiM0Eo9Cj+Z8YrOW
	aNykz/tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6g0g-00000008Dk8-10Ly;
	Wed, 16 Sep 2026 03:08:34 +0000
Received: from mail-oo2-x0c.google.com ([2607:f8b0:4864:31::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6g0Y-00000008Di9-1sYz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 03:08:27 +0000
Received: by mail-oo2-x0c.google.com with SMTP id 46e09a7af769-7f4f0d1779dso360250a34.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 20:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789528105; x=1790132905; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=acNZzyf/OWXjg5U+vhwU7dGtHUd/8SQbsA8hrhEspe8=;
        b=HnEYxBbm+BnLpdQyyM6qe4qZ1zkFCLrFjpBZf2cQqmUlkfhH6+WD/WWcG6WLTUiljM
         braM5KznMXsbnG3fLBOwFFQWAxyrlLZp8HykHR6e+FwSP1AiT6VFgnQSXk9BPRT+cPVm
         D0pEEdXEaSCKnEb9Eos05T/5XHO0BjNKLem9SjRTAmqNwRD85O2WGPs1d82pWVy5zOlZ
         icMsRAlt/HUsDhq6B4MdKOcIXYitU2cMJICsFeNHQ6M9WYJqVCFgZxCGDAdfzVTYDoxJ
         ENKHPjHDTpXkUMW7U7oq8C81zxh70qDo89l/Hov7RP2OEHBZ4X5kDHJKv5lb7cgdTeUu
         u2CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789528105; x=1790132905;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=acNZzyf/OWXjg5U+vhwU7dGtHUd/8SQbsA8hrhEspe8=;
        b=chSGsQIVJpMhfAF9O0owdGW2slQ3yfY0AC0yQDZR7xyfNwPc7QPdISOLLh/gLWivvX
         ksvhRJ/m1AR+PeVRpQx4wtsf1ZEcZymy6XV60s47QpW5n9RYBWkCaIaYbdLxvDdmqyrP
         cQWHbqMBXEMwB5oKRagP1GlNscRhV9ddgnKss5v0BMUq1KeyjI6m9eww8pbUwqDwnD1N
         tqvr5Xogf/9WudwlcPk/pKU4h9oBWFiTLIcEM6ay0mp2C04oUqCJP0sln/HKhOxapNKv
         FyPmzm5a8ltvtDia5C7J01P9mQH91ASnCnYi0gNGy2TheMHGj2BQX2Ff3GprROfKE2+1
         d9qQ==
X-Forwarded-Encrypted: i=1; AKwUvBwF58i6iSYA79cUc2kWIAYLzALTQNCHBPMqMsUmoEpkEwr6nhNDMJJPmyLO/W+SjVc1smHHU/TDYns9MIVZ1Ghx@lists.infradead.org
X-Gm-Message-State: AFuF++mReUATJXQdoAn4saCJfdN1rDnPz8vmgPoxt6T+d0dmzVdbiZXz
	/CCzHy0qNMkvwmfpojh16VHOddYdeyw7vG4MtjzLCF8qHRBwFklJtiPY
X-Gm-Gg: AYBFou1QxdhsF2Vgq5FY3MiIBd/Y2LJUge/ogPhWK4LvQ+AIsOey0gGR2wC+f/NRR4a
	Y0S9gmhg0YBPKbndtxmTMSyIGvh+hxkGHUWiqDKGflJLn0BJkMCIdEqVsUN0BA2r16ucHrjKA7j
	c0Y15VRcAC41jsouX11+EouhBY89MrLW5DtTI5u0G+LnDN7n65aACjZ/Ti6pf7nIelBFJadQMeE
	Ku6vIjdm4Q3wa0boWG1hQLN6T+g/6DjJserLhRb0sfy/jXFSpCmhFdwQyhEb9VyQoSjgQQNaRDI
	fPprcpHmlhkof3GvKQievCj8I5ej9ZPSDuLB2y6P1huMLtZFhRJ0CNsxbkvy2TtOWvU5HjWyX+P
	tZUaGCBG4d77gwR8hf0MLoOu+R5YFCOOGJ5ioRQhiI9aI/3Uxi3MsNuqzhCeOvVpmHenP468Cmi
	ZmtRrhx4odKGFdFY4T1KaJ1XBHM/lmDKC/xwu3kURS39pYcpk7uwKXHhWqb3PSjZqZ3yglvlRdw
	6sSrHx/EGA6+EgQUaSdEaMK8a/G3+knJAsU2f0kb4WGdhFTYVXliH2ldgdIAmC5ddcYHA+K+p0n
	oRV1bxtpp+sB16IKxalU96saZAajoZPRQNhS+u2YaeM3/XpXuJF6GWFxF5t1MKDtqcB90YsddwY
	7Vt233nX/S1MVLu3whwj1zDs=
X-Received: by 2002:a05:6820:188e:b0:6b3:f4b8:bb86 with SMTP id 006d021491bc7-6c7d1bc852cmr1139016eaf.22.1789528105201;
        Tue, 15 Sep 2026 20:08:25 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c7a677b3bdsm1718078eaf.6.2026.09.15.20.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 20:08:24 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 15 Sep 2026 21:07:40 -0600
Subject: [PATCH net-next v2 1/2] dt-bindings: net: allwinner: add H616
 EMAC1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-submit-h616-emac1-v1-v2-1-322b32e40eb9@gmail.com>
References: <20260915-submit-h616-emac1-v1-v2-0-322b32e40eb9@gmail.com>
In-Reply-To: <20260915-submit-h616-emac1-v1-v2-0-322b32e40eb9@gmail.com>
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
X-CRM114-CacheID: sfid-20260915_200826_505889_0286B2E4 
X-CRM114-Status: GOOD (  10.57  )
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

Constrain the PHY interface mode to RMII, matching the hardware.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml  | 13 +++++++++++++
 Documentation/devicetree/bindings/net/snps,dwmac.yaml       |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
index 323a669fa982..2cae0133b3cd 100644
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


