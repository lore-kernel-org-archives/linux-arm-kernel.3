Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F002C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 14:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Jl2/Bme3dggXyQm6j2e6aTPj1gIVCZq+ikrQ9R6HsWo=; b=lLltyOd64+tlE6a7KNwSX08QRb
	D0kDaRG8fwMZb63Ves8xGAuuFqe4nH66yODh/VN33Q/qXUufoMGRzSDhFDLFS3SWnODVoqEwLSCQZ
	5vTOuYM1f4Hhl47sAwLv36CHMdVq+C8n8atueL18joGVQnST9oCH5jnOoJh7cRYzN37piQ78PND7z
	a8vfX18cV4ceBBgal0l0KSB4wJsWqnFnSo0DZHJQTwGJy0V72VQnNzJkr8NFezgY4jdLGcZlCCtwV
	Wzoq7G6PwEU/zYZHJwg9WHkBaKA+uCYmXUhK4Ul5+DzAUYwwxSetbx+ZMcYiXUJEh3BcQDpwDdoGO
	SYtWVHBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubgji-00000005OO2-0rQ2;
	Tue, 15 Jul 2025 14:34:26 +0000
Received: from fout-a1-smtp.messagingengine.com ([103.168.172.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubfTn-00000005AiV-17Np
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 13:13:57 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id A05E7EC0E90;
	Tue, 15 Jul 2025 09:13:52 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Tue, 15 Jul 2025 09:13:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1752585232; x=1752671632; bh=Jl
	2/Bme3dggXyQm6j2e6aTPj1gIVCZq+ikrQ9R6HsWo=; b=YWJCkD9+jFiUq8njuW
	Xil6uP+eA+UhZgKWH1Ae0cSVGSUOB4/VIeU0zxKRAmcZ7HxR9FPU4Zz9Bdnub+gc
	qfNcJaIj1Zy55qS0WiwY/o7RDwrVG1GS+sI2bifziqQbLotNPwdN+Iu3/gFoYg9C
	Cnvi5QsGKFfoUhUKHGjC6L/dkDstw27V8Ptc3a6i6vmd881wAzFfFJ0+EeNISEWx
	qSMRCOHeEd5EqTaey5ggevPOX+Yl/AiNzJpU0eW7iBhsfWBQTodGf9akTqmSMuIY
	MPAUbTdthVT96Cb/oclY4rLourF7pqgHxiNZnJMmazkMvIsuQCxZTxSKUOM6I9rs
	FB2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1752585232; x=1752671632; bh=Jl2/Bme3dggXyQm6j2e6aTPj1gIV
	CZq+ikrQ9R6HsWo=; b=TKDo87+OdmGx4e81bbWK1skBP2sM9vFfNX/eV0JNEfYJ
	9ixUmxx4P+04R/eYeGztZXCZyheIzJUoedwcRtfOSeRSVlTVNaEs0DB+2Gn13azu
	TgB8/AESROjLwIeX2F78bNRiWbVkGuKMFcR83LPeSrHuys7RVTdNO9zqMxTEA1Ot
	gmHUt8Q7nx0mJqs9ZLVboojAU3TpD+ercHA6pp0bjlwsBGTfq7ujFUolaOjRy/SA
	nOkYDYkQdaZpgCRhpDb7qFj7/MD22Jul1odQBlK7SGDl2hVzonq4d5Gspcbof7ll
	RL4vEN9TEKfzDXr6Z7uiqG37Pv/iqWCQkkUm2TLe6Q==
X-ME-Sender: <xms:EFR2aMQ5F-LQjDcnHHfBbtu4-qBZwkwdvzDp8lmnYFofWWiDLv8_jw>
    <xme:EFR2aJzMb6IwIdlYPYe9-YozNEcLmbHgNUkJ-rZEKRFGBiMJN_LtoNQfhmwltXy6J
    3pI7bz6zREY6oRgv5c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehgeelvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcuuegv
    rhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrhhnpe
    duleeigeekveeugeettdejtddtleeghefhvdfhueehtefhudelffduvdeuleevteenucff
    ohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthht
    ohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthhorhhvrghlughssehlih
    hnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhm
    qdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhope
    hsohgtsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhugidqkhgv
    rhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:EFR2aASGoGyY7XXes0xjcPeoQBPokPJRfpswH4YpHKrL4E5wTxiVuQ>
    <xmx:EFR2aJQ6gx9OGwUiDeJqufoA-Urt6HIqnn3ILLArJMedxzdzKWu_Fg>
    <xmx:EFR2aEQTki8U0Xfe-BDIiMN1hJ7fzUPbU3h5YHMAHc4Jj6ACR0BO4A>
    <xmx:EFR2aO4IR266-QluDydF5lz0iNolTbTiFocyv-RaNcQC4vMqJtmMYA>
    <xmx:EFR2aKh_chE7ibYhv7IQQckOU9OUYCuTm68ZtKFnSDvcP7wmdeEoXbWG>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 26369700065; Tue, 15 Jul 2025 09:13:52 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Tue, 15 Jul 2025 15:13:31 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 soc@lists.linux.dev
Message-Id: <5f8e6b26-01ee-4941-9609-ed761a23f4d1@app.fastmail.com>
Subject: soc: fixes for 6.16, part 2
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_061355_858901_7AED89FC 
X-CRM114-Status: GOOD (  12.65  )
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

The following changes since commit 3f3fb97374308993dbe8884f44c2579a81b90bfa:

  Merge tag 'apple-soc-fixes-6.16' of https://git.kernel.org/pub/scm/linux/kernel/git/sven/linux into arm/fixes (2025-07-03 16:27:31 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.16-2

for you to fetch changes up to 8f0837fdc5d832f0cd953f66db0cbfb2fa8909d2:

  Merge tag 'qcom-arm64-defconfig-fixes-for-6.16' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into arm/fixes (2025-07-11 13:41:10 +0200)

----------------------------------------------------------------
soc: fixes for 6.16, part 2

There are 18 devicetree fixes for three arm64 plaforms: Qualcomm Snapdragon,
Rockchips and NXP i.MX. These get updated to more correctly describe the
hardware, fixing issues with:

 - real-time clock on Snapdragon based laptops
 - SD card detection, PCI probing and HDMI/DDC communication on
   Rockchips
 - Ethernet and SPI probing on certain i.MX based boards
 - A regression with the i.MX watchdog

Aside from the devicetree fixes, there are two additional fixes for the
merged ASPEED LPC snoop driver that saw some changes in 6.16, and one
additional driver enabled in arm64 defconfig to fix CPU frequency scaling.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>

----------------------------------------------------------------
Alexey Charkov (1):
      arm64: dts: rockchip: list all CPU supplies on ArmSoM Sige5

Andrew Jeffery (2):
      soc: aspeed: lpc-snoop: Cleanup resources in stack-order
      soc: aspeed: lpc-snoop: Don't disable channels that aren't enabled

Andy Yan (3):
      arm64: dts: rockchip: Adjust the HDMI DDC IO driver strength for rk3588
      arm64: dts: rockchip: Add cd-gpios for sdcard detect on Cool Pi CM5
      arm64: dts: rockchip: Add cd-gpios for sdcard detect on Cool Pi 4B

Arnd Bergmann (5):
      Merge tag 'imx-fixes-6.16' of https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into arm/fixes
      Merge tag 'v6.16-rockchip-dtsfixes1' of https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip into arm/fixes
      Merge tag 'aspeed-6.16-fixes-0' of https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux into arm/fixes
      Merge tag 'qcom-arm64-fixes-for-6.16' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into arm/fixes
      Merge tag 'qcom-arm64-defconfig-fixes-for-6.16' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into arm/fixes

Bjorn Andersson (1):
      arm64: defconfig: Enable Qualcomm CPUCP mailbox driver

Diederik de Haas (1):
      arm64: dts: rockchip: Add missing fan-supply to rk3566-quartz64-a

Francesco Dolcini (1):
      arm64: dts: freescale: imx8mm-verdin: Keep LDO5 always on

Jakob Unterwurzacher (1):
      arm64: dts: rockchip: use cs-gpios for spi1 on ringneck

Johan Hovold (2):
      arm64: dts: qcom: sc8280xp-x13s: describe uefi rtc offset
      arm64: dts: qcom: x1e80100: describe uefi rtc offset

Meng Li (1):
      arm64: dts: add big-endian property back into watchdog node

Richard Zhu (1):
      arm64: dts: imx95: Correct the DMA interrupter number of pcie0_ep

Shawn Lin (1):
      arm64: dts: rockchip: fix rk3576 pcie1 linux,pci-domain

Tim Harvey (4):
      arm64: dts: imx8mp-venice-gw71xx: fix TPM SPI frequency
      arm64: dts: imx8mp-venice-gw72xx: fix TPM SPI frequency
      arm64: dts: imx8mp-venice-gw73xx: fix TPM SPI frequency
      arm64: dts: imx8mp-venice-gw74xx: fix TPM SPI frequency

Wei Fang (2):
      arm64: dts: imx95-19x19-evk: fix the overshoot issue of NETC
      arm64: dts: imx95-15x15-evk: fix the overshoot issue of NETC

 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi     |  3 +-
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi   |  1 +
 .../boot/dts/freescale/imx8mp-venice-gw71xx.dtsi   |  2 +-
 .../boot/dts/freescale/imx8mp-venice-gw72xx.dtsi   |  2 +-
 .../boot/dts/freescale/imx8mp-venice-gw73xx.dtsi   |  2 +-
 .../boot/dts/freescale/imx8mp-venice-gw74xx.dts    |  2 +-
 arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts  | 20 ++++++-------
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts  | 12 ++++----
 arch/arm64/boot/dts/freescale/imx95.dtsi           |  2 +-
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |  2 ++
 arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi       |  1 +
 arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi    | 23 ++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts |  1 +
 .../boot/dts/rockchip/rk3576-armsom-sige5.dts      | 28 +++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           |  2 +-
 .../boot/dts/rockchip/rk3588-base-pinctrl.dtsi     | 20 ++++++-------
 .../arm64/boot/dts/rockchip/rk3588-coolpi-cm5.dtsi |  1 +
 .../boot/dts/rockchip/rk3588-extra-pinctrl.dtsi    |  5 ++--
 arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts |  1 +
 arch/arm64/boot/dts/rockchip/rockchip-pinconf.dtsi | 35 ++++++++++++++++++++++
 arch/arm64/configs/defconfig                       |  1 +
 drivers/soc/aspeed/aspeed-lpc-snoop.c              | 13 +++++++-
 22 files changed, 143 insertions(+), 36 deletions(-)

