Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 103DFCD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 07:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BApC2q0/s0KPptdEC/Npu4kEQ6hSi8/TiAKSuowwdtE=; b=mG//aOE/LCm7IkfaI4bGMyeqMx
	N6bkoW2PMfhi1cG/CFdfO/PwlHmhBSbbh3dutGz2qHwljHuk2rjbuuiQePo87A+KTJqS8NmIRpA+e
	o6t2aCfZFHyjduwZJDl5VQcs1MQchw0ZwQflgE/E6dZ9rIWFYZFWEFz2lqf0EG+RC6qTgGC2qP0vc
	VI114UkIooVa7kzTD4rNGQNRfrSV9IC5DE/MtvgBGOhWyeJvRje3YCzdiht/vWxtx9l4YJoSAgU2F
	ZlqjghDloMHvKySkXSNl7Yo1zg+gGcOcmMESmuEFEt49Sncdb7asBRJqaKaMu5Aap37GwPLy5EfDR
	AxkibsLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZOck-0000000FP3N-2lVO;
	Tue, 16 Jun 2026 07:54:18 +0000
Received: from fout-b2-smtp.messagingengine.com ([202.12.124.145])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZOch-0000000FP2a-1OHi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 07:54:16 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 9848C1D001E5;
	Tue, 16 Jun 2026 03:54:14 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Tue, 16 Jun 2026 03:54:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781596454;
	 x=1781682854; bh=BApC2q0/s0KPptdEC/Npu4kEQ6hSi8/TiAKSuowwdtE=; b=
	SAH67S1smMM7O2Li2xG2fLXgqWrIkQs5Wr2QtyANEsHJfCbFp4Xo11cErbbPbup+
	FlXzmDiipx1fgiNAaVdkUtgxlfl/MDMRHEcdPWhYoLLYsiNttSae120l9pQfTFXF
	tOBz5IYsYuAU9OU1nceudbMRcli0CXHxbR0Qq4L3WtO12yz6TG2EPa9DvAwxnR3w
	bou5/L3PqMod6o3/bVgi4yX1+z2TgRqzPdXwngVrHQz1/xUP/G8RSmQjQsWeNfKL
	BI7Ghl74dCtc4p42a0Xx/FyyxcemhHG4DlkknglU4bTZoCD4S+82gPO3wui6LVCZ
	Fh13iS9QVhynQ5n5NS6QkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781596454; x=
	1781682854; bh=BApC2q0/s0KPptdEC/Npu4kEQ6hSi8/TiAKSuowwdtE=; b=R
	0jJfbCfcAFcY6k+9NR/kjywUmskyiV8AS6/AU5W4gPyHaAq1O5zVNU/VkXSrjKJf
	uwLPUswIAym21iGDVd8irt0Q2KGYHXX4MWBkb9vZtRqRnrFdP5wW9gvk067UYPVO
	MYx7Etb//o3/cV5LOhZzIxAGb7EyJ44Q6kp8l39O/156uNPZ5xnsUP2kRGs/qbAv
	2Hb3NM6K1fJJ+ePUGzN2rWgrt3OMv1fXljyZyG3JR7hA6SjWhwFkklzfkiDRnyad
	7u37Jf5OzbEXra6E9cmApblyvsp294ps4rFWCkFssGPHq2fvyU60EPRxWxo0kI21
	FKcAwjaMkDYb8QaUWx6hA==
X-ME-Sender: <xms:JgExarLrPDcQSPU0unuCEFP-W9aqflBYiW_gajGiMLKKtkvfbvqXVA>
    <xme:JgExap8aWcDstiFnHyi_y0Wsgi-jaEf9crJfGZeGNqbAf8IIEG3qjhE0jxVTcVJLn
    0k_7tvFFPgPmmfONajTkLvxlelT9wzDsuPNHZJJwCnxeL0ABWScrJk>
X-ME-Proxy-Cause: dmFkZTGtahmhMaDx9N+kz3wzJ/41XxAp57xTHMYR/E2A/2qVik6ljaLZZGOLtYb8sCgRzh
    NeGbD+eAk81OXyqWKJebEYAgDW721zIZurZ54IZWgXmIP2Aw5II4gMGvyPfv6kbFO+DVPX
    N0XcBMxp4LoAQwmVo5crg/k1MIGLI/Vyd9XQDYt1P/ZoSdS4H29AcJaKmRoIjZxxjsmr/i
    Orv8YzZbM36yAmp48gzf5egIUNNVwqo4Me4viOyqkqmzgwjLVkYVznXn7Qsi4X28oApjz/
    OYke9WsswEWzVzdZUxSJfNPgtDQVrmRwmgdH80dICevt9+Zar/lbPsxLc/rOpJP4oZhrow
    YkNa8iaPgkAfOiNuBZ8vEQKvt+D3gBJBN2DW+BGzSDCBfze4flNHaVbp9UTGbeyIPmAu3d
    40Jv/UMJwk7dPMMJb+J5r0oRuAgudGKO1KuQDSAERMTxdywi1LgeGbmUjbH0ThDq8+OR4B
    jB+kJYaZ5lf2DAvFP4DmxS1QMe9F8zIBBrW+kLnbu5GMkPKQU1jy8JDJso0ApAcZRnHANH
    prfD81U2k38+UsWDDCS1q+QNsKPFH+h5Xuj4OU8fOI2M1KU9+LcoKn5W9zhtSme0xuU3ro
    l5NJs2b36MqAWlZQNfuD+i+4dQ3uUqUvNNlbtX+gkLW436Jb+CjlGhuuo9yw
