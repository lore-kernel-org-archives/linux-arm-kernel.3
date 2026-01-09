Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08E73D232EA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 07:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K7mGSkw4vcb00d4ruVzi6Xz2835xKQYEPtg8sBwc2LQ=; b=j8QmRyT6NIBB+cyUSBTAjuWpqv
	Uge+SRP+aIGvuCU6VB7QcjX7d+EmR2SXIwPTGJH48dZQvn4ExA47+sHAHSfowh7RJvqmbiqSM9Zsm
	xw1BLj61XU1OnKsdQ7rVz43k2vzRAgYjBoEhcwmujLhUFesr0ueigpNCyfTu8hEGfdBi9+EeGOe2m
	bd5hks7dfLkMNJ3JJbxpUCJF7oKe5OuygVkFacBk+ins4ZvTDeis7Z0uOFK8FKcr+jqADxOmQl4Rw
	xAwbtfnZNSw8EOcUFoFcl2s1fqps8f6sKlB1THgQMa121sZnzrNE9YFwZJFH0WswYeKwoEPOx+TGz
	7vZ7VfBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve7Gi-00000001mrU-1wtb;
	Fri, 09 Jan 2026 07:50:50 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve7Gg-00000001mqr-0REF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 07:50:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1767945042; bh=eYuw2YRq8s3GUWScDfIIZ1j2Fv/VH08rVqcHOcv0Yrc=;
	h=From:To:Cc:Subject:Date:From;
	b=hvo3e7ghj1xWP6xeBVJzakCLz+USuZ1PMXOgL5sMtZ0qUhd6TptPjjlKzo2yYEt3U
	 V8TfY/Xo+Ut+wEVEdoMG7Cpf2RSM3S+7nZ83STeHaaZqsWg/oiHda+ACPOT7REPyUK
	 Mf8+/ChzFEPAnEg5qncWzKsUVUMnfFmmjwE2ORItC7ouTKRLZ8HN5ukXf5tKh4WB/g
	 71jGgDSmfaXqpO9NJU9v0r0X+2upERg4vy7ixDsTVVL61B0znC7tKI+te7wTw+3tGZ
	 qZt3ftAFqjfIZJllpeC/vOg7RJwi0sRn8Yp8bCYZxFk0kzASnoj6PZsvnM29MTxY8/
	 oyyC2nsJj9ixA==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 4F4DA3EB34F;
	Fri,  9 Jan 2026 07:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1767945042; bh=eYuw2YRq8s3GUWScDfIIZ1j2Fv/VH08rVqcHOcv0Yrc=;
	h=From:To:Cc:Subject:Date:From;
	b=hvo3e7ghj1xWP6xeBVJzakCLz+USuZ1PMXOgL5sMtZ0qUhd6TptPjjlKzo2yYEt3U
	 V8TfY/Xo+Ut+wEVEdoMG7Cpf2RSM3S+7nZ83STeHaaZqsWg/oiHda+ACPOT7REPyUK
	 Mf8+/ChzFEPAnEg5qncWzKsUVUMnfFmmjwE2ORItC7ouTKRLZ8HN5ukXf5tKh4WB/g
	 71jGgDSmfaXqpO9NJU9v0r0X+2upERg4vy7ixDsTVVL61B0znC7tKI+te7wTw+3tGZ
	 qZt3ftAFqjfIZJllpeC/vOg7RJwi0sRn8Yp8bCYZxFk0kzASnoj6PZsvnM29MTxY8/
	 oyyC2nsJj9ixA==
Received: from mail.mleia.com (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id AA8CA3EAC0F;
	Fri,  9 Jan 2026 07:50:41 +0000 (UTC)
From: Vladimir Zapolskiy <vz@mleia.com>
To: Frank Li <Frank.Li@nxp.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] spi: dt-bindings: nxp,lpc3220-spi: Add DMA specific properties
Date: Fri,  9 Jan 2026 09:50:32 +0200
Message-ID: <20260109075032.3287109-1-vz@mleia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20260109_075042_341297_1E0E71A6 
X-CRM114-Status: UNSURE (   8.75  )
X-CRM114-Notice: Please train this message. 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_075042_341297_1E0E71A6 
X-CRM114-Status: UNSURE (   9.85  )
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

NXP LPC32xx SPI controllers supports DMA operations over rx-tx channel,
which is muxed with SSP SPI controller DMA.

For additional reference see Table 69 in NXP LPC32xx User Manual.

Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
 .../devicetree/bindings/spi/nxp,lpc3220-spi.yaml          | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/nxp,lpc3220-spi.yaml b/Documentation/devicetree/bindings/spi/nxp,lpc3220-spi.yaml
index d5f780912f21..789e26e40927 100644
--- a/Documentation/devicetree/bindings/spi/nxp,lpc3220-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/nxp,lpc3220-spi.yaml
@@ -20,6 +20,12 @@ properties:
   clocks:
     maxItems: 1
 
+  dmas:
+    maxItems: 1
+
+  dma-names:
+    const: rx-tx
+
 allOf:
   - $ref: spi-controller.yaml#
 
@@ -38,6 +44,8 @@ examples:
         compatible = "nxp,lpc3220-spi";
         reg = <0x20088000 0x1000>;
         clocks = <&clk LPC32XX_CLK_SPI1>;
+        dmas = <&dmamux 11 1 0>;
+        dma-names = "rx-tx";
         #address-cells = <1>;
         #size-cells = <0>;
     };
-- 
2.43.0


