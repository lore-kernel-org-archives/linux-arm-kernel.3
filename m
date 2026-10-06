Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D390CA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 16:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q02YVAiwMG2tOYv3d1XG68tLbO2rAHXBUJNR5QhKuw0=; b=MvqTMmf3mBNrjwstXUH1Y3EUYz
	RTK73TkI28GA9LmMiO3gk58ulzNRPy9tWAP0jGiDs9iQJkkiOKp7prALlep/emxbAXrSX2Ltbzza6
	WOoP5v7HcDSwRDvaaqqu+qH6KNqwGgulO1hFl2iG9K6ELTWpQlzDVVr/8g6aR/r/qDu79Kb9ausPN
	zK0E3w+lF8kZ54r4O5+zkGzi8wKF/aoP2NmccEZP5R81EvP7TZEC5wxeVFpuFbwcWw+yJIINeZrH0
	Xq1W962GWuKLMllkWZelCJHtuzNj8psxEPj2T3l262NZ9wWhqo+Atq0UHofovDvfNI8C5c8NqrYLw
	7jNr6fuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE81p-000000018Ux-0gZI;
	Tue, 06 Oct 2026 16:28:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE81m-000000018TV-25E1
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 06 Oct 2026 16:28:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Q02YVAiwMG2tOYv3d1XG68tLbO2rAHXBUJNR5QhKuw0=; b=PCoteZtFdVQYNL5YLOkKhOYTEN
	rPk6/ZNNTLdsAXuYVS7apEGMLdaDZ7HrNncbM564EnshnZMGfts+sToShJsgeU3LMPTFFXXdr+Zqf
	9ky7JbR5urPgdk7YbrWPR3puL0BPFO1Cm8ZX8T/912jA92KwUULXk0WHj6VxRDAoG4P+9IeSuN46P
	MVCTOfpj5zBsYu5kh2JE+xdvebM9M9MJIDc192wVvp/bVrGpsSR+wU5eR8tBhYs/PBy4neZ58yUni
	qTMBtHVoaF1iDSGPX+6t+Qo/hQvBzjzKKLHXSKNbYRr2GnILK1i+E9k0DSFhF7T1P7DE6hdY3bstx
	fX4yWCZw==;
Received: from mail-pz2-x01.google.com ([2607:f8b0:4864:3b::1])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xE81i-00000008rZB-0kzF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 16:28:29 +0000
Received: by mail-pz2-x01.google.com with SMTP id 41be03b00d2f7-ca8758e7e94so139564a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 09:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791304104; x=1791908904; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q02YVAiwMG2tOYv3d1XG68tLbO2rAHXBUJNR5QhKuw0=;
        b=lIor/KJi8bsyoWaCdl4UCudBddDfZ3YaBNZ7ijY1laua6K+RLEsf2rY88D0lG4QFNu
         a0VebJhYDEA/uXzwLreKEYovZaqurgOInCSkxv+8Jh5MDL8PejhOcZsRa47dHcqeTHhS
         HRI7B1ALK7oCij0OWVH8g6srbbu2eiMQHfect0/bOFBDmVEUpkGU2dQJPt+Hjxxxf1+L
         F+1EY1jUraPcUpbZLFbI/KEAW3s54Sj2MDv7bHgw7YDad9NAhE6rBJDs6Iq0jq9LNmzP
         QZfZdakSj87zHIwkR0nLLR5/ncwvP5UhiW0bWe5uuuDSB83FQgCtcK+yaTsPx+0T/P2c
         EokA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791304104; x=1791908904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q02YVAiwMG2tOYv3d1XG68tLbO2rAHXBUJNR5QhKuw0=;
        b=avVG399zFwB6cNzRV1mTvZAsdMnLQIWq8q9uTrUKjokdd6JX3nNt8lf8Aao9lvnfFb
         akeBtJ1ACKPaI2EwYe436g5tOocGOYJvrprXnE/tJS5FcaZgRTpWZ3PkpW4ZUvB5BMja
         11G4PtZy9LkMrOifm+1DR3Nny+K+9/12ovo7L3vASydz5qx5nwGXTYMFdGEwdVcu/zgD
         kB9bcyPy4X1Kg/wt/GIzHEsYSjKanZoOw81bMf1dj2yyz4sNniZizUuAkMI0YLOBRLGS
         VvVwOPDfT9/bZSUJcoDC1ZooV8Q1CmzkbE9y6ruUamcEKrBgIjwEqriuhi76YFywek9W
         wkMg==
