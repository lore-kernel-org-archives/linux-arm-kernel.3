Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66813EA7197
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Apr 2026 19:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wrf/Lt76mF0ZTNTXk/pAtiJpTtv3oNIg+cUa00ckXrE=; b=QY9tYw0egzwFT+6ixthVvSonGz
	Gni4mvxtecHsDv6U3z+Cd6aGK1C8DEmGU5eQC7+Ah3vN950KRlBDHmXED7lYXYs0n3Qi3XYnNMWn4
	dn5LqUsW6w33FpU1mabOS7eP1v4W2qaharsSvksMqRG7JIaaB+TNiGCtXmmychjbP1HIxLZqP2VxI
	7gk4sj85PNuHtAtSgTzDnEQr2+q9hD6u6AkAbNIscY7mSCea3SWsPrzgy+npv1xd+xv9oztN1RVDs
	hsWf8IXE2jNGvUB9/ld34n7mZCxFUT4ECCd8NxZlEYiMp0n0Mv9s+eA4XSxhLTfeah8BDFgNtYjf1
	0LbVYANg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEXy0-000000062Kt-3Jn3;
	Sun, 19 Apr 2026 19:38:04 +0000
Received: from mout-p-102.mailbox.org ([80.241.56.152])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEXxx-000000062IV-1tUa
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Apr 2026 19:38:02 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4fzJn32LWtz9vPH;
	Sun, 19 Apr 2026 21:37:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776627479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wrf/Lt76mF0ZTNTXk/pAtiJpTtv3oNIg+cUa00ckXrE=;
	b=Tbqd6CfkOg//GEeMcUswfK5eQZKB6q0nLkknCqPXhEhfDRS4U/kVuhN3Q9dwaiAA++W4ws
	kbpVmVeteVvmBvu4XMjCjG0uQiXqiA4X33QuQPg6C+jy3ZusyHtEhX7k+F3Pg3F9Jey+I8
	TU0EoSqGuMCb6/ZZccaZmcGktMXxyu0k+qRB7xt4LYyWG1R5bvR71o0qiXWaNeFGvYfZQD
	4k5J7pWUBdJt7bZTRsNaFGkBzFtDGLbftQg6V94kYxAHgwhJAiMhIhfv0on2o96X0IGu4L
	zlCYYBWmie4PkSOCcdYvihZkG4kCsEGi6P/NrBZf6I6KCDSzC1QZ1abQnEiaUA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776627477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wrf/Lt76mF0ZTNTXk/pAtiJpTtv3oNIg+cUa00ckXrE=;
	b=SIFYPnl4CW0IkgVIp7+bUBY8ayXDXlK6GlKY7XE9AOmS8+rtOVE9nBLgj+Ot3P4ZmJ+bG4
	Y+YwdrjJ9Fo+HZ+XGv5SUaQmwNIx97hX6DlgcRNVzj3gp5r3qDMuw/YHGU1XQ6IL8JWvcZ
	lRwhCyYIB10JuXNbtAJj/N+uT3ltIV3kpaBPuxFg2CgffjMpxcY+ptVeLFZ3Hx/EiDp72i
	ne/0fKMMoZbGuhsY6qnE1SfOO9euMWGIwE3mGiILbEXMxIi1+KUk9SpgHkzPD7YJDiSaQI
	p29TAyfo0fKrVRxl3EdnQlYAE8DgF15bND4aFn5UbGs1DJqF/8vv6KGm+pVD7w==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Stephen Boyd <sboyd@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 4/7] dt-bindings: soc: renesas: Document Renesas R-Car R8A779MD Geist
Date: Sun, 19 Apr 2026 21:35:35 +0200
Message-ID: <20260419193718.133174-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260419193718.133174-1-marek.vasut+renesas@mailbox.org>
References: <20260419193718.133174-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: a5yjuzwujp9cyfz1yr7tg6dc63sko3y9
X-MBO-RS-ID: fae731ed30b2c377de1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_123801_675718_5B7C47AD 
X-CRM114-Status: UNSURE (   9.39  )
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

Document the compatible value for the Renesas R-Car M3Le (R8A779MD)
SoC and the Renesas Geist development board. The Renesas M3Le SoC is
a register-compatible variant of the R8A77965 (M3-N) with reduced set
of peripherals. The Geist board is derived from Renesas Salvator-X/XS
boards, with adjustment for the R8A779MD SoC.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 Documentation/devicetree/bindings/soc/renesas/renesas.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
index 5c22c51b1533d..bda223237c812 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
@@ -473,6 +473,12 @@ properties:
           - const: renesas,r8a779mb
           - const: renesas,r8a7795
 
+      - description: R-Car M3Le (R8A779MD)
+        items:
+          - const: renesas,geist    # M3Le Geist
+          - const: renesas,r8a779md
+          - const: renesas,r8a77965
+
       - description: R-Car X5H (R8A78000)
         items:
           - enum:
-- 
2.53.0


