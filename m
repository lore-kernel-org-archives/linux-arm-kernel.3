Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B4BC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 02:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8PiyfYLTOpYLPEaywpUplwwoVhHTcOz1zbW+p8rVbu4=; b=TVDWt0k3oLIZ3GGTMRHfknto1/
	ogpkqTNHz4eWGMiOPaGJwsHHLl/zgTAVfe8DYHV+YeeBUvekkHplGLws0xDRKVDOQd8cBa0GHIXRf
	s/hYwWgJd+FK3Gsq6aCevnwy5SeLEX59nA89P4Fns32SW5NGZ1weLeXoCxVOoGLOtVXtikMDyJUg4
	Bs9NIb38pkNPeQtsSBxp1FraYIjz4AZ1xxnHtxcvN/Z+HfE5INil5893CifOHQhN/gNVIPSGH84Z7
	AkKpW4XPue2Hyz9EdU197ObqoI76wwJ4sUdaoYRvCEpKnUv4wqFcACTWsCAGoKHtqftHpd4jaHe/K
	Iacwkkmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGq1P-00000007pJc-0wXe;
	Mon, 19 May 2025 02:14:31 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGpzN-00000007pFI-08ud
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 02:12:26 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-ac2bb7ca40bso670687566b.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 May 2025 19:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1747620743; x=1748225543; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8PiyfYLTOpYLPEaywpUplwwoVhHTcOz1zbW+p8rVbu4=;
        b=QmNFX4Rv1mTstRF4nCwCqoGmqVNvCUWRmNaAGS7z2HcQdcVIJ2yxpPijY/+WvmRpLn
         BrplEzrl8iOKs/OWsP6t4qcTHLQ8CXOjJqR5tjq4j8ON9wbLV7jEULKSdSyv9VHPWgr4
         LJkRYvIiXoGM4yjAFTHvZT82AwDX7MjurUAAQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747620743; x=1748225543;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8PiyfYLTOpYLPEaywpUplwwoVhHTcOz1zbW+p8rVbu4=;
        b=MNCv8MLh6UDTRO7XOFftmwcRdvxgOG2OUQ9eHZ4+FikEgvc/VmJaMz4yjtE1h1TqJ6
         0y9HSAgwFMpLO3yhAI8qksQdXlP5inHhxeG4WawwSOrQ73mlvAyMIhnJ4EWah6PR8tLo
         fvMnSw178njBtB8yUo0zZT3kYpaoArBmkuviTKEE4CFxpslITkmCNVvC2YifEgHLKcXx
         SC2aNoDYOmgwVSqNm7uQlbBAkKVVlPzJc+I1Vx19H8eRerDq7je9JBrRGQlxDIeE90/E
         USYGUkNJDGSa+NToUykKm5lowlZzhPvzrHX1n66iYkIi7J+SODb3kaqHOyhlmKsMJKXB
         fH7Q==
X-Gm-Message-State: AOJu0Yy3m7S58e4JZF64I5V5wgnb87yS+g/5j2NrnIJ+peLP8NAYuFeD
	25YBmANPkEwRxQJTtVF4JxX6AzMm91n4lknwHUZMOZna3bCkQd/m8pCXHkSbzvItye0KrB6VSq6
	EkmkehTiduLnWMuNdGp5pC0drQ0RD8NEwpX0jnE4=
X-Gm-Gg: ASbGncux3ti1A7PDWMziL7QxI6j/8n4KBEJIFzxEredaeiHFPabo4SWLonngxscVlev
	BmqUQuZwRp80RglqF+nysfD9heWaCRVnIeejkZNuSjvurmXFcjaC0fc728/D2drAvvD2ABlEx2e
	hdCmPwpYnYLWrE5oVoMcREYN4+53SkdS3dxui0IMD5jUA=
X-Google-Smtp-Source: AGHT+IGNShkus28bhfx7W2x1K+4ajDa/8mB60w6pvvUIwPVMUfU1MM2zJ00ko3u+od4Dr2jP2v5Xp0zGToAGigcNZlA=
X-Received: by 2002:a17:907:9728:b0:ad5:5302:4023 with SMTP id
 a640c23a62f3a-ad55302638cmr525379466b.44.1747620742721; Sun, 18 May 2025
 19:12:22 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 19 May 2025 11:42:11 +0930
X-Gm-Features: AX0GCFvrkD8u8H305xamS26PUCKs_SenW2FoEiTxH9Jfwr-FWKT13dQX4G_y6MY
Message-ID: <CACPK8XdYLf6s=GtB5bsEw4zj0JjUBob-6GhdJzivX51y+E=KEA@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: devicetree changes for 6.16
To: arm <arm@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, linux-aspeed <linux-aspeed@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250518_191225_451377_5636E09C 
X-CRM114-Status: GOOD (  17.86  )
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

Hi Arnd,

Here's the Aspeed pull request for 6.16. Andrew has prepared the
patches and created the tag, so all credit goes to him.

There's a change that Andrew calls out in the tag I didn't really
like: it breaks old userspace by moving things around. The argument is
that userspace was "wrong" to be using the paths under /sys. I think
the cart is leading the horse if we let the yaml checking take a
higher priority than breaking userspace. But I haven't the time to
fight that battle, so here we are.

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc
tags/aspeed-6.16-devicetree

