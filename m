Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5835BC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 15:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tOn4t6RQtKYJOiy4GjdNdZL8fCaJIQVkOeOeYM78T9w=; b=0wpFJzgincGiNloADPCQxEly7i
	zPoCDlMEmVJm8EpU7wEp9j04XpbgtUj3t9BnUevyCX7HmoHhD2JUnhhmYVvCkIbVZiJEDTNgd7AGM
	k2gj3VFO5wo7UL7aJOp33Y6ngO3Z9zecHdP/9j+4g+kSE8bpkHW8+gjJE8UoDkcs2OlNGOmUK48i+
	C9htKU5u/X+mOfQM9iM0DNd43UrKcDJsBGA9/MPMzvZRr3gqRN18ZrLU2GF5hk5Bzg8L0PbpBXysY
	cwnCncq5bawft/t2WFBxo54aT71fiqAj32DY4Mc2F2yBIZlZytjaah/410LUgKGQgyRXVMcnKXLXs
	jtB5IHLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujgUV-0000000FgJr-3fPG;
	Wed, 06 Aug 2025 15:55:48 +0000
Received: from fout-b4-smtp.messagingengine.com ([202.12.124.147])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujgI6-0000000Fdsu-0dgF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 15:42:59 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 25E1A1D0008D;
	Wed,  6 Aug 2025 11:42:56 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Wed, 06 Aug 2025 11:42:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1754494976;
	 x=1754581376; bh=tOn4t6RQtKYJOiy4GjdNdZL8fCaJIQVkOeOeYM78T9w=; b=
	Shsce62z7ccdFezFEX0ljLJTYYZo8Sj/bFUVQu1aAmq//x3Dr9sVOfgEmY7qXnll
	d7/0igJlw2TsRXbULIquZAJJGp1Klw+RH+HKgC+hdQJ2dxxSB779j/XDbTtO4waP
	HBtlaJMW4NLFRdhm0Bmec57qu5kz9IhfvLcnQu3VW7drQpeQp2kQNQn0ymJ3mhyp
	Tno3XVRsyqNRxu7QRW1JDzJHdLIDU1fhCkYl5jY3hvKMrGIYM4TUdRcGTXBFkxW3
	fGXw71ZPwx0guOUbGPCmebkdUqUWAc45kzL6GF4uLEkXGBe7bIwCs6osx4TNKe1w
	k62wtFPvsuBSj4o8QCyipg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1754494976; x=
	1754581376; bh=tOn4t6RQtKYJOiy4GjdNdZL8fCaJIQVkOeOeYM78T9w=; b=S
	lR+myEibV8ZuD3LZrxezPsVhRSJDJ3iQYJ22AQTZCMgp0OQAG/TMpLX8ynHngT9e
	OxMi5eLac0YYJpiq9pPfy/HwkJVr9V/FUmLgc35jADR3OUTAm/ki+SCniptT61fQ
	J4PGivd/N7Rlwjjwv+dSmCWC+aHzl6NrX9bjOh1KtAt++WtFDfPoM9hfn2wRJXmH
	fieBtpKNEeqZAFI2qcYNU1I3zYAjVou4DeOWrAzzKDX+sJj/O8ixsCI1Qo4CpD9F
	VuXN4NRx9fjbX07caRXMZc/udaaIs6eoi/W0yQ/cUNrMnEMpUldGRMYBYeUnw7Bn
	EuJiXAuR6vIhIz9BZ9iuQ==
X-ME-Sender: <xms:_neTaAIPbMToyVFjVCzhY_3AHIxEeueKJk4PgLrsAYmzXQRWnt7dLg>
    <xme:_neTaAJMTJEZ8ui8qTj2uwGWmUn3QBkTQD_2KCDNmqOsbv9l44sCDua3P3SDlit6I
    WDfl38Xx_sSvS7pyJA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudekgeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepfeejpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtg
    hpthhtohepjhgvshhpvghrrdhnihhlshhsohhnsegrgihishdrtghomhdprhgtphhtthho
    pehlihhnuhigqdgrrhhmqdhkvghrnhgvlhesrgigihhsrdgtohhmpdhrtghpthhtohepmh
    htuhhrqhhuvghtthgvsegsrgihlhhisghrvgdrtghomhdprhgtphhtthhopehgfihkuddt
    udefsegtohgrshhirgdrtghomhdprhgtphhtthhopehhghhkihhmtdehsegtohgrshhirg
    drtghomhdprhgtphhtthhopehkvghnkhhimhestghorghsihgrrdgtohhmpdhrtghpthht
    ohepkhhskhegjedvheestghorghsihgrrdgtohhmpdhrtghpthhtohepmhhinhhghihouh
    hnghgsohestghorghsihgrrdgtohhm
