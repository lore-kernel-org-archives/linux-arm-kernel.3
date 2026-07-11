Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F1DBC44506
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 14:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=68XIjv3oMF74stzxvIJ/Qs/DZ1vupGwuNZ5/TScVAvA=; b=TlmaOchvzVZUu9fXKKKAdEv/qP
	cyxpNfz5wQFVRaaB1B60JJEyj/QUvPHWLKleoMzrCuOxsEwrekYo33OBc2Wri+kX5aQOFVWmsz+kQ
	irV2qT8A0hIxmwxzKiMmXefME2eFLjFYFjH5/jHGNKTVYux6pge2LyyChqlgZX7OLtzajoSDHOA5R
	6m52MfyO/KKCMqHHSOL6+dMN2OFzGAIog8itsJaUWiA2uB9s2Z1IxU1MAIbAKrgdEFEg7rcFiNMQ0
	rX/ZkPMOocUktSLHQ+Yz/DkbveVKy+CL/NAEaHV+dXy2JnWzdXGSIKzXHo8MOd/ENiUfOfcaFv1mr
	2rysqR5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiYFY-00000006akz-03uL;
	Sat, 11 Jul 2026 14:00:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiYFW-00000006akC-0SwT
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jul 2026 14:00:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A64CE42DF7;
	Sat, 11 Jul 2026 14:00:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 469F81F00A3D;
	Sat, 11 Jul 2026 14:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783778409;
	bh=68XIjv3oMF74stzxvIJ/Qs/DZ1vupGwuNZ5/TScVAvA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iN2TDt0S4biyCk8WOcxwnVlb7psB5khRO/3zJd+1StlxchyMgu6w81SUhBVK0H168
	 P+cAljV3Kqzc8Rt5TOZf1kx8Z9g2RGBdWsYtcmiDP4tSU5QDRzUfetPRaqWuroYqbD
	 1NpdXbB20qsJG0kBGzplXT8KS95iGzA1dDGqn4mDVO9Zu3b456D5RnG83IIIUB7I4c
	 0voVYyvaOzL5ti1iDPR7mz7yaj79ULglU28/PeMg9H/GsMpkP/L5f+UjnIcND4dwJl
	 +qil9nxOTI59bWE7pOeMibs53l3DuQki0WdOSV7jly46oZwybUxPZtfq7153iWXJYl
	 G7wIwrNaDw3Ew==
Received: by wens.tw (Postfix, from userid 1000)
	id 20A725FBBD; Sat, 11 Jul 2026 22:00:06 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 3/7] dt-bindings: media: sun4i-a10-video-engine: Add H616 compatible
Date: Sat, 11 Jul 2026 21:59:54 +0800
Message-ID: <20260711135959.3616919-4-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260711135959.3616919-1-wens@kernel.org>
References: <20260711135959.3616919-1-wens@kernel.org>
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

The H616 contains a video engine similar to past SoCs.

Add a new compatible for it.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 .../bindings/media/allwinner,sun4i-a10-video-engine.yaml       | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
index 818d815d4732..20c430795134 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
@@ -24,6 +24,7 @@ properties:
       - allwinner,sun50i-a64-video-engine
       - allwinner,sun50i-h5-video-engine
       - allwinner,sun50i-h6-video-engine
+      - allwinner,sun50i-h616-video-engine
 
   reg:
     maxItems: 1
@@ -96,6 +97,7 @@ allOf:
           contains:
             enum:
               - allwinner,sun50i-h6-video-engine
+              - allwinner,sun50i-h616-video-engine
     then:
       properties:
         iommus:
@@ -111,6 +113,7 @@ allOf:
           contains:
             enum:
               - allwinner,sun50i-h6-video-engine
+              - allwinner,sun50i-h616-video-engine
     then:
       properties:
         allwinner,sram:
-- 
2.47.3


