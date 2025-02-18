Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9AD9C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 16:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YAimL9/MtxGqFmKWSu1QiM4kmZSk0e/LYupNttACQWU=; b=JOzuK6zbnVh/si/j9mxP4kdsS1
	uRBJMKl91ZZiNvFnCCWSyEaVZOYbasA4Ys9QrDRrgYJEMnHaIIYUV/okV5kMKBKk9qv0Qi3fDyZX0
	yadLzzDg8bQVtCsqLlRgwLhcRnLfERq6xT8Sd+SBLUhs2gEPhCE9UO7r/dn6fl73l3sWACqb+wsAD
	QRv4crOj1MIaEte7xOKHTzipwfpO2gwrRxbQE+2I6nOigyyHf+N3lHYZuesYPqDPDOfyeb8G3QCQa
	iztxRIj+Z/sqXMb57IH2jNQAf8a5yQQIsC8Ev/LpOwAnR0DzcGatZF8slvfFYgUm/88dqJwBkBGom
	oP9CYHLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkQuy-000000093V8-3Xkd;
	Tue, 18 Feb 2025 16:57:56 +0000
Received: from fhigh-b1-smtp.messagingengine.com ([202.12.124.152])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkQtU-000000093AJ-2rwK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 16:56:26 +0000
Received: from phl-compute-13.internal (phl-compute-13.phl.internal [10.202.2.53])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 060242540120;
	Tue, 18 Feb 2025 11:56:22 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-13.internal (MEProxy); Tue, 18 Feb 2025 11:56:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1739897782; x=1739984182; bh=YAimL9/MtxGqFmKWSu1QiM4kmZSk0e/L
	YupNttACQWU=; b=UgXZQfsoGDr0JmG6rD00RKfOl9x9wUdNo99MozfLSw0Xz6aC
	ih2Vmv9z+rxnTSrBSjQ1WT/a1dKKqMlYP+9nMDrSeOc3XcDbarba3aEIZpXqR6LD
	Xulfu/G4OYKwMB7vOdBR/6208YGJ0631wgJuhCb8IpBBXnYxoqn3szE9YjjZNtOw
	1IN0K3Y8rxztC7h3fGSSsxr8TLEGXX0uH5SP7iO//AlmKx4nhCmMfulUt2UctLOv
	0IKUdn5nlt+jNkKZPwc26vKGT07Q1SsQkpSjnu9i9SXD+otnU0C1/yZYiqeZtYcQ
	VHPcbUzAAhORwXvi6ZGWbMMG0FPSU23HSTCu4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739897782; x=
	1739984182; bh=YAimL9/MtxGqFmKWSu1QiM4kmZSk0e/LYupNttACQWU=; b=Z
	Rd3b/jtbRv1kySJ3A/5N557ZW2ve1EdULgyZDuTa+7dJV37pWnN5Nq9IufKhCtrw
	lqT+ofK0iy1ouNM4LdvbNdKxg7g3ybIIkp1hVmNcCmsTDAmKmhw8+4JF5dt/Ehb+
	RlAkKq2mSZBvKOE17yzwobKRjDUmVZ/69zehu4Qa3hiX5VrmtJxprSFQvb5JFesm
	LbJTdxXHb5EnPmLxH1oFIlTpzw0Qbh8xAxb6jl3f/V3gztQFgFO++IGRz757k84V
	7vf/tF/8KkBuyA4l4/07SaRH1+hwhZECRP2qJ1yaAybT9gA92Cm9jBvLYmNU7vKy
	ETLsU/yhThMvSI/9E9FOw==
X-ME-Sender: <xms:tru0Z4vRQs_ew_uwfujeBZ4OVfoRHEmv0BGyklBEneDheC_mSsrQfg>
    <xme:tru0Z1c20EWfB3cDxeuzxItEgws6wrgP2tRkC34Mjm6aoXeNL2MKwiThdZXGTo-e6
    H5fvWJD87nXGjq_X6c>
