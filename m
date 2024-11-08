Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD0ABD5C0C1
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 12:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/UFtKcqpLPOta++bN4mFB7tkrh4R7OEgdALO6YFmI0E=; b=ms4ol+0bwzX0xJxZ3VznrWq4jy
	q9ISNGX2zw06FbBy26uFzX6McBKiVKv3YLhlToVXKO94NEOPYYPN1w6GdS7l53CHBuUbl+620wm4h
	eWbsHiI88q6zlHBOtkKMbA+giqG1BkiKZXu3szA1HvPJSXyFKYJE0AoU6+gU3wFsBU0PepJacVDkB
	uqkkowOi8GqXrzG1HCkaOaQzIiftS44CLbHdGwzkqYYDanSIIIdt8b2OXkM+2nD5Zyj5VdS8ZJqzm
	4ehFSOK3zVGyetZ1TqrO4Q7XTpTEo+HRSpm59Ra0AiA6Iy3bYs/WdVSU7A5sIurBT0EhImjIemY+l
	HSKs78mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9NxS-0000000AUXi-29lA;
	Fri, 08 Nov 2024 12:19:22 +0000
Received: from fout-a4-smtp.messagingengine.com ([103.168.172.147])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9NIR-0000000AMmO-312u
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 11:37:04 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id CF0CA1380105;
	Fri,  8 Nov 2024 06:36:55 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Fri, 08 Nov 2024 06:36:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1731065815;
	 x=1731152215; bh=/UFtKcqpLPOta++bN4mFB7tkrh4R7OEgdALO6YFmI0E=; b=
	MuVSr4D+T6p4whmx3kZLDxSrzJOGMq2Vmcjh7b3D8frFZDnJ0IT8CbwQgxM+qkmr
	pxqE6wQc3kAZW5poHHCzaIwGwxYTlPCey3NcHltcxiq126slsqWEySLpQsLaG8ZW
	R8kRVWp1nvRF+XhhMpCtBAmfqfe6SKe0asX8uTuqA3O1jqudLjAyxQKy5BplaTmx
	PkW/RjfCZoVyXHigJCnhg8hJSlrtL7ACBXZ4vW5JvL4k/cQt/PfLg1SVGIXGg5R6
	KO6IfQt6UjkwgvoBsIUGIRKEF4Mb26Mo6KBD9kD4ofqYbrk6hZAxMw8jfFnofiSt
	MkZsvG1x37waeGtvmqM1XA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1731065815; x=
	1731152215; bh=/UFtKcqpLPOta++bN4mFB7tkrh4R7OEgdALO6YFmI0E=; b=i
	xf6vJSLL4f0cC5iEMeeWu8by72bZDrQX/WlIklb7WXuOcYaEGQkZZAIVLPN+2pZA
	SXlhxp0xn4VI9A+GyBKrYuF/iUOWa9gNmAyreuaM6xySvy+3fe4IXwSCGMsQWbZP
	ZXZx2yCjvOZlO2XvwSqPProe2heY0EjHiZ/SFj4yRTi15LNoG9YgzQGHPVhkAmmC
	e5lvXucZGYjT8kOm/tnA0V7h3kvhX5ZU95zA8wkvl6NcNFdgkw2o/GOsGzgHejWX
	yfN6DutSX3WbZJPMXKoVe48IDK8dgx/tnbnrBHcIhtUjq4HjPKOaXDkS63PQmFqj
	3Gf7k0/yP5tCfAlZvaEfw==
X-ME-Sender: <xms:1vctZ6YRV91KUNf6re0_EjKNZNh2trTT95xfv1EWLUZJ53tSJnRTqg>
    <xme:1vctZ9bD6_jESSR3yvppnTOkfx0_3CNsPQYOv1RvSOg1Ui4bzyg3mYiLZ-KHCK4HF
    0KEe1dV4nqxw9NhXAg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrtdeigddvjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredttden
    ucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdrug
    gvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffg
    vedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopedvhedp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghnughrvgdrphhriiihfigrrhgrse
    grrhhmrdgtohhmpdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdr
    tghomhdprhgtphhtthhopehjrghmvghsrdgtohifghhilhhlsegslhgrihiivgdrtghomh
    dprhgtphhtthhopehmrghtthhhvgifrdhrvggufhgvrghrnhessghlrghiiigvrdgtohhm
    pdhrtghpthhtohepnhgvihhlrdhjohhnvghssegslhgrihiivgdrtghomhdprhgtphhtth
    hopehnihhkohhlrghoshdrphgrshgrlhhouhhkohhssegslhgrihiivgdrtghomhdprhgt
    phhtthhopegrnhhgvghlohhgihhorggttghhihhnohdruggvlhhrvghgnhhosegtohhllh
    grsghorhgrrdgtohhmpdhrtghpthhtohepnhhfrhgrphhrrgguohestgholhhlrggsohhr
    rgdrtghomhdprhgtphhtthhopehhvhhilhhlvghnvghuvhgvseguihhmohhnohhffhdrtg
    homh
