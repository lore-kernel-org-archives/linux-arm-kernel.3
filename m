Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03146F99344
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 09:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z9tx6ZvhNSiMNEaTpNc5/0pp6weDgLIpQjhkq9TEAHA=; b=r1YApiQoWcv5vnSBoQiUyK+HGs
	gPJOw/StIo1FGp8V/TqIH1U3DEnXI80ABI0oknk2ysQHm8MtaiHrZkfvwyWnppPZxSa/ibaLG2EO6
	LvU5deoxDmpt9SFWp77VtEzteV8EWdEEUxscPsLGgenJdHKuB2/pm1lXD8TRW/mlwkqdEzW6M87b9
	aGH7pCUep50co/qSFpA5CkI8S3ThWLchDUgpVwWkvXUbJuO5YhobDP/t5/qy8D3YIL+OpCMw7hUlD
	m/X1VFmBswHnFR3jsg688eI5ycFgIh2b9VrEgzBtNGJ07XmaBsJDQok0vzqhAmUHDop1PrNUcXv3l
	L8ry8JeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFqJe-0000000BNqf-3s0D;
	Thu, 23 Apr 2026 09:25:46 +0000
Received: from fhigh-a5-smtp.messagingengine.com ([103.168.172.156])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFqJc-0000000BNmG-1Z2N
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 09:25:45 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 028D61400045;
	Thu, 23 Apr 2026 05:25:41 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Thu, 23 Apr 2026 05:25:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1776936340;
	 x=1777022740; bh=z9tx6ZvhNSiMNEaTpNc5/0pp6weDgLIpQjhkq9TEAHA=; b=
	iEZyMvGIHgW0wj540ctrSrmH52Y3LiFnvXZ0w179IrIcCrd5Rv/AK38ZCLJeULtd
	1dSFpX8TVeQkzFc8gEuCb4eUuCg0ZFSG9C0SW/hSaxEJaOwKKwJhd1NCCWiX2lCm
	l7e9FY9LQu2b4Ws8A9P83eN2ueSch2CwTYmr5y4ToVpUMaO9qL4HD5EOSfS6r5Ce
	9tDP6F9TnNd+Le5mdqushynF0BfEQK9XWiVBJJPIzRZ/GF2mDnwQx2c4V4rkbZ46
	fAh3Gwjhi2CoO9gZnZtjDQtnyi3IostY0X0wEjp8o4R9UtJuXmoSaapgp+FUF30P
	phq6mno/ZYMb0DjrTynEsw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1776936340; x=
	1777022740; bh=z9tx6ZvhNSiMNEaTpNc5/0pp6weDgLIpQjhkq9TEAHA=; b=K
	AqTdNDGCYbSSaooC1WMGi/4m/sgcT30E5y70WInZ+SctyYCX/WhOVcZF4SKfT9Hd
	PA7e1XA80K87wgf8J4UmlseTHpVjMU2rzesjNEqUkZ1mAx2YAQYAhQU8YCFMKpjO
	YcBNKho6hubSWCQAKnU7aqRDwYQyW6am6AjDSNTDOsd2vWRjwVb5zIiZc9kn2qs6
	GMpP7SFKvT7ddiEve+98Wt8yiWAz/G62zqUP1WKX/1BPOEPCht5xgS6EhL0xU3ZM
	PAHwTcoC/3w7MXn8KE7JLPfgg+t0qdOGYZGsnr2pFdm18JDrHlY0ZZYk3ya3E1U7
	oJ8vedgtLcSZ91uZuk5eA==
X-ME-Sender: <xms:k-XpaQWqOSmoclfETIPLIaQGTVIszlkVWN83g5PMBs6co3U_K50SVA>
    <xme:k-Xpafa1eEqyM7exW0A6TyietSsHMjNJ4Ptx-IEQJxJASoyKgn_AdELcqoWL4okW7
    gzbbyEnyKqkn2N_UQX6cQ0g2TIdaDRR-QC62IpBqy7OxhPna30JhA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeiieejkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopedufedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhope
    gtlhgrsggsvgdrmhhonhhtjhhoihgvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepjhgv
    rhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepohhvihguih
    hurdhprghnrghithdrohhsshesghhmrghilhdrtghomhdprhgtphhtthhopehhvghrsggv
    rhhtsehgohhnughorhdrrghprghnrgdrohhrghdrrghupdhrtghpthhtoheprghrnhguse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopegvsghighhgvghrsheskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepfigvnhhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlih
    hnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-ME-Proxy: <xmx:k-XpaZkeh8LZUlhOkuLRTJa9THvDRelog_gvESb_Jw_fq4fVuNHfDQ>
    <xmx:k-XpaRP98VxKbHsoICfZMZdhqLIzsX1RQ5iqSTMqeNKPsDNtdOP_bA>
    <xmx:k-XpaUFkpwaWHJJiOrn2xcyoshHx1ofThKCCmCWh_8NodeNKtFbqBQ>
    <xmx:k-XpaXsqeYoYd2hjD4q0m1roD1hSjjRSOaKB19ID7I39ihMiLngFkg>
    <xmx:lOXpaQgmXkFLegwy3zTA8NrheDJSi4peEVaNe2WnGjdtUbSa4_f-uXfJ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 92CC5700065; Thu, 23 Apr 2026 05:25:39 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AavW3N6gTEK7
Date: Thu, 23 Apr 2026 11:25:19 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Herbert Xu" <herbert@gondor.apana.org.au>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: "Corentin Labbe" <clabbe.montjoie@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, "Chen-Yu Tsai" <wens@kernel.org>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Samuel Holland" <samuel@sholland.org>, "Eric Biggers" <ebiggers@kernel.org>,
 "Ovidiu Panait" <ovidiu.panait.oss@gmail.com>, linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Message-Id: <1cd6ddc3-479c-4cbf-8315-78bc53ac3a54@app.fastmail.com>
In-Reply-To: <aenfmxOvtHaAODqH@gondor.apana.org.au>
References: <20260423065600.2081989-1-arnd@kernel.org>
 <aenfmxOvtHaAODqH@gondor.apana.org.au>
Subject: Re: [PATCH] crypto: sun8i-ss - avoid hash and rng references
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_022544_823530_EF25E6BE 
X-CRM114-Status: UNSURE (   8.26  )
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

On Thu, Apr 23, 2026, at 11:00, Herbert Xu wrote:
> On Thu, Apr 23, 2026 at 08:55:42AM +0200, Arnd Bergmann wrote:
> Does this work?
>
> 			if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN4I_SS_PRNG))
> 				seq_printf(seq, "%s %s reqs=%lu tsize=%lu\n",
> 					   ss_algs[i].alg.rng.base.cra_driver_name,
> 					   ss_algs[i].alg.rng.base.cra_name,
> 					   ss_algs[i].stat_req, ss_algs[i].stat_bytes);
> 			break;

Yes, I can rework the patch that way. I had considered this originally
but decided this would end up less readable in this case because
of the extra indentation level. The drivers already has a lot of
#ifdef checks, so adding more of those felt more in line with the
style used here.

     Arnd

