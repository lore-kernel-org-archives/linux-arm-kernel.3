Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C61F8108B912
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 12:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AM4XQ1gi0aqqWZVZWPbf2i8SgaoTIJ7v+bCl2iTaKq0=; b=Ov7sfqDC8h5wY230j5WxUAlLBH
	SIT+Dmy8QFwsMh6I8KmpWD9unmDupVf5O5jgoBN9g4zk5PYY1Fr3QEcklP44OVztPxz8rzjv897ZG
	9F4I/aRlMIW7kikm9u0rRolxxi5MBDPCu1G1IvxtiOYoodS+3TlNZPj7+wMo+e1Wxvqql2i2Fakmj
	cae91dPuM36G6/L0dAZby0MNrLGbT2UWZyx6pf5DR3dIcfWVhwoTM1oZJrE5dfdRt7NCyr1Q9TIHA
	1mQWzN6qgR+2YlXJOGKGU8/hxllbUOfOCuSZVVT37U45N7PnHVf1BEd06bPkJ9a8iRUKDq3eiiZHw
	HL76hIFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Yp8-0000000CjrY-2E46;
	Fri, 20 Mar 2026 12:19:31 +0000
Received: from fout-a7-smtp.messagingengine.com ([103.168.172.150])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Yp5-0000000CjrE-25Py
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 12:19:28 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id B105DEC00EB;
	Fri, 20 Mar 2026 08:19:25 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Fri, 20 Mar 2026 08:19:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1774009165; x=1774095565; bh=AM4XQ1gi0a
	qqWZVZWPbf2i8SgaoTIJ7v+bCl2iTaKq0=; b=I4uCp/nJz9JgLyyrCSytgZEGud
	98er5DBX0BOgFn5aicOB5mTPZ1ejUJ6HWxocvlRyUCsYRTf+sAzOHxcz5nkPbcjq
	BwnOb+tM29ZhmQ0AIWyTFDUjzkCqrDWKg3zwDGwa3qR3BBL437yCnhXOj+m4H4p1
	Zdo1b/B9wGrOn0iH6Ke8K5Y6p3cba7HAS8pbRjVA393xN7nnBMZBF3nKANjs2Ni/
	9H7ISgGlTRrVGoLr6qG8pZ0cMHfB7AxUJq2N8XH6pF/jTS/z/y6lE57r4Z0WcXyG
	MjMvpAqNx8J08BGrvZqGuEvcTDJEq2OP7vvIoZ0Oy3ipt9md9RyuiZb6Iivg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1774009165; x=1774095565; bh=AM4XQ1gi0aqqWZVZWPbf2i8SgaoTIJ7v+bC
	l2iTaKq0=; b=AmVZitQ24SFBerKmkwh30HTfAgNPbiUQQuLG9O83ZIdb4P4eJ2u
	8Ief7TyCPrd8OuabEs0h//kAWy2UAJvcYr5wqsc5/wcmE6yQDn11VC/Xl+q14C2C
	sXarNSFiICxvxgHGFxnSPAOzCD/iwXLaqXtTKzLHKyTNIsCxEBXfUU2aAGWmqY8i
	2viBZkwBeO7cdsAQGKKp7h5EWvKA9+f6+ZAbT8C3VW1RgkPzdfO3/Vgw/2tR3CkL
	wTnz1R2w+qK27/qxOOfbSknvquceyLQLLwEnEeFkNPX9kqVKFyJjiAkiZWhiShDQ
	qBkh4K2iOwktOdCqhbYWS+bmFVnsZaG/ghg==
X-ME-Sender: <xms:TTu9adkNeQg-sQemO9KdAw1HShl_BvwDYbXKH7TktmMTWR7UEMjUug>
    <xme:TTu9aRDseRJ-mp0Zv390eXNBW12hsrPVQtCSdWItqLqMuAY_pAqzdSpLgkOw4XX9o
    SRming443JSBP7KZ3BGU8OKuFTRPz1eBgShi50_zr0BR0dI1sZlf-Xy>
X-ME-Received: <xmr:TTu9afOkOnBIHZMv6LZyTVJ9Zr3_BTcvVaI14c6J7EhI1BWXrRv54Ji1MbaynVVfhblIkS9wcGBOhlWJJEdIO-clbMOsDV99zLU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdelkeekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomheplfgrnhhnvgcu
    ifhruhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtthgvrhhnpefgvd
    ffveelgedujeeffeehheekheelheefgfejffeftedugeethfeuudefheefteenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjsehjrghnnhgruh
    drnhgvthdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehkrhiikheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhvvghnsehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehnvggrlhesghhomhhprgdruggvvhdprhgtphhtthho
    pehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopegrshgrhhhisehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoh
    eplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdho
    rhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorh
    hg
X-ME-Proxy: <xmx:TTu9aYMTp6Utj6KIChRAJAV_QB0wVqmDLgKoyeo0m4cMGsDPepHFoA>
    <xmx:TTu9aXlEvTHxn8MZJVYrxfgUofMCJfR4WRLJiZ-arjAstMuD58x5PA>
    <xmx:TTu9aWuwiz3Pjt2it-gye4vSZNl9EwY6X612R63mjVjE1eGICFaSCg>
    <xmx:TTu9aapaafGvdzOfag0rNlqax7AfDZDDNjuJRXy5kyAWip3BlLJPlg>
    <xmx:TTu9aRw54lImwoyF_Bfh7NtAUWWtH7UGVNy-bq16YMC8-bfO0X2VuvZ6>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 Mar 2026 08:19:24 -0400 (EDT)
Date: Fri, 20 Mar 2026 13:19:23 +0100
From: Janne Grunau <j@jannau.net>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm: apple: Add M3 (t8112 and t603x) devices
Message-ID: <20260320121923.GA355325@robin.jannau.net>
References: <20260319-apple-m3-devices-dt-binding-v1-1-12052e195d6f@jannau.net>
 <21f2e3a2-ae8b-4997-a3c4-bb77663c04e8@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <21f2e3a2-ae8b-4997-a3c4-bb77663c04e8@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_051927_939299_6B53165C 
X-CRM114-Status: UNSURE (   9.67  )
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

On Thu, Mar 19, 2026 at 09:11:52PM +0100, Krzysztof Kozlowski wrote:
> On 19/03/2026 15:57, Janne Grunau wrote:
> > The Apple M3 based devices follow the pattern of their M1 and M2
> > predecessors. One notable difference is that the M3 Max SoC has two
> > variants: t6031 and t6034.
> > t6034 has 14 CPU cores, 30 GPU cores and a combined 384-bit LPPDR5
> > memory bus while t6031 comes with 16 CPU cores, 40 GPU cores and a
> > 512-bit wide LPPDR5 interface. These are the only apparent
> > differences between those two SoCs.
> 
> There is no user of this in this patchset and your commit msg or
> changelog must explain that. We don't take bindings without users.

I have a series adding M3 device trees for these devices. I
misremembered your feedback from the M2 Pro/Max/Utra submission and was
planning to send dt-binding updates and the device trees using them
separately.
I'll send them as single series instead.

Janne

