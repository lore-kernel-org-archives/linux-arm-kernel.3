Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F831D149F4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 21:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=brjCYgcFGdH/pd/f/d70iIVu+Wxfm2XE3Qa70/tryVw=; b=y/D4vamIGtt+2W58gwP38Di++G
	vIWFmM9mbSE5B/D4svmBk+ojrCuNap86+WvDneD3URFrzGzgA1wb5cxXm9p3plg05PPIYIwVh4KGk
	f1PAoYRL6Tnn84o+DckJFDDgDu/YiDxjZcp9dhNteS16+Iva7fJMWm/v8/QtmNioC/QGb6TLLdh7v
	NNGDnIIkDazRkYzK7hF06tVZYURZDLSll18WaiMJafvLtMpLtsqKuttb1ZjHz6h5DORFJtQbBQaLL
	8KcGwzjvCI4g+igIoTd6rs0nOBnAQcZ4Pbj9shp+9EEBZ+pwRK901okYk0ZydZ6BPLVwUYIJVNNc6
	/66bsAzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4S2G-00000005KoY-0oWR;
	Fri, 25 Oct 2024 21:39:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4S0N-00000005KG4-2nPg;
	Fri, 25 Oct 2024 21:38:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E01ED5C4DC7;
	Fri, 25 Oct 2024 21:37:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD3DEC4CEC3;
	Fri, 25 Oct 2024 21:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729892278;
	bh=Q8vC22irZ2uA8WYYvmBwW1+2Pm2qVwYkLgdZ6/sItmw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=X9TEdB8NtoLsaY6w4tD051jPTNAuoCaCbQQHkiIzKo7oiJT9AWcwt+FyzmJhovWAp
	 2pb0msYmVONirDKwQIfh5V3wPV0dcbDz2pSpVcpHIdMk9tXuPDZ5e6Az8xORI991cm
	 xqLA6sL3m9DoZGlSNnVohRg6luGL7923xAU3nr5tH7OjWBmXsAW7KgEF+MDVfsK2ne
	 duqlO61GagzVxkZD2Axh5Nb172IRQrUPy3AWEhn1+6vZ+0EOpP8QflDhFwNd3ZyyP/
	 h1jEpYwivxBADQX2gGh2Yha+akgPxJ0n7Q8ruu2ds379qCqEjs553wHkorArIKfS4N
	 Vw2SZPUxwQngA==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fb5fa911aaso35393011fa.2;
        Fri, 25 Oct 2024 14:37:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVymp3mIgfcIn9UPfq4Ww90R+aW9x/e/1nlshabEPBNgYHr+UFxhjO8JlArcXDrSl5fJnaLCoW6eNAA48SUOJK+@lists.infradead.org, AJvYcCWeOZW1ueVr3cbHZIxyi+johehkzwivudRZp/HvxgSwddv+OIA4OfoQO7mWx5aTY4ZABerW+hbMwgQOjsI=@lists.infradead.org
X-Gm-Message-State: AOJu0YzJW348go9iO4nBWaunQhu+kJorAjwvPRhrA6L8hasshkzpY5pu
	Qz3HnB8QA/yKXnbkgZpHiZP16Zhj1dBGTqo3wKAaHxq5exP0p9rNclD5gzCi3hsbg+xR8WgHUOu
	5kX6o39ANPuzeMZBVYex4VdzA3fQ=
X-Google-Smtp-Source: AGHT+IEQWINSviRss911g3zsmM49RILDHJN+Ssrcrwx15J0k6BAeeRwcNFxqZbNLbvjIoCqISV0e2QKpM5PEk7ZnG3k=
X-Received: by 2002:a05:651c:b0d:b0:2fa:d604:e519 with SMTP id
 38308e7fff4ca-2fcbdf7db48mr5607491fa.11.1729892277115; Fri, 25 Oct 2024
 14:37:57 -0700 (PDT)
MIME-Version: 1.0
References: <20241025191454.72616-1-ebiggers@kernel.org> <20241025191454.72616-4-ebiggers@kernel.org>
 <CAMj1kXFoer+_yZJWtqBVYfYnzqL9X9bbBRomCL3LDqRcYJ6njQ@mail.gmail.com> <20241025213243.GA2637569@google.com>
