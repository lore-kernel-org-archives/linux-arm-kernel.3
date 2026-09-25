Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 928F5C98325
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 15:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U9kby6pcI1OMpLkgnQZ2bZQgP5zb/td94MppquZEeEA=; b=dugdzqxQNx30K2RUHUyJtuEF10
	Q4t9xijlYy7O08FHzoROObYqQ0HJJzJE4dyhBRXBkX7a3h3259Xourl2usyEW8r8GojqItrq/IKv9
	qSSeon8OHfsSVoERhMdNJNpQ1iwe0GJp5BiXkJQN5hlieGRyOxRNHh1XoZnzzuQ3E5YWVE1q1dSz7
	zeZ1Y8H8aCCVPGzO/QdqhDLEsCzISpiop5sGnrD9C8bCuaCePeF34HrjZKHen6J/bqSO/LcRsNMo4
	3EInRfpAbdJgL1FCC0Znx8RwO8LfhpcgDukNLNHzXZijP1M8XuPirfT/aaLLN1SG/ostHf/Vl2Jml
	MZsCkoGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA88u-0000000DqOX-25da;
	Fri, 25 Sep 2026 15:47:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA88t-0000000DqNz-0rlM;
	Fri, 25 Sep 2026 15:47:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:To:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=U9kby6pcI1OMpLkgnQZ2bZQgP5zb/td94MppquZEeEA=; b=X8nvGNuCq7hsU2e//jBnY0gfv3
	zekqZYw8NJ73S5Jf/R5R8Lqk4p1EZp5sebj5y90XS7wwF6CJ5qJ/C/8gNNkCja1kA13QJBs09SQKX
	srp3S2Y3bwHm6HBHWhRrqHJOjvNGaYcAHKuhgBtEC14Muzu6N8sTRGqRPN5BHgIZ8/VVifymUatGJ
	SG1uHXbxQwfgacOizRhccunghxtixS6OOBCvWxjOpleLjCSwwqmSwFHyVNE4Y0Qmt5CgbBPyy6ZLW
	QaI9mHCARhbWneH1GUeRIkiE5elJoFMAbp9tg+CC2JrHH1pCwUoI7E1Tde0aJ5K8rufOVJTQYutr9
	ZTNAUoOA==;
Received: from mail-10698.protonmail.ch ([79.135.106.98])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xA88p-0000000H5PO-0xUa;
	Fri, 25 Sep 2026 15:47:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1790351230; x=1790610430;
	bh=U9kby6pcI1OMpLkgnQZ2bZQgP5zb/td94MppquZEeEA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=C73eU3CAZa3t2bbtPohGIzcku2i0Rp7AbQwbJIrtn7SyHsk5m3beCCMztNxEIg3+L
	 swp37UYSqwluu0JiqqSXKxgGx8V/1mw7sWfqloAawcE30NeFwLh9YifHIIAlfmcPY3
	 z5WlD07HYh6Y4iQj5XY2mTzDMSPWd2d8NCcjc+NJ0BUY+rEdZsdJPrE5INe+MZ6AHg
	 G4zmfsl4DoWv6w+N4fW3PeOIkxv/CxH5GV87Rnzu3vkJuqKFgX42t8JGZrI6btaxmh
	 HFxpY7av3yV/c+LM92b8a0YvyJ/IOTAK+QLF7a8UuuP9NNiYzKC+/YfZBjEoLb8H3C
	 rep4WYcdnsYBg==
Date: Fri, 25 Sep 2026 15:47:05 +0000
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andy Teng <andy.teng@mediatek.com>
From: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v9 2/6] dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Improve pinctrl subnode and property descriptions
Message-ID: <20260925-mt6735-pinctrl-v9-v9-2-bfb19d8bb87c@protonmail.com>
In-Reply-To: <20260925-mt6735-pinctrl-v9-v9-0-bfb19d8bb87c@protonmail.com>
References: <20260925-mt6735-pinctrl-v9-v9-0-bfb19d8bb87c@protonmail.com>
Feedback-ID: 6882736:user:proton
X-Pm-Message-ID: 8f2847e15bbad7bd381a0a4d5847852f8502d1b8
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_164715_478398_20E15C77 
X-CRM114-Status: UNSURE (   7.58  )
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

Change "subnodes" to "subnode" in subnode description for better
grammatical accuracy, wrap all descriptions at 80 characters, and remove
literal style indicators from descriptions that don't need their new lines
preserved.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabor=
a.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../bindings/pinctrl/mediatek,mt6779-pinctrl.yaml         | 15 ++++++++---=
----
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinc=
trl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctr=
l.yaml
index 0dcbca5ca8f92..4dc9504e24ad5 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yam=
l
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yam=
l
@@ -119,11 +119,11 @@ patternProperties:
       '^pins':
         type: object
         description:
-          A pinctrl node should contain at least one subnodes representing=
 the
+          A pinctrl node should contain at least one subnode representing =
the
           pinctrl groups available on the machine. Each subnode will list =
the
-          pins it needs, and how they should be configured, with regard to=
 muxer
-          configuration, pullups, drive strength, input enable/disable and=
 input
-          schmitt.
+          pins it needs, and how they should be configured, with regard to
+          muxer configuration, pullups, drive strength, input enable/disab=
le
+          and input schmitt.
         allOf:
           - $ref: pinmux-node.yaml
           - $ref: pincfg-node.yaml
@@ -133,7 +133,8 @@ patternProperties:
             description:
               Integer array, represents gpio pin number and mux setting.
               Supported pin number and mux varies for different SoCs, and =
are
-              defined as macros in dt-bindings/pinctrl/<soc>-pinfunc.h dir=
ectly.
+              defined as macros in dt-bindings/pinctrl/<soc>-pinfunc.h
+              directly.
=20
           bias-disable: true
=20
@@ -142,7 +143,7 @@ patternProperties:
               - type: boolean
               - enum: [100, 101, 102, 103]
                 description: Pull up PUPD/R0/R1 type define value.
-            description: |
+            description:
               For normal pull up type, it is not necessary to specify R1R0
               values; When pull up type is PUPD/R0/R1, adding R1R0 defines
               will set different resistance values.
@@ -152,7 +153,7 @@ patternProperties:
               - type: boolean
               - enum: [100, 101, 102, 103]
                 description: Pull down PUPD/R0/R1 type define value.
-            description: |
+            description:
               For normal pull down type, it is not necessary to specify R1=
R0
               values; When pull down type is PUPD/R0/R1, adding R1R0 defin=
es
               will set different resistance values.

--=20
2.55.0



