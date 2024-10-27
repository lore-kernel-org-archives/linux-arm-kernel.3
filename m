Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF36D10C08
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Oct 2024 08:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LMk7TYTfiOGw1ZUTKaXXGsrR341gp20XheXlgdbWBCM=; b=E2NKRvP7H/4PWjzN4127/Vjkeq
	nB8AOGJkg1YsxXQxgqclVh0eIhzj2GFAlSpHn9f6pMO41PImEDRKED612/qPFbo7c3CXViCZgQLJY
	o2fo6nEAZkMQFE7LJGVMw1PFwocla187xKdLM2X6T15CZki3TbF5qigQl04EYjvviH8bpXvkjLTKg
	bkRjFXbEkLX+ZMH16ym9aIk07/EkEQ+ec/U5aPCkQfO2M7nmKblmfQFd96Ou+7FlSl7vGQaOfWfEi
	OahBkals69PYgTuMp/AmbhWXFYCz86aWNFP4RrB+A+d8OwYJa4ro4q0Gl7RgCKVszvIaqU+r16qKi
	Pomgemkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4yRw-00000007pCe-3ZMn;
	Sun, 27 Oct 2024 08:16:36 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4yQL-00000007p2A-2osN;
	Sun, 27 Oct 2024 08:14:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 926B7A40CA1;
	Sun, 27 Oct 2024 08:12:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 681F1C4CEE8;
	Sun, 27 Oct 2024 08:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730016895;
	bh=qSAev/CmbF0LEyj0tVSWN8qmCbJsiIZdku/WjaNmB8Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MZrpP4MR25ZJQaUjkXbWvdc5yqspOvJPpoP1laWGfu5qW0Bo5w7+sOKkNN0wFTFc6
	 PKiAnBHnQLbmymCc6Ix2g32z3lrMLVbYBDbKHRK7wTcnhc0s7TmExnWPBavGFZA2CU
	 ZxRZ2yQKLbZi954nmodxa3gz2r2765XCY13DTcc/5moZEI1Y5VMl2qOE1/CaCzYfBZ
	 d0xolS/t0CNAWzjdhJc8/vC18yj/tzng9oiNhW1i1/DM5wimZSMibZgTJJr4RQf+Mz
	 txNna8i6XM73z7TsjE2DyvvJtyQZu6VY2mWd8g1ZuHlsQxirw+6OUnQuLNMsd9yjTi
	 Vo6meRtf3emmg==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2fb51f39394so32281381fa.2;
        Sun, 27 Oct 2024 01:14:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUp5c29Fa2NtL+a1VyMF5YL1fHu2wzoP4pSSZ4q/JbTFJ/QmHomjDHpRUhAn9QZUijK/e0Et9HK0oq9Vh5XUJX/@lists.infradead.org, AJvYcCWLseB0PD9zV9HAsV9C0qyfDuzRcbO30jhfIITbhV6rUIJ5a+Hl9fDquV2dQrc1AzzYHuQsay74AGqfyVk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy55ybZjrG3nAGsNY7928MvRfQ0huaD0x1F6JIyjCVUgf2TbAfK
	fpvZw0JWjDUoWfbk6knlajlQDxxXfEHILtx675XFvCepYhE6c8zRlD6N0Ps10U6kV6k7CHdg7GQ
	eSGzOHSMkwlhFtC7e6ZPUMSVwU4Y=
X-Google-Smtp-Source: AGHT+IG7GbUAQTdcFb1Y8OjbqKjN3ralEO/b0dHGyoLDxr37yV7KwVs1ozIjCmGYYGFlqbwOihVt3NM/p1aqclI347g=
X-Received: by 2002:a2e:be9a:0:b0:2fb:58c0:de5b with SMTP id
 38308e7fff4ca-2fcbdfb098emr13787941fa.11.1730016893642; Sun, 27 Oct 2024
 01:14:53 -0700 (PDT)
MIME-Version: 1.0
References: <20241025191454.72616-1-ebiggers@kernel.org> <20241025191454.72616-5-ebiggers@kernel.org>
 <CAMj1kXEsq7iJThqZ7WA00ei4m59vpC23wPM+Mrj9W+HXfk-aSg@mail.gmail.com>
 <20241025220239.GB2637569@google.com> <20241026040958.GA34351@sol.localdomain>
