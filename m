Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9281C36014
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 09:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lRfWN6dqaLA6ESwAutyv1qie0Pf4BgHs2mwsPfQrCKY=; b=o4ylJezaT8EK8BwGFk4fLtDsWc
	qiuPsBUupFIvG2NME+9ZfDBzRAyQQjg1S3a91KcoCHOIoBhkk07fWCrpgwFrWo9qvZ1aU0vCAlpqZ
	NkQo37qMAH2PSy7zm99P2k7sRP1TXYvDfgH5R+dJJGf2QwOJnzrkpNcxkrRPLK3Td2wyhZxCC2C+1
	nkicSXubJR1rFrLhSwGTbYdWhYEgMaXU4CWmOaqb8X0QtivgWEVkX3MIz1ePHGLEeEpXRtYMMclEG
	8FxPCAXlaLhCDCsyke2XGzk2k+iGcRq5YypKFse9oxR1WBrcOaCSQTyqZTIE0RFaTWi6+rYqVr7+7
	+piXAMdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzXy9-00000002UBa-3CNx;
	Tue, 01 Apr 2025 09:31:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzXkY-00000002Rcg-01zJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 09:17:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C101144884;
	Tue,  1 Apr 2025 09:17:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15B2BC4AF0B;
	Tue,  1 Apr 2025 09:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743499057;
	bh=daJVIBM+/86CgCX2tXFh2mvwbkNwOdxzc12EaBZe6CM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=enWEW/1yRcjlV2XBsMR95Rv9PoZiqV9QAukkQM2B5Vf82OvngCOzRef3NuLe2oQ9/
	 UcXWZ5q3eGZy+Jia31n1ns+uwbytU8bAx869q8pD3ub9uQuXeX48z9hX6WbO8jPzeA
	 dU8uVVdyHtsbNPOYzkMxAhT0K9+0EVC+nZ1JlxCXg68JPpyNFii5LX6OOHVM7ySd2h
	 sf8A5hLbN0k6Dyp0ohpzG6RWDDy/MKJlBaLVfQeK2v0iPXtl1oobqR6Yt/l7KaDmiT
	 5qx3LhnjwflJxqFrAIZroz/CDFShtbBRjEMuZ20jhwOdfO90TJEmMlws8oqRnrluaV
	 NZrCMGEjDNPhA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tzXkV-001GqU-7U;
	Tue, 01 Apr 2025 10:17:35 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Janne Grunau <j@jannau.net>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mark Kettenis <mark.kettenis@xs4all.nl>
Subject: [PATCH v3 02/13] dt-bindings: pci: apple,pcie: Add t6020 compatible string
Date: Tue,  1 Apr 2025 10:17:02 +0100
Message-Id: <20250401091713.2765724-3-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250401091713.2765724-1-maz@kernel.org>
References: <20250401091713.2765724-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, alyssa@rosenzweig.io, j@jannau.net, marcan@marcan.st, sven@svenpeter.dev, bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com, manivannan.sadhasivam@linaro.org, robh@kernel.org, krzk+dt@kernel.org, mark.kettenis@xs4all.nl
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_021738_090110_35E028B4 
X-CRM114-Status: GOOD (  12.03  )
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

From: Alyssa Rosenzweig <alyssa@rosenzweig.io>

t6020 adds some register ranges compared to t8103, so requires
a new compatible as well as the new PHY registers.

Thanks to Mark and Rob for their helpful suggestions in updating
the binding.

Suggested-by: Mark Kettenis <mark.kettenis@xs4all.nl>
Suggested-by: Rob Herring <robh@kernel.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Acked-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Tested-by: Janne Grunau <j@jannau.net>
Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
[maz: added PHY registers, constraints]
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 .../devicetree/bindings/pci/apple,pcie.yaml   | 33 +++++++++++++++----
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/apple,pcie.yaml b/Documentation/devicetree/bindings/pci/apple,pcie.yaml
index c8775f9cb0713..c0852be04f6de 100644
--- a/Documentation/devicetree/bindings/pci/apple,pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/apple,pcie.yaml
@@ -17,6 +17,10 @@ description: |
   implements its root ports.  But the ATU found on most DesignWare
   PCIe host bridges is absent.
 
+  On systems derived from T602x, the PHY registers are in a region
+  separate from the port registers. In that case, there is one PHY
+  register range per port register range.
+
   All root ports share a single ECAM space, but separate GPIOs are
   used to take the PCI devices on those ports out of reset.  Therefore
   the standard "reset-gpios" and "max-link-speed" properties appear on
@@ -30,16 +34,18 @@ description: |
 
 properties:
   compatible:
-    items:
-      - enum:
-          - apple,t8103-pcie
-          - apple,t8112-pcie
-          - apple,t6000-pcie
-      - const: apple,pcie
+    oneOf:
+      - items:
+          - enum:
+              - apple,t8103-pcie
+              - apple,t8112-pcie
+              - apple,t6000-pcie
+          - const: apple,pcie
+      - const: apple,t6020-pcie
 
   reg:
     minItems: 3
-    maxItems: 6
+    maxItems: 10
 
   reg-names:
     minItems: 3
@@ -50,6 +56,10 @@ properties:
       - const: port1
       - const: port2
       - const: port3
+      - const: phy0
+      - const: phy1
+      - const: phy2
+      - const: phy3
 
   ranges:
     minItems: 2
@@ -98,6 +108,15 @@ allOf:
           maxItems: 5
         interrupts:
           maxItems: 3
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: apple,t6020-pcie
+    then:
+      properties:
+        reg-names:
+          minItems: 10
 
 examples:
   - |
-- 
2.39.2


