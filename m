Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B78F9C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 07:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QZlEU/CzuHV3jCOgs94woTuzZFDAACQlWjPWeu//Pr0=; b=5BsXH0Yz7N7eU74xhte7JJ2bVf
	L8nD/vkU1tIny+0IoTXD6BVpgNcuKk0FZpvikIUZfMvoL854jEG6+V3JOB/RzNj9NKTnrNLSI21K+
	a1IHpChiIh64ABTVb9SrLaJOFi7P7541vxyDW8aau0kGJCsvWt6SMsMW223RkNyYY1j4uxSjhOuwe
	DQoapizegHsrgHRL2Z+73tjaV+CRduNIbm96nCUoZF7akfiVC+WyjakrvX8NxgBv8HvNM3gUu8MLR
	au5mrS+wGO7htPfHCkTXbKW6cyRYM3LyeNMyAqqjyqzQ/9NaFpyC2YaSoPkUBWEI4IFTnWd2nWW8r
	V/EvR0SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Peb-00000006Om1-03F5;
	Wed, 09 Apr 2025 07:15:21 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2PXX-00000006NPC-4BDm;
	Wed, 09 Apr 2025 07:08:06 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 584852047C;
	Wed,  9 Apr 2025 07:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744182479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QZlEU/CzuHV3jCOgs94woTuzZFDAACQlWjPWeu//Pr0=;
	b=dSBftMqNWrNrVih04KqB6BFDVmnnEnUtoAvUaPtg9UmBFDHN82iyJRyFUY83U+IrRJ/c2f
	aTpERBb6YufZPFyaW9nl5TmxavHY16QToLY8kqoTjDpfn2OQ4eJFC5ieHFS9OJtbCzCWMH
	xcm9okGOnQp/samWMULZMaW9v6i1NNu5IZKrHW7t0AOg4HUz6UFMFfpE9xGpSwkusYLWEc
	pgut8NQ3gJSOgsvjS+Bw2lSHxUlP0NpRAPVMdZyx19eIMh27Wt+FhWPiN8610oAsxsLR2L
	EbfDqJXTWgsVXtuzTeAWJYgEdqLUCMyinbeuQTBSrG3Lz3qgYrpTBjTck/VQjw==
Date: Wed, 9 Apr 2025 09:07:51 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrew
 Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Vladimir Oltean <olteanv@gmail.com>, Srinivas
 Kandagatla <srinivas.kandagatla@linaro.org>, Heiner Kallweit
 <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, "Chester A.
 Unal" <chester.a.unal@arinc9.com>, Daniel Golle <daniel@makrotopia.org>,
 DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>, Simon
 Horman <horms@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, upstream@airoha.com
Subject: Re: [net-next PATCH v14 07/16] net: mdio: regmap: add support for
 C45 read/write
Message-ID: <20250409090751.6bc42b5b@fedora.home>
In-Reply-To: <20250408095139.51659-8-ansuelsmth@gmail.com>
References: <20250408095139.51659-1-ansuelsmth@gmail.com>
	<20250408095139.51659-8-ansuelsmth@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdehfeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeevledtvdevueehhfevhfelhfekveeftdfgiedufeffieeltddtgfefuefhueeknecukfhppedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjedphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdejpdhrtghpthhtoheprghnshhuvghlshhmthhhsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhgvvgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkr
 hiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughrvgifodhnvghtuggvvheslhhunhhnrdgthhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomh
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_000804_798498_5ADE78DD 
X-CRM114-Status: GOOD (  26.13  )
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

Hi Christian,

On Tue,  8 Apr 2025 11:51:14 +0200
Christian Marangi <ansuelsmth@gmail.com> wrote:

> Add support for C45 read/write for mdio regmap. This can be done
> by enabling the support_encoded_addr bool in mdio regmap config and by
> using the new API devm_mdio_regmap_init to init a regmap.
> 
> To support C45, additional info needs to be appended to the regmap
> address passed to regmap OPs.
> 
> The logic applied to the regmap address value:
> - First the regnum value (20, 16)
> - Second the devnum value (25, 21)
> - A bit to signal if it's C45 (26)
> 
> devm_mdio_regmap_init MUST be used to register a regmap for this to
> correctly handle internally the encode/decode of the address.
> 
> Drivers needs to define a mdio_regmap_init_config where an optional regmap
> name can be defined and MUST define C22 OPs (mdio_read/write).
> To support C45 operation also C45 OPs (mdio_read/write_c45).
> 
> The regmap from devm_mdio_regmap_init will internally decode the encoded
> regmap address and extract the various info (addr, devnum if C45 and
> regnum). It will then call the related OP and pass the extracted values to
> the function.
> 
> Example for a C45 read operation:
> - With an encoded address with C45 bit enabled, it will call the
>   .mdio_read_c45 and addr, devnum and regnum will be passed.
>   .mdio_read_c45 will then return the val and val will be stored in the
>   regmap_read pointer and will return 0. If .mdio_read_c45 returns
>   any error, then the regmap_read will return such error.
> 
> With support_encoded_addr enabled, also C22 will encode the address in
> the regmap address and .mdio_read/write will called accordingly similar
> to C45 operation.

This driver's orginal goal is to address the case where we have a
PHY-like device that has the same register layout and behaviour as a
C22 PHY, but where the registers are not accesses through MDIO (MMIO
for example, as in altera-tse or dwmac-socfpga, or potentially SPI even
though  there's no example upstream).

What is done here is quite different, I guess it could work if we have
MMIO C45 phys that understand the proposed encoding, but I don't really
understand the dance where C45 accesses are wrapped by this mdio-regmap
driver into regmap accesss, but the regmap itself converts it back to
C45 accesses. Is it just so that it fits well with MFD ?

I'm not really against that, it still converts mdio access to regmap so
there's that, but is there a way to elaborate or document somewhere why
we need to do go through C45 -> regmap -> C45 instead of just
writing a mii_bus driver in the first place ?

As I said, I think this could work and even be re-used in other places,
so I'm ok with that, it's just not really clear from the commit log what
problem this solves.

Maxime

