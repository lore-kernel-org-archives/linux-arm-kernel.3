Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39497CF34D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 15:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f5/i4rql+FjQbQoKY38GBSzp2uMK+CvI/U8lEjLdiGg=; b=IhFup7D5hkvd5OC1KNjudkcmyC
	H+qJCAK2wEt3/fxyv0llu0b2aa3NQJHdUoWMtJ2XUfqgfni9ERx0OdNl5XIZMaLFqePLurkfdIAui
	v53K3wJ63Ln/9zrN+mW4VK/JdAtGRCUH/rNHuItlMUcOhY4B56gvAZJHNZjpFHP6JUO/FLgkX9pLF
	h1rQYB3H/AkI1DPnQPNPufcsgrKHoR1HgFOKLhdL3aO8DbUdhnJ9fbYCHNyc+mGWdg4UNxT8JekAs
	88cBCTOHMvdgr/+bEmeFqPyMpMaVKFoPpcZlZ+I7zdtuM8xmbMDMeanO/HCMAZ5X93j42qnKLaiC3
	T+pzEjFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkUJ-00000003b92-27bv;
	Wed, 19 Nov 2025 15:52:55 +0000
Received: from fhigh-a4-smtp.messagingengine.com ([103.168.172.155])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkUF-00000003b79-3ko4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 15:52:53 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 559D714000D4;
	Wed, 19 Nov 2025 10:52:43 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Wed, 19 Nov 2025 10:52:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1763567563; x=1763653963; bh=f5
	/i4rql+FjQbQoKY38GBSzp2uMK+CvI/U8lEjLdiGg=; b=qRSM/qo+3pGrsE7y3C
	ur1a6WjAD/pdeHTMOWHo4++VEaIrc4Bsr91+lohM9dtiy5eYVY6+S+0ECLLLXszt
	KVbAfzu59zWoMxTV38GfpE2CBfOU/7nHfT4oUkQ4HRipml4575aCIP5jkqlOcdCW
	eHPC5M3KF3MrH9Y7KIRuL8JNYy30OVNdjYOJQe2Cx2NLRRB7Jgv0WjePmSViZAfJ
	kAHNMUPcSVM7B6IxFA8cR39QXkAU2bA5IdqSgz9+bIlEuqi2+nR0hTetWzHlqMP8
	cV6l8o+WV9lsiRkbcoNDk7VXNBaEVzURYqn5Yf836CVXS+ebWqQFEq/8JxWMdsOt
	04lA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1763567563; x=1763653963; bh=f5/i4rql+FjQbQoKY38GBSzp2uMK
	+CvI/U8lEjLdiGg=; b=kTAHRqBiGikbiQ3oWtEW5TNauxiXXX0C5Zbg1wPnwXf0
	xxHLayJkdl+ucTtyFaxZk0Aw08pZd6C5w7gDhXGxRE7wKAuqP1qE5bio4kACiXhH
	6gXLufepqmvvVlhV+Lpaxj7C4g7WRXxkWBpqLHgykMahXvnPAih+0dgAuDSZwhul
	tkK16R0pYiC7D1vDko+eYJ3LU1W9NyAdVH9ZENjYVpoeUIy6TMd9zmqxu4qnGTLz
	HkdGUG6hfysPMDA/zH9XZVAJZ9SYNKt77nfyaLoEYmo4jFR2psZIEhq/2GHrn8Pc
	jxrasfJDB7NSmgVUhN9b4H8rTx+qNI/mM84zX6jIXQ==
