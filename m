Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A109C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 10:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0leDRVdwoOJeubU9do3QSHfmj15v/lsQAgb6QNAwj4s=; b=CJ5Ow1MBjzi6XylSAHtZwcSWeo
	a1HRvM9Qb2KLG8Lzf01a+JPIZH3HHhjNh6PHk5MWQJhOtCPEIL827u8WP40OgkYvQkBwXab6zyBb1
	o0B5IM0EoUvIZ06YUocpn8Eu607QZXUn2VWUsm3ucOS+0eoQe0Ttgkkh8iNvyBRzU4hDBNlpwbJoI
	D16QMb+YeR1ZI8OnX71YKpTOJ39KG9OLoflT8MCF9L6glDjiXQc0A7/AuMkUUrRd3VYlpzbTCyn/D
	DpPMLTec6nBmle2wFdF5SRxioWVkXgDsW8swH0xSmL2N3y8iyuailm+nMBQOIUkhK6nNX9T7NTHv9
	iWdvoCfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thnbh-00000003Mps-17wY;
	Tue, 11 Feb 2025 10:35:09 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thnaG-00000003MeT-3el5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 10:33:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A4392A4024F;
	Tue, 11 Feb 2025 10:31:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD89EC4CEE7;
	Tue, 11 Feb 2025 10:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739270019;
	bh=PquzBB/oX7egHymBp+a6B/TaN2ihpzSc+j9dImCu2IQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BQHS5bOKvoiVMPGh7qf8LYf4J9+tJWgM8GbiFoUwZLrDAKub6cdlgLNUzhT1kU4YN
	 4ocP9I5pp1pMbnKBAzuFLhs1S+lXy5h+k6Bx5ohEa9P3sVaBv/WwXgklP7kfUwFpJ6
	 duSrPvzOGEJJvwoxqI8Z9YN6vS9qjfypf1xuY55rmm/ulzPehfjDYv30KeNrEX760R
	 PObIad9+Gsij7RfvEJ0/l4cJcjLYaRG6su/s1q1a6V1gq4Jcg+kHWRgTtVvDHYsT8q
	 3RiAbclp1tfY2e4Y6oGlTfpaV6ZRNJq5JYu+Hb/oLGHGw69iQQgG17gSdr5eZyesWA
	 kR4LDQQ59QSOg==
Date: Tue, 11 Feb 2025 10:33:33 +0000
From: Will Deacon <will@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@lists.linux.dev, stable@vger.kernel.org,
	Matthew Maurer <mmaurer@google.com>, Ralf Jung <post@ralfj.de>,
	Jubilee Young <workingjubilee@gmail.com>
Subject: Re: [PATCH] arm64: rust: clean Rust 1.85.0 warning using softfloat
 target
Message-ID: <20250211103333.GB8653@willie-the-truck>
References: <20250210163732.281786-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210163732.281786-1-ojeda@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_023341_042309_2A8E1062 
X-CRM114-Status: GOOD (  20.48  )
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

On Mon, Feb 10, 2025 at 05:37:32PM +0100, Miguel Ojeda wrote:
> Starting with Rust 1.85.0 (to be released 2025-02-20), `rustc` warns
> [1] about disabling neon in the aarch64 hardfloat target:
> 
>     warning: target feature `neon` cannot be toggled with
>              `-Ctarget-feature`: unsound on hard-float targets
>              because it changes float ABI
>       |
>       = note: this was previously accepted by the compiler but
>               is being phased out; it will become a hard error
>               in a future release!
>       = note: for more information, see issue #116344
>               <https://github.com/rust-lang/rust/issues/116344>
> 
> Thus, instead, use the softfloat target instead.
> 
> While trying it out, I found that the kernel sanitizers were not enabled
> for that built-in target [2]. Upstream Rust agreed to backport
> the enablement for the current beta so that it is ready for
> the 1.85.0 release [3] -- thanks!
> 
> However, that still means that before Rust 1.85.0, we cannot switch
> since sanitizers could be in use. Thus conditionally do so.
> 
> Cc: <stable@vger.kernel.org> # Needed in 6.12.y and 6.13.y only (Rust is pinned in older LTSs).
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Matthew Maurer <mmaurer@google.com>
> Cc: Alice Ryhl <aliceryhl@google.com>
> Cc: Ralf Jung <post@ralfj.de>
> Cc: Jubilee Young <workingjubilee@gmail.com>
> Link: https://github.com/rust-lang/rust/pull/133417 [1]
> Link: https://rust-lang.zulipchat.com/#narrow/channel/131828-t-compiler/topic/arm64.20neon.20.60-Ctarget-feature.60.20warning/near/495358442 [2]
> Link: https://github.com/rust-lang/rust/pull/135905 [3]
> Link: https://github.com/rust-lang/rust/issues/116344
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
> Matthew: if you could please give this a go and confirm that it is fine
> for Android (with sanitizers enabled, for 1.84.1 and 1.85.0), then a
> Tested-by tag would be great. Thanks!

Patch looks fine to me, but I'll wait for Matthew to confirm that it
works for them. I'm also fine with adding the rustc-min-version helper
at the same time, tbh -- it's not exactly rocket science, but it would
need an Ack from Masahiro.

Will

