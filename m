Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22606C982D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 18:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XpJyi3gexBtR9fGEP/jcxswIyqDdKggXh7TtgBulLqY=; b=ChNIyOGkvy8sadtphp9avBpdyW
	y/2y9aSCoo+a5QwT7Q1HmQZlf7QDojQQbVC2cJ+9fDtZqyqrKHoJBmtxq1TUOjTNPTI5x/QsZ3vJ4
	E0aCknPLhVUMAcZa4I+o1SbyLgtb4Z0MhlGzKqGIjoI1iqUSPiEwvP463RdfgOpbJcWieMTG8Losc
	yPckAl3rZtWJWBJzkbHHjZKVdxGH3HnZdXd4M1Wb0thT1IeNXHzyml7dfSNTPtopTEagAuXQfKdLW
	TH0KcdbHgqt5PyjYcXZ8cQyQRnqNhQFoF1ydzGIDjItO60woFPFXihUOwzyycWNJHnK7nfWTxQWg4
	Sz2L0wmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7GPp-0000000C9y9-2HXu;
	Thu, 17 Sep 2026 18:00:57 +0000
Received: from mail-pz2-x0e.google.com ([2607:f8b0:4864:3b::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7GPn-0000000C9wv-0AOT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 18:00:56 +0000
Received: by mail-pz2-x0e.google.com with SMTP id 41be03b00d2f7-cc1cea34ef3so1106833a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 11:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789668054; x=1790272854; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XpJyi3gexBtR9fGEP/jcxswIyqDdKggXh7TtgBulLqY=;
        b=BqnBuI9WQ5HDKA4X6j6/zULTUyqwdGmxlGHU7G2S0K1x6gGtR49Zdk/ufRon90ZB7X
         TW+kdBJxLFpf/RTiCA5/f0f3EcExgoaOV9Ae0oMW+2wbRo8SPfu+rTDohl6VAv7waZ2B
         obKn2bS4qvvF2rYALUuEiwWD/4kWWRLwDNCvJy+9bAqXRQMMBgdv77ZsLHOd6FFFOOOM
         otCPxC9a0QgLiI8Yf0HuiwFHT5QTX2aC82wxNNAeAZKMiet0BslndJognHlHxgtDFmDL
         27fAFkIe42qINjQKnKkZnEUYPoxtEBX6dFBNhtXlQMlEYO4YnuM0i+mwH4nstW34HyBL
         kzFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789668054; x=1790272854;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XpJyi3gexBtR9fGEP/jcxswIyqDdKggXh7TtgBulLqY=;
        b=NXclNwkqCvmqP+hMAKwCPUSPGPSU/fGJeiD1HxwJAemx1axacHSvldnUSu6djiwXgP
         Zo3EPVWW4zqO+f4+GiuVvvC41YQHuSu/tQQpU8OwPWVpBJkv9QHN8esnM7xbDJYdGrs4
         SikbMwNmWsN5loMfUjXJW77CP8g7lR8zDrKpYUWKYpaNrySGkEs84+TWR9iN2VmhnoDz
         acXQdMnZatyaT6MoBOQwdlKwMz9J18iRIH35q/nIF3ux7b61YIZs5f/HedH5qY1kfeXI
         9zZKPs06AJ04gDuyDyMNAM+UE+bIsnce5JwuktqOFlcmv/F8O2RrD9wGqmSvDKt0SGX7
         4JRg==
X-Forwarded-Encrypted: i=1; AKwUvByh5IQJD3H88ARg43NuQq907DOHrgywv6pweOcgDFGLpWjnG9erXlYI/OdV8mLkmradrpXZ1Cwkxz3SKnN71rcz@lists.infradead.org
X-Gm-Message-State: AFuF++lavVwnI+DDSdee/l1fU9W0/5tNCJWEBdsbcb/LXhz+ZE7ZxEkw
	4n6j2XX5EG2ubr7xc1tRlHz4QSq9k6ucaq77Rv1iVpukRpUZEUMCsb5vBNr1ZDdW
X-Gm-Gg: AYBFou2XPJILnlwHfWZ1jk7BzznhwV3sTALk08WuWSIxl95RphmeLy61+aKRfyEcdtj
	lVMZ9CgsA51j0c+xri1XI2MJqsX9mEpMusqVJcE3iQsm/F6uc/8XTHzraf+Skyt4FH03Vxbye+m
	tvR9lfrG71Hy/BFenglPxIf60UXFRXId2nB0X6AzaP/162+5CfAtRiDQvsc6t5xHznYg3cgIuEd
	W0HIHrMhZbdtEfRwDveuYsrUQMManeb04ExgDWf00oJLP51vI7EKgTPxYbvUa1A1AUgAC0mZhg0
	UlWOe3P8db3OodDNopLweVJI7kF9CwZlcKP8ChOo9d3PzXv1C2r9yzavkpBIety3lk//kdC+N9I
	VEHD39M94CSSfWZxFJ4KuqfGgiaEkm2JaAkKb9jLM3EiEk9fL256jN+kuw+fgU2TyNl2zMMCiuU
	pHxH5dvNoBTOHwrUfR1Aj4d51FqnrYWkMNVXEbuAQ1M0m7ShHDd2YnFgfbvLUx2m3SC2z+F5Tt9
	+y8Tyh/onbEjJpmY+N4slniZQQi+dapPL6a7xAYtKpgP4++8ng7ICYWwHvtft43pw4ZpduPdzR7
	dLmeWrw8RBBy5KvNQ65ab+5Eb9iUW8s9o0Mu3g9E9DZOU+kBe4uRJOwC0Kb8ncOtgd9qIud/VW5
	stgwEcR87cDhno/bdKr8n
X-Received: by 2002:a05:6820:83c5:10b0:6ca:b5f:e6cb with SMTP id 006d021491bc7-6ca0b5fe74amr1221351eaf.42.1789667723400;
        Thu, 17 Sep 2026 10:55:23 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-486ab6c1f31sm578446fac.10.2026.09.17.10.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 10:55:23 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 17 Sep 2026 11:55:13 -0600
Subject: [PATCH net-next v3 2/3] dt-bindings: net: allwinner: add H616
 EMAC1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-submit-h616-emac1-v1-v3-2-62cb8316e19b@gmail.com>
References: <20260917-submit-h616-emac1-v1-v3-0-62cb8316e19b@gmail.com>
In-Reply-To: <20260917-submit-h616-emac1-v1-v3-0-62cb8316e19b@gmail.com>
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
Cc: Maxime Ripard <mripard@kernel.org>, 
 Alastair D'Silva <alastair@d-silva.org>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_110055_092301_0624E7F7 
X-CRM114-Status: UNSURE (   9.57  )
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

The H616 secondary EMAC uses a separate system-control clock register
and supports only RMII at 10/100 Mbps. Add its distinct compatible
without an older fallback, since using the primary EMAC clock register
would not work.

Constrain the PHY interface mode to RMII, matching the hardware.

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


