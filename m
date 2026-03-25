Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D64D3FEC11B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 10:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AcUhwk3rqiMKPq50OnIJ7QU2UyvK/5IjslJpVaZ0nD0=; b=PoDrIljIdpDlbTeAHyxod/6ss0
	kSBtJyvhbmceSSNEx6b2CHP9NgfxoyCqVPucEaTg1YZAnueDtXBLx26roYAlZm+3+glGRkS67UN5l
	kMH7J8GdTPA0Y/4Bn6Txi7LtPDUMX2G7+YFz9A11v73VyvWc+q1zcSCvQmWQfS38Jx5KaCBwEaMOq
	+FGRE7+Fc3SiadJHgjY/k//R/wY9F4jR1ArCau5I1HvQBR4941RowoJhtd3u1SNQOjJ2zspOOE0zf
	OXw5MZcsdysffomekvroYmtIvFGhXFKGPAqV+TZdxABqlNMTUYqb6oLvNp8X6dj5AkSNAM0zWu4sG
	SHBACEqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Lg1-00000003AgS-3UZ9;
	Wed, 25 Mar 2026 10:41:29 +0000
Received: from fout-a7-smtp.messagingengine.com ([103.168.172.150])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Lfz-00000003Ag1-0GO2;
	Wed, 25 Mar 2026 10:41:28 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 1C8E3EC008B;
	Wed, 25 Mar 2026 06:41:26 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Wed, 25 Mar 2026 06:41:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1774435286;
	 x=1774521686; bh=AcUhwk3rqiMKPq50OnIJ7QU2UyvK/5IjslJpVaZ0nD0=; b=
	hIoYTVwGI4bcbO/0Hx0OtkRaT8drsHoKSzEN8QOGDKPfFe8F2vVTCbe5xuRjFgP/
	JMVbH3ojmaK//XjifU5t8mCLi9VjCbqASladM+m8eTUtHUjlKlf2gSeYUNE0ru6y
	Jdk1UBGPN1/SZQepX9KIUnxkt52gpAwRmsyB6t+uVfOn7BIilQ4rYIBnhZltzMud
	NDrKql+R9pTAY8ZrWgzKl3HVN1fwl3sqrsX8881k52GoESgrzsSp7nGWl9R5nBTc
	6EeuOrkPQtBPtZ1zik6NRVUS3hiUVZYrykLIlSoGZ1VsEpnoUgrNBuImRPgrmU6W
	68rCn917tNpr+q1GMNsvZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774435286; x=
	1774521686; bh=AcUhwk3rqiMKPq50OnIJ7QU2UyvK/5IjslJpVaZ0nD0=; b=k
	9JBfeyUy8ot9s/AZfT7qTXN5rh9CO/6AjTyssorp2ri8SNdME0RCx/qoy71B3Aly
	6a7A8egyk3uuNS9O84iDGZdbcGLK8BUeou16lkOyrDdJ9rd5t/mWCduol51WgDkW
	b2VfzPLKnw875J4AbhTbQPpgAUYVHb0TQxnpHcIK+dZPuORvUeKojHE/bsJsg0ap
	7M0PsVcFWDmBp22G09z7ZdNmVvG9bSBuVZR5V21jMTrdxLzkA7g9LEoqyBW0ZuZc
	Gn88KmTbE+tOwlGY8qbHBcOtoNFEwQGaF+ruP/y7Tx93Rjgk4yg8m0QZMd2l8/Ug
	SuSzAOQDHuY97MdzHvL7Q==
