Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA2BE6F08B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 12:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S++huAmEAkUClmPwncwKruZGwhblkTqjmQ+PX3zDkac=; b=VJRXmKNR2doi4XE0llgvpGCaNL
	yN+qB5uBta7H3dDRmfmmCWTK91anoRyqUvBzEdvXlBH93WWqF84AZ7C982j35CeTi7GTwQAaoIV4b
	j2V148eiflE3ur8fSy3LvcSYb5dFtjyOoT/PP8K5YZBnoqE4Q0sZNKV4eNuHd3+4YjxlbFI3oCM3t
	3fXa5+ImTx12ycSJtQ0Mrfm93vgkKJy6YVOEFzwXX5ch7TI01mfV7kwWg4/u5xzohU/7rnEuEyv2E
	nzjcnP93FAPBOgVKW5REfY1mNQI3zjCMlDzUq0kYerbtQ/LJ9NNzCuGWcEeJV7Js2cNTjrsjWzXVE
	mArwWaHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY1np-0000000FV1Y-2oHa;
	Tue, 23 Dec 2025 12:47:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY1nn-0000000FV0d-3A30
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 12:47:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 346BD60139;
	Tue, 23 Dec 2025 12:47:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E2EDC116C6;
	Tue, 23 Dec 2025 12:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766494066;
	bh=2MjDtfXLypEJRTDTl8IzvcRwXY4LSxBOkoiWuhZLK/c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u/xMO7Nw3t3IKgf7oRNo8bj7RH9qndcM/dAQAGbmZiPkooJ0K4tsMdl+JnfF1FmoU
	 px3VoHsX5JNFtyIcOvePmF15TGIUSD90DN9EQ0sdmmq345AS69CX+KI7FEz6FEpG3q
	 zNIDJKg9jWU7X/ArBmIuFsB1wZs6wNeA7R5p1p7ykjTaKei7TLSNn/b4iR8wb3W/wj
	 fqc6ImWdPssVqoUjrok/PQ88iquzXfa/AERl89HenBCD7OVvAWG44AUOQIOel+BsEW
	 AmV5Hspqhp3BgCCdpmE/mQikQwBQALq2sq4FSS5ccQ0uZt64MsBiJyWJZjcwWoyT2j
	 D8g5SnmSMLvJA==
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
	Andrew Davis <afd@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Randolph Sapp <rs@ti.com>
Cc: linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Michael Walle <mwalle@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/4] dt-bindings: gpu: img: Add AM62P SoC specific compatible
Date: Tue, 23 Dec 2025 13:47:13 +0100
Message-ID: <20251223124729.2482877-2-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251223124729.2482877-1-mwalle@kernel.org>
References: <20251223124729.2482877-1-mwalle@kernel.org>
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
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index 86ef68985317..a1f54dbae3f3 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -40,6 +40,7 @@ properties:
           - const: img,img-rogue
       - items:
           - enum:
+              - ti,am62p-gpu
               - ti,j721s2-gpu
           - const: img,img-bxs-4-64
           - const: img,img-rogue
@@ -100,6 +101,7 @@ allOf:
           contains:
             enum:
               - ti,am62-gpu
+              - ti,am62p-gpu
               - ti,j721s2-gpu
     then:
       properties:
-- 
2.47.3


