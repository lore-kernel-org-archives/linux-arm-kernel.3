Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 206C7106ACD6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 18:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O3QPGH2WlRqdAb7NkXUjdb8ssG3QHNvfm3I1BvJyDjY=; b=GWaYgPBpAPcOWEZ9cO+/oOugVz
	ZzBIZh/XWk9WtaRqa/PSVS1lLh2mfEpKyuav/uJ7fmHF4N3jYHFkpvwX49155s/3bJktnlaIZGR2M
	Bol1VtQIbc090WaP4dGA1tGPyi2Jdfk//1ewOexuWVk5FZnnrdMsdQYMQFkpgPS4lAkzY+t7bJo5K
	ikAI3jHQUnugSlrFKSiTHM6gE0elqgMVdxJA4imVcefXviU9j36IvMqgvVbGfZ9y89Z8NhYvn3sm1
	XWl6x/pnCs6dMnblUtCfcCuqhKVC8Qj6vhfJ0z4gBYqleA5fxYosjGkznKHLiU8q9e1UGIpGpqEnm
	UvpNevpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0kt7-0000000EuQI-0aDp;
	Thu, 12 Mar 2026 18:36:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0kt4-0000000EuOw-1FVx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 18:35:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1F0A141B49
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 18:35:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C6C9C4AF09;
	Thu, 12 Mar 2026 18:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773340556;
	bh=f0ZimfGbQPBnbAQ7OvTTb30QQF/vnBQr3IOLZihzVJA=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=bg+Aj46CYyIjYm9nmhEDyxLSroiQxXAbURXjtfU+DGHz0qDus/Qnd2LGvZ8BYkmAa
	 9vER0hw8kuhuO0SPDtx1qWN7K8HKwZc+DdnXhMgYcGzVQho8J4Sy4Axjn+bY2IkSYA
	 yoVnL4o7BHis1OMJ/g3ZNsfjPuN9EVravXuTH5XJKgzbbB3usGH7UIBdyvpaJbSvqZ
	 stx+b7Icbxe9OFZa9gl0akdnCP+eOMB6o9bFaW4sysY/CMivGgvnurcliyOVfKWa1X
	 R+QMkHlTS09m6wTu11+d5iw7vwiG9+F0Eak572DszpcAFwbPEIVe1EA7EbdD2YhXCP
	 6tZq+gqnacplw==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 45196F4006C;
	Thu, 12 Mar 2026 14:35:55 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Thu, 12 Mar 2026 14:35:55 -0400
X-ME-Sender: <xms:iwezacee8tVcHbQdjMkUTZELWa9ZeaOICgqWz_d168pxnrXmcSe3FA>
    <xme:iwezaZA499_sID95CH1V71r9aDiWk5F8x9POoRuVBrXyiznZxvoYBoXaHOkI56FfM
    -_GW6hDfWfrmTGjJWiwb8WNmdrZh-q4_NVm25smBBXvUe-mmnfDPA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvkeejheduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrugcu
    uehivghshhgvuhhvvghlfdcuoegrrhgusgeskhgvrhhnvghlrdhorhhgqeenucggtffrrg
    htthgvrhhnpeekvdffkefhgfegveekfedtieffhfelgeetiedvieffhfekfeeikeetueeg
    teetteenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghrugdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqudeijedthedttdejledqfeefvdduieegudehqdgrrhgusgeppe
    hkvghrnhgvlhdrohhrghesfihorhhkohhfrghrugdrtghomhdpnhgspghrtghpthhtohep
    udehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegtrghtrghlihhnrdhmrghrih
    hnrghssegrrhhmrdgtohhmpdhrtghpthhtohepjhgrmhgvshdrmhhorhhsvgesrghrmhdr
    tghomhdprhgtphhtthhopehmrghrkhdrrhhuthhlrghnugesrghrmhdrtghomhdprhgtph
    htthhopehkvggvshgtohhokhestghhrhhomhhiuhhmrdhorhhgpdhrtghpthhtoheprhho
    shhtvgguthesghhoohgumhhishdrohhrghdprhgtphhtthhopegtmhhllhgrmhgrshesgh
    hoohhglhgvrdgtohhmpdhrtghpthhtohepqhhpvghrrhgvthesghhoohhglhgvrdgtohhm
    pdhrtghpthhtohepshgrmhhithholhhvrghnvghnsehgohhoghhlvgdrtghomhdprhgtph
    htthhopehpvghtvghriiesihhnfhhrrgguvggrugdrohhrgh
