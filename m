Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E20AED132AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 10:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0y/BHzMpgtNQY/m9htna2CTEfpV1lk9uBvppiDVkNEE=; b=NADgoElCdIzfRzQah3w6up3vpB
	zduwM/04mzSv8iZIJVw/GBfYS5pR9zjmzPXd8JAPFLd4fxBM3GmEsQBmCW9E1svjiT8WXlqboTnxK
	3PnFREek9KUu5rO+qCJSEQLskXAou0NxNvQuFYqMcMr9T2a31v+8lC1fW5e7KhHjcsBCMxUrKhDca
	obt8QnSGbmDgKAizWtyyYKIqBmwUKIYw2luQ8uQOyHuCVajsUzNeEL2YYJKyDOvNQvdjNZHDOLq61
	gPp4JrPZKDuIR0BNJOsNeHwIVrAhzMPxTUTON/IbxZ+5HVIz2fORjyTijBE44FirUsIzFSOlAY431
	FZvC9msA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7uli-0000000DOSD-2nDj;
	Mon, 04 Nov 2024 10:57:10 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7ujz-0000000DO0W-2BPG;
	Mon, 04 Nov 2024 10:55:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A09B6A42B7A;
	Mon,  4 Nov 2024 10:53:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80EABC4CED4;
	Mon,  4 Nov 2024 10:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730717721;
	bh=Xsd60VaJMVJJJZwPYCiMbYDsq4aVLjYnOCS09bBiIXw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mluckDeMk6i5aN2XBOA1zfp0B5xurNz8wOuuO6UKYkZqld8M1vPhMjikatVUxYIq1
	 o/o2n4QC5unxoa1BCq0QEJuuUGosOaiWVlAfms7oPabM1IPV7T5QCnjD432LtwU6jM
	 qNyRNziXoq7Y5K909RLvlKf7uf+1MvZd6Ak8eCwV7pk3wdhybH+DxGdKIZqFxDiZgi
	 /iQnjicc1WrBfd1q+/hj/6yterw6uw+CgPyujA3SNAenk3a2+tEKgLA1Q7vvvsnEYL
	 Fa4fRc5HTw91i3Ikfsm6UaVHVMpdSHGkU3B2sp1paNLh1UwprUskCBwrZH7BP89RDz
	 Po3mKNTx8CmzQ==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2feeb1e8edfso19077871fa.1;
        Mon, 04 Nov 2024 02:55:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVJk91jEy0UtyZAZ1K6pS5IslbK1UuOISi2AlzywyzIDTB24KJvPncmjMd/94ExCNoqu2hbv8FWJv4yPUpHJ7G3@lists.infradead.org, AJvYcCVnwMfP8GLrEmtaeZAt3SEottZ214Ulradl2pQxmKtfbOtDNv4R0fsJNA0YizT78xA/MpQKnjfXnIwhVCQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxXyX+wjG7hZii+pw/7THEK5tlQKhgo1867BIC6GBH5EGt2GORq
	hp+m3XI9vtLFz2s7H/A7KT05AB2jyFaTriaTYiLw8euPGt1SVW6stC45rKFu4sOX57WbGZ36Md2
	mx2nUDoDTLRN4mfVCNhb4cBcEIB8=
X-Google-Smtp-Source: AGHT+IFk0/CXdpRr9EA2xNrpgIcdFsD8CEdy30mzTFb0ZlXY/QnyWMuejDDml1MTkf5LmjGORWJ2C6sLEZMa+NCqqXc=
X-Received: by 2002:a2e:be9f:0:b0:2fb:8c9a:fe3f with SMTP id
 38308e7fff4ca-2fedb7c8904mr72976731fa.22.1730717719875; Mon, 04 Nov 2024
 02:55:19 -0800 (PST)
MIME-Version: 1.0
References: <20241103223154.136127-1-ebiggers@kernel.org> <20241103223154.136127-4-ebiggers@kernel.org>
In-Reply-To: <20241103223154.136127-4-ebiggers@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 4 Nov 2024 11:55:08 +0100
X-Gmail-Original-Message-ID: <CAMj1kXErAGvJ+ZK1SMQQKVbbZVhjxaWzn0gmV-xxtsoWSuwT9g@mail.gmail.com>
Message-ID: <CAMj1kXErAGvJ+ZK1SMQQKVbbZVhjxaWzn0gmV-xxtsoWSuwT9g@mail.gmail.com>
Subject: Re: [PATCH v3 03/18] lib/crc32: expose whether the lib is really
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
X-CRM114-CacheID: sfid-20241104_025524_011180_1110E65F 
X-CRM114-Status: GOOD (  24.03  )
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

