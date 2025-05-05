Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E33D1C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 07:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t99fDuW/VyJsjnpy4xNP2tCmCQ9Ru1HIE6PictQuyO0=; b=iRZFHY8kDlvvah3JdqMeZ7N0ZK
	YqikboKzJ5u8x8Vul2OOR8bEuoZF6ArJQXdisBlcoB80rXFHAQ3r8v7TqVAmIwXVgUyMI8Zd/Wz7J
	f3tIOYudekQ2ptriNFAj7GD9G/AMILIMz2klULSpoLeB0a5Q5R0Ki8LlCqvmpXtofSw/L109JC7xw
	/AF0p04vlE9JeI242is9KSuiCrtGzD6+PHpozjXAlpk8goi1Jie8vqMV8tZ2QH8Bu51+a3VYTaAxO
	qNniSdnjyFk6XxkWoi08NGL0qzHxXr863V9fNH47gXv4v1I2xCMlWthBs5ADuv4s1lv894XIEiOCB
	4JqtZs2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBqQQ-00000006fTM-1WNR;
	Mon, 05 May 2025 07:39:42 +0000
Received: from xavier.telenet-ops.be ([2a02:1800:120:4::f00:14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBqOQ-00000006fBn-12tq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 07:37:40 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:d7e4:b7bb:4b2:82d6])
	by xavier.telenet-ops.be with cmsmtp
	id lKdX2E00M1ymvt901KdXWs; Mon, 05 May 2025 09:37:32 +0200
Received: from geert (helo=localhost)
	by ramsan.of.borg with local-esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uBqOJ-00000000jmg-1kdV;
	Mon, 05 May 2025 09:37:31 +0200
Date: Mon, 5 May 2025 09:37:31 +0200 (CEST)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
cc: Christian Schrefl <chrisi.schrefl@gmail.com>, 
    Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
    Jocelyn Falempe <jfalempe@redhat.com>, Arnd Bergmann <arnd@arndb.de>, 
    rust-for-linux <rust-for-linux@vger.kernel.org>, 
    Linux ARM <linux-arm-kernel@lists.infradead.org>, 
    dri-devel <dri-devel@lists.freedesktop.org>, 
    Linus Walleij <linus.walleij@linaro.org>
Subject: Re: `u64` by `u64` div/mod in DRM QR for arm32
In-Reply-To: <Z_1mEHnzYjhz0Ldz@shell.armlinux.org.uk>
Message-ID: <5bcf120e-72a4-fd2e-c70a-3cd34d04fc88@linux-m68k.org>
References: <CANiq72ke45eOwckMhWHvmwxc03dxr4rnxxKvx+HvWdBLopZfrQ@mail.gmail.com> <38867e79-c0e3-4bcd-bdf9-3fb5b571d51e@gmail.com> <Z_1mEHnzYjhz0Ldz@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_003738_423629_6A4C4E3C 
X-CRM114-Status: GOOD (  24.65  )
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

 	Hi Russell,

On Mon, 14 Apr 2025, Russell King (Oracle) wrote:
> On Mon, Apr 14, 2025 at 09:21:42PM +0200, Christian Schrefl wrote:
>> Hi Miguel,
>>
>> On 14.04.25 8:14 PM, Miguel Ojeda wrote:
>>> Hi Jocelyn, Christian,
>>>
>>> I started build-testing arm 32-bit within my other usual routine
>>> tests, and I hit:
>>>
>>>     ld.lld: error: undefined symbol: __aeabi_uldivmod
>>>    >>> referenced by drm_panic_qr.rs:417 (drivers/gpu/drm/drm_panic_qr.rs:417)
>>>    >>> drivers/gpu/drm/drm_panic_qr.o:(<drm_panic_qr::SegmentIterator
>>> as core::iter::traits::iterator::Iterator>::next) in archive vmlinux.a
>>>
>>> which comes from both these `u64` by `u64`:
>>>
>>>     let out = (self.carry / pow) as u16;
>>>     self.carry = self.carry % pow;
>>>
>>> Christian: I guess we can offer a set of `div64` functions using the C
>>> ones, at least for the time being, and eventually wire the actual
>>> operator with some support from upstream Rust. Or do you have
>>> something else in mind? (i.e. I think you have been discussing
>>> intrinsics lately)
>>
>> I think using the C implementations is fine. Not sure how much the
>> FFI is going to matter for performance, but it should be rare enough
>> that is shouldn't matter (and hopefully we will get cross lang LTO
>> or something similar at some point).
>>
>> We could also just implement the intrinsic(s) ourselves, but then
>> the u64 divisions would be implicit which is probably undesired.
>> We could also rename the intrinsics so they are only usable from
>> specific crates.
>>
>> I think we need the opinion of the some arm people here.
>>
>> CC Russell King and Linus Walleij.
>
> The kernel has had the general position that u64 by u64 division is
> silly and isn't supported. Several 32-bit architectures including

s/isn't supported/isn't supported implicitly/

> 32-bit ARM don't support it.

It is supported when called explicitly through div64_u64()
https://elixir.bootlin.com/linux/v6.14.5/source/include/linux/math64.h#L60
But you better think twice before using it, especially in
performance-critical code.

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds

