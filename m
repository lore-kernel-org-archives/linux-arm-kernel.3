Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45FA6C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Feb 2025 01:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S0DQdadGCnyVsgh8PC3cx3y3mc3bFhrG3Rxn1uJLbjU=; b=sH4zfKeZvbOl9bSlokl2SKwuIV
	cvZBm5pKQYxlbEBn46gLt62WUuR8mYoeLrshCJ30Z5kk854ZI9a1cZ2amQQyl4R7t/ukpCn9sftHW
	tR0U0M05IE0r2SW0hGue1TdcfW3Upn34lDWn9PWt1q+1ZIEY6XslKkA4cTZAe2VLj4FMRUfGH1IBS
	ne6ToFi9mktGIzZlo4Sp9del7hwj+MtZTfSq0N52ED/bXUddDy511SDDYzYE6Z+ZrJtKdmdQocZBl
	jG9Ea1PH+Pwff/kb/JSEBkh9ZMIAvEzi8mJmhvj+IMbrOpJQqWG1Decs2FZtX92bcBPIvVWO29ZhO
	wNQOtUDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1te1sV-0000000BiSs-49aQ;
	Sat, 01 Feb 2025 01:00:55 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1te1qC-0000000BiIm-42vE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Feb 2025 00:58:34 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43690d4605dso18197725e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jan 2025 16:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738371511; x=1738976311; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S0DQdadGCnyVsgh8PC3cx3y3mc3bFhrG3Rxn1uJLbjU=;
        b=F0+jJWATb24XWFy6nF/pL7H7XsfeiEsJDHG1V1omsq2My21DqEfWVaPvQDZYSBDM/N
         LjhlsSJ+o8rT42BDKMMmW9AwKzmmjc4r+xtr6MjFxfW4+ywfSUeKNnqt5vy5pZLQ3x3R
         5bpIjkDywlCZSYmPT1T97oTW7AQHb3KS0M8z6jX8SW6p6D28iPf/E5CP9pYntQoKMaue
         Ip8pwAV9Mt2NbKRcZIgKesTbiDy+Osi3mq423lM03NdwyAuZm3NqkUk57ynwLLZBkREL
         dcFv8l55D3LYxg2HxVXahQkjncn8NRI6qIViRaSQqkCVj+jmXsU4IG3E9ikpIMnnjwyX
         8uXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738371511; x=1738976311;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S0DQdadGCnyVsgh8PC3cx3y3mc3bFhrG3Rxn1uJLbjU=;
        b=X7K/n5Vp476sWg1vEIWRuC5O3I/Ksldou3oCtFo9LkUUCWbEOCDF0fHkL/PVXsX/mq
         WAErSMt2tILiMF5bcArG+axko4uN5Y/4j5CFwPkqI/UgFKkUap72VKxKRvWXO0aKloD4
         m66ZEwIEzdMfCWER9SiZntWWWNtcjvk4JM4RLrD1mdtiKLrvNA5Ui3p1cBFs35Myhvhm
         bxNGtQfbRahFtcJvf98MawvpmfWGpSs0cgSkt8vrEnWdUNIa2hErPo6x0Srh0j1F9jTz
         SSTQIFT4XgaLm88+f93yCPn2zzuJAkMWOPkwF/g6cBslgGnLEX1JEj8S6zSTE6KWg4e7
         ddKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUziRo+/6Rt038lPc+EB/4PIz5nGvW9n4tsJlOGogePbRxOTY+uIqxBxmnaNXN9fC2ljuxecwNMAre3KxmYojXs@lists.infradead.org
X-Gm-Message-State: AOJu0Yxyxkc7vTaA34YfkBfObRYPvj6Fq2xqGilGr670CmZSyCUxytmQ
	ZjK69VZJPLSwmWtcwlh8mnKoCspiS2iqwnqGqUd/bWtK55vhk7Ob
X-Gm-Gg: ASbGncvguIk2jNoIdoO9pzeN2HBg7lrDj9e3kWDbFtuR5ZWURT1kDnUz3OxMeA+tCjk
	u+DJm4phygjK9nRq8KejLbpx16PD/0snBIgmi0V/FHwITspvKnIq0WHzv9Y63ny27/0YGRQxRLd
	RzCM4+5dzxs5KJqUbYfZtnyBxbPqbu+b6+1a9BGXpQOLiICO7YUp8hg0JTHzyQmQEO9jhFGnFQC
	zl/szLbSZoDeAPsgcm8MzczBjo8MfPpgUhaLu9sS+75/ARMVfRZvsM+Q8WYvQHFfWNpkViYLm1L
	VIb1h/b27qSAmoapBbZTwptlc4xc
X-Google-Smtp-Source: AGHT+IFFQKg7DyGdtCXt0WCRB1j2aK57eJ3GDImbT0dCbP/SUetC7Ta/AC6CvAyAQl/hFXp2OU35/g==
X-Received: by 2002:a5d:6d86:0:b0:38c:5c7a:dfae with SMTP id ffacd0b85a97d-38c5c7ae299mr7747825f8f.43.1738371511038;
        Fri, 31 Jan 2025 16:58:31 -0800 (PST)
Received: from ?IPV6:2001:871:22a:8634::1ad1? ([2001:871:22a:8634::1ad1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ebfdasm6047508f8f.17.2025.01.31.16.58.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 16:58:30 -0800 (PST)
Message-ID: <254593b3-613d-4536-b69b-74a41f0feb09@gmail.com>
Date: Sat, 1 Feb 2025 01:58:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm: rust: Enable Rust support for ARMv7
From: Christian Schrefl <chrisi.schrefl@gmail.com>
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
 <defddc25-eb8b-420a-b64c-6ce57ebb3f6b@gmail.com>
Content-Language: en-US, de-DE
In-Reply-To: <defddc25-eb8b-420a-b64c-6ce57ebb3f6b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_165833_009733_94777748 
X-CRM114-Status: GOOD (  16.58  )
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

On 01.02.25 12:42 AM, Christian Schrefl wrote:
> On 31.01.25 8:37 PM, Arnd Bergmann wrote:
>> On Fri, Jan 31, 2025, at 19:58, Christian Schrefl wrote:
>>> On 31.01.25 5:05 PM, Andrew Lunn wrote:
>>>>> To fix this Rust would have to provide a way to build the core
>>>>> library without float support. I don't know if there is a plan
>>>>> already to allow this.
>>>>
>>>> Floating point is banned within the kernel, except for in very narrow
>>>> conditions, because the floating point registers are lazy saved on
>>>> context switch. If the kernel uses the floating point registers, you
>>>> can break user space in bad ways.
>>>>
>>>> I expect this has been discussed, since it is well known kernel
>>>> restriction. Maybe go see what happened to that discussion within RfL?
>>>
>>> After checking again, it seems the float intrinsics are actually not
>>> needed anymore at least for my config.
>>
>> Ah, nice! If this is true for all architectures using the current
>> rust compiler, it would be great to remove the FP stubs entirely
>> and have link errors instead of panicking, to make it consistent
>> with C.
> 
> After a quick test it seems that (most?) intrinsics are not needed
> anymore on x86, but not sure if that's valid for all supported rust
> versions and config options.

On Rust 1.84.1 only __udivti3 is requied, with 1.78 most of the
intrinsics seem to still be required.

Cheers
Christian

