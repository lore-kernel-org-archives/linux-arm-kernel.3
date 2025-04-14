Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A9BC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 22:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mKkSHxlGKWwLAVWzC2ngK+QD6aN8k+ksqhaW6x0BrfQ=; b=bmqJHff2ht1dmtOSxIBpzFzW3F
	K9wb7RK9hKqTwuErM5zSx3F1r0x82D+4Me8T74IPrWjcYXzlL7mkUuQEhrbhA8VOEUjhnhohqHZ3+
	HVolxTV+kx9F4DHK/+qXuuYp3G7pWQKlPznZIdszRYJ6xITXVn2f+m7cr/nVY2CYSHcacWeDDsCua
	1GaZod8QFCA0r89lxJA8nU0DiZp32eLw0xEEt2DZU5+jE5+mqX4pBzNaJsvb1CVF1ShcZnfCOWqPv
	7lwWFeGSCNKUtGZotZ8iDaEBmAtdJtfDacrSkYdu3LhUPRQcmG1F29H31+BfBjW3U9qOkbW+7naCq
	g2UlGuZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Rzj-00000003goU-10xq;
	Mon, 14 Apr 2025 22:09:35 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Rol-00000003eSB-0GAK;
	Mon, 14 Apr 2025 21:58:17 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9E1AF41CFD;
	Mon, 14 Apr 2025 21:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744667888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mKkSHxlGKWwLAVWzC2ngK+QD6aN8k+ksqhaW6x0BrfQ=;
	b=A9surNlwNl1Sh8hothZthwuoJ54i2YTw7bQLtr8+Bn2tspofyF/qkhK7uqKMIdV58CI4YW
	L3CJt5cceI3qZa6lPgOGcIJgqLBaTKTz/wMVv8n2ajk5j3knnabov2GzGWKZ3mJ1OHs6Df
	XIMZocbJFiJu+GW/cy6AFBEc0nmpxTcN+rT9Z4tHDaw1sAttHD29ZYzyGtU+iK9qCMFqAG
	95ohkEw3+zhdwt2Eiu41rsBqlGhvc5tgSHOMDTlXcXF3uFKGXV7O0m0T5iyQQ6BZHcprwP
	jNdRXL+pab7xYClw6jJU1NJx5kblCxghvSzsL9aEkXYWfEGjf1Z4Qpz8b6KnLA==
Date: Mon, 14 Apr 2025 23:58:07 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Alexandre Mergnat <amergnat@baylibre.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Eddie Huang <eddie.huang@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 4/5] rtc: mt6397: Remove start time parameters
Message-ID: <20250414215807b1b6b008@mail.local>
References: <20250109-enable-rtc-v3-0-f003e8144419@baylibre.com>
 <20250109-enable-rtc-v3-4-f003e8144419@baylibre.com>
 <20250411133609a1295543@mail.local>
 <202504111339359e840246@mail.local>
 <968001f7-96d1-4ad5-8c36-28cac5dc30f1@collabora.com>
 <97cfeafe-7044-4f06-b2e6-e4a158419473@baylibre.com>
 <vpf4apahhpovhrqje4i647nldszen2pglbm5fdmar7bsyg7uao@3ymuod45ftlj>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <vpf4apahhpovhrqje4i647nldszen2pglbm5fdmar7bsyg7uao@3ymuod45ftlj>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdduieelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevudevhfdvheelgfeileefteduuefghefguefgkeeljeeufeeutedtffeuteeivdenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedugedprhgtphhtthhopehurdhklhgvihhnvgdqkhhovghnihhgsegsrgihlhhisghrvgdrtghomhdprhgtphhtthhopegrmhgvrhhgnhgrthessggrhihlihgsrhgvrdgtohhmpdhrtghpthhto
 heprghnghgvlhhoghhiohgrtggthhhinhhordguvghlrhgvghhnohestgholhhlrggsohhrrgdrtghomhdprhgtphhtthhopegvugguihgvrdhhuhgrnhhgsehmvgguihgrthgvkhdrtghomhdprhgtphhtthhopehsvggrnhdrfigrnhhgsehmvgguihgrthgvkhdrtghomhdprhgtphhtthhopehmrghtthhhihgrshdrsghgghesghhmrghilhdrtghomhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_145815_578963_F6F2C010 
X-CRM114-Status: GOOD (  31.64  )
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

On 14/04/2025 23:34:48+0200, Uwe Kleine-König wrote:
> > > Yes, you're stuck with this. Devicetree has to be retrocompatible.
> > > 
> > > Besides, this start_secs is what gets used by default, and the start-year
> > > devicetree property should take precedence and effectively override the
> > > start_secs default.
> > > 
> > > Just keep it there.... :-)
> 
> It would work to keep setting start_secs but allow overwriting that
> value in the device tree. But see below.
>  

This is already the case.

> > When you boot your board for the first time, is the date January 2nd 1968 ?
> > If not, that mean it is used as a finetune offset year.
> > IMHO, mktime64(1968, 1, 2, 0, 0, 0) is a workaround for the rtc framework
> > issue we try to solve in this serie because start_secs is negative (1968 <
> > 1970). Now framework handle the negative value properly, even if you keep
> > mktime64(1968, 1, 2, 0, 0, 0) , the device time will change. I prefer to
> > notify you.  :)
> 
> I don't understand everything you wrote here, but as far as I see it,
> rtc_time64_to_tm() not being able to handle dates before 1970 is the
> main issue here. This is of course only relevant, because your hardware
> occasionally contains such a date. The technically right fix is to
> extend rtc_time64_to_tm() to work for dates >= 1900-01-01. (An
> alternative would be to assume that a hardware read returning a date
> before 1970 is invalid. If you refuse to write dates before 1970 that
> should give a consistent behaviour. But the original approach is the
> nicer one.)
> 

Yes, the assumption is that dates before 1970 are definitively invalid.
I still believe we live in a world were the time doesn't go back ;)

Android *was* the only OS requiring to be able to set 01/01/1970. This
changed after they realized that some hardware is not able to do that.

> > TBH, it's hard to follow the logic, so I've a question:
> > If I push in my V4 a framework fix that drivers using year < 1970 will need
> > to have a new start_secs or start-year value to stay aligned with there
> > previous value, do you will accept it ?
> 
> Doesn't the need to shift the start year simply goes away once
> rtc_time64_to_tm() is fixed for negative time values?
> 
> So I would expect that going forward with just patches #1 and #2 should
> result in a fixed driver regarding the breakage you're seeing. (I'm
> unsure about patch #3, I'll address that in a reply to the respective
> mail.)
> 

This is also what I think but I don't think I'm going to allow the
rtc_valid_tm() change. It shouldn't matter as the check should always
happen after offsetting/windowing.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

