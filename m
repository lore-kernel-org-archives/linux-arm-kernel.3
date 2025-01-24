Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 721B3C02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 15:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rM9tiD+4rKvwlOIunKsBA7l55MBlXo6xxul+SEmYYgU=; b=NkCdVtcLZoiNWOExSiQhTCEenh
	1WXRD7XTrTAKzZgRyqEYqXmb9EMsNMn8DFOeBAVCubZCB5EdA+7MmNb6XHIKJXzO/iPTcnGQqnZxo
	UQ2bpwAM6L6B1kyKLDp/Nwe3him4o/q8R3E0gGygyKnFB10NeejAiNh83Zap1pykxaIFMJUs8R2Ry
	PGZNR8XW6XrJQnrDfpM/DPJiWaM2+F+12R7uo/n5Nv4Ay5X5kR/SPBh2h+if00OmA35txsiWqZf9r
	uJa7c9KV7JEpYeSokoBgFwAoOAsIV9GmQvyOb314Sq7ploa5WmFukGjugLWPiuwPS0itptGIkrc2c
	Q8LlopYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbLIv-0000000EvB0-23tt;
	Fri, 24 Jan 2025 15:09:05 +0000
Received: from fhigh-a6-smtp.messagingengine.com ([103.168.172.157])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbLHa-0000000Ev3a-2FYB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 15:07:45 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 97D4511400BC;
	Fri, 24 Jan 2025 10:07:41 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Fri, 24 Jan 2025 10:07:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1737731261;
	 x=1737817661; bh=rM9tiD+4rKvwlOIunKsBA7l55MBlXo6xxul+SEmYYgU=; b=
	QFB3daLpiyHCwVB/83eXE02SWOY++amOv5iCQXjWzCqmR+Q57X8Q43nau9gDFP+L
	2HlAmsDrBcC7/Kna04xX/vsUlkmojGLqnV6pcb0/VIeuIugPHHg09S09qUS0+fj0
	IsJNGx8auXs1QKsOLRS/uiIQyJ4VZchKTFhLM28j79YTQJqR1RuWe4YBRBNhcx6h
	kEQ64OYMbUBNu+Np7zitZTW2oFcnXu+DFQK9gDCEd+M+lJOWUnJZpBy/fMrRH/WM
	FzuqkvYf8xMs+sk5n68vMNHgvEPXfQqNUovHw97L5cdEQ22UfP1H48nUqdD2jc02
	sE/HLAShntPHBZncbxxIHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1737731261; x=
	1737817661; bh=rM9tiD+4rKvwlOIunKsBA7l55MBlXo6xxul+SEmYYgU=; b=J
	xRcSdyn5EV+NfWa+Puw+HyCgVbPqiTou3V192eTqCR15wRfQK88Hxv6A/Md7qlDN
	wXvcSBbxxAaayKlWY7uGeUQjlNhh6IrjO1Px5N98SzyimK4xA2sL5Q5ChQWrlvVc
	q8280N6Y+lzcejVDAEBSeHoqWRiyUlDWhtHefhrufVBVcj+mm19XYPGtwmmGOX6m
	0kRyJ6qQ2Q+jWW4wrOSHaDS6e034VhvaRSbBI9prS9s2qH2e8FH1pJadVbk7FtUG
	ruHx/mg4kXXAvni5c/MFOK7mNK0IwgFqTYZUXe8o5S8Yf007nBvXBS2wUxYm5o2P
	Gq4fF5U7kNrZi2DfJdC8Q==
X-ME-Sender: <xms:vayTZzzGn6PCuFOuEV9CM4odewnxiTcKNFYKI2Dyv1hr5eeKgVX8rQ>
    <xme:vayTZ7RrZ0YSKC6OkaSmLRCZRYh_bx1p-sicSHv932MdDQ_w0ETq9weUnmfilFPWw
    BE-AGc9uBbZZgY_sko>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejgedggeekfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredt
    jeenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpeefueegkeffveeugeehieehiedukeegfefhffeu
    tdettdffteeluefhheetkeekvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhgih
    hthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeegpdhmohguvg
    epshhmthhpohhuthdprhgtphhtthhopehtohhrvhgrlhgusheslhhinhhugidqfhhouhhn
    uggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlse
    hlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepshhotgeslhhishht
    shdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvg
    hrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:vayTZ9XrHD6P_56HNJ98xHxfV6ZbzsHTwlgwbMoISmMFH046RgAG5Q>
    <xmx:vayTZ9gzcdHk5QoWnvfaYIWKyVkZFT8sDIbGv13gEctc7dh0HRWD9Q>
    <xmx:vayTZ1DnKjkqUatT8Y0hrFnOfeM21af7SjjzGm8OkwvgTdyufITTRg>
    <xmx:vayTZ2L5vAGj_ojh7bB-YTyuY9SosIfz07dDcilkmbzFG7i-6Gq9VQ>
    <xmx:vayTZ0NpEmctJGODuF-JfXBO5IhrOP0Lt8NCs1-QcOEvtq5yVi0fiOfD>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 29F5E2220071; Fri, 24 Jan 2025 10:07:41 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Fri, 24 Jan 2025 16:06:32 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 soc@lists.linux.dev
Message-Id: <a31f0a31-8c70-43d1-b2e5-6072ac5d8b53@app.fastmail.com>
In-Reply-To: <1f0939fd-1694-476e-954f-e58ff8650dd9@app.fastmail.com>
References: <1f0939fd-1694-476e-954f-e58ff8650dd9@app.fastmail.com>
Subject: [GIT PULL 3/5] soc: devicetree changes for 6.14
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_070742_827888_0BB7BA90 
X-CRM114-Status: GOOD (  13.55  )
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

