Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D991C88E73
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 11:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nZfA2xieEUIJBM7jxEmReWHO6XeJGm+rvXsQz6l0PLY=; b=LsFSn1NCScXJ25xI+VVZahjeR7
	ngcZVTtiIFJ5Aezls3tzmXxsEMaRCJe/Ygrwu9fhHtUUthjACGK7UNIAVRkvGulh/DIJgjeSTW0g+
	ISGAW0b5r9lawzDynK7wmvQlmVWvlw9Ydlzkf5g4pP10SfyTEejalo9SyL4IOhpqVhHtHdzCfQn+h
	UGSYkhMmCDrUW63DZzYlPeHJQ/4TQ7WLwY+Cg6eEqjbpkgEJRmwbOTS21bEYVC34xWNOmM93e1JUg
	riIRNKjD590iur2MPAQP1W7TND51/mejlYuGbJ/d2G4BGDwPiBC3DKheUzRCTP+bTkkjw0pzTeNbs
	HS7ac7mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65HN-00000003OqB-48CM;
	Mon, 14 Sep 2026 11:55:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65HL-00000003On3-10rE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 11:55:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F0C8043B68;
	Mon, 14 Sep 2026 11:55:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 268CA1F000FF;
	Mon, 14 Sep 2026 11:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789386918;
	bh=nZfA2xieEUIJBM7jxEmReWHO6XeJGm+rvXsQz6l0PLY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=c+pXoVrBe1scPfMAU7rXW9YdPlCrC59UcQm5t4P9EWPe+fwSlG0vOBTXkG8xEIMgy
	 0K1YNBsXvzApFdPqTbNyMN61fiFJ1VKg5EZ/5NwDsTQJ74iPqR8u/akB2AqQO/lJsd
	 PmwDx3t+OaitWs37i/8SGc/xmcFFXeB4F4/ixDN88eoBorclTkMTqbgVgLuU1vxRFx
	 u+c+9KEMBMtbwlJfVzICmXNALChUu3EyCyI0SOfIeBzqvSVC6yOfJ6arbCLK9e6EBH
	 /gzmgSCD0hQcohkrGMNK+05fEIrBgOYxZs9zX1RRJseDR7fCxWcNJn+MCGvmmGC2oX
	 uavDoya7cBpJg==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 13:54:38 +0200
Subject: [PATCH v2 10/20] dt-bindings: clock: stericsson,u8500-clks: Allow
 power domains
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-ux500-power-domains-v7-1-v2-10-9d0c17e1f816@kernel.org>
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

Allow the DB8500 clock controller node to reference its power domain.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 Documentation/devicetree/bindings/clock/stericsson,u8500-clks.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/stericsson,u8500-clks.yaml b/Documentation/devicetree/bindings/clock/stericsson,u8500-clks.yaml
index 4ebfa5a8d524..75e5e1107ebb 100644
--- a/Documentation/devicetree/bindings/clock/stericsson,u8500-clks.yaml
+++ b/Documentation/devicetree/bindings/clock/stericsson,u8500-clks.yaml
@@ -34,6 +34,9 @@ properties:
       - description: PRCC 5 register area
       - description: PRCC 6 register area
 
+  power-domains:
+    maxItems: 1
+
   prcmu-clock:
     description: A subnode with one clock cell for PRCMU (power, reset, control
       management unit) clocks. The cell indicates which PRCMU clock in the

-- 
2.55.0


