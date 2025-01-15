Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07DACC02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 17:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SLJcNprBNwlNaVjEukVmXIvT0Sm2Ve9ZPO+CpNdmDyo=; b=R6/XixcUvqPZ6Xl86nTk1BbGDz
	mB68e9kUh8ZtiqBEshaaItPshSvRoMNqO/daW4k5fcpMwKpDu9NwRXKBrTG1Lo4O8uAzNgH7WFWlz
	DZoWDu1lEkSZ8xT7p3Y+J/gdcLbnlgCM1rtQzt4Wf4GZnTgjDED/UnMl2wqAjzMPmrxTKAF5uKA8J
	vIE6bGGVkRigCYuKOi/mWkAA+6tI5a+GgAFZr2EwJnz/PoPdwu53Ytd8Doi2Q67zg3uaqv0Qjaq3M
	RZaGuk8gZE7nZKKZJUeHzDIUlCJ1BNGsF5BrKbceGvELZjpYudqo7cJufYh5yYpFkwaxx/YmMOvl4
	Gm02PNbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY6vA-0000000CYbH-2BWY;
	Wed, 15 Jan 2025 17:11:12 +0000
Received: from fout-b2-smtp.messagingengine.com ([202.12.124.145])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY6ts-0000000CYP5-1Zxw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 17:09:53 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id 7D94D1140159;
	Wed, 15 Jan 2025 12:09:51 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Wed, 15 Jan 2025 12:09:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1736960991;
	 x=1737047391; bh=SLJcNprBNwlNaVjEukVmXIvT0Sm2Ve9ZPO+CpNdmDyo=; b=
	mJ7t0nWVhaCFWns1/EkGnJuX2rfCr3yHkwzkCpq9L41uPoVOj2OmJB19/uR6tXtj
	dCnJSAxYoUJTFMawF/hmpCTS80giXXIrHXUUlllVo/CZ4C9BBnsPzrjRVx+kymUI
	HKJaxF7GIXIjKnHEQuxGcJ3g1HFsvg90D56bcxoza1vPGM5eOVOwhYJsxvGD75J6
	wPsrvWZY293EMrDT/29SPVR+hYq7iPW+ey3qvrSZoS0vyieNg4dxsAC8Ej/9IaLb
	ZIASYhLTa1VRxFRESlUe8+w6QhHzSKl8Izs4sC5SRsYuXCI/3TkjrlkMef1/4+L8
	JOyYIpN4iy/xMIvgk2Rn0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1736960991; x=
	1737047391; bh=SLJcNprBNwlNaVjEukVmXIvT0Sm2Ve9ZPO+CpNdmDyo=; b=N
	HHMmC/e9V0GxoGeBz5wIQuilWNZKZ/lSenYHqW9HDfNSAznByXWnG8NFyokIkEwc
	1BdP2lJXbCa20BHkQSGfWxOj4VOP/k924Yn2zfKPf3Nstt6ItSait/Nc3BAtstNs
	xCYEF9GF+FHeG/G9GBaL5Fj3FIPktFVknP8zMOoQKiy9U462LGg+gxvBOC9uwiZB
	yp6pWECUl4OSspFjM1jp38RSMBnbskQynXO/K0I22k/1a2kPehyqArJ2glrzAKJH
	/k+bHqOKTVMsd/+l6rS8pk9qvmotgqyFIDw7JJf9FxmMyFG1JM+UhRP3IRZf+q6+
	2CrfyqcxmetobumCbC0og==
X-ME-Sender: <xms:3uuHZ8ttsdCPSg1kRIVkmTpesvdg9PbfBwLU91xNKHKpM-heu9G9hw>
    <xme:3uuHZ5c9Ss0fSpjmbxFw9J8Hia6ct9fewXdTvxGsDus5WNJeG0wH9GE1bPc217rTx
    r_VQNl4E0zw3Pmwqx0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudehledgjedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdej
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhepvdfhvdekueduveffffetgfdvveefvdelhedvvdeg
    jedvfeehtdeggeevheefleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohephedp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepjhgsrhhunhgvthessggrhihlihgsrh
    gvrdgtohhmpdhrtghpthhtohepshhotgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    lhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorh
    hgpdhrtghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvgdprhgtphht
    thhopehprdiirggsvghlsehpvghnghhuthhrohhnihigrdguvg
