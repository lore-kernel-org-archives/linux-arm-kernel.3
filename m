Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54CE2C55162
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 05:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LDt8py0RwqfKJ99qa00T7ayi3DardBnaCg62Nlf4UJY=; b=G49U7psroVboD1rnUQKix0X6tW
	mZQEPoeP2BLhtXDynFLNQBVPsTqvu1IWcYOnjJVPenLdWFQLyGHS8wX6PqQFzdGHg9QMBqo1fYNpg
	VVosUPEv7TEd1GrNom02Mtpq4AkT38kVX3iaxmQHNQ9RPeYwwK+ez7qxt546eyx5L8vL1PsCet/ZY
	kbdD85PHSbsKPRnSl6ogOyiP/rgjIEdLB7aNmegKyH8mgmlO5Y+WjpRfMkbjrY4CElp9ELIOYITgt
	HIYhtlbj0XMPFWPyTzhCdQ66LVYxTFt62XkN91OJCMLQ18tW1V1I2qtInEvfoLe4zlLSWDtgRXfXb
	Z3fSAv+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wql1L-0000000GKTr-1ZdC;
	Mon, 03 Aug 2026 05:15:27 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wql1H-0000000GKRC-0cRs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 05:15:24 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-7eb42a2f5feso1476387a34.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Aug 2026 22:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785734122; x=1786338922; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LDt8py0RwqfKJ99qa00T7ayi3DardBnaCg62Nlf4UJY=;
        b=h6IkIdVcjZWcl1d5WrFHT6jwlyTBZ/WgE10zftJjF3lblbCSWR7jFQCM/23Bo39Uix
         XZ5Lr2S6zYt/Nivz4LOvcPJvTFllhZiiGZuY43Uvz4GAZJm7MK4F5bgL6avuoS+5JyeZ
         Q4Et3JUdlThCwtNySidjNLDv9QQkCMYGRpgvb1P/kD0dRQEYfwGsvY7cgS8CGrwP1DpB
         ndPa0HcBOPZj3TNm+SM8TnqohEGAdBFpnCQYMFYXNnXoY5xAPHwSbFym+sJ1NjCWVGWF
         XhuN7qT+3lzWEAAWzig/77MZ0TbcMTiqgzuG28Fi/JJIWrYUnuqxCTk1kUeAwHYdzI6X
         +8YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785734122; x=1786338922;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LDt8py0RwqfKJ99qa00T7ayi3DardBnaCg62Nlf4UJY=;
        b=Szjk1pIdYn4qnjZW5Z9c2+cBaz+zYnioyhe1tnwm1XR+zqrDGNWAPwE4lT2HM/u7g4
         Xi5QJ08HeUz2AcFSedDUOo6QU1cXbl0ReNPqKdsMpTDhLi2zg8ozkLWpi5m4wsnQdXMV
         zYvJ/r08OPYSokJ+T2am0YVXbpTp3UfKSUosgNeEySl5RTbFry3o3aGO2SOAv2UAwGDT
         cBX0X1iKvljl3J/4uCAMz1B2/99PJ397pVLtNIU2tbFzfdkFXeWKDdQL7aTenY66O/jz
         QhvMGDL+f+Bpxm7qvAxXBYos9Z2yt1697z4nMkDH0UNN03wYqzIV4gzQxVYAG8ZL4pT6
         BZvg==
X-Forwarded-Encrypted: i=1; AHgh+RoleI0/UxZfG9mN/lnY9DazuI3y5oA2SQA6cR1XKC62g4h8xQW2hNv6IzQVftu0ZPVJ0bIykPKyV0GtS5HyQg87@lists.infradead.org
X-Gm-Message-State: AOJu0YzGQPQbeFJB0ekvmNNSk7GARPzGmxC9k01kHlTU3U37V4CJvS56
	Vzm912epXhz87/UMQ0Z+APR5QX5+B2o4FcXShJ9d00pEn4qhj+AQ/yI/k6VJaWB6
X-Gm-Gg: AR+sD11y/98swn5i+tXiBBDd9Tcyt+h6TuUCcQAFo4vm2MHPJxsCDxLex448AT9z+GP
	wS+qCxSaClvUkrRWZiRBFFWAZPOiz14t5QjnCw+98dArqY2ZxCBVbcAUGfyrIE0Ek8OVdlVTJOO
	aJF1fNpXVceV1E5q/ZmdwcvEDp1hTTictzHbC8zCbqZtyf/22mXVbHFTQtwQMO+6FmDRzT5eW2F
	3EpG2YhxHHQSBpzGwbhZGNGgADHIjtofhuCOa+hQ7zU3rbEpSyMCbI1JSrrMOk53yy0KE2Y9MVf
	Est1u6Comr3V/WsWJYcn8hILERfUDFPtbHF2H9Tr8QYFrtCN/vOmTZDhbrVnQfQV0JB6zpT22x+
	npr2Mx5ADVKLxORo3a14kL7y4WXkJuomwdaPbCx9h4gKjZH1Ot8n90GFYvZ1kYGxjcUrb46w8S9
	VG1VWwb6NMobieYe88LmcrFbkCCGmrV0oovwDRA3pZiHI7qTWj52Ls5OCkF7QzqM1xY8piYge7d
	h2lGHTqTVvUhefSEUPRAvVLCczST1KtiIJC2lt/oDI0Nlwb+oMegAGYttCfV1Mz5Ua6Yggao07U
	ohi+Mh6d8HqrWIhpC8EDjgeHdw2t3VQjaAkkQC/e1ZSExhaxBd4gNaaz6Uh7gUHMDVX+is5M3nN
	++Bd4GjAYk82A52PzU6kGBegsaj4Dfph+NgiF
X-Received: by 2002:a05:6830:83b8:b0:7e9:d277:6e2e with SMTP id 46e09a7af769-7f196cae28amr13872954a34.7.1785734121347;
        Sun, 02 Aug 2026 22:15:21 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f18f07a5e3sm6787108a34.15.2026.08.02.22.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 22:15:20 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 02 Aug 2026 23:14:11 -0600
Subject: [PATCH 01/21] dt-bindings: net: allwinner: add H616 EMAC1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-submit-acx00-of-dynamic-v1-v1-1-0a53cd9e21cc@gmail.com>
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
In-Reply-To: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 mfd@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_221523_556422_8EC03E4A 
X-CRM114-Status: GOOD (  13.31  )
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

From: Richard Genoud <richard.genoud@bootlin.com>

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
index 2449311c6d28..102ec98ac2a0 100644
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
@@ -622,6 +623,7 @@ allOf:
                 - allwinner,sun8i-r40-gmac
                 - allwinner,sun8i-v3s-emac
                 - allwinner,sun50i-a64-emac
+                - allwinner,sun50i-h616-emac1
                 - loongson,ls2k-dwmac
                 - loongson,ls7a-dwmac
                 - ingenic,jz4775-mac

-- 
2.53.0


