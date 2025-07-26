Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E0BC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Jul 2025 10:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SgoPbqqSFDKvdYHjDquYoLaznq4AccR4rO7ESwuJ+WA=; b=t/4bSb0SUR6JYMVlpjEThn4IA2
	v/Oz0FOie62xct65KMwGG/TiH0HjiCTmbBdcLfMpkS1i8DQKWuRz9+xu5ZXIMELCENV+BENkA9grE
	rYRh1VFDogIN8emyApbPqdzmKKBcDdGBiHc7c3Igko+8bkGmhimL3slnuCfP0/UTJQbeiQWy/P/xW
	H9X3TIUXFogoyPVYytoAppwVlFLoa4HlbPzJ2WHcfG1dkgIIhiHqfNleIGkPlwuH2578XGnmqucw1
	2H8d3vErjGxGxLV2Z378P6MzTxcAdo4gcK/7vlzSAAps8PMMjuUXfP9wL93oWGLz24yTSzZjCCP2I
	kNuP+3bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufcLL-0000000BMtj-1npW;
	Sat, 26 Jul 2025 10:41:31 +0000
Received: from fhigh-a5-smtp.messagingengine.com ([103.168.172.156])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufcCn-0000000BMAI-1YrZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Jul 2025 10:32:42 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 8BA3A14000FD;
	Sat, 26 Jul 2025 06:32:40 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Sat, 26 Jul 2025 06:32:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1753525960;
	 x=1753612360; bh=SgoPbqqSFDKvdYHjDquYoLaznq4AccR4rO7ESwuJ+WA=; b=
	gYgji40wfaZFfGUVaRCxNWlmLXPiRXNOnoDpVpspLF1Fz0xPlXGE88Fsoh5SpXCL
	2zxENbzD6//FznA2y/sBGrDT5MKm779YMyyW7gI0rP+tLEYZV34Tl1aSYVMekyZh
	jqCDZpEJ1Qpor4J8pheKqMCQFKNX5Y4O8Kxx4uzciVPYE3RXYIPZdUoAduo2HRcv
	n+tTI7A0d67yXqj80IHyA22yHXffqSaFqJwGOWHBP7hTITCJ/aQjujpx2NKnf+rx
	E8aXz/EcaRG7VT7B9A4x6QU3xCiY1wLtpaHh3KGw6/no9cN75ukBRpfbYkJYRoni
	v+mo80Iyoy2Ji2HDJ7xO+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1753525960; x=
	1753612360; bh=SgoPbqqSFDKvdYHjDquYoLaznq4AccR4rO7ESwuJ+WA=; b=W
	52HFqzq5Ueqp5o/p0AbtnQ09w6hAMmVSwo0RRc0o9EOWOFmPsH5I2MKUl/X4fgrt
	/+IaEPJlzqll8wWFXP+epSGHcv7hhNVYHsrIYis/4O0Xk4KhsfKZrO1QxaYCIEuJ
	/ORJaUYsruTB2/qmnPiNrZvlSInIT/0MRxtFVoHFD+OydnAe1K0BsFisOn4bsGxU
	SzU4IYlzULtALyqeZC77MNuPnaPK0RPYwt5zYasgnCnaEsU5KfE4NlHOVVAjONQy
	/SXadx3r1l5FsjcXCpK8Tolc7FFHUlQhbp9HRwjMNlEZ2lJU4HIonvYPQMcFp4W6
	fOTNRSt7McWAgDh11tDZg==
X-ME-Sender: <xms:yK6EaPhynAqbB5ZgpeRpTSEUGEH0h3V4m49TAdvT8mre8bwiDwfsZA>
    <xme:yK6EaMDffWjHBUn8HayXGsmOkAfD0VgKHx5zIpfkMp7J6bqF8cKJy4uO7iKrrbOdY
    uz0ypI83IlM50nwN5A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdekiedukecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpeefueegkeffveeugeehieehiedukeegfefhffeutdettdffteeluefhheetkeekvden
    ucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhgihhthhhusgdrtghomhenucevlhhush
    htvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgu
    sgdruggvpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtth
    hopehtohhrvhgrlhgusheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghp
    thhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrg
    gurdhorhhgpdhrtghpthhtohepshhotgeslhhishhtshdrlhhinhhugidruggvvhdprhgt
    phhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:yK6EaDhpXj0tchio9yiv8OxIOCZ_yO_Zus5Iwjvbzi_3uCSKglEgZQ>
    <xmx:yK6EaLivbSaPMmiV7fLFtX4iKWQKUAoOkY9N-VkXavosXYTaJi9YcA>
    <xmx:yK6EaJhL1PsiSbS1WsPURqdHBlv_RLl5T-6T3GvDA-Yavme9NDZ54g>
    <xmx:yK6EaLJ8hKrBYLx1mJzehbTvFQJcVu1L-xs5r9ID54VFrI2M62Z2Pg>
    <xmx:yK6EaAxIkd2cVXbdR20KufLO__1ApPj9YuYjMrU14wy3MlRIOGAnoT7->
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 5ADAC700065; Sat, 26 Jul 2025 06:32:40 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Td03a27401e83a0cb
Date: Sat, 26 Jul 2025 12:32:20 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, soc@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Message-Id: <b64f7af2-f61d-4ebb-9815-73efd8a1a682@app.fastmail.com>
In-Reply-To: <564b7ace-bb5f-430e-a7f1-9f6a41305e10@app.fastmail.com>
References: <564b7ace-bb5f-430e-a7f1-9f6a41305e10@app.fastmail.com>
Subject: [GIT PULL 4/5] soc: defconfig updates for 6.16
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250726_033241_482167_299F854A 
X-CRM114-Status: GOOD (  10.60  )
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

