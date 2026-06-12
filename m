Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16A1DCD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 21:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f9Wh7NvXO66sNsL9eRF3jkvVQcyg+DTDNvWmFLOKnjM=; b=yEnmKxWvNbfLiIcMmELxmxNbR2
	5pvm6Ct994saFSvDjCM+MXfX/Xnzz/U2OHTs+vGSsEfwGLSDm52MPcKVkdZsdUpzsMWSSTX6singm
	5s9BXIhysQP3jFoO3Bs6KxkRsXexbxsC7tnz+rWXleCaQfTG+1iM7PWxqejh9L55JwgvkEHZZ7hdI
	THAF2Sw92DS9FqQeUbRB0aaE5X1zV679YPsGS2UJVE+3eipuMPYtnI7x6Gj1lKHmlApI0QlJbfNp6
	fzmWxvmXuLdv7GQG5TSee4FTQ+jMIsBw0K3SDOQmesnSRYUO03slCZjZGVH9ndkXHtChMMDbKkYQL
	6P8sgSAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY9nj-0000000Bd0V-3zvB;
	Fri, 12 Jun 2026 21:52:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY9nj-0000000Bd0I-11gB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 21:52:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8AF9C600AF;
	Fri, 12 Jun 2026 21:52:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 168A71F000E9;
	Fri, 12 Jun 2026 21:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781301150;
	bh=f9Wh7NvXO66sNsL9eRF3jkvVQcyg+DTDNvWmFLOKnjM=;
	h=From:To:Cc:Subject:Date;
	b=VXorvUJaie1JEFvJ3mt1q5HQtkUfWzFpUxsFjIgebkb+WjeShUqFMT3RglFn/bJpO
	 9Raf9cYpB/359pXknr48+/MK3vWUEmUiv88eRRmM9ScMwGf3KbI1Y7nKR7V02/nAyX
	 NdKguo4HR8azK3h+wAi/dyEmkVDnNWleaj/dFvjHIYfDeP/nGaeAa3BBTjfuOnZ3Sh
	 r/NGCJNiTmqTUvhGnrEVZFksFxwF9l8VkvWEMdQJGDahcxVoCWZ1Mbssx283Tcy1jE
	 SazzDhqwkCeYf0G1NzbU2xGZGpXvRK+ID8FPQZY5cU6v5nyqEq+oawVGx4jLqn8wMC
	 6yyQMmekjb8Dw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Abin Joseph <abin.joseph@amd.com>
Cc: dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: dma: xilinx: Fix "xlnx,irq-delay" type
Date: Fri, 12 Jun 2026 16:52:25 -0500
Message-ID: <20260612215226.1887726-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
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

"xlnx,irq-delay" programs an 8-bit delay field in the DMA control
register, and the driver stores and reads it as a byte. The binding
described the property as a uint32 cell, which made the helper type
check report the driver as wrong.

Document "xlnx,irq-delay" as uint8 so the generated schema reflects
the hardware field width and the existing driver access.

Assisted-by: Codex:gpt-5-5
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/dma/xilinx/xlnx,axi-dma.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/xilinx/xlnx,axi-dma.yaml b/Documentation/devicetree/bindings/dma/xilinx/xlnx,axi-dma.yaml
index 340ae9e91cb0..ba0fc515d825 100644
--- a/Documentation/devicetree/bindings/dma/xilinx/xlnx,axi-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/xilinx/xlnx,axi-dma.yaml
@@ -93,7 +93,7 @@ properties:
       Width in bits of the length register as configured in hardware.
 
   xlnx,irq-delay:
-    $ref: /schemas/types.yaml#/definitions/uint32
+    $ref: /schemas/types.yaml#/definitions/uint8
     minimum: 0
     maximum: 255
     description:
-- 
2.53.0


