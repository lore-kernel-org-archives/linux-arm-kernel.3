Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A71D6F9937D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 12:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uj5xTZ6galz279yNDe1TIEDf7Fjy7+oQ5sGqyTIdoqY=; b=xhHpLF0vS19AxoGN6FmdmaZfMB
	i9+2P+9qMA4swaC71ziGXh9ha8knBAHz3muyt8x4MQ/PLQjavoJjGQg7rkM5C9NXli8In8FBZD+dE
	Qtz4L+9fe++1ejDDBYYE22O5+C70mJF8vuJWmiXLDOJpyLT6r29ZLeOCIKIt/J873SSVzCvQfW9G7
	I3SL+BIQm9ol5Rakftov1lbeBXSzBJNZNzdLiLuim67FMx/H5LI7V6fH8TygoDZ8Fl/L36B/dNVhP
	VtQlpnPneOErWSDKLFsW0JlZ4a8tZayNdNX658xnjrayLMZYM/2UV0goaHNeaq6B9zInG4JrCIq1V
	2Jom+6AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFsjj-0000000BZsp-1wwE;
	Thu, 23 Apr 2026 12:00:51 +0000
Received: from fout-b5-smtp.messagingengine.com ([202.12.124.148])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFsje-0000000BZsS-11og
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 12:00:50 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id AFAA21D0012B;
	Thu, 23 Apr 2026 08:00:44 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Thu, 23 Apr 2026 08:00:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1776945644; x=1777032044; bh=uj
	5xTZ6galz279yNDe1TIEDf7Fjy7+oQ5sGqyTIdoqY=; b=AkImuPGIcs306m2y5M
	3b0AVCswxC0PeaKMIKE65EjbAHYzSqf2CVHZHBOo6mB4IJuxFFO7b6XNPKQ1/63v
	SsT2eb4YmLvbkPqurLPaWHgAWlUvij085M0LTVWORAJ2hU0EPMT5+P2Su+10CEaa
	TKDXXvcWuDgSjK7L6cjt9pVwGd9mN7HOsNsgV4eNPAHp/cnEycnvvEkckxwi4mPC
	8IMaUFZRB7oG9xIRwsvb0FGujhH8Ejz0D4eQTkiRx1KSz9MYOu2I4w7AMHs4KlAk
	xpNh1Z7Q6NlUEUrHFPZS6F30INXPBmljPcvyDa6u0QneJB5+YkKRqUqSL4tOn8jn
	3nUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1776945644; x=1777032044; bh=uj5xTZ6galz279yNDe1TIEDf7Fjy
	7+oQ5sGqyTIdoqY=; b=pzys0XsvTrXlulC6oMJYfPmtBS3YEX7WjnEXs6autzc3
	SNxhfCjNYu50YSSqkYo1P+xylw7xR0KqsDEcMXb1MCzs153/Gwee6Y0bWx0ANG4+
	SxVcXzvo3V/t/uU6VvKDUcYfuPw+2fBHKXYBFLc8FQEhX5b+QsBV67IGwhbs2hOH
	TscGZPRUAU87D6/67BjL1Fq1oCOBWKI99V4z+AL6oV+yyS27ShUzg6tPB9dlmNzB
	WxB/duyUm2Puq69ldI3WGKC/vvt7Jo6etlRxHB8zRNWaLXp0SOY7Db+73C9MEyBU
	Y6+EiKKlKq6AMk9PINuz4utpWy4LLJrXm7vrO7G8Aw==
X-ME-Sender: <xms:6wnqaQbrkH1hSbchJJxqHutUQe4hXH0dK9n7lP-zRdkRVeILZwPKjQ>
    <xme:6wnqaWNJ8mL43OWDxa9RuTwXPK9cK9jR9UDs3sTjNCD-jmKjlRn2zBM1zPJflbyId
    VcUm1RNo8XYEkajc_XIPMXh81ZKgpV-tCnHYpOpubeOBI5_0CVrukg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeijedtlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcuuegv
    rhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrhhnpe
    eftdduledthfffheettdeivdeiudduveekgeetkeeikedvhfekuddtheevfedvieenucff
    ohhmrghinhepkhgvrhhnvghlrdhorhhgpdhfrhgrnhhkrdhlihdpphgvnhhguhhtrhhonh
    higidruggvpdguvghvihgtvghtrhgvvgdrohhrghenucevlhhushhtvghrufhiiigvpedt
    necurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprh
    gtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehtohhrvhgrlhgu
    sheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugi
    dqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghp
    thhtohepshhotgeslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuh
    igqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:6wnqaaEAOeghQElWl-y7rf2cCWhsJ2tCVRDePs_yD3YRQcNieDsFLA>
    <xmx:7AnqaSPRbmTsqcA-nK3nRy6SPLR46TP7xpT36mwcWgh4oXK2pmoJ6A>
    <xmx:7AnqaccQaxyLQ8ktp60Yvvspr_1Lvx3iB2qE6AV4ieOfRt-hT0yvow>
    <xmx:7AnqafsYvtmD4OLL1OabcLfBPILgyWqYmk3lfCVFiRiEcCEaJDbtuw>
    <xmx:7AnqaZfuvEU9M6NUo6aP37Fei4sKpmRR90cEChG2kLGh8qx_CCui-J2l>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D84F1700065; Thu, 23 Apr 2026 08:00:43 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Thu, 23 Apr 2026 14:00:43 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Message-Id: <61d255e9-84eb-460e-afc3-0405c9363524@app.fastmail.com>
