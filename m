Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9CEDC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 07:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eZVG7xhYgGNJMTy1t81RqFtDrd2UXmygXb9PDQGEYfI=; b=Cf+/GgDzHKI+p/OZcWgdvGu1p8
	t5doZUzC31RL6HfMh0jnNumU/ii+SSsy/tFI9DzOcN7AT+De/UZNg73EGyCcveOnZOVWFnaqnR2TQ
	oSFG2Iqt77Fasl8zAAf/TViL9jKyT3fu4qa8G8alaulyNdCc85HpVixlG9p7hKCMMgU77e4WtctFC
	9JAUTZ0JWSntNtC1/u4bDjUb4WyzAYByLatBMsqrrYw7d0YeIXik809J3gL5yHWS1gW12wfquHj1j
	oriTkp8vUo0xeXDx7QPVLopnKQQh/n7DASvDRDJ58xuf/DQfuUGiVyAi40ZnY4xVGr7HJknJjPPYt
	jLR0qWxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti7IH-00000006V9O-3OEN;
	Wed, 12 Feb 2025 07:36:25 +0000
Received: from r-passerv.ralfj.de ([2a05:bec0:1:3:10a1:5eff:fe52:509])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti7Gp-00000006Uuk-25Lw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 07:34:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ralfj.de; s=mail;
	t=1739345687; bh=dNEJPQCFXFXFYv8LsS8D1rVs3y39N2Beg7o2UW6ryMM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=H/hn7/sX5xM/uw2kg30IfwLHDywFTYAajrHTQq3WN22+Jmf6LCU4Po3PR5oZVnBu6
	 KDSBUlfksxwBNExOvWdUR3v9Wt3mNE5iQg56I3tYms3SM0yOIExAka4cfZ/ZSrx6gU
	 NpSnAI3A7GGQgE2vW16DX7RsFEuqEmSF+XKvA7X4=
Received: from [IPV6:2001:8e0:207e:3500:4ab6:48fe:df57:b084] (2001-8e0-207e-3500-4ab6-48fe-df57-b084.ewm.ftth.ip6.as8758.net [IPv6:2001:8e0:207e:3500:4ab6:48fe:df57:b084])
	by r-passerv.ralfj.de (Postfix) with ESMTPSA id 267B22050FE1;
	Wed, 12 Feb 2025 08:34:47 +0100 (CET)
Message-ID: <1cfca789-bbb9-4899-92e9-94ff78d07c50@ralfj.de>
Date: Wed, 12 Feb 2025 08:34:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: rust: clean Rust 1.85.0 warning using softfloat
 target
To: Trevor Gross <tmgross@umich.edu>, Miguel Ojeda <ojeda@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@lists.linux.dev, stable@vger.kernel.org,
 Matthew Maurer <mmaurer@google.com>, Jubilee Young <workingjubilee@gmail.com>
References: <20250210163732.281786-1-ojeda@kernel.org>
 <CALNs47uBcyTmBdTBAPXiBcAkE0-4tih9j=VAv1rRcTcf_c2yTg@mail.gmail.com>
Content-Language: en-US, de-DE
From: Ralf Jung <post@ralfj.de>
In-Reply-To: <CALNs47uBcyTmBdTBAPXiBcAkE0-4tih9j=VAv1rRcTcf_c2yTg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_233455_824716_EC2A66A2 
X-CRM114-Status: GOOD (  15.41  )
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



On 11.02.25 12:10, Trevor Gross wrote:
> On Mon, Feb 10, 2025 at 10:38 AM Miguel Ojeda <ojeda@kernel.org> wrote:
>>
>> Starting with Rust 1.85.0 (to be released 2025-02-20), `rustc` warns
>> [1] about disabling neon in the aarch64 hardfloat target:
>>
>>      warning: target feature `neon` cannot be toggled with
>>               `-Ctarget-feature`: unsound on hard-float targets
>>               because it changes float ABI
>>        |
>>        = note: this was previously accepted by the compiler but
>>                is being phased out; it will become a hard error
>>                in a future release!
>>        = note: for more information, see issue #116344
>>                <https://github.com/rust-lang/rust/issues/116344>
>>
>> Thus, instead, use the softfloat target instead.
>>
>> While trying it out, I found that the kernel sanitizers were not enabled
>> for that built-in target [2]. Upstream Rust agreed to backport
>> the enablement for the current beta so that it is ready for
>> the 1.85.0 release [3] -- thanks!
>>
>> However, that still means that before Rust 1.85.0, we cannot switch
>> since sanitizers could be in use. Thus conditionally do so.
>>
>> Cc: <stable@vger.kernel.org> # Needed in 6.12.y and 6.13.y only (Rust is pinned in older LTSs).
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Matthew Maurer <mmaurer@google.com>
>> Cc: Alice Ryhl <aliceryhl@google.com>
>> Cc: Ralf Jung <post@ralfj.de>
>> Cc: Jubilee Young <workingjubilee@gmail.com>
>> Link: https://github.com/rust-lang/rust/pull/133417 [1]
>> Link: https://rust-lang.zulipchat.com/#narrow/channel/131828-t-compiler/topic/arm64.20neon.20.60-Ctarget-feature.60.20warning/near/495358442 [2]
>> Link: https://github.com/rust-lang/rust/pull/135905 [3]
>> Link: https://github.com/rust-lang/rust/issues/116344
>> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> 
> This is consistent with what has been discussed for a while on the Rust side.
> 
> Reviewed-by: Trevor Gross <tmgross@umich.edu>

I don't know the kernel side of this, but from a Rust compiler perspective using 
the "-softfloat" target is definitely the right call here, at least for now 
(where none of the crypto/compression code that needs SIMD is written in Rust).

Reviewed-by: Ralf Jung <post@ralfj.de>

Kind regards,
Ralf