The following changes since commit fac04efc5c793dccbd07e2d59af9f90b7fc0d=
ca4:

  Linux 6.13-rc2 (2024-12-08 14:03:39 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-d=
t-6.14

for you to fetch changes up to 3c9690f76d66f45f727e00c838faba9a3ef4e295:

  Merge tag 'aspeed-6.14-devicetree' of https://git.kernel.org/pub/scm/l=
inux/kernel/git/joel/bmc into soc/dt (2025-01-23 17:39:26 +0100)

----------------------------------------------------------------
soc: devicetree changes for 6.14

We see the addition of eleven new SoCs, including a total of sixx arm64
chips from Qualcomm alone. Overall, the Qualcomm platforms once again
make up the majority of all changes, after a couple of quieter releases.

The new SoCs in this branch are:

 - Microchip sama7d65 is a new 32-bit embedded chip with a single
   Cortex-A7 and the current high end of the old Atmel SoC line.

 - Samsung Exynos 9810 is a mobile phone chip used in some older
   phones like the Samsung Galaxy S9

 - Renesas R-Car V4H ES3.0 (R8A779G3) is an updated version of
   the V4H (R8A779G0) low-power automotive SoC

 - Renesas RZ/G3E (R0A09G047) is a family of embedded chips
   using Cortex-A55 cores

 - Qualcomm Snapdragon 8 Elite (SM8750) is a new phone chip based on
   Qualcomm's Oryon CPU cores.

 - Qualcomm Snapdragon AR2 (SAR2130P) is a SoC for augmented reality
   glasses.

 - Qualcomm IQ6 (QCS610) and IQ8 (QCS8300) are two industrial
   IOT platforms.

 - Snapdragon 425 (MSM8917) is a mobile phone SoC from 2016

 - Qualcomm IPQ5424 is a Wi-Fi 7 networking chip

All of the above are part of already supported SoC families that
only need new devicetree files. Two additional SoCs in new
families are part of a separate branch.

There are 48 new machines in total, including six arm32 ones based
on aspeed. broadcom, microchip and st SoCs all using Cortex-A7 cores,
and a single risc-v board, the Banana Pi R3.

The remaining ones use arm64 chips from Broadcom, Samsung, NXP, Mediatek,
Qualcomm, Renesas and Rockchips and cover development boards, phones,
laptops, industrial machines routers.

A lot of ongoing work is for cleaning up build time warnings and other
issues, in addition to the new machines and added features.

----------------------------------------------------------------
Abel Vesa (7):
      arm64: dts: qcom: x1e80100: Describe the SDHC controllers
      arm64: dts: qcom: x1e80100-qcp: Enable SD card support
      arm64: dts: qcom: x1e78100-t14s: Enable support for both Type-A US=
B ports
      arm64: dts: qcom: x1e78100-qcp: Enable Type-A USB ports labeled 3 =
and 4/6
      arm64: dts: qcom: x1e80100: Fix interconnect tags for SDHC nodes
      arm64: dts: qcom: x1e78100-t14s: Enable fingerprint reader
      arm64: dts: qcom: x1e80100: Fix usb_2 controller interrupts

Akhil R (1):
      arm64: tegra: Fix DMA ID for SPI2

Alain Volmat (5):
      arm64: dts: st: add csi & dcmipp node in stm32mp25
      arm64: dts: st: enable imx335/csi/dcmipp pipeline on stm32mp257f-e=
v1
      dt-bindings: gpu: mali-utgard: Add st,stih410-mali compatible
      ARM: dts: st: add node for the MALI gpu on stih410.dtsi
      ARM: dts: st: enable the MALI gpu on the stih410-b2260

Aleksandrs Vinarskis (1):
      arm64: dts: qcom: x1e80100-dell-xps13-9345: Introduce retimer supp=
ort

Alexander Stein (7):
      ARM: dts: imx7-mba7: remove LVDS transmitter regulator
      ARM: dts: imx7-tqma7: Remove superfluous status=3D"okay" property
      ARM: dts: imx7-tqma7: add missing vs-supply for LM75A (rev. 01xxx)
      ARM: dts: imx7-mba7: Add 3.3V and 5.0V regulators
      ARM: dts: imx7-mba7: Fix SD card vmmc-supply
      ARM: dts: imx7-mba7: Remove duplicated power supply
      ARM: dts: imx7[d]-mba7: add Ethernet PHY IRQ support

Alexey Charkov (2):
      dt-bindings: arm: rockchip: Add H96 Max V58 TV box
      arm64: dts: rockchip: Add H96 Max V58 TV Box based on RK3588 SoC

Alexey Klimov (4):
      arm64: dts: qcom: sm6115: add apr and its services
      arm64: dts: qcom: sm6115: add LPASS LPI pin controller
      arm64: dts: qcom: sm4250: add LPASS LPI pin controller
      arm64: dts: qcom: qrb4210-rb2: add HDMI audio playback support

Andre Przywara (1):
      arm64: dts: allwinner: h313: enable DVFS for Tanix TX1

Andreas Kemnade (2):
      ARM: dts: ti/omap: gta04: fix pm issues caused by spi module
      ARM: dts: ti/omap: omap3-gta04: use proper touchscreen properties

Andrew Davis (3):
      arm64: dts: ti: k3-am625-sk: Remove M4 mailbox node redefinition
      arm64: dts: ti: k3-am62p: Enable Mailbox nodes at the board level
      arm64: dts: ti: k3-am67a-beagley-ai: Add remote processor nodes

Andrew Halaney (2):
      arm64: dts: ti: k3-j784s4-evm: Mark tps659413 regulators as bootph=
-all
      arm64: dts: ti: k3-am69-sk: Mark tps659413 regulators as bootph-all

Andr=C3=A9 Draszik (5):
      MAINTAINERS: add myself and Tudor as reviewers for Google Tensor S=
oC
      arm64: dts: exynos: gs101: phy region for exynos5-usbdrd is larger
      arm64: dts: exynos: gs101: allow stable USB phy Vbus detection
      arm64: dts: exynos: gs101-oriole: enable Maxim max77759 TCPCi
      arm64: dts: exynos: gs101-oriole: add pd-disable and typec-power-o=
pmode

Andy Yan (1):
      dt-bindings: soc: rockchip: add rk3576 hdptxphy grf syscon

Anthony Ruhier (1):
      arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add lid switch

Anton Kirilov (1):
      arm64: dts: rockchip: Enable the USB 3.0 port on NanoPi R6C/R6S

Anurag Dutta (2):
      arm64: dts: ti: k3-j784s4: Fix clock IDs for MCSPI instances
      arm64: dts: ti: k3-j7200: Add node to disable loopback connection

Arnaud Pouliquen (1):
      ARM: dts: stm32: Fix IPCC EXTI declaration on stm32mp151

Arnd Bergmann (34):
      Merge tag 'stm32-dt-for-v6.14-1' of https://git.kernel.org/pub/scm=
/linux/kernel/git/atorgue/stm32 into soc/dt
      Merge tag 'renesas-dts-for-v6.14-tag1' of https://git.kernel.org/p=
ub/scm/linux/kernel/git/geert/renesas-devel into soc/dt
      Merge tag 'samsung-dt-6.14' of https://git.kernel.org/pub/scm/linu=
x/kernel/git/krzk/linux into soc/dt
      Merge tag 'thead-dt-for-v6.14' of https://github.com/pdp7/linux in=
to soc/dt
      Merge tag 'samsung-dt64-6.14' of https://git.kernel.org/pub/scm/li=
nux/kernel/git/krzk/linux into soc/dt
      Merge tag 'dt64-cleanup-6.14' of https://git.kernel.org/pub/scm/li=
nux/kernel/git/krzk/linux-dt into soc/dt
      Merge tag 'dt-cleanup-6.14' of https://git.kernel.org/pub/scm/linu=
x/kernel/git/krzk/linux-dt into soc/dt
      Merge tag 'hisi-arm64-dt-for-6.14' of https://github.com/hisilicon=
/linux-hisi into soc/dt
      Merge tag 'socfpga_dts_updates_v6.14' of https://git.kernel.org/pu=
b/scm/linux/kernel/git/dinguyen/linux into soc/dt
      Merge tag 'imx-bindings-6.14' of https://git.kernel.org/pub/scm/li=
nux/kernel/git/shawnguo/linux into soc/dt
      Merge tag 'imx-dt-6.14' of https://git.kernel.org/pub/scm/linux/ke=
rnel/git/shawnguo/linux into soc/dt
      Merge tag 'imx-dt64-6.14' of https://git.kernel.org/pub/scm/linux/=
kernel/git/shawnguo/linux into soc/dt
      Merge tag 'sti-dt-for-v6.14-round1' of https://git.kernel.org/pub/=
scm/linux/kernel/git/pchotard/sti into soc/dt
      Merge tag 'amlogic-arm-dt-for-v6.14' of https://git.kernel.org/pub=
/scm/linux/kernel/git/amlogic/linux into soc/dt
      Merge tag 'amlogic-arm64-dt-for-v6.14' of https://git.kernel.org/p=
ub/scm/linux/kernel/git/amlogic/linux into soc/dt
      Merge tag 'renesas-dts-for-v6.14-tag2' of https://git.kernel.org/p=
ub/scm/linux/kernel/git/geert/renesas-devel into soc/dt
      Merge tag 'at91-dt-6.14' of https://git.kernel.org/pub/scm/linux/k=
ernel/git/at91/linux into soc/dt
      Merge tag 'omap-for-v6.14/dt-signed' of https://git.kernel.org/pub=
/scm/linux/kernel/git/khilman/linux-omap into soc/dt
      Merge tag 'mtk-dts64-for-v6.14' of https://git.kernel.org/pub/scm/=
linux/kernel/git/mediatek/linux into soc/dt
      Merge tag 'mtk-dts32-for-v6.14' of https://git.kernel.org/pub/scm/=
linux/kernel/git/mediatek/linux into soc/dt
      Merge tag 'sunxi-dt-for-6.14' of https://git.kernel.org/pub/scm/li=
nux/kernel/git/sunxi/linux into soc/dt
      Merge tag 'at91-dt-6.14-2' of https://git.kernel.org/pub/scm/linux=
/kernel/git/at91/linux into soc/dt
      Merge tag 'arm-soc/for-6.14/devicetree' of https://github.com/Broa=
dcom/stblinux into soc/dt
      Merge tag 'arm-soc/for-6.14/devicetree-arm64' of https://github.co=
m/Broadcom/stblinux into soc/dt
      Merge tag 'tegra-for-6.14-arm-dt' of https://git.kernel.org/pub/sc=
m/linux/kernel/git/tegra/linux into soc/dt
      Merge tag 'tegra-for-6.14-arm64-dt' of https://git.kernel.org/pub/=
scm/linux/kernel/git/tegra/linux into soc/dt
      Merge tag 'ti-k3-dt-for-v6.14' of https://git.kernel.org/pub/scm/l=
inux/kernel/git/ti/linux into soc/dt
      Merge tag 'v6.14-rockchip-dts64-1' of https://git.kernel.org/pub/s=
cm/linux/kernel/git/mmind/linux-rockchip into soc/dt
      Merge tag 'qcom-arm32-for-6.14' of https://git.kernel.org/pub/scm/=
linux/kernel/git/qcom/linux into soc/dt
      Merge tag 'qcom-arm64-for-6.14' of https://git.kernel.org/pub/scm/=
linux/kernel/git/qcom/linux into soc/dt
      Merge tag 'mvebu-dt64-6.14-1' of https://git.kernel.org/pub/scm/li=
nux/kernel/git/gclement/mvebu into soc/dt
      Merge tag 'riscv-dt-for-v6.14' of https://git.kernel.org/pub/scm/l=
inux/kernel/git/conor/linux into soc/dt
      Merge tag 'amlogic-drivers-for-v6.14' of https://git.kernel.org/pu=
b/scm/linux/kernel/git/amlogic/linux into soc/dt
      Merge tag 'aspeed-6.14-devicetree' of https://git.kernel.org/pub/s=
cm/linux/kernel/git/joel/bmc into soc/dt

Artur Weber (3):
      ARM: dts: samsung: exynos4212-tab3: Fix headset mic, add jack dete=
ction
      ARM: dts: samsung: exynos4212-tab3: Add MCLK2 clock to WM1811 code=
c config
      ARM: dts: samsung: exynos4212-tab3: Drop interrupt from WM1811 cod=
ec

Barnab=C3=A1s Cz=C3=A9m=C3=A1n (2):
      dt-bindings: arm: qcom: Add Xiaomi Redmi 5A
      arm64: dts: qcom: Add Xiaomi Redmi 5A

Bhavya Kapoor (1):
      arm64: dts: ti: k3-j722s-evm: Enable support for mcu_i2c0

Biju Das (13):
      dt-bindings: soc: renesas: Document Renesas RZ/G3E SoC variants
      dt-bindings: soc: renesas: Document RZ/G3E SMARC SoM and Carrier-I=
I EVK
      dt-bindings: clock: renesas: Document RZ/G3E SoC CPG
      arm64: dts: renesas: Add initial DTSI for RZ/G3E SoC
      arm64: dts: renesas: r9a09g047: Add OPP table
      arm64: dts: renesas: Add initial support for RZ/G3E SMARC SoM
      arm64: dts: renesas: Add initial device tree for RZ/G3E SMARC EVK =
board
      arm64: dts: renesas: r9a09g047: Add I2C nodes
      dt-bindings: pinctrl: renesas: Add alpha-numerical port support fo=
r RZ/V2H
      dt-bindings: pinctrl: renesas: Document RZ/G3E SoC
      arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Replace RZG2L macros
      arm64: dts: renesas: r9a09g047: Add pincontrol node
      arm64: dts: renesas: r9a09g047e57-smarc: Add SCIF pincontrol

Bjorn Andersson (8):
      Merge branch '20241027-sar2130p-clocks-v5-0-ecad2a1432ba@linaro.or=
g' into arm64-for-6.13
      Merge branch 'icc-sar2130p' of https://git.kernel.org/pub/scm/linu=
x/kernel/git/djakov/icc into HEAD
      Merge branch '20241028060506.246606-3-quic_srichara@quicinc.com' i=
nto arm64-for-6.13
      Merge branch 'arm64-for-6.13' into arm64-for-6.14
      Merge branch '20241022-qcs615-clock-driver-v4-0-3d716ad0d987@quici=
nc.com' into HEAD
      Merge branches '20241204-sm8750_master_clks-v3-0-1a8f31a53a86@quic=
inc.com' and '20250106-sm8750-dispcc-v2-1-6f42beda6317@linaro.org' into =
arm64-for-6.14
      Merge branch 'icc-sm8750' of https://git.kernel.org/pub/scm/linux/=
kernel/git/djakov/icc into arm64-for-6.14
      Merge branch '20250103-qcom_ipq_cmnpll-v8-1-c89fb4d4849d@quicinc.c=
om' into arm64-for-6.14

Brad Griffis (1):
      arm64: tegra: Fix Tegra234 PCIe interrupt-map

Bryan Brattlof (2):
      arm64: dts: ti: k3-am62: Remove duplicate GICR reg
      arm64: dts: ti: k3-am62a: Remove duplicate GICR reg

Byoungtae Cho (1):
      arm64: dts: exynosautov920: add watchdog DT node

Chanh Nguyen (4):
      ARM: dts: aspeed: mtmitchell: Add I2C FAN controllers
      ARM: dts: aspeed: mtmitchell: Add gpio line names for io expanders
      dt-bindings: arm: aspeed: add Mt. Jefferson board
      ARM: dts: aspeed: Add device tree for Ampere's Mt. Jefferson BMC

Chen-Yu Tsai (16):
      arm64: dts: mediatek: mt8183: Disable DPI display output by default
      arm64: dts: mediatek: mt8183: Disable DSI display output by default
      arm64: dts: mediatek: mt8173-evb: Drop regulator-compatible proper=
ty
      arm64: dts: mediatek: mt8173-elm: Drop regulator-compatible proper=
ty
      arm64: dts: mediatek: mt8192-asurada: Drop regulator-compatible pr=
operty
      arm64: dts: mediatek: mt8195-cherry: Drop regulator-compatible pro=
perty
      arm64: dts: mediatek: mt8195-demo: Drop regulator-compatible prope=
rty
      arm64: dts: medaitek: mt8395-nio-12l: Drop regulator-compatible pr=
operty
      arm64: dts: mediatek: mt8395-genio-1200-evk: Drop regulator-compat=
ible property
      arm64: dts: mediatek: mt8173-elm: Fix MT6397 PMIC sub-node names
      arm64: dts: mediatek: mt8173-evb: Fix MT6397 PMIC sub-node names
      arm64: dts: mediatek: mt8183-kukui-jacuzzi: Drop pp3300_panel volt=
age settings
      Merge branch 'sunxi/shared-clk-ids-for-6.14' into sunxi/dt-for-6.14
      arm64: dts: mediatek: mt8192: Drop Chromebook variants that never =
shipped
      dt-bindings: arm: mediatek: Drop MT8192 Chromebook variants that n=
ever shipped
      arm64: dts: rockchip: Enable USB 3.0 ports on orangepi-5-plus

Chintan Vankar (1):
      arm64: dts: ti: k3-am62x-sk-common: Add bootph-all property in cps=
w_mac_syscon node

Christian Bruel (2):
      arm64: dts: st: Add combophy node on stm32mp251
      arm64: dts: st: Enable COMBOPHY on the stm32mp257f-ev1 board

Christian Hewitt (1):
      arm64: dts: meson: remove broadcom wifi compatible from GX referen=
ce boards

Claudiu Beznea (9):
      arm64: dts: renesas: r9a08g045: Add the remaining SCIF interfaces
      arm64: dts: renesas: rzg3s-smarc: Fix the debug serial alias
      arm64: dts: renesas: r9a08g045: Add ADC node
      arm64: dts: renesas: rzg3s-smarc-som: Enable ADC
      arm64: dts: renesas: r9a08g045: Add SSI nodes
      arm64: dts: renesas: rzg3s-smarc-som: Add versa3 clock generator n=
ode
      arm64: dts: renesas: Add da7212 audio codec node
      arm64: dts: renesas: rzg3s-smarc: Enable SSI3
      arm64: dts: renesas: rzg3s-smarc: Add sound card

Cody Eksal (2):
      dt-bindings: sram: sunxi-sram: Add A100 compatible
      arm64: dts: allwinner: a100: Add syscon nodes

Conor Dooley (1):
      ARM: dts: socfpga: remove non-existent DAC from CycloneV devkit

Cristian Birsan (2):
      ARM: dts: microchip: sama5d29_curiosity: Add no-1-8-v property to =
sdmmc0 node
      ARM: dts: microchip: sama5d27_wlsom1_ek: Add no-1-8-v property to =
sdmmc0 node

Dang Huynh (1):
      arm64: dts: qcom: Add PM8937 PMIC

Dario Binacchi (1):
      arm64: dts: imx8mn-bsh-smm-s2/pro: add simple-framebuffer

Dasnavis Sabiya (1):
      arm64: dts: ti: k3-am69-sk: Add USB SuperSpeed support

Dave Stevenson (3):
      arm64: dts: broadcom: Add firmware clocks and power nodes to Pi5 DT
      arm64: dts: broadcom: Add display pipeline support to BCM2712
      arm64: dts: broadcom: Add DT for D-step version of BCM2712

David Jander (2):
      arm64: dts: rockchip: Remove unused i2c2 node from rk3568-mecsbc
      arm64: dts: rockchip: Add FRAM MB85RS128TY to rk3568-mecsbc

Denzeel Oliva (2):
      dt-bindings: arm: samsung: Add compatible for Samsung Galaxy S20 F=
E (SM-G780F)
      arm64: dts: exynos: Add initial support for Samsung Galaxy S20 FE =
(r8s)

Dharma Balasubiramani (1):
      dt-bindings: atmel-sysreg: add sama7d65 RAM and PIT

Dmitry Baryshkov (27):
      dt-bindings: arm: qcom: add QAR2130P board
      arm64: dts: qcom: sar2130p: add support for SAR2130P
      arm64: dts: qcom: sar2130p: add QAR2130P board file
      arm64: dts: qcom: sm8350-hdk: enable IPA
      arm64: dts: qcom: sm8550: correct MDSS interconnects
      arm64: dts: qcom: sm8650: correct MDSS interconnects
      arm64: dts: qcom: msm8916: correct sleep clock frequency
      arm64: dts: qcom: msm8939: correct sleep clock frequency
      arm64: dts: qcom: msm8994: correct sleep clock frequency
      arm64: dts: qcom: qcs404: correct sleep clock frequency
      arm64: dts: qcom: q[dr]u1000: correct sleep clock frequency
      arm64: dts: qcom: qrb4210-rb2: correct sleep clock frequency
      arm64: dts: qcom: sar2130p: correct sleep clock frequency
      arm64: dts: qcom: sc7280: correct sleep clock frequency
      arm64: dts: qcom: sdx75: correct sleep clock frequency
      arm64: dts: qcom: sm4450: correct sleep clock frequency
      arm64: dts: qcom: sm6125: correct sleep clock frequency
      arm64: dts: qcom: sm6375: correct sleep clock frequency
      arm64: dts: qcom: sm8250: correct sleep clock frequency
      arm64: dts: qcom: sm8350: correct sleep clock frequency
      arm64: dts: qcom: sm8450: correct sleep clock frequency
      arm64: dts: qcom: sm8550: correct sleep clock frequency
      arm64: dts: qcom: sm8650: correct sleep clock frequency
      arm64: dts: qcom: x1e80100: correct sleep clock frequency
      arm64: dts: qcom: sc8180x: drop extra XO clock frequencies
      arm64: dts: qcom: sdm670: move board clocks to sdm670.dtsi file
      arm64: dts: qcom: q[dr]u1000: move board clocks to qdu1000.dtsi fi=
le

Dragan Simic (1):
      arm64: dts: rockchip: Delete redundant RK3328 GMAC stability fixes

E Shattow (2):
      riscv: dts: starfive: jh7110-pine64-star64: enable usb0 host funct=
ion
      riscv: dts: starfive: jh7110-milkv-mars: enable usb0 host function

Eddie James (4):
      ARM: dts: aspeed: Fix Rainier and Blueridge GPIO LED names
      arm: dts: aspeed: Everest and Fuji: Add VRM presence gpio expander
      ARM: dts: aspeed: Blueridge and Fuji: Fix LED node names
      arm: dts: aspeed: Blueridge and Rainer: Add VRM presence GPIOs

FUKAUMI Naoki (2):
      dt-bindings: arm: rockchip: Add Radxa E52C
      arm64: dts: rockchip: Add Radxa E52C

Fabio Estevam (3):
      ARM: dts: imx6qdl-apalis: Change to "adi,force-bt656-4"
      arm64: dts: imx8mm-phg: Add LVDS compatible string
      ARM: dts: imx: Use the correct mdio pattern

Fabrice Gasnier (5):
      ARM: dts: stm32: populate all timer counter nodes on stm32mp13
      ARM: dts: stm32: populate all timer counter nodes on stm32mp15
      ARM: dts: stm32: add counter subnodes on stm32mp135f-dk
      ARM: dts: stm32: add counter subnodes on stm32mp157c-ev1
      ARM: dts: stm32: add counter subnodes on stm32mp157 dk boards

Faraz Ata (1):
      arm64: dts: exynosautov920: Add DMA nodes

Fei Shao (2):
      dt-bindings: arm: mediatek: Add MT8188 Lenovo Chromebook Duet (11"=
, 9)
      arm64: dts: mediatek: Introduce MT8188 Geralt platform based Ciri

Francesco Valla (1):
      arm64: dts: ti: k3-am625-beagleplay: Fix DP83TD510E reset time

Frank Li (2):
      arm64: dts: imx8mq-zii-ultra: remove #address-cells of eeprom@a4
      arm64: dts: imx93-9x9-qsb: add temp-sensor nxp,p3t1085

Frank Wang (1):
      arm64: dts: rockchip: add usb related nodes for rk3576

Frank Wunderlich (29):
      arm64: dts: mt7986: add overlay for SATA power socket on BPI-R3
      arm64: dts: mediatek: mt7988: Add pinctrl support
      arm64: dts: mediatek: mt7988a-bpi-r4: Add pinctrl subnodes for bpi=
-r4
      arm64: dts: mediatek: mt7988: Add reserved memory
      arm64: dts: mediatek: mt7988: Add mmc support
      arm64: dts: mediatek: mt7988: Add lvts node
      arm64: dts: mediatek: mt7988: Add thermal-zone
      arm64: dts: mediatek: mt7988: Add missing clock-div property for i=
2c
      arm64: dts: mediatek: mt7988: Add mcu-sys node for cpu
      arm64: dts: mediatek: mt7988: Add CPU OPP table for clock scaling
      arm64: dts: mediatek: mt7988: Disable usb controllers by default
      arm64: dts: mediatek: mt7988: Add t-phy for ssusb1
      arm64: dts: mediatek: mt7988: Add pcie nodes
      arm64: dts: mediatek: mt7988a-bpi-r4: Enable watchdog
      arm64: dts: mediatek: mt7988a-bpi-r4: Add fixed regulators for 1v8=
 and 3v3
      arm64: dts: mediatek: mt7988a-bpi-r4: Add dt overlays for sd + emmc
      arm64: dts: mediatek: mt7988a-bpi-r4: Add thermal configuration
      arm64: dts: mediatek: mt7988a-bpi-r4: Enable serial0 debug uart
      arm64: dts: mediatek: mt7988a-bpi-r4: Add default UART stdout
      arm64: dts: mediatek: mt7988a-bpi-r4: Enable I2C controllers
      arm64: dts: mediatek: mt7988a-bpi-r4: Add PCA9545 I2C Mux
      arm64: dts: mediatek: mt7988a-bpi-r4: Enable t-phy for ssusb1
      arm64: dts: mediatek: mt7988a-bpi-r4: Enable ssusb1 on bpi-r4
      arm64: dts: mediatek: mt7988a-bpi-r4: Enable pwm
      arm64: dts: mediatek: mt7988a-bpi-r4: Enable pcie
      arm64: dts: mediatek: mt7988a-bpi-r4: Add MediaTek MT6682A/RT5190A=
 PMIC
      arm64: dts: mediatek: mt7988a-bpi-r4: Add proc-supply for cpus
      arm64: dts: marvell: only enable complete sata nodes
      arm64: dts: marvell: drop additional phy-names for sata

Gabor Juhos (1):
      dt-bindings: arm: qcom: add missing elements to the SoC list

Geert Uytterhoeven (15):
      ARM: dts: marvell: mmp2-olpc-xo-1-75: Switch to {hp,mic}-det-gpios
      arm64: dts: uniphier: Switch to hp-det-gpios
      ARM: dts: imx: Switch to {hp,mic}-det-gpios
      arm64: dts: imx: Switch to simple-audio-card,hp-det-gpios
      dt-bindings: soc: renesas: Move R8A779G0 White Hawk up
      dt-bindings: soc: renesas: Document R8A779G3 White Hawk Single
      arm64: dts: renesas: Factor out White Hawk Single board support
      arm64: dts: renesas: Add R8A779G3 SoC support
      arm64: dts: renesas: r8a779g3: Add White Hawk Single support
      arm64: dts: renesas: white-hawk-ard-audio: Drop SoC part
      arm64: dts: renesas: white-hawk-single: Add R-Car Sound support
      ARM: dts: renesas: r7s72100: Add DMA support to RSPI
      Merge tag 'renesas-r9a09g047-dt-binding-defs-tag1' into renesas-dt=
s-for-v6.14
      Merge tag 'renesas-r9a09g057-dt-binding-defs-tag2' into renesas-dt=
s-for-v6.14
      Merge tag 'renesas-r9a09g047-dt-binding-defs-tag2' into renesas-dt=
s-for-v6.14

Heiko Schocher (2):
      dt-bindings: arm: fsl: Add ABB SoM and carrier
      arm64: dts: imx8mp: add aristainetos3 board support

Heiko Stuebner (2):
      arm64: dts: rockchip: hook up the MCU on the QNAP TS433
      arm64: dts: rockchip: set hdd led labels on QNAP-TS433

Hsiao Chien Sung (1):
      dt-bindings: display: mediatek: ovl: Modify rules for MT8195/MT8188

Hsin-Te Yuan (3):
      arm64: dts: mediatek: mt8183: kenzo: Support second source touchsc=
reen
      arm64: dts: mediatek: mt8183: willow: Support second source touchs=
creen
      arm64: dts: mediatek: mt8188: Add GPU speed bin NVMEM cells

Hsin-Yi Wang (1):
      arm64: dts: mt8183: set DMIC one-wire mode on Damu

Hui Wang (1):
      ARM: dts: imx6qdl-sabresd: add dr_mode to usbotg

Igor Belwon (3):
      arm64: dts: exynos990: Add pmu and syscon-reboot nodes
      dt-bindings: clock: samsung: Add Exynos990 SoC CMU bindings
      arm64: dts: exynos990: Add clock management unit nodes

Imran Shaik (1):
      arm64: dts: qcom: qcs8300: Add support for clock controllers

Ivan Sergeev (2):
      dt-bindings: arm: rockchip: Add BigTreeTech CB2 and Pi2
      arm64: dts: rockchip: Add BigTreeTech CB2 and Pi2

Ivaylo Ivanov (3):
      arm64: dts: exynos8895: Add serial_0/1 nodes
      arm64: dts: exynos8895: Add a PMU node for the second cluster
      arm64: dts: exynos8895: Add camera hsi2c nodes

Jacopo Mondi (2):
      arm64: dts: renesas: r8a779g0: Add FCPVX instances
      arm64: dts: renesas: r8a779g0: Add VSPX instances

Jagan Teki (1):
      arm64: dts: rockchip: Fix PCIe3 handling for Edgeble-6TOPS Modules

Jakob Unterwurzacher (1):
      arm64: dts: rockchip: increase gmac rx_delay on rk3399-puma

Jason-JH.Lin (3):
      dt-bindings: display: mediatek: ovl: Add compatible strings for MT=
8188 MDP3
      dts: arm64: mediatek: mt8188: Update OVL compatible from MT8183 to=
 MT8195
      dts: arm64: mediatek: mt8195: Remove MT8183 compatible for OVL

Jens Glathe (4):
      dt-bindings: arm: qcom: Add HP Omnibook X 14
      arm64: dts: qcom: x1e80100-hp-x14: dt for HP Omnibook X Laptop 14
      dt-bindings: arm: qcom: Add Microsoft Windows Dev Kit 2023
      arm64: dts: qcom: sc8280xp-blackrock: dt definition for WDK2023

Jianhua Lu (3):
      arm64: dts: qcom: sm8250-xiaomi-elish: Add qca6390-pmu node
      arm64: dts: qcom: sm8250-xiaomi-elish: Add wifi node
      arm64: dts: qcom: sm8250-xiaomi-elish: Add bluetooth node

Jie Gan (3):
      arm64: dts: qcom: qcs615: Add coresight nodes
      arm64: dts: qcom: qcs8300: Add coresight nodes
      arm64: dts: qcom: x1e80100: Add coresight nodes

Jimmy Hon (3):
      arm64: dts: rockchip: refactor common rk3588-orangepi-5.dtsi
      dt-bindings: arm: rockchip: Add Xunlong Orange Pi 5 Max
      arm64: dts: rockchip: Add Orange Pi 5 Max board

Jingyi Wang (6):
      dt-bindings: arm: qcom: document QCS8300 SoC and reference board
      arm64: dts: qcom: add QCS8300 platform
      arm64: dts: qcom: qcs8300: add base QCS8300 RIDE board
      arm64: dts: qcom: qcs8300: Add PMU support for QCS8300
      arm64: dts: qcom: qcs8300: Add LLCC support for QCS8300
      arm64: dts: qcom: qcs8300: Add capacity and DPC properties

Joel Stanley (1):
      arm64: dts: qcom: x1e80100-romulus: Update firmware nodes

Jonas Karlman (1):
      arm64: dts: rockchip: Fix sdmmc access on rk3308-rock-s0 v1.1 boar=
ds

Josua Mayer (2):
      arm64: dts: marvell: cn9131-cf-solidwan: fix cp1 comphy links
      arm64: dts: ti: k3-am642-hummingboard-t: Convert overlay to board =
dts

Joy Zou (1):
      arm64: dts: imx93: add pca9452 support

Judith Mendez (1):
      ARM: dts: ti: am437x-l4: remove autoidle for UART

Kever Yang (4):
      arm64: dts: rockchip: Add rk3576 naneng combphy nodes
      dt-bindings: arm: rockchip: Sort for boards not in correct order
      dt-bindings: arm: rockchip: Add rk3576 evb1 board
      arm64: dts: rockchip: Add rk3576 evb1 board

Konrad Dybcio (12):
      arm64: dts: qcom: x1e80100-romulus: Configure audio
      arm64: dts: qcom: x1e80100-romulus: Set up PCIe3 / SDCard reader
      arm64: dts: qcom: x1e80100-romulus: Set up PS8830s
      dt-bindings: arm: qcom-soc: Extend X1E prefix match for X1P
      dt-bindings: arm: qcom: Add X1P42100 SoC & CRD
      arm64: dts: qcom: pmk8350: Add more SDAM slices
      arm64: dts: qcom: qcs6490-rb3gen2: Configure onboard LEDs
      arm64: dts: qcom: sa8775p: Use a SoC-specific compatible for GPI D=
MA
      arm64: dts: qcom: sa8775p: Use valid node names for GPI DMAs
      arm64: dts: qcom: msm8996: Fix up USB3 interrupts
      arm64: dts: qcom: msm8994: Describe USB interrupts
      arm64: dts: qcom: sc8280xp: Fix up remoteproc register space sizes

Krishna Kurapati (14):
      arm64: dts: qcom: qcs615: Add primary USB interface
      arm64: dts: qcom: qcs615-ride: Enable primary USB interface
      arm64: dts: qcom: qcs615: Add support for secondary USB node on QC=
S615
      arm64: dts: qcom: qcs615-ride: Enable secondary USB controller on =
QCS615 Ride
      arm64: dts: qcom: sm8350: Disable USB U1/U2 entry
      arm64: dts: qcom: sm8450: Disable USB U1/U2 entry
      arm64: dts: qcom: sm8150: Disable USB U1/U2 entry
      arm64: dts: qcom: sm6125: Disable USB U1/U2 entry
      arm64: dts: qcom: sm8250: Disable USB U1/U2 entry
      arm64: dts: qcom: sm6350: Disable USB U1/U2 entry
      arm64: dts: qcom: sc7280: Disable USB U1/U2 entry
      arm64: dts: qcom: sa8775p: Disable USB U1/U2 entry
      arm64: dts: qcom: qcs8300: Add support for usb nodes
      arm64: dts: qcom: qcs8300-ride: Enable USB controllers

Krishna chaitanya chundru (2):
      ARM: dts: qcom: sdx65: Add PCIe EP interconnect path
      ARM: dts: qcom: sdx55: Add CPU PCIe EP interconnect path

Krzysztof Kozlowski (27):
      arm64: dts: mediatek: mt8183-kukui: align thermal node names with =
bindings
      arm64: dts: qcom: sm8650: Fix CDSP context banks unit addresses
      Merge branch 'for-v6.14/dt-bindings-clk-samsung' into next/dt64
      dt-bindings: clock: qcom,sm8550-dispcc: Add SM8750 DISPCC
      arm64: dts: qcom: sm8350: Fix ADSP memory base and length
      arm64: dts: qcom: sm8350: Fix CDSP memory base and length
      arm64: dts: qcom: sm8350: Fix MPSS memory length
      arm64: dts: qcom: sm8450: Fix ADSP memory base and length
      arm64: dts: qcom: sm8450: Fix CDSP memory length
      arm64: dts: qcom: sm8450: Fix MPSS memory length
      arm64: dts: qcom: sm8550: Fix ADSP memory base and length
      arm64: dts: qcom: sm8550: Fix CDSP memory length
      arm64: dts: qcom: sm8550: Fix MPSS memory length
      arm64: dts: qcom: sm8650: Fix ADSP memory base and length
      arm64: dts: qcom: sm8650: Fix CDSP memory length
      arm64: dts: qcom: sm8650: Fix MPSS memory length
      arm64: dts: qcom: x1e80100: Fix ADSP memory base and length
      arm64: dts: qcom: x1e80100: Fix CDSP memory length
      arm64: dts: qcom: sm6350: Fix ADSP memory length
      arm64: dts: qcom: sm6350: Fix MPSS memory length
      arm64: dts: qcom: sm6375: Fix ADSP memory length
      arm64: dts: qcom: sm6375: Fix CDSP memory base and length
      arm64: dts: qcom: sm6375: Fix MPSS memory base and length
      arm64: dts: qcom: sdx75: Fix MPSS memory length
      arm64: dts: qcom: sm6115: Fix MPSS memory length
      arm64: dts: qcom: sm6115: Fix CDSP memory length
      arm64: dts: qcom: sm6115: Fix ADSP memory base and length

Kuninori Morimoto (1):
      arm64: dts: renesas: ulcb: Add sample Audio Codec settings

Kyle Deng (1):
      arm64: dts: qcom: qcs615: add AOSS_QMP node

Leonard G=C3=B6hrs (6):
      ARM: dts: stm32: lxa-tac: disable the real time clock
      ARM: dts: stm32: lxa-tac: extend the alias table
      ARM: dts: stm32: lxa-tac: adjust USB gadget fifo sizes for multi f=
unction
      dt-bindings: arm: stm32: add compatible strings for Linux Automati=
on LXA TAC gen 3
      ARM: dts: stm32: lxa-tac: move adc and gpio{e,g} to gen{1,2} boards
      ARM: dts: stm32: lxa-tac: Add support for generation 3 devices

Lijuan Gao (7):
      dt-bindings: arm: qcom: document QCS615 and the reference board
      arm64: dts: qcom: add QCS615 platform
      arm64: dts: qcom: qcs615: add base RIDE board
      arm64: dts: qcom: qcs615: Add CPU and LLCC BWMON support
      arm64: dts: qcom: correct gpio-ranges for QCS615
      arm64: dts: qcom: correct gpio-ranges for QCS8300
      arm64: dts: qcom: qcs615: Add CPU capacity and DPC properties

Ling Xu (1):
      arm64: dts: qcom: qcs8300: Add ADSP and CDSP0 fastrpc nodes

Linus Walleij (9):
      ARM: dts: bcm6846: Add iproc rng
      ARM: dts: bcm6846: Enable watchdog
      ARM: dts: bcm6846: Add GPIO blocks
      ARM: dts: bcm6846: Add MDIO control block
      ARM: dts: bcm6846: Add LED controller
      ARM: dts: bcm6846: Add ARM PL081 DMA block
      dt-bindings: vendor-prefixes: Add Genexis
      dt-bindings: arm: bcmbca: Add Genexis XG6846B
      ARM: dts: broadcom: Add Genexis XG6846B DTS file

Liu Ying (2):
      arm64: dts: imx8mp-skov-revb-mi1010ait-1cp1: Set "media_disp2_pix"=
 clock rate to 70MHz
      arm64: dts: imx8mp-evk: Add NXP LVDS to HDMI adapter cards

Luca Weiss (4):
      arm64: dts: qcom: sm6350: Fix uart1 interconnect path
      arm64: dts: qcom: sm7225-fairphone-fp4: Drop extra qcom,msm-id val=
ue
      arm64: dts: qcom: qcm6490-fairphone-fp5: Prefix regulator-fixed la=
bel
      arm64: dts: qcom: qcm6490-fairphone-fp5: Enable camera EEPROMs

Luo Jie (3):
      dt-bindings: clock: qcom: Add CMN PLL clock controller for IPQ SoC
      arm64: dts: qcom: ipq9574: Add CMN PLL node
      arm64: dts: qcom: ipq9574: Update xo_board_clk to use fixed factor=
 clock

MD Danish Anwar (2):
      dt-bindings: soc: ti: pruss: Add clocks for ICSSG
      arm64: dts: ti: k3-am64-main: Switch ICSSG clock to core clock

Mahadevan (1):
      arm64: dts: qcom: sa8775p: add display dt nodes for MDSS0 and DPU

Mamta Shukla (1):
      arm: dts: socfpga: use reset-name "stmmaceth-ocp" instead of "ahb"

Manikanta Mylavarapu (6):
      arm64: dts: qcom: ipq5424: Add smem and tcsr_mutex nodes
      arm64: dts: qcom: ipq5424: Add watchdog node
      arm64: dts: qcom: ipq5424: add spi nodes
      arm64: dts: qcom: ipq5424: configure spi0 node for rdp466
      arm64: dts: qcom: ipq5424: add scm node
      arm64: dts: qcom: ipq5424: enable the download mode support

Manivannan Sadhasivam (1):
      arm64: dts: qcom: sa8775p: Fix the size of 'addr_space' regions

Manojkiran Eda (1):
      ARM: dts: aspeed: Enable PECI and LPC snoop for IBM System1

Mao Jinlong (1):
      arm64: dts: qcom: sm8450: Add coresight nodes

Marek Vasut (6):
      MAINTAINERS: Update entry for DH electronics DHSOM SoMs and boards
      ARM: dts: stm32: Deduplicate serial aliases and chosen node for ST=
M32MP15xx DHCOM SoM
      ARM: dts: stm32: Increase CPU core voltage on STM32MP13xx DHCOR SoM
      ARM: dts: stm32: Sort M24256E write-lockable page in DH STM32MP13x=
x DHCOR SoM DT
      ARM: dts: stm32: Swap USART3 and UART8 alias on STM32MP15xx DHCOM =
SoM
      arm64: dts: qcom: msm8996-xiaomi-gemini: Fix LP5562 LED1 reg prope=
rty

Markus Niebel (2):
      arm64: dts: imx93-tqma9352-mba93xxca: enable Open Drain for MDIO
      arm64: dts: imx93-tqma9352-mba93xxla: enable Open Drain for MDIO

Markuss Broks (2):
      arm64: dts: exynos: Add Exynos9810 SoC support
      arm64: dts: exynos: Add initial support for Samsung Galaxy S9 (SM-=
G960F)

Martin Blumenstingl (1):
      ARM: dts: amlogic: meson: remove size and address cells from USB n=
odes

Maud Spierings (3):
      arm64: dts: qcom: x1e80100-vivobook-s15: Enable the gpu
      arm64: dts: qcom: x1e80100-vivobook-s15: Use the samsung,atna33xc2=
0 panel driver
      arm64: dts: qcom: x1e80100-vivobook-s15: Add lid switch

Maulik Shah (1):
      arm64: dts: qcom: sa8775p: Add CPUs to psci power domain

Md Sadre Alam (3):
      arm64: dts: qcom: ipq5424: add TRNG node
      arm64: dts: qcom: ipq9574: update TRNG compatible
      arm64: dts: qcom: ipq5332: update TRNG compatible

Melody Olvera (6):
      dt-bindings: arm: qcom: Document SM8750 SoC and boards
      arm64: dts: qcom: Add PMD8028 PMIC
      arm64: dts: qcom: Add PMIH0108 PMIC
      arm64: dts: qcom: Add base SM8750 dtsi
      arm64: dts: qcom: sm8750: Add pmic dtsi
      arm64: dts: qcom: sm8750: Add MTP and QRD boards

Mesih Kilinc (3):
      ARM: dts: suniv: f1c100s: Add support for DMA
      ARM: dts: suniv: f1c100s: Add support for Audio Codec
      ARM: dts: suniv: f1c100s: Activate Audio Codec for Lichee Pi Nano

Michael Riesch (2):
      arm64: dts: rockchip: fix num-channels property of wolfvision pf5 =
mic
      arm64: dts: rockchip: enable hdmi out audio on wolfvision pf5

Michal Pecio (1):
      ARM: tegra: nyan: Maintain power to USB ports on boot

Michal Wilczynski (1):
      riscv: dts: thead: Add mailbox node

Mihai Sain (4):
      ARM: dts: microchip: sam9x7: Move i2c address/size to dtsi
      ARM: dts: microchip: sam9x75_curiosity: Add power monitor support
      ARM: dts: microchip: sam9x60: Add address/size to spi-controller n=
odes
      ARM: dts: microchip: sam9x7: Add address/size to spi-controller no=
des

Naresh Solanki (1):
      dt-bindings: arm: aspeed: add IBM SBP1 board

Neil Armstrong (13):
      dt-bindings: soc: amlogic,meson-gx-hhi-sysctrl: Document the Syste=
m Control registers found on early Meson SoC
      arm64: dts: qcom: sm8550: add interconnect and opp-peak-kBps for G=
PU
      arm64: dts: qcom: sm8650: add interconnect and opp-peak-kBps for G=
PU
      arm64: dts: qcom: qcm6490-shift-otter: remove invalid orientation-=
switch
      arm64: dts: qcom: sdm845-db845c-navigation-mezzanine: remove disab=
led ov7251 camera
      arm64: dts: qcom: sc7180-trogdor-quackingstick: add missing avee-s=
upply
      arm64: dts: qcom: sc7180-trogdor-pompom: rename 5v-choke thermal z=
one
      arm64: dts: qcom: sc7180: fix psci power domain node names
      arm64: dts: qcom: sm8150-microsoft-surface-duo: fix typos in da728=
0 properties
      arm64: dts: qcom: pmi8950: add LAB-IBB nodes
      arm64: dts: qcom: sdm450-lenovo-tbx605f: add DSI panel nodes
      arm64: dts: qcom: sm8550: Add 'global' interrupt to the PCIe RC no=
des
      arm64: dts: qcom: sm8650: Add 'global' interrupt to the PCIe RC no=
des

Niklas Cassel (1):
      arm64: dts: rockchip: enable the mmu600_pcie IOMMU on the rk3588 S=
oC

Niklas S=C3=B6derlund (4):
      arm64: dts: renesas: gray-hawk-single: Add video capture support
      arm64: dts: renesas: r8a779a0: Remove address- and size-cells from=
 AVB[1-5]
      arm64: dts: renesas: falcon-ethernet: Describe PHYs connected on t=
he breakout board
      arm64: dts: renesas: white-hawk-csi-dsi: Define CSI-2 data line or=
ders

Ninad Palsule (4):
      ARM: dts: aspeed: system1: Bump up i2c busses freq
      ARM: dts: aspeed: system1: Enable serial gpio0
      ARM: dts: aspeed: system1: Add GPIO line names
      ARM: dts: aspeed: system1: Use crps PSU driver

Niravkumar L Rabara (2):
      arm64: dts: socfpga: agilex: Add VGIC maintenance interrupt
      arm64: dts: socfpga: agilex5: Add gpio0 node and spi dma handshake=
 id

N=C3=ADcolas F. R. A. Prado (5):
      arm64: dts: mediatek: mt8186: Move wakeup to MTU3 to get working s=
uspend
      arm64: dts: mt6359: Add #sound-dai-cells property
      arm64: dts: mediatek: mt8390-genio-700-evk: Add sound output suppo=
rt
      arm64: dts: mediatek: mt8195: Remove suspend-breaking reset from p=
cie1
      arm64: dts: mediatek: Set mediatek,mac-wol on DWMAC node for all b=
oards

Olivier Moysan (3):
      arm64: dts: st: add i2s support to stm32mp251
      arm64: dts: st: add sai support on stm32mp251
      arm64: dts: st: add spdifrx support on stm32mp251

Otto Pfl=C3=BCger (1):
      arm64: dts: qcom: Add initial support for MSM8917

Patrick Rudolph (1):
      ARM: dts: aspeed: sbp1: IBM sbp1 BMC board

Patrick Williams (1):
      ARM: dts: aspeed: yosemite4: adjust secondary flash name

Peng Fan (3):
      arm64: dts: freescale: imx93-11x11-evk: enable fsl,ext-reset-outpu=
t for wdog3
      arm64: dts: freescale: imx93-14x14-evk: enable fsl,ext-reset-outpu=
t for wdog3
      arm64: dts: freescale: imx93-9x9-qsb: enable fsl,ext-reset-output =
for wdog3

Pengyu Luo (2):
      dt-bindings: arm: qcom: Document Huawei Matebook E Go (sc8280xp)
      arm64: dts: qcom: sc8280xp: Add Huawei Matebook E Go (sc8280xp)

Peter Yin (2):
      ARM: dts: aspeed: Harma: add rtc device
      ARM: dts: aspeed: Harma: revise sgpio line name

Petr Vorel (1):
      arm64: dts: qcom: msm8994-angler: Enable power key, volume up/down

Potin Lai (6):
      ARM: dts: aspeed: catalina: add i2c-mux-idle-disconnect to all mux
      ARM: dts: aspeed: catalina: move hdd board i2c mux bus to i2c5
      ARM: dts: aspeed: catalina: enable mac2
      ARM: dts: aspeed: catalina: update NIC1 fru address
      ARM: dts: aspeed: catalina: revise ltc4287 shunt-resistor value
      ARM: dts: aspeed: catalina: remove interrupt of GPIOB4 form all IO=
EXP

Prashanth K (11):
      arm64: dts: qcom: sdm630: Disable USB U1/U2 entry
      arm64: dts: qcom: sdm845: Disable USB U1/U2 entry
      arm64: dts: qcom: sdx75: Disable USB U1/U2 entry
      arm64: dts: qcom: qcs404: Disable USB U1/U2 entry
      arm64: dts: qcom: sc7180: Disable USB U1/U2 entry
      arm64: dts: qcom: x1e80100: Disable USB U1/U2 entry
      arm64: dts: qcom: qdu1000: Disable USB U1/U2 entry
      arm64: dts: qcom: sc8280xp: Disable USB U1/U2 entry
      arm64: dts: qcom: sc8180x: Disable USB U1/U2 entry
      ARM: dts: qcom: sdx65: Disable USB U1/U2 entry
      ARM: dts: qcom: sdx55: Disable USB U1/U2 entry

Qiang Yu (1):
      arm64: dts: qcom: x1e80100: Add support for PCIe3 on x1e80100

Qingqing Zhou (2):
      arm64: dts: qcom: qcs615: add the SCM node
      arm64: dts: qcom: qcs615: add the APPS SMMU node

Rafa=C5=82 Mi=C5=82ecki (1):
      ARM: dts: mediatek: mt7623: fix IR nodename

Rakesh Kota (1):
      arm64: dts: qcom: qcm6490-idp: Allow UFS regulators load/mode sett=
ing

Raviteja Laggyshetty (1):
      dt-bindings: interconnect: add interconnect bindings for SM8750

Richard Acayan (5):
      arm64: dts: qcom: pm660l: add flash leds
      arm64: dts: qcom: sdm670-google-sargo: add flash leds
      arm64: dts: qcom: sdm670: add gpu
      arm64: dts: qcom: sdm670-google-sargo: enable gpu
      arm64: dts: qcom: sdm670: add camcc

Ricky CX Wu (23):
      ARM: dts: aspeed: yosemite4: Remove temperature sensors on Medusa =
Board
      ARM: dts: aspeed: yosemite4: Change eeprom for Medusa Board
      ARM: dts: aspeed: yosemite4: Enable watchdog2
      ARM: dts: aspeed: yosemite4: Enable adc15
      ARM: dts: aspeed: yosemite4: Enable interrupt setting for pca9555
      ARM: dts: aspeed: yosemite4: Revise to use adm1281 on Medusa board
      ARM: dts: aspeed: yosemite4: Add gpio pca9506 for CPLD IOE
      ARM: dts: aspeed: yosemite4: Revise adc128d818 adc mode on Spider =
Board
      ARM: dts: aspeed: yosemite4: Enable spi-gpio setting for TPM
      ARM: dts: aspeed: yosemite4: Revise quad mode to dual mode
      ARM: dts: aspeed: yosemite4: revise flash layout to 128MB
      ARM: dts: aspeed: yosemite4: Add i2c-mux for Management Board
      ARM: dts: aspeed: yosemite4: correct the compatible string of adm1=
272
      ARM: dts: aspeed: yosemite4: Remove IO expanders on I2C bus 13
      ARM: dts: aspeed: yosemite4: add i2c-mux for all Server Board slots
      ARM: dts: aspeed: yosemite4: Add i2c-mux for four NICs
      ARM: dts: aspeed: yosemite4: Add i2c-mux for CPLD IOE on Spider Bo=
ard
      ARM: dts: aspeed: yosemite4: Add required properties for IOE on fa=
n boards
      ARM: dts: aspeed: yosemite4: correct the compatible string for max=
31790
      ARM: dts: aspeed: yosemite4: Revise address of i2c-mux for two fan=
 boards
      ARM: dts: aspeed: yosemite4: Change the address of Fan IC on fan b=
oards
      ARM: dts: aspeed: yosemite4: Revise adc128d818 adc mode on Fan Boa=
rds
      ARM: dts: aspeed: yosemite4: Add i2c-mux for ADC monitor on Spider=
 Board

Rob Herring (Arm) (8):
      ARM: dts: aspeed: Fix at24 EEPROM node names
      ARM: dts: nuvoton: Fix at24 EEPROM node names
      arm64: dts: altera: Remove unused and undocumented "snps,max-mtu" =
property
      arm64: dts: hisilicon: Remove unused and undocumented "enable-dma"=
 and "bus-id" properties
      arm: dts: broadcom: Remove unused and undocumented properties
      arm64: dts: broadcom: Remove unused and undocumented properties
      arm64: dts: ti: Remove unused and undocumented "ti,(rx|tx)-fifo-de=
pth" properties
      arm64: dts: qcom: Remove unused and undocumented properties

Romain Naour (1):
      ARM: dts: dra7: Add bus_dma_limit for l4 cfg bus

Romain Sioen (2):
      dt-bindings: ARM: at91: Document Microchip SAMA7D65 Curiosity
      ARM: dts: microchip: add support for sama7d65_curiosity board

Rosen Penev (2):
      ARM: dts: meraki-mr26: set mac address for gmac0
      arm64: dts: bcm4908: nvmem-layout conversion

Ryan Wanner (2):
      ARM: dts: at91: Add sama7d65 pinmux
      ARM: dts: microchip: add sama7d65 SoC DT

Sam Edwards (4):
      arm64: dts: broadcom: bcmbca: bcm4908: Reserve CFE stub area
      arm64: dts: broadcom: bcmbca: bcm4908: Protect cpu-release-addr
      dt-bindings: arm64: bcmbca: Add Zyxel EX3510-B based on BCM4906
      arm64: dts: broadcom: bcmbca: bcm4908: Add DT for Zyxel EX3510-B

Sam Protsenko (1):
      arm64: dts: exynos850-e850-96: Specify reserved secure memory expl=
icitly

Sayali Lokhande (2):
      arm64: dts: qcom: qcs615: add UFS node
      arm64: dts: qcom: qcs615-ride: Enable UFS node

Sebastian Reichel (1):
      arm64: dts: rockchip: add WLAN to rk3588-evb1 controller

Shimrra Shai (2):
      dt-bindings: arm: rockchip: Add Firefly ITX-3588J board
      arm64: dts: rockchip: add DTs for Firefly ITX-3588J and its Core-3=
588J SoM

Sibi Sankar (5):
      dt-bindings: arm: qcom: Add Snapdragon Devkit for Windows
      arm64: dts: qcom: Add X1E001DE Snapdragon Devkit for Windows
      arm64: dts: qcom: x1e001de-devkit: Add audio related nodes
      arm64: dts: qcom: x1e001de-devkit: Enable external DP support
      arm64: dts: qcom: x1e001de-devkit: Enable SD card support

Siddharth Vadapalli (7):
      arm64: dts: ti: k3-pinctrl: Introduce deep sleep macros
      arm64: dts: ti: k3-am62x-sk-common: Support SoC wakeup using USB1 =
wakeup
      arm64: dts: ti: k3-am62p-j722s-common-main: Enable USB0 for DFU bo=
ot
      arm64: dts: ti: Makefile: Fix typo "k3-j7200-evm-pcie1-ep.dtbo"
      arm64: dts: ti: k3-j721e-evm: Add overlay for PCIE1 Endpoint Mode
      arm64: dts: ti: k3-am68-sk-base-board: Add overlay for PCIE1 Endpo=
int Mode
      arm64: dts: ti: k3-am69-sk: Add overlay for PCIE0 Endpoint Mode

Sjoerd Simons (1):
      arm64: dts: mediatek: mt8365-evk: Set ethernet alias

Song Xue (1):
      arm64: dts: qcom: qcs615: Add LLCC support for QCS615

Soutrik Mukhopadhyay (2):
      arm64: dts: qcom: sa8775p: add DisplayPort device nodes
      arm64: dts: qcom: sa8775p-ride: Enable Display Port

Sricharan Ramabadhran (2):
      dt-bindings: qcom: Add ipq5424 boards
      arm64: dts: qcom: add IPQ5424 SoC and rdp466 board support

Srinivas Kandagatla (1):
      arm64: dts: qcom: x1e78100-t14s: add sound support

Stanislav Jakubek (6):
      arm64: dts: sprd: sp9860g-1h10: fix constant-charge-voltage-max-mi=
crovolt property
      arm64: dts: sprd: sp9860g-1h10: fix factory-internal-resistance-mi=
cro-ohms property
      arm64: dts: sprd: sc2731: move fuel-gauge monitored-battery to dev=
ice DTS
      arm64: dts: sprd: sc9863a: fix in-ports property
      arm64: dts: sprd: sc9863a: reorder clocks, clock-names per bindings
      arm64: dts: sprd: Fix battery-detect-gpios property

Stefan Kerkmann (3):
      ARM: dts: imx6qdl: add phy-3p0-supply to usb phys
      ARM: dts: imx6sl: add phy-3p0-supply to usb phys
      ARM: dts: imx6sx: add phy-3p0-supply to usb phys

Stephan Gerhold (14):
      arm64: dts: qcom: x1e80100-pmics: Enable all SMB2360 separately
      arm64: dts: qcom: x1e80100: Add QUP power domains and OPPs
      arm64: dts: qcom: x1e80100: Add uart14
      arm64: dts: qcom: x1e001de-devkit: Fix USB QMP PHY supplies
      arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s: Fix USB QMP PHY s=
upplies
      arm64: dts: qcom: x1e80100-asus-vivobook-s15: Fix USB QMP PHY supp=
lies
      arm64: dts: qcom: x1e80100-crd: Fix USB QMP PHY supplies
      arm64: dts: qcom: x1e80100-dell-xps13-9345: Fix USB QMP PHY suppli=
es
      arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Fix USB QMP PHY sup=
plies
      arm64: dts: qcom: x1e80100-microsoft-romulus: Fix USB QMP PHY supp=
lies
      arm64: dts: qcom: x1e80100-qcp: Fix USB QMP PHY supplies
      arm64: dts: qcom: x1e80100-qcp: Add FSUSB42 USB switches
      arm64: dts: qcom: x1e80100-qcp: Enable external DP support
      arm64: dts: qcom: msm8916-samsung-serranove: Add display panel

Sumit Gupta (2):
      arm64: tegra: Fix typo in Tegra234 dce-fabric compatible
      arm64: tegra: Disable Tegra234 sce-fabric node

Taniya Das (5):
      dt-bindings: clock: qcom: Add QCS615 GCC clocks
      arm64: dts: qcom: sa8775p: Update sleep_clk frequency
      arm64: dts: qcom: sa8775p: Add support for clock controllers
      dt-bindings: clock: qcom: Add SM8750 GCC
      dt-bindings: clock: qcom: Document the SM8750 TCSR Clock Controller

Thomas Richard (1):
      arm64: dts: ti: k3-j784s4: Use ti,j7200-padconf compatible

Tingguo Cheng (3):
      arm64: dts: qcom: qcs615: Adds SPMI support
      arm64: dts: qcom: move pon reboot-modes from pm8150.dtsi to board =
files
      arm64: dts: qcom: qcs615-ride: Enable PMIC peripherals

Tomi Valkeinen (3):
      arm64: dts: renesas: gray-hawk-single: Fix indentation
      arm64: dts: renesas: r8a779h0: Add display support
      arm64: dts: renesas: gray-hawk-single: Add DisplayPort support

Udit Kumar (1):
      arm64: dts: ti: k3-j722s-evm: Enable PMIC

Umer Uddin (5):
      dt-bindings: arm: samsung: samsung-boards: Add bindings for SM-G98=
1B and SM-G980F board
      arm64: dts: exynos: Add initial support for Samsung Galaxy S20 Ser=
ies boards (x1s-common)
      arm64: dts: exynos: Add initial support for Samsung Galaxy S20 5G =
(x1s)
      arm64: dts: exynos: Add initial support for Samsung Galaxy S20 (x1=
slte)
      arm64: dts: exynos990: Add a PMU node for the third cluster

Uwe Kleine-K=C3=B6nig (1):
      ARM: dts: socfpga_cyclone5_mcvevk: Drop unused #address-cells/#siz=
e-cells

Val Packett (7):
      arm64: dts: mediatek: mt8516: fix GICv2 range
      arm64: dts: mediatek: mt8516: fix wdt irq type
      arm64: dts: mediatek: mt8516: add i2c clock-div property
      arm64: dts: mediatek: mt8516: reserve 192 KiB for TF-A
      dt-bindings: mediatek,mt6779-keypad: add more compatibles
      arm64: dts: mediatek: add per-SoC compatibles for keypad nodes
      arm64: dts: mediatek: mt8516: add keypad node

Varadarajan Narayanan (2):
      arm64: dts: qcom: ipq5424: Add LLCC/system-cache-controller
      arm64: dts: qcom: ipq5424: Add USB controller and phy nodes

Vasily Khoruzhick (2):
      dt-bindings: clock: sunxi: Export PLL_VIDEO_2X and PLL_MIPI
      arm64: dts: allwinner: a64: explicitly assign clock parent for TCO=
N0

Vibhore Vardhan (1):
      arm64: dts: ti: k3-am62a-wakeup: Configure ti-sysc for wkup_uart0

Viken Dadhaniya (1):
      arm64: dts: qcom: qcs615: Add QUPv3 configuration

Vladimir Zapolskiy (3):
      arm64: dts: qcom: sc8280xp: Fix interrupt type of camss interrupts
      arm64: dts: qcom: sdm845: Fix interrupt types of camss interrupts
      arm64: dts: qcom: sm8250: Fix interrupt types of camss interrupts

Wadim Egorov (4):
      arm64: dts: ti: k3-am62x-phyboard-lyra: Set RGB input to 16-bit fo=
r HDMI bridge
      arm64: dts: ti: k3-am62x-phyboard-lyra: Add HDMI bridge regulators
      arm64: dts: ti: k3-am62-phycore-som: Define vcc-supply for I2C EEP=
ROM
      arm64: dts: ti: am62-phyboard-lyra: Provide a vcc-supply for the I=
2C EEPROM

Wei Fang (2):
      arm64: dts: imx95: add NETC related nodes
      arm64: dts: imx95-19x19-evk: add ENETC 0 support

Wojciech Macek (2):
      dt-bindings: arm: mediatek: Add MT8186 Starmie Chromebooks
      arm64: dts: mediatek: mt8186: Add Starmie device

Wolfram Sang (1):
      arm64: dts: renesas: rzg3s-smarc: Enable I2C1 and connected power =
monitor

Xin Liu (1):
      arm64: dts: qcom: qcs8300: Add watchdog node

Yang Chen (7):
      ARM: dts: aspeed: minerva: Revise the SGPIO line name
      ARM: dts: aspeed: minerva: change the i2c mux number for FCBs
      ARM: dts: aspeed: minerva: add fru device for other blades
      ARM: dts: aspeed: minerva: add i/o expanders on bus 0
      ARM: dts: aspeed: minerva: add i/o expanders on each FCB
      ARM: dts: aspeed: minerva: add bmc ready led setting
      ARM: dts: aspeed: minerva: add second source RTC

Yijie Yang (2):
      arm64: dts: qcom: qcs8300: add the first 2.5G ethernet
      arm64: dts: qcom: qcs8300-ride: enable ethernet0

Yuanfang Zhang (1):
      arm64: dts: qcom: sm8650: Add coresight nodes

Yuanjie Yang (2):
      arm64: dts: qcom: qcs615: add SDHC1 and SDHC2
      arm64: dts: qcom: qcs615-ride: enable SDHC1 and SDHC2

Yuvaraj Ranganathan (3):
      arm64: dts: qcom: qcs8300: add QCrypto nodes
      arm64: dts: qcom: qcs8300: add TRNG node
      arm64: dts: qcom: qcs8300: enable the inline crypto engine

Zhengqiao Xia (4):
      dt-bindings: arm: mediatek: Add MT8186 Chinchou Chromebook
      arm64: dts: mediatek: Add MT8186 Chinchou Chromebooks
      arm64: dts: mediatek: Add extcon node for DP bridge
      arm64: dts: mediatek: Modify audio codec name for pmic

devi priya (2):
      arm64: dts: qcom: ipq9574: Add PCIe PHYs and controller nodes
      arm64: dts: qcom: ipq9574: Enable PCIe PHYs and controllers

 .../devicetree/bindings/arm/aspeed/aspeed.yaml     |    2 +
 .../devicetree/bindings/arm/atmel-at91.yaml        |    7 +
 .../devicetree/bindings/arm/atmel-sysregs.txt      |   14 +-
 .../devicetree/bindings/arm/bcm/brcm,bcmbca.yaml   |    2 +
 Documentation/devicetree/bindings/arm/fsl.yaml     |    9 +
 .../devicetree/bindings/arm/mediatek.yaml          |   65 +-
 .../devicetree/bindings/arm/qcom-soc.yaml          |    9 +-
 Documentation/devicetree/bindings/arm/qcom.yaml    |   64 +
 .../devicetree/bindings/arm/rockchip.yaml          |   94 +-
 .../bindings/arm/samsung/samsung-boards.yaml       |    3 +
 .../devicetree/bindings/arm/stm32/stm32.yaml       |    7 +
 .../bindings/clock/qcom,ipq9574-cmn-pll.yaml       |   77 +
 .../devicetree/bindings/clock/qcom,qcs615-gcc.yaml |   59 +
 .../bindings/clock/qcom,sm8550-dispcc.yaml         |    4 +-
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |    2 +
 .../devicetree/bindings/clock/qcom,sm8750-gcc.yaml |   62 +
 .../bindings/clock/renesas,rzv2h-cpg.yaml          |   15 +-
 .../bindings/clock/samsung,exynos990-clock.yaml    |  121 +
 .../bindings/display/mediatek/mediatek,ovl.yaml    |   12 +-
 .../devicetree/bindings/gpu/arm,mali-utgard.yaml   |    1 +
 .../bindings/input/mediatek,mt6779-keypad.yaml     |    3 +
 .../bindings/interconnect/qcom,sm8750-rpmh.yaml    |  136 +
 .../bindings/pinctrl/renesas,rzg2l-pinctrl.yaml    |    7 +-
 .../soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml  |   14 +
 .../devicetree/bindings/soc/renesas/renesas.yaml   |   33 +-
 .../devicetree/bindings/soc/rockchip/grf.yaml      |    1 +
 .../devicetree/bindings/soc/ti/ti,pruss.yaml       |   10 +
 .../sram/allwinner,sun4i-a10-system-control.yaml   |    4 +-
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 MAINTAINERS                                        |   16 +-
 .../dts/allwinner/suniv-f1c100s-licheepi-nano.dts  |    8 +
 arch/arm/boot/dts/allwinner/suniv-f1c100s.dtsi     |   24 +
 arch/arm/boot/dts/amlogic/meson.dtsi               |    4 -
 arch/arm/boot/dts/aspeed/Makefile                  |    2 +
 .../dts/aspeed/aspeed-bmc-ampere-mtjefferson.dts   |  622 ++
 .../dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts    |   18 +-
 .../dts/aspeed/aspeed-bmc-facebook-catalina.dts    |  191 +-
 .../boot/dts/aspeed/aspeed-bmc-facebook-harma.dts  |   45 +-
 .../dts/aspeed/aspeed-bmc-facebook-minerva.dts     |  998 +++-
 .../dts/aspeed/aspeed-bmc-facebook-yosemite4.dts   | 1011 +++-
 .../boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dts   |   46 +-
 .../arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts |   27 +
 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dts   |  111 +-
 .../arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dts |   17 +-
 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dts   | 6086 +++++++++++++=
+++++++
 .../arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts |   31 +-
 arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dts |    8 +-
 .../arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dts |    6 +-
 arch/arm/boot/dts/aspeed/aspeed-bmc-vegman.dtsi    |    2 +-
 arch/arm/boot/dts/broadcom/Makefile                |    1 +
 .../arm/boot/dts/broadcom/bcm53015-meraki-mr26.dts |   20 +
 .../dts/broadcom/bcm53340-ubnt-unifi-switch8.dts   |    1 -
 .../boot/dts/broadcom/bcm6846-genexis-xg6846b.dts  |  244 +
 arch/arm/boot/dts/broadcom/bcm6846.dtsi            |  120 +
 arch/arm/boot/dts/broadcom/bcm953012hr.dts         |    1 -
 arch/arm/boot/dts/broadcom/bcm953012k.dts          |    1 -
 arch/arm/boot/dts/broadcom/bcm958522er.dts         |    1 -
 arch/arm/boot/dts/broadcom/bcm958525er.dts         |    1 -
 arch/arm/boot/dts/broadcom/bcm958525xmc.dts        |    1 -
 arch/arm/boot/dts/broadcom/bcm958622hr.dts         |    1 -
 arch/arm/boot/dts/broadcom/bcm958623hr.dts         |    1 -
 arch/arm/boot/dts/broadcom/bcm958625hr.dts         |    1 -
 arch/arm/boot/dts/broadcom/bcm958625k.dts          |    1 -
 arch/arm/boot/dts/broadcom/bcm988312hr.dts         |    1 -
 .../boot/dts/intel/socfpga/socfpga_arria10.dtsi    |    6 +-
 .../dts/intel/socfpga/socfpga_cyclone5_mcvevk.dts  |    2 -
 .../dts/intel/socfpga/socfpga_cyclone5_socdk.dts   |    6 -
 arch/arm/boot/dts/marvell/mmp2-olpc-xo-1-75.dts    |    4 +-
 arch/arm/boot/dts/mediatek/mt7623.dtsi             |    2 +-
 arch/arm/boot/dts/microchip/Makefile               |    3 +
 .../boot/dts/microchip/at91-sam9x75_curiosity.dts  |   54 +-
 .../boot/dts/microchip/at91-sama5d27_wlsom1_ek.dts |    1 +
 .../boot/dts/microchip/at91-sama5d29_curiosity.dts |    1 +
 .../boot/dts/microchip/at91-sama7d65_curiosity.dts |   89 +
 arch/arm/boot/dts/microchip/sam9x60.dtsi           |   12 +
 arch/arm/boot/dts/microchip/sam9x7.dtsi            |   38 +
 arch/arm/boot/dts/microchip/sama7d65-pinfunc.h     |  947 +++
 arch/arm/boot/dts/microchip/sama7d65.dtsi          |  144 +
 arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gbs.dts  |    6 +-
 .../dts/nuvoton/nuvoton-npcm750-runbmc-olympus.dts |    2 +-
 arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi        |    2 +
 arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dts       |    2 +-
 arch/arm/boot/dts/nxp/imx/imx51-zii-scu2-mezz.dts  |    2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi        |    2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi      |    2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi     |    5 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi             |    6 +-
 arch/arm/boot/dts/nxp/imx/imx6sl-evk.dts           |    2 +-
 arch/arm/boot/dts/nxp/imx/imx6sl.dtsi              |    6 +-
 arch/arm/boot/dts/nxp/imx/imx6sll-evk.dts          |    2 +-
 arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi          |    2 +-
 arch/arm/boot/dts/nxp/imx/imx6sx.dtsi              |    6 +-
 arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi    |    2 +-
 arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi           |   61 +-
 arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi          |    3 +-
 arch/arm/boot/dts/nxp/imx/imx7d-mba7.dts           |    3 +-
 arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts            |    2 +-
 arch/arm/boot/dts/qcom/qcom-sdx55.dtsi             |    7 +-
 arch/arm/boot/dts/qcom/qcom-sdx65.dtsi             |    6 +
 arch/arm/boot/dts/renesas/r7s72100.dtsi            |   10 +
 arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi     |   31 +-
 arch/arm/boot/dts/st/Makefile                      |    1 +
 arch/arm/boot/dts/st/stih410-b2260.dts             |    4 +
 arch/arm/boot/dts/st/stih410.dtsi                  |   34 +
 arch/arm/boot/dts/st/stm32mp131.dtsi               |   40 +
 arch/arm/boot/dts/st/stm32mp135f-dk.dts            |   12 +
 arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi    |   16 +-
 arch/arm/boot/dts/st/stm32mp151.dtsi               |   43 +-
 arch/arm/boot/dts/st/stm32mp153c-lxa-tac-gen3.dts  |  267 +
 arch/arm/boot/dts/st/stm32mp157c-ev1.dts           |    9 +
 arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen1.dts  |   84 +
 arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen2.dts  |   84 +
 arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi      |  100 +-
 arch/arm/boot/dts/st/stm32mp15xx-dhcom-drc02.dtsi  |   12 -
 arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2.dtsi   |   10 -
 .../arm/boot/dts/st/stm32mp15xx-dhcom-picoitx.dtsi |   10 -
 arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi    |    7 +
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi          |   18 +
 arch/arm/boot/dts/ti/omap/am437x-l4.dtsi           |   18 +-
 arch/arm/boot/dts/ti/omap/dra7-l4.dtsi             |    2 +
 arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi         |   16 +-
 arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi     |   33 +
 .../boot/dts/allwinner/sun50i-a64-pinebook.dts     |    2 +
 .../boot/dts/allwinner/sun50i-a64-teres-i.dts      |    2 +
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi      |    2 +
 .../boot/dts/allwinner/sun50i-h313-tanix-tx1.dts   |    1 +
 .../boot/dts/altera/socfpga_stratix10_swvp.dts     |    1 -
 arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi   |    3 +-
 .../boot/dts/amlogic/meson-gxl-s905d-p230.dts      |    3 +-
 .../boot/dts/amlogic/meson-gxl-s905d-p231.dts      |    3 +-
 .../boot/dts/amlogic/meson-gxl-s905x-p212.dtsi     |    3 +-
 arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts     |    3 +-
 arch/arm64/boot/dts/amlogic/meson-gxm-q201.dts     |    3 +-
 arch/arm64/boot/dts/broadcom/Makefile              |    1 +
 arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts |   37 +
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts   |   42 +
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi          |  193 +-
 arch/arm64/boot/dts/broadcom/bcmbca/Makefile       |    1 +
 .../dts/broadcom/bcmbca/bcm4906-netgear-r8000p.dts |   12 +-
 .../dts/broadcom/bcmbca/bcm4906-zyxel-ex3510b.dts  |  196 +
 arch/arm64/boot/dts/broadcom/bcmbca/bcm4908.dtsi   |   18 +-
 .../arm64/boot/dts/broadcom/northstar2/ns2-svk.dts |    2 -
 .../arm64/boot/dts/broadcom/northstar2/ns2-xmc.dts |    1 -
 arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi   |    2 -
 arch/arm64/boot/dts/exynos/Makefile                |    4 +
 arch/arm64/boot/dts/exynos/exynos850-e850-96.dts   |   15 +-
 arch/arm64/boot/dts/exynos/exynos8895.dtsi         |   82 +-
 arch/arm64/boot/dts/exynos/exynos9810-pinctrl.dtsi |  503 ++
 arch/arm64/boot/dts/exynos/exynos9810-starlte.dts  |  119 +
 arch/arm64/boot/dts/exynos/exynos9810.dtsi         |  273 +
 arch/arm64/boot/dts/exynos/exynos990-r8s.dts       |  115 +
 .../boot/dts/exynos/exynos990-x1s-common.dtsi      |   98 +
 arch/arm64/boot/dts/exynos/exynos990-x1s.dts       |   28 +
 arch/arm64/boot/dts/exynos/exynos990-x1slte.dts    |   28 +
 arch/arm64/boot/dts/exynos/exynos990.dtsi          |   50 +-
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi     |   83 +
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts |  104 +
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |    5 +-
 arch/arm64/boot/dts/freescale/Makefile             |   13 +
 arch/arm64/boot/dts/freescale/imx8mm-phg.dts       |    2 +-
 .../dts/freescale/imx8mn-bsh-smm-s2-display.dtsi   |   28 +
 .../freescale/imx8mp-aristainetos3-adpismarc.dts   |   37 +
 .../imx8mp-aristainetos3-helios-lvds.dtso          |  113 +
 .../dts/freescale/imx8mp-aristainetos3-helios.dts  |   98 +
 .../freescale/imx8mp-aristainetos3-proton2s.dts    |  161 +
 .../freescale/imx8mp-aristainetos3a-som-v1.dtsi    | 1107 ++++
 .../freescale/imx8mp-evk-imx-lvds-hdmi-common.dtsi |   29 +
 .../imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtso  |   44 +
 .../imx8mp-evk-lvds0-imx-lvds-hdmi-common.dtsi     |   43 +
 .../freescale/imx8mp-evk-lvds0-imx-lvds-hdmi.dtso  |   28 +
 .../imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtso  |   44 +
 .../imx8mp-evk-lvds1-imx-lvds-hdmi-common.dtsi     |   43 +
 .../freescale/imx8mp-evk-lvds1-imx-lvds-hdmi.dtso  |   28 +
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts       |    6 +
 .../freescale/imx8mp-skov-revb-mi1010ait-1cp1.dts  |    8 +-
 .../boot/dts/freescale/imx8mq-librem5-devkit.dts   |    2 +-
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi  |    2 +-
 .../arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi |    2 -
 arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts  |    8 +
 arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts  |   92 +
 arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts    |   14 +
 .../dts/freescale/imx93-tqma9352-mba93xxca.dts     |    8 +-
 .../dts/freescale/imx93-tqma9352-mba93xxla.dts     |    8 +-
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts  |   52 +
 arch/arm64/boot/dts/freescale/imx95.dtsi           |   93 +
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi          |    2 -
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi      |    3 +
 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi     |   24 +-
 arch/arm64/boot/dts/marvell/armada-7040-db.dts     |    1 +
 .../boot/dts/marvell/armada-7040-mochabin.dts      |    2 +
 .../dts/marvell/armada-8040-clearfog-gt-8k.dts     |    1 +
 arch/arm64/boot/dts/marvell/armada-8040-db.dts     |    5 +-
 arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi |    3 +-
 .../boot/dts/marvell/armada-8040-puzzle-m801.dts   |    2 +
 arch/arm64/boot/dts/marvell/armada-cp11x.dtsi      |    2 +
 arch/arm64/boot/dts/marvell/cn9130-crb-B.dts       |    1 +
 arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dts |    4 +-
 arch/arm64/boot/dts/marvell/cn9131-db.dtsi         |    1 +
 arch/arm64/boot/dts/marvell/cn9132-db.dtsi         |    1 +
 arch/arm64/boot/dts/mediatek/Makefile              |   19 +-
 arch/arm64/boot/dts/mediatek/mt2712-evb.dts        |    1 +
 arch/arm64/boot/dts/mediatek/mt6359.dtsi           |    1 +
 .../dts/mediatek/mt7986a-bananapi-bpi-r3-sata.dtso |   34 +
 .../dts/mediatek/mt7988a-bananapi-bpi-r4-emmc.dtso |   33 +
 .../dts/mediatek/mt7988a-bananapi-bpi-r4-sd.dtso   |   31 +
 .../boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts  |  398 ++
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi          |  365 +-
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi       |   29 +-
 arch/arm64/boot/dts/mediatek/mt8173-evb.dts        |   25 +-
 .../dts/mediatek/mt8183-kukui-jacuzzi-damu.dts     |    4 +
 .../dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts    |   15 +
 .../dts/mediatek/mt8183-kukui-jacuzzi-willow.dtsi  |   15 +
 .../boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi    |    2 -
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi     |    9 +-
 arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts    |    4 -
 arch/arm64/boot/dts/mediatek/mt8183.dtsi           |    5 +-
 .../dts/mediatek/mt8186-corsola-chinchou-sku0.dts  |   18 +
 .../dts/mediatek/mt8186-corsola-chinchou-sku1.dts  |   35 +
 .../dts/mediatek/mt8186-corsola-chinchou-sku16.dts |   29 +
 .../boot/dts/mediatek/mt8186-corsola-chinchou.dtsi |  321 ++
 .../dts/mediatek/mt8186-corsola-starmie-sku0.dts   |   31 +
 .../dts/mediatek/mt8186-corsola-starmie-sku1.dts   |   31 +
 .../boot/dts/mediatek/mt8186-corsola-starmie.dtsi  |  472 ++
 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi   |    8 +-
 arch/arm64/boot/dts/mediatek/mt8186.dtsi           |    8 +-
 .../boot/dts/mediatek/mt8188-geralt-ciri-sku0.dts  |   32 +
 .../boot/dts/mediatek/mt8188-geralt-ciri-sku1.dts  |   59 +
 .../boot/dts/mediatek/mt8188-geralt-ciri-sku2.dts  |   59 +
 .../boot/dts/mediatek/mt8188-geralt-ciri-sku3.dts  |   32 +
 .../boot/dts/mediatek/mt8188-geralt-ciri-sku4.dts  |   48 +
 .../boot/dts/mediatek/mt8188-geralt-ciri-sku5.dts  |   72 +
 .../boot/dts/mediatek/mt8188-geralt-ciri-sku6.dts  |   72 +
 .../boot/dts/mediatek/mt8188-geralt-ciri-sku7.dts  |   48 +
 .../boot/dts/mediatek/mt8188-geralt-ciri.dtsi      |  316 +
 arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi    | 1156 ++++
 arch/arm64/boot/dts/mediatek/mt8188.dtsi           |    9 +-
 .../dts/mediatek/mt8192-asurada-hayato-r5-sku2.dts |   65 -
 .../dts/mediatek/mt8192-asurada-spherion-r4.dts    |   78 -
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi   |    3 -
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi    |    2 -
 arch/arm64/boot/dts/mediatek/mt8195-demo.dts       |   10 +-
 arch/arm64/boot/dts/mediatek/mt8195.dtsi           |    5 +-
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts        |    1 +
 arch/arm64/boot/dts/mediatek/mt8365.dtsi           |    3 +-
 .../boot/dts/mediatek/mt8390-genio-700-evk.dts     |   48 +
 .../boot/dts/mediatek/mt8395-genio-1200-evk.dts    |    2 -
 .../dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts  |    1 +
 .../boot/dts/mediatek/mt8395-radxa-nio-12l.dts     |    2 -
 arch/arm64/boot/dts/mediatek/mt8516.dtsi           |   22 +-
 arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi   |    2 -
 arch/arm64/boot/dts/nvidia/tegra234.dtsi           |    8 +-
 arch/arm64/boot/dts/qcom/Makefile                  |   12 +
 arch/arm64/boot/dts/qcom/ipq5332.dtsi              |    2 +-
 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts        |  169 +
 arch/arm64/boot/dts/qcom/ipq5424.dtsi              |  519 ++
 arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi   |   24 +-
 arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts        |  113 +
 arch/arm64/boot/dts/qcom/ipq9574.dtsi              |  449 +-
 .../boot/dts/qcom/msm8916-samsung-serranove.dts    |   58 +
 arch/arm64/boot/dts/qcom/msm8916.dtsi              |    2 +-
 arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts   |  333 ++
 arch/arm64/boot/dts/qcom/msm8917.dtsi              | 1954 +++++++
 arch/arm64/boot/dts/qcom/msm8939.dtsi              |    2 +-
 .../dts/qcom/msm8994-huawei-angler-rev-101.dts     |   21 +-
 .../boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi  |    5 -
 arch/arm64/boot/dts/qcom/msm8994.dtsi              |   11 +-
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts |    2 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |    9 +-
 arch/arm64/boot/dts/qcom/pm660l.dtsi               |    6 +
 arch/arm64/boot/dts/qcom/pm8150.dtsi               |    2 -
 arch/arm64/boot/dts/qcom/pm8937.dtsi               |  150 +
 arch/arm64/boot/dts/qcom/pmd8028.dtsi              |   62 +
 arch/arm64/boot/dts/qcom/pmi8950.dtsi              |   17 +
 arch/arm64/boot/dts/qcom/pmih0108.dtsi             |   68 +
 arch/arm64/boot/dts/qcom/pmk8350.dtsi              |   72 +
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts |  101 +-
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts           |    8 +
 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts   |    2 -
 arch/arm64/boot/dts/qcom/qcs404.dtsi               |    6 +-
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           |  343 ++
 arch/arm64/boot/dts/qcom/qcs615.dtsi               | 3670 ++++++++++++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |   41 +
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts          |  370 ++
 arch/arm64/boot/dts/qcom/qcs8300.dtsi              | 3548 ++++++++++++
 arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi       |    2 +-
 arch/arm64/boot/dts/qcom/qdu1000-idp.dts           |   19 +-
 arch/arm64/boot/dts/qcom/qdu1000.dtsi              |   16 +
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts           |   61 +-
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts           |    5 +
 arch/arm64/boot/dts/qcom/qru1000-idp.dts           |   19 +-
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi         |   82 +-
 arch/arm64/boot/dts/qcom/sa8775p.dtsi              |  406 +-
 arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts     |  558 ++
 arch/arm64/boot/dts/qcom/sar2130p.dtsi             | 3123 ++++++++++
 .../arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi |    4 +-
 .../dts/qcom/sc7180-trogdor-quackingstick.dtsi     |    1 +
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |   20 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |    6 +-
 .../arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts |    4 -
 arch/arm64/boot/dts/qcom/sc8180x-primus.dts        |    4 -
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              |    6 +
 .../boot/dts/qcom/sc8280xp-huawei-gaokun3.dts      | 1318 +++++
 .../boot/dts/qcom/sc8280xp-microsoft-blackrock.dts | 1325 +++++
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             |   52 +-
 arch/arm64/boot/dts/qcom/sdm450-lenovo-tbx605f.dts |   97 +
 arch/arm64/boot/dts/qcom/sdm630.dtsi               |    4 +
 arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts   |   37 +-
 arch/arm64/boot/dts/qcom/sdm670.dtsi               |  204 +
 .../qcom/sdm845-db845c-navigation-mezzanine.dtso   |   42 -
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts  |    1 -
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |   24 +-
 arch/arm64/boot/dts/qcom/sdx75.dtsi                |    6 +-
 arch/arm64/boot/dts/qcom/sm4250.dtsi               |   39 +
 arch/arm64/boot/dts/qcom/sm4450.dtsi               |    2 +-
 arch/arm64/boot/dts/qcom/sm6115.dtsi               |   95 +-
 arch/arm64/boot/dts/qcom/sm6125.dtsi               |    4 +-
 arch/arm64/boot/dts/qcom/sm6350.dtsi               |    8 +-
 arch/arm64/boot/dts/qcom/sm6375.dtsi               |   12 +-
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  |    2 +-
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts            |    5 +
 .../boot/dts/qcom/sm8150-microsoft-surface-duo.dts |    9 +-
 arch/arm64/boot/dts/qcom/sm8150-mtp.dts            |    5 +
 .../boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi   |    5 +
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |    4 +
 arch/arm64/boot/dts/qcom/sm8250-hdk.dts            |    5 +
 arch/arm64/boot/dts/qcom/sm8250-mtp.dts            |    5 +
 .../boot/dts/qcom/sm8250-sony-xperia-edo.dtsi      |    5 +
 .../boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi  |  120 +
 arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts    |    5 +
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |   34 +-
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts            |    7 +
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |  498 +-
 arch/arm64/boot/dts/qcom/sm8450.dtsi               | 1000 +++-
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts            |    2 +-
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts            |    2 +-
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts            |    2 +-
 arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts    |    2 +-
 .../dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts    |    2 +-
 arch/arm64/boot/dts/qcom/sm8550.dtsi               |  296 +-
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts            |    2 +-
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts            |    2 +-
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts            |    2 +-
 arch/arm64/boot/dts/qcom/sm8650.dtsi               |  504 +-
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts            |  794 +++
 arch/arm64/boot/dts/qcom/sm8750-pmics.dtsi         |  188 +
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts            |  792 +++
 arch/arm64/boot/dts/qcom/sm8750.dtsi               | 2907 ++++++++++
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts       | 1371 +++++
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts     |  320 +-
 .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   |   60 +-
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts          |   14 +-
 .../boot/dts/qcom/x1e80100-dell-xps13-9345.dts     |  305 +-
 .../boot/dts/qcom/x1e80100-hp-omnibook-x14.dts     | 1693 ++++++
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  |   52 +-
 .../boot/dts/qcom/x1e80100-microsoft-romulus.dtsi  |  527 +-
 arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi       |    4 +
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts          |  298 +-
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             | 2450 +++++++-
 arch/arm64/boot/dts/renesas/Makefile               |   12 +-
 .../boot/dts/renesas/r8a779a0-falcon-ethernet.dtsi |  242 +
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi          |   10 -
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi          |   40 +
 .../dts/renesas/r8a779g2-white-hawk-single.dts     |   62 +-
 .../dts/renesas/r8a779g3-white-hawk-single.dts     |   16 +
 arch/arm64/boot/dts/renesas/r8a779g3.dtsi          |   12 +
 .../boot/dts/renesas/r8a779h0-gray-hawk-single.dts |  298 +-
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi          |   73 +
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi         |  237 +
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi         |  387 ++
 arch/arm64/boot/dts/renesas/r9a09g047e37.dtsi      |   18 +
 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts |   31 +
 arch/arm64/boot/dts/renesas/r9a09g047e57.dtsi      |   13 +
 .../boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts    |   36 +-
 arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi    |   24 +
 arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi   |   28 +
 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi   |   56 +-
 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi       |   83 +-
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi           |   18 +-
 arch/arm64/boot/dts/renesas/ulcb.dtsi              |    5 +
 ...a7212.dtso =3D> white-hawk-ard-audio-da7212.dtso} |    6 +-
 .../arm64/boot/dts/renesas/white-hawk-csi-dsi.dtsi |    2 +
 arch/arm64/boot/dts/renesas/white-hawk-single.dtsi |   73 +
 arch/arm64/boot/dts/rockchip/Makefile              |    7 +
 arch/arm64/boot/dts/rockchip/rk3308-rock-s0.dts    |   25 +-
 arch/arm64/boot/dts/rockchip/rk3328-a1.dts         |    1 -
 arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2.dtsi |    1 -
 .../boot/dts/rockchip/rk3328-orangepi-r1-plus.dtsi |    1 -
 arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dts  |    3 -
 arch/arm64/boot/dts/rockchip/rk3328-rock64.dts     |    1 -
 arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi      |    2 +-
 .../dts/rockchip/rk3566-bigtreetech-cb2-manta.dts  |   10 +
 .../boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi  |  904 +++
 .../boot/dts/rockchip/rk3566-bigtreetech-pi2.dts   |   10 +
 arch/arm64/boot/dts/rockchip/rk3568-mecsbc.dts     |   19 +-
 arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts |   61 +
 .../boot/dts/rockchip/rk3568-wolfvision-pf5.dts    |   10 +-
 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts   |  731 +++
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           |  169 +
 arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts |  743 +++
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |    3 +-
 .../boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtsi |   81 +-
 arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts   |   82 +
 arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi     |    4 +
 .../dts/rockchip/rk3588-firefly-core-3588j.dtsi    |  443 ++
 .../boot/dts/rockchip/rk3588-firefly-itx-3588j.dts |  702 +++
 .../arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts |  802 +++
 .../dts/rockchip/rk3588-orangepi-5-compact.dtsi    |  151 +
 .../boot/dts/rockchip/rk3588-orangepi-5-max.dts    |   60 +
 .../boot/dts/rockchip/rk3588-orangepi-5-plus.dts   |  894 +--
 .../arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi |  805 +++
 .../arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi |   18 +
 .../boot/dts/socionext/uniphier-ld11-global.dts    |    2 +-
 .../boot/dts/socionext/uniphier-ld20-global.dts    |    2 +-
 arch/arm64/boot/dts/sprd/sc2731.dtsi               |    6 +-
 arch/arm64/boot/dts/sprd/sc9863a.dtsi              |   14 +-
 arch/arm64/boot/dts/sprd/sp9860g-1h10.dts          |    9 +-
 arch/arm64/boot/dts/st/stm32mp251.dtsi             |  234 +
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts         |   97 +
 arch/arm64/boot/dts/ti/Makefile                    |   19 +-
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi           |    1 -
 arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi    |   11 +
 arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts     |    2 +-
 arch/arm64/boot/dts/ti/k3-am625-sk.dts             |    7 -
 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi          |    1 -
 arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi        |   36 +-
 .../boot/dts/ti/k3-am62p-j722s-common-main.dtsi    |    5 +
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts            |    4 +
 arch/arm64/boot/dts/ti/k3-am62x-phyboard-lyra.dtsi |   24 +
 arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi     |    6 +-
 arch/arm64/boot/dts/ti/k3-am64-main.dtsi           |   22 +-
 ...-pcie.dtso =3D> k3-am642-hummingboard-t-pcie.dts} |   14 +-
 ...-usb3.dtso =3D> k3-am642-hummingboard-t-usb3.dts} |   13 +-
 .../boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dts    |    6 -
 arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts     |  158 +
 .../dts/ti/k3-am68-sk-base-board-pcie1-ep.dtso     |   53 +
 arch/arm64/boot/dts/ti/k3-am69-sk-pcie0-ep.dtso    |   53 +
 arch/arm64/boot/dts/ti/k3-am69-sk.dts              |   41 +
 .../boot/dts/ti/k3-j7200-common-proc-board.dts     |    4 +
 arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi    |    7 +
 arch/arm64/boot/dts/ti/k3-j721e-evm-pcie1-ep.dtso  |   53 +
 arch/arm64/boot/dts/ti/k3-j722s-evm.dts            |  102 +
 .../boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi   |    8 +
 .../boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi  |   22 +-
 .../dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi |   12 +-
 arch/arm64/boot/dts/ti/k3-pinctrl.h                |   19 +
 arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts |   18 +-
 .../boot/dts/starfive/jh7110-pine64-star64.dts     |   18 +-
 arch/riscv/boot/dts/thead/th1520.dtsi              |   16 +
 include/dt-bindings/clock/qcom,ipq-cmn-pll.h       |   22 +
 include/dt-bindings/clock/qcom,qcs615-gcc.h        |  211 +
 include/dt-bindings/clock/qcom,sm8750-dispcc.h     |  112 +
 include/dt-bindings/clock/qcom,sm8750-gcc.h        |  226 +
 include/dt-bindings/clock/qcom,sm8750-tcsr.h       |   15 +
 include/dt-bindings/clock/renesas,r9a09g047-cpg.h  |   21 +
 include/dt-bindings/clock/samsung,exynos990.h      |  236 +
 include/dt-bindings/clock/sun50i-a64-ccu.h         |    2 +
 .../dt-bindings/interconnect/qcom,sm8750-rpmh.h    |  143 +
 .../pinctrl/renesas,r9a09g047-pinctrl.h            |   41 +
 .../pinctrl/renesas,r9a09g057-pinctrl.h            |   31 +
 459 files changed, 62645 insertions(+), 3226 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,ipq9574=
