Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF1BD70DE3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 17:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D2JfyjmFw8hYMAoKDuRJj7W6G1enn12a5hgwxx1fj9c=; b=ipOyM6s+UHnZaEkuZk2x0CouEV
	/N/wLKStb7ug320B9Cqt6cP6ujjGeB4S2dPFF+9FsIsOR9fvFVWJkoDH5uK854p/yR5iKZamfyUzx
	UPsaGipoeBvuuIzhSbS2edmpaaCqod79rxs+ASUtSvpM4xfUhpAwVxCYmaXwVxW2wDx04KrI4fArM
	lJ7jImpZmDZReJ6Hf8jN0aiz0TM+Hbqcr4Ey2fTXUlp4DKcW8ZYWzzegJ88gWP46yPvMo4Tx9oJLu
	vSmnjyq9q560AYtGbemUIchqLLBTY17azdZ8n3hY6EZdvAi8blIhVY/tZWB3pVOUYaCDvVxmUa74M
	BxskxnRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGiEA-0000000G4Vd-4Bic;
	Thu, 28 Nov 2024 17:22:55 +0000
Received: from fout-b4-smtp.messagingengine.com ([202.12.124.147])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGiDA-0000000G4PR-2qM8;
	Thu, 28 Nov 2024 17:21:54 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id 0161111400F6;
	Thu, 28 Nov 2024 12:21:50 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Thu, 28 Nov 2024 12:21:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1732814510;
	 x=1732900910; bh=D2JfyjmFw8hYMAoKDuRJj7W6G1enn12a5hgwxx1fj9c=; b=
	Jp52ll3G22wzbfSDV7I46FNUZiHQdr86GldQCqs5UqIpEUxBFmEE/7YDd1+MP2+g
	DMUPsWMGLsRrC9fQFbLc/rlJn/zozKI7zegq+O1JFOpYCz7LHrWQ0LKAeh6Aj4tO
	Jx3ciVBFG4MePp3pP6qMDztvw2znEUiTQ/jifJmmNsciSswIQ1cVu1GTb0ru5Vlt
	Tvb6pZNsr1YVr/h2T0oZU2nT9oxh7dBVQ/MQxr7Of7+7MdYRXYtmk5g9b22uDjRD
	9jxHXWGgL7FbtkFUiS3z6Zu0slR11ZX4fHb0TCeyGUv1/S5HbAKUQnMyIlsY6uqF
	kMQFa1qTi1NzUjpzhuX1/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1732814510; x=
	1732900910; bh=D2JfyjmFw8hYMAoKDuRJj7W6G1enn12a5hgwxx1fj9c=; b=E
	T/uR+w0Xbs4pt0N4XKqdYg+927Ck7HzQJt8icOd0efcIy+9lTQPKjAFwoutY4spp
	ZIMAQaycjwgbpYnAaeixrkhnHVKEsFFolCVFEJJ8d5ZWU4bHSk2Hy5tPnfnjWMwD
	8dh6YLk01gHuq92wkjhVOEZvU07ek9htbOQ/E6YdK/o1GGCUgl1x1ls1BIXatGwJ
	LAc8ZPo5Lu9UzCGafrNq61ABTletA/We+ukKOHCK/lCqNH0VrKQ+F3nWkvm7JDF+
	IAAbpyjR8KB9kzTDh1GSoRz5iGNxuQSsFCENHnftXJDCX1SLRYb5LbhvIE24vCGJ
	f0wkLHzQG7womcTEYbAkw==
X-ME-Sender: <xms:rqZIZwLyhuhF6CKIUD-Wfx2c2y6Rz9SpBQyG46K2ZyLADpr5fjoQEA>
    <xme:rqZIZwLzsFzvyTpdwRHJbPBvjBgtWr58hdgg4_mooghvnLXhzE6-NsmHwb9Ke4fK_
    fxkPyDM1ODsUDw40uo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrhedugdelkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredttden
    ucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdrug
    gvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffg
    vedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeduuddp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepjhgsrhhunhgvthessggrhihlihgsrh
    gvrdgtohhmpdhrtghpthhtohepkhhhihhlmhgrnhessggrhihlihgsrhgvrdgtohhmpdhr
    tghpthhtohepmhhtuhhrqhhuvghtthgvsegsrgihlhhisghrvgdrtghomhdprhgtphhtth
    hopehmrghrthhinhdrsghluhhmvghnshhtihhnghhlsehgohhoghhlvghmrghilhdrtgho
    mhdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    hssghohigusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnvghilhdrrghrmhhsthhr
    ohhngheslhhinhgrrhhordhorhhgpdhrtghpthhtoheplhhinhhugidqrghmlhhoghhitg
    eslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdgr
    rhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-ME-Proxy: <xmx:rqZIZwuc4yptTvpwqKE3Ho5XTlP5fj5MReG5ufvl8Psmg1mUHRhVbw>
    <xmx:rqZIZ9a-ImrpDo4YOtLQNRq4PEhuebl77Q2c63Fy8Lp6CFHZ5DJwKw>
    <xmx:rqZIZ3ZJyyWzl4jzoFKzBd4IZHpNwIN3ABU3I1MJ4vo1DlfAyopxLg>
    <xmx:rqZIZ5DnPEnprSrx7jCZE0SPlxI8YOCSuQWoY45lpCo860CCjaUqMQ>
    <xmx:rqZIZ0QlD0mp5wU8TQVyBLfb7M_X6fL5Yx7rZ3FYPC96wKEXRhPg7oX7>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 46BB02220071; Thu, 28 Nov 2024 12:21:50 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Thu, 28 Nov 2024 18:21:19 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jerome Brunet" <jbrunet@baylibre.com>
