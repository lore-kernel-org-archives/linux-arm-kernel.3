Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CDAEC8302D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 14:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ik9oLe3KdALkxzKl69BBxlmJ8fpBBAh4pU7+UUhNIAg=; b=27SmrvSez+GpjjnmSE7xqUCkSK
	NB+E8/pGRVl+jeGpCoNRKfCmf6oQqOu5P/Xqw6Fod11C1IUjWpFZBk09lQWu2QY/8M1MEwBbil6p1
	vi6taZ8elDxByaiuQGFLNhcYcV84dHXG5Qj0lkiCplAPQtc/weWqM8uoyVpPIMiHsV4V6SgpJq7U2
	yJ2p6hnzkZQiF3qcMd2pCPwzlo8uqI7iuaoLZNYmfF07UccrQEWYdzlqC2hij5rrCO526vRxAfFvv
	tkm41cU9GmFcTAsj3U8Y0bUtE9X3M8S3LrC+7UfX7wyk5HsTzLRASUXbecAhyXxWcJRaCm9FQYaOR
	Eb7Q8TOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWF5E-00000002TKe-2wmp;
	Mon, 30 Jun 2025 14:02:08 +0000
Received: from fhigh-a2-smtp.messagingengine.com ([103.168.172.153])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWExf-00000002S6w-3Qb0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 13:54:21 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id A41121400028;
	Mon, 30 Jun 2025 09:54:16 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Mon, 30 Jun 2025 09:54:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751291656;
	 x=1751378056; bh=ik9oLe3KdALkxzKl69BBxlmJ8fpBBAh4pU7+UUhNIAg=; b=
	HCpLW8xsF3EqejqRsdi4yjCzmlUTcGMoILiaKStETiAgoeykxvH8DpcWVyDgi7Zg
	xX02l5ZTYkqo0QruDwzfQ++5RSoiqmz/kHiUUCOZiZA08maMoMNRBu4J0utGZaNS
	TAFlOugGZqywPfBPzLWLK8CWreEh1ZpUQzLjUTy0KWh+FPWLM4HYflHiOyNjrWRp
	M8ZaCKazgSGEfxTTuGveC6KrQEa0u/8GjsPXe85rOhttDPhXR8uogkwPdASMucj8
	cjjdAgCA0JdmkfkfqRiP24v2d4N7x9f1V8PnIoLYLRQIBjAl4zCFd7nONXkI9Ech
	FdRZ+inK4k7w8NzMsqM86Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751291656; x=
	1751378056; bh=ik9oLe3KdALkxzKl69BBxlmJ8fpBBAh4pU7+UUhNIAg=; b=V
	lNd4II1MEchvr393QhsqIMCypt8IeM8qeUKvGbO0Qq7Wy2w+ub3YgnUiT0mQ12FX
	KF0q7wdPAn4E8Nf8hsS68cO3yock4OkiY4SQNaeDwGZwTX7+OUcxsGWZabCcpoqR
	82mkry5p9IJHYDpnFQLQ60+rrZPg6O2OCS6gDDjtx+EywTTMjcSgJwg+1BhPqmGe
	PpnSeLcYKRPmzR7KJHgEn8S2pEiY1ZWOJCucyk2cxBYIfbcYxwTM5cdAFrU3T/YU
	sJK78LjTadM0IPbp4mu0dum9PnEdbzR28u75DTplu97uq3ZuQIAUe6hTtQiR2ybY
	J7hVufrDRH7au8tk+7P8g==
X-ME-Sender: <xms:BpdiaGUGolou3QitfZg4BLCqsIQsIym4YCDRZA9BPbVpjvQSFuKbOw>
    <xme:BpdiaCmTzevwMOgsbNp3SurxN3fnfZd5hxQ7tFPxER-J8eWckiPqYPWHZeCXCn0bM
    4_Dpna6uxf0VicV6Rk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudekjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpedvhfdvkeeuudevfffftefgvdevfedvleehvddvgeejvdefhedtgeegveehfeeljeen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeduledpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtph
    htthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohephhgvrhgs
    vghrthesghhonhguohhrrdgrphgrnhgrrdhorhhgrdgruhdprhgtphhtthhopegrnhguih
    drshhhhihtiheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsghrohhonhhivgeskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepvhhkohhulheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgr
    rhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtth
    hopegurghnihgvlhdrmhgrtghhohhnsehmihgtrhhotghhihhprdgtohhm