X-ME-Sender: <xms:y-cdaR4INkcOMEHgveo19JjHZETkCpSmrOR83ssDv7Q_QuwoZ6zUqQ>
    <xme:y-cdaZs8gzge5mZWQJLyvGbKn3i9FMIIYsiGgGkFeBhvJaMPtUuKmmo0kN1ZTWBHo
    MWzLq_aCYlDAYWS3hGd6Vm567ppKo1MRVK2MT_cQ0qsFcYLBfjfEKE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvvdegieduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkffutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhguuceu
    vghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnh
    epvdekveeileeileeljeeugeettddthfevgeevvdelueefvefgtdegheegueejjeevnecu
    ffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhithhhuhgsrdgtohhmpdhpvghnghhuth
    hrohhnihigrdguvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeegpdhmohguvg
    epshhmthhpohhuthdprhgtphhtthhopehtohhrvhgrlhgusheslhhinhhugidqfhhouhhn
    uggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlse
    hlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepshhotgeslhhishht
    shdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvg
    hrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:y-cdabmJ6kmI7V3B5r6u3azK60KAly4ihelU3lNm2YGZq5ZF7dvNEw>
    <xmx:y-cdaVvAUbB2Vt2Ki_q5sJ3_HYb0QXL54nUZi0iukmEuGKTosLZvPQ>
    <xmx:y-cdaZ87l2Z3pjlzdOLqgvYCkwh3oDuyQkFg7s5goyzlUudfNaoSAw>
    <xmx:y-cdafNmKuxn3WIjYgg1T-16_5dZgHIiHNPWm11nVW-GXaHaLZ-NyA>
    <xmx:y-cdaU8vuMC-Oe4en8STuUAt2emsGVYdp0YkXTRlE8IiMLr7ev4Zp3DV>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 09A7A700063; Wed, 19 Nov 2025 10:52:43 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AYSN-mHI4Zyw
Date: Wed, 19 Nov 2025 16:52:21 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Message-Id: <fd25cb51-ae6b-4c03-9215-c3285f7533e0@app.fastmail.com>
Subject: [GIT PULL] soc: fixes for 6.18, part 3
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_075252_419095_FCEEB124 
X-CRM114-Status: GOOD (  12.75  )
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