X-ME-Proxy: <xmx:_neTaMyQha4lWXE4lnfH10oTn7U5V7ZNVO7HRNP5Sh8rhCkGz197OA>
    <xmx:_neTaCHarrhUi7SS3lsNUWCcs7zA21ELnaKANtAhm3udo3oPuqo9Gg>
    <xmx:_neTaAGwPQ13TlH-W68kdH_hvmRV15_tjZDRb3_AMdF7uUncH9yDpA>
    <xmx:_neTaLugcvZe_3BQ1_GvdspWP5DyXXIhogioBm8zi9LhHsUMRS7UZQ>
    <xmx:_3eTaP4CvdJzy5tREUVbfv-NACFAbM6q6Gp5RicN6WQAd1u5qmZS1Gh->
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 9D0F7700065; Wed,  6 Aug 2025 11:42:54 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T8d5032a2d74658ad
Date: Wed, 06 Aug 2025 17:42:24 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Pankaj Dubey" <pankaj.dubey@samsung.com>, ksk4725 <ksk4725@coasia.com>,
 "Jesper Nilsson" <jesper.nilsson@axis.com>,
 "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "'Krzysztof Kozlowski'" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Sylwester Nawrocki" <s.nawrocki@samsung.com>,
 "Chanwoo Choi" <cw00.choi@samsung.com>,
 "Alim Akhtar" <alim.akhtar@samsung.com>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Tomasz Figa" <tomasz.figa@gmail.com>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>
Cc: kenkim <kenkim@coasia.com>, "Jongshin Park" <pjsin865@coasia.com>,
 "GunWoo Kim" <gwk1013@coasia.com>, "HaGyeong Kim" <hgkim05@coasia.com>,
 "GyoungBo Min" <mingyoungbo@coasia.com>, "SungMin Park" <smn1196@coasia.com>,
 "Shradha Todi" <shradha.t@samsung.com>,
 "'Ravi Patel'" <ravi.patel@samsung.com>, "Inbaraj E" <inbaraj.e@samsung.com>,
 "Swathi K S" <swathi.ks@samsung.com>, Hrishikesh <hrishikesh.d@samsung.com>,
 "Dongjin Yang" <dj76.yang@samsung.com>,
 "Sang Min Kim" <hypmean.kim@samsung.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@axis.com, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, soc@lists.linux.dev
Message-Id: <5584937d-0941-487a-859b-b3c55aceaf37@app.fastmail.com>
In-Reply-To: <ef3b8e12-0677-4e49-bf2c-b8136c9a6908@kernel.org>
References: <20250710002047.1573841-1-ksk4725@coasia.com>
 <847e908b-1073-46ea-93f3-1f36cc93d8b8@kernel.org>
 <bfdc2eddde554e1d1808dd8399bc6a693f681c9b.camel@coasia.com>
 <CGME20250721064006epcas5p4617b0450e69f72c94d2b3ae7b1d200e7@epcas5p4.samsung.com>
 <99977f38-f055-46ed-8eb0-4b757da2bcdd@kernel.org>
 <000501dc06ab$37f09440$a7d1bcc0$@samsung.com>
 <e334f106-d9f3-4a21-8cdd-e9d23dd2755d@kernel.org>
 <002001dc06b1$540dc980$fc295c80$@samsung.com>
 <ef3b8e12-0677-4e49-bf2c-b8136c9a6908@kernel.org>
Subject: Re: [PATCH 00/16] Add support for the Axis ARTPEC-8 SoC
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_084258_298632_70D2A5AA 
X-CRM114-Status: UNSURE (   9.37  )
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

On Wed, Aug 6, 2025, at 11:23, Krzysztof Kozlowski wrote:
> On 06/08/2025 11:05, Pankaj Dubey wrote:
>> 
>> or ARTPEC is manufactured (ODM) by another vendor in that case, won't it
>> create problems? 
>
>
> No problems here. Non-Samsung Artpec/Axis soc will not go there. It will
> go the top-level axis directory, just like artpec-6

Agreed. We did have a case where something gradually changed
instead of changing ODMs entirely:

Apple A4 was mostly an Exynos-family chip but A18 is not.
If Axis turns into the next Apple and ARTPEC-23 is far enough
removed from ARTPEC-9 to no longer fit into the same family
as Exynos/Tensor/FSD, we can still reconsider the decision
in a decade.

     Arnd

