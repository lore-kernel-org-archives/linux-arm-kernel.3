Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E68D358E9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 09:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6tkAJ1VNKcpkKOmtP9ageLa5WT+NQEXtWiLoFdNkorA=; b=K7AZ3AAY8uqMFxjn+2NRuRMC6Y
	u2Cpej/FaFKdOvHhP2XWRIdWEw7UAs+5Vfx6rdtEMI02AI+WGwezg91xjGRWKzyN5cZVE21wQeZGE
	bFznIZMtciKtrf2chycQ0Ykze1jw17jfsMZwN5eQiT0EhRvInVPxr++XNSN1BlosF660Osy3dcxvI
	ag6hQu6ZsxFGXopJ8z6h7rxGfw60m2U6i5ZJcPB0pHpX72hI5XHqm1jkCnCGFLo1rzS5gQYjD2ApT
	TRm4LRz/efVKex46FKDV30+St/ldgvUK3ji5wcGYfOTVlFm0M7/7mCaVizJWa6H98rHlKswwZ+Tz1
	07cmynng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlOJT-0000000HVsO-2qFZ;
	Thu, 29 Jan 2026 09:27:43 +0000
Received: from fhigh-b8-smtp.messagingengine.com ([202.12.124.159])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlOJR-0000000HVs1-14Tr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 09:27:42 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 6B0D97A00E0;
	Thu, 29 Jan 2026 04:27:40 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Thu, 29 Jan 2026 04:27:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1769678860;
	 x=1769765260; bh=6tkAJ1VNKcpkKOmtP9ageLa5WT+NQEXtWiLoFdNkorA=; b=
	mk7EmT55+C3focsHhzjORWWe2eCKCd4Lm/eVZgfKwp719O8Hb4gTIfkcusqEADEs
	+c/htrdpB2HjwYGTX9JnAN9CQWjwkYR/E5e1QHRwZpB2Eb5uCXjLxiA+huz0GmSL
	pjHiIthofYyFmGc+Z/PRrqoMNjKdiWpUyeWRfKG+C36AAckRP+vBlHKO7wNHATpt
	KlsZbh13SR3mAR5u83j4n9DpLxjXGpyaW8KyWH2SAyUfxZU8VFpj8PNE5VBVJ5W3
	A6WIu1K2yrCK0oRaDFvwXgwHwf/Gsp6RcWlouD9jQb5bWDLF7+a6RPaG4gP+EIb5
	fymnEwlBjVaFm2WrKE66Ww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1769678860; x=
	1769765260; bh=6tkAJ1VNKcpkKOmtP9ageLa5WT+NQEXtWiLoFdNkorA=; b=p
	UQxVRhFNuGics6yIjIdGWtqeXh8PAUw1zMeZaJvnT2PFLt+l41FZcs9yGC9kI2EC
	eoUYxI6zkEQLH/v5X+9ry+OBzyOHCMNMV+UZbf7U9QhNtR4bUdsfiO/Lf9R3B1ZQ
	oU0gpeoOuKpAZJxRPQh8GEbuK8m6loauZebjXvfM5AOD5BhnQVN6PEjPj5KCTV+l
	NoRhxK1EsK1uM/GF5tzyFuR8WU2yXTOCM8zrUw5iHh0UzK3pVkMzr9DnyBvBPUSz
	lfsUDEJNf0UR+zfVsSQbPMM6He5ighkcemBvggnXgBsKN2zgw/nU/i22emYsppNN
	9tVeYjsih+qxJ8lKnYeog==
X-ME-Sender: <xms:DCh7aT-YVdAviji5r54HeQ_tTtbcitNwVR-9UCEM4mmu_JAeYckEBg>
    <xme:DCh7aahA3XKBeZgRkw79KI65QTNw7AsChO1xm0h1cwBvAAJhgekUHp1vBJGOb9bQH
    4of-TjXac3z60G6MjYzEDN20wyMufXj7E8hdDPTEcs5NVsYPARxjhw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduieehkeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepfefhkedthffgtdffheekhfegvdfgvdeukefftdfhheetieetkeeuueeggeejvdeu
    necuffhomhgrihhnpehpvghnghhuthhrohhnihigrdguvgenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhn
    sggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehsohgtse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlhes
    lhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehkvghrnhgvlhesph
    gvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepphdriigrsggvlhesphgvnhhguhht
    rhhonhhigidruggv
X-ME-Proxy: <xmx:DCh7aXlLql_7mFB2d9hKF0d1_5PBjgfUcJdfVSKoeBkxtzVbdwOmYg>
    <xmx:DCh7aYrm_BXQ2v5eGrRrNb_uBtbZkJtPINcVZLHOAQhtvMvwwPhYpw>
    <xmx:DCh7aYFaR3QS7Vgirr8xh-d_Uk28GKG42ZQFk9ZCGTkbIaAhkg5uQQ>
    <xmx:DCh7acy8MzkNXk5o47S6-pzXB5yNy3Ze2TQReywOIbYt3SNf_VjZLg>
    <xmx:DCh7aYo6nUJUgJD-asnwUXdFrGUak2zTvBLMxCBTX1pGTDJWttAi6qRn>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 15CCE700065; Thu, 29 Jan 2026 04:27:40 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AUiDU-RBgMOg
Date: Thu, 29 Jan 2026 10:27:19 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Philipp Zabel" <p.zabel@pengutronix.de>, soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>
Message-Id: <4748311d-5d4e-4d69-aec6-cc4829466598@app.fastmail.com>
In-Reply-To: <04afe35d-260a-4ff7-a06b-1fb79b553917@app.fastmail.com>
References: <20260127102237.3945322-1-p.zabel@pengutronix.de>
 <04afe35d-260a-4ff7-a06b-1fb79b553917@app.fastmail.com>
Subject: Re: [GIT PULL] Reset controller updates for v6.20
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_012741_412505_77889411 
X-CRM114-Status: GOOD (  11.91  )
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

On Thu, Jan 29, 2026, at 10:22, Arnd Bergmann wrote:
> On Tue, Jan 27, 2026, at 11:22, Philipp Zabel wrote:
>> Dear arm-soc maintainers,
>>
>> The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:
>>
>>   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
>>
>> are available in the Git repository at:
>>
>>   https://git.pengutronix.de/git/pza/linux.git tags/reset-for-v6.20
>
> Hi Philipp,
>
> The git server appears to be down, can you figure out what's going
> on or upload the branch elsewhere?

I managed to pull it on the third attempt, so no need to publish
the branch elsewhere for now, but the server is still struggling.

    Arnd