X-ME-Received: <xmr:tru0ZzylDUxmbPr6O6q07Ryd7BNjP0z-fk6ekT4Y7yNZgQiBBToFe9F4DVXJWhRaenx9sXQoxfjSEUICTiCoKG4r7q5uqvNHyeT4Ne0Qx6n8R3QYBc_UUIBOkz8t35Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeiudekgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredt
    jeenucfhrhhomhepufhvvghnucfrvghtvghruceoshhvvghnsehsvhgvnhhpvghtvghrrd
    guvghvqeenucggtffrrghtthgvrhhnpeegieehffethffhffefhfehkeevleevieetfeeg
    keehhfeifffgheehieejheeihfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehsvhgvnhesshhvvghnphgvthgvrhdruggvvhdpnhgspghrtghp
    thhtohepuddvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrghrtggrnhesmh
    grrhgtrghnrdhsthdprhgtphhtthhopegrlhihshhsrgesrhhoshgvnhiifigvihhgrdhi
    ohdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhrii
    hkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehjsehjrghnnhgruhdrnhgvthdprhgtphhtthhope
    hsvhgvnhesshhvvghnphgvthgvrhdruggvvhdprhgtphhtthhopegrshgrhhhisehlihhs
    thhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvg
    hlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-ME-Proxy: <xmx:tru0Z7OudkQCQ8WODg6XJL1rO10W8-hiEqwz5aZFyD56nkTDGyOG3Q>
    <xmx:tru0Z4_4xEomSJgPEIVZsZ1CLkQI3EpOXng9Rwh2QVQIgaFmGSIRTg>
    <xmx:tru0ZzXr6HP_yrFIp0cgnXu3cINy2wPrs1zvHIuMkVzV8fpkN_tRgQ>
    <xmx:tru0ZxdV99ouswqFWYT8WTLQhws84P61NKVPp0BJqdrzawqsmoiE9A>
    <xmx:tru0ZzXJjlwkGk_3CueBPM87sCaEvEzMjgbKpdvdm-rd9_xdHoeV6hcu>
Feedback-ID: i51094778:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Feb 2025 11:56:19 -0500 (EST)
From: Sven Peter <sven@svenpeter.dev>
To: Hector Martin <marcan@marcan.st>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@svenpeter.dev>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neal Gompa <neal@gompa.dev>
Subject: Re: [PATCH v2 0/5] Add Apple SPI controller and spi-nor dt nodes
Date: Tue, 18 Feb 2025 17:56:14 +0100
Message-Id: <173989773063.49326.4641316959057298883.b4-ty@svenpeter.dev>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20241203-asahi-spi-dt-v2-0-cd68bfaf0c84@jannau.net>
References: <20241203-asahi-spi-dt-v2-0-cd68bfaf0c84@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_085625_090702_ACEC7370 
X-CRM114-Status: GOOD (  12.64  )
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


On Tue, 03 Dec 2024 08:57:56 +0100, Janne Grunau wrote:
> This series adds SPI controller and SPI NOR flash device nodes to the
> man Apple silicon SoC dts files. Only the subset of used SPI controllers
> is added. Five SPI controllers exists according to pmgr ADT data but the
> commits only add controllers found in use on any of the devices. The
> parameters for the missing nodes are guessable but there's no point in
> adding them since no further M1 or M2 devices are expected.
> Together with controller nodes the first SPI device is added. All Apple
> silicon devices connect a SPI NOR flash to spi1. This holds Apple's 1st
> stage bootloader, firmwares, platform and machine specific config data
> and a writeable key-value store (nvram). Expose only the nvram as mtd
> partition since it has use beyond exploring the content. Tools from
> asahi-nvram [1] can modify the (default) boot configuration
> (asahi-bless), read Bluetooth sync keys (asahi-btsync) and read and
> write arbitrary keys (asahi-nvram).
> 
> [...]

Applied, thanks!

[1/5] arm64: dts: apple: t8103: Fix spi4 power domain sort order
      commit: 1f7af2931158a5e819ac71bcba91e961ac5ca3ea
[2/5] arm64: dts: apple: t8103: Add spi controller nodes
      commit: 556cd4bbb45bb5a73042c02b7e5c982112a6ed1f
[3/5] arm64: dts: apple: t8112: Add spi controller nodes
      commit: 0a6d561c7e46bf46b886af209e8ebedb6d500680
[4/5] arm64: dts: apple: t600x: Add spi controller nodes
      commit: d08e455a865c99a8050addf4dc001bcfdf1b7b8b
[5/5] arm64: dts: apple: Add SPI NOR nvram partition to all devices
      commit: 3febe9de5ca5267618675650871a626d0901f8cb

Best regards,
-- 
Sven Peter <sven@svenpeter.dev>

