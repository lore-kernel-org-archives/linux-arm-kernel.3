Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6CA9103E18F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 14:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZF546ExVdkQ5ArVhjKR5umS+gc+eyL+L55GnLaFRRW0=; b=YO1y6mDG8CtFO7c6nvStD+wvLC
	EoppY2CAEPD6Ala/fwU3kkZUMDpeuSrFTMEr5HolVp+AJOoaXN7R8AEtAXbiZLZO4jRsDvu8iWmub
	5A9aQ8Z+T3b3cTLhtzwqVGQ4Q95VLPHWdeKTIakUWhH6ivGajy8eF47XWBQa9bBLMGzk37IOiQwry
	YCc3e6oLWwXBf9TMPTcDZVYZJT8V1zmA+FllOiYaxrxrtihVBDZpFVyMWB4tKW8rsQqhrhT14tgKq
	G+lYYArlrzXrr7kKzYYFM5UOIzpZhqzY6w+aBWThlDKLllZFmuSGFLwmXpLlVr786t/yZ7sFmbShK
	OI2/hxZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2rtc-00000008azx-1qlo;
	Wed, 18 Mar 2026 14:29:16 +0000
Received: from fhigh-a5-smtp.messagingengine.com ([103.168.172.156])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2rtZ-00000008az0-2JCn;
	Wed, 18 Mar 2026 14:29:14 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id A78AA14001E3;
	Wed, 18 Mar 2026 10:29:11 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Wed, 18 Mar 2026 10:29:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1773844151;
	 x=1773930551; bh=ZF546ExVdkQ5ArVhjKR5umS+gc+eyL+L55GnLaFRRW0=; b=
	kE7XbrDojBzfXPvloseSsh+3IqcTvHv4DXsJlS96elasH/sO24zlypLvcpx23GLl
	HH5nWOG20+UtRGGxXze6NNLpoih2/6TXuhl24QP/Axkap/1ss0km8AoYzOKDipjB
	s9OKtt9+f9VlIBuI9RsSBMJwa6vsTGdsu0mZVw5iSfYTxfl3W6q61R/SyLTrA3En
	eJuVxBhY0ZYONfQsiFzViFYk6p7uIljozQSLf1zcCDHgQOgesQ3ibpL14FYnGsq3
	SMlJxSsC5nSVECiUF0rMDqeotJRi7WdMnWh1+2q2nPSjSnyG2ubXILCWK9eTJJfJ
	2Hxdpt4yIm7zjV7cCwqykA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773844151; x=
	1773930551; bh=ZF546ExVdkQ5ArVhjKR5umS+gc+eyL+L55GnLaFRRW0=; b=T
	gdlHS2Miju98tMCtqeP5xGuBIEvYRd8Fxp1Gyohb4R8AAIsx4Wz7XLaSwiRqb9aO
	t/Gse5usS3Bh9RiHx05Os0KhSQlvY+qaLD530uUbcvaHB3JLdRFf6MggF9AREZPH
	bfnUe4LteIfJHOqauKexOTf8/S5VOMjtDkQdbjrmBNcgDKVOqH7jS5uXWnRu9wXr
	kSNKH0XbplRmPn46SJppEc+vnQNBvxRhw6NBe5mT5pLD6HIMVDN3XS/4wzo77kFp
	hUJ5o8I46vR1vPGAFhbYRwHzX+NACydOPOUnauUYNGEslyd9R6MY8KXqisNO1GJp
	UZnAgZelzVjIDt81N4iYQ==
X-ME-Sender: <xms:t7a6adCcwektrn5OIKuvP2Yp37gpTfm4PFQI1qgrHeWwH_MQNngrHg>
    <xme:t7a6aWV4oUXkXcnWYVwc1Ufki_LqHHhCTgfN3YsmKJJxDeukgP-OTdFamkWlEpzzt
    GS3ND_eHFencbTstl4CKmNgoEJupcwFPZMQT-erBwS2AlRhGASQlg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdegfeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepkedvuefhiedtueeijeevtdeiieejfeelvefffeelkeeiteejffdvkefgteeuhffg
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgt
    phhtthhopedufedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghlvgigrghnug
    hrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehfuhhsthhi
    nhhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikheskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtoheplhhinhhushifsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehl
    ihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
    dprhgtphhtthhopehlihhnuhigqdhrvggrlhhtvghkqdhsohgtsehlihhsthhsrdhinhhf
    rhgruggvrggurdhorhhgpdhrtghpthhtohepshhotgeslhhishhtshdrlhhinhhugidrug
    gvvhdprhgtphhtthhopegthidrhhhurghnghesrhgvrghlthgvkhdrtghomhdprhgtphht
    thhopegvlhgvrghnohhrrdhlihhnsehrvggrlhhtvghkrdgtohhm
