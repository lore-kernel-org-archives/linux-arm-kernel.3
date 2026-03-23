Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9CE3EC01C8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 11:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bgecuX6dgFikNLDFCtRY5VaqRxvGHfJWc9O3C/uu8wI=; b=f3xUhn0dI5GwbxdY4lH6XgrwJO
	c7tR3D2RqpaUJVaMN4CpvAUOCSRD1z7M9yXG2+yzI5+bs/3d44Gd6TzPk659nbHKZjL/JkO+P1J2n
	mHPPQWwrWfJsb7tom7135QnACFdq4Qh1FNNyYuTTX++jA3DK147ZQ1Sk57PdmpbHGLB3RNQu0pV1g
	Qhh2S4vXGeGrrocJHykEUipZSBMz7K+7PniXaJJV7HWJziFYZrH6S86NrGnq6cwAEaDL/3C/K2NuE
	4tiuLtgxRYbOn2tXGCgoPLpY/ibs2A8NRCI6CPwtATXIHYNovtBRGG5bqCxRpN2niggZHKqdoC9nU
	m15pe+TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4d2w-0000000GYfG-3ATs;
	Mon, 23 Mar 2026 11:02:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4d2p-0000000GYcT-20YP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 11:02:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6EB131516;
	Mon, 23 Mar 2026 04:01:53 -0700 (PDT)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CCB103F73B;
	Mon, 23 Mar 2026 04:01:56 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Michal Piekos <michal.piekos@mmpsystems.pl>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] pinctrl: sunxi: fix A523 GPIO IRQ blunder
Date: Mon, 23 Mar 2026 12:01:46 +0100
Message-ID: <20260323110151.2352832-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_040203_648704_006F8CDC 
X-CRM114-Status: GOOD (  19.41  )
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

When playing around with an Allwinner A527 board, I noticed that the
GPIO IRQ operation was broken, evident by not working SD card detect
functionality. The GPIO line reflected the CD pin correctly (as shown in
/sys/kernel/debug/gpio), but the core code just wouldn't react to those
changes.
This is admittedly mostly my fault, due to misunderstanding the IRQ
assocication in the original A523 DT submission.

Digging a bit deeper I found three bugs around this whole operation:
1) The A523 was marked as needing the "irq_read_needs_mux" workaround,
   even though this is not true. This itself wouldn't be too critical, if
   not:
2) The irq_read_needs_mux workaround routine assumes that the IRQ mux is
   always using value 0x6, which is not true for newer SoCs (D1, A523).
3) The association between GPIO IRQ banks and their interrupts is
   off-by-one for the A523. Interrupts are triggered, but the wrong ones.

This series fixes all those issues. Due to dependencies between DT and
code this is a bit involved:
- Patch 2/5 drops the irq_read_needs_mux workaround for the non-affected
  SoCs, which fixes one part of the problem by masking bug #2 above.
- Patch 4/5 adds the missing IRQ line for the (non-implemented!) PortA
  GPIO bank to the DT, which corrects the IRQ association.

Those two patches alone are fixing the immediate issue. If people agree,
these should be taken ASAP, I added Fixes: lines for the backports.

However there is more:
- The DT binding only describes 10 IRQs for the A523, so patch 3/5
  corrects that value, to make the new DT pass DT validation.
- The pinctrl code would only expect 10 IRQs, so would now be missing
  the one for the last bank (PortK). Patch 5/5 fixes that number, but
  is more elaborate since it needs now to cater for old DTs carrying
  just 10 interrupts. Not too happy or convinced about that workaround,
  eager to hear about better solutions here. Please note that no board
  so far uses PortK interrupts, so this isn't too criticial right now.
- For good measure, patch 1/5 fixes the workaround to cope with IRQ mux
  values other than 0x6. This is now more robust, not requiring to know
  the IRQ mux value at all, also saving one MMIO read and fixing a
  potential race with other pinctrl mux code.

This applies on top of v7.0-rc5 (really the .get_direction callback
fix[1] merged into v7.0-rc3), plus the two patches from Michal's series[2],
which I assume would be applied shortly.

Please have a look and test, especially on A523/A527/T527 boards!

Cheers,
Andre

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=01e10d0272b9
[2] https://lore.kernel.org/linux-sunxi/20260320-rc2-boot-hang-v6-0-74dca70dd60e@mmpsystems.pl

Andre Przywara (5):
  pinctrl: sunxi: Rework IRQ remuxing to avoid fixed mux value
  pinctrl: sunxi: Remove unneeded IRQ remuxing for some SoCs
  dt-bindings: pinctrl: sun55i-a523: increase IRQ bank number
  arm64: dts: allwinner: a523: Add missing GPIO interrupt
  pinctrl: sunxi: a523: add missing IRQ bank (plus old DT workaround)

 .../allwinner,sun55i-a523-pinctrl.yaml        |  8 ++--
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi |  3 +-
 drivers/pinctrl/sunxi/pinctrl-sun50i-h5.c     |  2 -
 drivers/pinctrl/sunxi/pinctrl-sun50i-h6.c     |  1 -
 drivers/pinctrl/sunxi/pinctrl-sun50i-h616.c   |  1 -
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c |  1 -
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c   |  3 +-
 drivers/pinctrl/sunxi/pinctrl-sunxi.c         | 45 ++++++++++++-------
 drivers/pinctrl/sunxi/pinctrl-sunxi.h         |  1 -
 9 files changed, 37 insertions(+), 28 deletions(-)


base-commit: c369299895a591d96745d6492d4888259b004a9e
prerequisite-patch-id: dcb1e8190ce649778193c3b391f759d4bcba9a28
prerequisite-patch-id: e003cee1830cf260b932fd6503a62270a1930310
-- 
2.43.0


