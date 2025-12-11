Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23F1CD41C35
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 13:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n1dFL102IvyRuI2M5K3t2JBa4JSeYgA6HETfVWFDo10=; b=Tv2/fFcZFwaaKTp1Olc3xr/QWv
	ke7uKs5CxkrQKRqwAiJzzZvIXMY5wEPwebIdV3A8c9T4of9tIruBXa+GPccBpTS3bV+6tB/22Qccd
	3NmyOUbDGwlFLUtuyttoUVadLpd2VOqmRjIxTXzmJcOii2xFYvwJq13i/Bwn6DyJ9SqKDBeuu2BRC
	rOpMQM772GqvbnZ75YL/rVgqWAr6STYSyjNrkbm3AKm9shDBdjbsP1lTRIxb2KeIFyAwKEzh1LtvV
	cD7m2sd6zKByC03ua5y+pzAI6Cxnn7bxJ5Ghegym2jXhBVmqhXtmnckjLcNJ4yh9Z7skgdmip6Wag
	5cUd7hyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTgrb-0000000GeWT-0YlX;
	Thu, 11 Dec 2025 13:37:47 +0000
Received: from fhigh-b5-smtp.messagingengine.com ([202.12.124.156])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTgrX-0000000GeUz-3tZj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 13:37:45 +0000
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 2F37D7A012A;
	Thu, 11 Dec 2025 08:37:40 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Thu, 11 Dec 2025 08:37:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsdio.com; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1765460260; x=1765546660; bh=n1dFL102IvyRuI2M5K3t2
	JBa4JSeYgA6HETfVWFDo10=; b=rrJ0G2rS1KQBOSfjqstumfJ+ZM8ja8OJQjntI
	FK+AxEua5wOk02TohphvL1XRi4aJ16xPnf2MfsMjb6vvXHG/HupDdH0vFaUBDxV4
	kS7qj8gspnoQkQq2IPbRIZeIvoogkABEDjZsXWMlvyKgBBAioBOAP1Ooxgh2fbAQ
	TbTPNl71P5qdhSmZMserLeJNsNj1X/iqgiWBw3bOrhB8ezSbTYUV5+ZePTuNY7ub
	ecsflxjbmLMd0m+cBxzuxYWDfgSjItQw/l6wQSfexkH1ryrgMhuEN8CaaNV3gqf1
	PZsL+YZCB6ofKi4bzIcHXXnBLCGvf2sW2iZ1THMHUShkxrbYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1765460260; x=1765546660; bh=n1dFL102IvyRuI2M5K3t2JBa4JSeYgA6HET
	fVWFDo10=; b=Cl5ftS57JbFLpAKWOskXemnucZI2X/0Mx44Xh+H4Z76nq8Jv889
	0BpBHGNhAiivHKhuVF7oBfiYqkLaK211EGnn70oLqHEwxP6EgN/IBH4cRgkrBE9x
	ZBpjaAekP6/Otuc4bFzxRJ29xbs85zkvtvzEtlZwl9Frb6Z57N//iG8hcuIHerIN
	Pz0fI31XOP17ZokAxqnNc0TvBiGpqLDoAYjgSs5ceooktkx6+3/y4jwhY7sSILaL
	8K5rGoLTW8Bbje7RI7iPyzIXgb3Y8t+ORpeZAiE6NFw/Fh+Z3PR0lb9a5qPmkmCJ
	7mhU3xuOE7+V7MjI6mAk+O4KRWdb0+CyNZQ==
X-ME-Sender: <xms:Isk6aTvxBFoJGOW7WCHFt3Uutkf_i7Qa3OeaoqgeDhy-_KFUSBcx4Q>
    <xme:Isk6acmJOHxII5sBwL4yvCKHrPYQNRNbWdAw1LipcqSSA4LWIIDRu5HO2RvcU1N3Q
    680w_HN5EGGQZGIx6tsvycPKi1AheMumYo3n9aLMvlQ0D5q3zAJ3Q>
X-ME-Received: <xmr:Isk6aWROwsxR11-LT_YMghAyK26oM_VR3KsW1sN1I3JkUXYwHcmQANTlG1ltEzAwtneVT3qi6yVgiR1N>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvheeghecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:Isk6aSK3ww_qWNePEaEYZ2dWGaNjvuqPU5BVxy33_7oofLEBPmj2fw>
    <xmx:Isk6aQGnJVlsE478CXeT8V7b85APUovhu7lkF8r7v7mVoUkeS2pIUg>
    <xmx:Isk6af2gbAFc4i3pyDmnqlRG4Ta8cMYnw7A5QPitzuK952iHhvx2iw>
    <xmx:Isk6aYLkCZxjtr4hQnzHFijWy9aj89azZV0b4V9vIi4OmdJVAeorvA>
    <xmx:JMk6ad8Nm_TvHlDsujl3b0NbjgaaudIKNKmSp3sySbmeoA555NxM43sy>
Feedback-ID: i5b994698:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 11 Dec 2025 08:37:38 -0500 (EST)
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
Subject: [PATCH v4 0/2] Add device tree for ASRock Rack ALTRAD8 BMC
Date: Thu, 11 Dec 2025 06:37:17 -0700
Message-ID: <20251211133721.18269-1-rebecca@bsdio.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_053744_268169_14DAA161 
X-CRM114-Status: UNSURE (   8.37  )
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

**Changes between v3 and v4**

- Re-added system fault LED after verifying it works with an
  LED connected to the AUX header.
- Fixed GPIOs based on Tan's feedback.
- Dropped DT schema commit in favour of Rob's changes.

**Testing**

Ran `make ARCH=arm CHECK_DTBS=y aspeed/aspeed-bmc-asrock-altrad8.dtb`.

Rebecca Cran (2):
  dt-bindings: arm: aspeed: add ASRock Rack ALTRAD8 board
  ARM: dts: aspeed: add device tree for ASRock Rack ALTRAD8 BMC

 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml |   1 +
 arch/arm/boot/dts/aspeed/Makefile                        |   1 +
 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-altrad8.dts   | 625 ++++++++++++++++++++
 3 files changed, 627 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-altrad8.dts

-- 
2.47.3