On Sun, 3 Nov 2024 at 23:34, Eric Biggers <ebiggers@kernel.org> wrote:
>
> From: Eric Biggers <ebiggers@google.com>
>
> Make the CRC32 library export a function crc32_optimizations() which
> returns flags that indicate which CRC32 functions are actually executing
> optimized code at runtime.
>
> This will be used to determine whether the crc32[c]-$arch shash
> algorithms should be registered in the crypto API.  btrfs could also
> start using these flags instead of the hack that it currently uses where
> it parses the crypto_shash_driver_name.
>
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>

> ---
>  arch/arm64/lib/crc32-glue.c  | 10 ++++++++++
>  arch/riscv/lib/crc32-riscv.c | 10 ++++++++++
>  include/linux/crc32.h        | 15 +++++++++++++++
>  3 files changed, 35 insertions(+)
>
> diff --git a/arch/arm64/lib/crc32-glue.c b/arch/arm64/lib/crc32-glue.c
> index d7f6e1cbf0d2..15c4c9db573e 100644
> --- a/arch/arm64/lib/crc32-glue.c
> +++ b/arch/arm64/lib/crc32-glue.c
> @@ -83,7 +83,17 @@ u32 __pure crc32_be_arch(u32 crc, const u8 *p, size_t len)
>
>         return crc32_be_arm64(crc, p, len);
>  }
>  EXPORT_SYMBOL(crc32_be_arch);
>
> +u32 crc32_optimizations(void)
> +{
> +       if (alternative_has_cap_likely(ARM64_HAS_CRC32))
> +               return CRC32_LE_OPTIMIZATION |
> +                      CRC32_BE_OPTIMIZATION |
> +                      CRC32C_OPTIMIZATION;
> +       return 0;
> +}
> +EXPORT_SYMBOL(crc32_optimizations);
> +
>  MODULE_LICENSE("GPL");
>  MODULE_DESCRIPTION("arm64-optimized CRC32 functions");
> diff --git a/arch/riscv/lib/crc32-riscv.c b/arch/riscv/lib/crc32-riscv.c
> index a3ff7db2a1ce..53d56ab422c7 100644
> --- a/arch/riscv/lib/crc32-riscv.c
> +++ b/arch/riscv/lib/crc32-riscv.c
> @@ -295,7 +295,17 @@ u32 __pure crc32_be_arch(u32 crc, const u8 *p, size_t len)
>  legacy:
>         return crc32_be_base(crc, p, len);
>  }
>  EXPORT_SYMBOL(crc32_be_arch);
>
> +u32 crc32_optimizations(void)
> +{
> +       if (riscv_has_extension_likely(RISCV_ISA_EXT_ZBC))
> +               return CRC32_LE_OPTIMIZATION |
> +                      CRC32_BE_OPTIMIZATION |
> +                      CRC32C_OPTIMIZATION;
> +       return 0;
> +}
> +EXPORT_SYMBOL(crc32_optimizations);
> +
>  MODULE_LICENSE("GPL");
>  MODULE_DESCRIPTION("Accelerated CRC32 implementation with Zbc extension");
> diff --git a/include/linux/crc32.h b/include/linux/crc32.h
> index 58c632533b08..e9bd40056687 100644
> --- a/include/linux/crc32.h
> +++ b/include/linux/crc32.h
> @@ -35,10 +35,25 @@ static inline u32 __pure __crc32c_le(u32 crc, const u8 *p, size_t len)
>         if (IS_ENABLED(CONFIG_CRC32_ARCH))
>                 return crc32c_le_arch(crc, p, len);
>         return crc32c_le_base(crc, p, len);
>  }
>
> +/*
> + * crc32_optimizations() returns flags that indicate which CRC32 library
> + * functions are using architecture-specific optimizations.  Unlike
> + * IS_ENABLED(CONFIG_CRC32_ARCH) it takes into account the different CRC32
> + * variants and also whether any needed CPU features are available at runtime.
> + */
> +#define CRC32_LE_OPTIMIZATION  BIT(0) /* crc32_le() is optimized */
> +#define CRC32_BE_OPTIMIZATION  BIT(1) /* crc32_be() is optimized */
> +#define CRC32C_OPTIMIZATION    BIT(2) /* __crc32c_le() is optimized */
> +#if IS_ENABLED(CONFIG_CRC32_ARCH)
> +u32 crc32_optimizations(void);
> +#else
> +static inline u32 crc32_optimizations(void) { return 0; }
> +#endif
> +
>  /**
>   * crc32_le_combine - Combine two crc32 check values into one. For two
>   *                   sequences of bytes, seq1 and seq2 with lengths len1
>   *                   and len2, crc32_le() check values were calculated
>   *                   for each, crc1 and crc2.
> --
> 2.47.0
>
>

