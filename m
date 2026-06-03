Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0DBACD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 07:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Date:Cc:To:From:Subject:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y5M+BHkdRMszwF+UBYD7j3KKopl0PRpBV+LxR571Fz4=; b=KYYxPvG4PmYIpPVbfixXmaLc5B
	l449M5m22UgL2gLQXoch4h61bfnbcEl1BfdoJjeK/SU7UkXL0FvBwt4kNBz2VlkFJm8i0cTqjWPkU
	5xjVvtTc9jPYHdDahPtWvlOqFycvFNR4imYYt8LQ7wVxx+MWvJFo/82r5YwQicUoo16yHFAet8txC
	q/KsEv1fTb/VoauoZPjJrNiEI5b3DNGjHEj/AL+R+nCoV/rQ2QGS/K9lKe5L8Pu6bD2WT5ng/xYDc
	nfo4QANoEr9DOhvkpVCbEFuSJyO5ZN6uXx3FcH/z3v+B3VZPyWN9QkVeiNhdW1rM5YpPxEDISmEoD
	Fomcxy6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUfsc-0000000ESzs-3vey;
	Wed, 03 Jun 2026 07:19:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUfsa-0000000ESzh-17Nf
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 03 Jun 2026 07:19:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=y5M+BHkdRMszwF+UBYD7j3KKopl0PRpBV+LxR571Fz4=; b=E3gPdF+getGsasFXQPUin6xQoo
	vZKXH9295qaZbSpuhZhL0l1nWBO1TYSZD8sASxxuROZNLcOc9FoZSrR7I+PuzbNVn/yj/0FlYXGlg
	boh4NFWAk8GmhZer/0UF4z1wdHaEgbWnfcX2Xn9Mun89b3BHEYCoNBxqhGo6cOE96l99rxfMMoFXu
	AHrcP349fg5dYrzZTq8KWOM4IEpUtmzGH3tY4i1XoOU+VHaf8wnxnVrS4SXzttqMyaN+ukwWqffNG
	5uEXZG0y7o8K7f9ZU3YiSaXnEQ0c7YYqmfpS8qDZWr/f4WtIBqqO4fTeKhoejaHLbjHsH5YVpEDQ+
	+wE9gu7w==;
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wUfsV-0000000BOsi-3al5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 07:19:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1780471127;
	bh=y5M+BHkdRMszwF+UBYD7j3KKopl0PRpBV+LxR571Fz4=;
	h=Subject:From:To:Cc:Date;
	b=NKyx2CatndWRFcz4jUeX3R9F8lteKdztwG4DlJlQ5HB7ZZdsHTr4O3xArvyGt3dv7
	 KHl74V01O88gBB7sP7UH2Ubh0AAQIqnMpZCQ5SJZcG5rhR65cs6rS3N5PstQPhty5C
	 +sv+4+hppj1+avwMSza3zSVQNvSRVyhBUzAht8WBzbMb3tQ3/W1uP34PFHIxc6tsnw
	 74q37neyo0wodQFl3P5FxWlV1/dBpQ1HN0L37UaeVXnJA0FZEmqr/kb+3BdACgw19h
	 U3g+0cLuTwlBAr24dhUWWsI4HBz3KHp3upuBzExVNa2a2k5hP6iizHVePx3D6zhMHc
	 n2/xSwzTbZWDg==
Received: from [IPv6:2405:6e00:2428:1c7f:23a6:ec69:2b14:b7d] (unknown [120.20.104.66])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B237960087;
	Wed,  3 Jun 2026 15:18:45 +0800 (AWST)
Message-ID: <cbd2822caa9fc7c2b4567703be785b9b4fd829cd.camel@codeconstruct.com.au>
Subject: [RESEND,GIT PULL] aspeed: First batch of ARM devicetree changes for
 v7.2
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: soc@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Date: Wed, 03 Jun 2026 16:48:43 +0930
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_081904_894737_DFC945D3 
X-CRM114-Status: GOOD (  12.26  )
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

Hi SoC maintainers,

The first attempt[1] missed the preamble, so here's the same again,
this time with it included.

[1]: https://lore.kernel.org/soc/55ab27bc5e09252b1dbfdf1505693eb193b8e846.c=
amel@codeconstruct.com.au/