X-ME-Proxy: <xmx:1vctZ0_-_OLnQj42eH0bq4y-7qkELYAQQz1goBf_3Z_SUGoNmfDKMA>
    <xmx:1vctZ8qt6imn11CprVNHZSBJfdVBAcuUP9Ywx53PQVjMKGyeQDNw0w>
    <xmx:1vctZ1o_i0844q2Nq7GfX0dYr63Rk7UOAMJ-BOntyTyINUC3_0iKDw>
    <xmx:1vctZ6RxE-3pT-swk7VQfEF-2mGfMN_LEmmRUpsercEQrs1Cn6xU7A>
    <xmx:1_ctZ_YzZDKLxYZqWPD7R1iVGO-lTwKwF7NNwPbdelt7EE9hqms9h70M>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C46942220071; Fri,  8 Nov 2024 06:36:54 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Fri, 08 Nov 2024 12:36:28 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Niko Pasaloukos" <nikolaos.pasaloukos@blaize.com>,
 "James Cowgill" <james.cowgill@blaize.com>,
 "Matt Redfearn" <matthew.redfearn@blaize.com>,
 "Neil Jones" <neil.jones@blaize.com>, "Rob Herring" <robh@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, "Olof Johansson" <olof@lixom.net>,
 "Hans Verkuil" <hverkuil-cisco@xs4all.nl>,
 "Shawn Guo" <shawnguo@kernel.org>,
 "Hugo Villeneuve" <hvilleneuve@dimonoff.com>,
 "Andre Przywara" <andre.przywara@arm.com>,
 =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>,
 "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konrad.dybcio@linaro.org>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Nishanth Menon" <nm@ti.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>,
 =?UTF-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>,
 "Johan Hovold" <johan+linaro@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Message-Id: <f38f87bf-f413-4dc3-a76e-e653dd4ad6d1@app.fastmail.com>
In-Reply-To: <20241108103120.9955-5-nikolaos.pasaloukos@blaize.com>
References: <20241108103120.9955-1-nikolaos.pasaloukos@blaize.com>
 <20241108103120.9955-5-nikolaos.pasaloukos@blaize.com>
Subject: Re: [PATCH v4 4/6] arm64: Add initial support for Blaize BLZP1600 CB2
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_033700_646970_E1B8676C 
X-CRM114-Status: GOOD (  15.72  )
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

On Fri, Nov 8, 2024, at 11:31, Niko Pasaloukos wrote:
> Adds support for the Blaize CB2 development board based on
> BLZP1600 SoC. This consists of a Carrier-Board-2 and a SoM.
>
> The blaize-blzp1600.dtsi is the common part for the SoC,
> blaize-blzp1600-som.dtsi is the common part for the SoM and
> blaize-blzp1600-cb2.dts is the board specific file.

The split of files seems fine, but a little more information
about what this chip is used for would help, so that developers
looking at the git history later can have an idea.

> Checkpatch: ignore
> Resolves: PESW-2604

I don't understand these, can you turn these into full
english sentences? What checkpatch errors do you see and
why should I ignore them? What is PESW-2604 and how does
it relate to PLZP1600? 

> +#include "blaize-blzp1600-som.dtsi"
> +#include <dt-bindings/net/ti-dp83867.h>

I don't see any references to ti-dp83867.h here, maybe leave
the #include to a later patch that actually starts using it?

> +#include "blaize-blzp1600.dtsi"
> +
> +/ {
> +	memory@0 {
> +		device_type = "memory";
> +		reg = <0x0 0x00000000 0xffffffff>;
> +	};
> +};

Is this an off-by-one error or do you intentionally
leave out the last bit of the 4GB address space?

If the last byte is actually addressable, please just
use #size-cells=<2> and make it the full 0x100000000.

       Arnd