-cmn-pll.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,qcs615-=
gcc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8750-=
gcc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exyn=
os990-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,=
sm8750-rpmh.yaml
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjeffers=
on.dts
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dts
 create mode 100644 arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.d=
ts
 create mode 100644 arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.=
dts
 create mode 100644 arch/arm/boot/dts/microchip/sama7d65-pinfunc.h
 create mode 100644 arch/arm/boot/dts/microchip/sama7d65.dtsi
 create mode 100644 arch/arm/boot/dts/st/stm32mp153c-lxa-tac-gen3.dts
 create mode 100644 arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
 create mode 100644 arch/arm64/boot/dts/broadcom/bcmbca/bcm4906-zyxel-ex=
3510b.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos9810-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos9810-starlte.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos9810.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990-r8s.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990-x1s-common.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990-x1s.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990-x1slte.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-a=
dpismarc.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-h=
elios-lvds.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-h=
elios.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-p=
roton2s.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-=
som-v1.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-imx-lvds-hd=
mi-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-d=
lvds-hdmi-channel0.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-l=
vds-hdmi-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-l=
vds-hdmi.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-d=
lvds-hdmi-channel0.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-l=
vds-hdmi-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-l=
vds-hdmi.dtso
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3=
-sata.dtso
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4=
-emmc.dtso
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4=
-sd.dtso
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou=
-sku0.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou=
-sku1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou=
-sku16.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou=
.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-=
sku0.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-=
sku1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie.=
dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0=
.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1=
.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2=
.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3=
.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4=
.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5=
.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6=
.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7=
.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
 delete mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r=