X-ME-Proxy: <xmx:JgExapt-qusW_SwS8fSJYRaUmMNe7uBCxA4pkvtGfnwp1w-2TSx-2w>
    <xmx:JgExaksuCaUq_lGSkmCe1TWZ4nohH8779_1j4_hsRL10mIeuaqgEVw>
    <xmx:JgExavDz5yaX7Wc5fKjjitn1Txsx2gddnJ16ltucncMivljLXbawGg>
    <xmx:JgExamPr24UXoR4sFeQJS5C_-PBng25Cu2TCfyKh8Fj7rbldNfXKzg>
    <xmx:JgExasArylEMASR1TP1VMvR8WDiG7LBW4ECAib7azT9GKqky5gWoEJZR>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 440F81820082; Tue, 16 Jun 2026 03:54:14 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Tue, 16 Jun 2026 09:53:53 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 "Krzysztof Kozlowski" <krzk@kernel.org>, "Linus Walleij" <linusw@kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <287ca074-9329-4a51-a5f7-35abc0d977f7@app.fastmail.com>
In-Reply-To: <40c8ebc3-d681-4dcf-b3f2-ce0d780c539e@app.fastmail.com>
References: <40c8ebc3-d681-4dcf-b3f2-ce0d780c539e@app.fastmail.com>
Subject: [GIT PULL 0/4] soc: defconfig updates for 7.2
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_005415_417479_B0275E66 
X-CRM114-Status: UNSURE (   9.14  )
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

The following changes since commit 7fd2df204f342fc17d1a0bfcd474b24232fb0f32:

  Linux 7.1-rc2 (2026-05-03 14:21:25 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-defconfig-7.2

for you to fetch changes up to cccde8de2c72068051ff8351ae6f1e2a12718aa0:

  Merge tag 'bst-arm64-emmc-driver-defconfig-for-v7.2' of https://github.com/BlackSesame-SoC/linux into soc/defconfig (2026-06-12 09:03:41 +0200)

----------------------------------------------------------------
soc: defconfig updates for 7.2

The main change this time is a cleanup series from Krzysztof Kozlowski
that updates the defconfig files to be more in sync with changes to
the Kconfig files that moved options around or removed the completely.

In addition, a number of drivers get enabled, in order to support
more hardware out of the box, as usual.

----------------------------------------------------------------
Albert Yang (1):
      arm64: defconfig: enable BST SDHCI controller

Arnd Bergmann (5):
      Merge tag 'v7.2-qcom-pinctrl-defconfigs' of git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl into soc/defconfig
      Merge tag 'cix-defconfig-v7.2-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/cix into soc/defconfig
      Merge tag 'at91-defconfig-7.2' of https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into soc/defconfig
      Merge tag 'imx-defconfig-7.2' of git://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux into soc/defconfig
      Merge tag 'bst-arm64-emmc-driver-defconfig-for-v7.2' of https://github.com/BlackSesame-SoC/linux into soc/defconfig

Krzysztof Kozlowski (12):
      pinctrl: qcom: Make important drivers default (2)
      arm64: defconfig: Move entries to match savedefconfig
      arm64: defconfig: Drop unused legacy netfilter options
      arm64: defconfig: Drop default or selected drivers
      arm64: defconfig: Drop unused Ethernet vendors
      arm64: defconfig: Switch Ethernet drivers to modules
      ARM: multi_v7_defconfig: Move entries to match savedefconfig
      ARM: configs: Drop redundant I2C_DESIGNWARE_PLATFORM
      ARM: configs: Drop redundant SND_ATMEL_SOC
      ARM: multi_v7_defconfig: Cleanup redundant options
      ARM: multi_v7_defconfig: Correct QCOM_RPMH and QCOM_RPMHPD
      ARM: configs: Drop duplicated CONFIG_EXT4_FS

Manikandan Muralidharan (1):
      ARM: configs: at91: sama7: add sama7d65 i3c-hci

Manivannan Sadhasivam (1):
      arm64: defconfig: Enable PCI M.2 power sequencing driver

Maxime Ripard (1):
      ARM: multi_v7_defconfig: Enable dma-buf heaps

Peter Chen (1):
      arm64: defconfig: Enable CIX Sky1 pinctrl, PCIe host, and Cadence GPIO

Ryan Chen (1):
      arm64: configs: Update defconfig for AST2700 platform support

Stefan Wahren (1):
      arm64: defconfig: Enable DP83822 PHY driver

 arch/arm/configs/at91_dt_defconfig   |   1 -
 arch/arm/configs/axm55xx_defconfig   |   1 -
 arch/arm/configs/dove_defconfig      |   1 -
 arch/arm/configs/ep93xx_defconfig    |   1 -
 arch/arm/configs/hisi_defconfig      |   1 -
 arch/arm/configs/mmp2_defconfig      |   1 -
 arch/arm/configs/multi_v5_defconfig  |   1 -
 arch/arm/configs/multi_v7_defconfig  | 106 ++++-----
 arch/arm/configs/mv78xx0_defconfig   |   1 -
 arch/arm/configs/pxa_defconfig       |   2 -
 arch/arm/configs/qcom_defconfig      |  15 --
 arch/arm/configs/sama5_defconfig     |   1 -
 arch/arm/configs/sama7_defconfig     |   3 +-
 arch/arm/configs/socfpga_defconfig   |   1 -
 arch/arm/configs/spear13xx_defconfig |   1 -
 arch/arm/configs/spear3xx_defconfig  |   1 -
 arch/arm/configs/spear6xx_defconfig  |   1 -
 arch/arm64/configs/defconfig         | 423 +++++++++++++++++------------------
 18 files changed, 250 insertions(+), 312 deletions(-)

