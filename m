Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB37D44D4F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 11:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:From:To:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V8yMZc9Tul1bQH+c+HZBXPgZ3WGspgX0f/zhkZDPElE=; b=Vt+r40uSAgB9VHd/SbqMWnVvTj
	DHPMPZyHB3lOsbZIPmnsh6Mw+UPtw5nw3sTx8OanXWV7dRkbuOnZjpEbY73/W4MenkJOM3Ls7FoFs
	LBfGzB4WF0ktaDt3cTACqURkpbBRZP0mIyypvtaXadHg9BOK7+R8ti1hG/F3f5BiuckwEwCx4WNTf
	f6942kwUQt7y71XmB9Nq/Ngit0sk/0Gywfbw0ykfSpj8q0A5YuriKfskzO8LGDLLMw0iljVzybcD7
	kT4c6PJsB+q3vTIeYiCQO29pHVsMsRlP7GEiIY4jgthavXi3QC0TqYYvEyBddMAzYB4dKO37pjegq
	BsijtKFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8e0G-00000002tJg-2adH;
	Wed, 06 Nov 2024 11:15:12 +0000
Received: from mail-40140.protonmail.ch ([185.70.40.140])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8cxL-00000002gjt-1tPt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 10:08:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1730887681; x=1731146881;
	bh=V8yMZc9Tul1bQH+c+HZBXPgZ3WGspgX0f/zhkZDPElE=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=X7uhEJLKYzJHzSA4QegoCAPrW1f9UZGo6GqvYkQ6T3FY2I2maGlcTtqYcc3FwfeWJ
	 rK7FiGLqhKAUQMCU8ADy91h3fZsO19l1iGkp3pNG8xt7k/1BTKXO9koumDYu1js+OS
	 rzgr/I+y+nEoZQm8UL8irCqpeYWlIZkcoA9Xl2ylqV/RW0zg1WBSjQVVC6So2sCSLt
	 fK7PtN7hnGoCEBkZGnmBA1u0GewU8kUValFwExEZKsawFP07/q/mv/OkeDEu4Ty2UJ
	 dW8oIgiKrQHtgiMmMmDYRCBmcxS6zcb2fWpy17ymidRgF+WQPWExXxT0rb0ucIJIdK
	 fy3gkY8CGsGYg==
Date: Wed, 06 Nov 2024 10:07:57 +0000
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andy Teng <andy.teng@mediatek.com>
From: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, Yassine Oudjana <yassine.oudjana@gmail.com>, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 0/7] MediaTek pinctrl DT binding cleanup and MT6735 pinctrl support
Message-ID: <20241106100741.173825-1-y.oudjana@protonmail.com>
Feedback-ID: 6882736:user:proton
X-Pm-Message-ID: b1fe9a94280e119d52a160e45965c4ac9782960b
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_020807_723662_DC37F1FA 
X-CRM114-Status: GOOD (  18.35  )
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

These patches are part of a larger effort to support the MT6735 SoC family =
in
mainline Linux. More patches (unsent or sent and pending review or revision=
) can
be found here[1].

This series adds a driver for the pin controller found on the MediaTek MT67=
35
and MT6735M SoCs. The two differ in the last 6 physical pins, which are use=
d
for MSDC2 on MT6735 but don't exist on MT6735M (since MSDC2 doesn't exist o=
n it
to begin with). In preparation to document DT bindings for this pin control=
ler,
the existing documents for MT67xx SoCs are combined into one in order to
eliminate duplicate property definitions and standardize pin configuration =
node
names. Necessary cleanup is done along the way.

[1] https://gitlab.com/mt6735-mainline/linux/-/commits/mt6735-staging

Changes since v6:
 - Mention changing MT6797 DT in 1st patch commit message.
 - Squash MT6735 DT binding patches.
 - Add debounce time to eint_hw struct. MT6735 supports the same debounce
   times as MT6765 so reuse debounce_time_mt6765.
Changes since v5:
 - Revise and fix all register bits for all group register types (IES, SMT,
   RDSEL, TDSEL, PUPD_R0_R1, PULLEN and PULLSEL).
 - Add pull_type array.
 - Use proper getters/setters for bias and drive.
 - Add minItems for MT6795 interrupts.
Changes since v4:
 - Remove patches that were applied previously.
 - Define interrupts items for each variant (bringing back maxItems: 1 to t=
he top
   level definition then adding maxItems: 2 under the MT6795 condition caus=
es a
   dt_binding_check error for some reason)
 - Move example changes to the patch they belong to
 - Don't unnecessarily move the allOf block.
Changes since v3:
 - Improve interrupts description to make clear what sysirq means.
 - Set drive-strength constraints per variant.
 - Set maxItems for reg in MT6795.
 - Add blank lines between conditionals.
 - Add ref for both pinmux-node.yaml and pincfg-node.yaml.
 - Make pinctrl subnode-related changes in separate patch.
 - Fix up some pinctrl subnode property descriptions.
 - Add interrupts items descriptions to MT6765 and MT6735.Changes since v3:
 - Improve interrupts description to make clear what sysirq means.
 - Set drive-strength constraints per variant.
 - Set maxItems for reg in MT6795.
 - Add blank lines between conditionals.
 - Add ref for both pinmux-node.yaml and pincfg-node.yaml.
 - Make pinctrl subnode-related changes in separate patch.
 - Fix up some pinctrl subnode property descriptions.
 - Add interrupts items descriptions to MT6765 and MT6735.
Changes since v2:
 - Add interrupt descriptions.
 - Change interrupts property item limits.
 - Move pinmux examples from node description to example dts.
 - Properly add myself as maintainer for MT6735 pinctrl driver and DT bindi=
ngs
   document.
 - Remove tabs from a few defines in pinctrl-mt6735.c.
Changes since v1:
 - Combine other documents into existing mediatek,mt6779-pinctrl.yaml
   instead of creating a new document with wild card in its name.
 - Split first patch into smaller patches focused on specific changes.
 - Remove syscon compatible from MT6779 DT to avoid a check error.
 - Fix interrupt count for MT6795.

Yassine Oudjana (7):
  dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Pull pinctrl node
    changes from MT6795 document
  dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Improve pinctrl subnode
    and property descriptions
  dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Add MT6795
  arm64: dts: mediatek: mt6797: Make pin configuration nodes follow DT
    bindings
  dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Document MT6765 pin
    controller
  dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Add bindings for MT6735
    pin controller
  pinctrl: mediatek: Add MT6735 pinctrl driver

 .../pinctrl/mediatek,mt6779-pinctrl.yaml      |  191 +-
 .../pinctrl/mediatek,mt6795-pinctrl.yaml      |  228 -
 MAINTAINERS                                   |    9 +
 arch/arm64/boot/dts/mediatek/mt6797.dtsi      |   20 +-
 drivers/pinctrl/mediatek/Kconfig              |    7 +
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt6735.c     |  881 ++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6735.h | 3993 +++++++++++++++++
 .../pinctrl/mediatek,mt6735-pinfunc.h         | 1148 +++++
 9 files changed, 6223 insertions(+), 255 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt67=
95-pinctrl.yaml
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt6735.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt6735.h
 create mode 100644 include/dt-bindings/pinctrl/mediatek,mt6735-pinfunc.h

--=20
2.47.0



