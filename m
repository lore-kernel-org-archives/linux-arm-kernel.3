Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 700DDC98321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 18:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:From:To:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hGaWXgHzpsfY1UMjd2+bFzT/djFCHkcCZvgDS30qTkw=; b=gkxRPF/maySwwFyjljIrhC3QOD
	BXJTerYfWD8JP7gFAKtQC7Rsp/0FXhxkVxKhNYT3I49JTS1Vn+JA9yt4dXjF8On/W1T2DQk+w0N52
	M5hbVsNV5AdZ17W6wmYYFMwoJfQyFkcfTL3ICn2BPkPtZngqFu62ShIDjGNWi1k2W3tSC5K/dslkP
	27e03XejDDWTSG1vQ7NwgW8aZFV4mTjzmPEn/rLq4UCcgU9sGt+JKCpi8I/wtZSGHfrwSFo5tuF7B
	MjHtVvJY2w6zh88WSxB7RGWnit4qkBbwwTGgv1SepZaqoeCIVTQ4FUeCXxqrkp9YCoxoE1Fm4v6iU
	/uJXj+Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAB0T-0000000EBds-1T75;
	Fri, 25 Sep 2026 18:50:49 +0000
Received: from mail-10699.protonmail.ch ([79.135.106.99])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAB0P-0000000EBd0-49ll
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 18:50:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1790362242; x=1790621442;
	bh=hGaWXgHzpsfY1UMjd2+bFzT/djFCHkcCZvgDS30qTkw=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=xspn+k3ZYeOmHSJE4amosPEezlgoRhez+4NE0t877dU9IJMAPfeOKWtfHQgC8KZim
	 iuwRIN8OUImKQuWpz39tAi45WK5ZzjBSgnijgBHvfYi77OJy7QkmemZvBdt7ESSFIc
	 TEATgei1aOqVo8gv+G0ly1nN7TvEibf3IaTkFLHXqTkBBtTCeOXigg0NRQPkLnfqx1
	 P6mbay/h6XgrGaZW8zwsHDJmpUwpfdPTO1CbtvKWjKdMJGMYLJsF9QKZCHyTJgh+2L
	 4jHAF+r2+nEii4/phagiLKpB8MphzHpHQ0qW+rFpeTUwxAIYQfT8awOB4j6Ct3rLyy
	 42HaKOpIzyOig==
Date: Fri, 25 Sep 2026 18:50:37 +0000
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andy Teng <andy.teng@mediatek.com>
From: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v10 0/6] MediaTek pinctrl DT binding cleanup and MT6735 pinctrl support
Message-ID: <20260925-mt6735-pinctrl-v9-v10-0-cc042983c565@protonmail.com>
Feedback-ID: 6882736:user:proton
X-Pm-Message-ID: 031e8134844b5cabcc61d2f1a367b2cf543110c2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_115046_201811_7E23ACB1 
X-CRM114-Status: GOOD (  19.30  )
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

Changes since v9:
 - Explicitly size mtk_pin_reg_calc arrays to PINCTRL_PIN_REG_MAX.
 - Add missing pull type entries for pin 59.
 - Eliminate square brackets from pin function names.
 - Fix mediatek,mt6735-pinfunc.h reference in MAINTAINERS.
 - Move addition of mediatek,mt6779-pinctrl.yaml in MAINTAINERS to DT
   bindings patch (5/6).
Changes since v8:
 - Merge recently added slew-rate description in MT6795 bindings into MT677=
9
   bindings.
 - Remove "capitalize pinmux description" which was not done from 2/6 commi=
t
   description.
 - Add ARM64 || COMPILE_TEST as kconfig dependency for MT6735 driver.
 - Set _x_addrs for GPIO_RDSEL of pin group 5 which spreads across 2 regist=
ers.
 - Add entries for virtual EINT pins to pull_type array.
 - Set db_time in mtk_eint_hw struct. Debounce times match those of MT6765.
 - Add pull_type array for MT6735M.
Changes since v7:
 - Wrap &mtk_paris_pinctrl_pm_ops with pm_sleep_ptr to fix build error repo=
rted
   by kernel test robot.
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

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
Yassine Oudjana (6):
      dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Pull pinctrl node chan=
ges from MT6795 document
      dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Improve pinctrl subnod=
e and property descriptions
      dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Add MT6795
      dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Document MT6765 pin co=
ntroller
      dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Add bindings for MT673=
5 pin controller
      pinctrl: mediatek: Add MT6735 pinctrl driver

 .../bindings/pinctrl/mediatek,mt6779-pinctrl.yaml  |  196 +-
 .../bindings/pinctrl/mediatek,mt6795-pinctrl.yaml  |  236 --
 MAINTAINERS                                        |    9 +
 drivers/pinctrl/mediatek/Kconfig                   |    7 +
 drivers/pinctrl/mediatek/Makefile                  |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt6735.c          | 1120 ++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6735.h      | 3993 ++++++++++++++++=
++++
 .../dt-bindings/pinctrl/mediatek,mt6735-pinfunc.h  | 1148 ++++++
 8 files changed, 6457 insertions(+), 253 deletions(-)
---
base-commit: 4c253ac4b29b8c6cc6fdef8f92d4facde62e63b9
change-id: 20260924-mt6735-pinctrl-v9-30c26357d432

Best regards,
-- =20
Yassine Oudjana <y.oudjana@protonmail.com>



