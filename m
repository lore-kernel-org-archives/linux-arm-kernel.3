Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D8EC0218F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 23:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kGwPodq6Q+1QRMhQwzdR87h5olYJe5SMz1YpEKeh/EA=; b=KCHF1s8yynDT1hLJEV7v7CXQUJ
	Bpbndgwuk4gTyT6SU7FuuyutBrl7ogC77ENRZTWw38XZIPCbUtRBSn+nDKiHIU8D/2cfkzEzWc/v7
	L798dNW8e0jNR/BHnIlzdWEkFeSDO+uc7QhHHhbT0QKQ/0E6TLurk41jKZzLlYm/Recp4m6ym02Sj
	2Ksxvy0vG9nrYEX1G4DcYzu/J0PK29cyThesSIUItXHANeRM3C7OB17913UrOfoiLxX6heTaQqLCM
	vXkE4UH/6M0iGeYDCOSV2qsUk6+euYUeAz9ItBx3ctpqYLTZ/22pvjN1tEq8dSJLBn2zSPuoQEQsH
	e72Dze1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1te0fp-0000000Be9o-48WV;
	Fri, 31 Jan 2025 23:43:45 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1te0eV-0000000Bdys-0mOO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 23:42:24 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-ab6fb1851d4so215525266b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jan 2025 15:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738366941; x=1738971741; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kGwPodq6Q+1QRMhQwzdR87h5olYJe5SMz1YpEKeh/EA=;
        b=BWGSyBmY1R4GtETFU9AEo4Hx1zNOVB/WbVWbMfZQzc/NT8h4KWYoqsyxFcfkzJ94rG
         6U0fk2n/zGBp4X4xAjH8yBaPR6mAXH31x8I3olHZlBGv2NcYdCwrZO+iWgXnnFsmdEuT
         brCUJLjviptL3dRokI1/1fuOBvB8njoEcAAAAXbFZsnuGOIQ7wKvE8J46LQKnC5RjAzr
         4Az97JYrlSlnOJBoA6HJM59GFEoab7uX56S3Zq1KjctfQ58AvBzYw8Wn+YCsw0s8LyYV
         cC2zw4pT0PI/IEEAOvBOqnmpVMUi1+YbhGsCQrn7JBX+7GOvU7j6vm/EuH5ILDyNhWo7
         IQMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738366941; x=1738971741;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kGwPodq6Q+1QRMhQwzdR87h5olYJe5SMz1YpEKeh/EA=;
        b=FAnahP31pvn+HaS2Fz41kaCONU3Ms99Kq3kqfEVBkAf0Ryr+WJqYCvDHuz4bq//+UM
         Q94bPJ9M/+BkbXqz/iFw7EoU7QsnxXRrkMisxyiAp1LXsVxd9TlZkedTUc/HBed6hX5q
         WXfd+Hthl37SoWWp82rNQZ7GDESNFzB8QzXeAUi7aAhU1mWfbRl0bVKykoDPyzswPCHc
         YYPc4lsuUzOPuXKCAazssasb+pPX+bErT2/Bxzh3JX3DCdAiI8NOFZI6roROsKLPwoWW
         QU3rdoHOCdpWK/BRlZPxee0nDNm5Lq4uyVzGoEUmHyRXEW7SiBtWTkUBCY8PoBA2BwAw
         hV1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWMzjjbayqsZicnaQjkwiwa0bnHpI1sWATRo5709eyAwUEA7YFH9fbtv/WFtdZQJP9G+KtPZaB93LzWH6o7tieg@lists.infradead.org
X-Gm-Message-State: AOJu0YyTuwHypiMPKS8DBygEvhi/cUpv8bctQrW5f1XlBacfa7mOBcyx
	NzqtF6h7jfsB5kOLwMGyLwZEZ21jPMPS4c0Bz955GC7uSGRgeDbg
X-Gm-Gg: ASbGnct6z3Ys8dtCowl9/mNRN+f6Uvibhx/Yx3DeZwcP65URkSFF3k0BP254DH8ZnH+
	93WXkZBNuCub47OZCiHsSWoXmI5KOOcnXsJKY1CppRaGwXQ94oPHts+H3Ko3vlXWgpUNzAxe4bq
	RYybpyT8KOD65//75YQLbbzr++9SHXKGACIyYpNVerezTrL1/+OzjO1eBXeobuYDJmkZxKQX5Lm
	wFvQVri1IDoA383TUtekVIQl09DcSSEbuRrraSyT/l3KbVMKPTmyyciOexGpwclNErlkL37duv6
	lZENPp15Rc+pWNEcZS5R/zZE66wl
X-Google-Smtp-Source: AGHT+IER34JxU6wqtw2fn+LJ3Rbu3h28herITddCa9E1l4aKB44zvDpbpqzN330rg7Ayn8xAChRs2A==
X-Received: by 2002:a17:907:7f0d:b0:aa6:7ff9:d248 with SMTP id a640c23a62f3a-ab6f7443f58mr610676866b.8.1738366940751;
        Fri, 31 Jan 2025 15:42:20 -0800 (PST)