5-sku2.dts
 delete mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion=
-r4.dts
 create mode 100644 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
 create mode 100644 arch/arm64/boot/dts/qcom/ipq5424.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8917.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pm8937.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmd8028.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmih0108.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/qcs615-ride.dts
 create mode 100644 arch/arm64/boot/dts/qcom/qcs615.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/qcs8300-ride.dts
 create mode 100644 arch/arm64/boot/dts/qcom/qcs8300.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sar2130p.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackroc=
k.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm8750-mtp.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm8750-pmics.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm8750-qrd.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm8750.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-white-hawk-sing=
le.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g047.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g047e37.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g047e57.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
 rename arch/arm64/boot/dts/renesas/{r8a779g0-white-hawk-ard-audio-da721=
2.dtso =3D> white-hawk-ard-audio-da7212.dtso} (96%)
 create mode 100644 arch/arm64/boot/dts/renesas/white-hawk-single.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2-=
manta.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.=
dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-pi2.=
dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-firefly-core-358=
8j.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588=
j.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-compa=
ct.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.d=
ts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi
 rename arch/arm64/boot/dts/ti/{k3-am642-hummingboard-t-pcie.dtso =3D> k=
3-am642-hummingboard-t-pcie.dts} (78%)
 rename arch/arm64/boot/dts/ti/{k3-am642-hummingboard-t-usb3.dtso =3D> k=
3-am642-hummingboard-t-usb3.dts} (74%)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am68-sk-base-board-pcie1-e=
p.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-sk-pcie0-ep.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-j721e-evm-pcie1-ep.dtso
 create mode 100644 include/dt-bindings/clock/qcom,ipq-cmn-pll.h
 create mode 100644 include/dt-bindings/clock/qcom,qcs615-gcc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm8750-dispcc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm8750-gcc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm8750-tcsr.h
 create mode 100644 include/dt-bindings/clock/renesas,r9a09g047-cpg.h
 create mode 100644 include/dt-bindings/clock/samsung,exynos990.h
 create mode 100644 include/dt-bindings/interconnect/qcom,sm8750-rpmh.h
 create mode 100644 include/dt-bindings/pinctrl/renesas,r9a09g047-pinctr=
l.h
 create mode 100644 include/dt-bindings/pinctrl/renesas,r9a09g057-pinctr=
l.h

