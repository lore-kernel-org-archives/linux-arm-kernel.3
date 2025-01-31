Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5904C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 15:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YlN3hvL9n56nyWua3u4fzIOe7QsEs4Hpzyubxj9K5cE=; b=C2C4d/Ut29OFrmRDfVulfYxBWh
	cknT9Il6GfAh91YEFzR1MhKjlE6zrMYpyRpbF/FGBze2nU9naKrJ4UQ9MX2mIanHkDuXEfLFJwVKe
	S1XYSZW56xicYsqj3rsbKXY2ll+aFRcO/33G1ieURx2qZqEMrSdZgMgS6IU8XyjFwY/aC+kZBzecf
	h6J/1ix8UYQuSlBjt7P/oxNmZU28a0lvy7jFWyF0GEAiEQPXlnAJQJg5M+Tbj4xbGNlVTlN0eRIzs
	qLQDUPRBC2f8GtFWMkDQvAJBWUevP+RY1lYeIaA4OSzOMltgr7iBZTom1C3BtBPAPcQfWd1MvJsgr
	+DACvePQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdt3N-0000000ArKd-3POC;
	Fri, 31 Jan 2025 15:35:33 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdt24-0000000Ar8U-0vUX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 15:34:13 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-38789e5b6a7so1169172f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jan 2025 07:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738337650; x=1738942450; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YlN3hvL9n56nyWua3u4fzIOe7QsEs4Hpzyubxj9K5cE=;
        b=QlqkY6paZNrxhOK16+fsO1yT0w5Oo/Csdi8C44Fw4ojayUF2FZKhyUAbE8K2yT6S7I
         X5a+LOP9sP1SWs/QBVMhlX/vXpgKV6/Y0b4ufLYxQTTxCxzh07K0i6BJHm/upbo+I4fL
         Ijepz4sQuAIaS2J5hIVJCwYYCf07ufU0JD0CFKiuupANwTSqBReQpNVeAO+aY8rzDWNN
         ft3YRuDqhCMEdZXARKUgELtot/osTlJGBne1hpACIeHSpwnKWcq5OCovDEbzgm5vMvxi
         NxiKTLryFrXf971ybi34IUqxJhTKSRbmD/hW3wKFhUain4ALVFxol2LGsFNqVmZcLBN2
         Sm8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738337650; x=1738942450;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YlN3hvL9n56nyWua3u4fzIOe7QsEs4Hpzyubxj9K5cE=;
        b=H58b5kiZSZ3L0Q4JmTFGexC0D6GBvJ/ppVErjXozwGas3MPPoNudvK+k906fhKlbJN
         pLrhR5j9c/UxYQf9qEm1uGZZ5OcN+3q+6vaycnTWjYCbc6avTJNgmT0ogUQPNkxYnYyg
         LPXMenNjIZK1CyxVV3A7fpp29hkNHI7ShGVNk0zStfrMbuW7r5GaslapjGr+567ne9IX
         lzUk0lKfl7u4XID3tK1S0YNn3yD0MT8hC9Jq2BeNWZh8hDDEKp55G+pC56HldYGk8lmO
         HlJtop7jRtu5iyLEEjlRnUSGHqlHmnoLp4FdutNxIoOeZm2j/wdlurbi5phcVc5BSFQW
         uXTg==
X-Forwarded-Encrypted: i=1; AJvYcCWM3eldQYj/DnxdD4dyGgORjhwGENLWm9Gy9/kI9wv9css8wlJnfSwBLE+OzK1jCmMAqGr79T1h427q8imFrsrH@lists.infradead.org
X-Gm-Message-State: AOJu0YwtW6+bfEc49K6FwKMAp02C0g4fqQKDBCwHQaMGI+t4jzXLsqye
	qhG5R5qZelhsALo3hcp3gpxIKDEOzj0cOfpD/6jGn3MjFoL34JVV
