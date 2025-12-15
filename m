Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CECB7D5B86D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 21:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5PoLo3tc9C8m5tlXsJWjxhK5FGqNRfAYTmR5FxKrUY4=; b=Q3ErS6r6NThs4F/1Qs12rmZ+J/
	ff6td8ISCTMnkfbAZwpQM8kGXn17DDNejsb6ZdFSDQxyoLclM7/iNzgXMh2cBT3mRV/N+gE6wVoIM
	3sD5esERmRww+HvhKjiQy/6A91wswbuwV7T7bi6CSQi5QxGRkiIR21Mkztsfy8ZjVIaZXCzclrbiJ
	VNjIhJAX+PvlxDjdPPMUaSoILVKMmQPqFYGywy8rV3sJ7QLVowj95XdlYhd8BvgIIryaB24Y9Nn7l
	wEAC260uzhK2McntnABVsBEi7Zu6JERHShWU6VaJXijCxW3uFMEz/jJPYtSaho01kcqshwZJhyMTb
	eArY1l7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVG6d-00000004I3p-0w9l;
	Mon, 15 Dec 2025 21:27:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVG6c-00000004I3g-2fJH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 21:27:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 166A16018A;
	Mon, 15 Dec 2025 21:27:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F268C4CEF5;
	Mon, 15 Dec 2025 21:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765834065;
	bh=r6glPJkGDRnE9QV9s0gHGEsKWDrDjC1sCQkD22i2y8Q=;
	h=From:To:Cc:Subject:Date:From;
	b=csoQvDWI3ZDPGBSuHtp9FdEBk/htR+inuruaN0aSZRRB92WGewLRzoLVisoHSyWsF
	 vsbOVfCx/dpec7vtYK7bFvO/ECr03cXSIhxy9p/dh/6TRIq2A8FZXBzpsJkeYFO4ep
	 X9gXOhXXGUOchXNlscGNc9KgLuvU2+jFyIg3ktZ5vONkWEtjP0bklJqI/YCatWGQKn
	 rpAMCwPayvG1z3uZO1f6g2Ymlm1HNY2PFxuS4FLzs0qpvYsP/VmY6FrIIa367m5fYI
	 CWTmVV9a/V2+58dUE7LT0tW/SPWi3DWeGd39wuY3IN8jvVbblvmraf8R71eqtjTiLw
	 AzEuZ8yhS360g==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Saenz Julienne <nsaenz@kernel.org>
Cc: Ray Jui <ray.jui@broadcom.com>,
	Scott Branden <scott.branden@broadcom.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: mmc: brcm,iproc-sdhci: Allow "dma-coherent" and "iommus" properties
Date: Mon, 15 Dec 2025 15:27:36 -0600
Message-ID: <20251215212736.3321550-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
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

The Broadcom iProc SDHCI controller is DMA coherent and/or behind an IOMMU
on some Broadcom SoCs, so allow the dma-coherent and iommus properties.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/mmc/brcm,iproc-sdhci.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/brcm,iproc-sdhci.yaml b/Documentation/devicetree/bindings/mmc/brcm,iproc-sdhci.yaml
index 2f63f2cdeb71..65bb2f66f8cf 100644
--- a/Documentation/devicetree/bindings/mmc/brcm,iproc-sdhci.yaml
+++ b/Documentation/devicetree/bindings/mmc/brcm,iproc-sdhci.yaml
@@ -26,9 +26,14 @@ properties:
   reg:
     minItems: 1
 
+  dma-coherent: true
+
   interrupts:
     maxItems: 1
 
+  iommus:
+    maxItems: 1
+
   clocks:
     maxItems: 1
     description:
-- 
2.51.0


