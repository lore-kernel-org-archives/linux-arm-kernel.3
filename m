Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57617CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 12:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yRMyPUn85xb1e1aoe1yrRXBbPWGVjgqZhwJSFEvzvuU=; b=H6SN/IBz3R9WDqK7jhR8I1b6op
	i1hSBoSrlC9hPq5QlXcpuUzUevDUnQAUAMSRw5KvNroq2EFbayD35xcWyGqpFBcAfbZj1hsker7tE
	GHpAW7o1OhQwGTsOcdbl2UFY2GQEgBmcWQrsxqTdN87YQJnQawND+Xnzt5Bq09wdYZTYib/Ej8iAu
	pQ5qwFcMpJCtghP80IsorVazrEY1WV8loG4tsPqOioUDcHLtgKsMqb6oMcNeyM/gmiCTHxDPqXsa1
	j2UtFzfHJk7Pm311vnaJ6rX2ol+oqgwBPLPxGSi0pYP6JJmTz++WgoSHcLPqNWtVTPNALoSkBkQJ1
	WprbEugg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwJjQ-0000000E2oM-21xD;
	Wed, 10 Sep 2025 12:15:24 +0000
Received: from fhigh-a6-smtp.messagingengine.com ([103.168.172.157])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwJjN-0000000E2ml-0MCV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 12:15:23 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 6397B140037D;
	Wed, 10 Sep 2025 08:15:19 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Wed, 10 Sep 2025 08:15:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1757506519;
	 x=1757592919; bh=yRMyPUn85xb1e1aoe1yrRXBbPWGVjgqZhwJSFEvzvuU=; b=
	ol4bsgS0gAucAgfBetATpbUq1DVhq0A2msg3kRCmHRM0vTFnGsRZUZPgZUFcGvfa
	631bOzB2OkXKxaX3cQCjpccSlbZB9lgckWy0tpWCkRuRv26UBRkLF/DmFa6p1MlY
	Vtqek3+MfQLVn/lo/JWN6wB0+WuiiGWkqKxi77syWLPNDxWuRIAVyv5kCgkXZ60F
	wUHQMvfoOB/WYofWx2pL9lvlC2Vq+krEm6NiIHjUXAj3fHzLJnAHRlOXrdzpGlN3
	AP88BzohD9RWKWfsSDUjXBIXwWSRr87rJAcr/Ss06o+pMjHTBfgHpOckyuZUFwpu
	TfqjA+rHTj8qAwVWd9Mk4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1757506519; x=
	1757592919; bh=yRMyPUn85xb1e1aoe1yrRXBbPWGVjgqZhwJSFEvzvuU=; b=P
	BaSyUWbdWQu9ZAWkwqfPRWgp/P1abbgbv0SFjh6zpd1KLfqDk78ZMdZy+8/B5xBt
	wBprAZETB/h/4BwCubAfKh4FrGVSvRYE0dsaJuIfjPSIwEKyLc687FTmz1JszerI
	UOMPhTkIYtA/UCOxIIAA0xSbeJSLhtBKlr0SltgXg9Tnv65zqyHOXVK8fcMgn2Nz
	nRmPBxMyaqtzJQYbfaO2ILlHJ6f4gAd2tYpNPS1YcVooGphIN8xFOAfMIH9d9g1+
	JA7SIasDCvq4i514LnTAVFlBs5taXLf4f6jWH7MBDmHg2Iizz6I0u3n/Rl6kOZ4M
	7kyEGKF0xG4K1n4fxlhxw==
X-ME-Sender: <xms:12vBaNkjCJkhVYlYIuUh4aAQdomTDth3b2lzocKO16-nUyTJlLVwJQ>
    <xme:12vBaI1VrvrgQPYFs0ysvFEs5SzYhnMyWi2ZcwyL1hF6eggdLpX8x2HVIWaBxFv-W
    MvpTBXG_m96b3uYdC8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvfedviecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpeefhfehteffuddvgfeigefhjeetvdekteekjeefkeekleffjeetvedvgefhhfeihfen
    ucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghp
    thhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhinhhugiesrghrmh
    hlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopehrmhhkodhkvghrnhgvlhesrghrmhhl
    ihhnuhigrdhorhhgrdhukhdprhgtphhtthhopeifihhllhihsehinhhfrhgruggvrggurd
    horhhgpdhrtghpthhtoheplhhinhhushdrfigrlhhlvghijheslhhinhgrrhhordhorhhg
    pdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrh
    gruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdr
    khgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:12vBaA0bSs0aAS17JI6OOHpLFmsToy_PTG6FzNdrpqgFPx_nrO1qgw>
    <xmx:12vBaO4GjHpAD52DyrxRnl-igKCZtpQGXkUTJXnt5HhymmKH8DV95g>
    <xmx:12vBaB8njhXySF2Q7xZx7AW59oxivJeIj7WxG4OmSXRqtGnF2yzMFA>
    <xmx:12vBaNXdGkvwLqYbufbueFeakBxwrqz7F8q5--Q0d9VGuMstw50ksg>
    <xmx:12vBaIvdIgi9uICef38tR01-COmscAgrLyeuaG_Z7RKoI9JwfM_HDe95>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 0CFC270006A; Wed, 10 Sep 2025 08:15:19 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AdnDL2dhGsVg
Date: Wed, 10 Sep 2025 14:14:38 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Walleij" <linus.walleij@linaro.org>,
 "Russell King" <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Russell King" <rmk+kernel@armlinux.org.uk>,
 "Matthew Wilcox" <willy@infradead.org>
Message-Id: <7dfbb373-fb44-48d1-9880-747faa47e079@app.fastmail.com>
In-Reply-To: <20250910-arm-remove-high-pte-v1-1-d0899882815f@linaro.org>
References: <20250910-arm-remove-high-pte-v1-1-d0899882815f@linaro.org>
Subject: Re: [PATCH] RFC: ARM: drop support for HIGHPTE
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_051521_202206_698F7FD2 
X-CRM114-Status: GOOD (  18.92  )
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

On Wed, Sep 10, 2025, at 11:47, Linus Walleij wrote:
> Matthew Wilcox suggests HIGHPTE is a burden for the
> kernel MM, and only one ARM system (vt8500) is currently
> using it.

I think the vt8500_v6_v7_defconfig entry is a historic leftover,
instead it is currently enabled by default on all configurations
that enable highmem.

> This deletes the use of HIGHPTE in ARM32 clearing the way
> to remove the feature altogether.
>
> It was introduced in commit 65cec8e3db60 "ARM: implement highpte"
> in 2009, so this RFC is intended as a discussion item to
> check if it is still a desired feature 16 years later
> or if we can get rid of it.

We discussed it last year in the context of the PREEMPT_RT patches, see
https://lore.kernel.org/linux-arm-kernel/20241210160556.2341497-4-arnd@kernel.org/
and Russell's reply to that.

I still think that dropping it is the sensible tradeoff here in
the end, as it should allow further simplifications in the
pgalloc code. Your version of this patch doesn't (like my
identical patch from December) actually do any of that though.

> -	pte = __pte_alloc_one(mm, GFP_PGTABLE_USER | PGTABLE_HIGHMEM);
> +	pte = __pte_alloc_one(mm, GFP_PGTABLE_USER);
>  	if (!pte)
>  		return NULL;
>  	if (!PageHighMem(pte))

At the minimum, PageHighMem(pte) is now know to be false, so
this could be further simplified. I tried figuring out if we can
remove __HAVE_ARCH_PTE_ALLOC_ONE altogether, but I'm not sure
where else the clean_pte_table() call on arm would happen.

   Arnd

