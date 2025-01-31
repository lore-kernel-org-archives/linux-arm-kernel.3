Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60871C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 18:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dP2c9p+WJ/Ycibc0VmIMo2SY4jx3mg/tQ+vmm0GdlFU=; b=tcj+2Vde4VuERckSUhh4Gzev0V
	zbUkEdPblh9RErnbv7pHGtaEET9GI2cQkGPnt+HckWXu60LcqwnjDpuus4vvuj51/b/gUPPFihy48
	/t+04BtVaos3EvB4aBW6Zbn7o2N0DVJkGknxnZtWff97ZvpminZF/a2CofZvY/wzo00ymR0ErYPah
	sitys+DYy9x0D0tmpbBmUNeul63zsuJ/ARXz6V7AtdRnuPStJF5+oslWv507k6yVOyIvaqf9uYcMQ
	Y1R97n5TzT4CCWjcRKD27+IMYijWtzpJP8X14ph+s9970QRtZJzKsTmTViu2VdiZaSw0ZkguOAeLG
	YmKr1WbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdwF1-0000000BG88-36cL;
	Fri, 31 Jan 2025 18:59:47 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdwDi-0000000BFzg-2ktQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 18:58:28 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-aa68b513abcso408571466b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jan 2025 10:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738349905; x=1738954705; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dP2c9p+WJ/Ycibc0VmIMo2SY4jx3mg/tQ+vmm0GdlFU=;
        b=NIacjbvWCz+QJnE83GEUGi5FNI3b92KsRUHG4f/pZp8hpXy+GD6sK7GYvmUhV8wZC7
         PEkdgIeeIvhzn1dSKWu/KhDrUmQn+CYKxmIbOwv7vZZ5Y+dvwDMam/t6FxzU9Xu95zoX
         vBZ4957RX788RnPtzYKVQmKg+5d89ixFOTmjPHwY2VMDEvlIU+HPMKKrYBeT8ejaxue/
         sSn1fjEht9C6g7Zb6BEhOzx2GxaUNfQo5Wv7PhY9m08QTrV3TEWY37J77TkcBcPKUJz2
         QCVwv4dKuzJ3BKG/lBo3vLwYkXBY7Lpb3U/xlg0kQbzjBoa/KNo1moaXX4gYeV0g+Nj8
         sHqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738349905; x=1738954705;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dP2c9p+WJ/Ycibc0VmIMo2SY4jx3mg/tQ+vmm0GdlFU=;
        b=sdVmbCyWEKRP8jsv28NQTOsm9LIdiJxwEfr1h6oDkh9Zxx3Qo/RYQLnnxWuAv4O5XE
         C03+M3IfBM1fW7G529CzuTcgiXbBdGUOE2hM1oCragoTYXYx4vM6DaprRTSP/Kg7yHSd
         gMpjsbviBc3BhszLPd7nvpfEnqZRLsFiD/GsxsDqZCeBZQMlJJo6XUEaPXCU0TpH8kiQ
         s8lEQVQNflpWdu+niiUXmgTSjzU2JDYFdJGxwlLG20hLKBpIE7BqiK4mlEgR8QhH9LDE
         bnzx2qpdWqfude+lwVNWpr5LsnkZVgU9kC4exLFuelu/zd/Dg9BPCZegRbA9H3n65SkI
         VF5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWNj7R6/vwoDsofn2MrICy50/sX0fJx7WayypvoDBKJ5YspaiBiLmXhu5/UXC7nwsvhQYDsfXoQXrGrDdltHJ8E@lists.infradead.org
X-Gm-Message-State: AOJu0Yxo0dT7Zp+Cx0FB5Qk80+d2ezicVi7sfhLY5LSemQgC7owm+WPl
	+lwCgALvDiMVwmliwGBn2TBYSsiOdwD29lUYHxtJhFvzKBysFIrK