X-ME-Proxy: <xmx:3uuHZ3w7hszPsPfglGH0Z2rx4LaSyT1VtiZHEJ7mWoE4ftDycaQVbA>
    <xmx:3uuHZ_MnzFE5bLctc32dYFqCGoMY_btPxiCeWHdOfLRZIWKZUcvTgg>
    <xmx:3uuHZ88YGQpXDoIrvr3_bUtHPwtP82kqwsgMdSZp1makq661bY0L8A>
    <xmx:3uuHZ3UmtLpGX7Y8LDsTu7mPvttNRAsIzGixjSWjhHvflx6tJDN3fQ>
    <xmx:3-uHZwaSKDFSTol1QKgx0iGOmC0YvoFSpND-8Fgj97Oxoa5TqyqoIOTG>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id CA8302220072; Wed, 15 Jan 2025 12:09:50 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Wed, 15 Jan 2025 18:09:29 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Philipp Zabel" <p.zabel@pengutronix.de>, soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>,
 "Jerome Brunet" <jbrunet@baylibre.com>
Message-Id: <c5eb7690-85b8-4f44-b8bb-598badf3b729@app.fastmail.com>
In-Reply-To: <d369dbc38c38a7cb5b2ae2af4aeb8470250c9c77.camel@pengutronix.de>
References: <20250113163648.1757178-1-p.zabel@pengutronix.de>
 <d0e58f29-4e12-445f-b110-49dfbacf5b74@app.fastmail.com>
 <d265b2ad8d04c8e37b6fae2a312d0d1c9a3366a9.camel@pengutronix.de>
 <d369dbc38c38a7cb5b2ae2af4aeb8470250c9c77.camel@pengutronix.de>
Subject: Re: [GIT PULL] Reset controller updates for v6.14
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_090952_470190_C77B8605 
X-CRM114-Status: GOOD (  19.34  )
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

On Wed, Jan 15, 2025, at 18:04, Philipp Zabel wrote:
> On Mi, 2025-01-15 at 17:58 +0100, Philipp Zabel wrote:
>> Hi Arnd,
>>=20
>> On Mi, 2025-01-15 at 17:13 +0100, Arnd Bergmann wrote:
>> > On Mon, Jan 13, 2025, at 17:36, Philipp Zabel wrote:
>> > > Dear arm-soc maintainers,
>> > >=20
>> > > The following changes since commit 78d4f34e2115b517bcbfe7ec0d018b=
bbb6f9b0b8:
>> > >=20
>> > >   Linux 6.13-rc3 (2024-12-15 15:58:23 -0800)
>> > >=20
>> > > are available in the Git repository at:
>> >=20
>> > Hi Philipp,
>> >=20
>> > I have no objections to the contents, but it would be good to
>> > avoid the back-merge of rc3 into my current branch that
>> > is based on -rc2.
>> >=20
>> > I see that the two patches for the reset driver depend on
>> > commit 5ae1a43486fb ("clk: amlogic: axg-audio: revert reset
>> > implementation"), which went into rc3, and this was clearly
>> > the reason for using that as the base.
>> >=20
>> > Would it be possible to rebase your branch directly on that
>> > 5ae1a43486fb commit from upstream?
>>=20
>> I've rebased=C2=A0and sent a PR for a new tag reset-fixes-for-v6.13-2.
>
> Sorry, it's late. Same for reset-for-v6.14-2 instead.

Ok, pulled this one now. The fixes branch was already based on
-rc7 and did not need a rebase, so I kept the previous one there.

     Arnd