In-Reply-To: <20241026040958.GA34351@sol.localdomain>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sun, 27 Oct 2024 09:14:41 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGGDNmPSH4nZH4r6b4UyrPEYBbTZibjXkmxU9c=16_hhw@mail.gmail.com>
Message-ID: <CAMj1kXGGDNmPSH4nZH4r6b4UyrPEYBbTZibjXkmxU9c=16_hhw@mail.gmail.com>
Subject: Re: [PATCH v2 04/18] crypto: crc32 - don't unnecessarily register
 arch algorithms
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, 
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	sparclinux@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_011457_864305_021E3208 
X-CRM114-Status: GOOD (  46.17  )
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

On Sat, 26 Oct 2024 at 06:10, Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Fri, Oct 25, 2024 at 10:02:39PM +0000, Eric Biggers wrote:
> > On Fri, Oct 25, 2024 at 10:47:15PM +0200, Ard Biesheuvel wrote:
> > > On Fri, 25 Oct 2024 at 21:15, Eric Biggers <ebiggers@kernel.org> wrote:
> > > >
> > > > From: Eric Biggers <ebiggers@google.com>
> > > >
> > > > Instead of registering the crc32-$arch and crc32c-$arch algorithms if
> > > > the arch-specific code was built, only register them when that code was
> > > > built *and* is not falling back to the base implementation at runtime.
> > > >
> > > > This avoids confusing users like btrfs which checks the shash driver
> > > > name to determine whether it is crc32c-generic.
> > > >
> > >
> > > I think we agree that 'generic' specifically means a C implementation
> > > that is identical across all architectures, which is why I updated my
> > > patch to export -arch instead of wrapping the C code in yet another
> > > driver just for the fuzzing tests.
> > >
> > > So why is this a problem? If no optimizations are available at
> > > runtime, crc32-arch and crc32-generic are interchangeable, and so it
> > > shouldn't matter whether you use one or the other.
> > >
> > > You can infer from the driver name whether the C code is being used,
> > > not whether or not the implementation is 'fast', and the btrfs hack is
> > > already broken on arm64.
> > >
> > > > (It would also make sense to change btrfs to test the crc32_optimization
> > > > flags itself, so that it doesn't have to use the weird hack of parsing
> > > > the driver name.  This change still makes sense either way though.)
> > > >
> > >
> > > Indeed. That hack is very dubious and I'd be inclined just to ignore
> > > this. On x86 and arm64, it shouldn't make a difference, given that
> > > crc32-arch will be 'fast' in the vast majority of cases. On other
> > > architectures, btrfs may use the C implementation while assuming it is
> > > something faster, and if anyone actually notices the difference, we
> > > can work with the btrfs devs to do something more sensible here.
> >
> > Yes, we probably could get away without this.  It's never really been
> > appropriate to use the crypto driver names for anything important.  And btrfs
> > probably should just assume CRC32C == fast unconditionally, like what it does
> > with xxHash64, or even do a quick benchmark to measure the actual speed of its
> > hash algorithm (which can also be sha256 or blake2b which can be very fast too).
> >
> > Besides the btrfs case, my concern was there may be advice floating around about
> > checking /proc/crypto to check what optimized code is being used.  Having
> > crc32-$arch potentially be running the generic code would make that misleading.
> > It might make sense to keep it working similar to how it did before.
> >
> > But I do agree that we could probably get away without this.
>
> While testing this patchset I notice that none of the crypto API drivers for
> crc32 or crc32c even need to be loaded on my system anymore, as everything on my
> system that uses those algorithms (such as ext4) just uses the library APIs now.
> That makes the "check /proc/crypto" trick stop working anyway.
>
> I think you're right that we shouldn't bother with patches 3-4, and I'll plan to
> go back to leaving them out in the next version, unless someone yells.
>

Agreed.

If we need to make this distinction, it might be cleaner to use the
static_call API instead, e.g.,

+DECLARE_STATIC_CALL(crc32_le_arch, crc32_le_base);
+
 static inline u32 __pure crc32_le(u32 crc, const u8 *p, size_t len)
 {
        if (IS_ENABLED(CONFIG_CRC32_ARCH))
-               return crc32_le_arch(crc, p, len);
+               return static_call(crc32_le_arch)(crc, p, len);
        return crc32_le_base(crc, p, len);
 }

and use static_call_update() to update the target if the feature is
supported. Then, we could check in the driver whether the static call
points to the default or not:

+static bool have_arch;
+
 static int __init crc32_mod_init(void)
 {
+       have_arch = IS_ENABLED(CONFIG_CRC32_ARCH) &&
+                   static_call_query(crc32_le_arch) != crc32_le_base;
+
        /* register the arch flavor only if it differs from the generic one */
-       return crypto_register_shashes(algs, 1 + IS_ENABLED(CONFIG_CRC32_ARCH));
+       return crypto_register_shashes(algs, 1 + have_arch);
 }

