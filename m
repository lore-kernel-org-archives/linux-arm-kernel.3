Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCBAB107BCD5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 17:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AEUMLFjDYFgWNo8Isf+AOvMOIf2xHR2rlWAPHYKPpSQ=; b=t5LF1kAFueUrReXMCmLlq7E9xs
	IdkkjbBzHzrG3n0medwU7tRwG3kb8MuyeYezKPndn6CRz8qpxGvzJV75Y+Q1p8XU2spc9d8qEgOKq
	qvoXBVP7YA2V5e0RBB1Z68TDy4aWeo5q/Lc9qbpZxuZGdZY0yg+hSVvOhRFEQA1eubsMSBco97/H+
	a+Tu18OqlTpivc116FXpnM8BRF5eSlxdTgLuLCZgCRYs9905NagNDDuZGvCUBimF+SuD40JNw2J5Z
	y56FwzhODFVGjJXHaajfIsxEXJZunZamUij+HIaJ4e65nCTshVUa6D+so+ciUj0cUgP1eYmGa75B3
	Wpx0PnCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w16GO-00000000lKu-3O0e;
	Fri, 13 Mar 2026 17:25:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w16GM-00000000lKW-11T6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 17:25:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D810A4430A;
	Fri, 13 Mar 2026 17:25:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F630C19421;
	Fri, 13 Mar 2026 17:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773422724;
	bh=ml4brZgYysNGyVbeOm8a2m9JHM+roqQsETGmno23LcY=;
	h=From:To:Cc:Subject:Date:From;
	b=bPWw+Wm2vENS0R2etVUo52Ys6ZStKULfae6XmmOinT+dnd68U5DQmopUMqGOmzdG8
	 a8uRfq6QRCj7WOd3kChdIl0lSXD4JwFks82csjU2kB/1V8ij/f2U5TOQ6yGD2hqDr7
	 g8LXhAYWIfp/F5jR5tDh+qNBIE/zapkVjgg6OUKJ5Xx3Z69Quslgi/ibnXv7Huyruh
	 SukHaYpysqQ5cHSBmCAaZksdyFAaUJT0kQn/bmC3rJ6bd6pClR+I4m9yctJ5dsoPOM
	 6Iy5ydxLRU1Cd2ReN+qVOHlbEMoQnMgZpid7aYuPCL3JMzbnc+WkksBepuN12v4r27
	 RB3f7cGYxRsLA==
Received: by wens.tw (Postfix, from userid 1000)
	id 033165FDD4; Sat, 14 Mar 2026 01:25:21 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH RESEND] dt-bindings: media: sun4i-a10-video-engine: Add interconnect properties
Date: Sat, 14 Mar 2026 01:25:03 +0800
Message-ID: <20260313172505.2321212-1-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_102526_303798_E9824612 
X-CRM114-Status: GOOD (  11.12  )
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
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
This was part of a series to clean up warnings for the Allwinner device
trees. This patch was not picked up by the media maintainers.


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


