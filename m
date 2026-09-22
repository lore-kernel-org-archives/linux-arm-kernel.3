Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C8AC982F7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 00:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oLXSL+1npHD8gI1D6ujrAzi7XeKmrbhfqQT3WXutYPk=; b=WtJ2Z2FNTIg/eRcNslDYG/tIb9
	c6lxozVSSVNoJK5QxhqNgncx+pYSUK9MhbjmdF8opF3HO9p/rWWrIBsrjXOHg2t6WHf02wIrLr8mY
	q08QPP5NCpn1SE+Dn0gJgCNhzK7W3ryF9H/PPn6tpW7N0PwWiEM6GKYSHe1Bl0FUOzvmK0GpfXjYb
	vOkZ77KP1EpiutT2EuKhKUDFK3lEwVc2tnlG8akUgkS0nXi1L+mgSNhB+qxbr3iTVc0kvG8sJ/ArJ
	sI24+9IkZIz0KmsulF78c2jAICNZjtxLTxrjaWzji+GdRZDN4odEfpmG75c+3qfq+XNVBpgQRa9p/
	5VThyJ2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8odc-00000003o6e-3mLv;
	Tue, 22 Sep 2026 00:45:36 +0000
Received: from mail-oi2-x11.google.com ([2607:f8b0:4864:32::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8odW-00000003o3v-3cj4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 00:45:32 +0000
Received: by mail-oi2-x11.google.com with SMTP id 5614622812f47-4c54eed93e4so1399773b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 17:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790037930; x=1790642730; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oLXSL+1npHD8gI1D6ujrAzi7XeKmrbhfqQT3WXutYPk=;
        b=bavI+C/qey6AJsF2JpJLuN9A0Od+D1nmwZRbo8SnedBB62iQ7AQMsJo/9o8hVpdv6O
         v1VEkYbf+umwEsup5aqPFdQQHWc0QLmbQLjFiD/lLnrszKIYGWc/qLUdcu3qjamHb0qd
         xo1qBsuckQRBo0yVJb7nGQdpCL6RH+tQMxFqSA5lDlGjMHZ7XqP8qGE33zhifkE1jsmu
         cPLEWOlR1eTw3A+WMR1LmohwJCT5A5FazNVbgwSL0gjw7TNbf3/otQKsfAmzmAVTyFPX
         hKpbZPOl1zTvj2PiB7VkmT0SCUvHuIVpx5p5W1Rwdxe/6Voo6mLFHZPQZJXM+/dxxc+r
         s2tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790037930; x=1790642730;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oLXSL+1npHD8gI1D6ujrAzi7XeKmrbhfqQT3WXutYPk=;
        b=tdTR8uZp+ew1XNad1o4ghM4XYTvcQysO6PtySwq43z3aC+0KECJJ7+vZJRdFLzf4a6
         iHoM2LwN9YeIL+tbncgvCXT3PZRmH/o2ZkK5oRM5SBF09p1pI8bhlApPEdhMl0P+pS7d
         at+x+H793K/jzxx8FF9eC5wALj6LyP+i8VJkL1oFvtyX7+0mrOJQ4b3lfjYAVmco4ioS
         W0a2Eq5Oeyrnlc3FAsP/ce9ZgLa278Tic0afyraUJ6OFCR5ktMrJN2niBBb3MYUhZORa
         GaXzwlok9QpZrpf8f4aGTltiUFurYuOs7z8Ndr4nibUrqOiE1SKmHzWAjGBvpYpTG5V1
         mlkA==
X-Forwarded-Encrypted: i=1; AKwUvBw9tx+d2Kof9y2eWl2OLcvoxQ89qnkEzlLcQNiKK8Rag14Yg1D48zb/X/Y9A6YhvxpXtGha5ecARSEl3xBN40qn@lists.infradead.org
X-Gm-Message-State: AFuF++nF6NW+rTzT+tiPXpIO78oh0fNVoelZoNBlDJIfSH+YU/3+BRHk
	ATm6VOUxd2COJlqpV1c1CwhJgfgNh+YjVfQBUpzS3QuqG0+KrGi54wjZ
X-Gm-Gg: AYBFou1mOaJmCtO9+8ykrF8gxW6o9qzReopQvyGZwLlPHsT4/OfFOEglH4oCPs1YR5w
	EyO+2w96q3eBPsj1YUQy9CDcAdNCTXcw5iiLQmBkPjb1VIm7+dn//GJNRopOXZ1HM7RD7p69uCS
	UGfBg87A6Ve09+dy0YEUi6Bl3HXnA0l7F8r1/uINMMNZseUd3c410Nds9KcTq3EeknEjizzIfWy
	ZiIA06u2Eduu/cuoL+d19pDqQGDXCJ2KzsdCRDQmkPhoYZTZGy76EkrgaePymPazvP0t9dvfXoZ
	KAzTZWXqyd/O5mXPGmbAIGetXk8PL3hEth8NyDrkQYSB7up+UnyrwJo/b+VXh6N9ys/QYYxsp4+
	+ADA/nyBbKyk2wdhRHjKAXJbmVEusxiSp2BO1kgiXvqEkLUtUTO1wBoSsM+dswyB7EnMOVZFOF3
	kMI4Fqjxoz/L4vQ4uMYjoEuwo+hjeBqS6Wfg2WoXmlG2LPapi8k8yGRhEYddMlsUWvsa8yefnZl
	vbFthLu40HG0S7+z6Yirm3B4bDJe268VezkA4i8rRm/Urk/p7YYaJs9X9sSyUbbcul6+VUqYBEA
	U69wvu1GMtgl91vjfvnRob6v254nLBKZh2gPj8rVA0X8ct/e8z+B2SjkgFwvKMrX/+WGqqh3lTp
	nlBTBXBEUqiVvvxbaIbSSNw==
X-Received: by 2002:a05:6808:1526:b0:4b3:7aeb:1b73 with SMTP id 5614622812f47-4ccf59c8345mr10592065b6e.2.1790037930082;
        Mon, 21 Sep 2026 17:45:30 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4d4bb6be7b3sm60201b6e.0.2026.09.21.17.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 17:45:29 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 21 Sep 2026 18:45:25 -0600
Subject: [PATCH net-next v5 2/3] dt-bindings: net: allwinner: add H616
 EMAC1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-submit-h616-emac1-v1-v5-2-ada661ed9e9b@gmail.com>
References: <20260921-submit-h616-emac1-v1-v5-0-ada661ed9e9b@gmail.com>
In-Reply-To: <20260921-submit-h616-emac1-v1-v5-0-ada661ed9e9b@gmail.com>
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
 devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_174530_914125_F6DC6427 
X-CRM114-Status: GOOD (  10.12  )
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


