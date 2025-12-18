Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67603D6D232
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 16:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fOMAPBpqiDolFkcOOfLuDOPK8pbzW0rkKkcpmdMbel0=; b=C8Lh8B+qxAUc8Z+uGJ6/flIJ+T
	R24UzRPuJoIBVeM3nt9ElCZBu6BizFd0mrylj3HOrG/MQYGsEa6VAXZlSo935u+wW8KgVEUrXT2OZ
	lyUIlWrJZDrnSdL/PBOT2AY+/uCNAC4rp9fIEbPJWRMu68gQ0GdkUVaZbrAzevqAgf54DCH98fblH
	kCYkOo/Xzt1tkOV51NmDwqmkAK1MPem+1c0DtqBmpTR03+C2eqS8Bd24jvuqzJcfU8P2+wiHRMma/
	EROl+G5EaaXndQpjSXbrdQCladSbDgb+2F0YMq0CD8+XPxecvzzm4cRyus3R7dzeFLwI6wUIAz0n2
	xr6wW6Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWGiF-00000008nRd-1Goy;
	Thu, 18 Dec 2025 16:18:47 +0000
Received: from fout-b4-smtp.messagingengine.com ([202.12.124.147])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWGiC-00000008nPR-1hfk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 16:18:46 +0000
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfout.stl.internal (Postfix) with ESMTP id 7312C1D00106;
	Thu, 18 Dec 2025 11:18:40 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Thu, 18 Dec 2025 11:18:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsdio.com; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1766074720; x=1766161120; bh=fOMAPBpqiDolFkcOOfLuD
	OPK8pbzW0rkKkcpmdMbel0=; b=EIP+O6HUlwDzOF882SOb1CBQqX36QThwOXWSZ
	Kd8l52fbrfw6vXl/jvOZiJnXL/P+7R3/dhS8Tfi/kEuq60BU/oBPHO5YrTgq0xLL
	LBS1yJJZgduUU0pgmqRxjAEZB93hBj0s3HVmNXLtVP8nzYE5FMTSYBS92HnUPKkm
	2zw7NhFGEc4VqFRts6AQFqii76og2bIXyLR05zrMAS/M3Bryj9nHTeXHgVOGbAFA
	Uy8SembkBpHjHH4v6Stsdci8VCJEHAwpaIqyDGe4KLOdmxryg7V0r/bveAAGPk8I
	eacZbRJ0TqI5GRgtFC4/AIoM8tTXgIjc/gh2fnnGwCXDs6CpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1766074720; x=1766161120; bh=fOMAPBpqiDolFkcOOfLuDOPK8pbzW0rkKkc
	pmdMbel0=; b=rPWYe3iKNyVeGT3Qh96uYXq9jdpKMreGhcL6oTG0hKOlCzfUwAM
	Glc200gENEIcrXbjYDSEmzAC8dh1gFw0To2/HJL0h3d/Yz+lAws9ZDGgJvFq7TA4
	MUe0iR+KAN4V052rO8hIgf6iT6bXvwGp+32Xy9k/R8DJRLhJRGKDm8dbPkHY6tti
	Stv10rmR8L83kDoIs9koLkGzptC6G8u5W03/l0o+Ba8OUOIxvyjL4BKvMkfnFe+F
	mE3GAGSrbI3T9g7zk4xI58HvBMGLYUvmbmTbhLzSAj6os0mQChxHZqHSHtJ02dOZ
	bC59Yv40wkVwXCZ2Z3+yYyNrQiT4IZNWvVg==
X-ME-Sender: <xms:XilEaVnQGGwpt03wLTldXFgUuvSJex82Ipy0LAd1jW6wssaZEfae4g>
    <xme:XilEadj3dp-vMCTKdtw-v4j1D4xI2tuF67wOx6aIkdjhyqDLPzR4i2Omm3Mn-EV0q
    Qiy3j4M7_vxj7YMx1igtS1htRCDjqRzoRbtXdyfaT2nY8goioxIcg>
X-ME-Received: <xmr:XilEafh5YQ2II6HIXKgLnyW0hoo5RgeRAcX7ZGnOPPhNjaQoWkL8Qda7ExGbriPkmD1bkafVdmtiwoAV>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdegheekkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeftvggsvggttggrucev
    rhgrnhcuoehrvggsvggttggrsegsshguihhordgtohhmqeenucggtffrrghtthgvrhhnpe
    euvdektdelkeeukefgjeejteetffdtudeiffefheevfefgveeulefghfellefgvdenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehrvggsvggttg
    grsegsshguihhordgtohhmpdhnsggprhgtphhtthhopeduvddpmhhouggvpehsmhhtphho
    uhhtpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrh
    iikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepjhhovghlsehjmhhsrdhiugdrrghupdhrtghpth
    htoheprghnughrvgifsegtohguvggtohhnshhtrhhutghtrdgtohhmrdgruhdprhgtphht
    thhopehtrghnrdhsihgvfigvrhhtsehhvghtiihnvghrrdgtohhmpdhrtghpthhtohepug
    gvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhi
    nhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpd
    hrtghpthhtoheplhhinhhugidqrghsphgvvggusehlihhsthhsrdhoiihlrggsshdrohhr
    gh
X-ME-Proxy: <xmx:XilEafuxe2QfUYWV2H12-EGQgNh3MHcGEoHEo9w77VvUIMZS5D2Qfg>
    <xmx:XilEaXuXbW8YBFw4qeIFrDqG_0KlKhYNbz33pCkUOqLM5_FRg8q_gQ>
    <xmx:XilEadpIpmdY1eQyErOAx0lMbn_CSPtuy-oBwcFMHTu_-dHwBU_4Fw>
    <xmx:XilEaeJoo9sIepRDih2LVIfISMJLpo2QXtOwP-DzPkKGBoho-g1VjQ>
    <xmx:YClEaWF12XHfceZmNHmiUU5UvHu7F8PAmKkSQo9tR5dWu6jQAYt_KChZ>
Feedback-ID: i5b994698:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Dec 2025 11:18:37 -0500 (EST)
From: Rebecca Cran <rebecca@bsdio.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Tan Siewert <tan.siewert@hetzner.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: Rebecca Cran <rebecca@bsdio.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>
Subject: [PATCH v6 0/2] Add device tree for ASRock Rack ALTRAD8 BMC
Date: Thu, 18 Dec 2025 09:18:12 -0700
Message-ID: <20251218161816.38155-1-rebecca@bsdio.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_081844_832737_AE2BEA56 
X-CRM114-Status: UNSURE (   8.18  )
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

**Changes between v5 and v6**

- Removed aspeed,external-nodes property.
- Added pinctrl properties to adc node to request the ADC lines used
  for iio-hwmon bridge.

**Testing**

Ran `make ARCH=arm CHECK_DTBS=y aspeed/aspeed-bmc-asrock-altrad8.dtb`.

Rebecca Cran (2):
  dt-bindings: arm: aspeed: add ASRock Rack ALTRAD8 board
  ARM: dts: aspeed: add device tree for ASRock Rack ALTRAD8 BMC

 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml |   1 +
 arch/arm/boot/dts/aspeed/Makefile                        |   1 +
 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-altrad8.dts   | 637 ++++++++++++++++++++
 3 files changed, 639 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-altrad8.dts

-- 
2.47.3