X-ME-Proxy: <xmx:iwezaQZI6XY49JZxSekMUfYkQvRa6i12xbFwnnJYfl8LFHnt785AAg>
    <xmx:iwezaa0y-OzZnj0D_-l4CTxzG3CMO65M-GN_92kkh8iAJL5-P1YB1Q>
    <xmx:iwezacAG3DTHGK4AWwinlYfCENA5TZ159LD8c-Tak-WokBxb3FvUTg>
    <xmx:iwezae_SaRwOKC9yHAADpJ-S2tbfpww3p5ehISdv1bYsFOxLELVIjg>
    <xmx:iwezafX5yEPhtyzARs5OSmnSS7-uFJ4zODYVH5WcI_wD6dg3zy3LsnGb>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 1AC38700069; Thu, 12 Mar 2026 14:35:55 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: ABOARHXOdhSZ
Date: Thu, 12 Mar 2026 19:35:34 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Carlos Llamas" <cmllamas@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Mark Rutland" <mark.rutland@arm.com>, "Quentin Perret" <qperret@google.com>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "James Morse" <james.morse@arm.com>, "Will Deacon" <will@kernel.org>,
 "Frederic Weisbecker" <frederic@kernel.org>,
 "Peter Zijlstra" <peterz@infradead.org>, "Kees Cook" <keescook@chromium.org>,
 "Sami Tolvanen" <samitolvanen@google.com>,
 "Andy Lutomirski" <luto@kernel.org>, "Josh Poimboeuf" <jpoimboe@redhat.com>,
 "Steven Rostedt" <rostedt@goodmis.org>
Message-Id: <83c36b0a-7e7d-4651-8e2c-86452c3bd96b@app.fastmail.com>
In-Reply-To: <abL_ulvlC9JT7Zgw@google.com>
References: <20211105145917.2828911-1-ardb@kernel.org>
 <20211105145917.2828911-3-ardb@kernel.org> <abL_ulvlC9JT7Zgw@google.com>
Subject: Re: [PATCH v6 2/2] arm64: implement support for static call trampolines
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_113558_384826_473290F0 
X-CRM114-Status: GOOD (  20.26  )
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

Hi Carlos,

On Thu, 12 Mar 2026, at 19:02, Carlos Llamas wrote:
> On Fri, Nov 05, 2021 at 03:59:17PM +0100, Ard Biesheuvel wrote:
>> Implement arm64 support for the 'unoptimized' static call variety, which
>> routes all calls through a single trampoline that is patched to perform a
>> tail call to the selected function.
>> 
>> It is expected that the direct branch instruction will be able to cover
>> the common case. However, given that static call targets may be located
>> in modules loaded out of direct branching range, we need a fallback path
>> that loads the address into R16 and uses a branch-to-register (BR)
>> instruction to perform an indirect call.
>> 
>> Unlike on x86, there is no pressing need on arm64 to avoid indirect
>> calls at all cost, but hiding it from the compiler as is done here does
>> have some benefits:
>> - the literal is located in .text, which gives us the same robustness
>>   advantage that code patching does;
>> - no performance hit on CFI enabled Clang builds that decorate compiler
>>   emitted indirect calls with branch target validity checks.
>> 
>> Acked-by: Peter Zijlstra <peterz@infradead.org>
>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>> ---
>
> I'm starting to testing this out on top of 7.0-rc3...
>

Please use the v3 I referred to on the thread. The code patching is a bit hairy, and so we should only consider that if there is a real use case for it.

Same goes for the special handling of the ret0 case - AFAIR, the v3 handles that transparently as it will just use the generic RET0 handler as the target.

...

>
> A CFI crash was reported in [1]. Also, I was able to reproduce a CFI
> failure with just a simple "linux-perf" command. With this patchset I no
> longer see these issues. Awesome!
>
> [1] https://lore.kernel.org/all/YfrQzoIWyv9lNljh@google.com/
>

Awesome!


