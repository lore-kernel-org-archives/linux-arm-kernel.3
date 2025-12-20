Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12360E668AA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Dec 2025 01:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zK22OFLvaJjEwSRzCjqir8eHtku5CMTMzFAHnPXvPsE=; b=HMaHrVbzqj8UEDvuoIKgbOpxM4
	AD/g3fRHbemDAo3hw+wWWSG3b69KzEiD0oZgrYIFYEzCTJg/zH4I1wsU+9rxJxyvEgyoGxf7VPaeZ
	IofxYlfbp0t8/XJDX/LDh+sgClDCWbfDjFWHrvorU89HAeara2fUsBfkAByUKAMu7ngPz5Txrncwt
	cdrVpUIbzm7k6Ktp02uMwmJ/wzqBgrTA9sIF+s8uG0TfM9gao3Ceu/8ByqoTdKx8V3j4CfnZw1Ilp
	B5ch0/icbKrNeYarMfYsX/i/Rc5ODOjJg5dykeYl1DeTnMmbrl/ZLHuRFQfwnmkgP7Z4S7ihTw4u2
	W+eTqN+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWldK-0000000BADY-4ACJ;
	Sat, 20 Dec 2025 01:19:46 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWldH-0000000BACo-19Jc
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Dec 2025 01:19:46 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso20478285e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 17:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766193581; x=1766798381; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zK22OFLvaJjEwSRzCjqir8eHtku5CMTMzFAHnPXvPsE=;
        b=QDmfTBYZgc9OolnAboAk1jnyudho1MfpdEFCDAOe9bmlyMkBaoL4Qd+GynHNSa3TrK
         KB4qdUJ4rMSK9BXa+kfvZQPC6T5VzNMzt9EsWGk1zVcNfv9aUoPzoxQGgaYRKdWNDUFO
         JMhsblTXZ0rRqi/1rrOCoZomoEcwX2BjA4wc4I7GKATc8xKLxlOzeA1ygHXZlvDi0CBk
         9MCNXWzYTyQZfTKkH77q7UPzH7POzez57DxIBE6z5a1yvR5Wrzs7zcYpTTozE80spmvE
         QTgFvyRfR4mtGb3XbDs+f3r0LBy5gDwXVSoBcmv/3UW4ld1R+56NF7ciQVQvaW+jo+Ye
         lrjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766193581; x=1766798381;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zK22OFLvaJjEwSRzCjqir8eHtku5CMTMzFAHnPXvPsE=;
        b=Df+XxBrQuyKE/jmtsWYAxjXbKCD3oJ8ClIuKh96FK5vaUK4tkjsUJ+vzraLaokUbuP
         TaVVNd2eQX+jqnXnY3h5ftfsMMny6rzqkGYPUJa57LgvJxyLzT5Gy+oqPN9GgpkWYrwX
         fAlGPSdQ8gSP4vyDsffN6VXRjQwDi8uj71qiPXXmjzXCtDNYejCRlqeW16rKoBtCAtYB
         Qcl+Efhdlpgd9qEC178v4B4gXJPuoZr4tkG5Ewyp7A4af3jXHRvlMqaB4yWPxC4lQGQE
         QhsQn6S3wNj+xWpgjIrvHC+QEoDIsbyDzzMa1u9GQZN1exQeah3foTl8Fe331EHtA6K/
         qPEg==
X-Forwarded-Encrypted: i=1; AJvYcCUbpTSU7YG5WNFyvj+eZqzKcZT3lP7sxt1+O3AJOW3FogIOO71DnlvSryV5jNmKO3PyIR/DaQoBaxdI8T8K2ePl@lists.infradead.org
X-Gm-Message-State: AOJu0YwhgLSwnEcHu5VydRqh1p6kFF9UYec0u1GaD4oBCCghWkD5YNA+
	XkMjzXKgHcJQYsjjVWVDsTTkPxRheEhdFvo0fMXew+tFMJJhl2WMQ5++
X-Gm-Gg: AY/fxX44l8Wwwe7AUDtPuVI9btusL+ID2wcfybS63Kf5WquoZ16ookJp5t1MyXUyZ7q
	dneHrbpSj41ANTvgFt5+CBsrPqxH2Z5Kn9gHORUY34FE3t+ieKNPd0tQehsh1npQ++WcRPAm8uy
	7kky0Q378ThaGcbYDM5CcHGyfa4M/Z9xvaXz5I5Mtw7TZiLIcN19EG8MmBlnxwP4qtl3VzbeDXB
	fkHtZdBK3zNB/G5RA8mMJ6ySly1jEnoHpNNjm/iF1s1hLlZ5dHxU8iSeEoGlMogTiURUcyesIy8
	pSPlWRRCRy75smLbe60ayGhhfwQCUpPrqsEWJuntaLX5iUqnck8n/kdEjq4yj5Ls0XAp0DXgPe+
	11pgqcSbTGWlLTG/F555tRx4ldlfeLfFxdgu2DfGp2e7PYfuk4ZejHmFbZEyIKFW1b1A4V8vzwb
	YIMiHVTnRJQGj6vesbJk4UgXwrHxTDopinbI0=
X-Google-Smtp-Source: AGHT+IF0wGcWgILC9H3tfPesbVD2VmsjrslWPh0/J9HlYlPO8n11RyhVH5Pxz5vhOfwwh8J55YseTQ==
X-Received: by 2002:a05:600c:4f09:b0:477:7bca:8b2b with SMTP id 5b1f17b1804b1-47d195672d1mr43896195e9.15.1766193580895;
        Fri, 19 Dec 2025 17:19:40 -0800 (PST)
