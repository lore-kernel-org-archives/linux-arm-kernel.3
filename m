Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEACBD149F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 20:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zd5Anit6yA3HTeMzXbpU7mXaEYKhVeL/IUZRK50Rwjk=; b=KAfpgFoNzt9t6Y0C8yw07CyhVZ
	5R83oTsF/+d887SylgwIBn748NZjyWO89FAWCo6FSr8J1u8+R5ZADa87IujxYrvycLCvBqPoAde/r
	Re99ToEyfnP4+prhi6C/GSuqM9yBjJvI/WnqIOWRECB4WvbrqpCyZawkbG2HiOWgTv4ySwGHdQhfJ
	0av4ewoQIBE2GOjjB21Hlrd7+KmcXpq+emfulA9VwYvqkC03IfjGOC/nk8oCIbfxsNXPJph4z4zkV
	9BGopavS57ZrN6h2w82ns5ViYiw67dV5A+R9fXMo75TGgieQUglzfkLgSAUPpVh7QM36hFlmXFCWi
	d6Knrgrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4RFD-00000005BVs-0dEy;
	Fri, 25 Oct 2024 20:49:15 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4RDV-00000005As8-3uOx;
	Fri, 25 Oct 2024 20:47:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 96399A430A8;
	Fri, 25 Oct 2024 20:45:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94708C4CEC3;
	Fri, 25 Oct 2024 20:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729889248;
	bh=Tfo5X6uc3w/hrU+iP8PZcK2t41JlU/D+FAY3HHNYJHM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gekfskCvWOfIqlAZ/aSuuXFxlPUBLAq/1J8u7BRk+K9IG78a6VWhRP79Fdow15YPf
	 44uCMphVFXEm62CFfo0bnfd3n1CW10JYtALJafsVUKuPU3z4maXZ5sT1Bb2UV9pycN
	 TGG3d8+d3WVZMhgB/k7H5BucarzeptU7ro6s0+7jd2rjHTv2j/nmLH6oV/WpNORUDA
	 xnh/zY6v5NxPpq11QA6EDyZllc/Y/OnW+6atxbqNYXt6wo/B0emCq9krojm4qbnglg
	 hOSv/XbGNEBeJM/x1STwgIFbH8+hKzyAcfr+T2d5ym7TYHf4gr/dfs1497Uiengm5Q
	 UWHjgLfRLSMlw==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fb57f97d75so22259861fa.2;
        Fri, 25 Oct 2024 13:47:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUYmiFXLYsCC2IkzSYOEJdSpuqmSFxbMRPH57RhiC4zmb4keTLmXOTvEGsNV8cJTkceE6pM/HRruIZCEYA=@lists.infradead.org, AJvYcCVO3avjvaN9MvG10DzOb0Y1M+l6FV7RfObZzwnHykmWCbHaDqoYheLWcjrAJgl5NXjmuMPE5QE5pzuWEtgGGIpV@lists.infradead.org
X-Gm-Message-State: AOJu0YzawVGyISWM1l2NtYvkjCqcuJsQZiSQYQvdeehmQeJEokxvHwkf
	KnKhV590zr9OtC247PSysWL5GbiawLHRRybezZCuWWt8r3gls1v6ZJh9pdNXxE/q2dcm2qshGGb
	ndczebe/dg/P5UzdoYwcg9B9uxG4=
X-Google-Smtp-Source: AGHT+IEp6Dx2HlT+U0iGzL8ulgjfv3Yq0fFTV7/qQsnbI5MKZCd6PlYP7CAgGzk4GX/wuTuxR8r9WXnoQ2sPlcjTw1A=
X-Received: by 2002:a05:651c:2123:b0:2fb:45cf:5eef with SMTP id
 38308e7fff4ca-2fcbe04dc90mr3314601fa.30.1729889246941; Fri, 25 Oct 2024
 13:47:26 -0700 (PDT)
MIME-Version: 1.0
References: <20241025191454.72616-1-ebiggers@kernel.org> <20241025191454.72616-5-ebiggers@kernel.org>
In-Reply-To: <20241025191454.72616-5-ebiggers@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 25 Oct 2024 22:47:15 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEsq7iJThqZ7WA00ei4m59vpC23wPM+Mrj9W+HXfk-aSg@mail.gmail.com>
Message-ID: <CAMj1kXEsq7iJThqZ7WA00ei4m59vpC23wPM+Mrj9W+HXfk-aSg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20241025_134730_109622_6B8BB59D 
X-CRM114-Status: GOOD (  28.44  )
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

