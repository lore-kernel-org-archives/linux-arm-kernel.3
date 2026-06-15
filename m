Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1CD3CD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 20:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=as7Ogfoc/AyskAy2+J9eXyhxUhgDui71XAx+CHT5Mew=; b=dlTefuu8phVRT4hyUuRCu+Hi4E
	qLr1t3WSQma0gutqfDlqpRoK6R/2tvdB1vSRRwfN0CNTMCpiN0LkARmO5pmBXNuDdvJrfM3SrScrJ
	v8xkTktKkn5SEkjci6xcBWr+vfP0sc7lxMNqG9losYG4rG+i0vmn8JAWTiVsNW0zNXgiEzp/vGWGQ
	tALQgL/N29ld3xLrbZ58KgMPT/t6osunYq8mGqFfKRl6u05tVRea9LjfZilJ6UcmfaqZ15MpCyVoq
	5O2pbNjHL4+C7h8fuL3q0fWrNhRdjadIqYv75cBjCCt1K+bAcLQYUvSejbCKY8Rb1ZAGl1Uu+BEJL
	6OpA5e8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZDzn-0000000Eono-1q1Q;
	Mon, 15 Jun 2026 20:33:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZDzm-0000000EonZ-0zGd;
	Mon, 15 Jun 2026 20:33:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 77BF54360F;
	Mon, 15 Jun 2026 20:33:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D89131F000E9;
	Mon, 15 Jun 2026 20:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781555601;
	bh=as7Ogfoc/AyskAy2+J9eXyhxUhgDui71XAx+CHT5Mew=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=E86R2Mc0QLlmn6hDEj5MnafzRYyOh8VthGPhggOCVEqZ9xx+sywlJb7QXeIaMbEFA
	 rvREbsI3Zv0iMBuDfYoDef4TgGcmk0gnzth2mBKPpYT5zfQfxZKaETEbxVznMvRfoH
	 piXE10ylpTWfk/t+pECRYcy/iMGYN/iwRMhVbs6e5bPwfcEmSrgpliHOIWdD3C35KZ
	 3dd4XZnD7RANNMAcrkEHv2ZJgOVbQ7VfGmUoC1gB6jeJzKn1pSM0YTSpCEnNMVRUEO
	 3IE0flzeBTi4viwUUEYjyjwYKI+KhiEhnh6PLe1a+NU0sfU6WVODjevHGI2ZZiYcfX
	 AyBnvEPDADOhQ==
Message-ID: <131a450f-f9c6-464c-8e4e-a4c7a29fb5de@kernel.org>
Date: Mon, 15 Jun 2026 22:33:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/19] init: discoverable root partitions, a.k.a. an
 omittable "root=" cmdline option
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Jens Axboe <axboe@kernel.dk>, Davidlohr Bueso <dave@stgolabs.net>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-efi@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Matt Turner <mattst88@gmail.com>, Magnus Lindholm <linmag7@gmail.com>,
 linux-alpha@vger.kernel.org, Vineet Gupta <vgupta@kernel.org>,
 linux-snps-arc@lists.infradead.org, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 loongarch@lists.linux.dev, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, linux-s390@vger.kernel.org,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
References: <20260615-discoverable-root_partitions-v1-0-39c78fac42e2@kernel.org>
 <20260615170432.GW2636677@ZenIV>
From: Vincent Mailhol <mailhol@kernel.org>
Content-Language: en-US
Autocrypt: addr=mailhol@kernel.org; keydata=
 xjMEZluomRYJKwYBBAHaRw8BAQdAf+/PnQvy9LCWNSJLbhc+AOUsR2cNVonvxhDk/KcW7FvN
 JFZpbmNlbnQgTWFpbGhvbCA8bWFpbGhvbEBrZXJuZWwub3JnPsKZBBMWCgBBFiEE7Y9wBXTm
 fyDldOjiq1/riG27mcIFAmdfB/kCGwMFCQp/CJcFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcC
 F4AACgkQq1/riG27mcKBHgEAygbvORJOfMHGlq5lQhZkDnaUXbpZhxirxkAHwTypHr4A/joI
 2wLjgTCm5I2Z3zB8hqJu+OeFPXZFWGTuk0e2wT4JzjgEZx4y8xIKKwYBBAGXVQEFAQEHQJrb
 YZzu0JG5w8gxE6EtQe6LmxKMqP6EyR33sA+BR9pLAwEIB8J+BBgWCgAmFiEE7Y9wBXTmfyDl
 dOjiq1/riG27mcIFAmceMvMCGwwFCQPCZwAACgkQq1/riG27mcJU7QEA+LmpFhfQ1aij/L8V
 zsZwr/S44HCzcz5+jkxnVVQ5LZ4BANOCpYEY+CYrld5XZvM8h2EntNnzxHHuhjfDOQ3MAkEK
In-Reply-To: <20260615170432.GW2636677@ZenIV>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 15/06/2026 at 19:04, Al Viro wrote:
> On Mon, Jun 15, 2026 at 06:08:56PM +0200, Vincent Mailhol wrote:
> 
>> Tested with GRUB, which implements the LoaderDevicePartUUID EFI variable
>> in its bli module [3]. With this, I was able to boot a kernel with a
>> completely empty cmdline and no initrd.
>>
>> [1] The Discoverable Partitions Specification (DPS)
>> Link: https://uapi-group.org/specifications/specs/discoverable_partitions_specification/
>>
>> [2] systemd-gpt-auto-generator
>> Link: https://www.freedesktop.org/software/systemd/man/latest/systemd-gpt-auto-generator.html
>>
>> [3] GRUB -- §16.2 bli
>> Link: https://www.gnu.org/software/grub/manual/grub/html_node/bli_005fmodule.html
> 
> So what does that thing, tied to EFI as it is, have to do with architectures where
> 	* firmware is rather unlike EFI

I made CONFIG_DPS_ROOT_AUTO_DISCOVERY depend on CONFIG_EFI for this reason.

> 	* firmware wouldn't know what to do with GPT
> 	* GRUB is *not* ported to, let alone used
> such as, say it, the very first one mentioned at your [1]?

Fair point. I just did:

  $ git grep "^config EFI$"
  arch/arm/Kconfig:config EFI
  arch/arm64/Kconfig:config EFI
  arch/loongarch/Kconfig:config EFI
  arch/riscv/Kconfig:config EFI
  arch/x86/Kconfig:config EFI

Anything not in this list is dead code at the moment.

> Or is that conditional upon "if anyone wants to design replacement firmware
> for those, and if they agree to follow our wishlist"?

No, it was just an oversight from my side. I will just keep arm, arm64,
loongarch, riscv and x86 in my v2.


Yours sincerely,
Vincent Mailhol


