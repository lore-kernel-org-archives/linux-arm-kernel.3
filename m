Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9160E7AD45
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Dec 2025 10:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HhhSRc0NPxuXc2GvYW04HUYLIUs8m40qYGz/lD5X9t8=; b=O5cpQ5Dj59SY6hx2fA+hyBjRUr
	KwRb4kookUDqLM3bJs0GkECD42tEUaakj+zmqr5/XG7yUxtMh6o71p5s7cSkys6k+rjkj7KHfEntw
	TENWZu1w0E+hgkla1hbxtXQGDS8qRr4L7qCXKZsW3ibLyXcRamFemnDNf6lwjIlB8HB57Yu2LBuZW
	7iptcbYsNHouwVDHoqp5rHwF24ZYvCr0CJ6DJ8ei4kHiU/EdMQwP23/52WfAMko5NjTkhe5/vPlVZ
	3jPER2Dy9Q9GAq3cmGKt8i+7RStxwUciU5Mg7e3tUxkHWLDXMrYSyv0LERt673w57etedlEERQDqM
	6dgyKJUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYihq-00000000KN7-0f1g;
	Thu, 25 Dec 2025 10:36:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYihm-00000000KLX-0BRa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Dec 2025 10:36:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4593F402D5;
	Thu, 25 Dec 2025 10:36:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 018FDC4CEF1;
	Thu, 25 Dec 2025 10:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766658985;
	bh=Wnej8lp3sfTvoHmjM9oQ6EDAn3bLLsAcYX0vOVkdUxk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Vb+uaqnsr6r6Zd5qTv3gI+ZXKEqtL/T9SFOPcODTMtlPjoTvhKfaMrp/8eoA4pvif
	 Ln0qXh3V1t9rof7jqhZ7MK8DLg20Gku6GdeGlNb4Mj+cfRzEqpYnvWxxJwNxLJmCPw
	 Xm08rjFFXcd8j5Es3JHYMC5PI403BkbvL+FfNKjcMHlYHBKGcYNVzO+fnfNitcAvn7
	 J00ahNSy4goKsohUZSR0zTRPPow00qYJCVYpH8W04vviDPnR1L45jjGNOT6PfI40iI
	 JUZl8v7te/PouRKN47jnfQDa9YnQmUnP2qUDX8IhE5TYpWCksuQJE51gJZhFC6O8YL
	 iQzY8Ga3X9Rjw==
Received: by wens.tw (Postfix, from userid 1000)
	id 54BFC5FA9D; Thu, 25 Dec 2025 18:36:22 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linusw@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: media: sun4i-a10-video-engine: Add interconnect properties
Date: Thu, 25 Dec 2025 18:36:12 +0800
Message-ID: <20251225103616.3203473-2-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251225103616.3203473-1-wens@kernel.org>
References: <20251225103616.3203473-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251225_023627_024087_EF91A72A 
X-CRM114-Status: GOOD (  11.07  )
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

The Allwinner video engine sits behind the MBUS that is represented as
an interconnect.

Make sure that the interconnect properties are valid in the binding.

Fixes: d41662e52a03 ("media: dt-bindings: media: allwinner,sun4i-a10-video-engine: Add R40 compatible")
Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 .../media/allwinner,sun4i-a10-video-engine.yaml        | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
index 541325f900a1..01f2afa023f0 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
@@ -63,6 +63,16 @@ properties:
       CMA pool to use for buffers allocation instead of the default
       CMA pool.
 
+  # FIXME: This should be made required eventually once every SoC will
+  # have the MBUS declared.
+  interconnects:
+    maxItems: 1
+
+  # FIXME: This should be made required eventually once every SoC will
+  # have the MBUS declared.
+  interconnect-names:
+    const: dma-mem
+
 required:
   - compatible
   - reg
-- 
2.47.3


