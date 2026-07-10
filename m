Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B052C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 21:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=j8VNDpb1bJMZLFW82qLI/e4xSQf3HKQRtP70vunhlNI=; b=FBH1pAaXxXPeZOvjALZGu3m2ij
	CPi5LuqONR/7KOsLlgKM0LJv7clx4Hm0Mt7iA5DEfRZTivOSBqhkk+5VJi1c8x1M2by4HKvzv4M0/
	Ya5o9LbtTFW4skpomSqlgT1TwBIIlze0sFzZX9viyi3/00nynYRLMHv5cEU/BJRUXScRtIzorMQ52
	Oo+OCadBzHR/RpMjxsgYBMkaBN47PMDLSp7tn65IFHoq1EYWC/a06yeI8rjsP6XtG34H0fITJlyvi
	nJ6A16PDgxC7QdzQsiXig1DdICba/znrD4jmEUKK1KBqQ71C4Xj7iiW7rHgaSDRljf8aTQSkXuC5u
	QAXNhJ+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiIrN-00000005rEX-0xp5;
	Fri, 10 Jul 2026 21:34:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiIrL-00000005rE9-34fZ
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 10 Jul 2026 21:34:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Subject:Message-Id:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=j8VNDpb1bJMZLFW82qLI/e4xSQf3HKQRtP70vunhlNI=; b=TNtBMYVagOvK8ZXdJPyqXmM2oD
	WmvAteYY8t2HruFR0pBBZMvQ2a/Fl0XboQ5VmlzzDCqN1cOrwakn6QUz31VWx2uj8eRR4QCsXcCv3
	WtC43cMmv81LCGvhDuhD6IV5BNSEu/AkR19OsUY+4vLJk6g4AUMsjpA6wz+l7Au3G+CZh2Fv5sWur
	hZRAsSCPwJw1ZJMH7WbmkyJXz44RT3pU3k39zSo9tkfWBjDyFpIRHrboa7IsFQwe7n+pW5h3y9EbK
	OZsaqcN+qgr25NxxckkDtm7hHvcGB4e+KKN0GxGJGTMqulewY8YtL3YQYR5+ufptWR2TMFX71ZEJh
	zO/hk2Fw==;
Received: from fout-b8-smtp.messagingengine.com ([202.12.124.151])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wiIrG-0000000ALnV-0Kh0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 21:34:10 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 953441D000C0;
	Fri, 10 Jul 2026 17:34:02 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Fri, 10 Jul 2026 17:34:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1783719242; x=1783805642; bh=j8
	VNDpb1bJMZLFW82qLI/e4xSQf3HKQRtP70vunhlNI=; b=QPS/Nz5y4mx01TFFxy
	fP63BlXkXVHP9VvqgUy3V4/p+t/9adxU1G7zhefoWtHvfPhTNkm6BVNmfrKZV5/K
	odbq4K+3QTN9L0LBhIwMzvN3kQgdFCQyUcZyggSUgJn6f0Y+zU2M5adyANtB7pgn
	PpcVmyvgPyLUeJK9ep7t31JtHMKiFLX+AtHbogWgf4Ap8sRalSQWFQeLY9/LUcvX
	nQWtXaANuDrnG180QV0yqaOAMTlW/kpJ6JjvLyJZVz1ZAT4zaI39oFEueHzZYlHV
	dqfYjhSlBh0+JDbigZqrWQiEOYF3gtyaEELW4ZTJg7QeB1L8hzbBPhqDYWGXGsdv
	bBKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1783719242; x=1783805642; bh=j8VNDpb1bJMZLFW82qLI/e4xSQf3
	HKQRtP70vunhlNI=; b=dLfVojXrqg3M09eNUUnd29e5SDSEWv0lHU7/43QiXDmv
	TrG4BxPfBz10kX+XlnlvSMFHR6alZGE7ZrO2kj+/yVeGBSt0DVaeT0JuDhqjIQHd
	C3FKszmMRMUjC+0nCpLtEWp+I1/QPJ8+hN9dTvSQ02V3smB075B8wQCpSQISaIz1
	OFHDjp8Bug8mRNpMQHl4eTvOGYA39e7e5UawHytd/XhGr9cgj4N3vmm2/jHYcY4D
	GAIx1THNetGHMqXAx+bmOKQyZAjy+AubLpRgBaB8a3dcb3fQrpsPj+wrPCaWmrJ+
	QYQPOJKDviie/E/ve2CMMDv95K23+CP3xTwu84ewjQ==
