Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08994E7718F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 20:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pce2DdCTncrOdzX7qPApVYKMrquNOHsZcFa01GvWLtc=; b=NLtELKY3xA0LhltAjLFG/oafws
	92Jero3oC9v+EiQ+VHmskGR1J57eC1T0HcRayKSiINkLUSpOwzU13ugnN8aoPQb1dfWb3ETF7mtB+
	tI1z0w9so5IV/xynZUuu34AppWeIHePcQkesGbHu0xeVIsoOn5QIRXr0qDPau1DI4vhN6PQclGEPA
	xvnFBPaMFOjmD2oF4buaPxEXOr6LmLQmRTnJ9S0LXXT3iNk4dXZSXXTNavQRnjeN2w2kagF3ampwh
	qLCLO6iTHRFJkEWEbbGDc59K1MNRd2xaDCd5sZD0+/44O7HANeZzHq9RGKCDXmHRLo9lO115af6i+
	pexBCDtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tToi4-0000000Dycc-0Yw9;
	Fri, 03 Jan 2025 20:55:56 +0000
Received: from mail.netcube.li ([173.249.15.149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTocI-0000000DxwO-2b47
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 20:49:59 +0000
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References;
	bh=Pce2DdCTncrOdzX7qPApVYKMrquNOHsZcFa01GvWLtc=;
	b=CXT/fWHX1iFmomf4uvxMoDoueEw+QFWlyShNaENdxUfc2Di2ylmRfBNGnn1cUBlbR6uxk03Sbhtm+P0HtWwvT3vel+KfwzKkZD6XOu7RJ2AWXVixQxGhEw97QzW1PQaPmaA3gCMyI0PDh5jW20fAFyd8bbySO1tlwayqfHes+Xo=
Received: from 854af3ed5e24.lan.sk100508.local (cm70-231.liwest.at [212.241.70.231])
	by mail.netcube.li with ESMTPA
	; Fri, 3 Jan 2025 21:49:36 +0100
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: Lukas Schmid <lukas.schmid@netcube.li>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v3 3/4] dt-bindings: pinctrl: sunxi: Add gpio-reserved-ranges property
Date: Fri,  3 Jan 2025 20:45:19 +0000
Message-Id: <20250103204523.3779-4-lukas.schmid@netcube.li>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250103204523.3779-1-lukas.schmid@netcube.li>
References: <20250103204523.3779-1-lukas.schmid@netcube.li>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_124958_964449_3CFB8A65 
X-CRM114-Status: UNSURE (   8.61  )
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

Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
---
 .../bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml        | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
index 450240570314..24b90a5538d6 100644
--- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
@@ -83,6 +83,11 @@ properties:
 
   gpio-controller: true
   interrupt-controller: true
+
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 90
+
   gpio-line-names: true
 
   input-debounce:
-- 
2.47.1



