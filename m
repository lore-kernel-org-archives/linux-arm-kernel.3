Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B78F6CEB2CC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Nov 2025 12:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zovnOE292PEQj4KB9jsZe/YvWFt1u7BUHcsifAqQZmA=; b=eV/+Bk/nKa1UcpWhPWyr9Ysyo9
	p9qGz5EOggBPHQtp56/unUN4wYptbcrAV2LqpnZUY+arLlb/+42CZEHcH+zGwSPVrRp5+HyrEPaiq
	Lx5TYlLeUMBruBIe3taRoiypA0M0lgspm4Goj/kYCSCeHxMDxELLULD0Va8HTZQTL7RA9g9oC0yGX
	gO3pLESrQjkaNOO4o2MIesckOiiwwFuPw0hFLjc53U5sjd+M6kQgPLjOSxdVY8K9V9ZjTmTCFshux
	2U2o69yqZiqLUsmdTNWxQ3WM1+tHIfYaNdK+syHazV+2n0Cqi4Rulu6MqeipSfdysLUiD/6UVt1yI
	PpsFt4oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKFHX-0000000DlVh-48cV;
	Sat, 15 Nov 2025 12:21:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKFHV-0000000DlVK-3ND6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Nov 2025 12:21:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 24D94432EF;
	Sat, 15 Nov 2025 12:21:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 683ABC16AAE;
	Sat, 15 Nov 2025 12:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763209289;
	bh=CvW3RPjAQHRDOfHqugrlxCPi56fwvh2F4UBJhuXf3jY=;
	h=From:To:Cc:Subject:Date:From;
	b=qp5p5xX7ENbuB1mPVuIYCFnQYSYEPZ5tpWjz30Y0M31mP4b20X/sC9/9ZCzECXwMN
	 LDbhsstItv8lHknHCJvXhUcCiRgI2oX4W0rPhrIBFQo/6FWKmqmjRUzhHStlgSZTBn
	 NFIxnDFkB4UJsXn3jdPl/pYr3gvX/tk02FY4t8j8NiGRCvhAlWePlAG2r+NYvB7guk
	 FzxN7BQbuBeCnKcdDQPItEO9PCTqX+o0od9GC6xr2FFu080JYl86KdwFmMl1xVpms6
	 3+C9e4H+4hzDhu3ibGRicQ/fsSc4yLa7tEP36hiAXFcBT6bkudn2Z2RzxhBUdHLDnE
	 OjUplpuBVEnZA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jyri Sarha <jyri.sarha@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Harini Katakam <harini.katakam@amd.com>,
	Shyam Pandey <radhey.shyam.pandey@amd.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mmc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 1/3] dt-bindings: display/ti: Simplify dma-coherent property
Date: Sat, 15 Nov 2025 13:21:21 +0100
Message-ID: <20251115122120.35315-4-krzk@kernel.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251115_042129_863959_8864BB16 
X-CRM114-Status: GOOD (  10.22  )
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

Common boolean properties need to be only allowed in the binding
(":true"), because their type is already defined by core DT schema.
Simplify dma-coherent property to match common syntax.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml | 3 +--
 Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
index 361e9cae6896..38fcee91211e 100644
--- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
+++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
@@ -84,8 +84,7 @@ properties:
     maxItems: 1
     description: phandle to the associated power domain
 
-  dma-coherent:
-    type: boolean
+  dma-coherent: true
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
diff --git a/Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml
index fad7cba58d39..65ae8a1c3998 100644
--- a/Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml
+++ b/Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml
@@ -103,8 +103,7 @@ properties:
     maxItems: 1
     description: phandle to the associated power domain
 
-  dma-coherent:
-    type: boolean
+  dma-coherent: true
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
-- 
2.48.1