Subject: [GIT PULL] soc: late changes for 7.1
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_050046_692412_1551ADC4 
X-CRM114-Status: GOOD (  14.97  )
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

The following changes since commit 8242c709d4ba858c483ef7ef3cc2dc1280f5383c:

  Merge tag 'soc-arm-7.1' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc (2026-04-16 20:45:14 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc-late-7.1

for you to fetch changes up to dd5dc1917473f398949b95f6b77c60d4d8eb1d97:

  Merge tag 'amlogic-fixes-v7.1-rc' of https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux into soc/late2 (2026-04-23 10:02:27 +0200)

----------------------------------------------------------------
soc: late changes for 7.1

These are the contents that arrived during the easter vacation and didn't
make it into the last 7.0 bugfixes or the first set of branches for the
merge window. Aside from a reset controller bugfix and an update to the
MAINTAINERS entry, this is all devicetree changes.

The Marvell devicetree updates contain the usual minor updates and bugfixes,
along with a two larger but trivial patches to drop unused dtsi files,
the single broadcom fix addresses a build time warning introduced during
the merge window.

The freescale, amlogic, and apple changes missed the last fixes branch
for 7.0.

----------------------------------------------------------------
Anand Moon (1):
      arm64: dts: amlogic: meson-axg: Add missing cache information to cpu0

Arnd Bergmann (5):
      Merge branch 'arm/fixes' into soc/late2
      Merge tag 'mvebu-dt64-7.1-1' of https://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu into soc/late2
      ARM: dts: bcm4709: fix bus range assignment
      Merge tag 'apple-soc-fixes-7.0' of https://git.kernel.org/pub/scm/linux/kernel/git/sven/linux into soc/late2
      Merge tag 'amlogic-fixes-v7.1-rc' of https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux into soc/late2

Axel Flordal (1):
      arm64: dts: apple: Fix spelling error

Elad Nachman (3):
      arm64: dts: a7k: use phy handle
      dt-bindings: arm64: add Marvell 7k COMe boards
      dt-bindings: arm64: add Marvell 7k COMe boards

Gabor Juhos (6):
      arm64: dts: marvell: armada-3720: drop 'marvell,xenon-emmc' properties
      arm64: dts: marvell: armada-37xx: align 'phy-names' of EHCI node with DT schema
      arm64: dts: marvell: armada-37xx: drop redundant status property
      arm64: dts: marvell: armada-37xx: drop 'marvell,usb-misc-reg' from USB host nodes
      arm64: dts: marvell: armada-37xx: use 'usb2-phy' in USB3 controller's phy-names
      arm64: dts: marvell: armada-37xx: swap PHYs' order in USB3 controller node

Geert Uytterhoeven (1):
      arm64: dts: amlogic: s6: Drop CPU masks from GICv3 PPI interrupts

Jun Yan (1):
      arm64: dts: meson-gxl-p230: fix ethernet PHY interrupt number

Krzysztof Kozlowski (5):
      Merge tag 'imx-fixes-7.0-2nd' of https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux into arm/fixes
      Merge tag 'reset-fixes-for-v7.0-3' of https://git.pengutronix.de/git/pza/linux into arm/fixes
      Merge tag 'mvebu-fixes-7.0-1' of https://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu into arm/fixes
      Documentation/process: maintainer-soc: Trim from trivial ask-DT
      Documentation/process: maintainer-soc: Document purpose of defconfigs

Nick Xie (2):
      arm64: dts: amlogic: t7: khadas-vim4: fix memory layout for 8GB RAM
      arm64: dts: amlogic: t7: khadas-vim4: fix board model name

Peng Fan (14):
      arm64: dts: imx8mp-debix-model-a: Correct PAD settings for PMIC_nINT
      arm64: dts: imx8mp-debix-som-a: Correct PAD settings for PMIC_nINT
      arm64: dts: imx8mp-navqp: Correct PAD settings for PMIC_nINT
      arm64: dts: imx8mp-icore-mx8mp: Correct PAD settings for PMIC_nINT
      arm64: dts: imx8mp-edm-g: Correct PAD settings for PMIC_nINT
      arm64: dts: imx8mp-aristainetos3a-som-v1: Correct PAD settings for PMIC_nINT
      arm64: dts: imx8mp-nitrogen-som: Correct PAD settings for PMIC_nINT
      arm64: dts: imx8mp-sr-som: Correct PAD settings for PMIC_nINT
      arm64: dts: imx8mp-ultra-mach-sbc: Correct PAD settings for PMIC_nINT
      arm64: dts: imx8mp-dhcom-som: Correct PAD settings for PMIC_nINT
      arm64: dts: imx8mp-data-modul-edm-sbc: Correct PAD settings for PMIC_nINT
      arm64: dts: imx8mm-emtop-som: Correct PAD settings for PMIC_nINT
      arm64: dts: imx8mn-tqma8mqnl: Correct PAD settings for PMIC_nINT
      arm64: dts: imx8mm-tqma8mqml: Correct PAD settings for PMIC_nINT

Rob Herring (Arm) (1):
      arm/arm64: dts: marvell: Drop unused .dtsi

Robert Marko (1):
      arm64: dts: marvell: uDPU: add ethernet aliases

Ronald Claveau (2):
      reset: amlogic: t7: Fix null reset ops
      arm64: dts: amlogic: Fix GIC register ranges for Amlogic T7

Sasha Finkelstein (2):
      mailmap: Update Sasha Finkelstein's email address
      dt-bindings: Update Sasha Finkelstein's email address

 .mailmap                                           |   1 +
 .../bindings/arm/marvell/armada-7k-8k.yaml         |  11 ++
 .../display/apple,h7-display-pipe-mipi.yaml        |   2 +-
 .../bindings/display/apple,h7-display-pipe.yaml    |   2 +-
 .../bindings/display/panel/apple,summit.yaml       |   2 +-
 .../devicetree/bindings/gpu/apple,agx.yaml         |   2 +-
 .../input/touchscreen/apple,z2-multitouch.yaml     |   2 +-
 .../bindings/nvmem/apple,spmi-nvmem.yaml           |   2 +-
 .../devicetree/bindings/pwm/apple,s5l-fpwm.yaml    |   2 +-
 .../devicetree/bindings/spmi/apple,spmi.yaml       |   2 +-
 Documentation/process/maintainer-soc.rst           |  12 +-
 MAINTAINERS                                        |   2 +-
 .../boot/dts/broadcom/bcm4709-netgear-r8000.dts    |   1 -
 arch/arm/boot/dts/marvell/armada-380.dtsi          | 148 ---------------------
 arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi        |  10 +-
 .../dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts  |   6 +-
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi        |   4 +-
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi         |   6 +
 .../boot/dts/amlogic/meson-gxl-s905d-p230.dts      |   3 +-
 arch/arm64/boot/dts/apple/spi1-nvram.dtsi          |   2 +-
 .../arm64/boot/dts/freescale/imx8mm-emtop-som.dtsi |   4 +-
 .../arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi |   2 +-
 .../arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi |   2 +-
 .../freescale/imx8mp-aristainetos3a-som-v1.dtsi    |   2 +-
 .../dts/freescale/imx8mp-data-modul-edm-sbc.dts    |   2 +-
 .../boot/dts/freescale/imx8mp-debix-model-a.dts    |   2 +-
 .../dts/freescale/imx8mp-debix-som-a-bmb-08.dts    |   2 +-
 .../boot/dts/freescale/imx8mp-debix-som-a.dtsi     |   2 +-
 .../arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi |   2 +-
 arch/arm64/boot/dts/freescale/imx8mp-edm-g.dtsi    |   2 +-
 .../boot/dts/freescale/imx8mp-icore-mx8mp.dtsi     |   2 +-
 arch/arm64/boot/dts/freescale/imx8mp-navqp.dts     |   2 +-
 .../boot/dts/freescale/imx8mp-nitrogen-som.dtsi    |   2 +-
 arch/arm64/boot/dts/freescale/imx8mp-sr-som.dtsi   |   4 +-
 .../boot/dts/freescale/imx8mp-ultra-mach-sbc.dts   |   4 +-
 .../boot/dts/marvell/armada-3720-atlas-v5.dts      |   1 -
 .../boot/dts/marvell/armada-3720-espressobin.dtsi  |   1 -
 arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtsi  |   7 +-
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi       |   9 +-
 .../boot/dts/marvell/armada-7020-comexpress.dtsi   |   2 +-
 arch/arm64/boot/dts/marvell/armada-8020.dtsi       |  20 ---
 .../boot/dts/marvell/cn9130-db-comexpress.dtsi     |  96 -------------
 drivers/reset/amlogic/reset-meson.c                |   1 +
 43 files changed, 81 insertions(+), 314 deletions(-)
 delete mode 100644 arch/arm/boot/dts/marvell/armada-380.dtsi
 delete mode 100644 arch/arm64/boot/dts/marvell/armada-8020.dtsi
 delete mode 100644 arch/arm64/boot/dts/marvell/cn9130-db-comexpress.dtsi


diff --git a/.mailmap b/.mailmap
index 7d6fb567ba5e..74cc837befef 100644
--- a/.mailmap
+++ b/.mailmap
@@ -741,6 +741,7 @@ Sarangdhar Joshi <spjoshi@codeaurora.org>
 Saravana Kannan <saravanak@kernel.org> <skannan@codeaurora.org>
 Saravana Kannan <saravanak@kernel.org> <saravanak@google.com>
 Sascha Hauer <s.hauer@pengutronix.de>
+Sasha Finkelstein <k@chaosmail.tech> <fnkl.kernel@gmail.com>
 Sahitya Tummala <quic_stummala@quicinc.com> <stummala@codeaurora.org>
 Sathishkumar Muruganandam <quic_murugana@quicinc.com> <murugana@codeaurora.org>
 Satya Priya <quic_skakitap@quicinc.com> <quic_c_skakit@quicinc.com> <skakit@codeaurora.org>
diff --git a/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml b/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml
index 4bc7454a5d3a..7e77310da626 100644
--- a/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml
+++ b/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml
@@ -21,6 +21,17 @@ properties:
           - const: marvell,armada-ap806-dual
           - const: marvell,armada-ap806
 
+      - description:
+          Falcon (DB-98CX85x0) Development board COM Express Carrier plus
+          Armada 7020 SoC COM Express CPU module
+        items:
+          - const: marvell,armada7020-falcon-carrier
+          - const: marvell,db-falcon-carrier
+          - const: marvell,armada7020-cpu-module
+          - const: marvell,armada7020
+          - const: marvell,armada-ap806-dual
+          - const: marvell,armada-ap806
+
       - description: Armada 7040 SoC
         items:
           - enum:
diff --git a/Documentation/devicetree/bindings/display/apple,h7-display-pipe-mipi.yaml b/Documentation/devicetree/bindings/display/apple,h7-display-pipe-mipi.yaml
index 5e6da66499a5..d7c822df8a94 100644
--- a/Documentation/devicetree/bindings/display/apple,h7-display-pipe-mipi.yaml
+++ b/Documentation/devicetree/bindings/display/apple,h7-display-pipe-mipi.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Apple pre-DCP display controller MIPI interface
 
 maintainers:
-  - Sasha Finkelstein <fnkl.kernel@gmail.com>
+  - Sasha Finkelstein <k@chaosmail.tech>
 
 description:
   The MIPI controller part of the pre-DCP Apple display controller
diff --git a/Documentation/devicetree/bindings/display/apple,h7-display-pipe.yaml b/Documentation/devicetree/bindings/display/apple,h7-display-pipe.yaml
index 102fb1804c0c..571fa32db2cf 100644
--- a/Documentation/devicetree/bindings/display/apple,h7-display-pipe.yaml
+++ b/Documentation/devicetree/bindings/display/apple,h7-display-pipe.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Apple pre-DCP display controller
 
 maintainers:
-  - Sasha Finkelstein <fnkl.kernel@gmail.com>
+  - Sasha Finkelstein <k@chaosmail.tech>
 
 description:
   A secondary display controller used to drive the "touchbar" on
diff --git a/Documentation/devicetree/bindings/display/panel/apple,summit.yaml b/Documentation/devicetree/bindings/display/panel/apple,summit.yaml
index f081755325e9..1c1ba59467f3 100644
--- a/Documentation/devicetree/bindings/display/panel/apple,summit.yaml
+++ b/Documentation/devicetree/bindings/display/panel/apple,summit.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Apple "Summit" display panel
 
 maintainers:
-  - Sasha Finkelstein <fnkl.kernel@gmail.com>
+  - Sasha Finkelstein <k@chaosmail.tech>
 
 description:
   An OLED panel used as a touchbar on certain Apple laptops.
diff --git a/Documentation/devicetree/bindings/gpu/apple,agx.yaml b/Documentation/devicetree/bindings/gpu/apple,agx.yaml
index 05af942ad174..59989d8bd1cb 100644
--- a/Documentation/devicetree/bindings/gpu/apple,agx.yaml
+++ b/Documentation/devicetree/bindings/gpu/apple,agx.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Apple SoC GPU
 
 maintainers:
-  - Sasha Finkelstein <fnkl.kernel@gmail.com>
+  - Sasha Finkelstein <k@chaosmail.tech>
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/input/touchscreen/apple,z2-multitouch.yaml b/Documentation/devicetree/bindings/input/touchscreen/apple,z2-multitouch.yaml
index 402ca6bffd34..44158e89e818 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/apple,z2-multitouch.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/apple,z2-multitouch.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Apple touchscreens attached using the Z2 protocol
 
 maintainers:
-  - Sasha Finkelstein <fnkl.kernel@gmail.com>
+  - Sasha Finkelstein <k@chaosmail.tech>
 
 description: A series of touschscreen controllers used in Apple products
 
diff --git a/Documentation/devicetree/bindings/nvmem/apple,spmi-nvmem.yaml b/Documentation/devicetree/bindings/nvmem/apple,spmi-nvmem.yaml
index 80b5a6cdcec9..4ca75ed07a54 100644
--- a/Documentation/devicetree/bindings/nvmem/apple,spmi-nvmem.yaml
+++ b/Documentation/devicetree/bindings/nvmem/apple,spmi-nvmem.yaml
@@ -9,7 +9,7 @@ title: Apple SPMI NVMEM
 description: Exports a series of SPMI registers as NVMEM cells
 
 maintainers:
-  - Sasha Finkelstein <fnkl.kernel@gmail.com>
+  - Sasha Finkelstein <k@chaosmail.tech>
 
 allOf:
   - $ref: nvmem.yaml#
diff --git a/Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml b/Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
index 04519b0c581d..d8f4f9ffe884 100644
--- a/Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
@@ -8,7 +8,7 @@ title: Apple FPWM controller
 
 maintainers:
   - asahi@lists.linux.dev
-  - Sasha Finkelstein <fnkl.kernel@gmail.com>
+  - Sasha Finkelstein <k@chaosmail.tech>
 
 description: PWM controller used for keyboard backlight on ARM Macs
 
diff --git a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
index ba524f1eb704..3e5b14bc8c31 100644
--- a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
+++ b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Apple SPMI controller
 
 maintainers:
-  - Sasha Finkelstein <fnkl.kernel@gmail.com>
+  - Sasha Finkelstein <k@chaosmail.tech>
 
 description: A SPMI controller present on most Apple SoCs
 
diff --git a/Documentation/process/maintainer-soc.rst b/Documentation/process/maintainer-soc.rst
index 7d6bad989ad8..a3a90a7d4c68 100644
--- a/Documentation/process/maintainer-soc.rst
+++ b/Documentation/process/maintainer-soc.rst
@@ -169,8 +169,6 @@ more information on the validation of devicetrees.
 For new platforms, or additions to existing ones, ``make dtbs_check`` should not
 add any new warnings.  For RISC-V and Samsung SoC, ``make dtbs_check W=1`` is
 required to not add any new warnings.
-If in any doubt about a devicetree change, reach out to the devicetree
-maintainers.
 
 Branches and Pull Requests
 ~~~~~~~~~~~~~~~~~~~~~~~~~~
@@ -209,3 +207,13 @@ The subject line of a pull request should begin with "[GIT PULL]" and made using
 a signed tag, rather than a branch.  This tag should contain a short description
 summarising the changes in the pull request.  For more detail on sending pull
 requests, please see Documentation/maintainer/pull-requests.rst.
+
+Defconfigs purpose
+~~~~~~~~~~~~~~~~~~
+
+Defconfigs are primarily used by the kernel developers, because distros have
+their own configs.  A change adding new CONFIG options to a defconfig should
+explain why the kernel developers in general would want such option, e.g. by
+providing a name of an upstream-supported machine/board using that new option.
+This implies that enabling options in defconfig for non-upstream machines shall
+not be accepted.
diff --git a/MAINTAINERS b/MAINTAINERS
index d41dc26280b1..71f6968fa695 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8691,7 +8691,7 @@ F:	include/linux/host1x.h
 F:	include/uapi/drm/tegra_drm.h
 
 DRM DRIVERS FOR PRE-DCP APPLE DISPLAY OUTPUT
-M:	Sasha Finkelstein <fnkl.kernel@gmail.com>
+M:	Sasha Finkelstein <k@chaosmail.tech>
 R:	Janne Grunau <j@jannau.net>
 L:	dri-devel@lists.freedesktop.org
 L:	asahi@lists.linux.dev
diff --git a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts b/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts
index d170c71cbd76..e85693fba16a 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts
@@ -139,7 +139,6 @@ &pcie_bridge1 {
 	pcie@0,0 {
 		device_type = "pci";
 		reg = <0x0000 0 0 0 0>;
-		bus-range = <0x01 0xff>;
 
 		#address-cells = <3>;
 		#size-cells = <2>;
diff --git a/arch/arm/boot/dts/marvell/armada-380.dtsi b/arch/arm/boot/dts/marvell/armada-380.dtsi
deleted file mode 100644
index e94f22b0e9b5..000000000000
diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi
index 8ef631939033..ab3acef2b147 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi
@@ -53,10 +53,10 @@ pwrc: power-controller {
 
 	timer {
 		compatible = "arm,armv8-timer";
-		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
-			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
-			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
-			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
 	};
 
 	psci {
@@ -84,7 +84,7 @@ gic: interrupt-controller@ff200000 {
 			interrupt-controller;
 			reg = <0x0 0xff200000 0 0x10000>,
 			      <0x0 0xff240000 0 0x80000>;
-			interrupts = <GIC_PPI 9 0xf04>;
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
 		apb: bus@fe000000 {
diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index fffdab96b12e..f4c953034be3 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -8,7 +8,7 @@
 #include "amlogic-t7.dtsi"
 
 / {
-	model = "Khadas vim4";
+	model = "Khadas VIM4";
 	compatible = "khadas,vim4", "amlogic,a311d2", "amlogic,t7";
 
 	aliases {
@@ -17,7 +17,9 @@ aliases {
 
 	memory@0 {
 		device_type = "memory";
-		reg = <0x0 0x0 0x2 0x0>; /* 8 GB */
+		reg = <0x0 0x0 0x0 0xE0000000
+			0x1 0x0 0x0 0xE0000000
+			0x2 0x0 0x0 0x40000000>; /* 8 GB */
 	};
 
 	reserved-memory {
diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 6510068bcff9..d523cbc0ed22 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -213,7 +213,9 @@ gic: interrupt-controller@fff01000 {
 			#address-cells = <0>;
 			interrupt-controller;
 			reg = <0x0 0xfff01000 0 0x1000>,
-			      <0x0 0xfff02000 0 0x0100>;
+			      <0x0 0xfff02000 0 0x2000>,
+			      <0x0 0xfff04000 0 0x2000>,
+			      <0x0 0xfff06000 0 0x2000>;
 			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
 		};
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index cc72491eaf6f..f1f53fd98ae2 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -72,6 +72,12 @@ cpu0: cpu@0 {
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
 			next-level-cache = <&l2>;
 			clocks = <&scpi_dvfs 0>;
 			dynamic-power-coefficient = <140>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts
index 7dffeb5931c9..701de57ff0f3 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts
@@ -84,7 +84,8 @@ external_phy: ethernet-phy@0 {
 		reset-gpios = <&gpio GPIOZ_14 GPIO_ACTIVE_LOW>;
 
 		interrupt-parent = <&gpio_intc>;
-		interrupts = <29 IRQ_TYPE_LEVEL_LOW>;
+		/* MAC_INTR on GPIOZ_15 */
+		interrupts = <25 IRQ_TYPE_LEVEL_LOW>;
 		eee-broken-1000t;
 	};
 };
diff --git a/arch/arm64/boot/dts/apple/spi1-nvram.dtsi b/arch/arm64/boot/dts/apple/spi1-nvram.dtsi
index 9740fbf200f0..d2720b307774 100644
--- a/arch/arm64/boot/dts/apple/spi1-nvram.dtsi
+++ b/arch/arm64/boot/dts/apple/spi1-nvram.dtsi
@@ -2,7 +2,7 @@
 //
 // Devicetree include for common spi-nor nvram flash.
 //
-// Apple uses a consistent configiguration for the nvram on all known M1* and
+// Apple uses a consistent configuration for the nvram on all known M1* and
 // M2* devices.
 //
 // Copyright The Asahi Linux Contributors
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-emtop-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-emtop-som.dtsi
index 67d22d3768aa..507d1824d99d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-emtop-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-emtop-som.dtsi
@@ -60,7 +60,7 @@ pmic@25 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_pmic>;
 		interrupt-parent = <&gpio1>;
-		interrupts = <3 IRQ_TYPE_EDGE_RISING>;
+		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
 
 		regulators {
 			buck1: BUCK1 {
@@ -194,7 +194,7 @@ MX8MM_IOMUXC_I2C1_SDA_I2C1_SDA				0x400001c3
 
 	pinctrl_pmic: emtop-pmic-grp {
 		fsl,pins = <
-			MX8MM_IOMUXC_GPIO1_IO03_GPIO1_IO3			0x41
+			MX8MM_IOMUXC_GPIO1_IO03_GPIO1_IO3			0x141
 		>;
 	};
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi
index 29b298af0d73..1b5ba3c47164 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi
@@ -292,7 +292,7 @@ pinctrl_i2c1_gpio: i2c1gpiogrp {
 	};
 
 	pinctrl_pmic: pmicgrp {
-		fsl,pins = <MX8MM_IOMUXC_GPIO1_IO08_GPIO1_IO8		0x94>;
+		fsl,pins = <MX8MM_IOMUXC_GPIO1_IO08_GPIO1_IO8		0x1d4>;
 	};
 
 	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi
index 31a3ca137e63..48a687926aa1 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi
@@ -283,7 +283,7 @@ pinctrl_i2c1_gpio: i2c1gpiogrp {
 	};
 
 	pinctrl_pmic: pmicgrp {
-		fsl,pins = <MX8MN_IOMUXC_GPIO1_IO08_GPIO1_IO8	0x84>;
+		fsl,pins = <MX8MN_IOMUXC_GPIO1_IO08_GPIO1_IO8	0x1c4>;
 	};
 
 	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi
index f654d866e58c..e7666e54310b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi
@@ -903,7 +903,7 @@ MX8MP_IOMUXC_SAI1_MCLK__GPIO4_IO20	0x41
 
 	pinctrl_pmic: aristainetos3-pmic-grp {
 		fsl,pins = <
-			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03	0x41
+			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03	0x1c0
 		>;
 	};
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts
index 7e46537a22a0..cb28cf1cdd23 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts
@@ -1001,7 +1001,7 @@ MX8MP_IOMUXC_SAI3_RXFS__AUDIOMIX_PDM_BIT_STREAM00	0x0
 	pinctrl_pmic: pmic-grp {
 		fsl,pins = <
 			/* PMIC_nINT */
-			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03		0x40000090
+			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03		0x1c0
 		>;
 	};
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts b/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
index 9422beee30b2..201cf7f5eb0e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
@@ -440,7 +440,7 @@ MX8MP_IOMUXC_SAI5_RXC__I2C6_SDA					0x400001c3
 
 	pinctrl_pmic: pmicirqgrp {
 		fsl,pins = <
-			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03				0x41
+			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03				0x1c0
 		>;
 	};
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dts b/arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dts
index 04619a722906..1471ff361b54 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dts
@@ -499,7 +499,7 @@ MX8MP_IOMUXC_SAI1_RXD1__GPIO4_IO03		0x140
 
 	pinctrl_pmic: pmicgrp {
 		fsl,pins = <
-			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03		0x41
+			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03		0x1c0
 		>;
 	};
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-debix-som-a.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-debix-som-a.dtsi
index 91094c227744..b31e8fe95ca7 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-debix-som-a.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-debix-som-a.dtsi
@@ -241,7 +241,7 @@ MX8MP_IOMUXC_I2C4_SDA__I2C4_SDA			0x400001c3
 
 	pinctrl_pmic: pmicgrp {
 		fsl,pins = <
-			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03		0x41
+			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03		0x1c0
 		>;
 	};
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi
index f8303b7e2bd2..0a6a60670f76 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi
@@ -989,7 +989,7 @@ MX8MP_IOMUXC_SAI5_RXC__GPIO3_IO20		0x22
 	pinctrl_pmic: dhcom-pmic-grp {
 		fsl,pins = <
 			/* PMIC_nINT */
-			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03		0x40000090
+			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03		0x1c0
 		>;
 	};
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-edm-g.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-edm-g.dtsi
index 3f1e0837f349..91b87a7248dd 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-edm-g.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-edm-g.dtsi
@@ -563,7 +563,7 @@ MX8MP_IOMUXC_GPIO1_IO01__GPIO1_IO01	0x41 /* PCIE RST */
 
 	pinctrl_pmic: pmicirqgrp {
 		fsl,pins = <
-			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03	0x41
+			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03	0x1c0
 		>;
 	};
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp.dtsi
index a6319824ea2e..69558ffefa9a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp.dtsi
@@ -132,7 +132,7 @@ MX8MP_IOMUXC_I2C1_SDA__I2C1_SDA		0x400001c3
 
 	pinctrl_pmic: pmicgrp {
 		fsl,pins = <
-			MX8MP_IOMUXC_NAND_CE0_B__GPIO3_IO01	  0x41
+			MX8MP_IOMUXC_NAND_CE0_B__GPIO3_IO01	0x1c0
 		>;
 	};
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-navqp.dts b/arch/arm64/boot/dts/freescale/imx8mp-navqp.dts
index 4a4f7c1adc23..9dedb9f11145 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-navqp.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-navqp.dts
@@ -356,7 +356,7 @@ MX8MP_IOMUXC_I2C4_SDA__I2C4_SDA					0x400001c3
 
 	pinctrl_pmic: pmicgrp {
 		fsl,pins = <
-			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03				0x41
+			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03				0x1c0
 		>;
 	};
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-nitrogen-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-nitrogen-som.dtsi
index f658309612ef..8465b36d440a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-nitrogen-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-nitrogen-som.dtsi
@@ -296,7 +296,7 @@ MX8MP_IOMUXC_I2C4_SDA__I2C4_SDA		0x400001c3
 
 	pinctrl_pmic: pmicirqgrp {
 		fsl,pins = <
-			MX8MP_IOMUXC_NAND_ALE__GPIO3_IO00	0x41
+			MX8MP_IOMUXC_NAND_ALE__GPIO3_IO00	0x1c0
 		>;
 	};
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-sr-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-sr-som.dtsi
index 3cdb0bc0ab72..c3f7daa773ea 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-sr-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-sr-som.dtsi
@@ -174,7 +174,7 @@ pmic: pmic@25 {
 		pinctrl-0 = <&pmic_pins>;
 		pinctrl-names = "default";
 		interrupt-parent = <&gpio1>;
-		interrupts = <3 GPIO_ACTIVE_LOW>;
+		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
 		nxp,i2c-lt-enable;
 
 		regulators {
@@ -417,7 +417,7 @@ MX8MP_IOMUXC_SAI1_RXD1__GPIO4_IO03		0x160
 
 	pmic_pins: pinctrl-pmic-grp {
 		fsl,pins = <
-			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03		0x41
+			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03		0x1c0
 		>;
 	};
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-ultra-mach-sbc.dts b/arch/arm64/boot/dts/freescale/imx8mp-ultra-mach-sbc.dts
index 9ecec1a41878..3e6f9c88cc20 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-ultra-mach-sbc.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-ultra-mach-sbc.dts
@@ -275,7 +275,7 @@ pmic@25 {
 		reg = <0x25>;
 		pinctrl-0 = <&pinctrl_pmic>;
 		interrupt-parent = <&gpio1>;
-		interrupts = <3 GPIO_ACTIVE_LOW>;
+		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
 
 		/*
 		 * i.MX 8M Plus Data Sheet for Consumer Products
@@ -739,7 +739,7 @@ MX8MP_IOMUXC_GPIO1_IO07__GPIO1_IO07		0x40	/* NFC_INT */
 
 	pinctrl_pmic: pmic-grp {
 		fsl,pins = <
-			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03		0x40	/* #PMIC_INT */
+			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03		0x1c0	/* #PMIC_INT */
 		>;
 	};
 
diff --git a/arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dts b/arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dts
index 070d10a705bb..a313d5687789 100644
--- a/arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dts
+++ b/arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dts
@@ -82,7 +82,6 @@ &sdhci0 {
 	mmc-ddr-1_8v;
 	mmc-hs400-1_8v;
 	sd-uhs-sdr104;
-	marvell,xenon-emmc;
 	marvell,xenon-tun-count = <9>;
 	marvell,pad-type = "fixed-1-8v";
 	vqmmc-supply = <&vsdc_reg>;
diff --git a/arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtsi b/arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtsi
index fed2dcecb323..37e16fb3a383 100644
--- a/arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtsi
@@ -78,7 +78,6 @@ &sdhci0 {
 	bus-width = <8>;
 	mmc-ddr-1_8v;
 	mmc-hs400-1_8v;
-	marvell,xenon-emmc;
 	marvell,xenon-tun-count = <9>;
 	marvell,pad-type = "fixed-1-8v";
 
diff --git a/arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtsi b/arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtsi
index 242820845707..12deacb741cc 100644
--- a/arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtsi
@@ -15,6 +15,11 @@
 #include "armada-372x.dtsi"
 
 / {
+	aliases {
+		ethernet0 = &eth0;
+		ethernet1 = &eth1;
+	};
+
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
@@ -156,7 +161,7 @@ &eth1 {
 &usb3 {
 	status = "okay";
 	phys = <&usb2_utmi_otg_phy>;
-	phy-names = "usb2-utmi-otg-phy";
+	phy-names = "usb2-phy";
 };
 
 &uart0 {
diff --git a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
index 87f9367aec12..360fc24fdde2 100644
--- a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
@@ -369,11 +369,10 @@ usb3: usb@58000 {
 				compatible = "marvell,armada3700-xhci",
 				"generic-xhci";
 				reg = <0x58000 0x4000>;
-				marvell,usb-misc-reg = <&usb32_syscon>;
 				interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&sb_periph_clk 12>;
-				phys = <&comphy0 0>, <&usb2_utmi_otg_phy>;
-				phy-names = "usb3-phy", "usb2-utmi-otg-phy";
+				phys = <&usb2_utmi_otg_phy>, <&comphy0 0>;
+				phy-names = "usb2-phy", "usb3-phy";
 				status = "disabled";
 			};
 
@@ -393,10 +392,9 @@ usb32_syscon: system-controller@5d800 {
 			usb2: usb@5e000 {
 				compatible = "marvell,armada-3700-ehci";
 				reg = <0x5e000 0x1000>;
-				marvell,usb-misc-reg = <&usb2_syscon>;
 				interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
 				phys = <&usb2_utmi_host_phy>;
-				phy-names = "usb2-utmi-host-phy";
+				phy-names = "usb";
 				status = "disabled";
 			};
 
@@ -534,7 +532,6 @@ firmware {
 		armada-3700-rwtm {
 			compatible = "marvell,armada-3700-rwtm-firmware";
 			mboxes = <&rwtm 0>;
-			status = "okay";
 		};
 	};
 };
diff --git a/arch/arm64/boot/dts/marvell/armada-7020-comexpress.dtsi b/arch/arm64/boot/dts/marvell/armada-7020-comexpress.dtsi
index 2b5ec4a451e3..0cfcf5f6bde1 100644
--- a/arch/arm64/boot/dts/marvell/armada-7020-comexpress.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-7020-comexpress.dtsi
@@ -70,7 +70,7 @@ &cp0_eth0 {
 
 &cp0_eth1 {
 	status = "okay";
-	phy = <&phy0>;
+	phy-handle = <&phy0>;
 	phy-mode = "rgmii-id";
 };
 
diff --git a/arch/arm64/boot/dts/marvell/armada-8020.dtsi b/arch/arm64/boot/dts/marvell/armada-8020.dtsi
deleted file mode 100644
index b6fc18876093..000000000000
diff --git a/arch/arm64/boot/dts/marvell/cn9130-db-comexpress.dtsi b/arch/arm64/boot/dts/marvell/cn9130-db-comexpress.dtsi
deleted file mode 100644
index 028496ebc473..000000000000
diff --git a/drivers/reset/amlogic/reset-meson.c b/drivers/reset/amlogic/reset-meson.c
index 84610365a823..c303e8590dd6 100644
--- a/drivers/reset/amlogic/reset-meson.c
+++ b/drivers/reset/amlogic/reset-meson.c
@@ -42,6 +42,7 @@ static const struct meson_reset_param meson_s4_param = {
 };
 
 static const struct meson_reset_param t7_param = {
+	.reset_ops	= &meson_reset_ops,
 	.reset_num      = 224,
 	.reset_offset	= 0x0,
 	.level_offset   = 0x40,


