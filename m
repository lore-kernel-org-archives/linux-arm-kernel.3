Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A2E7C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Feb 2025 00:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dIW5mxw1d5fGh/+9frfvuDB0rZsAyYbrsw3Hm15dSnk=; b=osUGquSuWa//DQCtS6P0C6tJlo
	pflmsd1My7xWXa+zpYLA0rHGmYj1u0++Sy50GTRJjgsl8cSsLqwNQdOgekwfexhh/ZRXUYz/eGf/N
	VUkO4LgVtRrpl0xT9fO1RmmveaCx/q19qfF3BzaKZGrvwsA7wBjfk3P/diTGH2A509J38ZFXaO+Oo
	ltFmJjtzA31mvQegJZjq8ffgpAndIZAZYLHJWNR9mQFZ5rJSiq3fe57CDw5PmAXDgFgzLBo15TuQZ
	/Vkm6Qw1yJEf3MWMHTzsQZ8/FORp5kq9ZwqrQ+wj8u4VnCF2cw6awz8JMpbqv03ljzURalo1bEskX
	Y5UNH12w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1te10L-0000000Bfl0-1A09;
	Sat, 01 Feb 2025 00:04:57 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1te0z2-0000000Bfc2-0h3R
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Feb 2025 00:03:37 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3862d6d5765so1422180f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jan 2025 16:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738368214; x=1738973014; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dIW5mxw1d5fGh/+9frfvuDB0rZsAyYbrsw3Hm15dSnk=;
        b=YkuC2CmfKxoT9hZ1yhuYCzC0DZZdMZwwYYLtR1CacxHZvmkZx9gAHiyMnF72Lw3ay9
         VOKckla9wPHQVYooHz/CNhaAdIktCo45rKOEHoF98iblhMtmVt/oVOv+DRGlpBRgVvHT
         soVJQHkRwlgSZbpLN4+1pDoNX8Auhb5aumtzqrlgJ34sTce5e5sFNwQ/5EhWcBQuF4Sl
         b+tbub62vtUGpA1NcJ5OPINwsutYEb/aiBsZ6srUPD+iKuwieqNBPe39H+8dh+RZ/jUA
         vhH1sVkRGJIj6sQcJXA5FRY17BkFiLMdIoB61Wq08Rqb4pHPa7Y2sSPVHm0bzkUnGelA
         EPbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738368214; x=1738973014;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dIW5mxw1d5fGh/+9frfvuDB0rZsAyYbrsw3Hm15dSnk=;
        b=Giv9LxbJBYfQuON0OPv6sTqIqLdeCGDp/bge4lwKRYi3jFyG70vw1N5OFtPzHxxk34
         Opc1b4VATHjL9mn0J/fPJ1pMG11Auk7iJX4F7YAJer/IyT7/WK+/o/2uuhu9DsYpuAwm
         FUY5CG58fZJrI9EpjykQSR6NEdzejNGs64pLpWTk6T5+0WeDZKqoe1WLct7Uqe7ipr3T
         EptX3BbE54nXrhnx/QaKjOMcNZbiuwWeBJpee1JwOZWv7pWLpzplcb7y4McFfzNi7ixo
         6BOTeB0zroHPjNcodIi0WQOgHU6ySeKWggMRkB56arVDIuj1s7OY1EcSE0cUaDj1sK6Q
         jfVg==
X-Forwarded-Encrypted: i=1; AJvYcCV+wxdQ98D7hKnN6ErSBQdbMtJSEbw48u/IQD29rrYsmTlYBqjg31onnWX5Gs3KnwKgVEciqLk98JkdBmLOxOAN@lists.infradead.org
X-Gm-Message-State: AOJu0YzditQ3anzrlhxdVUBgwY0nJy7jHPtcRS01Q0UO1OX4jUGA+BEP
	yyv5tvON69wEujyPoe4PUg60iRlvzbYFq8VfeezEkVgIypBh1TOH
