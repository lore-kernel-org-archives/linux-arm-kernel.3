Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D29C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Feb 2025 16:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uwqe3wO2h1KhchbSQpJtyc0xUluXC5oEhfomc15Iqy0=; b=qFLgIJ/rD+Z5jy3wQ92HVREgNA
	t19kl/xS3Wm1Xbx0J4PznEYfZ4j4rjWrzE7UFl+pmA6l+mnNJ5RUV0tYKJoXdIW7H3widsab6n9J9
	Cegxo4lCBE0bsLoSk72ffvVi8aHr145XXpg0zfTX5iNKkUL2il4ca9wGNkAXK+03sO03hRSe8uuMz
	2Yu1pjw1vU9g8GmTbgT9+sASkOzvLYkDnFjTcPVypUTy4cQF4GqGUM30cIuwniOqPlGYFvPgxc/7k
	Qk6rSg3kz2IFs25ZgJb3/fQNST25/0EQwUvyNsPnd5xIcHQeJsTvwP1mR9OsAsmANiLhZHkdYvc3A
	KI/PvB+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tedIp-0000000DyfO-2P6g;
	Sun, 02 Feb 2025 16:58:35 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tedHW-0000000Dyah-04sf
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Feb 2025 16:57:15 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-385dece873cso1639796f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Feb 2025 08:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738515432; x=1739120232; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Uwqe3wO2h1KhchbSQpJtyc0xUluXC5oEhfomc15Iqy0=;
        b=BeEc+zS7Dckh1FuibrNH+5dMrGBrToxI79KJxX9crHkarnOhBnE4bjoh8vBdlGI1DI
         ECXnaPI7BTN1PMm6b5xUTzUsvZTC9jAK29SStUTQkGRdV96VnVQjP+iRodrrvmLHPaEJ
         eP85z0Qmx9rLcIFOFd0lu92aJ/kJ885uqaQ7x1a/Bn9xZKNGIbIyhoZmuSA/jthRLG/W
         xubty+uLamjisMxRqgdxFx2unkof1/B7y/t1Qu74oZ/KeYsox0B1yHZ9m9TpnxjdpDmY
         TA3cSa0IWOxB3CZCI4xjgHkanQae0zQZAf9p7izeoz8gC41qvX7Rp0/5AeSE2Ws+jtQ0
         MlEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738515432; x=1739120232;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Uwqe3wO2h1KhchbSQpJtyc0xUluXC5oEhfomc15Iqy0=;
        b=EQSKvQ+YkTmjDtWa3FJc63Wu4PzBaCGG0Ww1g+p7o8v4JqGPBmMnDrT6zz7HtC1RMn
         /pBZvfkBmalh2ksmWClyjytnH66E+velJYdW6wD3d2q6F0Tkpwr1O5TY4Z2e9JZVZ+Kj
         jXyyC47wViZjSkLRz5GEdtA/kmolMY86j3uUnB6FZSNsGsESJX2BbfIj3yQfTkd/aVBb
         ogR1OhIyEyII/FiF9q7G5Wx1jz3jbeggRnw4lG3jai9fvYaVKKaGFYZ4MMuQLdcW2Qx2
         R7MT6UQhABJmrCEo/44MqllBeqYYsEBxDGhvIwVy93a249gFRgqw2ErKSB8h1bYrPj5K
         OjLg==
X-Forwarded-Encrypted: i=1; AJvYcCXz/XzII/hs+EVeHC5YsTgZNl9zC86fn2UqkZhoICujG6Xbfmp20gDOo3upgCkn2rtiEBihj+osFL7Nx5do3OWZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5Z+CZDz0qY95FA48qvxigA0oYRvBfZ28s4weQ+RkMTAdKsI/S
	ZP6+PgOwelTow6/4ZCfzdZvFjuNkTr//yXaaOkg5W9JpLdwTfNSp
X-Gm-Gg: ASbGncuhZygFGG03wFjN14yqWf53cKAg1bdfgqR3nlafutZsSmuWpWAYM2wLHKm3Uq3
	huFjil/Rqauof374MgMwW3CqDEwJTeMSQ38XcQl0RBKYxWeF36skWdtkoguskudjzYu5CmBRjAL
	7Tz6mzxPnqFCwplb3xfn0HYbmlDwdvwY3G5Vd344OCGhV2XId5tzsrullYk7Y+p17c1c6d0t2eF
	nJGxXCTvcWxj6IU2V7Pegg5bVWWQ/ZpSFWTwq6BfLiLUPIZ9P/GxO1eT2c+NjOwXsw1nVLQ/qfW
	PIGKBq2J5OdwUlqj/q7jmnHb5B6Q
X-Google-Smtp-Source: AGHT+IHGI4vuDKmxm2ggxLHqDVzd9rJXWTNLOaDrF/1kFKr5pLWjbelTJUrlum0Weyhom1nxQpYfcA==
X-Received: by 2002:a05:6000:1ace:b0:385:ec89:2f07 with SMTP id ffacd0b85a97d-38c51970003mr13999601f8f.32.1738515431517;
        Sun, 02 Feb 2025 08:57:11 -0800 (PST)
Received: from ?IPV6:2001:871:22a:99c5::1ad1? ([2001:871:22a:99c5::1ad1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c11b71asm10539536f8f.39.2025.02.02.08.57.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Feb 2025 08:57:11 -0800 (PST)
Message-ID: <72feff7d-a305-4ca3-9c28-9040c791d3c5@gmail.com>
Date: Sun, 2 Feb 2025 17:57:09 +0100
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
X-CRM114-CacheID: sfid-20250202_085714_063376_C59AF688 
X-CRM114-Status: GOOD (  28.91  )
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
> 
> Since parse_u64_into seems to be a parsing function that is
> expected to be slow, it should be acceptable to call __do_div64()
> here, while we still prevent calling __aeabi_uldivmod() from
> kernel source code.
> 
> Note that on earlier ARMv7 (Cortex-A8, A9), even a 32-bit
> division is implemented through an expensive software loop.
> Later cores (Cortex-A7, A15, A17) have native 32-bit division
> instructions but still no 64-bit ones.

It seems be possible to implement `__aeabi_uldivmod` like this [0]:

#[naked]
#[cfg(target_arch = "arm")]
#[export_name = "__rust__aeabi_uldivmod"]
pub unsafe extern "C" fn __aeabi_uldivmod() {
    unsafe {
        core::arch::naked_asm!(
            "push {{r4, lr}}",
            "sub sp, sp, #16",
            "add r4, sp, #8",
            "str r4, [sp]",
            "bl __udivmoddi4",
            "ldr r2, [sp, #8]",
            "ldr r3, [sp, #12]",
            "add sp, sp, #16",
            "pop {{r4, pc}}",
        );
    }
}

However that requires the `naked_functions` unstable feature.
Or it should be possible to just implement in a asm file.

I think it would be very difficult to entirely build core 
without needing `__aeabi_uldivmod`. 

Link: https://github.com/rust-lang/compiler-builtins/blob/6f96bccc5d4aa3ba4c4cebdf23a3ccc3bc7fe77c/src/arm.rs#L64-L77 [0]

Christian

