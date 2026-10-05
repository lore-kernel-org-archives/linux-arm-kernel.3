Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60DDBCA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 22:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HWO0yYxZDPAwCYSgicIL5MDEtp9MsL193ldKBirIieA=; b=qDQ8CTeiF83eP9wRYSm6axXcCE
	npgmWTWrapC8hRLElNC83MA8Meg7TGV/vfSesNxyozreGK/yKpf6FkZwa4WA8vz078w62KP3jt5dC
	k4CZq5ykm//2oL9NfI+54N5SZppx7P88uHELxECXvNeMUqZU+C3XDB2cfHKusUoQDSYwFZaSxG7HM
	UR9aQpCKa9jZ0gZKV9UgF203ISnlYgzLNXG+mNMKUI2WLdrIetsae42o3c6EFJFuDW41W5t3BtHwo
	KvVqOosKzMfoC8w1jY82FrizoGpd5QaDcpzeqkzowxcHdVtRWBIWwXmnE8cDWfo7I28DJTcKl5+ck
	wXYL2d0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDrD8-0000000HGIv-3pmB;
	Mon, 05 Oct 2026 22:31:06 +0000
Received: from mail-pj2-x08.google.com ([2607:f8b0:4864:39::8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDrD4-0000000HGEY-1c7l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 22:31:05 +0000
Received: by mail-pj2-x08.google.com with SMTP id 98e67ed59e1d1-398b9f722abso1216096a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 15:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791239462; x=1791844262; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HWO0yYxZDPAwCYSgicIL5MDEtp9MsL193ldKBirIieA=;
        b=HCDTx8ecwUbc2ol8gBTjLRe4K8E4cB+JsjSJ3UtO9LsXI7wrz5qymz0mxiOEYP82RB
         ehJSh+X0QqylnwoAea3xeM4+h143sno7k0HcFWWsSyNKWN0GS6RUs+wTqwK3IRuLtJms
         mB2oPTouyuMxr/Afbydc1VJyrfpex3oLClgz5iP4EF6soiMMvGPoMKEusdAo0Af8eEE9
         xmwL9jY0ImNm4TVWzWrU2/PYRLBKQV2y6zStE6S/aKx3mGxBNEUXaHJWj+iqK+yP4lKr
         SBTFiyk974wYzd8AAGOIXOAhFbWEH2nZx6xwGZFFR4q5hf+1Hf4wRD2xFDbLf7MRfq9A
         22MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791239462; x=1791844262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HWO0yYxZDPAwCYSgicIL5MDEtp9MsL193ldKBirIieA=;
        b=tRWd9LjCXkFkti+Tsf/icz3sa58XezF9V+XUZCSuYGlPrZV8yHbksQlKQUIgCCXZ2d
         mtfPp1EKVJ41yLQna6R4dw/csgMFJ/jFVYskvCvWI/771Ijvz2hkDvunJv1o8Z0KGU7q
         dJGJ+CwwZTS4VeMjzwiF3om3DDeKz1Xotw1kJCKwp/rBKYUcH7ZWgO8E1G4QQwUZLydK
         pGFJl5JWGc5jcVxFgQTx0gqPDzVsCw9w8Iu2cfNLdXBN5JhLYOIK4mfRSLpt8ai2ViSt
         vXRH4sNxD6tWMQ1eqIIuvglBhItBJVPfs88ozfQMUKulblT9v/HqYUZ6oAZZqQFv1IV1
         ExQA==
X-Forwarded-Encrypted: i=1; AKwUvBxWZRNborSAtTX4HstQGNJgl78mDhZ38T3NqylDFGCANObTkNVAa0aAntFNPzUkocuDyU1Xkm+gSFQ9KRII0WUj@lists.infradead.org
X-Gm-Message-State: AFq9FYLDrYX7U1vJNxguSsfCXE08RxpVuYmF+eWDIeWAC7GAGkoAS2je
	dSE6UUzixSpEKVuLxdoXbdC3E7TtdxGgNB3WjiWCgosq8dL4Nt00ZSF395JmCWI5Sh8ybw==
X-Gm-Gg: AYBFou15gpFF23zs81GWJUMdqfiIniQoAODT3c5hET/QzLx1gT/NGRL97l2mIdwMdJr
	x6otoSQvmUMzhWgQ0n+S88pmVrgcgNQBbE5obbPQHjAYJBvRkEh8wr0tbeLd/YtORJ46V1WvvgX
	H91BC43vINcenzphjVNzIbGQdlSid0g/HzwmHUb+vIIS3wpVXZtzjYyPtr2T2WWtrH5bLPM9cUC
	IX9s02/NR68TQrIH/BFgXLpywn52fp7REXyZjK6eptQ2QUSLGjgwKFj23hh/ksL0oKtpUFc+7rf
	EfuoegBV3Ce0ynaGOO+Jk53fT6DctHO47Uh/3hyIOqweZcOgZUN9/AzW0aMkEk+HFw4vOJGiB0a
	q/t9bTv+O6bwRp2DgzB37nURPHqUm2Gp6o9X3n7JN7wKnhS+34BYM9+ngRvZOmZ/C3jDnAetbXL
	90IPQlC6OLN2HJ9TaXnSjNQknN8Q2s1GztD50VsVaTD4Dby4hIuCq0ixX3muiPZH+RTAHp
X-Received: by 2002:a17:90b:39b0:b0:3a4:c538:49c with SMTP id 98e67ed59e1d1-3a6ce846cb3mr9080240a91.50.1791239461527;
        Mon, 05 Oct 2026 15:31:01 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e5a5f05321sm13203705ad.78.2026.10.05.15.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 15:31:00 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	David Wu <david.wu@rock-chips.com>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH net-next v10 4/6] dt-bindings: net: rockchip-dwmac: document pcs-handle
Date: Tue,  6 Oct 2026 06:30:06 +0800
Message-ID: <20261005223011.1124347-5-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261005223011.1124347-1-coiaprant@gmail.com>
References: <20261005223011.1124347-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_153103_004468_121FBAEB 
X-CRM114-Status: GOOD (  11.34  )
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

The Rockchip GMAC binding needs to describe the PCS reference used by
the SGMII support added later in this series. The property will be
parsed by rk_pcs_init(), and a missing phandle fails the probe. Add it
and require it when phy-mode is "sgmii" on rockchip,rk3568-gmac, the
only SoC in this binding that has SGMII support.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../bindings/net/rockchip-dwmac.yaml           | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
index 80c252845349c..bb7540e838033 100644
--- a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
@@ -120,6 +120,12 @@ properties:
     maximum: 0x7F
     default: 0x10
 
+  pcs-handle:
+    description:
+      Specifies a reference to a node representing the PCS device
+      connected to this GMAC. Required when phy-mode is "sgmii".
+    maxItems: 1
+
   phy-supply:
     description: PHY regulator
 
@@ -159,6 +165,18 @@ allOf:
         clocks:
           minItems: 5
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3568-gmac
+        phy-mode:
+          contains:
+            const: sgmii
+    then:
+      required:
+        - pcs-handle
+
 unevaluatedProperties: false
 
 examples:
-- 
2.47.3


