Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8052BC02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 15:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+0Mqs7iOlVquPP3UP3a2iTIsdV7BIk9K1d6vObYVMh0=; b=uXCufTRCQ8ejvtluv3Y+I7DGhQ
	olxEbfzyfKRgFkAmwHDKL5ox86fOcwfKrsU1h84QPmgwuLfldVSMYq1QR86uCtF9GnTsW5Na8M++R
	5hfAWkjgm8rIcd4k8Mw0sqv6N20lpMwfHpAqq52+YtUbHIYl74+EFvl0B6nlGIQ0j9g5hsXz00+mx
	LMGjuEwa4Yc8bIJsgGJLu1yMl/jDWIaDOSNkEEvPZg7U1IUJ8v9l+vYbfLyDcmTAb2ne1WBVFz3qa
	+dbKW3JHCRsSoeaRqU2WUJKm5rVgeEvKGUoPa73Abm95HWXvXB1aMe61b7IP7yb6wROGG0WXCunh+
	Xdrb+law==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbLOA-0000000Ew6I-2yEO;
	Fri, 24 Jan 2025 15:14:30 +0000
Received: from fhigh-a6-smtp.messagingengine.com ([103.168.172.157])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbLJB-0000000EvFW-0EE9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 15:09:22 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 581E611401A8;
	Fri, 24 Jan 2025 10:09:20 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Fri, 24 Jan 2025 10:09:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1737731360;
	 x=1737817760; bh=+0Mqs7iOlVquPP3UP3a2iTIsdV7BIk9K1d6vObYVMh0=; b=
	djkfvsz8J8u3SJzI3ErSHCzD19Lq3r7BDohbMwF3iH8cb9KuDcO7a5jPhDn/0BgS
	wLnMjqbbfLsct/NzzMBRPE+CF9nVXF+OUlaZWdV/Fl948iJp5aM+Z4APTq7uxTvL
	svrZAXOC5L1fjyrI5whs1nCdBaJ5AVNLBMk5AH5lFT4ucG7GBStH1h8pGFoDu5o2
	+XQhOvOy0JMa4tOIbVVjj7jIP0Q2FE6V0u8E10HDkM9nrgDoIkT8qN9BCueAhSNH
	o1KRjSP/qEHZflVqgOMYvjuKlNJJdtCiwdkNTqrx51FZFFAhrBGz4SFUR/6CY2t2
	Q7m9o5CSUAgCuNF7kGNrFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1737731360; x=
	1737817760; bh=+0Mqs7iOlVquPP3UP3a2iTIsdV7BIk9K1d6vObYVMh0=; b=d
	W1ufnZXXMMFbPAc0NCL78MseC8HPfgVLzgN5JoLOlmWuyS5tedyuGxLouzCo5zYH
	4OFJD+Q6zGNnwnT2fTlvyCZbP0SU9fu4tXYZx6TIKp4mMtpBZriNJzkbIU1axXNt
	mj7kb0oBzRKqKNPACOFuEMizd0zUUHTFX7YcKxbHqW47+Ht2VD+87BZCjt88nmIy
	Rbblw3vZdvYE/93rNIQnFB0vdWG882bcnp2zBCmKKMrN9mfnXiZn+HP4SJsIGPk8
	OLMjLKT6YtHl7STOgb0jTV2JhHe87Bcvd7VZNVM+yag1ncnZAxb46zCXBYl6Txnl
	a+PIBaX9StV97zuwD9H4A==
X-ME-Sender: <xms:IK2TZwH_LWjuVyiXwxBKCFGlaGldp79co93BCOMMpoku8zBtp7mE9g>
    <xme:IK2TZ5WVkunllhted929lVOlmKluITSSm2hvkYcoXvTquaZvKLhgQGfQQ01MEUqHE
    sBj7IIVxz3EpgJ-X7s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejgedggeekfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredt
    jeenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpeefueegkeffveeugeehieehiedukeegfefhffeu
    tdettdffteeluefhheetkeekvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhgih
    hthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhl
    fhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeegpdhmohguvg
    epshhmthhpohhuthdprhgtphhtthhopehtohhrvhgrlhgusheslhhinhhugidqfhhouhhn
    uggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlse
    hlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepshhotgeslhhishht
    shdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvg
    hrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:IK2TZ6LmiTif2T4YbPxQOWRNgt9mNOQ-sCTcJUDgxy8vuwDEh-9ChA>
    <xmx:IK2TZyErKFYOqI7sru-xnnFM89F1gQQiUpS9eoueFIpnCRYyjC0a7w>
    <xmx:IK2TZ2XHiWIcT5Pwc-2L4zbopl0ewukAEjFfI2vgpmJI7FC6Z5xmPg>
    <xmx:IK2TZ1NA0aVyJiAXptAlJKoTVWltAc5iVThGAo6NNybQyd-qFxuA6w>
    <xmx:IK2TZ1Q9lBVHBQxD-tJ7qW_MzKPhqYqTj8mRQ0kFxvuTepKmQ4qY_qsi>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 202942220074; Fri, 24 Jan 2025 10:09:20 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Fri, 24 Jan 2025 16:08:59 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 soc@lists.linux.dev
Message-Id: <fdf46fd8-2449-4579-b85b-265c693addf8@app.fastmail.com>
In-Reply-To: <1f0939fd-1694-476e-954f-e58ff8650dd9@app.fastmail.com>
References: <1f0939fd-1694-476e-954f-e58ff8650dd9@app.fastmail.com>
Subject: [GIT PULL 5/5] soc: defconfig updates for 6.14
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_070921_166783_F5BDFD54 
X-CRM114-Status: UNSURE (   8.89  )
X-CRM114-Notice: Please train this message.
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
efconfig-6.14