X-ME-Sender: <xms:1bvDaQYe3JeM4UhvQ0OEwfI2WcDl8Cb9je97ZH7zCZ9vo-lurQsdpg>
    <xme:1bvDaWMAySiHuSbfamQuNRq-GDG4nnBo4NdedVngBgswu_7aMHJTjU_wAtW3SuZcC
    IovSnk9E_kYrjC6uVcJHroTxRH2belNxltTHtOaz7c71Pn9DbyySVE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefvdegvdehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepuddvpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegrnhhgvghlohhgihhorggttghhihhnohdruggvlhhrvghgnhhose
    gtohhllhgrsghorhgrrdgtohhmpdhrtghpthhtohepmhgrthhthhhirghsrdgsghhgsehg
    mhgrihhlrdgtohhmpdhrtghpthhtoheprghrnhgusehkvghrnhgvlhdrohhrghdprhgtph
    htthhopegsrhhglheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepughlrghnsehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehlihhnuhhsfieskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggv
    rggurdhorhhgpdhrtghpthhtoheplhhinhhugidqmhgvughirghtvghksehlihhsthhsrd
    hinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhi
    shhtshdrihhnfhhrrgguvggrugdrohhrgh
X-ME-Proxy: <xmx:1bvDaSIidv0VH9EqpFf7lWU1nrpoHrkHXYrXOzJdVXpZFb5gLuDrnQ>
    <xmx:1bvDad0HFZ81O1XtnWeWv6r8TXTtnnJOzlDE4Z__qYZagt-_I-HKeg>
    <xmx:1bvDabU0OE4KgWfODjpt6QQ1J95WS496bcfA2IdkFOtSBvhmn963qw>
    <xmx:1bvDaYxWpYq_wG9aRdGmys5MZZo3ErIccxXv68CwfEcbRYrTfWWkNg>
    <xmx:1rvDaZgl7b-ZsH3SppgAoMe344kDy9kVd7DXZZcbGKYahqqXS0YhL3Z1>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id CD83E700065; Wed, 25 Mar 2026 06:41:25 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AK0r1PqEPgIR
Date: Wed, 25 Mar 2026 11:41:04 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Bartosz Golaszewski" <brgl@kernel.org>, "Arnd Bergmann" <arnd@kernel.org>
Cc: "Yixun Lan" <dlan@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, "Linus Walleij" <linusw@kernel.org>
Message-Id: <1789ce66-5a18-4b54-bbad-3b2049f2c26d@app.fastmail.com>
In-Reply-To: <CAMRc=Mdwu85gghDjQEu4eP2HZxHjBFpph07q9SOfAifSDMtpVw@mail.gmail.com>
References: <20260325100144.1696731-1-arnd@kernel.org>
 <CAMRc=Mdwu85gghDjQEu4eP2HZxHjBFpph07q9SOfAifSDMtpVw@mail.gmail.com>
Subject: Re: [PATCH] gpio: fix up CONFIG_OF dependencies
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_034127_175077_2AA9D750 
X-CRM114-Status: GOOD (  15.73  )
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

On Wed, Mar 25, 2026, at 11:32, Bartosz Golaszewski wrote:
> On Wed, 25 Mar 2026 11:01:14 +0100, Arnd Bergmann <arnd@kernel.org> said:
>>
>> WARNING: unmet direct dependencies detected for GPIO_SYSCON
>>   Depends on [n]: GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF [=n]
>>   Selected by [y]:
>>   - GPIO_SAMA5D2_PIOBU [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && (ARCH_AT91 || COMPILE_TEST [=y])
>>
>
> Thanks and sorry for the breakage. However, I'm wondering if it wouldn't make
> sense to do the following:
>
>
> -#if defined(CONFIG_OF_GPIO)
>  	/*
>  	 * If CONFIG_OF_GPIO is enabled, then all GPIO controllers described in
>  	 * the device tree automatically may have an OF translation
...
> Symbols from linux/of.h are stubbed out and these drivers can build just fine
> with !CONFIG_OF. This would naturally increase the build coverage.

I don't think we need to worry about the build coverage here, CONFIG_OF
is still included in x86 allmodconfig and half the randconfig builds,
so the drivers get enough exposure either way.

On the other hand, dropping the build time check may help avoid
future Kconfig dependency issues, so that still sounds like a
reasonable suggestion. At least CONFIG_GPIO_SAMA5D2_PIOBU
is going to need the 'depends on OF' regardless though to work
around the other build error I cited above.

     Arnd

