Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A60D21680
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 21:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=I3JyN6uQ6yNFenjv47EfSd7nrikiNFLfs5LjBOSqI2o=; b=hgZFE+9LaTgDijFLK/az+ypu9Z
	FO/5aQXGFOTRBiI79X0oJV0FofN800IPB1a2cO5Pnr9ANAOuqCeE6WiqAoP1/Wk4naebNmRzls2Ku
	fRrAoLWA9sRaj7LGZ8pIwFCj97B/IJElFGA83cefEDAtb0Cw+vwb4h9m2rvcNb1bE1mZObeCffLqh
	bRRN5WfYu9kodEIx9IWBut4KeHkDX9CotXbXRi67ZRrcAXz8wPBow5BmU2x7IwXXhwGVJy9ifMamn
	gVSTKFkh/1WNtoNyg+NUC9okJllwKEowNBs6MohGMYkNr2b1ZKEHOHJp5OmA0abv/CwIhoJ0Mmc4O
	/epXVMkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRGTg-00000008dzE-37gZ;
	Thu, 04 Dec 2025 21:03:04 +0000
Received: from fout-b2-smtp.messagingengine.com ([202.12.124.145])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRGTd-00000008dyf-3w2J
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 21:03:03 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id E2B151D0014C;
	Thu,  4 Dec 2025 16:02:57 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Thu, 04 Dec 2025 16:02:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsdio.com; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1764882177; x=1764968577; bh=I3JyN6uQ6yNFenjv47EfS
	d7nrikiNFLfs5LjBOSqI2o=; b=rK0RJANIOIsD0uqvPoJBbyRWEGXwXsHapTZb5
	n910WWWjTmj3QftdJ57Uy2jJ1bLH3XvnZaTnxZjtAZipXKfP01+Pf8sQA/eAY2nl
	8nEgTcWFLTYay0wbQ9kB0y+xl5DaoeAZW0K/gxVBHfZQm0BlRfzRJDP7OgrrSSEJ
	VQ2ujhPG1D8yGYe26lCnZwN24GBzfokVgyvhUEBNqUa8Hwu6ydzPGCew61oYJdPk
	VzC9wAxRW+PP7Pq1W5JO75EiVwdNPwkNiA5W/0l8ShAdvMQQ+CAia3QKlrhJLWkO
	GYDkapB3RLwWKHW1lYvpe5ue1+u3WOZuzKqyTtG8BN1OKPg9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1764882177; x=1764968577; bh=I3JyN6uQ6yNFenjv47EfSd7nrikiNFLfs5L
	jBOSqI2o=; b=lsIfHw/c0wyswHBUCEHZAR99I2ZVJs6H2rJDnl81RqGfBhSLjYB
	Tu/f6Uwm+mqu/EcRsG51Ooxg91cgYM4R3NrmMq79o5H+31b9eaIxdepdb8824Kdq
	AEaDepttW5X/iQHrQpXLFl0PP1TzwAFwe70DXszs+9KVHkYaF2fQtfKBy+HRI4if
	0x1/of4E3T4Hm/MdRoQHKpQeQsUh1/8AKWPmIv+aBWtLDEMWEL1PUduARWQw2pHz
	GKsCBiMhKqR1gcaKcwjDD828xOZihlixayfHZJ2XSLHW796HlkKiFyvJ0nxclpEj
	7K1kNURCHN3EyC9kyRTfovxoW3Rl0F8WFKw==
X-ME-Sender: <xms:APcxabIWzF6Epg04HgGAHowvaBtGMYLtGpCLXciMydnv3j90imAGIA>
    <xme:APcxaXRnYCxHfoc-W5TNwh98HH9KjvcTYoRp0_9_nBrYwHwry3A2ScQKamZEXlbDW
    9dE8YmFRRCKheAmpPRw2j7l92JPheGdGUz1QKa0UGo58jPxaVyyhCI>
