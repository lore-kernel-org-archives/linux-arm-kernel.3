Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B15B9C9833F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 18:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NbHMYUvXV7KivNO4nzT7c/gFlgP0cqBHWzvGETsZmKc=; b=ZpetC5dYxMa3r5QuD3MZZ+GYVf
	+myNy1TilJXoWRztAdpzvYDE+pvtLDr1DxGOd9yZIPX7lQuS9ynJN/Q27crfhDwEjevr/jr8oOiR6
	p5oJ3T5e0YJvCqCvoC7axv8g1dUEJGi7CZeCuzXwZ9qyNw59Gk+A1/+IwquvEWExOKulfZb01VOMX
	nPosFNETZWiZZKaFGHzxpboAo50GAQa3spAx8LjWJxHEgslYhO7LIGF93fNLsnSm0JQgMUbZ1cIqS
	hs8G7bBUfsWv9xAkJTBC790sL7hw64jntyxkj5OVSAdmVTntiohNNOHmB/N6eTUIj7dn1bxTVLyv5
	yuqlJCow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAtzN-0000000Gigt-46D5;
	Sun, 27 Sep 2026 18:52:42 +0000
Received: from mail-oa2-x1e.google.com ([2607:f8b0:4864:30::1e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAtzH-0000000Gidx-0zHs
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 18:52:36 +0000
Received: by mail-oa2-x1e.google.com with SMTP id 586e51a60fabf-466ccde2ad8so1511865fac.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 11:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790535154; x=1791139954; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NbHMYUvXV7KivNO4nzT7c/gFlgP0cqBHWzvGETsZmKc=;
        b=Aq9SkTN0007m2Z2NSMN41qiPQLIRhq1e6+Jw5JKLjCpaHvf2pVuOUFH9RID4EmJGrG
         QULGaSgk3esowLk1hL1xZ+bB2wD5e+Ptn2Wj2hiLumSx5knR2IXdQPmXSosg8co7yvu5
         I/hY6PSUTmLgLIoN2di2RN7bttraYwMyaI04GDx8abwMEKMATDTuhqGrmrhsdfHHUstR
         8zfGVJ6nY2QI4u15N8ip5o2KRKq9In3FycFFIeVhb0HSJkbhX1p4wEDW1EM5h0Ay2/LN
         zhlKeJIqcqOIhvBXOfxSzNvO2grMheUqa2YNu23HjEUralnm2k2qz5nPx1TWBP5KX3o2
         lfDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790535154; x=1791139954;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NbHMYUvXV7KivNO4nzT7c/gFlgP0cqBHWzvGETsZmKc=;
        b=b9ruZKsPs35rdNjtdk8zcInDsrQA0Ju7SkVAAge4vfiZpb1Y+nQlPQoOaE31/je70g
         9ZoVhA9ogzkG+ZIcozpDUAMjJGJFwjq7s5rVaRskMm246saFlOZxFrFyazmGC7ajLgDs
         30GI1VZxDsv/cBGJqWn1CWS/pGTGKgUBnVz3E049WXX1Oq7sMgP4ROnZNmkK+76U+h2d
         qSvVbY2/AuVcUyMJi99ZcnqXZVrz+9n6YkmlylleoqfXE1zAC/PrlYfhfpWmzji3Gf+B
         lSssiy+u8aE8DxGbTFygk1dhZ2vEob2ac1uZ+yyfOIj+1SKj3CDB797JIpXzly3OEGDK
         sNMg==
X-Forwarded-Encrypted: i=1; AKwUvBwX0l/lluhvWP5p8zbMXmoVhqbAJmMDHQtyU5VBUPk7Z/nktuZuFxRzKZSemIUMwohdmkIsxxO/DLrtKtr/aHk9@lists.infradead.org
X-Gm-Message-State: AFq9FYL47C9RBVhxwZ/ezeeFDt/xDlauxKu+LZYSbQpcPnZa1f8IkJ8f
	OxX5mxdm0Tqek4nZTl66DsnenUQY31vyxbNA6b2Bqjsgwa1OUFcQX+6K
X-Gm-Gg: AYBFou02db4hWIoE982797gHnXIsoMnRM8YDfHLqbAM36Hm4n6isoUsziK+PJJD+Ivv
	Kqr2V2xFS1GlEeoPweaiYmMV+aBQ8d7icNM7FXMeNGbOrVaImJD2lidblASx1VGF7h93nZrV5HM
	qM3hsRE7r8K/ptdtPBft39v/0fUwwn3PTmP2Ybd5veNdgKkAGh/91KmTBI0a6oibUH0wqD20dbw
	WtYp6RQ2ZRgaTvu7yeFkyTfNOrNcL65knEhJPEwF7i1b2UKWXNASP7/fWpekjdSvsaJg7CLTJJu
	J8bRQj4CbbGNOJJP/qrZdabT6SO3auDCu/BMKibvCDlmc7fgzN2V8k2SEEQGTMVGm7yImde1vyO
	+S4NmCkocmE45WrZbiPc16LhbdwJUlVH5HFSaF5Wb8hPi99PzCf1hfj327RA6qElXy6/bcbWal8
	QZjJvoZrtte0DIg6o1AxE2TUcvHqRTyoKna9+0IV0PwZ7BTo4saRKXD/Q2lluFj0fVtU+IltRmK
	QlhdF5VILGvTJKcbGAhu/hirUgIu9/fAF6rJdq05rGUJCyzBTJ/pw72Y3Dwzvv4zIgU1vSwHoLY
	BnmVtI4zNapVNtlS8yiNJwnCL499yUrVB24ghtr6xsxec56/ddF40mw6esQ8QvAlrSX+8c/r8+y
	vz/9Fie/5bqlr+VZ5Yz1gD+Y4mRuhX4Y=
X-Received: by 2002:a05:6870:9a14:b0:485:d31b:775d with SMTP id 586e51a60fabf-491e55b11c7mr11348983fac.27.1790535154236;
        Sun, 27 Sep 2026 11:52:34 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-494877590e5sm4489452fac.13.2026.09.27.11.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 11:52:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 27 Sep 2026 12:52:20 -0600
Subject: [PATCH net-next v6 2/3] dt-bindings: net: allwinner: add H616
 EMAC1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-submit-h616-emac1-v1-v6-2-e64971f4e414@gmail.com>
References: <20260927-submit-h616-emac1-v1-v6-0-e64971f4e414@gmail.com>
In-Reply-To: <20260927-submit-h616-emac1-v1-v6-0-e64971f4e414@gmail.com>
To: Richard Genoud <richard.genoud@bootlin.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 LABBE Corentin <clabbe.montjoie@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>
Cc: Alastair D'Silva <alastair@d-silva.org>, 
 Maxime Ripard <mripard@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>, netdev@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_115235_301377_11C75A9B 
X-CRM114-Status: UNSURE (   9.93  )
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

Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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
index d3e591157faf..2218a492817f 100644
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
@@ -573,6 +574,7 @@ allOf:
                 - allwinner,sun8i-r40-gmac
                 - allwinner,sun8i-v3s-emac
                 - allwinner,sun50i-a64-emac
+                - allwinner,sun50i-h616-emac1
                 - loongson,ls2k-dwmac
                 - loongson,ls7a-dwmac
                 - ingenic,jz4775-mac

-- 
2.53.0


