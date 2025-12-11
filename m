Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50BA5D41D6B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 16:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FV+/mf1TDpvf9vv9dubhpTnpGcmZYUCXQBu8f7/hO8I=; b=uM+acYSgKyM3IJ7QcNakYOfayl
	QR/aWIjMMEPsz+z0XH7USLgw7SlUtUJkShG2AV9ZQnC9F7EbD/jsE4VPIxYv8vM0gkbfHEiJneil9
	+Bzx1L5INHSzM6zPG8GTFCiiZf1Ti4Rt/2Wesm4ggoFZGSONNkOGPF2HzqR9b8p4IaHV2lcug6xae
	JxQG8/WEs5+YVg7ie2p0x3Ywxoq9RPlENgRHVNQ+0Xj3TmtA5OMWI95fFfdC6fsEIvvIWeNTOJJfj
	n8NQUoRtZeCjg/J7Cayjf0IEwNaWOPTKdLnnsoC3mrycHCvtnp6zf3gZjBS4bzlzTiOexxIE9U/NB
	5lnqPTTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTjyc-0000000Gzdx-2Lj6;
	Thu, 11 Dec 2025 16:57:14 +0000
Received: from fout-b6-smtp.messagingengine.com ([202.12.124.149])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTjya-0000000GzdI-1aqe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 16:57:13 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id EB7961D0005C;
	Thu, 11 Dec 2025 11:57:09 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Thu, 11 Dec 2025 11:57:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsdio.com; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1765472229; x=1765558629; bh=FV+/mf1TDpvf9vv9dubhp
	TnpGcmZYUCXQBu8f7/hO8I=; b=zre2iYV2KpNCrrkml4JE+j4P2mn/oYCcIpn4K
	wqtDAv1VIS27KbWp7kxCzXOmnIBSMg8o3Yzj8/Shur9WnIoydJzU1WfMT27o8JXe
	0zDfvxb6UN4DhwVgY8AqSHy79kfPDSriP+fIbLnj2zyG1lre5viwrvGAZRIQOkd4
	EuAq0SWXxd9Lr+nknEVUNAyAUPmYGkzESbep9WELnCkeCYSMyKBy/v7nL9YP8iuj
	16/XaKw8Zaz3o1Qr84zg2x42D1iprs76Ioab02l6IgmnxSi8j8L2Ebp/jVOh0N76
	MC3JlKHpJ7EXHEpgKkHnGYGpjetQRNg/LwNk340kjbJRAly9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1765472229; x=1765558629; bh=FV+/mf1TDpvf9vv9dubhpTnpGcmZYUCXQBu
	8f7/hO8I=; b=jmQqp7yHuKNzHHSQeDsE31pfLBJmQxTyXpTJQeFTMFQ3yCVK2AD
	dz9BeOWk0UFNo5fp6Glw2dPn8/RiWuGfI9SKvf0otJ9Tz1LtqU4W8KuSLp1yda+D
	LN+Gp1oeeARRCYrmEXRfGnwRVzx644cUqlp5ZJLc2YaSQVUyeAxH+2WD+p1ExQD9
	/8Jjcddy/BjOqCxVgCXiaM18gJJ+36Y1x5wtu8hC55TF7lqAsfMcxmEbRX2xaQko
	+WNZcjqR+HhBluuMGi4rMu5YdU1vayBKcrXwt3dBpBEL60rPgIu0Fv5e2GX7eZLC
	kE/Y/F4LgcJMwZDKvDxhm0ga1SRaYwoqxog==
X-ME-Sender: <xms:5Pc6aZWbJUUASrSVq0QUvyj3BppjvJIDJrHV2FScZ4sjfWhQApawag>
    <xme:5Pc6aRvuJQkQn9E5fxC_GolkwJH7Pio6H_Whl_oLiVzBRSJ18eu50Gcl1CTYWysWC
    AvutmEbi4r8jp_srw25qko8jN1C_2vE1YvXU7pt8Jn1vHaP9UNjsA4>
X-ME-Received: <xmr:5Pc6aU6xj63M3XnlaXtFWxMh702mfrLtWTvanLxt1mMF9kB_f0U5klZE8CuTLfQJ1fWd9o4TPezKoe0q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvheekhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeftvggsvggttggrucev
    rhgrnhcuoehrvggsvggttggrsegsshguihhordgtohhmqeenucggtffrrghtthgvrhhnpe
    euvdektdelkeeukefgjeejteetffdtudeiffefheevfefgveeulefghfellefgvdenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehrvggsvggttg
    grsegsshguihhordgtohhmpdhnsggprhgtphhtthhopeduuddpmhhouggvpehsmhhtphho
    uhhtpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrh
    iikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepjhhovghlsehjmhhsrdhiugdrrghupdhrtghpth
    htoheprghnughrvgifsegtohguvggtohhnshhtrhhutghtrdgtohhmrdgruhdprhgtphht
    thhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdr
    ohhrghdprhgtphhtthhopehlihhnuhigqdgrshhpvggvugeslhhishhtshdrohiilhgrsg
    hsrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhn
    vghlrdhorhhg
X-ME-Proxy: <xmx:5Pc6acQQzWlHepqpVAiP5l-uNUdKFuz8OzeDGolhAicNDQM1IooTFQ>
    <xmx:5Pc6aftcADNT-RSR_rHD4O0VR4MsrbGs0ThHiB7g1ZnaBBHwNB_v8w>
    <xmx:5Pc6aW-4gtH1FrFLWvEvZz-5b_lf8T4Rhj9HIenJ7y--NPWqPRtP2g>
    <xmx:5Pc6aQxMmodAiQR2NNZIxJ_oYcCCT46CqGnAw8wdufWkMat07gIJ2g>
    <xmx:5fc6abEd8mY0s5x0s9HUxmRzxUPhnpR4H2UNLtvfdCdqyMqT4RzqmxEi>
Feedback-ID: i5b994698:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 11 Dec 2025 11:57:07 -0500 (EST)
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
Subject: [PATCH v5 0/2] Add device tree for ASRock Rack ALTRAD8 BMC
Date: Thu, 11 Dec 2025 09:56:55 -0700
Message-ID: <20251211165700.29206-1-rebecca@bsdio.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_085712_725857_1EDF92E8 
X-CRM114-Status: UNSURE (   7.79  )
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

The ASRock Rack ALTRAD8 BMC is an Aspeed AST2500-based BMC for the
ALTRAD8UD-1L2T and ALTRAD8UD2-1L2Q boards with an Ampere Altra
processor. The BMC runs OpenBMC.

These patches add a device tree and binding for the BMC.

**Changes between v4 and v5**

- Removed the uartx-mode1 GPIOs, which were wrong.
- Fixed button-power-n GPIO name.
- Removed backslash from end of line, which isn't needed.
- Removed duplicate/wrong bmc heartbeat GPIO.

**Testing**

Ran `make ARCH=arm CHECK_DTBS=y aspeed/aspeed-bmc-asrock-altrad8.dtb`.


Rebecca Cran (2):
  dt-bindings: arm: aspeed: add ASRock Rack ALTRAD8 board
  ARM: dts: aspeed: add device tree for ASRock Rack ALTRAD8 BMC

 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml |   1 +
 arch/arm/boot/dts/aspeed/Makefile                        |   1 +
 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-altrad8.dts   | 624 ++++++++++++++++++++
 3 files changed, 626 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-altrad8.dts

-- 
2.47.3


