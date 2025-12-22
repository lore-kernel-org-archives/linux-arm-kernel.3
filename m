Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6617E66886
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 00:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MM7RV4MA6+k2V8r5oWFH+eAF8D28f9bxG2QTbSEjJLk=; b=ALEjHFECEl/lz0/r2GHZ23Fkw6
	/yskqp/CUKDalfLEfEs4btOFb46Ia+t+ODuMxVGn80q3o6xxHMvZDFvjdxaqWCAWL7rjCs+BfkKrM
	8RXE/xizB2brmLkYXNHaHsHrflMTgr0/e29JPZOFcm7KIvGJwfUnJJFjgl8evN8RWqw4HNiIELQsR
	oe/CUEeOeUlmxiSkxSYREfd0GIBoLCZHV2eyvHsNZd9pVdYOwmzqcUS1841lWnp1bD58II8pVDQyz
	rgqW5mhMcCD+U4Zj5z/lBdQgb4UndN/+BROstFKh1Qy55NcKK7qQeh7EtR9DXQakbz0qaw88GGmjc
	RXBPV9oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXTLp-0000000Cthb-0Isp;
	Mon, 22 Dec 2025 00:00:37 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXTLm-0000000CthC-2yuA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 00:00:35 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-b98983bae80so3029756a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Dec 2025 16:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766361632; x=1766966432; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MM7RV4MA6+k2V8r5oWFH+eAF8D28f9bxG2QTbSEjJLk=;
        b=b7TB7GW22sULCl+CaLYBqbRG7xEMEjvJDTIqRtOynuI7o/Etc5OITCSttCDOehO/5l
         yqjtJLwMfN3+3ecUlh8JYPEru/FbvKfI4MOwJpQtXHQKjCf2zIPIUaeFfZwQRCrzg30u
         QIdFs2kdpmbKMOOOpMbD+bfSNJeKYtAsgajmL2tTL6Cp27lA8fWQU+VH/INbwhvfXYbk
         QRf2sea6t3AHnX2eDsuagwvNLnV41zcE6719M2ycBNOjVNkzuGGoL9jMQV9EbfDjqcGQ
         VtAyFsbwxBFcMHQ0941HsxJiOHTU1ssGOcpTElylcB22nxnSvd2JS0UbcBC8E6nz3uZT
         AF0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766361632; x=1766966432;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MM7RV4MA6+k2V8r5oWFH+eAF8D28f9bxG2QTbSEjJLk=;
        b=jqLdaRnRsSqNA3WyEi70llW4DFH9NvFKGlaKP4Lv4MBIq6RwdvYphdjwC40K5Yk+cL
         TNwdQZxJRG9XsAPncNDNvN3EgR7R2Gph+2yfmOzjW0QrYuTCS4GcTAS/dmJw4vJuJuK1
         VX7u5huMOFKtcJulbpgEyz7NHbY86cHAZmBGRXR3DE/0G62K0iQDE7ttUf7DI18KbQQa
         YoP8VVZh9CjgX2ilnP8ki9Vu+8Vt/zj3VK7AmUNE+DlXjKvqSljXBjAKZLHG9M02BwXx
         HQFX6FDk/HViRZkIQ6Y4v7M+6TBtm0jIGOt3xEFDeF1FJl8H1MBn9FKTD6ejwZGkXGUi
         A6Wg==
X-Forwarded-Encrypted: i=1; AJvYcCVdZQ6aFTI2XU3miUYmCuvNFgmSiSpM+NF1z5m22CMaaenRDQvcNt6SPuBgfxKtuJprLYbYTCx9ZYr8hszgS39P@lists.infradead.org
X-Gm-Message-State: AOJu0YyGn4KR8bu6M0uqJr4CARM9LODvLzmEGZqtXmU4zQ9XpEk5fS9f
	qzPq8xPjncqGZIW0iv1X/4lOTYHILmIvPlUi7Dnl6xTJoc3Zeq/fouw+
X-Gm-Gg: AY/fxX45wpjDQ/Qg9p/WMpp9XRPb2duF4hMGkzbIA3Ivqp7IQXGbw91B7KVOwXlmOwx
	8vYQTi3sFZeVMi2T2CPdTRQ6GEe77vwp7mrfHBsnM/v1s2lojk4Zm3P7UZMRIy+bt6Fa8jXFoEy
	ihA9Ot7XgbtIW5qOP9CnBX8YaenEHUyzcRdyluDi2D4YfEWlKRy3NSmJcMUXvH8LbmGdrzX29WS
	jw5CbFewvypuESGzh1qjLkx10VThX0ncpURFtsyTCK0owy5kBDUUEfz3Ea2+h0Jcf37RNtCh1dy
	GSsw++gLhGnqFK8nA/2ErTbc3XMJc+1ebLt1KAu72mWQmZ3/QkJvXaQVZGKaowISW9YiRwSA4Gp
	LTqpB88D6pabTkbNfXc/nVKtUUvhbfCI3p1umjz0Yd+vzvCFjez3yLjwY/cPWeZeDfFi9Sc8oJk
	7ie0RMgnJQy+uPztUCcm9BuJmhAPG8VnAFD0RxDkJ2mMfz5ho0V/IModZFopufyE7ebA==
