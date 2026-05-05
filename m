Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C5DACD3440
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 13:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LcXHvuGC0iwrQsmRJOOgeJ6d287EM9qsAugAX60SCrQ=; b=dcajhkkjgMuhFtGZma8umJTWcQ
	/1qL+Dig/HCqdRcyFqA0WGqPsC2rFnhkYIwTiDewAWNZpFqqUQRC/+/927INxpu6yHQSPo7Pi1AVI
	Triu689bDQziOPI+K9bi9bahjV3kdil6lPrRwL5X0Nl1WrfeX1QLAGwFO51RYisBeb8mXR2OsidVZ
	lHFfsVxgF9n9sR/kQrmEkd9hmjrUwe/BjSjqsd6zbvj1ZrrYHzPi/NI+yz4v69q5kwYdXeg0xNtA/
	G+qMIzyB9eWYCaUtuyP5E6LJ+mVfXJ03UttWEe86WgIX6uLToBUr5cqIgfCNcGR25rUxtdPjdblMx
	Igd9VMgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKG8T-0000000GNZC-1nnn;
	Tue, 05 May 2026 13:48:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKG8M-0000000GNS1-313J
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 13:48:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 91213445A7;
	Tue,  5 May 2026 13:48:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 511D1C2BCC9;
	Tue,  5 May 2026 13:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777988901;
	bh=ZsY5XFzqNVQiSeNyF6uBu+6Xjl7uvw0cAdRVeaRm5ko=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rPhIC7V5uSFfU6H3ewavI8bj7W4vnj0Qa9g0HpjN7D3qCd6ayeQIl0i0NenzYx2zx
	 t8btSZtPMK39vZd5C5TfHwt68gRynqfUHkE3+FLvn8cteRg2kb85Z7j9VNSEMP5vsD
	 oYVk/es+nrVCQ1WGuHUXfhdfPF2FsdG4DPEPz725r919LpeSPUjSzrSSaLd5dHjr46
	 i4KBu+okDn2nN1y6rm9URDfSLU6mdZiX8l4O81UvexScwayCkX4jI6RGvKtzKKO6dn
	 MxVb7JWIiLVt+PVkBCeDYIkmQyD4wKQxC+cQur3uaZYjYBs7005rbval/0KM3/Pv0C
	 VlWaENvCdpJqg==
Received: by wens.tw (Postfix, from userid 1000)
	id 3D8735FF5E; Tue, 05 May 2026 21:48:19 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] dt-bindings: media: sun4i-a10-video-engine: Fix SRAM count for H6
Date: Tue,  5 May 2026 21:48:06 +0800
Message-ID: <20260505134812.408316-3-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260505134812.408316-1-wens@kernel.org>
References: <20260505134812.408316-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_064822_777645_999EA8DD 
X-CRM114-Status: GOOD (  14.46  )
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

On the H6, the SRAM C region includes an alias of part of the VE SRAM
used by the video engine. This region should also be claimed so that no
access happens through the alias window.

Add a second SRAM region phandle to the video engine for the H6.

Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 .../allwinner,sun4i-a10-video-engine.yaml     | 21 ++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
index 932043d7f0cc..818d815d4732 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
@@ -48,11 +48,15 @@ properties:
 
   allwinner,sram:
     $ref: /schemas/types.yaml#/definitions/phandle-array
+    minItems: 1
     items:
       - items:
           - description: phandle to SRAM
           - description: register value for device
-    description: Phandle to the device SRAM
+      - items:
+          - description: phandle to SRAM alias
+          - description: register value for device
+    description: Phandle to the device SRAM(s)
 
   iommus:
     minItems: 1
@@ -101,6 +105,21 @@ allOf:
         iommus:
           maxItems: 1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - allwinner,sun50i-h6-video-engine
+    then:
+      properties:
+        allwinner,sram:
+          minItems: 2
+    else:
+      properties:
+        allwinner,sram:
+          maxItems: 1
+
 additionalProperties: false
 
 examples:
-- 
2.47.3