X-ME-Sender: <xms:SGVRamd5fboQAUrBeKtuQW0QdqVrR-0lvcSKIzZyam-hE7VPwDPhOQ>
    <xme:SGVRarAOAjuY3n1fRosUNLkR1hPhj3rH9yt8tr8L2gMk5FObyieYgZ3FaL9UVBJAt
    l7bZ488uhhHiwK9W0uOGEjOWAb4yhztP4eyGCJuRrB1AcvLARxsDGv6>
X-ME-Proxy-Cause: dmFkZTEwV5K604c0nz6qlDzmIx+dxC8k7DkU1ALEyj1myIvPuPUcD1yqypWYSbF3z8aroh
    59ac9KxQIxFwN1taF4bOwuk3akOARh3W26AcjWenhbEIeELPLzK6HqINGGtMU32oYkjk8N
    3E7CzDqoEJuDJv3oSDFveYAla17nR5NPUDcjXpRHBWsYVXlQMpjmj065eTXfW6f2qhe+sJ
    YvaBEWIAjBKNeJkFHeEZTdAC24vUW/tMSSqJzCaFhTFki45sliOJcNiUWjnDewdKDdqIYy
    8HCUx/tJK1Gf+t1AFwRFwS6qvk9Er5sKDsY2woRcO9d6HYAh8SoZtdLoaD668Th6olpdsG
    aSOSZXAcCsv884opgypGg4z+HDworoOoXDeznCxrIZyzdHF1Cb09MMqc55clBDqa+fClCi
    ab+k4J5weDkHRwiJe60F+6bRFqMspcKP1+fSNxLYJgxCFlTstduccdXWQ3YAZHrKxFIQ5I
    jBXmi6OXq91Wig4J5Oph1sBwBJoC/5+kfSJV2jFDyqaVVu0DMvdkIBVUOkCpfm8f23N2ul
    SCPhiHQT1xizlpMPv00ysJbwSwHbID3A9XiaszeCVU/l079+kyWthYWCq7XgmrGh9jQI7O
    dfG1AUtMta0u52tXOmc8HrSr8M+WlR0qziqrg0HOGiJat8C2g/HRG/SAqAvQ
X-ME-Proxy: <xmx:SGVRagoo7g1ySKKk_rE9wQbHYHO9SOLQZaAR4Gy3P0r_mweLwtJkew>
    <xmx:SGVRatdtuB9sxOgqW8mqmMX1V251IhEndVmQpPKd-XirzfED2vyFxw>
    <xmx:SGVRauKE98ULyvJORCXgVTU35oxYJiyU435cYTemC95r9gQ0qSWH_Q>
    <xmx:SGVRaqtrIEAQfgxBfFl95zwJvAdraEJGLivCKzuof9V4r8eLXiL6Qw>
    <xmx:SmVRagb8vUY4y9k8BHzqvDtWlP6WS5bTMYiKjIxWFq4PD3IC7x1wqZWx>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4F1281820082; Fri, 10 Jul 2026 17:34:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AAVDWq93qhKc
