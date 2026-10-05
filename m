Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 783C9CA5FF5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 23:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7KYnx5M9SIckzrzxm/OntzsZgVfGL+NHQqwQMkKwNaA=; b=p1JfvpC8aNvtXCTZDgnRTUnvEZ
	2ZWCxR6H4c9ZtXlpwLUg4KDSUvGRTKRLGSFZ7OH/fdhPcWFyjVR2ivVgj839gt65//y10VxWGkCE0
	JJrp2X6yuCcFhdJp+Szn3j5C18m0f7HRMuoouhDIuw2sAkW3OFIbf5d/77w/rOG0zXdij6WZw99z/
	yWGHR6Vew6fogabu+NIKGBhAuTXvhp5+X95josWOB1splhKbyS3Wo7v7VvMSV8tzLlJqWugmfxbuu
	tD4mrBp5yC6qrMxRHbqZze4HYrhDrXG6anrswkrMFZRqcz/j3oLy21hzOcU4TYdhmrpowH0lvYwId
	8cMhpNiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDrf9-0000000HJ6Q-2x75;
	Mon, 05 Oct 2026 23:00:03 +0000
Received: from mail-pj2-x08.google.com ([2607:f8b0:4864:39::8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDrf7-0000000HJ4g-0sPV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 23:00:02 +0000
Received: by mail-pj2-x08.google.com with SMTP id 98e67ed59e1d1-398b9f722abso1220659a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 16:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791241200; x=1791846000; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7KYnx5M9SIckzrzxm/OntzsZgVfGL+NHQqwQMkKwNaA=;
        b=FBb/PgLBAf28+Rdhc49+zKz0laE6iJW669mAbgyZDxaAT1xuTWWeQ+09xhBJQ+FEvc
         RfbzA6vJDrhHOoSS6LLHayCCOetNX7HHikMsoCaLJef21ek12oH7IQVhEVIWy3GEz+lq
         35hU7O60Q6isl8EDgh9H9vUxwgvoGMP7zLT3C/ar5CNMXBWYH6VyiAkZyyfue1r+7Bhg
         lNTZbfs7mxgsFcc4iv8ywxTwFJ9pFnsU6aPaC/kb7tCw/nluARI5fOkJEdAXEoNCzD2A
         iSPPsYyWQxeNBdPTdNK/JmsxnflYrGMGd2lwDCd26vkD5j0qranoFFnaaMgfs+hUkPiJ
         z+Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791241200; x=1791846000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7KYnx5M9SIckzrzxm/OntzsZgVfGL+NHQqwQMkKwNaA=;
        b=EisWjXs9U+QuzHogg/PBZZxZPLr3+87Tu+gw71/xeq7XWlMwx0ryZKPGCMFTFvvy94
         BARPi5FwkcvIGx17ySZmceGEdEcK8yLanqBouttZSzZ5EbNSC26sfKgaw1EeZW5GsWYk
         TuMI1Pl77gexwhhgmVF4RU7ce5Xqfm3cWtHJgHBynNRXIopXyQKtLtSetnN1rXi7+9pE
         +6MHB96cEIsbd+cwOgySDS5Pu0J4kyhh7ej+MXfwZdCsjsu6WeIRxyHLM/3G4FZ8MM/x
         YW0eVy3MJJfEWT/ABXQ6IPWCYD3EdpYLj/PCFdVTWMzL8gC1QoWnw3+hdxQzGwb2ADbA
         4ibA==
X-Forwarded-Encrypted: i=1; AKwUvBz+uP7uWwrx5bQJtLJfyNtwMoO9sY2ksb1pw1Hk/we6a5004jRixwR8wh60DyaMZxsNQpxI8J5igQOURG7Q8usF@lists.infradead.org
X-Gm-Message-State: AFuF++l9A6dNdNeHZZUNYHvZRKHMrOhrk8slUwc7y0lcvlUNnAE2BiUz
	l6X6hiJdTfpl1S8iNf27RCSFiu2A3lWkfIlX0TlPoLzcH2w+LyfIJWUS
X-Gm-Gg: AYBFou2f4nTrbtmeFbEdHTuX+oaQjtGPdKEHhHbZaCT2IuQy6Gkeg6WJSsiH4R0GPhO
	OR3S9kQzhbrEVCltZQ/wXqxPyljnmqXTLaa6XTMwmd/r1+o8Ev/qzsofijytYt2Hp8KzkPnEwIu
	WBR4bceg/j3jyW3w3dJa4jbKJp1lU6C8U1YUx+Ni/4MeYDVum9tYRBrsLU1vOl7xbHKXMh5TsyP
	6tmO1ybuBJfDPDzGHEKPxy2ARxLm3qr0okPJYsM+91H4axz2/wB3+ZLhHAxdZDw9pIySCyekyI1
	94V5ntz362SY2eOQMcL1RhdnZfnrDyAhyYFfeHR/3rGy7jkPZ2doN8pATM20enGj/SlqBVHqf32
	DfZuuaANTiUzA8049aAqnBb8tHxou7BZ7t1gjND+0AFwCGkOrUPByLnhRbjW2PB8ZqYUwpJyAuk
	6/ab0s9qFNqorhVlj5qWwU/D+XzmUGomozvs5jySvUUHKDjfIFfjgrH33le3ysx4OlIm/x
X-Received: by 2002:a05:6a00:4fc6:b0:886:9078:546 with SMTP id d2e1a72fcca58-88af4b4804emr12417342b3a.26.1791241200320;
        Mon, 05 Oct 2026 16:00:00 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0b8f5b79sm4183327b3a.15.2026.10.05.15.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 15:59:59 -0700 (PDT)
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
Subject: [PATCH v11 1/2] dt-bindings: phy: rockchip: naneng-combphy: add rockchip,sgmii-mac-sel property
Date: Tue,  6 Oct 2026 06:59:43 +0800
Message-ID: <20261005225944.1171574-2-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261005225944.1171574-1-coiaprant@gmail.com>
References: <20261005225944.1171574-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_160001_265122_246D77C9 
X-CRM114-Status: GOOD (  13.57  )
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

This is necessary for boards such as the Ariaboard Photonicat, where
the SGMII interface is connected to GMAC0 and needs to be explicitly
configured.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../bindings/phy/phy-rockchip-naneng-combphy.yaml    | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
index 379b08bd9e97a..2f72b83bdd6a9 100644
--- a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
+++ b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
@@ -80,6 +80,14 @@ properties:
     description:
       Some additional pipe settings are accessed through GRF regs.
 
+  rockchip,sgmii-mac-sel:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+    description:
+      Select gmac0 or gmac1 to be used as SGMII controller.
+      The hardware reset value is GMAC1 (1). Set this to 0 to route
+      SGMII to GMAC0.
+
   "#phy-cells":
     const: 1
 
@@ -105,6 +113,10 @@ allOf:
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


