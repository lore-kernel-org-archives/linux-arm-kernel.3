Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 706A1EB4912
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 11:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8WINLAJJI9VoTtHGFrwUftgykkBdJtFx8Ya85T07T6w=; b=vmWBtVDxtNrQiWe5V88aOSQBIB
	khCUXTF1miyw/4yHlpgSyLN81tbqMwKrDQVfLl1RxNUuzF4DVhb/QnQDj00fVcbJg6aLBvprIy0I6
	9XlQUz7HKfkV3KLmhXp6yB8E8S1ZCGJhQHK5+6Q4DsuKDGagOsgVO353bwhdVdPI+PSWHnOn9D6AJ
	RZnA4Z+K9UYQZR7n47ZhTvLX/QOp7kPqKK+jjl9AExFFkvPq5+n/1tSIjUgx0oRvEO7RmGm/hqy90
	f3E0qknzwpdU18CoRuL1aPKtS2GJhYnSCD7MjZen1yoLPkCPYJi/dAL+4R10yVYY/yCN1JeSVt4+i
	p+hYZgBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqV9B-000000021VD-2dXd;
	Thu, 12 Feb 2026 11:46:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqV99-000000021Uc-1YoK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 11:46:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8314760051;
	Thu, 12 Feb 2026 11:46:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCB48C4CEF7;
	Thu, 12 Feb 2026 11:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770896770;
	bh=8WINLAJJI9VoTtHGFrwUftgykkBdJtFx8Ya85T07T6w=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=Sbt2b0SWn0UiyMqYJp9YdsiF7Ouy83n3y6ndv+Vnd2U3444g6uqpnbOqHzx1cTd9D
	 UD3tmzWSrxn4jw8XUI7LAufJXPfLBt+90s3pk2a8xzllSLpOqVxC6eDmXkAvkwjbrJ
	 PrwBj/r+BqJhDL5hY3bjFkUz0blfUlKGakzAmcEdkjp19720QXxqnTMIia1ab2s0sz
	 SlPpknD/PMA4Xj05i9Wl69Bl8epl/6hA5o5m2CX2fnUXdqW5VCZBFYrB3H2ZyzsQln
	 /WGZVqRNqJjveiQFJloF4YAH+Wsu0bTy/3f3Ukv1mGecvAk+ZJz5BUaeHT5+OJRQLJ
	 TQ1cpTy3BmPZA==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id BBA3DF40068;
	Thu, 12 Feb 2026 06:46:08 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Thu, 12 Feb 2026 06:46:08 -0500
X-ME-Sender: <xms:gL2NaYqTyxKpvFb8gXYn2alSRGFN54TN6xyNe9HE4-3erLF6AGMpjQ>
    <xme:gL2NaZehAnL5YtAUlEaDPaqCAalYHuNl2lnvZR2Bvnt3GiWPOf0claxb65xIt0ayB
    6Xux6ixqf1wTdJSCZV8xQ5M6C-Pt40eJ0HlwHtJrtXUeo8ExlzYHW0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvtdehfedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusehkvghrnhgvlhdrohhrgheqnecuggftrfgrth
    htvghrnhepjeejffetteefteekieejudeguedvgfeffeeitdduieekgeegfeekhfduhfel
    hfevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhguodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduvdekhedujedtvdeg
    qddvkeejtddtvdeigedqrghrnhgupeepkhgvrhhnvghlrdhorhhgsegrrhhnuggsrdguvg
    dpnhgspghrtghpthhtohepuddupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehl
    ihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtohepthhonhihsegrth
    homhhiuggvrdgtohhmpdhrtghpthhtohepughmihhtrhihrdhtohhrohhkhhhovhesghhm
    rghilhdrtghomhdprhgtphhtthhopehjmhhkrhiihihsiihtsehgmhgrihhlrdgtohhmpd
    hrtghpthhtoheprggrrhhordhkohhskhhinhgvnhesihhkihdrfhhipdhrtghpthhtohep
    sghrghhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehhrghnshhgsehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdr
    ihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopegsrghrthhoshiirdhgohhlrghsii
    gvfihskhhisehoshhsrdhquhgrlhgtohhmmhdrtghomh
X-ME-Proxy: <xmx:gL2NaVgiRYOB8ylcQ8A4k5wKnMwQtM9UBDPibj90OYPmlhpBF-wk9g>
    <xmx:gL2NaSKBaSUGJCu4ubCUMaXZVgY0zyaWoKn1UeUEC9WQtUnsbbvJGA>
    <xmx:gL2NaUmV4Qj_VciXcXgcuWiWmEeeMPk3CD2ZdXZwqL-cBv8l4l57Zg>
    <xmx:gL2NaaOk4rOB_1MNPHfJP6Vg6iv35exiaGZBJUASrwzuRsa4xkNODw>
    <xmx:gL2Nae6sntTubZlnIrDJoUqad_sdYgIImseR3BS3x3yhDq2ZWbRKc1QR>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A058E700069; Thu, 12 Feb 2026 06:46:08 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Aj2XlnqiSkhV
Date: Thu, 12 Feb 2026 12:45:48 +0100
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>,
 "Aaro Koskinen" <aaro.koskinen@iki.fi>,
 "Janusz Krzysztofik" <jmkrzyszt@gmail.com>,
 "Tony Lindgren" <tony@atomide.com>, "Russell King" <linux@armlinux.org.uk>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Hans de Goede" <hansg@kernel.org>
Cc: Linux-OMAP <linux-omap@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Bartosz Golaszewski" <brgl@kernel.org>
Message-Id: <2fb42d16-887a-4564-8e50-c9d6db564c4e@app.fastmail.com>
In-Reply-To: <20260212112508.73500-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20260212112508.73500-1-bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [RFT PATCH v3] ARM: omap1: enable real software node lookup of GPIOs on
 Nokia 770
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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

On Thu, Feb 12, 2026, at 12:25, Bartosz Golaszewski wrote:
> Currently the board file for Nokia 770 creates dummy software nodes not
> attached in any way to the actual GPIO controller devices and uses the
> fact that GPIOLIB matching swnode's name to the GPIO chip's label during
> software node lookup. This behavior is wrong and we want to remove it.
> To that end, we need to first convert all existing users to creating
> actual fwnode links.
>
> Create real software nodes for GPIO controllers on OMAP16xx and
> reference them from the software nodes in the nokia board file.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>

