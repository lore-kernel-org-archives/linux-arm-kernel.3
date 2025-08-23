Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D798BCA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 16:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zHPh7xCnVM47sXQdJTDYkuDRjNie8MMsKSqNC/Jjzqc=; b=dsR/I4drvpiqQwUAw6OCRVtPqh
	EK9iIpjpkagkKNnfrlm2wMAcx2XpvHrHwgyzI2tTiajDMFkBvgoCNo/o6RpXSrR4NNKl0xwcuKXUf
	DfCziwqOzcO8tkrd0nvkrQoGLbohCgJKPPxyUzPUoeBogdg8DDgJKbTZR23x4qk1P0ovwmYP+a9s8
	XKvrW1mAi/Nl3GzDrkPshl7xVPtalKeVonnatRhp6lBtwVXwHwegpwqxEevh32StHNN8RH2mXqyEv
	Sqx81z3IPfqlx4gYYfS1jAwmelH7rP+NkPJBKQCMZ2bX/Pg4rrSdiza4jZ4oDGgvYp4285iOsAelt
	mzSfJ7pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uprCy-000000052ag-01gk;
	Sat, 23 Aug 2025 16:35:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upqd8-00000004x2r-3QCo
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Aug 2025 15:58:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 58B0D5C4D99;
	Sat, 23 Aug 2025 15:58:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8845AC113CF;
	Sat, 23 Aug 2025 15:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755964690;
	bh=cowF/ZJoltkSCoRh1kuPJeC/P6BXvPb4vKx2M+p/Qgo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ncOwNiWHrg0uqXBHtqGU2zpI4ptLy+6dHbnRxhBhadiKRfQKlPvQErpYLuBIFi6HE
	 pg1gEutx0p5TDSGh/f4H3G42H8Gg+c1MoenTjJlqkNC+Q1ghCax+8dOBOGjErZ7xs0
	 sCaaDQ6Bgt3NnISicdp1K6qih8a6Jt60DgOnShrP6N8oNi6MxkI2FIQ8kHM7Vb/vOH
	 LdLBoSqxkFTSsju+K4cmjR6VyiEcxdB9qgfwGWH3xsGZMLT/NLclvQRNPFPXrNFflR
	 KUS96xTbDsi4NZWCa5pefrQv8hG0h0LSmjD2+Wcd2Tc1Nsy3EpKOyMkfR3QmpaBJho
	 yo57AuLjsB96w==
From: Jisheng Zhang <jszhang@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>
Cc: dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 13/14] dt-bindings: dma: dma350: Support ARM DMA-250
Date: Sat, 23 Aug 2025 23:40:08 +0800
Message-ID: <20250823154009.25992-14-jszhang@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250823154009.25992-1-jszhang@kernel.org>
References: <20250823154009.25992-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_085810_892563_D0B1D0E3 
X-CRM114-Status: UNSURE (   8.22  )
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

Compared with ARM DMA-350, DMA-250 is a simplified version, they share
many common parts, but they do have difference. The difference will be
handled in next driver patch, while let's add DMA-250 compatible string
to dt-binding now.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 Documentation/devicetree/bindings/dma/arm,dma-350.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
index 94752516e51a..d49736b7de5e 100644
--- a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
+++ b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
@@ -15,6 +15,7 @@ allOf:
 properties:
   compatible:
     const: arm,dma-350
+    const: arm,dma-250
 
   reg:
     items:
-- 
2.50.0


