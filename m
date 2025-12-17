Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E56D65C70
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 16:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ygVvmQCwoW+bq9xU8k+4m3IDod5LVEM/rzQsvomDzl0=; b=RjTK1S0W9VUSiwvUn+I7lFhILS
	S2L/CuFEMABA3KbvXG3u0dUQDoEAnwC26smFuEsX3x1G/JYsA8iVIEsjdOfGu1IANfYbN9j70OrKI
	4hecf4VOxFb+Axncwn5yik1dre8BRo6Zi5sZAd+FVi0hgUz7d4UIeRyxUzMhu7edptxyI3sWXRUH7
	p6Ce/vNzX3tbtJj9nc8u+/k425aw8A4bUhZRQTk0lIbiZl6M9oDFB9K2JPUOznDioRhO/Sen1dL04
	UNPfz+SmadMYg69QLQEmWyKGKeC5SkHyPOUTdLDZz18EAo0TvYzikPAM0TSV6/0bKIt1Z/NTMItAg
	YzTUKCBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVu0w-000000073UJ-2Y0C;
	Wed, 17 Dec 2025 16:04:36 +0000
Received: from fout-b6-smtp.messagingengine.com ([202.12.124.149])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVu0s-000000073Th-3VgI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 16:04:32 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id CB0381D0012D;
	Wed, 17 Dec 2025 11:04:26 -0500 (EST)
Received: from phl-imap-17 ([10.202.2.105])
  by phl-compute-04.internal (MEProxy); Wed, 17 Dec 2025 11:04:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1765987466;
	 x=1766073866; bh=ygVvmQCwoW+bq9xU8k+4m3IDod5LVEM/rzQsvomDzl0=; b=
	Ts/GXl0KtvsDupfb6dX3RMDr2P8txjNqGc6MipR0QbXSFqCe9lDXuY6rBWw5/mJG
	3XFnyG5J36KmW3EjyGf/9HlBenBRsGgBhYcrXKgavkLEMzk++bsNEjSaj7h5hRKf
	rVTt+9Lq6pCh6xAYgL6eyEcg+I3RhjEvjt7LMFLTTFhI1kduUV92jxrO1tFTd7WC
	A+zX9RBTAV+rtrVKXAmbPoUcX2dWWfGpH672+lAhTDJSc3XuY4++OjN1jkkoBV2c
	zLiLK9xcKd0AjdXSNwW3NCCPwW7wQ8HUSiBUaSZYoUkcWRH5HMrb2Rjyn27/yHns
	UJWd0VWG3V1+hIg9BklG3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1765987466; x=
	1766073866; bh=ygVvmQCwoW+bq9xU8k+4m3IDod5LVEM/rzQsvomDzl0=; b=p
	7NtHNQvl37GD1xiT+x1bUn1Q41zdU2ia/UO2hmQo8cTguVZBg7cEqaRsNxJcnC1l
	aSjhAftOQe54SSzBu0awknfZY/h4stYSgkJ7wYQjqvoFMbndtgivnDo15VoXLP7x
	aG3iqVXFyodmVNPTbr1Cqqjk8ru+YRsMOcbxGoF8+QiwdB3u4IK/+2vRtdZRxyGh
	DA/isDfdL7untEGvjYqltJK8XTT8GI1fT0np9xDWc5Msqn6rp/zDGfjb9KFKGoOE
	qLgUco5MtpoTUQuL91SUr6olGxohtVvtnpWvByZpK0ZpijRkXyqW5KLNrya0/uYO
	R0NwAEIZ6d5tqOZpFG7lg==