X-ME-Proxy: <xmx:BpdiaKbW6kc3JjXJ_iF119Z2xF0TlpEZ7lZv-75taKItFXsh-Sj_Kg>
    <xmx:BpdiaNX0wbV-b97Hre_u0SVfDSlOMJRgglPNtNh2F29eDDO-Qa2eMw>
    <xmx:BpdiaAlhLEy218q7zgCoW-E8vY34X4w3snX9RIYXQv1AhPnnKNE1fQ>
    <xmx:BpdiaCcDRhGlfi-Q6gHErHIhH-4Zlz1pe68U_7yL8dniJdgtiN14hw>
    <xmx:CJdiaJYx9N4gSrfOr2NmNnOFHFvyapVyNj7lgmg6DXrTQTvDl3ADYuH->
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id CBC52700063; Mon, 30 Jun 2025 09:54:14 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Tad13d72cbf59a799
Date: Mon, 30 Jun 2025 15:53:54 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Robert Marko" <robert.marko@sartura.hr>
Cc: "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, "Olivia Mackall" <olivia@selenic.com>,
 "Herbert Xu" <herbert@gondor.apana.org.au>,
 "David S . Miller" <davem@davemloft.net>, "Vinod Koul" <vkoul@kernel.org>,
 "Andi Shyti" <andi.shyti@kernel.org>, "Mark Brown" <broonie@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, ore@pengutronix.de,
 luka.perkov@sartura.hr, "Daniel Machon" <daniel.machon@microchip.com>
Message-Id: <3e522dcc-3b68-4137-bd3a-dcc2c889dbd3@app.fastmail.com>
In-Reply-To: <CA+HBbNFd5hCKqUZY25Sws-o-0QALLue-JROyze_9biyuZZv4mg@mail.gmail.com>
References: <20250613114148.1943267-1-robert.marko@sartura.hr>
 <3ba837f8-70bb-4b9e-a9f9-0e71b9e073c4@app.fastmail.com>
 <CA+HBbNFd5hCKqUZY25Sws-o-0QALLue-JROyze_9biyuZZv4mg@mail.gmail.com>
Subject: Re: [PATCH v7 0/6] arm64: lan969x: Add support for Microchip LAN969x SoC
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_065420_203656_6D2AD141 
X-CRM114-Status: GOOD (  17.18  )
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

On Mon, Jun 30, 2025, at 15:21, Robert Marko wrote:
> On Mon, Jun 16, 2025 at 8:34=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> =
wrote:
>> On Fri, Jun 13, 2025, at 13:39, Robert Marko wrote:
>>
>> If the drivers on ARCH_LAN969X are largely shared with those on
>> ARCH_AT91, should they perhaps depend on a common symbol?
>>
>> That could be either the existing ARCH_AT91 as we do with LAN966,
>> or perhaps ARCH_MICROCHIP, which is already used for riscv/polarfire.
>
> Hi Arnd, I thought about this, but I am not sure whether its worth it
> since we need LAN969x arch anyway for other drivers that currently
> depend on LAN966x or SparX-5 but will be extended for LAN969x (I have
> this already queued locally but need this to land first).

I think in that case we would want one symbol for all of the above.
We have a couple of cases where there multiple SoC product families
get handled by a shared config symbol to make life easier for the
kernel:

- ARCH_IMX contains multiple chip families that are now owned
  by NXP but that have a complex history with acquisitions and
  product families that mix-and-match IP blocks, similar to
  Microchip

- ARCH_EXYNOS contains chips from Samsung, Google, Tesla and Axis
  that all share a lot of components because they are all based on
  Samsung designs

- ARCH_BCM contains several chip families that all started out
  in Broadcom but actually share very few common components.

On the other hand, we have TI with its davinci, omap, omap2
keystone2 and k3 platforms, or Marvell with orion, mvebu,
pxa, mmp, octeon, octeontx, thunderx and thunderx2 platforms
that overlap to varying degrees but use separate Kconfig symbols.

Since you already have an ARCH_MICROCHIP used by one of the
microchip platforms, the simplest approach seems to me to
include at91, lan969x, lan966x and sparx-5 under that as well.
You could just select that symbol from each of the four
and then change any driver that is used by more than one of
these families to use 'depends on ARCH_MICROCHIP' instead of
listing them individually.

I assume the mips based PIC32 and VCOREIII (ocelot/jaguar)
are distant enough that they wouldn't share any drivers with
the other families any more, but they could be put into that
as well if that helps.

     Arnd