X-ME-Received: <xmr:APcxaTNSh0LbfLUx28dXIGEYvo1-Ch_PtTuVHOme3xKMJI4yUVZUm_4vuBqcQXdSMuUqSKcmPE87YtZB>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeiiedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    ephffvvefufffkofgggfestdekredtredttdenucfhrhhomheptfgvsggvtggtrgcuvehr
    rghnuceorhgvsggvtggtrgessghsughiohdrtghomheqnecuggftrfgrthhtvghrnhepue
    dvkedtleekueekgfejjeettefftdduiefffeehveefgfevueelgffhleelgfdvnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhgvsggvtggtrg
    essghsughiohdrtghomhdpnhgspghrtghpthhtohepuddupdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhrii
    hkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehjohgvlhesjhhmshdrihgurdgruhdprhgtphhtth
    hopegrnhgurhgvfiestghouggvtghonhhsthhruhgtthdrtghomhdrrghupdhrtghpthht
    ohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    eplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdho
    rhhgpdhrtghpthhtoheplhhinhhugidqrghsphgvvggusehlihhsthhsrdhoiihlrggssh
    drohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgv
    lhdrohhrgh
X-ME-Proxy: <xmx:APcxaUVQ5jpOmrPV83ebfhCrLGhZwxMpIb2Y_Olwzz0zGm1EsZ1BAA>
    <xmx:APcxaehMulI1aS0ZlQkrTqWdpiGetmW75epFd08Bi8_QfuHTafGGiw>
    <xmx:APcxaVjOuBW8RmnoyjVWzpgnVtUfMPTXrbhT393U0IwqwuWJlwEwug>
    <xmx:APcxaUH2HGs_Rv84w7jNn5Pyd_9JU5gxH8CnuagzpKHpLdYgN4JT5Q>
    <xmx:AfcxacqgAeFqijyrJL-ZmIPnX4vTi-qw3svllPXxjXco1azWn1FLzmgi>
Feedback-ID: i5b994698:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Dec 2025 16:02:55 -0500 (EST)
From: Rebecca Cran <rebecca@bsdio.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: Rebecca Cran <rebecca@bsdio.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>
Subject: [PATCH v3 0/3] Add device tree for ASRock Rack ALTRAD8 BMC
Date: Thu,  4 Dec 2025 14:02:33 -0700
Message-ID: <20251204210238.40742-1-rebecca@bsdio.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_130302_389979_B7355C84 
X-CRM114-Status: GOOD (  12.51  )
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

Apologies for the long delay between v2 and v3 patches.

cc Billy Tsai for the move of ast2500 pwm-tacho docs from
aspeed-pwm-tacho.txt to aspeed,g5-pwm-tacho.yaml.

The ASRock Rack ALTRAD8 BMC is an Aspeed AST2500-based BMC for the
ALTRAD8UD-1L2T and ALTRAD8UD2-1L2Q boards with an Ampere Altra
processor. The BMC runs OpenBMC.

These patches add a device tree and binding for the BMC.

**Changes between v2 and v3**

- Removed system fault and enclosure identify LEDs; added heartbeat.
- Removed the code partition from the BIOS/UEFI flash.
- Renoved bus-frequency from i2c nodes.
- Renamed hardware-monitor to temperature-sensor.
- Fixed indentation of nct7802 subnodes.
- Swapped eth0_macaddress and eth1_macaddress.
- Removed pca9557 subnodes.
- Reworked GPIO names to be more consistent.
- Moved documentation of aspeed-pwm-tacho from txt to yaml file.

**Testing**

Ran `make ARCH=arm CHECK_DTBS=y aspeed/aspeed-bmc-asrock-altrad8.dtb` and
verified the messages about the aspeed,pwm-tacho device are no longer present.
The remaining messages are:

arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-altrad8.dtb: /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2500-lhc']
arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-altrad8.dtb: /ahb/apb/lpc@1e789000/ibt@140: failed to match any schema with compatible: ['aspeed,ast2500-ibt-bmc']

Rebecca Cran (3):
  dt-bindings: arm: aspeed: add ASRock Rack ALTRAD8 board
  ARM: dts: aspeed: add device tree for ASRock Rack ALTRAD8 BMC
  dt-bindings: hwmon: (aspeed,g5-pwm-tacho) Move info from txt to yaml

 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml      |   1 +
 Documentation/devicetree/bindings/hwmon/aspeed,pwm-tacho.yaml |  91 +++
 Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt  |  73 ---
 arch/arm/boot/dts/aspeed/Makefile                             |   1 +
 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-altrad8.dts        | 612 ++++++++++++++++++++
 5 files changed, 705 insertions(+), 73 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed,pwm-tacho.yaml
 delete mode 100644 Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-altrad8.dts

-- 
2.47.3