Received: from ?IPV6:2001:871:22a:8634::1ad1? ([2001:871:22a:8634::1ad1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e4a2f90asm361883266b.129.2025.01.31.15.42.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 15:42:20 -0800 (PST)
Message-ID: <defddc25-eb8b-420a-b64c-6ce57ebb3f6b@gmail.com>
Date: Sat, 1 Feb 2025 00:42:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm: rust: Enable Rust support for ARMv7
To: Arnd Bergmann <arnd@arndb.de>, Andrew Lunn <andrew@lunn.ch>,
 Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Jonathan Corbet <corbet@lwn.net>,
 Russell King <linux@armlinux.org.uk>, Rudraksha Gupta <guptarud@gmail.com>,
 Ard Biesheuvel <ardb@kernel.org>, Geert Stappers <stappers@stappers.nl>,
 Jamie Cunliffe <Jamie.Cunliffe@arm.com>,
 Sven Van Asbroeck <thesven73@gmail.com>, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250123-rfl-arm32-v3-1-8f13623d42c5@gmail.com>
 <a83b0149-7055-411b-ba86-d227919c7c32@app.fastmail.com>
 <f8b59f05-55b5-4208-8bdf-b4be8e93bc22@gmail.com>
 <65da77f7-bbd4-4cbe-a06c-75f10a6ec4ce@lunn.ch>
 <5e8a99a5-f39c-46da-b54d-7b69307b1c66@gmail.com>
 <e14cfb34-308f-4797-afe7-4e7e2d470fe3@app.fastmail.com>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <e14cfb34-308f-4797-afe7-4e7e2d470fe3@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_154223_253895_9040FA37 
X-CRM114-Status: GOOD (  33.85  )
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

On 31.01.25 8:37 PM, Arnd Bergmann wrote:
> On Fri, Jan 31, 2025, at 19:58, Christian Schrefl wrote:
>> On 31.01.25 5:05 PM, Andrew Lunn wrote:
>>>> To fix this Rust would have to provide a way to build the core
>>>> library without float support. I don't know if there is a plan
>>>> already to allow this.
>>>
>>> Floating point is banned within the kernel, except for in very narrow
>>> conditions, because the floating point registers are lazy saved on
>>> context switch. If the kernel uses the floating point registers, you
>>> can break user space in bad ways.
>>>
>>> I expect this has been discussed, since it is well known kernel
>>> restriction. Maybe go see what happened to that discussion within RfL?
>>
>> After checking again, it seems the float intrinsics are actually not
>> needed anymore at least for my config.
> 
> Ah, nice! If this is true for all architectures using the current
> rust compiler, it would be great to remove the FP stubs entirely
> and have link errors instead of panicking, to make it consistent
> with C.

After a quick test it seems that (most?) intrinsics are not needed
anymore on x86, but not sure if that's valid for all supported rust
versions and config options.

> 
>> Only `__aeabi_uldivmod` is still
>> required for `parse_u64_into` since [0] allows disabling float formatting.
>>
>> Link error without the `__aeabi_uldivmod` symbol defined:
>>
>> ld.lld: error: undefined symbol: __aeabi_uldivmod
>>>>> referenced by num.rs:580 (/home/chrisi/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/fmt/num.rs:580)
>>>>>               rust/core.o:(core::fmt::num::parse_u64_into::<39>) in archive vmlinux.a
>>>>> referenced by num.rs:589 (/home/chrisi/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/fmt/num.rs:589)
>>>>>               rust/core.o:(core::fmt::num::parse_u64_into::<39>) in archive vmlinux.a
>>>>> referenced by num.rs:589 (/home/chrisi/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/fmt/num.rs:589)
>>>>>               rust/core.o:(core::fmt::num::parse_u64_into::<39>) in archive vmlinux.a
>>>>> referenced 34 more times
>>>>> did you mean: __aeabi_uidivmod
>>>>> defined in: vmlinux.a(arch/arm/lib/lib1funcs.o)
>>
>> Not sure if we should just implement `__aeabi_uldivmod`, keep the 
>> panicking intrinsic for it or somehow fix it in upstream Rust?
> 
> The 64-bit division is particularly easy to introduce by accident
> on 32-bit architectures, so ending up in a panic here is clearly
> a problem. From the message above it appears that there is only 
> a single calling function (parse_u64_into()) in the rust library,
> so I wonder if it might be sufficient to split that out into
> another object file that then doesn't need to get linked into
> the kernel, or for the kernel to override it with an implementation
> that does not rely on __aeabi_uldivmod() but calls __do_div64()
> instead.

I don't think that we can split it into a different object
file or do some weird redirect in Rust itself.

> Since parse_u64_into seems to be a parsing function that is
> expected to be slow, it should be acceptable to call __do_div64()
> here, while we still prevent calling __aeabi_uldivmod() from
> kernel source code.

`parse_u64_into` seems to be used by Formatting for u128 
and i128 so it would be fine to disable these with a flag.
However `__aeabi_uldivmod` is used by some other parts of
core as well, like logarithm calculation for 64 and 128
bit integers, not sure what else uses is. I would guess 
its fine for these to be slow.

Can someone help me figure out how to get ld.lld to print
every usage instead of just the first three?

Not sure how easy it would be to disable these but it
would probably require some effort and would probably
be pretty hacky, so not sure if Rust would accept these.

> 
> Note that on earlier ARMv7 (Cortex-A8, A9), even a 32-bit
> division is implemented through an expensive software loop.
> Later cores (Cortex-A7, A15, A17) have native 32-bit division
> instructions but still no 64-bit ones.

I would assume that a software implementation is fine.

Cheers
Christian