Cheers,

Andrew

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731=
:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git tags/aspeed=
-7.2-devicetree-0

for you to fetch changes up to 1249ee157de518a76cec169e2a5db4d6e523cc90:

  ARM: dts: aspeed: sanmiguel: Fix the CPU_CHIPTHROT linename (2026-05-27 1=
2:44:26 +0930)

----------------------------------------------------------------
aspeed: First batch of ARM devicetree changes for v7.2

New platforms:

- Rainiera6 (Meta)
- SanMiguel (Meta)

Updated platforms:

- Anacapa: SGPIO line names and interrupt configuration
- Clemente: Remove TMP421 nodes
- Kommando: Enable networking via MAC2/MDIO2
- SanMiguel: Line names and interrupt configuration

AST2600 SoC updates:

- Describe PWM/Tach
- Describe I3C controllers
- Reorganise I2C nodes

Other notes:

91b9aed7381c ("ARM: dts: aspeed-g6: Add nodes for i3c controllers") current=
ly
causes a new warning:

  ... /ahb/apb/bus@1e7a0000/syscon@0: failed to match any schema with compa=
tible: ['aspeed,ast2600-i3c-global', 'syscon']

The patch necessary to address it has an R-b tag from Kryzsztof[2] but as b=
est
I can tell is yet to be applied to the MFD tree. I've left the change in fo=
r now
as the warning will resolve once the binding patch is applied.

Lastly, as part of improving support for the Kommando card Anirudh has also
addressed[1] the persistent pain we've had with the phy-mode property for t=
he
AST2600 MACs. Thanks to Andrew Lunn for being on the case for a while now, =
and
for those who tested Anirudh's patch.

[1]: https://lore.kernel.org/all/20260525-asus-kommando-v3-0-e6a0ca1b4a3e@g=
mail.com/
[2]: https://lore.kernel.org/all/20260425-poised-accomplished-hyena-d2c1a0@=
quoll/

----------------------------------------------------------------
Anirudh Srinivasan (1):
      ARM: dts: aspeed: Enable networking for Asus Kommando IPMI Card

Billy Tsai (1):
      ARM: dts: aspeed: g6: Add PWM/Tach controller node

Colin Huang (1):
      ARM: dts: aspeed: anacapa: Add JTAG CPLD TRST pin to SGPIO map

Daniel Hsu (1):
      ARM: dts: aspeed: yosemite5: Add MP5998 power monitor

Dawid Glazik (2):
      ARM: dts: aspeed-g6: move i2c controllers directly into apb node
      ARM: dts: aspeed-g6: Add nodes for i3c controllers

Ender Hsieh (1):
      ARM: dts: aspeed: msx4: enable BMC networking via MAC0

Mike Hsieh (1):
      ARM: dts: aspeed: clemente: Remove IOB NIC TMP421 nodes

Neil Cheng (2):
      dt-bindings: arm: aspeed: Add Meta Rainiera6 board
      ARM: dts: aspeed: rainiera6: Add Meta Rainiera6 BMC

Potin Lai (4):
      dt-bindings: arm: aspeed: add Meta SanMiguel BMC
      ARM: dts: aspeed: Add Meta SanMiguel BMC
      ARM: dts: aspeed: sanmiguel: Add IOEXP interrupt pin settings
      ARM: dts: aspeed: sanmiguel: Fix the CPU_CHIPTHROT linename

Rex Fu (2):
      ARM: dts: aspeed: anacapa: Add interrupt properties for PDB PCA9555
      ARM: dts: aspeed: anacapa: Correct SGPIO names for monitoring

 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml        |    2 +
 arch/arm/boot/dts/aspeed/Makefile                               |    2 +
 arch/arm/boot/dts/aspeed/aspeed-bmc-asus-kommando-ipmi-card.dts |   18 ++
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts        |   34 ++-
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts       |   20 --
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-rainiera6.dts      | 1012 +++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts      |  672 +++=
++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts      |    5 +
 arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dts         |   15 ++
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi                         |  552 +++=
+++++++++++++++++++++++------------------
 10 files changed, 2074 insertions(+), 258 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-rainiera6.=
dts
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.=
dts

