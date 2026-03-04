Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A46EF8FEA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 14:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=70v0D77rRl2pwhXSHHa4fSyaJqg/UmoFDwHcd7jnr7Q=; b=AoVVKe3Xud5eKnOTm+Q4HNbiJY
	OZU3jfiZiANj/k8LsWVU8rT79BzMqKmkG6Tsp11fwK3rD1g4dC/TPW7FFIiUhBTyzYvtdtvk/aKBs
	CqGQYvNA5AppRXyxsqQ2Gv3hMsmoNq+W1A3vfsENv+fzs0BBrlzp4V81J+WSdzs2sLpJ/8hAlCgxk
	nccAOXM/tJ16mkQwPtkRQfCa9AdhWzqHtmJMsfjhmrVT7ZVJYqoUJgwJ/SxkzEBnJP4bZVi8/Yz1e
	hSyet2XAUCzwawfdDs6jUEKQxvdlSLPj33+1lKYB9LwgBQnA5SwOAEzE/MqVdkmlT9CY6ZiqIPb2W
	FWOJbRIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmpo-0000000HIWw-1xby;
	Wed, 04 Mar 2026 14:04:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmpl-0000000HIVl-406N
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 14:04:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9019B41780;
	Wed,  4 Mar 2026 14:04:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95097C4CEF7;
	Wed,  4 Mar 2026 14:04:14 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: interrupt-controller: arm,gic-v3: Fix EPPI range
Date: Wed,  4 Mar 2026 15:04:10 +0100
Message-ID: <107183629106ad392e17fdf539a3d79873024377.1772632987.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_060418_013322_792D4C0B 
X-CRM114-Status: GOOD (  11.56  )
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

According to the "Arm Generic Interrupt Controller (GIC) Architecture
Specification, v3 and v3", revision H.b[1], there can be only 64
Extended PPI interrupts.

[1] https://developer.arm.com/documentation/ihi0069/hb/

Fixes: 4b049063e0bcbfd3 ("dt-bindings: interrupt-controller: arm,gic-v3: Describe EPPI range support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../devicetree/bindings/interrupt-controller/arm,gic-v3.yaml    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml
index bfd30aae682bf3f7..360a0643a0b567a4 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml
@@ -50,7 +50,7 @@ properties:
       The 2nd cell contains the interrupt number for the interrupt type.
       SPI interrupts are in the range [0-987]. PPI interrupts are in the
       range [0-15]. Extended SPI interrupts are in the range [0-1023].
-      Extended PPI interrupts are in the range [0-127].
+      Extended PPI interrupts are in the range [0-63].
 
       The 3rd cell is the flags, encoded as follows:
       bits[3:0] trigger type and level flags.
-- 
2.43.0