X-Gm-Gg: ASbGncsdL9HL7qrDTQG/iFr36Q0JBUvxYDnawjQv+qumwYLA+MSil+Xb0vBsn0Ia7oa
	YqM4fXdYH8hSNLT7P+LmXTh0oq4YyG/VsGhxhLCL+QkVOYcGdGeeiUThKsm52kzzqn7ycQBgI92
	rv/QXfyTuaB8El8MEpeJrxzIAJZGDpvlRHUd2/smF+pkxKvMgELOfLhbiwTBSHdTgbK6Wk4fUBE
	MER9gC4aWhRunFLgnDSOOT4P3PdvJH3P53Z9yqH4Gx9o6akMAFH649rRVnxKeZ4/yqRx+gXn1Db
	H7ZMHwgVdE2c3ZDhTweMEmS4HIk5
X-Google-Smtp-Source: AGHT+IHOS1aKbTTtUUMddEt5dbh1IUG+QNx5UiNzYR9h5od9izNR3CvolWOWfFrKJty/mwVs56DPyQ==
X-Received: by 2002:a17:907:2d0f:b0:ab3:8cc:cd8 with SMTP id a640c23a62f3a-ab6cfd07cd9mr1254923766b.29.1738349904899;
        Fri, 31 Jan 2025 10:58:24 -0800 (PST)
Received: from ?IPV6:2001:871:22a:8634::1ad1? ([2001:871:22a:8634::1ad1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47d06casm340070666b.58.2025.01.31.10.58.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 10:58:24 -0800 (PST)
Message-ID: <5e8a99a5-f39c-46da-b54d-7b69307b1c66@gmail.com>
Date: Fri, 31 Jan 2025 19:58:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm: rust: Enable Rust support for ARMv7
To: Andrew Lunn <andrew@lunn.ch>, Miguel Ojeda <ojeda@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
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
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <65da77f7-bbd4-4cbe-a06c-75f10a6ec4ce@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_105826_703919_DF152831 
X-CRM114-Status: GOOD (  15.25  )
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

On 31.01.25 5:05 PM, Andrew Lunn wrote:
>> To fix this Rust would have to provide a way to build the core
>> library without float support. I don't know if there is a plan
>> already to allow this.
> 
> Floating point is banned within the kernel, except for in very narrow
> conditions, because the floating point registers are lazy saved on
> context switch. If the kernel uses the floating point registers, you
> can break user space in bad ways.
> 
> I expect this has been discussed, since it is well known kernel
> restriction. Maybe go see what happened to that discussion within RfL?

After checking again, it seems the float intrinsics are actually not
needed anymore at least for my config. Only `__aeabi_uldivmod` is still
required for `parse_u64_into` since [0] allows disabling float formatting.

Link error without the `__aeabi_uldivmod` symbol defined:

ld.lld: error: undefined symbol: __aeabi_uldivmod
>>> referenced by num.rs:580 (/home/chrisi/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/fmt/num.rs:580)
>>>               rust/core.o:(core::fmt::num::parse_u64_into::<39>) in archive vmlinux.a
>>> referenced by num.rs:589 (/home/chrisi/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/fmt/num.rs:589)
>>>               rust/core.o:(core::fmt::num::parse_u64_into::<39>) in archive vmlinux.a
>>> referenced by num.rs:589 (/home/chrisi/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/fmt/num.rs:589)
>>>               rust/core.o:(core::fmt::num::parse_u64_into::<39>) in archive vmlinux.a
>>> referenced 34 more times
>>> did you mean: __aeabi_uidivmod
>>> defined in: vmlinux.a(arch/arm/lib/lib1funcs.o)

Not sure if we should just implement `__aeabi_uldivmod`, keep the 
panicking intrinsic for it or somehow fix it in upstream Rust?

Miguel do you know how this is best handled?

Link: https://github.com/rust-lang/rust/pull/86048 [0]

Cheers
Christian