Cc: "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Kevin Hilman" <khilman@baylibre.com>,
 "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Mark Brown" <broonie@kernel.org>
Message-Id: <4206bf5d-a11e-4d0d-86b7-50c922e41119@app.fastmail.com>
In-Reply-To: <1jjzcn1hiu.fsf@starbuckisacylon.baylibre.com>
References: <20241127-clk-audio-fix-rst-missing-v1-1-9f9d0ab98fce@baylibre.com>
 <12f29978-c8ce-4bee-a447-dcd086eb936d@app.fastmail.com>
 <1ja5dk2y5l.fsf@starbuckisacylon.baylibre.com>
 <f8de4a2a-776f-4c10-b75e-e845bcc38dde@app.fastmail.com>
 <1j4j3r32ld.fsf@starbuckisacylon.baylibre.com>
 <306b0b30-5a32-4c7c-86b4-57d50e2307e8@app.fastmail.com>
 <1jy1131kxz.fsf@starbuckisacylon.baylibre.com>
 <c06317c6-b2b2-4b6d-96e4-0c2cfc6846de@app.fastmail.com>
 <1jplmf1jqa.fsf@starbuckisacylon.baylibre.com>
 <ce67e512-a15b-4482-8194-b917096f4eeb@app.fastmail.com>
 <1jjzcn1hiu.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [PATCH] clk: amlogic: axg-audio: select RESET_MESON_AUX
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_092153_348898_14666E27 
X-CRM114-Status: GOOD (  19.54  )
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

On Thu, Nov 28, 2024, at 16:53, Jerome Brunet wrote:
> On Thu 28 Nov 2024 at 16:34, "Arnd Bergmann" <arnd@arndb.de> wrote:
>> On Thu, Nov 28, 2024, at 16:06, Jerome Brunet wrote:
>>> We are deviating a bit from the initial regression reported by Mark.
>>> Is Ok with you to proceed with that fix and then continue this discussion
>>> ?
>>
>> I really don't want to see those stray 'select' statements
>> in there, as that leave very little incentive for anyone to
>> fix it properly.
>>
>> It sounds like Stephen gave you bad advice for how it should
>> be structured, so my best suggestion would be to move the
>> the problem (and the reset driver) back into his subsystem
>> and leave only a simple 'select RESET_CONTROLLER'.
>
> Okay, though I don't really understand why that select is okay and not
> the the proposed one. There is apparently a subtility I'm missing I'd
> like to avoid repeating that.

The thing with 'select' is that it really has to be used very
selectively. The 'select RESET_CONTROLLER' is fine as an
exception because there are already tons of clk drivers
that do this consistently so they can register themselves
as a reset controller.

A driver selecting a driver from another subsystem is pretty
much always a mistake. A single one may not cause much harm,
but the problems are frequent enough that we need to have
fewer of them rather than more.

>> From the message you cited, I think Stephen had the right
>> intentions ("so that the clk and reset drivers are decoupled"),
>> but the end result did not actually do what he intended
>> even if you did what he asked for.
>>
>> Stephen, can you please take a look here and see if you
>> have a better idea for either decoupling the two drivers
>> enough to avoid the link time dependency, or to reintegrate
>> the reset controller code into the clk driver and avoid
>> the complexity?
>
> If I may,
>
> * short term fix: revert both your fix and the initial clock
>   change that needed fixing. That will essentially bring back the reset
>   implementation in clock.
>
> * after that: remove the creation part from driver/reset and bring back
>   something similar to what was proposed in the initial RFC for the
>   creation and finally switch the clock driver back to it.
>   That should provide the proper decoupling your are requesting I think.

Works for me as well, though Mark's suggestion would be simpler.

     Arnd