for you to fetch changes up to 13c9c6eabf033ed4f369ad4d29bdc58ed4a411e3:

  ARM: dts: aspeed: Rework APB nodes (2025-04-08 10:58:33 +0930)

----------------------------------------------------------------
ASPEED devicetree updates for v6.16

Significant changes:

- The APB nodes in the ASPEED SoC DTSIs were reworked to eliminate a large
  volume of warnings from `make dtbs_check`. The changes to the node names are
  naturally reflected in sysfs, which may impact some userspace applications.
  The impacts are called out in the commit message, along with arguments for
  the change.

Removed platforms:

- IBM's Swift BMC

New platforms:

- NVIDIA's GB200NVL BMC

  NVIDIA GB200 NVL72 connects 36 Grace CPUs and 72 Blackwell GPUs in an NVIDIA
  NVLink-connected, liquid-cooled, rack-scale design.

Updated BMC platforms:

- Bletchley (Meta): Fixes for GPIO hog name, remove ethernet-phy node
- Catalina (Meta): Various sensors added, MCTP support for NIC management
- System1 (IBM): IPMB and various GPIO-related updates

The System1 series includes a devicetree binding patch for IPMI IPMB devices.

----------------------------------------------------------------
Andrew Jeffery (1):
      ARM: dts: aspeed: Rework APB nodes

Joel Stanley (1):
      ARM: dts: aspeed: Remove swift machine

Krzysztof Kozlowski (1):
      ARM: dts: aspeed: Align GPIO hog name with bindings

Ninad Palsule (8):
      dt-bindings: ipmi: Add binding for IPMB device
      ARM: dts: aspeed: system1: Add IPMB device
      ARM: dts: aspeed: system1: Add GPIO line name
      ARM: dts: aspeed: system1: Reduce sgpio speed
      ARM: dts: aspeed: system1: Update LED gpio name
      ARM: dts: aspeed: system1: Remove VRs max8952
      ARM: dts: aspeed: system1: Mark GPIO line high/low
      ARM: dts: aspeed: system1: Disable gpio pull down

Potin Lai (11):
      ARM: dts: aspeed: bletchley: remove unused ethernet-phy node
      ARM: dts: aspeed: catalina: Add IO Mezz board thermal sensor nodes
      ARM: dts: aspeed: catalina: Add Front IO board remote thermal sensor
      ARM: dts: aspeed: catalina: Add MP5990 power sensor node
      ARM: dts: aspeed: catalina: Add fan controller support
      ARM: dts: aspeed: catalina: Add second source fan controller support
      ARM: dts: aspeed: catalina: Add second source HSC node support
      ARM: dts: aspeed: catalina: Remove INA238 and INA230 nodes
      ARM: dts: aspeed: catalina: Enable multi-master on additional I2C buses
      ARM: dts: aspeed: catalina: Update CBC FRU EEPROM I2C bus and address
      ARM: dts: aspeed: catalina: Enable MCTP support for NIC management

Willie Thai (2):
      dt-bindings: arm: aspeed: add Nvidia's GB200NVL BMC
      ARM: dts: aspeed: Add device tree for Nvidia's GB200NVL BMC

 .../devicetree/bindings/arm/aspeed/aspeed.yaml     |    1 +
 .../devicetree/bindings/ipmi/ipmb-dev.yaml         |   56 +
 arch/arm/boot/dts/aspeed/Makefile                  |    2 +-
 .../boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dts   |    2 +-
 .../aspeed/aspeed-bmc-arm-stardragon4800-rep2.dts  |    4 +-
 .../dts/aspeed/aspeed-bmc-asrock-e3c246d4i.dts     |    2 +-
 .../boot/dts/aspeed/aspeed-bmc-bytedance-g220a.dts |    4 +-
 .../boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dts   |    2 +-
 .../dts/aspeed/aspeed-bmc-facebook-bletchley.dts   |    5 -
 .../dts/aspeed/aspeed-bmc-facebook-catalina.dts    |  197 +++-
 .../arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dts |    2 +-
 .../arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts |    2 +-
 .../arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dts |    4 +-
 .../arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts |  139 ++-
 .../boot/dts/aspeed/aspeed-bmc-lenovo-hr630.dts    |   46 +-
 .../boot/dts/aspeed/aspeed-bmc-lenovo-hr855xg2.dts |   68 +-
 .../dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts  | 1128 ++++++++++++++++++++
 .../arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dts |   14 +-
 arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dts |   10 +-
 .../boot/dts/aspeed/aspeed-bmc-opp-palmetto.dts    |   40 +-
 .../arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dts |    6 +-
 arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dts  |  974 -----------------
 arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dts  |    8 +-
 arch/arm/boot/dts/aspeed/aspeed-g4.dtsi            |   93 +-
 arch/arm/boot/dts/aspeed/aspeed-g5.dtsi            |  109 +-
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi            |  249 +++--
 26 files changed, 1773 insertions(+), 1394 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/ipmi/ipmb-dev.yaml
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts
 delete mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dts