X-ME-Proxy: <xmx:t7a6aT8zv2YxEl2cEKNiqgFtYZ9xMBC5_GFNNSU7T1fwNW1o7mP3kw>
    <xmx:t7a6aU6zB5hXV8QXBYFv1papV7YVgnLtlho68noEj9jAMOHYbbqGhQ>
    <xmx:t7a6aUb0sbWG4HOMd19A3BgvusBhdw1rjR3SHkkyw35hI7FAEx-lIA>
    <xmx:t7a6ae8k4sAGCmKmnoLDFjS6f2eP2GAN4KuyDLu76877lJn_cnPO1Q>
    <xmx:t7a6aRXvajgXlyT6ogHVOv1YTq_mLJRAQTYvzQDkyEHRsWrq2JJps5zD>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4FDDC700065; Wed, 18 Mar 2026 10:29:11 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Aj4MA5-83_jg
Date: Wed, 18 Mar 2026 15:28:30 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Krzysztof Kozlowski" <krzk@kernel.org>,
 =?UTF-8?Q?Yu-Chun_Lin_=5B=E6=9E=97=E7=A5=90=E5=90=9B=5D?= <eleanor.lin@realtek.com>,
 linux-kernel@vger.kernel.org, linux-realtek-soc@lists.infradead.org,
 afaerber@suse.com, "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Linus Walleij" <linusw@kernel.org>
Cc: "Drew Fustini" <fustini@kernel.org>,
 =?UTF-8?Q?CY=5FHuang=5B=E9=BB=83=E9=89=A6=E6=99=8F=5D?= <cy.huang@realtek.com>,
 "Stanley Chang" <stanley_chang@realtek.com>,
 =?UTF-8?Q?James_Tai_=5B=E6=88=B4=E5=BF=97=E5=B3=B0=5D?= <james.tai@realtek.com>,
 linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev
Message-Id: <e4c0187e-566b-42fb-920c-3cf73ed6cd6a@app.fastmail.com>
In-Reply-To: <405a9783-0f77-4ce0-8288-43eaada09cff@kernel.org>
References: <20260318114047.2804171-1-eleanor.lin@realtek.com>
 <405a9783-0f77-4ce0-8288-43eaada09cff@kernel.org>
Subject: Re: [PATCH] arm64: dts: realtek: Fix memory node unit-address mismatch
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_072913_656211_A12F2F8A 
X-CRM114-Status: GOOD (  18.00  )
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

On Wed, Mar 18, 2026, at 12:46, Krzysztof Kozlowski wrote:
> On 18/03/2026 12:40, Yu-Chun Lin wrote:
>> The memory node unit-address should match the first address in the reg
>> property. Correct the unit-address from @40000 to @50000 to align wit=
h the
>> actual base address (0x50000) defined in the reg property.
>>=20
>> Fixes: b095c27fc874 ("arm64: dts: realtek: Add Kent SoC and EVB devic=
e trees")
>> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
>> ---
>> This patch series is sent to both Realtek and ARM SoC maintainers.
>> While Andreas F=C3=A4rber is listed as the Realtek maintainer, there =
has been
>> limited activity recently.
>
> Unfortunately nothing new, likely two years ago I was also complaining
> on lack of maintenance on Realtek, but the solution is not to send
> patches to soc@.
>
> Solution to that would be to remove the platform, for example. Or work
> on maintainership.

They have already offered to take over maintainership, see

https://lore.kernel.org/lkml/3ab263bfa4904b428245152b83340363@realtek.co=
m/

> Did anyone from Realtek offered reviews to my patches posted 3 and 2
> years ago? I don't see that.
>
> Kent SoC was accepted under condition this will improve.
>
> I drop this from soc patchwork and please do not send code for review
> there, but either fix the lack of involvement from Realtek or let's dr=
op
> the platform if Realtek does not care.

As Andreas has not replied to the MAINTAINERS updated, I would
prefer to merge both that and this patch in the bugfix branch
for 7.0.

Krzysztof, can you also dig out your older patches and resend
those to James and Yu-Chun for review?

       Arnd

