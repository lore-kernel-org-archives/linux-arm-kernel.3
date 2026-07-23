Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E64AC531CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 09:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aNn9to8BGMc2D1UguBTJNMsLB1vfj4Mi248eeCFZJW8=; b=O95hUuuTc93121zgg4DwGe0hjU
	JhG5W9LcxwE86i1Yub9R7seZbx07oRaY/c9o4JkHE8OEHBAi49/IDRrXDWeGXnjvcczf8TUgFJ2OW
	qlQYI3FU76OywwXie50qyCI2VAW2qyOQLXLj81SVTjMpezWXIcwIXQOkOdPo5oNaP6KrAjZ2ZX9t8
	5HJJ4iLEfcjfjLNGn2usekVrNAkfUBGc1+68ldU6Z4WLV/TGZ5flRYbGFN+9JQ12P5Cfgklg+rL3r
	8wKYIUpGD1LIi+WWSeDw8396LuAsfNr50f750sCL00+m1M2KtMeX/WOT87tgGFPuY00wrAVe+QGdJ
	01OiVkZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmpt1-0000000DuB8-4BFv;
	Thu, 23 Jul 2026 09:38:40 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmpso-0000000Dtq1-3nym
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 09:38:34 +0000
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 2E0BB1FB78;
	Thu, 23 Jul 2026 11:38:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1784799502;
	bh=aNn9to8BGMc2D1UguBTJNMsLB1vfj4Mi248eeCFZJW8=; h=From:To:Subject;
	b=heYnw1LpWwMjrkh1Rrxe3ZifWjH56zUGbOMkMOPkpRRsRBkAdba3zbWQhfAzCljmV
	 Flzyz0xwfNlbbRxZPVGpSMAX+U7MfF7s2LJxcjieJ9pWYJZg8Npp7I+FuRsMjpOWv/
	 R6Lau7GKPLmGlANiV1V29pbotqAvjfmlTLfSpK/OMBjwsBnn2n7SlcZ1oxz9bqqiJO
	 801+ASwSPdXjw2GBp9ZDEe1rYxqFXM2m+86yqIuRM+f8+HvegCtyRwYf7dCTBcnpcN
	 em2/hKrPib4GDQyQEcPzMA1k1cuYgLxgVAMZ9GAHfuVzeAr7UAAiGh9UPL8ZqogG5T
	 iSCv81GQnCuLg==
From: Francesco Dolcini <francesco@dolcini.it>
To: Marek Vasut <marex@denx.de>,
	Stefan Agner <stefan@agner.ch>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/4] dt-bindings: lcdif: Add endpoint bus-width property
Date: Thu, 23 Jul 2026 11:38:08 +0200
Message-ID: <20260723093813.180089-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260723093813.180089-1-francesco@dolcini.it>
References: <20260723093813.180089-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_023827_125494_8DB81A47 
X-CRM114-Status: UNSURE (   7.55  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

The DPI output of the LCD interface can be configured with a bus width
of 16, 18, or 24 bits. Introduce a bus-width property to the output
endpoint, specifying the number of parallel RGB bits connected.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
v2: use the common bus-width property instead of the legacy interface-pix-fmt
---
 Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
index 2dd0411ec651..6931f0ae3829 100644
--- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
+++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
@@ -71,6 +71,15 @@ properties:
     $ref: /schemas/graph.yaml#/properties/port
     description: The LCDIF output port
 
+    properties:
+      endpoint:
+        $ref: /schemas/graph.yaml#/$defs/endpoint-base
+        unevaluatedProperties: false
+
+        properties:
+          bus-width:
+            enum: [ 16, 18, 24 ]
+
   display:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: phandle to display panel
-- 
2.47.3


