Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D58ECCCF9F5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 09:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uh4NB+HSJVPCBBiBiBbt/42eb7P0NgKaMbg1S7YeUgE=; b=HGfTUmuwpBpjfwjRTBO+D5HcZC
	6vQjJQkZeg0KL7T7aXNX1qJBwnOQS51U5efSigMyrkujoRx9h1JPAt4n8Q2LbEhn7Qu1BkBeylthF
	f3OMy5RUndkw9VoT5NVTBl2sO7JBhKGogMxd16waGU2ZeAhXXWTBLR4v2rOY0QiZv6nGKx/X+O/Mf
	UHMXXThNdQysUVbdFcGHs+z/OlU7bQPitxYJvZ7j65S5/6d0Cf3Nwfe0u1KChLWhESZ0AHmG7xfTr
	jtVmAVFO7VURrRUlenF5SiRXwAhFRZm24xk7V4+e//IE/zuAQW3P0cjtSLO/Ycb9iCD9hqeDJCuOA
	aTdJKi1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEOp0-00000003qL6-1UvQ;
	Thu, 30 Oct 2025 09:19:54 +0000
Received: from fhigh-a2-smtp.messagingengine.com ([103.168.172.153])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEOox-00000003qJP-1HDi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 09:19:53 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 58B311400053;
	Thu, 30 Oct 2025 05:19:50 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Thu, 30 Oct 2025 05:19:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1761815990;
	 x=1761902390; bh=Uh4NB+HSJVPCBBiBiBbt/42eb7P0NgKaMbg1S7YeUgE=; b=
	A1tJr0FGfpT+KmteyW//kMW2zidPOy9N6MK8UwdeH9G1ob2S1h/C+tTMVI5vbs1A
	+Y9sf8W4H87k//ex0RjnDd53WyQds7gS5t4BXyTPiFF17+nuCgi+ayGjM041uIrX
	8dgGyRMvtw6JB86VUmT/SFVDI4roRViHPtXgC7UOAEnqb6hwDyqZ3MVYHuuf8OTL
	/vpSt8EwGYsVWliof3EAM8+th94kuFIT82K4c+NltOAkL0qKpl+LM+P9VfmYuKtg
	DbUGulT4QEp9njs7cnF8MKNaK6j4RGGoMA4t+14wC0dMfvCDKotxRG92trfVZ5N9
	1VK2OPB+o5e1q5e+mLT9fg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1761815990; x=
	1761902390; bh=Uh4NB+HSJVPCBBiBiBbt/42eb7P0NgKaMbg1S7YeUgE=; b=l
	e9r6h20JfPJuMtf+YWRuZuotD7GoYATTZK0VofffMwX+iiNRAHs4QfvO859ACsV5
	C8tnEUgD4RgAUhPhuVwxWt6DpxPZeEOQaQk3dAlMevEtTT+aBxfN5TtIY7o2Ds4q
	4yJYEiJ2m+uvuXEUzkCeuI+/6ZQF+H/xjSapOQzm+rNbn4zjj86KMovknoilnGyt
	4PzWQp51EP9iLua9rGvv0aUbq4wWDDZNmtjEJoQrhEddGLhFZ1NsyKiymU4453bV
	ZhprdwcNLFit7aJKqY8A97Ng7AfG1go2TBPQDs6QHwjL7Jl+c1COqR9o28RTfVro
	qZ5LUvwY55aC8Ip3XtcIQ==
X-ME-Sender: <xms:si0DaRrX5cYuLzX7twdK9rU0AVLVisa2isg9n3oBtKnyIeSIwsz2ew>
    <xme:si0DaefFpOIUhK-zVuC9GW-lD4K1owd9J32XB9ywQvDZc4AdhmWSGAkDHUYQkK1Gn
    2bL39JJhWIys530FqmhWLHRFRkzpWnDTsi8ZNhm3LzVXmzIYM0d>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduieeivdegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepteefudehvedutdeugfeuveffleduheehfeehffeujeduledvheeivdffleffjedt
    necuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgt
    phhtthhopedvgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheptggrthgrlhhinh
    drmhgrrhhinhgrshesrghrmhdrtghomhdprhgtphhtthhopegsmhgtqdhsfiesrghsphgv
    vgguthgvtghhrdgtohhmpdhrtghpthhtoheprhihrghnpggthhgvnhesrghsphgvvgguth
    gvtghhrdgtohhmpdhrtghpthhtohepphhrrggshhgrkhgrrhdrmhgrhhgruggvvhdqlhgr
    ugdrrhhjsegsphdrrhgvnhgvshgrshdrtghomhdprhgtphhtthhopegrnhgurhgvfiestg
    houggvtghonhhsthhruhgtthdrtghomhdrrghupdhrtghpthhtohepjhhksegtohguvggt
    ohhnshhtrhhutghtrdgtohhmrdgruhdprhgtphhtthhopehnfhhrrghprhgrughosegtoh
    hllhgrsghorhgrrdgtohhmpdhrtghpthhtohepjhhovghlsehjmhhsrdhiugdrrghupdhr
    tghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:si0DaQa1jReZrdouddiXNT_gzDUZW4q2yvT-lhJogRueJkPC_Hp0sg>
    <xmx:si0DaW5-WcSf4fqmDeiP4dcJDGQf_x-CZESUKbFpNy6Mv9dVWcsf1A>
    <xmx:si0DaQ9gytoI1n2olJmnNXe9hDx-luLL7aJjq-_W84saiuW6LQi1PA>
    <xmx:si0DaYY11MBKdM2b9v8vPlIHfO130lzmuFSYnkzmlq8jV5V6z57RpA>
    <xmx:ti0DaYkAEc0OfepZSvvNm1L8UlPxSR9CldQXFiq5TDsCf_Ev2oQJCSJn>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A59FC700054; Thu, 30 Oct 2025 05:19:46 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AMptcG-LwCSF