X-Gm-Gg: ASbGncuVLVYsKbKVopDv39zANqpexJm6a1XTjnhPZwq3tBIOtkre0sIvl/c9YkuA6S4
	5fHXy7oq2wLknyZzoCP8eSNRuWLZxLeFkv5PAdQYG73fd17eQW746WCN83QbFt0rR66t1UPCp7Z
	TVz4YGM2CIn0/OiZ3aJwssSP9ozfX2wcZbhXgmnP2/x2GVIXH3QOyb6Ukt8JNhT/AQlMmPoOkvT
	o82x4fFx5a16TDYaxJVCsMbUatu+cHU6F4D1IR2OoiP9CdBnObtDHLeieDHcVL0HGAFiGi9XUSn
	HdKAoSLpTCwappd+qPiQMtKmYVkM
X-Google-Smtp-Source: AGHT+IEAmQ/3lwR59zHcY7DNEmyqeOVzzb9TWIVcnVUkllN5W5Fsd05H2UVJoIRw4vEWdM/qGbZ3jA==
X-Received: by 2002:a5d:5384:0:b0:38a:8ed1:c5c7 with SMTP id ffacd0b85a97d-38c520bdb45mr8608136f8f.46.1738368214370;
        Fri, 31 Jan 2025 16:03:34 -0800 (PST)
Received: from ?IPV6:2001:871:22a:8634::1ad1? ([2001:871:22a:8634::1ad1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c125f77sm5942943f8f.56.2025.01.31.16.03.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 16:03:33 -0800 (PST)
Message-ID: <621a5bd9-ec51-46eb-8d8e-c463085f92e2@gmail.com>
Date: Sat, 1 Feb 2025 01:03:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm: rust: Enable Rust support for ARMv7
From: Christian Schrefl <chrisi.schrefl@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Miguel Ojeda <ojeda@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
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
Content-Language: en-US, de-DE
In-Reply-To: <5e8a99a5-f39c-46da-b54d-7b69307b1c66@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_160336_212218_6981DB13 
X-CRM114-Status: GOOD (  16.96  )
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

On 31.01.25 7:58 PM, Christian Schrefl wrote:
> On 31.01.25 5:05 PM, Andrew Lunn wrote:
>>> To fix this Rust would have to provide a way to build the core
>>> library without float support. I don't know if there is a plan
>>> already to allow this.
>>
>> Floating point is banned within the kernel, except for in very narrow
>> conditions, because the floating point registers are lazy saved on
>> context switch. If the kernel uses the floating point registers, you
>> can break user space in bad ways.
>>
>> I expect this has been discussed, since it is well known kernel
>> restriction. Maybe go see what happened to that discussion within RfL?
> 
> After checking again, it seems the float intrinsics are actually not
> needed anymore at least for my config. Only `__aeabi_uldivmod` is still
> required for `parse_u64_into` since [0] allows disabling float formatting.

Seems like Rust 1.78 still needs at least __aeabi_fcmpeq __aeabi_fcmpun
__aeabi_dcmpun and __aeabi_uldivmod.

> 
> Link error without the `__aeabi_uldivmod` symbol defined:
> 
> ld.lld: error: undefined symbol: __aeabi_uldivmod
>>>> referenced by num.rs:580 (/home/chrisi/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/fmt/num.rs:580)
>>>>               rust/core.o:(core::fmt::num::parse_u64_into::<39>) in archive vmlinux.a
>>>> referenced by num.rs:589 (/home/chrisi/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/fmt/num.rs:589)
>>>>               rust/core.o:(core::fmt::num::parse_u64_into::<39>) in archive vmlinux.a
>>>> referenced by num.rs:589 (/home/chrisi/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/fmt/num.rs:589)
>>>>               rust/core.o:(core::fmt::num::parse_u64_into::<39>) in archive vmlinux.a
>>>> referenced 34 more times
>>>> did you mean: __aeabi_uidivmod
>>>> defined in: vmlinux.a(arch/arm/lib/lib1funcs.o)
> 
> Not sure if we should just implement `__aeabi_uldivmod`, keep the 
> panicking intrinsic for it or somehow fix it in upstream Rust?
> 
> Miguel do you know how this is best handled?
> 
> Link: https://github.com/rust-lang/rust/pull/86048 [0]
> 
> Cheers
> Christian