X-Gm-Gg: ASbGncuNxKLr5SzUPenGtV/ylE/GB27Ql8tKIHtz0QdjqDJev4e/9mW4nJX6jOctFJ2
	Kz9E8Q4NQkiTP6BxZMuq9IIPKiI9sPrif8qbCybkbSuj5/FbZriSh1QjxsGcNFUu0qoLDXxwIQF
	S1BM5d82yX3mrCVRKNlPkmDjxn042Wmkp/jRJxWHYjSpRBLlAjiAA5o+DUGkm55IuAGlh0CbkIx
	uceFHBjr0yGjVtDkUKFbPEqnOYdohYggIkri3CVE6VaiSNM2xVO1jKQ9CPiXAsHCKj0dQsOPS2l
	Cveb2t/6DWPy8VtFfLdyY0MH5HZ5
X-Google-Smtp-Source: AGHT+IGeZg8pc1dnHI93SS1bPuVQwFVdIXopfhzkJBDwn8qHPECSHOzdEIGLge2i0w0yjCScGHxjxA==
X-Received: by 2002:a05:6000:2ac:b0:38c:5cd0:ecd4 with SMTP id ffacd0b85a97d-38c5cd0f0f5mr5634438f8f.6.1738337650276;
        Fri, 31 Jan 2025 07:34:10 -0800 (PST)
Received: from ?IPV6:2001:871:22a:8634::1ad1? ([2001:871:22a:8634::1ad1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1cf555sm4998186f8f.97.2025.01.31.07.34.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 07:34:10 -0800 (PST)
Message-ID: <f8b59f05-55b5-4208-8bdf-b4be8e93bc22@gmail.com>
Date: Fri, 31 Jan 2025 16:34:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm: rust: Enable Rust support for ARMv7
To: Arnd Bergmann <arnd@arndb.de>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Jonathan Corbet <corbet@lwn.net>,
 Russell King <linux@armlinux.org.uk>, Rudraksha Gupta <guptarud@gmail.com>,
 Ard Biesheuvel <ardb@kernel.org>, Geert Stappers <stappers@stappers.nl>,
 Andrew Lunn <andrew@lunn.ch>, Jamie Cunliffe <Jamie.Cunliffe@arm.com>,
 Sven Van Asbroeck <thesven73@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250123-rfl-arm32-v3-1-8f13623d42c5@gmail.com>
 <a83b0149-7055-411b-ba86-d227919c7c32@app.fastmail.com>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <a83b0149-7055-411b-ba86-d227919c7c32@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_073412_269393_8CE91DF1 
X-CRM114-Status: GOOD (  27.78  )
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



On 31.01.25 8:40 AM, Arnd Bergmann wrote:
> On Thu, Jan 23, 2025, at 23:40, Christian Schrefl wrote:
>> This commit allows building ARMv7 kernels with Rust support.
>>
>> The rust core library expects some __eabi_... functions
>> that are not implemented in the kernel.
>> Those functions are some float operations and __aeabi_uldivmod.
>> For now those are implemented with define_panicking_intrinsics!.
> 
> I see you are doing this part the same as the other architectures,
> but I don't see why it's done like this in the first place:
> 
> In C code, we really want to get a link failure rather than a
> runtime error in order to catch those bugs as early as possible
> and fix them before even trying to run the kernel. Is there a
> reason this doesn't work in rust, or is there a plan to change
> this later when the existing callers of those functions have
> been fixed?

I agree having a linker error instead of a runtime panic would
be ideal, but it is currently impossible to build without these
intrinsics.

To fix this Rust would have to provide a way to build the core
library without float support. I don't know if there is a plan
already to allow this.

> 
> 202397be76d8037b531b34dee16c7dfcfd0124ef..3375c91e698c024f95a85682f5a91d9815c355e5 
>> 100644
>> --- a/arch/arm/Kconfig
>> +++ b/arch/arm/Kconfig
>> @@ -130,6 +130,7 @@ config ARM
>>  	select MMU_GATHER_RCU_TABLE_FREE if SMP && ARM_LPAE
>>  	select HAVE_REGS_AND_STACK_ACCESS_API
>>  	select HAVE_RSEQ
>> +	select HAVE_RUST if CPU_LITTLE_ENDIAN && CPU_32v7
> 
> The ARMv7 dependency makes sense, but I think it needs
> be disabled on combined v6/v7 kernels, like (CPU_V7 && !CPU_V6 && !CPU_V6K).

That might be correct, I don't know much about the build
system for the kernel. I've tried it and it still builds
with this change.

Also it should probably be relatively easy to support 
armv6 as well.

Cheers
Christian