Date: Fri, 10 Jul 2026 23:33:39 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: soc@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, "Arnd Bergmann" <arnd@arndb.de>,
 "Aaro Koskinen" <aaro.koskinen@iki.fi>,
 "Alexander Sverdlin" <alexander.sverdlin@siemens.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>,
 "Andrew Lunn" <andrew@lunn.ch>, "Ard Biesheuvel" <ardb@kernel.org>,
 "Claudiu Beznea" <claudiu.beznea@tuxon.dev>,
 "Daniel Mack" <daniel@zonque.org>,
 "Ethan Nelson-Moore" <enelsonmoore@gmail.com>,
 "Frank Li" <Frank.Li@nxp.com>,
 "Gregory Clement" <gregory.clement@bootlin.com>,
 "Haojian Zhuang" <haojian.zhuang@gmail.com>,
 "Jeremy J. Peper" <jeremy@jeremypeper.com>,
 "Kristoffer Ericson" <kristoffer.ericson@gmail.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Linus Walleij" <linusw@kernel.org>, "Mark Brown" <broonie@kernel.org>,
 "Marc Zyngier" <maz@kernel.org>, "Mike Rapoport" <rppt@kernel.org>,
 "Nicolas Ferre" <nicolas.ferre@microchip.com>,
 "Patrice Chotard" <patrice.chotard@foss.st.com>,
 "Ralph Siemsen" <ralph.siemsen@linaro.org>,
 "Robert Jarzmik" <robert.jarzmik@free.fr>,
 "Russell King" <linux@armlinux.org.uk>,
 "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Sebastian Hesselbarth" <sebastian.hesselbarth@gmail.com>,
 "Stefan Agner" <stefan@agner.ch>,
 "Stefan Wiehler" <stefan.wiehler@nokia.com>,
 "Tony Lindgren" <tony@atomide.com>, "Vladimir Zapolskiy" <vz@mleia.com>,
 "Will Deacon" <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Message-Id: <a45f46bd-047f-4ca4-820e-fa92678bbf3f@app.fastmail.com>
Subject: [GIT PULL] ARM: platform and feature deprecation for 7.3
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_223407_787441_DE7E328F 
X-CRM114-Status: GOOD (  16.91  )
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

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-feature-deprecation-for-7.3

for you to fetch changes up to 6cb7a10ef7488720f4379e27575d723a85790b30:

  ARM: mark mv78xx0 support as deprecated (2026-07-10 23:22:10 +0200)

----------------------------------------------------------------
ARM: platform and feature deprecation for 7.3

This is attempt to bring the source code to the state that we discussed
back in 2024, regarding a timeline for deprecating and removing features,
in particular platforms and ABIs that are basically unused and are
also getting in the way of maintenance.

The earlier consensus was to remove these features in 2025 or 2026
after the corresponding LTS kernel release. I would suggest pushing
these to early 2027 now, see the patch description for details on
each one:

 - all board files that are still not converted to DT
   (except for OMAP1 and S3C)

 - iWMMXt FPU support

 - ARMv6/ARM1136r0 (not ARMv6K/ARM1136r1/ARM1176) along with the
   OMAP24xx and i.MX31 SoCs using it

 - Cortex-M3/M4/M7 based microcontroller support
   (stm32, imxrt, lpc18xx, samv7)

 - LSI Axxia platform

 - OABI, OABI-compat and NWFPE are confined to StrongARM based
   builds and scheduled for removal once StrongARM is gone.

 - DEPRECATED_PARAM_STRUCT, which was originally scheduled for
   removal in 2006 (!)

The ARCH_S3C64XX platform was scheduled for removal in 2024, but is
still actively used and will get removed once Mark Brown stops using
it. The OMAP1 platform has some remaining boardfiles and is expected to
get converted to DT.

Big-endian ARMv7 CPU support is not scheduled for removal but marked
as broken the same way as ARM64 has, to reduce the need for testing
unused configurations. This may be removed in the future if arm64 does
it as well. Note that big-endian ARMv5 support is can still be
enabled since the patches to revive little-endianm mode are still
fresh.

Regarding actually removing the code, I would suggest linux-7.4 (January
2027), removing both the board files and any drivers that have either
become newly unused or were missed in a previous machine removal series,
followed by removing support for then unused CPUs a release later.

Links to previous discussion:

  https://lore.kernel.org/linux-arm-kernel/20210109174357.GB1551@shell.armlinux.org.uk/
  https://lore.kernel.org/linux-arm-kernel/2831c5a6-cfbf-4fe0-b51c-0396e5b0aeb7@app.fastmail.com/
  https://lore.kernel.org/all/20241204102904.1863796-1-arnd@kernel.org/
  https://lore.kernel.org/all/20260701212353.2196041-1-arnd@kernel.org/