The following changes since commit e9a6fb0bcdd7609be6969112f3fbfcce3b1d4=
a7c:

  Linux 6.18-rc5 (2025-11-09 15:10:19 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-f=
ixes-6.18-3

for you to fetch changes up to 7a601324ac9828468291151d220edb47a6a82449:

  MAINTAINERS: sync omap devicetree maintainers with omap platform (2025=
-11-18 22:46:13 +0100)

----------------------------------------------------------------
soc: fixes for 6.18, part 3

These are mainly devicetree fixes for the arm platforms from Rockchips
NXP, ASpeed and Broadcom, addressing issues with accidental overclocking,
pinctrl, network and dtc warnings.

There are additional fixes for regressions with the i.MX reset and memory
controller drivers as well as the Tegra memory controller driver

Minor updates to the MAINTAINERS file, tee documentation and defconfigs
bring those up to date with recent changes elsewhere.

----------------------------------------------------------------
Aaron Kling (1):
      memory: tegra210: Fix incorrect client ids

Alexey Charkov (1):
      arm64: dts: rockchip: Remove non-functioning CPU OPPs from RK3576

Anand Moon (1):
      arm64: dts: rockchip: Set correct pinctrl for I2S1 8ch TX on odroi=
d-m1

Andrea della Porta (1):
      arm64: dts: broadcom: Assign clock rates in eth node for RPi5

Andreas Kemnade (2):
      arm: imx_v6_v7_defconfig: enable ext4 directly
      MAINTAINERS: sync omap devicetree maintainers with omap platform

Andrey Leonchikov (2):
      arm64: dts: rockchip: Fix PCIe power enable pin for BigTreeTech CB=
2 and Pi2
      arm64: dts: rockchip: Fix USB power enable pin for BTT CB2 and Pi2

Arnd Bergmann (10):
      Merge tag 'tegra-for-6.18-arm64-dt-fixes' of git://git.kernel.org/=
pub/scm/linux/kernel/git/tegra/linux into arm/fixes
      Merge tag 'aspeed-6.18-fixes-0' of https://git.kernel.org/pub/scm/=
linux/kernel/git/bmc/linux into arm/fixes
      Merge tag 'memory-controller-drv-fixes-6.18' of https://git.kernel=
.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl into arm/fixes
      Merge tag 'imx-fixes-6.18' of https://git.kernel.org/pub/scm/linux=
/kernel/git/shawnguo/linux into arm/fixes
      Merge tag 'arm-soc/for-6.18/defconfig-arm64-fixes' of https://gith=
ub.com/Broadcom/stblinux into arm/fixes
      Merge tag 'arm-soc/for-6.18/devicetree-fixes-part2' of https://git=
hub.com/Broadcom/stblinux into arm/fixes
      Merge tag 'reset-fixes-for-v6.18' of https://git.pengutronix.de/gi=
t/pza/linux into arm/fixes
      Merge tag 'arm-soc/for-6.18/devicetree-arm64-fixes-v2' of https://=
github.com/Broadcom/stblinux into arm/fixes
      Merge tag 'tee-fix-for-v6.18' of git://git.kernel.org/pub/scm/linu=
x/kernel/git/jenswi/linux-tee into arm/fixes
      Merge tag 'v6.18-rockchip-dtsfixes1' of git://git.kernel.org/pub/s=
cm/linux/kernel/git/mmind/linux-rockchip into arm/fixes

Chukun Pan (1):
      arm64: dts: rockchip: drop reset from rk3576 i2c9 node

Dario Binacchi (1):
      ARM: dts: imx6ull-engicam-microgea-rmm: fix report-rate-hz value

Diederik de Haas (2):
      arm64: dts: rockchip: Drop 'rockchip,grf' prop from tsadc on rk3328
      arm64: dts: rockchip: Fix vccio4-supply on rk3566-pinetab2

Dragan Simic (1):
      arm64: dts: rockchip: Make RK3588 GPU OPP table naming less generic

Frank Li (1):
      arm64: dts: imx95: Fix MSI mapping for PCIe endpoint nodes

Frieder Schrempf (1):
      arm64: dts: imx8mp-kontron: Fix USB OTG role switching

Heiko Stuebner (1):
      arm64: dts: rockchip: Fix indentation on rk3399 haikou demo dtso

Jihed Chaibi (1):
      ARM: dts: imx51-zii-rdu1: Fix audmux node names

Jo=C3=A3o Paulo Gon=C3=A7alves (1):
      arm64: dts: imx8-ss-img: Avoid gpio0_mipi_csi GPIOs being deferred

Krzysztof Kozlowski (1):
      MAINTAINERS: Update Krzysztof Kozlowski's email

Laurent Pinchart (1):
      arm64: dts: broadcom: bcm2712: rpi-5: Add ethernet0 alias

Laurentiu Mihalcea (1):
      reset: imx8mp-audiomix: Fix bad mask values

Mykola Kvach (1):
      arm64: dts: rockchip: fix PCIe 3.3V regulator voltage on orangepi-5

Quentin Schulz (2):
      arm64: dts: rockchip: include rk3399-base instead of rk3399 in rk3=
399-op1
      arm64: dts: rockchip: disable HS400 on RK3588 Tiger

Rafa=C5=82 Mi=C5=82ecki (1):
      ARM: dts: BCM53573: Fix address of Luxul XAP-1440's Ethernet PHY

Randy Dunlap (1):
      tee: <uapi/linux/tee.h: fix all kernel-doc issues

Russell King (Oracle) (1):
      arm64: tegra: Mark Jetson Xavier NX's PHY as a wakeup source

Stefan Wahren (1):
      arm64: defconfig: Fix V3D deferred probe timeout

Tao Ren (1):
      ARM: dts: aspeed: fuji-data64: Enable mac3 controller

 .mailmap                                           |  1 +
 MAINTAINERS                                        |  8 ++++++--
 .../dts/aspeed/aspeed-bmc-facebook-fuji-data64.dts | 14 +++++++++++++
 .../boot/dts/broadcom/bcm47189-luxul-xap-1440.dts  |  4 ++--
 arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dts       |  4 ++--
 .../dts/nxp/imx/imx6ull-engicam-microgea-rmm.dts   |  2 +-
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts   | 10 +++++++++
 arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi     |  2 --
 .../boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts | 24 +++++++++++++++=
++-----
 arch/arm64/boot/dts/freescale/imx95.dtsi           |  3 ++-
 arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi     |  1 +
 arch/arm64/boot/dts/rockchip/rk3328.dtsi           |  1 -
 arch/arm64/boot/dts/rockchip/rk3399-op1.dtsi       |  2 +-
 .../rockchip/rk3399-puma-haikou-video-demo.dtso    | 10 ++++-----
 .../boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi  |  6 +++---
 arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi  |  2 +-
 arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts  |  2 ++
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           | 14 -------------
 arch/arm64/boot/dts/rockchip/rk3588-opp.dtsi       |  2 +-
 arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi     |  4 +---
 arch/arm64/boot/dts/rockchip/rk3588j.dtsi          |  2 +-
 .../arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts |  4 ++--
 arch/arm64/configs/defconfig                       |  2 +-
 drivers/memory/tegra/tegra210.c                    |  4 ++--
 drivers/reset/reset-imx8mp-audiomix.c              |  4 ++--
 include/uapi/linux/tee.h                           | 23 +++++++++++++--=
------
 26 files changed, 94 insertions(+), 61 deletions(-)

