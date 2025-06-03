Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFE06C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 08:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rvE4v/teYoqJosrINMVYN/Bfwi93R1//+VcwLW4T2aA=; b=wQhC4NF9kGwWR29mRvW9L98siI
	MVTkjs6CLYETWGSOgrQJpXiX6pttNVJef82W5uvWWfChmtB1TVWpdOW4MzrDyYgW40WLdoJ2sjIvY
	4DsaWiTgDlCSi1VG9MJcnwO4l05YPvL5beaHGn8sAVzF2XQSO38OdxfT/cxoTJIaiUgUlLR7V4gwm
	wbsq+18frAtrExZYz9DJTLYnT/iuOnmhQu3zZnX7arzcD3ZUamo5ZZUSqc4I5R9it0v0ZAFsj/cSW
	QO2ZpAwP+z3WJ4/ylZJuqsEiGZF4wTsYsJhhTr3qiMH4DRSBEBtIL/0y/Q9etOHbL4zJ62W0U1L7z
	B/RSCvAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMMzf-0000000AKbi-2fyN;
	Tue, 03 Jun 2025 08:27:35 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMMxK-0000000AK5u-2cLd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 08:25:12 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 61365433B3;
	Tue,  3 Jun 2025 08:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748939105;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rvE4v/teYoqJosrINMVYN/Bfwi93R1//+VcwLW4T2aA=;
	b=luMmEvSELhi+UGbOmANXiklV4WPpfGbOrZbRWqzWnZv+ryVBfow1+xQYqC6QJdzuIfoXBs
	WhezUoubrT4Lo4HBiIPjCeGNoqduE1CPbf754Q5wTOUHlA79IXwUse72QP+ZPPDTiMnhrn
	pU7fgs19FqlmZHR9r+SbCjvV19CsRHUI7uGv8lR29U4Or5MviFIwoa1vyazotv8tHXctek
	lDt++/HXaGT5QZb44G+6XnnE8nlTErnVt+O1hJ4YeTJoSXsOufjeL+PgXICht4F306sgvu
	0ZSIwvWWkYqCDbea2TeGwBhCtrtS1eVS6phEZdBh2TAL5HtvNZnuZLxE3RnNYA==
Date: Tue, 3 Jun 2025 10:25:00 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Jijie Shao <shaojijie@huawei.com>
Cc: <davem@davemloft.net>, Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski
 <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>, Heiner Kallweit
 <hkallweit1@gmail.com>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <thomas.petazzoni@bootlin.com>,
 <linux-arm-kernel@lists.infradead.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <vladimir.oltean@nxp.com>, =?UTF-8?B?S8O2cnk=?= Maincent
 <kory.maincent@bootlin.com>, Oleksij Rempel <o.rempel@pengutronix.de>,
 Simon Horman <horms@kernel.org>, Romain Gantois
 <romain.gantois@bootlin.com>, "shenjian15@huawei.com"
 <shenjian15@huawei.com>
Subject: Re: [PATCH net-next v5 07/13] net: phy: phy_caps: Allow looking-up
 link caps based on speed and duplex
Message-ID: <20250603102500.4ec743cf@fedora>
In-Reply-To: <5bbf1201-e803-40ea-a081-c25919f5e89d@huawei.com>
References: <20250307173611.129125-1-maxime.chevallier@bootlin.com>
	<20250307173611.129125-8-maxime.chevallier@bootlin.com>
	<5bbf1201-e803-40ea-a081-c25919f5e89d@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdegtddtheculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthhqredtredtjeenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeuhfefgffgtdfhgffhvdfhhffhteeutdektefghfetveehheejjefgudeiudehudenucfkphepvdduvddruddthedrudehtddrvdehvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvuddvrddutdehrdduhedtrddvhedvpdhhvghlohepfhgvughorhgrpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddupdhrtghpthhtohepshhhrghojhhijhhivgeshhhurgifvghirdgtohhmpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrt
 ghomhdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopehhkhgrlhhlfigvihhtudesghhmrghilhdrtghomh
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_012510_964869_D5241833 
X-CRM114-Status: GOOD (  12.41  )
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

Hello again,

On Thu, 29 May 2025 17:36:11 +0800
Jijie Shao <shaojijie@huawei.com> wrote:

>
>=20
> Hi Maxime,  fc81e257d19f ("net: phy: phy_caps: Allow looking-up link caps=
 based on speed and duplex") might have different behavior than the modific=
ation.
> My case is set 10M Half with disable autoneg both sides and I expect it is
> link in 10M Half. But now, it is link in 10M Full=EF=BC=8Cwhich is not wh=
at I
> expect.
>=20
> I used followed command and trace how phy worked.
> 	ethtool -s eth1 autoneg off speed 10 duplex half
> The log is showed as followed:
> ethtool-13127	[067]	6164.771853: phy_ethtool_ksettings set: (phy_ethtool =
ksettings set+0x0/0x200) duplex=3D0 speed=3D10
> kworker/u322:2-11096	[070]	6164.771853:	_phy_start_aneq: ( _phy_start_ane=
g+0x0/0xb8) duplex=3D0 speed=3D10
> kworker/u322:2-11096	[070]	6164.771854:	phy_caps_lookup: (phy_caps_lookup=
+0x0/0xf0) duplex=3D0 speed=3D10
> kworker/u322:2-11096	[070]	6164.771855:	phy_config_aneg: (phy_config_aneg=
+0x0/0x70) duplex=3D1 speed=3D10
> kworker/u322:2-11096	[070]	6164.771856:	genphy_config_aneg:	(__genphy_con=
fig_aneg+0X0/0X270) duplex=3D1 speed=3D10

I managed to get a bit of time to look into this, and indeed I was able
to reproduce the issue locally.

I'll send a patch ASAP, based on the the prototype patch I gave in the
previous reply.

Thanks for reporting,

Maxime