----------------------------------------------------------------
Arnd Bergmann (19):
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

 arch/arm/Kconfig                        | 80 +++++++++++++++++++--------------
 arch/arm/Kconfig.platforms              |  2 +-
 arch/arm/configs/am200epdkit_defconfig  |  3 +-
 arch/arm/configs/aspeed_g4_defconfig    |  2 -
 arch/arm/configs/aspeed_g5_defconfig    |  1 -
 arch/arm/configs/assabet_defconfig      |  3 ++
 arch/arm/configs/at91_dt_defconfig      |  2 -
 arch/arm/configs/axm55xx_defconfig      |  2 -
 arch/arm/configs/bcm2835_defconfig      |  1 -
 arch/arm/configs/clps711x_defconfig     |  1 -
 arch/arm/configs/collie_defconfig       |  2 +-
 arch/arm/configs/davinci_all_defconfig  |  1 -
 arch/arm/configs/dove_defconfig         |  2 +-
 arch/arm/configs/ep93xx_defconfig       |  1 -
 arch/arm/configs/footbridge_defconfig   |  2 +
 arch/arm/configs/gemini_defconfig       |  1 -
 arch/arm/configs/h3600_defconfig        |  3 +-
 arch/arm/configs/hisi_defconfig         |  1 -
 arch/arm/configs/imx_v4_v5_defconfig    |  1 -
 arch/arm/configs/integrator_defconfig   |  2 -
 arch/arm/configs/ixp4xx_defconfig       |  1 -
 arch/arm/configs/jornada720_defconfig   |  3 +-
 arch/arm/configs/keystone_defconfig     |  1 -
 arch/arm/configs/lpc32xx_defconfig      |  1 -
 arch/arm/configs/mmp2_defconfig         |  1 -
 arch/arm/configs/moxart_defconfig       |  2 -
 arch/arm/configs/mps2_defconfig         |  1 -
 arch/arm/configs/multi_v4t_defconfig    |  2 -
 arch/arm/configs/multi_v5_defconfig     | 10 -----
 arch/arm/configs/mv78xx0_defconfig      |  3 +-
 arch/arm/configs/mvebu_v5_defconfig     | 10 -----
 arch/arm/configs/mxs_defconfig          |  1 -
 arch/arm/configs/neponset_defconfig     |  3 ++
 arch/arm/configs/netwinder_defconfig    |  3 ++
 arch/arm/configs/nhk8815_defconfig      |  1 -
 arch/arm/configs/omap1_defconfig        |  3 +-
 arch/arm/configs/orion5x_defconfig      | 11 -----
 arch/arm/configs/pxa168_defconfig       |  2 -
 arch/arm/configs/pxa3xx_defconfig       |  2 -
 arch/arm/configs/pxa910_defconfig       |  2 -
 arch/arm/configs/pxa_defconfig          |  5 ---
 arch/arm/configs/rpc_defconfig          |  3 ++
 arch/arm/configs/s3c6400_defconfig      |  2 +
 arch/arm/configs/sama5_defconfig        |  1 -
 arch/arm/configs/sama7_defconfig        |  1 -
 arch/arm/configs/spear13xx_defconfig    |  1 -
 arch/arm/configs/spitz_defconfig        |  2 +-
 arch/arm/configs/stm32_defconfig        |  1 -
 arch/arm/configs/versatile_defconfig    |  2 -
 arch/arm/configs/vt8500_v6_v7_defconfig |  1 -
 arch/arm/configs/wpcm450_defconfig      |  2 -
 arch/arm/mach-at91/Kconfig              |  4 +-
 arch/arm/mach-axxia/Kconfig             |  4 +-
 arch/arm/mach-dove/Kconfig              |  8 +++-
 arch/arm/mach-footbridge/Kconfig        |  7 ++-
 arch/arm/mach-imx/Kconfig               | 13 ++++--
 arch/arm/mach-mv78xx0/Kconfig           |  4 +-
 arch/arm/mach-omap2/Kconfig             | 18 ++++++--
 arch/arm/mach-orion5x/Kconfig           | 47 ++++++++++++++-----
 arch/arm/mach-pxa/Kconfig               | 10 ++++-
 arch/arm/mach-rpc/Kconfig               |  5 ++-
 arch/arm/mach-s3c/Kconfig.s3c64xx       | 15 +++++--
 arch/arm/mach-sa1100/Kconfig            |  5 ++-
 arch/arm/mach-stm32/Kconfig             | 14 +++---
 arch/arm/mach-versatile/Kconfig         | 15 ++++---
 arch/arm/mm/Kconfig                     | 29 +++++++++++-
 66 files changed, 225 insertions(+), 170 deletions(-)