X-Forwarded-Encrypted: i=1; AKwUvBxFqF7V3TlsohoCGjsAGR3wSwrWGbH9o2Mkk9qXQ1FnI7QdMsbXsPOuj/JSAw/qTp5ZEc4rioxaUZ4vYnkXa8OB@lists.infradead.org
X-Gm-Message-State: AFuF++lNMVsmNtaoQ9NsgQJTbUI9lozvoaP/v8A8blyw24/r2Dpa4wV7
	z4tcYXTFL9Qlugy47nL388Isf9Z+vQ14TJm8yTzfpN4+d/2J3YUAjnq/
X-Gm-Gg: AYBFou3ANYGsR7C3cSvJ/Ol5HldF26i2C9l7ZFtnWYmXVNyuTi5MroNmwLriy8ld6jX
	jv8HxiJ5EUp8aR1aasoUTmdH8d005n6PzYQjSJcjyaY4CfX3nq9T7/cp16ELBclxSIvJMo5eKtp
	GO6WR6/9jWutbBcgNQC8PmAvZ1ezbWreEcx5J2NUR/hzR3wgiqwYF0HTqbSD/7TYFbi3jsqSpSN
	anEWb48occ1qYCbiOIfA91qxKQgFPesWVgmwErN500EN3S/dkRoUwpzH6h5ONiQ0dq05fJD8E+b
	WIMN3i3zwIYp7QasvEF55YtzufjaOLEjQFBfpdbi5g7NX6U7ZKr9bfpFvTnzlZQC3Tqsqg450+r
	OGlCnE3iikj9D6jnuDNSynnIb9iq9EtEH4bDMzrpp8546s4jmvAmsCUP6E6QBjNVYzp763Imc2m
	bL4CgtwdtFZsLn0HijAQX1lPC/PRmMzNq1CR/dZqqZtWBYK+mLAJsNaNg+Bypn91iTz9G/
X-Received: by 2002:aa7:88c1:0:b0:88d:8074:1a8f with SMTP id d2e1a72fcca58-890ddd021d9mr1195882b3a.7.1791304103604;
        Tue, 06 Oct 2026 09:28:23 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89188a0d603sm259898b3a.19.2026.10.06.09.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 09:28:22 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v13 1/2] dt-bindings: phy: rockchip: naneng-combphy: add rockchip,sgmii-mac-sel property
Date: Wed,  7 Oct 2026 00:28:05 +0800
Message-ID: <20261006162807.2843858-2-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162807.2843858-1-coiaprant@gmail.com>
References: <20261006162807.2843858-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_172826_354606_859FFACB 
X-CRM114-Status: GOOD (  16.33  )
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

On RK3568, the SGMII interface can be routed to either GMAC0 or
GMAC1 via the pipe_sgmii_mac_sel bit in the pipe GRF registers.

Add the optional "rockchip,sgmii-mac-sel" property to allow the
device tree to select which GMAC controller is used for SGMII.

The property takes a value of 0 (GMAC0) or 1 (GMAC1). The hardware
reset value is 1 (GMAC1), but this can be overridden by setting the
property to 0 for boards where SGMII is connected to GMAC0.

If this property is absent, the driver leaves the routing unchanged.

This is necessary for boards such as the Ariaboard Photonicat, where
the SGMII interface is connected to GMAC0 and needs to be explicitly
configured.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../bindings/phy/phy-rockchip-naneng-combphy.yaml   | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
index 379b08bd9e97a..442a1df193ad2 100644
--- a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
+++ b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
@@ -80,6 +80,15 @@ properties:
     description:
       Some additional pipe settings are accessed through GRF regs.
 
+  rockchip,sgmii-mac-sel:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+    description:
+      Select gmac0 or gmac1 to be used as SGMII controller.
+      Set this to 0 to route SGMII to GMAC0.
+      Set this to 1 to route SGMII to GMAC1.
+      If this property is absent, the driver leaves the routing unchanged.
+
   "#phy-cells":
     const: 1
 
@@ -105,6 +114,10 @@ allOf:
           maxItems: 1
         reset-names:
           maxItems: 1
+        rockchip,sgmii-mac-sel: true
+    else:
+      properties:
+        rockchip,sgmii-mac-sel: false
   - if:
       properties:
         compatible:
-- 
2.47.3


