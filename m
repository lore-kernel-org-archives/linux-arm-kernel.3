Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E0FCE77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 17:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iDfa2Muw1eLzXoysgvWlMJjmoDqf3WCXyr0RROwBOkU=; b=uo/0lR0LDEn05XeUnh4jdNYwx5
	UieRaHxkcwQbtgsMP1CTuNrV6CLuHx42XlW2N9ZSNn9QhiNdpYVBSJl0hThhEjjkC6iZP5czjJ4Jw
	1/k/XUDmhSQ1mGmgJu3I5sOTU75TMTlLIN3Wzfpaq8TLzulhb3i/tA7TdamHcwoTE6or4Eg9MOMpG
	BKqVicaHDi2J81WkVd96bDFbttyaO6oeLx11yGWw2TEioHGia1Eq1lg6AP7ApJeYn6exMo0IDgoFW
	xNt5pIKKCO/ZOqLgzi+uw/VB9j3BknkegkO/E30gIjy/JUHQ6wF9f69YcYABX7hcJ4FmcvZcFig3x
	J8lTPsYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOKfT-00000002cyZ-25bf;
	Thu, 19 Dec 2024 17:50:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOKRa-00000002aFC-2Zwh
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 19 Dec 2024 17:36:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=iDfa2Muw1eLzXoysgvWlMJjmoDqf3WCXyr0RROwBOkU=; b=ElOvnr+IyUHwIrk1MrwCciDdLI
	LiRR42U9WbQqk5SR42MaG9whGUS5kzLTTd4F+A23SnEy/nY+8xn26N3HLSGOV5qc2aMo4nGy84+X0
	MmAboHnd5s1O9lJYU/veq3ViFrQ1VwcU/VIGR7JmKPs3Apn0TeCsOkQtq6dJqd0AY/Y5uucO2hrec
	xYJp5PEid/u+RRwOgxZuAIm3OcjHuTxGotpE0Rhhi07D4VlYsy8lI4v/1ZFpJvTOOYYbAM9ZLj7/l
	bADbNTBKGqPY73CdXffbVmBjqAx723R2XgG1s17/FnP1q5JIg3d2p0UuHR1X99bU2B29icTSz2cdK
	96emMTRg==;
Received: from fhigh-a3-smtp.messagingengine.com ([103.168.172.154])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOKRW-00000005Tvx-49jv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 17:36:13 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id D4E531140166;
	Thu, 19 Dec 2024 12:36:03 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Thu, 19 Dec 2024 12:36:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1734629763;
	 x=1734716163; bh=iDfa2Muw1eLzXoysgvWlMJjmoDqf3WCXyr0RROwBOkU=; b=
	YPzuIoaDiSpZYJkh2n3/LpZwJ3Qyv0dhBC5pzmq7f9kkSVaSBm6TmJ9h3sM8zJsJ
	fg5D/BZXAdnkPuewHFtcStcYOfdZ4XjrBHHN2HoVoqWjaX8PE6f2fmPZ1Mrnd2mc
	KFLHFCcz92WI1Iep3YkosX9ORHRxoJ6uln0w4r66GltrAQ1yZWoVKcqRiV79uPCk
	YfMH7PWtsNs+QRExzJxowaP1NxPV1l9E+UCnse90m+xL2c6HUV1IRrkcf8HbLvB+
	UKRrkU6cyFP+5xM6pWGIUBTw5uRjBRd5IA6gH88jm4/n7kE+3EnBrulLZXHu85UP
	sIWJvVgcKytOFZcBHhji/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1734629763; x=
	1734716163; bh=iDfa2Muw1eLzXoysgvWlMJjmoDqf3WCXyr0RROwBOkU=; b=U
	zdnWXAWCe6KM5NqiN4EpRODxTop7JWW3cP7JNEOqZPjMXUHc8ftDE67KPbOBKEtQ
	ahe3VIlj8uEcb0+hTxIpb8iDZbEOwaZJyWdWF2WVqBjuWaAnzAPVh7iUjjKO3kon
	Oe3oI6PrRUSxya4XWVRrZl0unUxavngzI0irIzGROkVNqw/3agIGWjoNrPHLxhTP
	9U3y5p0aICsvS1ZadpiJ2Fq1SxIUaHVX5Ke6yuzwCix8aCH4tVDPgGFPNVLpEYkS
	pmgCnXxcnMUjYSJ87dXWXdYlUZ4o0jhb4LYACodrFurC1doKDEg0DTYVL9JN8tXp
	UOQenmJ13hvM5ESB0cCOQ==