X-Google-Smtp-Source: AGHT+IHWxQn5FbGuPZ3qckSgTAqf30C61kqhNqlZJurZtR2onEq7xRmHaWycfSAgCm0Rr0YlSZPrjQ==
X-Received: by 2002:a05:7300:ac90:b0:2b0:310c:529 with SMTP id 5a478bee46e88-2b05ec050d0mr9843513eec.14.1766361632052;
        Sun, 21 Dec 2025 16:00:32 -0800 (PST)
Received: from [192.168.68.65] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b05fe99410sm25703154eec.2.2025.12.21.16.00.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Dec 2025 16:00:31 -0800 (PST)
Message-ID: <aa453636-dcbc-4ac1-8733-d9d992de82ce@gmail.com>
Date: Sun, 21 Dec 2025 16:00:30 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ARMv7 Linux + Rust doesn't boot when compiling with only LLVM=1
To: Christian Schrefl <chrisi.schrefl@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev,
 rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 llvm@lists.linux.dev, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>
References: <1286af8e-f908-45db-af7c-d9c5d592abfd@gmail.com>
 <0705db10-3cbb-4958-a116-112457f9af6c@gmail.com>
 <1910f4b6-db74-4c86-9010-28ab4462c5a7@gmail.com>
 <20251219211147.GA1407372@ax162>
 <0169d4f7-1a31-4ec6-a456-a6dfe2d99886@gmail.com>
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <0169d4f7-1a31-4ec6-a456-a6dfe2d99886@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_160034_777551_AAEF98E6 
X-CRM114-Status: UNSURE (   7.64  )
X-CRM114-Notice: Please train this message.
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


So it seems that the boot.img size was getting too large for lk2nd (the 
bootloader) to handle and was giving these errors as described. Seems 
like lk2nd can't handle ~21 MB boot.img.


After removing networking from the Linux kernel (as it was the simplest 
way to massively reduce the Linux kernel size) as well as building the 
rust modules into the kernel itself, it seems to boot fine now:

[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 6.18.0 (root@9e6cbc09906e) (Alpine clang 
version 20.1.8, LLD 20.1.8) #4 SMP PREEMPT Sun Dec 21 23:44:57 UTC 2025
[    0.000000] CPU: ARMv7 Processor [511f04d4] revision 4 (ARMv7), 
cr=10c5787d
[    0.000000] CPU: div instructions available: patching division code
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, PIPT instruction 
cache
[    0.000000] OF: fdt: Machine model: Samsung Galaxy Express SGH-I437

[ ... ]


[    1.487035] rust_minimal: Rust minimal sample (init)
[    1.487297] rust_minimal: Am I built-in? true
[    1.492632] rust_print: Rust printing macros sample (init)
[    1.496873] rust_print: Emergency message (level 0) without args
[    1.502244] rust_print: Alert message (level 1) without args
[    1.508439] rust_print: Critical message (level 2) without args
[    1.514025] rust_print: Error message (level 3) without args
[    1.519702] rust_print: Warning message (level 4) without args
[    1.525592] rust_print: Notice message (level 5) without args
[    1.531239] rust_print: Info message (level 6) without args
[    1.537037] rust_print: A line that is continued without args
[    1.542440] rust_print: Emergency message (level 0) with args
[    1.548348] rust_print: Alert message (level 1) with args
[    1.554069] rust_print: Critical message (level 2) with args
[    1.559470] rust_print: Error message (level 3) with args
[    1.565177] rust_print: Warning message (level 4) with args
[    1.570458] rust_print: Notice message (level 5) with args
[    1.575829] rust_print: Info message (level 6) with args
[    1.581444] rust_print: A line that is continued with args
[    1.586893] rust_print: 1
[    1.586925] rust_print: "hello, world"
[    1.592188] rust_print: [../samples/rust/rust_print_main.rs:35:5] c = 
"hello, world"
[    1.598511] rust_print: Arc<dyn Display> says 42
[    1.598542] rust_print: Arc<dyn Display> says hello, world
[    1.606445] rust_print: "hello, world"


[ ... ]

Welcome to postmarketOS
Kernel 6.18.0 on an armv7l (/dev/ttyMSM0)
samsung-expressatt login: user
Password:
login: can't set groups: Function not implemented


Sorry for wasting everyone's time. I appreciate the helpful responses :)


Thanks,

Rudraksha


