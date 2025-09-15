Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9127ECAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 14:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vFBUeJQ5a+uHKvs8LbRJuoDO2VW8hFCqZ+k5k7l4RLg=; b=zQ7OauXglIRAVkWpnnPfWEX/iw
	nn2GWW//swg2A+6IUGSsAnL7aY6HmbYV1I43mNO1m3R1bQ/IoLu3jYloLlY4yOfkducqpKy/GjkJZ
	1/rMv0s1F6a8vFkur0rrlTgYTLvZmffbRpdBWyRLEUB1SmYNtbjauFeqT90hSImK9QsjcEoDoQjxX
	EcoiLhtUzyBJf1gOi0YfLZpoJhQav9APKGrKSXnJaTpXRR41anxVmlpX1zA8WYDTbE8ta8375vlfk
	ZyLvwedJvKbuEe0iuqC+V4YGLjeDoQsOWdpJnnJ+V6AzuPKkWzKS0oAzVY5Ep1VMgWQLnXRfYHFqj
	JWZhNOgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyAK4-00000004jMT-3X22;
	Mon, 15 Sep 2025 14:36:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyAK3-00000004jLN-0dQP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 14:36:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 79E726022B;
	Mon, 15 Sep 2025 14:36:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC8D1C4CEFD;
	Mon, 15 Sep 2025 14:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757947010;
	bh=lWTfUooKBHxRj0AEjDVG4lEODpzAtqXZGx+VDKCy+8o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MckR8/fOICHyGpMdP7LtuXaD9m96cYfzcCmQsxryAMOPioHH0m/K+3yQ8mU0Pd/ig
	 u26n1AVBuug4htyBalPeF3YWVnwgZV1VtjUrAAZFsIJiWvSV+ZJwzx3mq0+6FRES1N
	 S5DSqI0G+tYS5cZccM0cQ2uHVv/0iXf0oH8RnEF6aFtM0q4UCtfYnv4n5Zw4WOxONQ
	 t//FFt2K3nF5lsck2ooxnXpIJ8Y6fdVoudj63DA48htOMMPRabWeWV0ioyOgKfIBmu
	 H5OiBEmpi+hHa6ZurLsNoIswEOtghhG2TQXIavS6+CIbWl0IS5vVR1OabIakSTuXHL
	 EK7CVWrF2PKYw==
From: Michael Walle <mwalle@kernel.org>
To: Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Andrew Davis <afd@ti.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH 1/3] dt-bindings: gpu: img: Add AM62P SoC specific compatible
Date: Mon, 15 Sep 2025 16:34:38 +0200
Message-Id: <20250915143440.2362812-2-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250915143440.2362812-1-mwalle@kernel.org>
References: <20250915143440.2362812-1-mwalle@kernel.org>
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

The AM62P and the J722S features the same BXS-4 GPU as the J721S2. Add a
new SoC specific compatible.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index c87d7bece0ec..a207a57c013b 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -28,6 +28,7 @@ properties:
           - const: img,img-rogue
       - items:
           - enum:
+              - ti,am62p-gpu
               - ti,j721s2-gpu
           - const: img,img-bxs-4-64
           - const: img,img-rogue
@@ -140,6 +141,7 @@ allOf:
           contains:
             enum:
               - ti,am62-gpu
+              - ti,am62p-gpu
               - ti,j721s2-gpu
     then:
       properties:
-- 
2.39.5


