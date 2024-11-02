Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5363FE677F8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 09:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IJZcZJ9UkGG88e0G4cRYDgpG4uPgV6cApvRZoFsAFwQ=; b=Md0St+LsEJ34B93KzMNxvUo23m
	mkoIf6nUiHXu57/KX/dsrvbMcN/EfFKqS3NdVHx/EPrF8iNuErbUB/lsVtXrpEUT6B50Owh+e+Pbu
	xdqLMqXcotJZpI7DCz9EtXKMOBdJ5KWSUB601WQ+NsiNamZI5052iLcJesBIQO0CEG1H5ZEJov+2H
	RWWsD+XczBjIQdfGy4ER6KkIz1ie15spfy7/RxNYiMuywyfCLlhWmSitwIAn815Puup/FTPRAgOjG
	0tth0AV/+TjDnVEoUa3lVxxJf5Xm6C9sXN5c793TtI6NJaEBxmbEKvXr6/IYkHnR5IxmC4IDq9dr2
	TWTKmiZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7AbT-00000009PED-1qJF;
	Sat, 02 Nov 2024 09:39:31 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7AXf-00000009OdK-2J2f
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 09:35:36 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 39507A0B13;
	Sat,  2 Nov 2024 10:35:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=IJZcZJ9UkGG88e0G4cRY
	DgpG4uPgV6cApvRZoFsAFwQ=; b=D8Zbu/bskVQpbJkw8hvklIWpJD6uEwdyatPh
	/atkFTTpLgmF0iYLikM4tathVSmKAwi/XBwz9du0xi4bLVSlC7DqFleNtzMDCg2t
	+jBSOTlR6399KA9ERmfVZE42YgzH/rxvckTAtiumj40a+W+Js0OZUhNLT99mz5T9
	kenb3IJUQN2xKP9SOt55+zfNg65RBbKqc0dMcVBt7eeN3sJuoo7ki/28fn1WBIol
	vsVuMEKN/36cX05KVi9dUCaKW2nNnt3yolUE7R71ENF45BaxdiFEOyQ/8QhaeZWU
	dahdwBF01n81rcgBY6a/ED3N3OPINLLYl3Mh1HDQuEU76mgKp8XvuuUxDNjVEdv3
	EZbWYzIVFmKlQOfxEH/WsbIiozk7LAwS+Cf0jn82XSOn9hzQ4RssuM8RcJqDQYzr
	WTTssXImKErCalGMJyUAQbOc0N7JtVPTV+YYb/eoK9J1HWwCQZEXJ6w0nCVhOA8t
	BiFzaOl+BiTJAzbKSIf3FAydHZSEPJJnVYn55RppFrUIu+boJg5FMVz8PwPnsY+f
	tA7AOJKWytLrPWdY56HlgQ/YKvX+2Z3nz29gHcANFlb/b7lw58CKnSYCLJouykJv
	ZfFrgsWnS53ZaKW4ePpr3IwDPbaMalLrUEucaYHPwgigcwghHQfMSnD0f9tF+fEU
	LSNrJ8w=
From: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
	<dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>
CC: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>, "Conor
 Dooley" <conor.dooley@microchip.com>, Vinod Koul <vkoul@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH v5 3/5] dt-bindings: dmaengine: Add Allwinner suniv F1C100s DMA
Date: Sat, 2 Nov 2024 10:31:42 +0100
Message-ID: <20241102093140.2625230-4-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241102093140.2625230-1-csokas.bence@prolan.hu>
References: <20241102093140.2625230-1-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1730540133;VERSION=7979;MC=3378102548;ID=220020;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94855667067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_023535_765455_61FB3E31 
X-CRM114-Status: UNSURE (   8.75  )
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

Add compatible string for Allwinner suniv F1C100s DMA.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
[ csokas.bence: Reimplemented Mesih Kilinc's binding in YAML ]
Signed-off-by: Csókás, Bence <csokas.bence@prolan.hu>
---
 .../devicetree/bindings/dma/allwinner,sun4i-a10-dma.yaml      | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/allwinner,sun4i-a10-dma.yaml b/Documentation/devicetree/bindings/dma/allwinner,sun4i-a10-dma.yaml
index 02d5bd035409..9b5180c0a7c4 100644
--- a/Documentation/devicetree/bindings/dma/allwinner,sun4i-a10-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/allwinner,sun4i-a10-dma.yaml
@@ -22,7 +22,9 @@ properties:
       number.
 
   compatible:
-    const: allwinner,sun4i-a10-dma
+    enum:
+      - allwinner,sun4i-a10-dma
+      - allwinner,suniv-f1c100s-dma
 
   reg:
     maxItems: 1
-- 
2.34.1