In-Reply-To: <20241025213243.GA2637569@google.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 25 Oct 2024 23:37:45 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHZy3yPvonS5ZVof0qa0V_Lxhv5Q7i1UVf5P6D3d+=KRw@mail.gmail.com>
Message-ID: <CAMj1kXHZy3yPvonS5ZVof0qa0V_Lxhv5Q7i1UVf5P6D3d+=KRw@mail.gmail.com>
Subject: Re: [PATCH v2 03/18] lib/crc32: expose whether the lib is really
 optimized at runtime
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
X-CRM114-CacheID: sfid-20241025_143759_824605_883BC122 
X-CRM114-Status: GOOD (  28.57  )
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

On Fri, 25 Oct 2024 at 23:32, Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Fri, Oct 25, 2024 at 10:32:14PM +0200, Ard Biesheuvel wrote:
> > On Fri, 25 Oct 2024 at 21:15, Eric Biggers <ebiggers@kernel.org> wrote:
> > >
> > > From: Eric Biggers <ebiggers@google.com>
> > >
> > > Make the CRC32 library export some flags that indicate which CRC32
> > > functions are actually executing optimized code at runtime.  Set these
> > > correctly from the architectures that implement the CRC32 functions.
> > >
> > > This will be used to determine whether the crc32[c]-$arch shash
> > > algorithms should be registered in the crypto API.  btrfs could also
> > > start using these flags instead of the hack that it currently uses where
> > > it parses the crypto_shash_driver_name.
> > >
> > > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > > ---
> > >  arch/arm64/lib/crc32-glue.c  | 15 +++++++++++++++
> > >  arch/riscv/lib/crc32-riscv.c | 15 +++++++++++++++
> > >  include/linux/crc32.h        | 15 +++++++++++++++
> > >  lib/crc32.c                  |  5 +++++
> > >  4 files changed, 50 insertions(+)
> > >
> > ...
> > > diff --git a/include/linux/crc32.h b/include/linux/crc32.h
> > > index 58c632533b08..bf26d454b60d 100644
> > > --- a/include/linux/crc32.h
> > > +++ b/include/linux/crc32.h
> > > @@ -35,10 +35,25 @@ static inline u32 __pure __crc32c_le(u32 crc, const u8 *p, size_t len)
> > >         if (IS_ENABLED(CONFIG_CRC32_ARCH))
> > >                 return crc32c_le_arch(crc, p, len);
> > >         return crc32c_le_base(crc, p, len);
> > >  }
> > >
> > > +/*
> > > + * crc32_optimizations contains flags that indicate which CRC32 library
> > > + * functions are using architecture-specific optimizations.  Unlike
> > > + * IS_ENABLED(CONFIG_CRC32_ARCH) it takes into account the different CRC32
> > > + * variants and also whether any needed CPU features are available at runtime.
> > > + */
> > > +#define CRC32_LE_OPTIMIZATION  BIT(0) /* crc32_le() is optimized */
> > > +#define CRC32_BE_OPTIMIZATION  BIT(1) /* crc32_be() is optimized */
> > > +#define CRC32C_OPTIMIZATION    BIT(2) /* __crc32c_le() is optimized */
> > > +#if IS_ENABLED(CONFIG_CRC32_ARCH)
> > > +extern u32 crc32_optimizations;
> > > +#else
> > > +#define crc32_optimizations 0
> > > +#endif
> > > +
> >
> > Wouldn't it be cleaner to add a new library function for this, instead
> > of using a global variable?
>
> The architecture crc32 modules need to be able to write to this.  There could be
> a setter function and a getter function, but just using a variable is simpler.
>

If we just add 'u32 crc32_optimizations()', there is no need for those
modules to have init/exit hooks, the only thing they need to export is
this routine.

Or perhaps it could even be a static inline, with the right plumbing
of header files. At least on arm64,

static inline u32 crc32_optimizations() {
  if (!alternative_have_const_cap_likely(ARM64_HAS_CRC32))
    return 0;
  return CRC32_LE_OPTIMIZATION | CRC32_BE_OPTIMIZATION | CRC32C_OPTIMIZATION;
}

should be all we need.

