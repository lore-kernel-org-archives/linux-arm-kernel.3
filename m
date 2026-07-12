Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63BC3C44507
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 03:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=68XIjv3oMF74stzxvIJ/Qs/DZ1vupGwuNZ5/TScVAvA=; b=mKcquuiBke/GLwjhCN5PTrFygv
	F38zXi17pqEyZWC+45hUI1jkCfV0YyKPZ3Vv72RV1Jkm0f7E5JewMd8Ra8Q0nw66Hhr9F+AEF5Nhq
	X/r5MO1L+f1g5jw+OO3n7ezUk8awBX7jj+koalPaUnnLbb6PF53abLwPGf2ZcHFWvqZGmBfT/rCzP
	bbVaHMwBGPCSc47XrJeiRLx8YoRiRM/CuX5y7f9kL/EEf25iRtnmyFtj8b1/bR6aVW8bY0TefLEUJ
	OjwXZ3QV8vzyF2XGH4WxftDJWbkG5ScV1AzU6ROCjivy7KJ/kig0mL/ojhN4go+lEGO8CM4vtTP4b
	k+tfeiiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wikQV-000000073Ie-48fR;
	Sun, 12 Jul 2026 03:00:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wikQS-000000073Hd-2C9j
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 03:00:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8135843A2C;
	Sun, 12 Jul 2026 03:00:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 212F81F00A3F;
	Sun, 12 Jul 2026 03:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783825215;
	bh=68XIjv3oMF74stzxvIJ/Qs/DZ1vupGwuNZ5/TScVAvA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JyzhDnQptnp796Jt8cIQNA2igTmFyWjk5uOuM7cPCPEy2loMVoyEBQBPfLvzgJJAZ
	 mpj0wuyY9JZNWgV8QlTPF/kN9Ylsyuj6D2ARjSCQ88uKm5wbWbomImHRFVr6fnZDXw
	 OLOmzAnyzH9fkEhodd8nd8c05v2t+BQo3NoLy7HZQ/Ts8/n04krPk5V2mWGuUHFJmv
	 a5umP4t2zgQkaub3l1oVFxzYYTLys7MUCqhWa4FLlMNiQZKx/3SZ1R1W8g/Dszmk6x
	 hepWeRF+XURJZry173jlwV81Ldvd6lW6tovSG+y/0XuPpqK8cQqbPSj/IHX6FyeVHV
	 q6r3padp8Id4w==
Received: by wens.tw (Postfix, from userid 1000)
	id EA7F95FEEE; Sun, 12 Jul 2026 11:00:12 +0800 (CST)
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
Subject: [PATCH v3 3/7] dt-bindings: media: sun4i-a10-video-engine: Add H616 compatible
Date: Sun, 12 Jul 2026 11:00:06 +0800
Message-ID: <20260712030011.3778169-4-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260712030011.3778169-1-wens@kernel.org>
References: <20260712030011.3778169-1-wens@kernel.org>
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