for you to fetch changes up to 309f64469cd5d09d5f1207e57d42f2eff9bd9311:

  Merge tag 'arm-soc/for-6.14/defconfig-arm64' of https://github.com/Bro=
adcom/stblinux into soc/defconfig (2025-01-24 13:08:51 +0100)

----------------------------------------------------------------
soc: defconfig updates for 6.14

As usual, a number of new drivers get added to the defconfig to
support additional hardware. The stm32 defconfig also turns off
a few options to optimize for size.

----------------------------------------------------------------
Alexander Stein (1):
      ARM: imx_v6_v7_defconfig: enable JC42 for TQMa7x

Andr=C3=A9 Draszik (1):
      arm64: defconfig: enable Maxim TCPCI driver

Arnd Bergmann (9):
      Merge tag 'renesas-arm-defconfig-for-v6.14-tag1' of https://git.ke=
rnel.org/pub/scm/linux/kernel/git/geert/renesas-devel into soc/defconfig
      Merge tag 'imx-defconfig-6.14' of https://git.kernel.org/pub/scm/l=
inux/kernel/git/shawnguo/linux into soc/defconfig
      Merge tag 'at91-defconfig-6.14' of https://git.kernel.org/pub/scm/=
linux/kernel/git/at91/linux into soc/defconfig
      Merge tag 'mtk-defconfig-for-v6.14' of https://git.kernel.org/pub/=
scm/linux/kernel/git/mediatek/linux into soc/defconfig
      Merge tag 'ti-k3-config-for-v6.14' of https://git.kernel.org/pub/s=
cm/linux/kernel/git/ti/linux into soc/defconfig
      Merge tag 'v6.14-rockchip-defconfig64-1' of https://git.kernel.org=
/pub/scm/linux/kernel/git/mmind/linux-rockchip into soc/defconfig
      Merge tag 'qcom-arm64-defconfig-for-6.14' of https://git.kernel.or=
g/pub/scm/linux/kernel/git/qcom/linux into soc/defconfig
      Merge tag 'riscv-config-for-v6.14' of https://git.kernel.org/pub/s=
cm/linux/kernel/git/conor/linux into soc/defconfig
      Merge tag 'arm-soc/for-6.14/defconfig-arm64' of https://github.com=
/Broadcom/stblinux into soc/defconfig

Biju Das (1):
      arm64: defconfig: Enable R9A09G047 SoC

Cristian Ciocaltea (1):
      arm64: defconfig: Enable Rockchip extensions for Synopsys DW HDMI =
QP

Drew Fustini (1):
      riscv: defconfig: enable pinctrl and dwmac support for TH1520

Geert Uytterhoeven (1):
      ARM: shmobile: defconfig: Refresh for v6.13-rc1

Hari Nagalla (1):
      arm64: defconfig: Enable TI K3 M4 remoteproc driver

Igor Belwon (1):
      dt-bindings: soc: samsung: exynos-pmu: Add exynos990-pmu compatible

Jingyi Wang (1):
      arm64: defconfig: enable clock controller, interconnect and pinctr=
l for QCS8300

Krzysztof Kozlowski (1):
      arm64: defconfig: Enable basic Qualcomm SM8750 SoC drivers

Lad Prabhakar (1):
      arm64: defconfig: Enable Renesas RZ/V2H(P) Watchdog driver

Lijuan Gao (1):
      arm64: defconfig: enable clock controller, interconnect and pinctr=
l for QCS615

Liu Ying (1):
      arm64: defconfig: Enable ITE IT6263 driver

Luo Jie (1):
      arm64: defconfig: Enable Qualcomm IPQ CMN PLL clock controller

Mark Brown (1):
      arm64: defconfig: Enable Amazon Elastic Network Adaptor

Nicolas Dufresne (1):
      arm64: defconfig: Enable RFKILL GPIO

N=C3=ADcolas F. R. A. Prado (3):
      arm64: defconfig: Enable MediaTek STAR Ethernet MAC
      arm64: defconfig: Enable sound for MT8188
      arm64: defconfig: Enable MediaTek DWMAC

Patrice Chotard (4):
      ARM: configs: stm32: Remove FLASH_MEM_BASE and FLASH_SIZE in STM32=
 defconfig
      ARM: configs: stm32: Clean STM32 defconfig
      ARM: configs: stm32: Remove CRYPTO in STM32 defconfig
      ARM: configs: stm32: Remove useless flags in STM32 defconfig

Ross Burton (1):
      arm64: defconfig: remove obsolete CONFIG_SM_DISPCC_8650

Ryan Wanner (1):
      ARM: configs: at91: sama7: add new SoC config

Stefan Wahren (1):
      arm64: defconfig: Enable pinctrl-based I2C mux

Taniya Das (1):
      arm64: defconfig: Enable sa8775p clock controllers

 .../bindings/soc/samsung/exynos-pmu.yaml           |  1 +
 arch/arm/configs/imx_v6_v7_defconfig               |  1 +
 arch/arm/configs/multi_v7_defconfig                |  1 +
 arch/arm/configs/sama7_defconfig                   |  1 +
 arch/arm/configs/shmobile_defconfig                |  1 +
 arch/arm/configs/stm32_defconfig                   | 12 ++++-----
 arch/arm64/configs/defconfig                       | 31 +++++++++++++++=
++++++-
 arch/riscv/configs/defconfig                       |  2 ++
 8 files changed, 43 insertions(+), 7 deletions(-)