Received: from ?IPV6:2001:871:22a:3342::171c? ([2001:871:22a:3342::171c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be2723d19sm135576055e9.2.2025.12.19.17.19.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 17:19:40 -0800 (PST)
Message-ID: <0169d4f7-1a31-4ec6-a456-a6dfe2d99886@gmail.com>
Date: Sat, 20 Dec 2025 02:19:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ARMv7 Linux + Rust doesn't boot when compiling with only LLVM=1
To: Nathan Chancellor <nathan@kernel.org>,
 Rudraksha Gupta <guptarud@gmail.com>
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
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <20251219211147.GA1407372@ax162>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_171943_368656_AEC2FBDE 
X-CRM114-Status: GOOD (  37.69  )
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

On 12/19/25 10:11 PM, Nathan Chancellor wrote:
> Hi Rudraksha,
> 
> On Wed, Dec 17, 2025 at 02:21:11AM -0800, Rudraksha Gupta wrote:
>> On 12/16/25 06:41, Christian Schrefl wrote:
>>> On 12/14/25 12:54 AM, Rudraksha Gupta wrote:
>>>> Hello all,
>>>>
>>>>
>>>> I have the following problem: https://gitlab.postmarketos.org/postmarketOS/pmbootstrap/-/issues/2635
>>>>
>>>>
>>>> In short, what is happening is the following:
>>>>
>>>>
>>>> - The kernel boots and outputs via UART when I build the kernel with the following:
>>>>
>>>> make LLVM=1 ARCH="$arm" CC="${CC:-gcc}"
>>>>
>>>>
>>>> - The kernel doesn't boot and there is no output via UART when I build the kernel with the following:
>>>>
>>>> make LLVM=1 ARCH="$arm"
>>>>
>>>>
>>>> The only difference being: CC="${CC:-gcc}". Is this expected? I think this was present in the Linux kernel ever since Rust was enabled for ARMv7, and I never encountered it because postmarketOS was originally building the first way.
>>>
>>> I've managed to the get the build setup for qemu-armv7. For some reason
>>> I could not get past the initrd even on kernels that are supposed to work,
>>> but I think that is unrelated (and not a kernel issue).
>>
>> Yep, I just got qemu-arm working to drop into a debug shell for now. I have
>> to look into why other things aren't behaving nicely (but that's a problem
>> for later me :P). For now, it seems to demonstrate the problem nicely:
>>
>> https://gitlab.postmarketos.org/postmarketOS/pmbootstrap/-/issues/2635#note_521740
>>
>>
>>> On the linux-next kernel I didn't get any output on the console from qemu so I
>>> think I've reproduced the issue. Changing CONFIG_RUST=n did not change the behavior.
>>>
>>> So I this is almost certainly a LLVM/clang issue and not a Rust issue. I'll try to
>>> do a bit more digging, but I'm not sure how much I'll get done.
>>
>> Did a little more testing in addition to the testing in the gitlab issue
>> mentioned above:
>>
>> - Removed Rust configs from linux-next/pmos.config -> didn't boot on
>> qemu-arm and my phone
>>
>> - Then I removed Rust dependencies from linux-next/APKBUILD -> didn't boot
>> on qemu-arm and my phone
>>
>> - used linux-stable instead of linux-next -> booted on qemu-arm to a debug
>> shell
>>
>> linux-stable is built via gcc:
>> https://gitlab.alpinelinux.org/alpine/aports/-/blob/master/community/linux-stable/APKBUILD#L179
>>
>> linux-next is built via clang:
>> https://gitlab.postmarketos.org/postmarketOS/pmaports/-/blob/master/device/testing/linux-next/APKBUILD#L68
> 
> It certainly seems like LLVM / clang is a factor here based on the fact
> that LLVM binutils were being used with GCC based on the original report
> using 'LLVM=1 CC=gcc'. A few additional ideas for narrowing this down:
> 
>   * Does this reproduce with GNU binutils + clang (i.e.,
>     CROSS_COMPILE=... CC=clang)? This would further confirm that clang
>     is the cuplrit since GNU binutils and GCC are confirmed working with
>     linux-stable, correct?
> 
>   * Does this reproduce when linux-stable is built with clang / LLVM=1?
>     This would rule out a -next specific regression as well as allow
>     diffing the linux-stable GCC configuration with the clang
>     configuration to see if there are any configurations that get
>     enabled only with clang, which could be another reason no issue is
>     seen with GCC.
> 
>   * Our continuous integration boot tests several ARM configurations in
>     QEMU, including Alpine Linux's:
> 
>     https://github.com/ClangBuiltLinux/continuous-integration2/actions/runs/20379046102/job/58575229973
> 
>     So it is possible that a postmarketOS configuration option
>     introduces this?
> 
> The results of that testing might give us a more obvious direction to go
> for troubleshooting, especially since this appears to reproduce in QEMU,
> which should make debugging in gdb possible.

I've found the issue (at least on qemu), it was just that the driver for
the PL011 serial was not included in the config.

I don't know why Rudraksha would have observed any difference disabling
Rust or clang though.
Maybe it's an entirely different issue on Hardware?

> 
> Also, what version of clang is this?
>

Alpine clang version 21.1.8

Cheers,
Christian


