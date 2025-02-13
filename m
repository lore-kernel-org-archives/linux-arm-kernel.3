Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2AB6C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 16:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Di91GS5SurqY+HZi1C2JM3ANzRomXbG/4pRGcDJf1Wo=; b=PvtlJRVet9ebqCmTUQfxdYXsTz
	AWDtIAg9hyZoxYGVja3kInJHVIR5wMCo1bBtKAEK7OQWVDAAMU0HpkBj2rWXNlOvE8h5G2Qy8L/cW
	9k85aflCcGDD5EqT6W6/Uk3lUQ1wXJF/Duw+fZb1y41piPk+XLpm++ItPubv3BjR0rBXHBrSldR/h
	oUoFaVfKIQ5spQJ1lps3OMud3IeFnPgYl/TMkicPhSvcEPzqRKQ2QZAaejTKEdrhAt0trTaUpUNt9
	UXIzq+YYUb2sCS56ZnswfhplrZnF0k3kRpbSoLxRn1Cetsw3dUPbqzsQLSVXQoVeFbHSx3j9jQoSV
	VUKjYdng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiboe-0000000BhZl-137f;
	Thu, 13 Feb 2025 16:11:52 +0000
Received: from r-passerv.ralfj.de ([2a05:bec0:1:3:10a1:5eff:fe52:509])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tibQ6-0000000BbmK-3Z33
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 15:46:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ralfj.de; s=mail;
	t=1739461584; bh=eQ5hKL8Do7QTUquhfPYnl9WT+Oj8r0LEBJJf4Dgm8XE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=0kwRNqV6/VTFUT91g8IVWD+PE8xZ3DtpuOWqmBqqx6r467v1iZBtf1ABglQ7QUI0b
	 NFTt9gWq/HEYAE83AvSePXmbph3ufFjUqooOv3/+jTDqa3wkBf86JWYHx4uVB+MKuQ
	 uHsGyclvb41/uqXepDW74cr8FITn4VcIiEdFK9DY=
Received: from [10.21.49.97] (unknown [195.176.44.46])
	by r-passerv.ralfj.de (Postfix) with ESMTPSA id 013482052A91;
	Thu, 13 Feb 2025 16:46:23 +0100 (CET)
Message-ID: <9430b26a-8b2b-4ad8-b6b0-402871f2a977@ralfj.de>
Date: Thu, 13 Feb 2025 16:46:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: rust: clean Rust 1.85.0 warning using softfloat
 target
To: Ard Biesheuvel <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@lists.linux.dev,
 stable@vger.kernel.org, Matthew Maurer <mmaurer@google.com>,
 Jubilee Young <workingjubilee@gmail.com>
References: <20250210163732.281786-1-ojeda@kernel.org>
 <CAMj1kXHgjwHkLsJkM3H2pjEPXDvD80V+XhH_Gsjv8N4Cf6Bvkw@mail.gmail.com>
Content-Language: en-US, de-DE
From: Ralf Jung <post@ralfj.de>
In-Reply-To: <CAMj1kXHgjwHkLsJkM3H2pjEPXDvD80V+XhH_Gsjv8N4Cf6Bvkw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_074631_101545_665C6E3F 
X-CRM114-Status: GOOD (  22.09  )
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

Hi all,

> We have to carefully make the distinction here between codegen and ABI.
> 
> The arm64 C code in the kernel is built with -mgeneral-regs-only
> because FP/SIMD registers are not preserved/restored like GPRs, and so
> they must be used only in carefully controlled circumstances, i.e., in
> assembler code called under kernel_neon_begin()/kernel_neon_end()
> [modulo some exceptions related to NEON intrinsics]
> 
> This does not impact the ABI, which remains hard-float [this was the
> only arm64 calling convention that existed until about a year ago].
> Any function that takes or returns floats or doubles (or NEON
> intrinsic types) is simply rejected by the compiler.

That's how C works. It is not how Rust works. Rust does not reject using floats 
ever. Instead, Rust offers softfloat targets where you can still use floats, but 
it won't use float registers. Obviously, that needs to use a different ABI.
As you said, aarch64 does not have an official softfloat ABI, but LLVM 
implements a de-facto softfloat ABI if you ask it to generate functions that 
take/return float types while disabling the relevant target features. (Maybe 
LLVM should just refuse to generate such code, and then Rust may have ended up 
with a different design. But now this would all be quite tricky to change.)

> Changing this to softfloat for Rust modifies this calling convention,
> i.e., it will result in floats and doubles being accepted as function
> parameters and return values, but there is no code in the kernel that
> actually supports/implements that.

As explained above, f32/f64 were already accepted as function parameters and 
return values in Rust code before this change. So this patch does not change 
anything here. (In fact, the ABI used for these functions should be exactly the 
same before and after this patch.)

> Also, it should be clarified
> whether using a softfloat ABI permits the compiler to use FP/SIMD
> registers in codegen. We might still need -Ctarget-feature="-neon"
> here afaict.

Rust's softfloat targets do not use FP/SIMD registers by default. Ideally these 
targets allow selectively using FP/SIMD registers within certain functions; for 
aarch64, this is not properly supported by LLVM and therefore Rust.

> Ideally, we'd have a target/target-feature combo that makes this more
> explicit: no FP/SIMD codegen at all, without affecting the ABI,
> therefore making float/double types in function prototypes illegal.
> AIUI, this change does something different.

Having targets without float support would be a significant departure from past 
language decisions in Rust -- that doesn't mean it's impossible, but it would 
require a non-trivial effort (starting with an RFC to lay down the motivation 
and design).

Kind regards,
Ralf



