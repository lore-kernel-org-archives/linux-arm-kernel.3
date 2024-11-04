Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 746A4D132AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 11:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nx6Wwnblco5hB2GQvRaC9H5nZFcrOej/pxY8FjnCmy4=; b=41ARFSmi+LXoVGSiK3EvW0N99+
	fYHjotQu/cZrJhbFyNwY9ZVR3KfWDL3il8I2FdUJTbJiD4SlP1GZee/hjVh8OgmcDox+n3Gw939yD
	TQfdcQlzENK1CTz/q0rDuQTqQgf9B+759mEqNdya3WCrBeFzV3zSjo9fjY2QbcjypAMiIQmPrOzKd
	uhWX9jddA41a0RvNFTCH3RlEl73c1RK5svc21Q3rMApuYushMo39olptcAcMGXhkNIAZkOFHBHxLJ
	aoxplAofDjXWYwN8PGVy8oe5agG+q3mMqaiY56zqLW/+dXt20a+cWy7s9bBsQ+IYBkDXJ8h+Lp6Bg
	Io9vbbDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7up8-0000000DPNv-27wG;
	Mon, 04 Nov 2024 11:00:42 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7ulX-0000000DOOT-0tiB;
	Mon, 04 Nov 2024 10:57:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3F1A6A42DA6;
	Mon,  4 Nov 2024 10:55:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 216D7C4CED1;
	Mon,  4 Nov 2024 10:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730717818;
	bh=6qFxuwoqjmsBXA5afiRPckV6EYzE55EhM//TIyBTrQ4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EADOQrSt03YURgotEa0RPC+Q+iLgiLTpyDunuCSyI8JrnJ8j4YEhKIdjW/X9XmfJY
	 sTCnqIY+Z2AkNeyzcvIvr+dGT6FfLBfZvlbrdb8z2SiV9hm+elSOB97O2rE7ro9EXq
	 0i/CQC7v2klAcuIyDxn2pg7/smSOsw0dT4Hhws9swr3/XRUtzPo+CxQGrrBX7df8D/
	 5J0t2oN4EkGyZAZoiEf4JRfD6nAiE3emF0OuGcBGMMWHNR23yXfKnSbJVb11OHm5BV
	 KUm+3gkbO7B14khPoblQ7uBvr3V7hMm9Omm80Fu2OU58gX+loUjMi/2DNHEoGYci8U
	 QgiPNae8TP/uQ==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2fb3110b964so32945951fa.1;
        Mon, 04 Nov 2024 02:56:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUgiY1dUP1goPjkssBp8EvYhCckjC1WXyK7+kfGbcseMadBbnzz1SO4+2ffzZhp2hz+oDPMAXbSzMMX3+POmBod@lists.infradead.org, AJvYcCVc8tED5J2vMYpqxwi4qRU8aN88m9kXv4UD7k61JUTODzQqhKaYjj0s7g/x38vnbSMcbjsRoBc7FFI23tc=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywo2uet7pxdnaQvfJa2mobRVXoXN0GX4kEVVu+eWcOmmX6Kocx+
	P75guEG3ZrleRmR0c56MhPMIBcgNSJGjiK/tQA9W1wtXBDoSq4YREdCO/ozm+so1FZiM/WwGQpe
	3mtkZd5s4/RauotoGqYhB8KPz/x8=
X-Google-Smtp-Source: AGHT+IGbnKnh4aAfaULtSCmiukLUpnKZU5MlHxJghtOAuKX/zIcXfbKXe/xSvudBsLa83HeLXpJgE1iAQVUbiw2PNrM=
X-Received: by 2002:a05:651c:1508:b0:2fa:fc41:cf80 with SMTP id
 38308e7fff4ca-2fedb7ecd4amr43930581fa.43.1730717816511; Mon, 04 Nov 2024
 02:56:56 -0800 (PST)
MIME-Version: 1.0
References: <20241103223154.136127-1-ebiggers@kernel.org> <20241103223154.136127-5-ebiggers@kernel.org>
In-Reply-To: <20241103223154.136127-5-ebiggers@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 4 Nov 2024 11:56:45 +0100
X-Gmail-Original-Message-ID: <CAMj1kXH3C1xP7865V-mJ+3=FDHTR-df909=7jift_Z6dmp58Gw@mail.gmail.com>
Message-ID: <CAMj1kXH3C1xP7865V-mJ+3=FDHTR-df909=7jift_Z6dmp58Gw@mail.gmail.com>
Subject: Re: [PATCH v3 04/18] crypto: crc32 - don't unnecessarily register
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
X-CRM114-CacheID: sfid-20241104_025659_402680_21C0FB06 
X-CRM114-Status: GOOD (  22.04  )
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

On Sun, 3 Nov 2024 at 23:32, Eric Biggers <ebiggers@kernel.org> wrote:
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
> (It would also make sense to change btrfs to test the crc32_optimization
> flags itself, so that it doesn't have to use the weird hack of parsing
> the driver name.  This change still makes sense either way though.)
>
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>

> ---
>  crypto/crc32_generic.c  | 8 ++++++--
>  crypto/crc32c_generic.c | 8 ++++++--
>  2 files changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/crypto/crc32_generic.c b/crypto/crc32_generic.c
> index cc064ea8240e..783a30b27398 100644
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
> +       num_algs = 1 + ((crc32_optimizations() & CRC32_LE_OPTIMIZATION) != 0);
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
> index 04b03d825cf4..985da981d6e2 100644
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
> +       num_algs = 1 + ((crc32_optimizations() & CRC32C_OPTIMIZATION) != 0);
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

