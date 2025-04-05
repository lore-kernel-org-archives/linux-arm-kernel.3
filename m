Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F23C36010
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Apr 2025 20:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hyr3I2LD6oYdyXFuRB514jaAJoLkJqMn3eQ4HuFH+h8=; b=OrXiU5aoQXxTRhzb0h/g2PO+lt
	OuJUx+lh7ZTvdPmcobKrU06llJRuRoQbr12+sisSKk7WvkL8uh+TB2B++p3l7yyC31oDOOZjCOS0V
	AbzVhOEkMlclON261wDxYWEXtL7gnQPs4QguV1NOvxwnE1+/B0VBTmifF+uAsNH9sSxTbAETfyJW2
	kgNlunq50LiicgCPt/W9WLTkm+3qsGKgM/DlXUEAAY5643/PMF83KHBOsWZGfwPs1Uc0kdNSqQveh
	jXKbrqqBFF16MIhxnJ0zj8Ol67w3ujC+mlgRoJIyJcsKMsimEWlDpTHGoGISzB5hHr4W1RoeLC0MG
	cm+ajsmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u19nP-0000000ESTH-3ho1;
	Sat, 05 Apr 2025 20:07:15 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u19lc-0000000ESLF-1on5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Apr 2025 20:05:25 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5e8be1bdb7bso5072446a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Apr 2025 13:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743883522; x=1744488322; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hyr3I2LD6oYdyXFuRB514jaAJoLkJqMn3eQ4HuFH+h8=;
        b=kzM5c6V2Op02a0EWqaK8vSuAPp+A2Lj+Rs5sxuHMY9UVxfvcOV0yCzxqepv0/0JTbP
         JsNjp/TTuwVxwdp1UlKCC5N2dK+pgM6824mYhOwjworg0Rjxe9wx9kY9C49o9ynfFG8o
         nIYRgRa+wlPDmSslRIsZIFnIjVO8Gho5/ToC3PYk5k5gj4z+wsEXMIsKCBw9pz852P6p
         lKhVPc6As1u1Y10pj01BzeYlv9N1ydRD4/HjEF/YiGH6KjzcoxqfiLAyYKqe5tM4m34T
         OkXV/GwlVRwapyNtDt1hFIPqQpajsGZ6G1Z0ERshQGu41RZ8yqtTZjkLHYmg6vBPp4D/
         hd2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743883522; x=1744488322;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hyr3I2LD6oYdyXFuRB514jaAJoLkJqMn3eQ4HuFH+h8=;
        b=bI2RI5xYDOl4MH4dAM69vvKQA1IRzymEzhRDylAS0ckmz0fKdGDJuR7F7o05EWS2Zn
         2b9zBDzEc4FVJppTchxjBhwnzwkEZObXDz3e+XYjUOlueyCJR1zQklAEnfV49LvEzbFi
         XDTrmOSVEZQjhUX4OPV2gqf3YpwaXCZsilHRT4h7O3i1esvmkiwbsmYTYUYj0pAwpNwO
         Obbcj8Lw3WnlD6rYb4x/YxuPMyLfG3F/OUqvY434zk0QbwNUVPP12gxUDUUrkHXqqPsF
         7Q4dnRaLlw6ylFqBzEw74F9EIZW1HSr8WWCSw1LeJy9+1U40mWzUUhFUVIm1ntfSogYv
         aKtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxA7rz30ksPT079JT/ap8wYgV6FGoKN9T0zXcjqbH5XU4geXiXwdFIoiclyw4JPL6U+20ajITk7iz22RPXa5RN@lists.infradead.org
X-Gm-Message-State: AOJu0YzmTbBsPFaMXLW1MHPXnOIByyxGZXgwm5KMff46envFx3jGdtMn
	ygdq/oKGvx8Y+W8/A4pQ6Ea4SAp64tVlPTcnOl+vS/VESV7qibnK