X-ME-Sender: <xms:itRCaRn0C6BhSz77dtVqAX0erOmL3RcXvwQQN9rZISQOtii91NM0JA>
    <xme:itRCaXo4AHOvlzGrSH9zQ71UL57iE6FgrRA4r50XzAADSmaKN0wI2xEuhcD1NVUpN
    qa4ThCkgU3osCdkMpmawy3Tek1PjElUhq57BVcj1PjqQhduqDg_hXZ_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdegvdellecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeduhedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomh
    dprhgtphhtthhopehrohgsvghrthdrjhgrrhiimhhikhesfhhrvggvrdhfrhdprhgtphht
    thhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtohephh
    grohhjihgrnhdriihhuhgrnhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrghhn
    uhhsrdgurghmmhesghhmrghilhdrtghomhdprhgtphhtthhopehsvggsrghsthhirghnrd
    hhvghsshgvlhgsrghrthhhsehgmhgrihhlrdgtohhmpdhrtghpthhtoheptghonhhorhdo
    ughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:itRCaWf1Yyrm1HtXtcgIsDH2I6V6sgnAyJlab6eD3Ym5uEsFmamVZQ>
    <xmx:itRCaXzWj75fr4DDHg0NMOfc_CITydfsMlXllPehDoM0YE1x9rajGw>
    <xmx:itRCaXLF7LpR_uInOIhCBM9Aptr9c4Zrpzq2n9lJL0KJVihdcdhW-w>
    <xmx:itRCaQvd_-R8Mx63miwGtEMxIlpzL78nf73lofA6ZQ5WNZ5kZD0Y_w>
    <xmx:itRCaYI4XZ0VZKqracHiuy3P3n06L5sIexKJOi-IE7jBJwytH3M7O101>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 05A20C4006B; Wed, 17 Dec 2025 11:04:26 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AXfFZUabNlQ-
Date: Wed, 17 Dec 2025 17:04:05 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Robert Jarzmik" <robert.jarzmik@free.fr>, "Rob Herring" <robh@kernel.org>
Cc: "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Magnus Damm" <magnus.damm@gmail.com>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Daniel Mack" <daniel@zonque.org>,
 "Haojian Zhuang" <haojian.zhuang@gmail.com>, "Andrew Lunn" <andrew@lunn.ch>,
 "Gregory Clement" <gregory.clement@bootlin.com>,
 "Sebastian Hesselbarth" <sebastian.hesselbarth@gmail.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Message-Id: <35405ed3-1319-4d3a-84a5-ad67f4c823ad@app.fastmail.com>
In-Reply-To: <m2345fmkg7.fsf@free.fr>
References: <20251212203226.458694-4-robh@kernel.org> <m2345fmkg7.fsf@free.fr>
Subject: Re: [PATCH] ARM: dts: intel: Drop pxa2xx
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_080431_329029_DEF71EFA 
X-CRM114-Status: GOOD (  20.38  )
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

On Fri, Dec 12, 2025, at 22:58, Robert Jarzmik wrote:
> "Rob Herring (Arm)" <robh@kernel.org> writes:
>
>> These .dtsi files are not included anywhere in the tree and 
>> can't be tested. They have not been touched since 2018 other than 
>> clean-ups.
>>
> And yet, there are used by people using pxa2xx board with an DT 
> support (like the mioa701 for which a board file was never merged).
>
> If you remove pxa25x.dtsi and pxa27x.dtsi, you might as well 
> remove all support for this architecture from the kernel, as
> these are the building blocks needed to make it work.
>
> That might be what should be done, I'll let Arnd and Daniel 
> comment on the future of PXA in the kernel.

I agree with Rob that at the very minimum, any dtsi files in the
kernel should be build-tested along with the rest, so either
we add some dts files using them soon, or we can remove pxa2xx
(and maybe pxa3xx) completely.

I already plan to remove the remaining board files for both
sa1100 and pxa soon, as nobody has picked up the task to do
any further DT conversion after we removed the majority of
the files back in 2022 and left only the ones that someone
said they'd be interested in keeping.

Robert, let me know if you or someone else is able to spend
some time on sending (warning-free) dts files for pxa2xx
machines soon. If not, I'd plan to remove whatever is there
along with the board files and drivers.

I also checked the pxa3xx Raumfeld devicetree support that
Daniel added in linux-3.7. The manufacturer's firmware
download page contains kernel images based on this work,
using a 4.19 kernel but built in 2022. If we remove pxa2xx
DT support, it would be good to find out if anyone still
plans to use something newer on that hardware, which may
happen because of CRA requirements.

    Arnd

