Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F03C6C54F30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 06:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NufnI3WPgjJfZd6jl1u+COmUHgy2mfKMhHbcX6GCUMQ=; b=EwSLfF5Y4syG7cmMEKkyrK8Y2l
	UqcpkfUEyl+3oh/2+x3XzjG7/BpJVtbQw73nIxOsJDPSDeA79LZZ2j7NpEqhwYiddpC3uWQlZtjcs
	nkdYqWaTK9pPvXzUztkHKxRe0bWnnO5vjMkGmD6F0zxz086VfUC5FSCIgp67egM6YdniDW14NP5Ny
	qdJkXHyHUrRFQJhJHzXJIX0iP+CDnD/ds8cCcnXq0qo0yZR7VC/r2zokiPfzMuiVEQrNJZHCgY2AO
	IGSbOWwQQBLJiFTlr7Ucfxl19SH07RZh/W8IxXi30xX5Qm3DyWYG0Tmt6vUCVM0O0KRO/HutH21Es
	XJGbGmng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJnSO-00000009zlf-0Eyu;
	Tue, 27 May 2025 06:06:36 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJnQF-00000009zXm-41cK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 06:04:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1748325864; x=1779861864;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NufnI3WPgjJfZd6jl1u+COmUHgy2mfKMhHbcX6GCUMQ=;
  b=ltM5L+858ZX+lvcvIZBEuRVLnYSyJzTgYvxnEox4UfwP46jUah7ZqTuq
   Rf6i2hSNDzCjRaf9gO8cS5/PL8cFanR9cz+lFBUYRBgEE3g1X6AcI3nBu
   AcyBykL13wy3HjndBA2x3x654BlfOKpuMW3c/txPMDMBWrXaBoSTWsrmw
   BCB8Oz70YYv8En4mTHvgXaY21nKiIen1HBfmFfQFVyW5QNzzRPYME+inF
   aAt8rMACzIY/mOFKYnMlhxzfbUstUKT1dPXSF8Taj6nKDf0aif7rshUm7
   SxFEyTswCZCMEzOSYOurKg6JO5FmiZWDRCWddYTdsiweKbmcoyYjnUk18
   w==;
X-CSE-ConnectionGUID: osZUuC7PTcWKvOxGH52KIg==
X-CSE-MsgGUID: Rpe+SLBIS8qJvyp7bN4EZQ==
X-IronPort-AV: E=Sophos;i="6.15,317,1739833200"; 
   d="scan'208";a="44300048"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 27 May 2025 08:04:16 +0200
X-CheckPoint: {683555E0-2-45F3AE15-E90F7DFA}
X-MAIL-CPID: 088DBB11D3FA37DCE78AADB2B77E3D50_5
X-Control-Analysis: str=0001.0A006399.683555F5.002C,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B2CC6165768;
	Tue, 27 May 2025 08:04:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1748325851;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NufnI3WPgjJfZd6jl1u+COmUHgy2mfKMhHbcX6GCUMQ=;
	b=VTfAECrLqktw99cR2HTGHekR4QHk0I0wXLFBFRnDdcKklm5gqG1cOf16dCldPrAAPpaSiC
	+zWKRRAVkkNIVfmbkPxitrBMBfIO8SaSNTMpm258bqeglgBD5G2ohBkIeWHgzgg+dHTG5N
	Inzm2UCH1FJ51f9tpzQ4QS0ginnETY4xWRlWTKWbWYTj6waccmmDIYLJdUMpkPl8lv8Ink
	fa7LmnugIGBKLgMYPF5HzUDaKv+ISEU/GbcrHSEVM9DjeYAj76kDUTNW7FJRnXo/u3k4z3
	n/GM00MbN3loGbwUqV0k7+qurdRgVohw3i9m9D3u4CN6YDg7ASq11NS+kwkSuA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Matthias Schiffer <matthias.schiffer@tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH 1/2] dt-bindings: arm: fsl: add TQ-Systems boards MBLS1028A and MBLS1028A-IND
Date: Tue, 27 May 2025 08:03:54 +0200
Message-ID: <20250527060400.1005757-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_230424_486977_5AFCE40F 
X-CRM114-Status: UNSURE (   6.71  )
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

From: Matthias Schiffer <matthias.schiffer@tq-group.com>

Add two mainboards for the TQ-Systems TQMLS1028A SoM, based on the NXP
Layerscape LS1028A.

Signed-off-by: Matthias Schiffer <matthias.schiffer@tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index d828fbd4d988c..50b13811d55b5 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1627,6 +1627,15 @@ properties:
           - const: kontron,sl28
           - const: fsl,ls1028a
 
+      - description:
+          TQ-Systems TQMLS1028A SoM on MBLS1028A/MBLS1028A-IND board
+        items:
+          - enum:
+            - tq,ls1028a-tqmls1028a-mbls1028a
+            - tq,ls1028a-tqmls1028a-mbls1028a-ind
+          - const: tq,ls1028a-tqmls1028a
+          - const: fsl,ls1028a
+
       - description: LS1043A based Boards
         items:
           - enum:
-- 
2.43.0


