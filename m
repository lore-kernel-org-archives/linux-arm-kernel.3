Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E293C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 21:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=00faw+i/BTSJpzjgC6Q8YdpAdUc9bjrxB4poqZwns0s=; b=DKWZJYNU36J80yCyJzYet5MYR0
	JkA+GKZK0qIzmlqyxPs1eSqWd7pyNybs5OeVEiF7DlUf1SznFqcX8+ftf/vtpvyjSpZBrMdozhP7Z
	nlAOGFYYe3UwaeUmVZ2N0kkW1CtT3o9Wyzgun/+1dFAsWolFmzLOHU59VeM5WB0wgr41fKJG4M6GO
	hWDZhKE99sPF1zD1GM1AMVV1tIGsJt5STcHlwwsINNWhoi8dRRX3Rj//3vHc4GSXhmxntLN3o7o+H
	Ng8ts8ds0bIc5cnEMYFi3PwMElPIdWX0KzrdTQtd3S+MEw2o5W9y9tw3WskDd1wjdzEDBhjBbqAol
	DUW9DTpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwRBK-00000008fNc-0xsx;
	Tue, 18 Aug 2026 21:17:14 +0000
Received: from fhigh-a3-smtp.messagingengine.com ([103.168.172.154])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwRBG-00000008fM1-1Qsw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 21:17:11 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 254801400149;
	Tue, 18 Aug 2026 17:17:09 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 18 Aug 2026 17:17:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1787087828; x=1787174228; bh=00
	faw+i/BTSJpzjgC6Q8YdpAdUc9bjrxB4poqZwns0s=; b=RQPdEWvWJycgGKPbjh
	c9gqGy6NDZCSGg2qa4x973wBt3DDpZdnv8jSlsXMU/6cPgk/uMabyDxsdXG+nnB4
	+9xq937LvTyq+NfUFS1wZtuAC+RMplj6bqKIZbl0RVZZ+8B1YMVUNeqTawY3G835
	6H1kRCnaz9Efz6rkmoZcDjI0kkKxJSt81Erasg6WpjZB0Gk20TbQVyWjGhSMnUoj
	zYeVxA45Fqay1TnXwvtzLa0XbuHsJYP0wJCFxlYHA7VvjyPEQ1UXV44O0xfO9/Dg
	39Cxz8etn1n/cyQ19l0qVsyD5LEnui5aErVqYHoS/2KHsp9gKdfnAqU0nnRecy/D
	Tl2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1787087828; x=1787174228; bh=00faw+i/BTSJpzjgC6Q8YdpAdUc9
	bjrxB4poqZwns0s=; b=SV97FMWbou5LC1aac+2uyN2bn6ch9ILT4SzWSs8TI3nh
	uLvM7/LAk/aH1V/+/kc9Cs9ek5kbNT3oqMPqyvGcy8o8XgxYYa/yC/6YP2OfcRRj
	EV+cp9QWHnjmTIWRLT3hYAPzqFTp1c4hGP790nJW7hxQFL9fNbbkwizylx4SDm9Q
	Xt3uUGL+TQR0Tm5YL2Jvxft1icKh5+K76etg4Dk0Lqe2/BqY1uTEGchCZaCEPoAT
	n0agG28UdJuswIsVVq/c7Ppyq+7JC8SxaFbgx+O05TlXfQdTm3blEXNHCfaQJNQG
	ZdRFqBBR2cKNEu943u1GtVwSowev/H97/BWvhc8APg==
X-ME-Sender: <xms:0suEaqz5e_KVUOqrDdwHb6Nt73EaWYu27xZfretXAWPjoZfCM-hPAQ>
    <xme:0suEahGqOM_6xYUF6gcDsxAoM7YZiykCwfA9ezJBlCnkCuqOE5wJDg7tfIdQGO8nR
    MSAP9w8fesD-_1Zff6xUrR9MHCCsvxfWBJy8hLxlqAa5m0awKU6Dw>
