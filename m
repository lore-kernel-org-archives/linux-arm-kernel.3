Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FF10CD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 08:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kVlwzhdqMo0IkLJmL9SfZENeK7a3vWBac1kTS+2TzVA=; b=OGXCJexsQztURZA+NuhI8p0Kjo
	tjRXpAdp/mf87rEojfRzITrF8yGolpPKT+biFQHzd01CVtiwEoOeUjDcYxNb37uBXtUqtY6nU8C/Y
	eqwugVm/52Ck+Lbm2bQlBSG3Ot2rF0RYLf2JGFR4seT6aRn5/5WAulaoh8KxyRO7oOY1e0+3b/3CL
	lNo3IIEl28Sdz9GzkAitSEKXaxeVLSOjInJpM9bKXuOZc7C5bxaMvQA3LUQcQSZhvRs5Icuy5xx5A
	OGtOlrbjXSbsjWT0QqZ/doLOKPo2lZpa4enVpOCylD6t0xnzOF2fqn9rlXfPmN4zwJXDOgulwW6Ja
	7a3M9n+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZP0y-0000000FQrw-3hxk;
	Tue, 16 Jun 2026 08:19:20 +0000
Received: from fhigh-b1-smtp.messagingengine.com ([202.12.124.152])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZP0w-0000000FQrD-32RW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 08:19:20 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 9B0F27A0042;
	Tue, 16 Jun 2026 04:19:17 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Tue, 16 Jun 2026 04:19:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781597957;
	 x=1781684357; bh=kVlwzhdqMo0IkLJmL9SfZENeK7a3vWBac1kTS+2TzVA=; b=
	PqxlMVaE7o662r3yF4be0n4LYZ4fcKwWgkrKPR67QbBOJ9OjH3D95gZIlGL6cMsS
	XTPYBoBx8C20WNWNHl6NS9CucuDpQu95mRWtuhajjta9URqp8vS8qejONxDOQ9l9
	qx91+qelp0w6BD33yKGq/CnyfPrOvIhLKJolBmoeXPbEI3zeYZb0kUwa6YfsIvAe
	I3AOaKV7ofLeJ11euZMayalgrOXVwu8evVOj+fvtlk0YNrQ2Z+mC+tjJ8MJhTAj0
	r2b6HlJI3o4ZKrVYy/qAv7y66k5KzH/ciSJmNfDiXO1ItX0wK5g2MXivAjQajmZk
	faIRedr7XDHPd/fHDHY9Fw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781597957; x=
	1781684357; bh=kVlwzhdqMo0IkLJmL9SfZENeK7a3vWBac1kTS+2TzVA=; b=Q
	Iq/pkuZMH9g/ZjnHReaKj1SNW4RguBo/g+Iwh4tTOwHWMYstM6fa1tiVqAJ90GfP
	ZsWZEOJCiujI48zXM7cYo14vhX65Dx0mCwDFRf3lZKa1xZdd5cRL8ZxtKq7kIOPA
	nvgfOgPaRBNygwE6WdKt8xn+ZzX3lMHaJyYeUSxl5wB9lo5WPE62EuDoqr8Oy798
	e80x/Hv7RBIpWY7UUT6HFb6eyx9UQtgMibGunTctw6aM4RK23qHJ0cwBc3AAf4gP
	8+PnTovjkIESnmHBLp4eKsk/la2GTJK8RHw3XQHhTbpjJd/O36f9c3k1MFxlLv4y
	GNcvz4pYUwpFW5z9mkvNw==
X-ME-Sender: <xms:BAcxaq9tXoAw0Z73IMpHBSRXpro8qlpNXbBOUKhUjg5IH59rDws_eQ>
    <xme:BAcxaljBojnemsFH390L-fne7UhM6yKjQTwk0tjggzMJiDL8XSTP-49jfFIckhKuH
    yTyjPlWivVhpU1d7FMEkCrDTg0CAkDmPa51pLicfBKOaV-J2gR2AdI>
X-ME-Proxy-Cause: dmFkZTF4QUMeGd6iv3yzBOf7Fnfsl6QGcgSaC2dICC10YWwno/3Qc04Co1gCVVJ19qLyN+
    ZUxWiKuI66nphoATdJKGPOv0qD89bJDhmLlMicILzFz01OG8YIY8nG9ZWmB5r5nxkFKh5p
    MfPG5R8mAXpbO7/kzN2MnUEhBydZYsOvncSOE9wN1NNvwm8G49t6bRblhVGDekkf7Otpzp
    gjuEeeGQPc62BH+4yDegF87F6tYk16gy3Jv8/BuBCnKtZBANF1ZkEwVz50MordIJfg0x2H
    qBbTUj7nu0uljkIXZRRMKTfwaKSYY14+GrXMwEpnNFXdWjpRbltZjb/tGnTMx4qcXf4Taz
    N3qBp0c5/yyIDcTVr12XI41GIgTDKRhVZQBGs1JTX5zFuITJSGHlWO6DL3rGtTKKWh31kz
    yEaxnqFQ5JOSmtdFzf544xfbYP/vIL/Qk6oW58eq6chv+DJJHVH8nL0iJKVkJr/fywURM1
    +blE1NjaJ6bxZJ1qxzlx3dHA3H9jFO7dKQc/Ig2lrgaR3L6aIwDUOXsbSqc20/3UpVuFcU
    ua7DeT4b2BlaFfvA7d72flI6CzdO6LKcJx8MOluhcjVbMry75EbGBkK4H6dD7ayfc68TAO
    jD/MXaWrjynBHVvotbU8UNRFPqa3c8ppfx5cckclLko7FX6f+O7topgqGL9A
X-ME-Proxy: <xmx:BAcxaogqiJS22nqquboqx7tial-iDHbByDefyuTp8J7ZLNOksnMuFA>
    <xmx:BAcxajRQXrijaufQPclYXosoj4K2Z6Z7zEjrV_bXeBC7QTtNMZoNsw>
    <xmx:BAcxaiW6ai8X8Ja0zNmNQkqYPgETF7vQFNOPEF8ai6Hl2-ZfRj8Oqw>
    <xmx:BAcxavTteVI6iIhn8exToIZoHAW4ykp8EEev3xBm7KqegPl_NwoOnw>
    <xmx:BQcxakkrvUhNNUGai7EygD8GrxjGCDn5XWyrKqQieFdWeh3ywiZv26Ws>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id CB01E182007E; Tue, 16 Jun 2026 04:19:16 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AY-ceJz73NQB
Date: Tue, 16 Jun 2026 10:18:46 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 "Krzysztof Kozlowski" <krzk@kernel.org>, "Linus Walleij" <linusw@kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <ec0724b8-e660-4ff8-a06b-b34e288870ce@app.fastmail.com>
In-Reply-To: <40c8ebc3-d681-4dcf-b3f2-ce0d780c539e@app.fastmail.com>
References: <40c8ebc3-d681-4dcf-b3f2-ce0d780c539e@app.fastmail.com>
Subject: [GIT PULL 3/4] soc: defconfig updates for 7.2
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_011918_816051_44F77BF7 
X-CRM114-Status: UNSURE (   9.43  )
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

I originally sent this as 0/4, which was obviously a mistake.


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