X-Gm-Gg: ASbGncvbyxzm99WBHvdLMlyaPrBo+gZusc8iav1yYQD55A714qIQ90xU8/1PphoFjDK
	LwLkKrKSAEuBAA5FXLBGZOwlXALOE/sGcK5vEJFrhseynZzDcGs+iQC7USAgVyjrfaQbEAFw4Al
	OR9G7eKC7b6IWKAk+Fmx+EE04iFxf9EhcogufRLTlN627jmnD0TjJzgbFwz/WZ6RVM0kktH5PXO
	9GJByShjweb5uJUaZ8eUPmZmAsyUViYBekptIx+y55cgyfxTTtSm/Q8ic2V4yNC8ynmrSgW1EKQ
	HpZb3IvP6H2PIMkUdVNDEbpBCdHhKbZ36B+TAfdhSGr5nwvkANPxw2nvrA==
X-Google-Smtp-Source: AGHT+IFqYGSqbRsbuD4i4wRSjvzH/8ifozRPrIqDZpWcze1lam4H31+dMiIOJy0Wh8owhFTIeDKZAQ==
X-Received: by 2002:a17:907:a088:b0:ac3:3e40:e183 with SMTP id a640c23a62f3a-ac7e717035amr280556266b.3.1743883521868;
        Sat, 05 Apr 2025 13:05:21 -0700 (PDT)
Received: from ?IPV6:2001:871:22a:99c5::1ad1? ([2001:871:22a:99c5::1ad1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7bfee2591sm468902666b.79.2025.04.05.13.05.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Apr 2025 13:05:21 -0700 (PDT)
Message-ID: <399cceb4-dcf5-4af8-a8b7-6741e9b7e8ae@gmail.com>
Date: Sat, 5 Apr 2025 22:05:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm: rust: Enable Rust support for ARMv7
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Jonathan Corbet <corbet@lwn.net>,
 Russell King <linux@armlinux.org.uk>, Rudraksha Gupta <guptarud@gmail.com>,
 Ard Biesheuvel <ardb@kernel.org>, Geert Stappers <stappers@stappers.nl>,
 Andrew Lunn <andrew@lunn.ch>, Jamie Cunliffe <Jamie.Cunliffe@arm.com>,
 Sven Van Asbroeck <thesven73@gmail.com>, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250123-rfl-arm32-v3-1-8f13623d42c5@gmail.com>
 <CACRpkdYF0sVB2-qgy=GzETSR3+2sagVQPGdunDQDJrn8KqJorA@mail.gmail.com>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <CACRpkdYF0sVB2-qgy=GzETSR3+2sagVQPGdunDQDJrn8KqJorA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250405_130524_492604_5868EE40 
X-CRM114-Status: GOOD (  28.20  )
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

Hi Linus,

On 21.03.25 8:24 AM, Linus Walleij wrote:
> Hi Christian,
> 
> thanks for your patch!
> 
> Sorry for being late to the show. I missed this very nice patch
> that was actually on my personal TODO but I have to much
> to do and also I'm not smart with Rust, but I'm a big supporter.
> 
> On Thu, Jan 23, 2025 at 11:40 PM Christian Schrefl
> <chrisi.schrefl@gmail.com> wrote:
> 
>> +       select HAVE_RUST if CPU_LITTLE_ENDIAN && CPU_32v7
> 
> Nothing in the patch series really explains this restriction, so it
> should be in the commit message. Arnd mentions some atomics
> etc, but we really need to know exactly why this is in the patch.

This should probably work with armv6 targets, for v5 or v4 Targets a 
different target would have to be specified in the KBUILD_RUSTFLAGS.

Rust also has some big endian arm targets.

> 
> I'm a bit surprised by this since the rustc LLVM backend nowadays
> support all old ARM ISAs. I would have expected:
> 
> select HAVE_RUST if AEABI
> 
> Ideally this should work on any ARM core, but it's fair to require
> EABI.
> 
> The big reason: I think we want to be able to use Rust in kernel
> core components sooner than ARMv5 goes away from the kernel.
> 
> If testing is the only issue, I can provide testing on ARMv4, v5,
> ARMv5 BE etc, just tell me how to test. (But I guess it's more than
> that...)

The main reason that I only did this for ARMv7 was that I'm not very
familiar with older arm versions and that I only have v7 hardware for
testing.

I currently don't have much time to work on this, but when/if it 
works in qemu I'll send you a message to test it on HW.

Cheers
Christian