X-ME-Sender: <xms:gllkZ8IzIr1GOq4dhOtiaswaPEXPhFpWD-vvetnXUz4BRX2rAA0iWw>
    <xme:gllkZ8Jx3nwyOqsNEVOD2wzzD3rqhcUKiTALk3kcXaYOEOsfaXbjs_on3fEw0DYZC
    xcJPXGNLOso6me-fV0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddttddguddtudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteef
    gffgvedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopedu
    uddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuh
    igrdhorhhgrdhukhdprhgtphhtthhopegrlhgvgigrnhgurhgvrdhtohhrghhuvgesfhho
    shhsrdhsthdrtghomhdprhgtphhtthhopehprghtrhhitggvrdgthhhothgrrhgusehfoh
    hsshdrshhtrdgtohhmpdhrtghpthhtohepmhgtohhquhgvlhhinhdrshhtmhefvdesghhm
    rghilhdrtghomhdprhgtphhtthhopehsohgtsehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdr
    ohhrghdprhgtphhtthhopeholhhofheslhhigihomhdrnhgvthdprhgtphhtthhopeihoh
    grnhhnrdgtohhnghgrlhesshhmihhlvgdrfhhrpdhrtghpthhtoheplhhinhhugidqshht
    mhefvdesshhtqdhmugdqmhgrihhlmhgrnhdrshhtohhrmhhrvghplhihrdgtohhm
X-ME-Proxy: <xmx:gllkZ8sTIxduK_5QK7eI7Le7J6ZDjBwwhAs4BRLwzcrpkJPKyg8tDw>
    <xmx:gllkZ5Y7v-tnLgpqrZOgqQ7SoaDvmU3gJemn-Q84cNZH_2vY7fIygg>
    <xmx:gllkZzbngG4eIUW0vd2_45NgebXn6yCAj7DBYsAmDmiKqOjTtA0BLQ>
    <xmx:gllkZ1CSS1cFIGlPd3o-y0gd0nJv29lVI9rF5SE0iNUgOS-MOPGzUw>
    <xmx:g1lkZwSzZ6XoDoQAShssJy-o93Id7cf2Fwx2clVd0HC9EkjKlv7ZgkJM>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A5A862220072; Thu, 19 Dec 2024 12:36:02 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Thu, 19 Dec 2024 18:35:42 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Patrice Chotard" <patrice.chotard@foss.st.com>,
 "Olof Johansson" <olof@lixom.net>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>,
 "Russell King" <linux@armlinux.org.uk>,
 "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
 "Petr Mladek" <pmladek@suse.com>, "Yoann Congal" <yoann.congal@smile.fr>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, soc@kernel.org
Message-Id: <7c6dc57c-f33b-4a4b-9423-01ee2933f759@app.fastmail.com>
In-Reply-To: <20241219172934.3010875-1-patrice.chotard@foss.st.com>
References: <20241219172934.3010875-1-patrice.chotard@foss.st.com>
Subject: Re: [PATCH 0/7] ARM: config: stm32: Disable useless flags
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_173611_426268_95B49071 
X-CRM114-Status: GOOD (  10.33  )
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

On Thu, Dec 19, 2024, at 18:29, patrice.chotard@foss.st.com wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
>
> *** BLURB HERE ***
>
> Patrice Chotard (7):
>   ARM: configs: stm32: run savedefconfig for STM32 defconfig
>   ARM: configs: stm32: Disable CONFIG_COMMON_CLK_STM32MP in STM32
>     defconfig
>   ARM: configs: stm32: Disable CONFIG_SUSPEND in STM32 defconfig
>   ARM: configs: stm32: Disable CONFIG_ADVISE_SYSCALLS in STM32 defconfig

I would structure these the other way round: you can combine patches
2-7 and just explain why you do those changes in one commit. 


For the things that have changed by themselves, you do need a lot
more explanation, so we can see that you have checked that these
don't accidentally break stuff. You can probably still do them
in a single patch, but it would be nicer to have one patch
per option that has become unavailable, changing all defconfig
files that need the same change.

     Arnd

