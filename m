Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00350D149F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 21:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ei0o2F0WAxmbHAc1v9cvoOiKkz6QVV2vp8sChbLZwww=; b=FSMq1Qtmyq9jZw5n2TIK5vb9mF
	dffqW0qkQx3KeBu0YYoR7cf3t9tqlwN7x8SI+Huuzk4ERQQxqApg0htiZ6WAuQ2QC2kBL92IVCgmj
	Vyn4ZcgnBU0w7k2Xadr43jx3JNHrm5BqG7EG7zVYo2F7AY5zqN426SiWu1l1I067/S02ABb4XZEeI
	4/S+V5/zAzUNSyHMsExzXL3p5F2+bGmy3lpnE769l4RZXR2W7jM2HFm/yN2uskHWYem6JmHasPa7l
	sjcNYZpQtBsTnaFT35574qWYV7kVqsHDjoivquDtBiODLwq/TRb1YZM0ncAozJ7yb8lDNQ/82Bz/J
	UbuKqp9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Rwv-00000005Jc6-0PqK;
	Fri, 25 Oct 2024 21:34:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4RvJ-00000005JND-3kKk;
	Fri, 25 Oct 2024 21:32:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E0DAF5C5B7A;
	Fri, 25 Oct 2024 21:31:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C6D5C4CEC3;
	Fri, 25 Oct 2024 21:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729891964;
	bh=karHkl1P4MymVDmMVIm5W0oSGt8WGS2RI4WaZcDwTEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ui6KR0kdPRYlpScOp15X+unLeIAbNEI3oGX0lXMaIurlD0BJ0jl9m7sv68bFBvJ8X
	 CgmQy4NmGULJhNReu42xHOOaMDZWh8rDiJMHw/GnKiiye07KV68euQMU+mVNPy6Dh5
	 q+2Nla53/DZid3rdBbpBsYfaayka1Upsz7x35RnBCM/7/4Qef0Iy4By75QnYsA9YNP
	 PwOXPfwaV3rNp69SYU+sRoFrITlEHpzt+P0+Cem8hn3H149Vz/ognobz0PrT4BXTc/
	 bchtyRCSYWd93GuJXbMaRcdctbFVLfRi2xAODovc57JIf5w8iiwde7M2cD6qqrEeer
	 AmGpk7Tij3AcQ==
Date: Fri, 25 Oct 2024 21:32:43 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v2 03/18] lib/crc32: expose whether the lib is really
 optimized at runtime
Message-ID: <20241025213243.GA2637569@google.com>
References: <20241025191454.72616-1-ebiggers@kernel.org>
 <20241025191454.72616-4-ebiggers@kernel.org>
 <CAMj1kXFoer+_yZJWtqBVYfYnzqL9X9bbBRomCL3LDqRcYJ6njQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXFoer+_yZJWtqBVYfYnzqL9X9bbBRomCL3LDqRcYJ6njQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_143246_022376_7839C4F1 
X-CRM114-Status: GOOD (  24.59  )
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

On Fri, Oct 25, 2024 at 10:32:14PM +0200, Ard Biesheuvel wrote:
> On Fri, 25 Oct 2024 at 21:15, Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > From: Eric Biggers <ebiggers@google.com>
> >
> > Make the CRC32 library export some flags that indicate which CRC32
> > functions are actually executing optimized code at runtime.  Set these
> > correctly from the architectures that implement the CRC32 functions.
> >
> > This will be used to determine whether the crc32[c]-$arch shash
> > algorithms should be registered in the crypto API.  btrfs could also
> > start using these flags instead of the hack that it currently uses where
> > it parses the crypto_shash_driver_name.
> >
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > ---
> >  arch/arm64/lib/crc32-glue.c  | 15 +++++++++++++++
> >  arch/riscv/lib/crc32-riscv.c | 15 +++++++++++++++
> >  include/linux/crc32.h        | 15 +++++++++++++++
> >  lib/crc32.c                  |  5 +++++
> >  4 files changed, 50 insertions(+)
> >
> ...
> > diff --git a/include/linux/crc32.h b/include/linux/crc32.h
> > index 58c632533b08..bf26d454b60d 100644
> > --- a/include/linux/crc32.h
> > +++ b/include/linux/crc32.h
> > @@ -35,10 +35,25 @@ static inline u32 __pure __crc32c_le(u32 crc, const u8 *p, size_t len)
> >         if (IS_ENABLED(CONFIG_CRC32_ARCH))
> >                 return crc32c_le_arch(crc, p, len);
> >         return crc32c_le_base(crc, p, len);
> >  }
> >
> > +/*
> > + * crc32_optimizations contains flags that indicate which CRC32 library
> > + * functions are using architecture-specific optimizations.  Unlike
> > + * IS_ENABLED(CONFIG_CRC32_ARCH) it takes into account the different CRC32
> > + * variants and also whether any needed CPU features are available at runtime.
> > + */
> > +#define CRC32_LE_OPTIMIZATION  BIT(0) /* crc32_le() is optimized */
> > +#define CRC32_BE_OPTIMIZATION  BIT(1) /* crc32_be() is optimized */
> > +#define CRC32C_OPTIMIZATION    BIT(2) /* __crc32c_le() is optimized */
> > +#if IS_ENABLED(CONFIG_CRC32_ARCH)
> > +extern u32 crc32_optimizations;
> > +#else
> > +#define crc32_optimizations 0
> > +#endif
> > +
> 
> Wouldn't it be cleaner to add a new library function for this, instead
> of using a global variable?

The architecture crc32 modules need to be able to write to this.  There could be
a setter function and a getter function, but just using a variable is simpler.

- Eric

