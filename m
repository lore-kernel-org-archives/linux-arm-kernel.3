Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4828BE6748D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Dec 2025 11:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1FKibH22ukwF//ZheysxmUS/qUKc+MhHlYr4ZfyA5qU=; b=PuhQqCRxbyAfnZBaEDS9k13jzc
	YHcDS2/3hiv8KS5BTUIvVFwO58Xy1NkOO4/d0jlp2xzHywpQ+j3+ZS46y3C/OKIi+tcAUrzN0+PEX
	weIVY8MZP7uBWth2NEIo7HNUkoUd29V9e7AnhJm1V/5lgdCtav8bbTBj4zfOIWgTWt/aL4PMkiE+T
	R77R5+O0JOjrLchD6QLE4AUG8MSJ2F1xAE+phERqhUCwvXBeU6FeZBoEJg8YB3t+5FfbAeG+aKf7j
	3NFK29WcvI9kz6qp8IoktcNY3+U+IJ8z604v58dVOutAs7BVP9QxehQD0rGgxxTMW3FBH0TGzJs12
	NLAPNBZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXHFZ-0000000CMsD-33Af;
	Sun, 21 Dec 2025 11:05:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXHFY-0000000CMrJ-3GJu
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Dec 2025 11:05:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CE85E6001D;
	Sun, 21 Dec 2025 11:05:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53289C4CEFB;
	Sun, 21 Dec 2025 11:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766315119;
	bh=SgM8LmbKsO/V0BAs72Ln5nuOFUP4AR1J+W8Vnt8HIOI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ci0ELuQmRBVBp53Sh75c5jhe1Fb1nawO/JXgGalOJqmBUS5EPw7EwpyP3oq868NqP
	 988tnyH0+H2KzxTr2l21ORdoWKhF2GoQkkaYeVR4RpYUmqqi0u1wrFmR4wJwdnGqVm
	 QIhSbzw3osVPD5QM5DEWyxnKkFMxo7IDA9xP98TrNtS75S/FCkfBd1osamnkqsiJOc
	 /DZAGf2Zr+cG+YxrkO0vsdHHK2x+l4boymMqetrdUyvuZXdmvDVIuQ5cXFM+BDAwzs
	 r2TLvhO9a0FktHtqxlQeHaWXPFAxmfYdDbXncVpYJ0UIx8V6sSGZYqbqD1y0lkZC8O
	 Hx2NDbuCg3Tvg==
Received: by wens.tw (Postfix, from userid 1000)
	id 3ECE25FCB3; Sun, 21 Dec 2025 19:05:17 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] spi: dt-bindings: sun6i: Add compatibles for A523's SPI controllers
Date: Sun, 21 Dec 2025 19:05:08 +0800
Message-ID: <20251221110513.1850535-2-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251221110513.1850535-1-wens@kernel.org>
References: <20251221110513.1850535-1-wens@kernel.org>
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

The A523 has four SPI controllers. One of them supports MIPI DBI mode
in addition to standard SPI.

Compared to older generations, this newer controller now has a combined
counter for the RX FIFO ad buffer levels. In older generations, the
RX buffer level was a separate bitfield in the FIFO status register.

In practice this difference is negligible. The buffer is mostly
invisible to the implementation. If programmed I/O transfers are limited
to the FIFO size, then the contents of the buffer seem to always be
flushed over to the FIFO. For DMA, the DRQ trigger levels are only tied
to the FIFO levels. In all other aspects, the controller is the same as
the one in the R329.

Add new compatible strings for the new controllers.

Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 .../devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml      | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
index 3b47b68b92cb..1b91d1566c95 100644
--- a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     oneOf:
       - const: allwinner,sun50i-r329-spi
+      - const: allwinner,sun55i-a523-spi
       - const: allwinner,sun6i-a31-spi
       - const: allwinner,sun8i-h3-spi
       - items:
@@ -35,6 +36,9 @@ properties:
           - const: allwinner,sun20i-d1-spi-dbi
           - const: allwinner,sun50i-r329-spi-dbi
           - const: allwinner,sun50i-r329-spi
+      - items:
+          - const: allwinner,sun55i-a523-spi-dbi
+          - const: allwinner,sun55i-a523-spi
 
   reg:
     maxItems: 1
-- 
2.47.3