The following changes since commit 86731a2a651e58953fc949573895f2fa6d456=
841:

  Linux 6.16-rc3 (2025-06-22 13:30:08 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-d=
efconfig-6.17

for you to fetch changes up to 5cfe03e1ca42fa97341fde7a8ad53be86a51d789:

  Merge tag 'v6.17-rockchip-defconfig64-1' of https://git.kernel.org/pub=
/scm/linux/kernel/git/mmind/linux-rockchip into soc/defconfig (2025-07-2=
2 22:58:01 +0200)

----------------------------------------------------------------
soc: defconfig updates for 6.16

As usual, more drivers get enabled in the defconfigs, to support newly
added hardware drivers.

There is one change for Tegra that modifies the Kconfig file at the same
time, and the NXP arm32 defconfigs get a refresh.

----------------------------------------------------------------
Andrea della Porta (2):
      arm64: defconfig: Enable RP1 misc/clock/gpio drivers
      arm64: defconfig: Enable OF_OVERLAY option

Andr=C3=A9 Draszik (2):
      arm64: defconfig: enable Maxim max77759 driver
      arm64: defconfig: enable Samsung PMIC over ACPM

Arnd Bergmann (9):
      Merge tag 'renesas-arm-defconfig-for-v6.17-tag1' of https://git.ke=
rnel.org/pub/scm/linux/kernel/git/geert/renesas-devel into soc/defconfig
      Merge tag 'arm-soc/for-6.17/defconfig-arm64' of https://github.com=
/Broadcom/stblinux into soc/defconfig
      Merge tag 'samsung-defconfig-6.17' of https://git.kernel.org/pub/s=
cm/linux/kernel/git/krzk/linux into soc/defconfig
      Merge tag 'tegra-for-6.17-arm64-defconfig' of https://git.kernel.o=
rg/pub/scm/linux/kernel/git/tegra/linux into soc/defconfig
      Merge tag 'imx-defconfig-6.17' of https://git.kernel.org/pub/scm/l=
inux/kernel/git/shawnguo/linux into soc/defconfig
      Merge tag 'riscv-config-for-v6.17' of https://git.kernel.org/pub/s=
cm/linux/kernel/git/conor/linux into soc/defconfig
      Merge tag 'at91-defconfig-6.17' of https://git.kernel.org/pub/scm/=
linux/kernel/git/at91/linux into soc/defconfig
      Merge tag 'qcom-arm64-defconfig-for-6.17' of https://git.kernel.or=
g/pub/scm/linux/kernel/git/qcom/linux into soc/defconfig
      Merge tag 'v6.17-rockchip-defconfig64-1' of https://git.kernel.org=
/pub/scm/linux/kernel/git/mmind/linux-rockchip into soc/defconfig

Ciprian Marian Costea (1):
      arm64: defconfig: add S32G RTC module support

Dario Binacchi (5):
      ARM: mxs_defconfig: Cleanup mxs_defconfig
      ARM: mxs_defconfig: select new drivers used by imx28-amarula-rmm
      ARM: imx_v6_v7_defconfig: cleanup with savedefconfig
      ARM: imx_v6_v7_defconfig: select CONFIG_INPUT_PWM_BEEPER
      ARM: imx_v6_v7_defconfig: select CONFIG_USB_HSIC_USB3503

Fabio Estevam (2):
      ARM: imx_v6_v7_defconfig: Select BT_HCIUART_BCM
      ARM: configs: sama5_defconfig: Select CONFIG_WILC1000_SDIO

Geert Uytterhoeven (2):
      ARM: shmobile: defconfig: Refresh for v6.16-rc2
      riscv: defconfig: Remove CONFIG_SND_SOC_STARFIVE=3Dm

Guodong Xu (1):
      riscv: defconfig: Enable PWM support for SpacemiT K1 SoC

Kory Maincent (2):
      arm: omap2plus_defconfig: Enable TPS65219 regulator
      arm: multi_v7_defconfig: Enable TPS65219 regulator

Krzysztof Kozlowski (3):
      arm64: defconfig: Enable camcc and videocc on Qualcomm SM8450+
      arm64: defconfig: Switch SOUND to module
      arm64: defconfig: Drop unneeded unselectable sound drivers

Lad Prabhakar (1):
      arm64: defconfig: Enable RZ/V2H(P) USB2 PHY controller reset driver

Nicolas Frattaroli (1):
      arm64: defconfig: enable further Rockchip platform drivers

Thierry Reding (2):
      arm64: defconfig: Enable Tegra HSP and BPMP
      arm64: defconfig: Enable Tegra241 and Tegra264

Yixun Lan (1):
      riscv: defconfig: spacemit: enable sdhci driver for K1 SoC

 arch/arm/configs/imx_v6_v7_defconfig | 28 +++++++---------------------
 arch/arm/configs/multi_v7_defconfig  |  3 +++
 arch/arm/configs/mxs_defconfig       | 14 +++-----------
 arch/arm/configs/omap2plus_defconfig |  3 +++
 arch/arm/configs/sama5_defconfig     |  1 +
 arch/arm/configs/shmobile_defconfig  |  1 +
 arch/arm64/configs/defconfig         | 30 +++++++++++++++++++++++-------
 arch/riscv/configs/defconfig         |  4 +++-
 drivers/soc/tegra/Kconfig            |  9 ---------
 9 files changed, 44 insertions(+), 49 deletions(-)