X-ME-Proxy-Cause: dmFkZTGMarMvN+9knQboVmH/AKkaG+iSn0TdnK4yel5Znk5/lzhfHZ5CWHO+lbPLVeo0bE
    BIGVMzPZjMvphB689gVfoAz4FqE/06czHa18+w7zrf1pM8gaHoFi7j8KiFQ+MQM9GMTsdr
    OQklQKBmE2Aal0c7hdkigkSXlif0NopXFh1J614eLqtLQFlfyezZGFm6/tWX4Xay37WJeW
    G4cnFfSl7xSGj5ZgEJJxt4DmE2+MPOM2vcI+Wv7HJx8QrmRsJAkn6M4z+Dd8lJwWTv95XJ
    1GBab850GPL2cL0JQFeLVUss1k5f3ghytwEFap65gp0Kyyw2mkudb8RtCgMItpE4HUmkUL
    Edck8uaKOoF1FglydKUcI02ouK9WqnGO2ByZAD12X6ywMM5a75mPdTmOdwhwC6ux0fo1fT
    lcxZsv99ukFBDpZWLgtlJj8umIprJhfqkpFmxByYRrO47bskRYPcury+hatV9+T3Asfslo
    KnKUUDi5Uj3lEhGvIDwUAfy4ZFHGU5l7WOqwV8IEFIsqs5/yl8wkJsHmNxl0GIgMiJwIx+
    7rURv7R621k1tV3n9RdSx8VFDWWi7DhS7ujboOnxKMOyJOP9rYlsVJVA+xw5GZDkHcY7iQ
    Eh+8eraIaM4Lc0AK5hPwuLmP3C3SGg09Uj2SQitJzVEyKTIhCZ9alOzFRBtw
X-ME-Proxy: <xmx:08uEatEgiUAaAMS7_1i9z0SlfLeme4ShF6rgQrEUXLfxoE2scl6jCg>
    <xmx:08uEat1Rnc_j5Yv9HzibecaqSuZPtH7xrq6Aa8tzeOCLBFtQZo7Jyw>
    <xmx:08uEalmT5WCJ9L6Qo_bOo4fRBpKyecve59S39zBrBn3lahKO8A1vfg>
    <xmx:08uEat9vQ72nBArvHgy-WVyMlf9E27BPvInT2QQQdnfGGqM6n1Hccg>
    <xmx:1MuEasHLu6JaevoceskRQ-o9qS0JyT99H9jgNGknmKYEe5yXayRoZbZ3>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 6C9D232A0071; Tue, 18 Aug 2026 17:17:06 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AGbzGzcZ0DFB
Date: Tue, 18 Aug 2026 23:16:45 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <714ff494-4bb6-4482-9972-84380d87eff5@app.fastmail.com>
Subject: [GIT PULL 4/4] soc: Arm platform updates for 7.3
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_141710_538639_216DD2F0 
X-CRM114-Status: GOOD (  17.12  )
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