Date: Thu, 30 Oct 2025 10:19:15 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Ryan Chen" <ryan_chen@aspeedtech.com>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>
Cc: "Andrew Lunn" <andrew@lunn.ch>, BMC-SW <BMC-SW@aspeedtech.com>,
 "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Joel Stanley" <joel@jms.id.au>,
 "Andrew Jeffery" <andrew@codeconstruct.com.au>,
 "Jeremy Kerr" <jk@codeconstruct.com.au>, "Lee Jones" <lee@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>,
 "Bjorn Andersson" <bjorn.andersson@oss.qualcomm.com>,
 "Nishanth Menon" <nm@ti.com>,
 =?UTF-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>,
 "Taniya Das" <quic_tdas@quicinc.com>, "Lad,
 Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "Kuninori Morimoto" <kuninori.morimoto.gx@renesas.com>,
 "Eric Biggers" <ebiggers@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Message-Id: <80d0fb36-17d8-44c9-8941-0bac9f3b3ef2@app.fastmail.com>
In-Reply-To: <TY2PPF5CB9A1BE68F47D7F3DBA2CDA2429EF2FBA@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
References: <20251022070543.1169173-1-ryan_chen@aspeedtech.com>
 <20251022070543.1169173-5-ryan_chen@aspeedtech.com>
 <b5441728-06a7-44ea-8876-3a9fc3cf55be@app.fastmail.com>
 <TY2PPF5CB9A1BE626A2F0F6307461D8F64BF2F0A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
 <6a97fbb4-19c2-4ffa-9c73-26aea02c27e4@app.fastmail.com>
 <TY2PPF5CB9A1BE6CF8336D211641A18E2DEF2F1A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
 <71df9bdf-53b2-45e2-a9e3-5b00a556f957@lunn.ch>
 <TY2PPF5CB9A1BE6F3E95C7FD61CF4F90ECAF2FEA@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
 <fdbc471f-514e-4521-b7a1-dcf6127d64ff@lunn.ch>
 <TY2PPF5CB9A1BE6DD93D0F397C961D5CB5AF2FCA@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
 <01573262-69a8-44cf-ae02-2e9842c59dde@lunn.ch>
 <TY2PPF5CB9A1BE665D988A413B8BCD5CA27F2FAA@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
 <7c0c966b-c45f-47ad-9243-b945036a9bd2@app.fastmail.com>
 <CAMuHMdVueyxmATwS_EnqBBPtX-O0bw6Ubnj-Dey8wN=pEvo_zA@mail.gmail.com>
 <TY2PPF5CB9A1BE68F47D7F3DBA2CDA2429EF2FBA@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
Subject: Re: [PATCH v6 4/6] arm64: dts: aspeed: Add initial AST2700 SoC device tree
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_021952_188767_4A863272 
X-CRM114-Status: GOOD (  15.47  )
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

On Thu, Oct 30, 2025, at 03:30, Ryan Chen wrote:
>> Subject: Re: [PATCH v6 4/6] arm64: dts: aspeed: Add initial AST2700 S=
oC device
>> tree
>> On Wed, 29 Oct 2025 at 08:26, Arnd Bergmann <arnd@arndb.de> wrote:
>> > On Wed, Oct 29, 2025, at 03:31, Ryan Chen wrote:
>> > >> Subject: Re: [PATCH v6 4/6] arm64: dts: aspeed: Add initial AST2=
700
>
> Thanks for pointing me in the right direction.
>
> After checking the TI K3 example
> (https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/ti/=
k3-j784s4-j742s2-common.dtsi#L75),
> I see that all processing domains in that SoC share the same physical
> address decoding, which makes a System-DT-style structure possible.
>
> However, in the AST2700 design, the Cortex-A35 (64-bit) and Cortex-M4
> (32-bit) cores each run in a distinct address space with different mem=
ory
> maps, so they do not share the same decode view. =20
> Because of that, a single unified .dtsi cannot directly represent both=
 sides
> without additional translation or =E2=80=9Cranges=E2=80=9D mapping log=
ic.
> For example, in ca35 view uart0@14c33000, cm4 view uart0@74c33000
> From ca35 do have 0x7xxxxxxx is another peripheral decode address.

This still looks like the simplest case to me, where you'd have
a dtsi file describing the @soc0 and @soc1 devices using their
local addresses such as uart0@c33000, and a ranges property
to map it into the CPU specific physical address space, one of

	ranges =3D <0x0 0x0 0x0 0x14000000 0x0 0x1000000>;
	ranges =3D <0x0 0x0 0x0 0x74000000 0x0 0x1000000>;

to remap 0x1000000 bytes (16MB) of address space from local
bus addresses to one of the two clusters. This is almost
what you have, except you map an entire 256MB (0x10000000)
range. The exact size you want should be available in your
hardware documentation.

         Arnd

