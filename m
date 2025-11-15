Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64447CEB2CD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Nov 2025 12:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kgvhkHFBBzvKPJg9dLwHvj+UDOIJqagbfyxczfMeyuA=; b=v3HTmbg60VsV089Vn3XcZS9MNg
	zEkJb777ckMGEm+2kHiLn0xQslECpgOzYBONi+zO4DO7yUG3gOjcCJBu8U56FOODhp9xtO9vgOCFT
	mLByXdKeFpe4lB8b4ojnPxti2r/U9qJwdRTc83HLt9UwY7SNyYwN1eu2/88t+LzyHupVwsd0ZSMrr
	KnkuNG6tw677yWo0ZFLJVSIjbz8Krc3UjbMaodiIxwQUyAjlVl6M3EXqk0h1rszgQxgIP4qCluh4f
	hpQ9pkSa0msNCzzzzmvZzqF29qIkxAHyUWWaK8scTBMHIYIXWUX10OHSV/+roeMnMjrQp7U33Ib+K
	4gmxAUXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKFHc-0000000DlWU-2HqX;
	Sat, 15 Nov 2025 12:21:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKFHb-0000000DlWD-2mYX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Nov 2025 12:21:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6F44560052;
	Sat, 15 Nov 2025 12:21:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72599C4CEF5;
	Sat, 15 Nov 2025 12:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763209294;
	bh=avO0zpLxyi3tvTmbM/WVmfIlk/427UKM8doZxyoj6Cg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K1+3VldCGa52eZ/Zo9eHfml5HhFLEVqgR3n9XtEeu6QAjh3Am5hDmX4t+djYzeiHu
	 mzDNoXpTh//8eVqq5dqIzbJLEwXXSmgiOtoQnANHt9m37XXdg5dcC0hqB298vmobjJ
	 cXsizUghYcXIBNDtZ0WuQbjkybj3P9RGym/UcjQNJVbjzX5IngWDGIeOKYfaDUwwzT
	 vOQ1gzwm66U/NvQDkl7Vx9oa8mUdcd3mROhtQXtoyjTZYBPfqQietdG2Q0oPMwlH2h
	 wMH2knPzRBeTeKMpA50kGQDVPJR4c790AYNKlopkmkSaBWBMcjSwMES5Z6uV/YS2B8
	 6CyS+nXy2LFqg==
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
Subject: [PATCH 2/3] dt-bindings: dma: xilinx: Simplify dma-coherent property
Date: Sat, 15 Nov 2025 13:21:22 +0100
Message-ID: <20251115122120.35315-5-krzk@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251115122120.35315-4-krzk@kernel.org>
References: <20251115122120.35315-4-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
 .../devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.yaml    | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.yaml b/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.yaml
index b5399c65a731..2da86037ad79 100644
--- a/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.yaml
+++ b/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.yaml
@@ -59,8 +59,7 @@ properties:
   power-domains:
     maxItems: 1
 
-  dma-coherent:
-    description: present if dma operations are coherent
+  dma-coherent: true
 
 required:
   - "#dma-cells"
-- 
2.48.1