The following changes since commit a13c140cc289c0b7b3770bce5b3ad42ab3507=
4aa:

  Linux 7.2-rc3 (2026-07-12 14:16:39 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-a=
rm-7.3

for you to fetch changes up to acf1efa9485fda84f332c8fbbe7b4453dbec183a:

  Merge tag 'samsung-soc-7.3' of https://git.kernel.org/pub/scm/linux/ke=
rnel/git/krzk/linux into soc/arm (2026-08-10 22:17:08 +0200)

----------------------------------------------------------------
soc: Arm platform updates for 7.3

The 32-bit Arm platforms are a bit more interesting this time: I refresh=
ed
an earlier series to mark code as deprecated that does have the tendency
of getting in the way of cleanups and new features but has close to zero
users. Among these are:

 - 22 of the remaining 28 legacy board files that predate the current
   devicetree based descriptions, using old chips from Intel and Marvell.
   The remaining six board files are for TI OMAP1 and Samsung s3c64xx
   chips and all still have known users.

 - support for Cortex-M3/M4/M7 and ARM1136r0 CPU cores and the 25
   machines based on these. These all use devicetree but the CPU
   support causes disproportional work. Most of them are just
   reference boards, the notable exceptions being the Nokia N800/N810
   tablet and the Buglabs BUG platform.

 - be8, be32, oabi and iwmmxt userspace binaries, which were mostly
   associated with the platforms now scheduled for removal and
   are increasingly problematic to support with modern toolchains.

Nothing is actually removed at this point, to ensure that any remaining
users continue to have the 7.3-LTS for a while longer. Patches for
removal are currently being tested.

Other updates include a continued work to convert GPIO number based
interfaces to descriptors, a patch to restore little-endian mode
on the one Arm platform (ixp4xx) that only worked in big-endian mode
recently, and some minor cleanups and bugfixes.

----------------------------------------------------------------
Alexandre Belloni (1):
      Merge tag 'arm-feature-deprecation-for-7.3' of https://git.kernel.=
org/pub/scm/linux/kernel/git/soc/soc into soc/arm

Arnd Bergmann (27):
      ARM: use CONFIG_AEABI by default everywhere
      ARM: limit OABI support to StrongARM CPUs
      ARM: rework ARM11 CPU selection logic
      ARM: deprecate support for ARM1136r0
      ARM: turn CONFIG_ATAGS off by default
      ARM: mark CPU_ENDIAN_BE8 as deprecated
      ARM: update DEPRECATED_PARAM_STRUCT removal timeline
      ARM: s3c64xx: extend deprecation schedule
      ARM: update FPE_NWFPE help text
      ARM: mark IWMMXT as deprecated
      ARM: mark ARCH_DOVE as deprecated
      ARM: PXA: mark remaining board files as deprecated
      ARM: orion5x: mark all board files as deprecated
      ARM: mark mach-sa1100 as deprecated
      ARM: mark RiscPC as deprecated
      ARM: mark footbridge as deprecated
      ARM: mark Cortex-M3/M4/M7 based boards as deprecated
      ARM: mark axxia platform as deprecated
      ARM: mark mv78xx0 support as deprecated
      ARM: replace linux/gpio.h inclusions
      Merge tag 'renesas-arm-soc-for-v7.3-tag1' of https://git.kernel.or=
g/pub/scm/linux/kernel/git/geert/renesas-devel into soc/arm
      Merge tag 'ixp4xx-arm-v7.3' of https://git.kernel.org/pub/scm/linu=
x/kernel/git/linusw/linux-integrator into soc/arm
      Merge tag 'lpc32xx-arm-for-7.3' of https://github.com/vzapolskiy/l=
inux-lpc32xx into soc/arm
      Merge tag 'imx-soc-7.3' of https://git.kernel.org/pub/scm/linux/ke=
rnel/git/frank.li/linux into soc/arm
      Merge tag 'tegra-for-7.3-arm-core' of git://git.kernel.org/pub/scm=
/linux/kernel/git/tegra/linux into soc/arm
      Merge tag 'omap-for-v7.3/soc-signed' of git://git.kernel.org/pub/s=
cm/linux/kernel/git/khilman/linux-omap into soc/arm
      Merge tag 'samsung-soc-7.3' of https://git.kernel.org/pub/scm/linu=
x/kernel/git/krzk/linux into soc/arm

Dmitry Torokhov (4):
      gpio: sa1100: register software node for GPIO controller
      ARM: sa1100: assabet: convert gpio-keys to use software nodes
      ARM: sa1100: collie: convert gpio-keys to use software nodes
      ARM: sa1100: h3xxx: convert gpio-keys to use software nodes

Geert Uytterhoeven (1):
      ARM: shmobile: rcar-gen2: Use of_machine_compatible_match() helper

Griffin Kroah-Hartman (1):
      soc: imx9: devm_kasprintf error handling

Karl Mehltretter (1):
      ARM: lpc32xx: only run SoC init on LPC32xx hardware

Krzysztof Kozlowski (1):
      MAINTAINERS: Drop redundant lists from various Samsung entries

Li Jun (1):
      firmware: imx: sm-misc: Add NULL check for kmalloc in syslog_show

Linus Walleij (1):
      ARM: ixp4xx: Relax endianness

Mithil Bavishi (1):
      ARM: OMAP2+: Add CFI type for omap4_finish_suspend

Pengpeng Hou (1):
      firmware: imx: scu: manage mailbox channels and global handle

Thomas Huth (2):
      ARM: s3c: Replace __ASSEMBLY__ with __ASSEMBLER__ in header files
      ARM: tegra: Replace __ASSEMBLY__ with __ASSEMBLER__

Uwe Kleine-K=C3=B6nig (The Capable Hub) (1):
      ARM: imx: Drop obsolete stuff from common.h

Vladimir Zapolskiy (1):
      ARM: lpc32xx: remove a few manually populated OF devices

Weigang He (2):
      ARM: imx: fix device_node refcount leak in imx_src_init()
      ARM: imx: fix device_node refcount leaks in imx7_src_init()

Yuho Choi (3):
      ARM: imx: avic: Fix OF node reference leaks
      ARM: OMAP2+: Fix OF node reference leaks in omap_hwmod
      ARM: tegra: Fix OF node reference leaks in IRQ init

 MAINTAINERS                                        | 21 ------
 arch/arm/Kconfig                                   | 80 +++++++++++++--=
-------
 arch/arm/Kconfig.platforms                         |  2 +-
 arch/arm/configs/am200epdkit_defconfig             |  3 +-
 arch/arm/configs/aspeed_g4_defconfig               |  2 -
 arch/arm/configs/aspeed_g5_defconfig               |  1 -
 arch/arm/configs/assabet_defconfig                 |  3 +
 arch/arm/configs/at91_dt_defconfig                 |  2 -
 arch/arm/configs/axm55xx_defconfig                 |  2 -
 arch/arm/configs/bcm2835_defconfig                 |  1 -
 arch/arm/configs/clps711x_defconfig                |  1 -
 arch/arm/configs/collie_defconfig                  |  2 +-
 arch/arm/configs/davinci_all_defconfig             |  1 -
 arch/arm/configs/dove_defconfig                    |  2 +-
 arch/arm/configs/ep93xx_defconfig                  |  1 -
 arch/arm/configs/footbridge_defconfig              |  2 +
 arch/arm/configs/gemini_defconfig                  |  1 -
 arch/arm/configs/h3600_defconfig                   |  3 +-
 arch/arm/configs/hisi_defconfig                    |  1 -
 arch/arm/configs/imx_v4_v5_defconfig               |  1 -
 arch/arm/configs/integrator_defconfig              |  2 -
 arch/arm/configs/ixp4xx_defconfig                  |  1 -
 arch/arm/configs/jornada720_defconfig              |  3 +-
 arch/arm/configs/keystone_defconfig                |  1 -
 arch/arm/configs/lpc32xx_defconfig                 |  1 -
 arch/arm/configs/mmp2_defconfig                    |  1 -
 arch/arm/configs/moxart_defconfig                  |  2 -
 arch/arm/configs/mps2_defconfig                    |  1 -
 arch/arm/configs/multi_v4t_defconfig               |  2 -
 arch/arm/configs/multi_v5_defconfig                | 10 ---
 arch/arm/configs/mv78xx0_defconfig                 |  3 +-
 arch/arm/configs/mvebu_v5_defconfig                | 10 ---
 arch/arm/configs/mxs_defconfig                     |  1 -
 arch/arm/configs/neponset_defconfig                |  3 +
 arch/arm/configs/netwinder_defconfig               |  3 +
 arch/arm/configs/nhk8815_defconfig                 |  1 -
 arch/arm/configs/omap1_defconfig                   |  3 +-
 arch/arm/configs/orion5x_defconfig                 | 11 ---
 arch/arm/configs/pxa168_defconfig                  |  2 -
 arch/arm/configs/pxa3xx_defconfig                  |  2 -
 arch/arm/configs/pxa910_defconfig                  |  2 -
 arch/arm/configs/pxa_defconfig                     |  5 --
 arch/arm/configs/rpc_defconfig                     |  3 +
 arch/arm/configs/s3c6400_defconfig                 |  2 +
 arch/arm/configs/sama5_defconfig                   |  1 -
 arch/arm/configs/sama7_defconfig                   |  1 -
 arch/arm/configs/spear13xx_defconfig               |  1 -
 arch/arm/configs/spitz_defconfig                   |  2 +-
 arch/arm/configs/stm32_defconfig                   |  1 -
 arch/arm/configs/versatile_defconfig               |  2 -
 arch/arm/configs/vt8500_v6_v7_defconfig            |  1 -
 arch/arm/configs/wpcm450_defconfig                 |  2 -
 arch/arm/mach-at91/Kconfig                         |  4 +-
 arch/arm/mach-axxia/Kconfig                        |  4 +-
 arch/arm/mach-davinci/da850.c                      |  2 +-
 arch/arm/mach-dove/Kconfig                         |  8 ++-
 arch/arm/mach-dove/mpp.c                           |  2 +-
 arch/arm/mach-footbridge/Kconfig                   |  7 +-
 arch/arm/mach-imx/Kconfig                          | 13 +++-
 arch/arm/mach-imx/avic.c                           |  2 +
 arch/arm/mach-imx/common.h                         |  7 --
 arch/arm/mach-imx/src.c                            |  3 +
 arch/arm/mach-imx/system.c                         |  8 ---
 arch/arm/mach-ixp4xx/Kconfig                       |  5 +-
 arch/arm/mach-lpc32xx/common.c                     |  5 +-
 arch/arm/mach-lpc32xx/common.h                     |  2 +
 arch/arm/mach-lpc32xx/phy3250.c                    | 62 +--------------=
--
 arch/arm/mach-lpc32xx/pm.c                         |  5 +-
 arch/arm/mach-mv78xx0/Kconfig                      |  4 +-
 arch/arm/mach-mv78xx0/buffalo-wxl-setup.c          |  2 +-
 arch/arm/mach-mv78xx0/irq.c                        |  2 +-
 arch/arm/mach-mv78xx0/mpp.c                        |  2 +-
 arch/arm/mach-mvebu/pm.c                           |  2 +-
 arch/arm/mach-mxs/mach-mxs.c                       |  2 +-
 arch/arm/mach-omap2/Kconfig                        | 18 +++--
 arch/arm/mach-omap2/omap_hwmod.c                   | 26 ++++---
 arch/arm/mach-omap2/sleep44xx.S                    |  5 +-
 arch/arm/mach-orion5x/Kconfig                      | 47 ++++++++++---
 arch/arm/mach-orion5x/board-d2net.c                |  2 +-
 arch/arm/mach-orion5x/board-rd88f5182.c            |  2 +-
 arch/arm/mach-orion5x/dns323-setup.c               |  2 +-
 arch/arm/mach-orion5x/irq.c                        |  2 +-
 arch/arm/mach-orion5x/kurobox_pro-setup.c          |  2 +-
 arch/arm/mach-orion5x/mv2120-setup.c               |  2 +-
 arch/arm/mach-orion5x/net2big-setup.c              |  2 +-
 arch/arm/mach-orion5x/terastation_pro2-setup.c     |  2 +-
 arch/arm/mach-orion5x/ts209-setup.c                |  2 +-
 arch/arm/mach-orion5x/ts409-setup.c                |  2 +-
 arch/arm/mach-pxa/Kconfig                          | 10 ++-
 arch/arm/mach-pxa/am200epd.c                       |  2 +-
 arch/arm/mach-pxa/am300epd.c                       |  2 +-
 arch/arm/mach-pxa/generic.c                        |  2 +-
 arch/arm/mach-pxa/gumstix.c                        |  2 +-
 arch/arm/mach-pxa/mfp-pxa2xx.c                     |  2 +-
 arch/arm/mach-pxa/pxa25x.c                         |  2 +-
 arch/arm/mach-pxa/pxa27x.c                         |  2 +-
 arch/arm/mach-pxa/reset.c                          |  2 +-
 arch/arm/mach-pxa/sharpsl_pm.c                     |  2 +-
 arch/arm/mach-pxa/spitz.c                          |  2 +-
 arch/arm/mach-pxa/spitz_pm.c                       |  2 +-
 arch/arm/mach-rpc/Kconfig                          |  5 +-
 arch/arm/mach-s3c/Kconfig.s3c64xx                  | 15 ++--
 arch/arm/mach-s3c/dev-audio-s3c64xx.c              |  2 +-
 arch/arm/mach-s3c/devs.c                           |  2 +-
 arch/arm/mach-s3c/mach-crag6410.c                  |  2 +-
 arch/arm/mach-s3c/map-base.h                       |  2 +-
 arch/arm/mach-s3c/pm-gpio.c                        |  2 +-
 arch/arm/mach-s3c/pm-s3c64xx.c                     |  2 +-
 arch/arm/mach-s3c/setup-fb-24bpp-s3c64xx.c         |  2 +-
 arch/arm/mach-s3c/setup-i2c0-s3c64xx.c             |  2 +-
 arch/arm/mach-s3c/setup-i2c1-s3c64xx.c             |  2 +-
 arch/arm/mach-s3c/setup-keypad-s3c64xx.c           |  2 +-
 arch/arm/mach-s3c/setup-sdhci-gpio-s3c64xx.c       |  2 +-
 arch/arm/mach-s3c/setup-spi-s3c64xx.c              |  2 +-
 arch/arm/mach-sa1100/Kconfig                       |  5 +-
 arch/arm/mach-sa1100/assabet.c                     | 75 +++++++++++++--=
-----
 arch/arm/mach-sa1100/collie.c                      | 76 ++++++++++++---=
-----
 arch/arm/mach-sa1100/generic.c                     |  2 +-
 arch/arm/mach-sa1100/generic.h                     |  3 +
 arch/arm/mach-sa1100/h3600.c                       |  2 +-
 arch/arm/mach-sa1100/h3xxx.c                       | 71 +++++++++++----=
----
 arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c | 10 +--
 arch/arm/mach-shmobile/setup-rcar-gen2.c           |  9 +--
 arch/arm/mach-stm32/Kconfig                        | 14 ++--
 arch/arm/mach-tegra/irq.c                          |  9 ++-
 arch/arm/mach-tegra/reset.h                        |  2 +-
 arch/arm/mach-tegra/sleep.h                        |  2 +-
 arch/arm/mach-versatile/Kconfig                    | 15 ++--
 arch/arm/mm/Kconfig                                | 29 +++++++-
 arch/arm/plat-orion/mpp.c                          |  2 +-
 drivers/firmware/imx/imx-scu.c                     | 25 ++++++-
 drivers/firmware/imx/sm-misc.c                     |  3 +
 drivers/gpio/gpio-sa1100.c                         | 10 ++-
 drivers/soc/imx/soc-imx9.c                         |  9 +++
 include/linux/serial_s3c.h                         |  4 +-
 include/soc/tegra/flowctrl.h                       |  4 +-
 include/soc/tegra/fuse.h                           |  4 +-
 137 files changed, 515 insertions(+), 433 deletions(-)

