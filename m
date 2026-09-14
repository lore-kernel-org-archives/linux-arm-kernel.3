Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03FFFC88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 11:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ts+GxHnFwbnnmh3W5wYX+MBFoD2caSNt+6YdLlaSQWA=; b=AixJiCGcJkhpMpnxbTr12RzOgJ
	1weLPCLSe7ewEbt2OGZXfA3+bSWQo0Bq6oArRPCfYkILarErmfRO3LDER3nbnYOmuL69Lnr9GskW1
	lrnHi986lxWSeJN7cozmwwOdxai1RcuHHGmlk6UQ2WAtkSkmMPTGHELo2EGJglrFGl94T2kdGlEqt
	iDAA4aGr9Nqm547LSgXH0znVoXH4VTwsnUY9osINPZnyJCAls6r3fLo6PHNchlWWTEIunRqI4OXSC
	ksV3CoXjzJ6yOeekRcT5BdLzYgJVsl1s047PqhgQ9L1feGGxIJpTIfHb+JPME3oe5a0BTG8uwj+p4
	J5Xssbkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65HN-00000003Opu-3dqW;
	Mon, 14 Sep 2026 11:55:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65HH-00000003Ol3-09N9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 11:55:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C50464089F;
	Mon, 14 Sep 2026 11:55:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBA0E1F00893;
	Mon, 14 Sep 2026 11:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789386914;
	bh=Ts+GxHnFwbnnmh3W5wYX+MBFoD2caSNt+6YdLlaSQWA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=CDJ36O5bsDGECaJwuVwUdsOWTjfctfKWomopPi96gu3rjL48cDT58nuhFGThN8/Ek
	 oXZRLkrnWHZEw2rlcrpkaakRXjuuTjph7olqDv4OmZ5hzpZiE+3XoQXcCuL9k4yd8O
	 KgxphCOvvaxAefts0ju0bN+tLbwbTyr3G+I37TlsUGXWXvshqwgp9AtCaKaaEfIzwc
	 /MUM5j7pOUGIek7mqlLWyg6EtPwPJWRAkY01m/uMHrXGi3A8LTs2+nLjZy/4oX+5RP
	 coWpcKQa5Lsc89w0zENSnvTw5QIlgUOvO2BapV9wKzc7EUxyeNZkMVpppFriOX7oyJ
	 CxfiiOWqmBx3w==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 13:54:37 +0200
Subject: [PATCH v2 09/20] dt-bindings: arm: pmu: Allow power domains
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-ux500-power-domains-v7-1-v2-9-9d0c17e1f816@kernel.org>
References: <20260914-ux500-power-domains-v7-1-v2-0-9d0c17e1f816@kernel.org>
In-Reply-To: <20260914-ux500-power-domains-v7-1-v2-0-9d0c17e1f816@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 Mark Brown <broonie@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Lee Jones <lee@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 dmaengine@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
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

Allow ARM PMU nodes to reference their power domain.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 Documentation/devicetree/bindings/arm/pmu.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/pmu.yaml b/Documentation/devicetree/bindings/arm/pmu.yaml
index f47baaefcdac..305c1a9668f4 100644
--- a/Documentation/devicetree/bindings/arm/pmu.yaml
+++ b/Documentation/devicetree/bindings/arm/pmu.yaml
@@ -88,6 +88,9 @@ properties:
     # Don't know how many CPUs, so no constraints to specify
     description: 1 per-cpu interrupt (PPI) or 1 interrupt per core.
 
+  power-domains:
+    maxItems: 1
+
   interrupt-affinity:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     items:

-- 
2.55.0


