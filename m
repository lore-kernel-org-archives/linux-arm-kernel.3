Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D9CC982EB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 19:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oLXSL+1npHD8gI1D6ujrAzi7XeKmrbhfqQT3WXutYPk=; b=DqIekZ0bJ39I3EHHZqt4v7qTDY
	j1aexH6mX7PR9e860KsLX+9C5yvZKDg5RN9eyrqVQRjJnpLtuqDnfa2JGpeMgXq6rc2A/rdznWGi/
	wnhAXNPB6gQ452mMIN4dUY29u1M9f0wVFoqQ6yfSPMdo/ttbTefTWdt4Y8CRJA6+zIEDGd7g0Lckt
	BXU8cOlIuZR3S8ndglRMVpAwuo770dlIpDzUQJpqXn3lKRXX1Rn91/sfpUq1wHp4KpQ9XXAFtGjFj
	iYZ4EvjDne/zj+5+2JohClsA2piyhY8iNDPgJavVrq7jeJ4zuHAi+Rdk0NyMXIdUML2a/3L5N+zJK
	bAVIAUuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8NU0-00000000Jqc-22F5;
	Sun, 20 Sep 2026 19:45:52 +0000
Received: from mail-oa2-x10.google.com ([2607:f8b0:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8NTw-00000000Jp3-3cXq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 19:45:49 +0000
Received: by mail-oa2-x10.google.com with SMTP id 586e51a60fabf-46accbdfc39so2512399fac.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 12:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789933548; x=1790538348; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oLXSL+1npHD8gI1D6ujrAzi7XeKmrbhfqQT3WXutYPk=;
        b=ayR/O3l0bdau60gkaQh0n3TgEG3WtGYtaCmTsO3QyrCZlp6jzcMFBiw7fuSH5/kxR5
         y/p0VYyCdwCu1zn1xMLWkoQnekvisu/yIFrz6u+1RZedw42iNiFZlDalHyfu8HZwd2PD
         cRMOVvRst/jAdMJgTI9Y+z1xjCS6VdWJtiR7KCUTBi8lkJ25V8k/MWbKuFlmmAadMFsG
         JDlT50hN+DxAn+gdossFbHMDHSXIAyvbkWhRT/IYpFMEzXLNItLQOLOe8HCl93+dZ1E2
         tk36FTWdUgZJS7fGy+1A/QIM7z5oDdrk/pPrv8g0ZDkAL3AFXeXH6FeRT22fD2j3TZ9c
         E/7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789933548; x=1790538348;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oLXSL+1npHD8gI1D6ujrAzi7XeKmrbhfqQT3WXutYPk=;
        b=hMuVAGpIs8qJvy5h7ivu0aQ53Xo2gjvl9IlcwDkICsgWW2Cu2LInGB1cJQ5KO/bHBN
         IiBykxFdgv5OrzbtAe6EZ3PbMeKT/K/4SBs9E/ElO4KSt0yW9zSya3p2zVjB1WtnIM8V
         ySAO2TArEK9h2qx+fEMysdZ4f4L4ZF+ZQOyJgKxxXdb2rm/bYw9CjcHQ95HxUNtGgJgq
         c4BeihvG7+tbkLCh4RCNfXMVPS7VEBzjp3TboSqNeIlyIdeoB19BZ7Ia1AucRUvyFqDc
         xzlzLGakrfAJwt6l2DFtB4K9VOwDTUNqlawodVk20r33+XdalcPyqovKlcgUH/6Ka4cd
         q9GQ==
X-Forwarded-Encrypted: i=1; AKwUvBxh2iBxapKwxlrkrczp25ZbC8soverX6tg/EQPy2sFm2eOhqEnc7mo+g3qZqArHOfa0zrqkVivuFa3k4Zq/Rdc0@lists.infradead.org
X-Gm-Message-State: AFuF++lM9oqOQaRlZIVE6nRDjG5b+TTf2zZJbAwLHahtgbaQtOiC9VqG
	WMAGqh8q71LzuatcLCH06eAkxqYQYTiKZEdiDD2O60gGtkkcEoxdFmHT
X-Gm-Gg: AYBFou0/f2NTwwSSulT/ueC3tRqGqmWnfWg42xE8eYbC0K6Wer3oJ+JR+BwfxLLDnah
	M7kdfT2EsBO73QRonN7SfGjyUMqF7bKzy+OMz3Ms2rGF3kslWLVqBYXj0GW8QJDSfkblFo2uBFN
	Wew0XYRlzVFNRU1ZFkSJifdZhc5u5oTGi2ocxu008Hz41sreb0XuHcH4+8sEYIascL/8y91izoj
	25ENZOP1tVbcNmk1BsSo5XDbiLvWRQ8y8+AjIGir379b3tbTR1o3Ux85Y7AFYGBAeYOm0WCgR4G
	f7yVu7A/IU9d1UAysb8wjqVepWbzOf9h/Ug9Q8tj2Oggpqo9vI3NmuXTxZwyJ0Q0fk1nLnx4XOT
	W1w1WEySh3lg0Yo7i6RqkROgqCXLuoQfUI5KKzBg38cnSVDRo+1XyJBmhKrWbxJJ82wDBbXvPeM
	i+U7auAto+eEKqgbQsk+Kg0mtoAwmxgZKpeNrQHDMs55zRGRFEzEYD5+eN1NO6GzqrMU2sPvu3U
	Yj/gHpZEB11eQjcryw9mvFqIbXco2J7YpcZ4zUbH7iOy8M5xPpP79hdJbSOkWwi0J501RmywAgw
	/fb1QWYfd+FS4LZdviXMnHkGuMCXct0glKJqnbgOoOGhqgmA2UA7GJdiuwwkrI2w5OZ6yWR7ALC
	9TEWkDtiwGvo2oZM2saaL
X-Received: by 2002:a05:6870:140b:b0:448:cf96:25c7 with SMTP id 586e51a60fabf-486e5a6680cmr8538751fac.17.1789933548079;
        Sun, 20 Sep 2026 12:45:48 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4881f4d7861sm6103834fac.1.2026.09.20.12.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 12:45:47 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 20 Sep 2026 13:45:31 -0600
Subject: [PATCH net-next v4 5/6] dt-bindings: net: allwinner: add H616
 EMAC1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-submit-h616-emac1-v1-v4-5-8347dfe2eb7d@gmail.com>
References: <20260920-submit-h616-emac1-v1-v4-0-8347dfe2eb7d@gmail.com>
In-Reply-To: <20260920-submit-h616-emac1-v1-v4-0-8347dfe2eb7d@gmail.com>
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
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Christian Marangi <ansuelsmth@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, 
 Alastair D'Silva <alastair@d-silva.org>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_124548_916400_B59619B8 
X-CRM114-Status: GOOD (  10.21  )
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

Reviewed-by: Alastair D'Silva <alastair@d-silva.org>
Tested-by: Alastair D'Silva <alastair@d-silva.org>
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
index 0ff9e3284a06..3fa6e17c3d12 100644
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