On Fri, 25 Oct 2024 at 21:15, Eric Biggers <ebiggers@kernel.org> wrote:
>
> From: Eric Biggers <ebiggers@google.com>
>
> Instead of registering the crc32-$arch and crc32c-$arch algorithms if
> the arch-specific code was built, only register them when that code was
> built *and* is not falling back to the base implementation at runtime.
>
> This avoids confusing users like btrfs which checks the shash driver
> name to determine whether it is crc32c-generic.
>

I think we agree that 'generic' specifically means a C implementation
that is identical across all architectures, which is why I updated my
patch to export -arch instead of wrapping the C code in yet another
driver just for the fuzzing tests.

So why is this a problem? If no optimizations are available at
runtime, crc32-arch and crc32-generic are interchangeable, and so it
shouldn't matter whether you use one or the other.

You can infer from the driver name whether the C code is being used,
not whether or not the implementation is 'fast', and the btrfs hack is
already broken on arm64.

> (It would also make sense to change btrfs to test the crc32_optimization
> flags itself, so that it doesn't have to use the weird hack of parsing
> the driver name.  This change still makes sense either way though.)
>

Indeed. That hack is very dubious and I'd be inclined just to ignore
this. On x86 and arm64, it shouldn't make a difference, given that
crc32-arch will be 'fast' in the vast majority of cases. On other
architectures, btrfs may use the C implementation while assuming it is
something faster, and if anyone actually notices the difference, we
can work with the btrfs devs to do something more sensible here.


> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  crypto/crc32_generic.c  | 8 ++++++--
>  crypto/crc32c_generic.c | 8 ++++++--
>  2 files changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/crypto/crc32_generic.c b/crypto/crc32_generic.c
> index cc064ea8240e..cecd01e4d6e6 100644
> --- a/crypto/crc32_generic.c
> +++ b/crypto/crc32_generic.c
> @@ -155,19 +155,23 @@ static struct shash_alg algs[] = {{
>         .base.cra_ctxsize       = sizeof(u32),
>         .base.cra_module        = THIS_MODULE,
>         .base.cra_init          = crc32_cra_init,
>  }};
>
> +static int num_algs;
> +
>  static int __init crc32_mod_init(void)
>  {
>         /* register the arch flavor only if it differs from the generic one */
> -       return crypto_register_shashes(algs, 1 + IS_ENABLED(CONFIG_CRC32_ARCH));
> +       num_algs = 1 + ((crc32_optimizations & CRC32_LE_OPTIMIZATION) != 0);
> +
> +       return crypto_register_shashes(algs, num_algs);
>  }
>
>  static void __exit crc32_mod_fini(void)
>  {
> -       crypto_unregister_shashes(algs, 1 + IS_ENABLED(CONFIG_CRC32_ARCH));
> +       crypto_unregister_shashes(algs, num_algs);
>  }
>
>  subsys_initcall(crc32_mod_init);
>  module_exit(crc32_mod_fini);
>
> diff --git a/crypto/crc32c_generic.c b/crypto/crc32c_generic.c
> index 04b03d825cf4..47d694da9d4a 100644
> --- a/crypto/crc32c_generic.c
> +++ b/crypto/crc32c_generic.c
> @@ -195,19 +195,23 @@ static struct shash_alg algs[] = {{
>         .base.cra_ctxsize       = sizeof(struct chksum_ctx),
>         .base.cra_module        = THIS_MODULE,
>         .base.cra_init          = crc32c_cra_init,
>  }};
>
> +static int num_algs;
> +
>  static int __init crc32c_mod_init(void)
>  {
>         /* register the arch flavor only if it differs from the generic one */
> -       return crypto_register_shashes(algs, 1 + IS_ENABLED(CONFIG_CRC32_ARCH));
> +       num_algs = 1 + ((crc32_optimizations & CRC32C_OPTIMIZATION) != 0);
> +
> +       return crypto_register_shashes(algs, num_algs);
>  }
>
>  static void __exit crc32c_mod_fini(void)
>  {
> -       crypto_unregister_shashes(algs, 1 + IS_ENABLED(CONFIG_CRC32_ARCH));
> +       crypto_unregister_shashes(algs, num_algs);
>  }
>
>  subsys_initcall(crc32c_mod_init);
>  module_exit(crc32c_mod_fini);
>
> --
> 2.47.0
>
>

