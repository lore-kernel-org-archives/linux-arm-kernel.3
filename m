Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F1D5C369BD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 10:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xWX56MLkHZw/GZNOTxJ7M6xTx+/WmLb4gwBvJUYftZo=; b=I9GGOn3+KotGPLGBSXduRVQsxK
	iVRPkHf1jNLNJ/RlZXXYhppZWJ4XyMgbChcpwebfD0ytcPllVHALyXDVyNvJCAm1HUJPcq29fs+ts
	AXSM5A0Ysw2BeeMtNsDS6he5UZmRw319jS0NHtDWUBydf1eJyrkwtSBQBHh91iukHWdwEtsSOERPn
	opVGVAOSW83Vrwcv2+vuZOfmnyMHzaqjYnesCXGDmOYcbdxMEGw6N96GEtlrTrvOIqJTDYPprA/yD
	tpmTPdIkRZO4tWRoEHwR9YzSqaPAJ2XDUkEJWAIuyLVyE5OvfU36AKesZtC0xUEJfx1a2/Q0WILiG
	PyWRAZNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u503K-000000099fK-02iH;
	Wed, 16 Apr 2025 10:31:34 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4yga-00000008uTt-1hae
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 09:04:02 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 87F754327A;
	Wed, 16 Apr 2025 09:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744794235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xWX56MLkHZw/GZNOTxJ7M6xTx+/WmLb4gwBvJUYftZo=;
	b=Ae6wIsrj0/PLU4ol8EMC2g4AnIqshb3tRqVygY3H+leCF7pJwG/0XjRA8JvcGzoWhYdlBo
	kQpK7h+ZQVtnTQulWBk2+leKK9kCbYQQQmP7KBNwONPicRAqnIWKLXtbSHaeSbQVKo5aqd
	s6C0krPwfmcWlN/KDakkOItbDInATBSW5v1oQl3Ovc26dpJDL7Dq3O9bf2PPEnZohFHjFf
	jHaQ3W/qZKjmhwRVtwG6N5B8/dFUywB+ZV1Krtk+qWMSo0D2cRHqBvcd5U8606wu/i2YGB
	y0/dPy8cSarGEiXif9YexL7Z7wB8H1bqRqi/25m69TMPLou0A9DbD8tphNNZ0Q==
Date: Wed, 16 Apr 2025 11:03:51 +0200
From: Kory Maincent <kory.maincent@bootlin.com>
To: Kees Cook <kees@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Claudiu Manoil
 <claudiu.manoil@nxp.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, Wei
 Fang <wei.fang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>, Jeroen de
 Borst <jeroendb@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>,
 Ido Schimmel <idosch@nvidia.com>, Petr Machata <petrm@nvidia.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Simon Horman <horms@kernel.org>, Geoff
 Levand <geoff@infradead.org>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Alexander Lobakin
 <aleksander.lobakin@intel.com>, Praveen Kaligineedi
 <pkaligineedi@google.com>, Willem de Bruijn <willemb@google.com>, Joshua
 Washington <joshwash@google.com>, Furong Xu <0x1207@gmail.com>, "Russell
 King (Oracle)" <rmk+kernel@armlinux.org.uk>, Jisheng Zhang
 <jszhang@kernel.org>, Petr Tesarik <petr@tesarici.cz>,
 netdev@vger.kernel.org, imx@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Richard Cochran
 <richardcochran@gmail.com>, Jacob Keller <jacob.e.keller@intel.com>,
 Shannon Nelson <shannon.nelson@amd.com>, Ziwei Xiao <ziweixiao@google.com>,
 Shailend Chand <shailend@google.com>, Choong Yong Liang
 <yong.liang.choong@linux.intel.com>, Andrew Halaney <ahalaney@redhat.com>,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] net: ethtool: Adjust exactly ETH_GSTRING_LEN-long stats
 to use memcpy
Message-ID: <20250416110351.1dbb7173@kmaincent-XPS-13-7390>
In-Reply-To: <20250416010210.work.904-kees@kernel.org>
References: <20250416010210.work.904-kees@kernel.org>
Organization: bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdehleeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefmohhrhicuofgrihhntggvnhhtuceokhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgfdutdefvedtudegvefgvedtgfdvhfdtueeltefffefffffhgfetkedvfeduieeinecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehkmhgrihhntggvnhhtqdgirffuqddufedqjeefledtpdhmrghilhhfrhhomhepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedupdhrtghpthhtohepkhgvvghssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughrvgifodhnvghtuggvvheslhhunhhnrdgthhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepvgguuhhmrgiiv
 ghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtoheptghlrghuughiuhdrmhgrnhhoihhlsehngihprdgtohhmpdhrtghpthhtohepvhhlrgguihhmihhrrdholhhtvggrnhesnhigphdrtghomh
X-GND-Sasl: kory.maincent@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_020400_896937_1254E8B3 
X-CRM114-Status: GOOD (  15.86  )
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

On Tue, 15 Apr 2025 18:02:15 -0700
Kees Cook <kees@kernel.org> wrote:

> Many drivers populate the stats buffer using C-String based APIs (e.g.
> ethtool_sprintf() and ethtool_puts()), usually when building up the
> list of stats individually (i.e. with a for() loop). This, however,
> requires that the source strings be populated in such a way as to have
> a terminating NUL byte in the source.
>=20
> Other drivers populate the stats buffer directly using one big memcpy()
> of an entire array of strings. No NUL termination is needed here, as the
> bytes are being directly passed through. Yet others will build up the
> stats buffer individually, but also use memcpy(). This, too, does not
> need NUL termination of the source strings.
>=20
> However, there are cases where the strings that populate the
> source stats strings are exactly ETH_GSTRING_LEN long, and GCC
> 15's -Wunterminated-string-initialization option complains that the
> trailing NUL byte has been truncated. This situation is fine only if the
> driver is using the memcpy() approach. If the C-String APIs are used,
> the destination string name will have its final byte truncated by the
> required trailing NUL byte applied by the C-string API.
>=20
> For drivers that are already using memcpy() but have initializers that
> truncate the NUL terminator, mark their source strings as __nonstring to
> silence the GCC warnings.

Shouldn't we move on to ethtool_cpy in these drivers too to unify the code?

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

