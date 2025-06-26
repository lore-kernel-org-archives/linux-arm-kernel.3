Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13153C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 19:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FO1qfEgYAlNfhOuYkQiapJgLxcPvgFo996Ipq+Jhiic=; b=KnYuB2r8l6Hby7rGQLiEjt6l5K
	RHDDlvVIix5ugl5JPcvtYqD00l5/MgRqxDSuPpi3DYFHifpgT6zhBSvLVFrXGwZEhdQ5BqHZ3N2VZ
	WHFzgvYK9gNqMIq3isOKhr4W+vew//rIkMzyCD+jD2H0OnOuTtRjz6goGahpFndKMS0+iouZaTeTL
	FBqGTTwKAnIpKOEHeeQ+Zh46i5cb43jMyX1e2eqwDOzWFAVhcb2sfueNWPy+JyWzvsUna/vrY996c
	FB9UXVwgp62XfcLdbz3MTI0s+uG3ZkLMtXfP0PcsXhGrYDmn9izJsD3iNztKU9GOwhm75C+l5qkv0
	jH7i95kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUsDx-0000000CZA1-3iWn;
	Thu, 26 Jun 2025 19:25:29 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUs9Z-0000000CYdc-3oKx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 19:20:59 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id A711D2600B;
	Thu, 26 Jun 2025 21:20:56 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oCsJiwgKFbxM; Thu, 26 Jun 2025 21:20:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1750965656; bh=NWDPKseR7FgqJe1BUa7IKDcIuriaLO9oc++4NoGT7So=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=LufkMeHJflu/2/hw6zQgWML1OwQT3aV93y1CJyVkN0xr8SlPhI1BueFfFavVqRMLl
	 kql4TcXR0IT+00S+pg/ffp+NlKzPs3MHdQW2z/maueuhEonk8vSF95O55s0xUOCpwb
	 TQ98HFTy5N1tad/phEppHUnCrOfarzsTybh6OSwrd9Bre3im2VGRDbCdHCk2kkQilj
	 3/8Ebfu06NP/Sm+nXAePoDOKpZ7HcCKIG9qs/gVjRVRtgtR+R+8PMgH47XkAifbGO6
	 TkATHF5Q2rp83O4pPhEzIoGt6B+WKROMEoCu+cHZ0lhUPxylADl9X1tLh5gP395/09
	 a+8QRrrOH5ViQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 27 Jun 2025 00:50:28 +0530
Subject: [PATCH v3 1/3] dt-bindings: display: samsung,exynos7-decon: add
 properties for iommus and ports
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-exynosdrm-decon-v3-1-5b456f88cfea@disroot.org>
References: <20250627-exynosdrm-decon-v3-0-5b456f88cfea@disroot.org>
In-Reply-To: <20250627-exynosdrm-decon-v3-0-5b456f88cfea@disroot.org>
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Ajay Kumar <ajaykumar.rs@samsung.com>, Akshu Agrawal <akshua@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750965633; l=1210;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=NWDPKseR7FgqJe1BUa7IKDcIuriaLO9oc++4NoGT7So=;
 b=m+aG9N+L2Gn97HTnVn7EGvna1RTNUGO5iN00NlXhBtqiDuUyW3bfmzBBGQ3fbayDX3yMBnGjK
 unsnSIaDQQDCHNl3dSJ3MC4Dc7iKGm+P7/kjxGc0dUVLCuFxpJXC7LF
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_122058_079936_B0F17A6F 
X-CRM114-Status: UNSURE (   9.51  )
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

Similar to FIMD and Exynos5433's DECON, the Exynos7 DECON hardware:
- May optionally require an IOMMU to initialize a display region.
- May require a port connection to another block, say an MIC or a DSI
  master.

Document these bindings in the devicetree schema.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 .../bindings/display/samsung/samsung,exynos7-decon.yaml           | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml b/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml
index 53916e4c95d8c0369138941a556c23f5d42fbd39..1e9500c86590d555cfa6f04790e2b64da291b78b 100644
--- a/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml
+++ b/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml
@@ -80,6 +80,14 @@ properties:
       - const: vsync
       - const: lcd_sys
 
+  iommus:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description:
+      Contains a port which is connected to mic or dsim node.
+
   power-domains:
     maxItems: 1
 

-- 
2.49.0


