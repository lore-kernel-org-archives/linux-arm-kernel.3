Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 182E0CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 17:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PKhOnIqkD7OddmCvXQ+7Bvp5CGMRz9+KcuJBJZlAia0=; b=t5nkzXBHJpkgSJRgH0dTeaNhhy
	xbrTTimN7SSh0m53W5bQDTCAXWeWdAP3p4LNwF166NnCwh9vI+zY03596uZi+lJETqKsbpDBbQep8
	OW1PZTlmjE6oODUiI4733AqEo70cUF83qmeA9m2QZ0C3lgcsgAO3yy0h0P5lJ7Mc/bWv8xAqcQzyn
	aNE8uwRmt+zcUt9GbfX7C4RYBh56Q4TcQFR8srzIawGXQ2MdSY3wi5Ez/3BBzCBiRa4DtEZrzkfA8
	nL8H5Ya0eduwwaVy+xymbHgBtousdXyIwL2ARxbhV0DDJ1ascKrTzW3IeXGw2Lg6O+JofHu3sT436
	C00NJS3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJx52-0000000Dqhj-3MFJ;
	Mon, 04 May 2026 17:27:40 +0000
Received: from fout-a1-smtp.messagingengine.com ([103.168.172.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJx4z-0000000Dqgx-2cw5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 17:27:38 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 46D42EC0307;
	Mon,  4 May 2026 13:27:36 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Mon, 04 May 2026 13:27:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1777915656;
	 x=1778002056; bh=PKhOnIqkD7OddmCvXQ+7Bvp5CGMRz9+KcuJBJZlAia0=; b=
	wG3iz1afyziRW/spIsFmx+E56N4iunySx7s8DU8ZZ/JzUUTKv/tW4+6XftpGF+jY
	tUJ5eSrP7UqpnS412VXfC83r8QYpu4POZ47W7radouKCwG1ZRwWxxHixAasC7/IQ
	4jMh6nqtWDUo1AFecrRyELJs4FvsuYYbRTtFYipq7euRrHsiRHEnYjYhdBtuVDNM
	RYOB0VR16BvEzkJsxUpsgRa8WMR5nGOZUlgTbYAzX8SoB7bCHrYV9temyfpCCleT
	8ijzVQPa4ir70EF2tilpV9sipjGva8GAtJfMP8caGMyFVGBo1nw8i83nwts39S+b
	FshmKoNtp+6fnHkQa65s5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1777915656; x=
	1778002056; bh=PKhOnIqkD7OddmCvXQ+7Bvp5CGMRz9+KcuJBJZlAia0=; b=A
	nyzUp4F6JOgsx/s2h1/jgLFhRpewE1TO6Q6IrJ9nP9cIiRpIMqMJ1PpmjCCPY9+T
	zBdQDHI1QF0L2taGzG4MRuvc9dXwegVJVgohq+Dhuhh+OumAyKRf3BueJHKpUa5Q
	0xaS7DQCyvGZhh+izlU2IPE25SVi1aDsC53Km26sUgqzTlUHnyp6pYyqY7Iz8j22
	YHTOsx4pOEVI8lA2beW80X7vTot05tTJww+BXBwjcny7CrdK78TJL5xIOAxlATpf
	3tOcUAcnHGsJhVCG/DtVxbcFB2L0vMeYeqTTGwB4dgzN7cZxAEcbde7Kw9Zfkuep
	UfnymMQ2MN5aDFwN5zWDA==
X-ME-Sender: <xms:B9f4aQE45qs6GXeQUBmBZ4RCQxyqCtU5SI74QyIv2V9XpXhtZkK1DQ>
    <xme:B9f4aUKS0WFZ6qLZ8HVyMUajYySmrvAVZyXqGhUqkmQKJYnI6AiFmWuTPfSpCLePR
    OqvdzQitYrP8ZkZpXbvs6ONDu5Bvzv9fdAfqBOO5w4dL-Qm0oXX66TR>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdelleeggecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopedujedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepnhhunhhordhsrgesrghnrghlohhgrdgtohhmpdhrtghpthhtoheprg
    guuhhrvghghhgvlhhlohessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtohepughlvggt
    hhhnvghrsegsrgihlhhisghrvgdrtghomhdprhgtphhtthhopehsfhhkihhnghesfhgufi
    gutgdrtghomhdprhgtphhtthhopegrlhgvgigrnhgurhgvrdhtohhrghhuvgesfhhoshhs
    rdhsthdrtghomhdprhgtphhtthhopehmtghoqhhuvghlihhnrdhsthhmfedvsehgmhgrih
    hlrdgtohhmpdhrtghpthhtoheprghnghgvlhhosehkvghrnhgvlhdqshhprggtvgdrohhr
    ghdprhgtphhtthhopegrnhguhieskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhitg
    dvfeeskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:B9f4aXqD8Y6YHMd90HQZp0EfrCIxZBNxnW7F2OZm7HGxXmkRnKOVKQ>
    <xmx:B9f4aaYylXYuqJyKS87d9f5zkrH1zUwBm9uKvSCoh1OalPvu7Vacww>
    <xmx:B9f4aS7Urnh_rpGGHp2v_ZThVAv1j1RaCBYxpBMhXMOqOYNcPtePMQ>
    <xmx:B9f4adRClFUUKW7RDce4XDf0L5E-X5YNAfOQknuYIcuToWZWlnp6Pg>
    <xmx:CNf4aW9G3x_OAzZitTHBOu0WPZA0WgWEgHNMJeleLaAlF1Ah_ZjpushM>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 37100700063; Mon,  4 May 2026 13:27:35 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AMJQmnOn-FE-
Date: Mon, 04 May 2026 19:27:14 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Angelo Dureghello" <angelo@kernel-space.org>,
 "Greg Ungerer" <gerg@linux-m68k.org>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Steven King" <sfking@fdwdc.com>,
 "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>,
 "Jonathan Cameron" <jic23@kernel.org>,
 "David Lechner" <dlechner@baylibre.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 "Andy Shevchenko" <andy@kernel.org>
Cc: "Greg Ungerer" <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
 "Angelo Dureghello" <adureghello@baylibre.com>
Message-Id: <965cb599-37ac-4d69-a8c0-015152037139@app.fastmail.com>
In-Reply-To: <20260504-wip-stmark2-dac-v1-10-874c36a4910d@baylibre.com>
References: <20260504-wip-stmark2-dac-v1-0-874c36a4910d@baylibre.com>
 <20260504-wip-stmark2-dac-v1-10-874c36a4910d@baylibre.com>
Subject: Re: [PATCH 10/10] iio: dac: add mcf54415 DAC
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_102737_791917_A630BF48 
X-CRM114-Status: UNSURE (   7.92  )
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

On Mon, May 4, 2026, at 19:16, Angelo Dureghello wrote:

> +static void mcf54415_dac_exit(void *data)
> +{
> +	struct mcf54415_dac *info = data;
> +	int val;
> +
> +	val = readw(info->regs + MCF54415_DAC_CR);
> +	val |= MCF54415_DAC_CR_PDN;
> +	writew(val, info->regs + MCF54415_DAC_CR);
> +}

We've recently discussed changing the MMIO accessors on coldfire
to behave like all the other ones, which makes readw() and writew()
have an implicit byteswap. An additional driver means one more
place to change during the conversion. Maybe you can use the
new mcf_readw()/mcf_writew() helpers that Greg has started
introducing? Those will keep using native big-endian register
definitions.

       Arnd

