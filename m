Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD287C61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 10:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vvQbMf1B4gXS7Q72OCBFEavfFwtVhik2g2NUx8QMN9U=; b=OiAM+q9qsXd1nS5KvIB4DXbDKv
	rrwcjyhfzjckp2BL5HYjwUJcVHLh7gbN6WlAHxHTmxi8a8pEk5VPtA6RdrNU094dmwrEV1c6GlfgB
	0kqliQ0Uf7N6hnjVMQzadCPVVd2KrrXeGr5evR3ASMajJ94GUIx0gHz0Qt++Q2MKLeYpX5SVkV2g+
	ukVKaCAhpPC9VZmxxCQWLtRwJRLmm/l9EdvTtjr4DtXdA6FlWpAgk/i017AnDN/5OOCDb35yItGAW
	H1lCAbIwqKCSsX3zzjMB26OMxR9C+o3Nu6jY2t5Y4sujPHJCOOU6n04Hq3GPlKWRbALeKSjHu4VVG
	4+Y2ejNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOweo-00000006Xwk-142n;
	Tue, 10 Jun 2025 10:56:42 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOvUn-00000006NKj-2qI3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 09:42:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AFA30A51074
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 09:42:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FF52C4CEF7
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 09:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749548536;
	bh=/ZxvP0oXkjJy+5u41lz5bv9/pvpCiauZA5c0sjPGHEA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=O5HVfJNHNCSkqVEMce8ASokg8YVj2MdM/GP56FmUql8/tLMqjYA8RMf9PigLKyl4r
	 7mkcCxQlVOabzA65NzJkR6w7dU59KVYJ23SypF6P4aWcQ0y4yA3lKXJ4MfKFx+u6XB
	 5VioVCy5V/el6nOU35ru1yRovIzuBqLuxMqRm1xYwB593aPVTqorGrpD5Y1D67oJeR
	 ugkHTJl+zB+0KshRiD4eLcY/IED7E9cUy55axac2VuacJBfMVc0xBp8Jk41SJwM0K8
	 uFrGaOvQkNOh8SHeB7k+RQG1bp4o5nKJrlyq+As1yvnW98KZfj5JO8obV9/PNQnjZx
	 nxAJbCmqy2fFg==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-55342bca34eso5075358e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 02:42:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX6NC3LYybdWS7IL553hsJvOWdOuP7SDYLCzs3QQzmTVTyRIgmCUBzSnrbg/RurOeqanH2TJs8jA4Iox0TuvCAK@lists.infradead.org
X-Gm-Message-State: AOJu0YxCFlPI0NiJRD2vkw3aAXXbeTIErzwWAFYGAvazGYgQCTvgiSlz
	syUeGuLk/EoCTRQWaxBp7vTac0y8DlyI8D2cYVPVfYN76oQ7+f08QrkLXvEP6yCPnptRtXQyKsG
	mgBdC94hWPKaYSFaL+JVGaE7hFxEGQCg=
X-Google-Smtp-Source: AGHT+IHFP3Oy85HSzSqRP8n10niIF/0kKGzvaY5viHdHYpXcPjgwjHZOvayjXzEjjBB8lxl6vQPt1zZftvr8IKqwH4I=
X-Received: by 2002:a05:6512:2396:b0:553:34be:26ab with SMTP id
 2adb3069b0e04-55366bdf6d1mr4568686e87.15.1749548534647; Tue, 10 Jun 2025
 02:42:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250610093256.2645686-1-arnd@kernel.org>
In-Reply-To: <20250610093256.2645686-1-arnd@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 10 Jun 2025 11:42:03 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHezfFoea2nV7oAg1=-5PUg2eL=bhv_k8CsCzyuLMiAUA@mail.gmail.com>
X-Gm-Features: AX0GCFvxaVLt4SFdT1LsUqlRO-nSGitqEJWMHYXBOr6h4AzdfUgVIX0DFrWeK_s
Message-ID: <CAMj1kXHezfFoea2nV7oAg1=-5PUg2eL=bhv_k8CsCzyuLMiAUA@mail.gmail.com>
Subject: Re: [PATCH] ARM: crypto: work around gcc-15 warning
To: Arnd Bergmann <arnd@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, 
	Eric Biggers <ebiggers@google.com>, Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_024217_850998_50F2BEA1 
X-CRM114-Status: GOOD (  23.81  )
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

On Tue, 10 Jun 2025 at 11:33, Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> I get a very rare -Wstringop-overread warning with gcc-15 for one function
> in aesbs_ctr_encrypt():
>
> arch/arm/crypto/aes-neonbs-glue.c: In function 'ctr_encrypt':
> arch/arm/crypto/aes-neonbs-glue.c:212:1446: error: '__builtin_memcpy' offset [17, 2147483647] is out of the bounds [0, 16] of object 'buf' with type 'u8[16]' {aka 'unsigned char[16]'} [-Werror=array-bounds=]
>   212 |                         src = dst = memcpy(buf + sizeof(buf) - bytes,
> arch/arm/crypto/aes-neonbs-glue.c: In function 'ctr_encrypt':
> arch/arm/crypto/aes-neonbs-glue.c:218:17: error: 'aesbs_ctr_encrypt' reading 1 byte from a region of size 0 [-Werror=stringop-overread]
>   218 |                 aesbs_ctr_encrypt(dst, src, ctx->rk, ctx->rounds, bytes, walk.iv);
>       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> arch/arm/crypto/aes-neonbs-glue.c:218:17: note: referencing argument 2 of type 'const u8[0]' {aka 'const unsigned char[]'}
> arch/arm/crypto/aes-neonbs-glue.c:218:17: note: referencing argument 3 of type 'const u8[0]' {aka 'const unsigned char[]'}
> arch/arm/crypto/aes-neonbs-glue.c:218:17: note: referencing argument 6 of type 'u8[0]' {aka 'unsigned char[]'}
> arch/arm/crypto/aes-neonbs-glue.c:36:17: note: in a call to function 'aesbs_ctr_encrypt'
>    36 | asmlinkage void aesbs_ctr_encrypt(u8 out[], u8 const in[], u8 const rk[],
>
> This could happen in theory if walk.nbytes is larger than INT_MAX and gets
> converted to a negative local variable.
>
> Keep the type unsigned like the orignal nbytes to be sure there is no
> integer overflow.
>
> Fixes: c8bf850e991a ("crypto: arm/aes-neonbs-ctr - deal with non-multiples of AES block size")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Ard Biesheuvel <ardb@kernel.org>

> ---
>  arch/arm/crypto/aes-neonbs-glue.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/crypto/aes-neonbs-glue.c b/arch/arm/crypto/aes-neonbs-glue.c
> index c60104dc1585..df5afe601e4a 100644
> --- a/arch/arm/crypto/aes-neonbs-glue.c
> +++ b/arch/arm/crypto/aes-neonbs-glue.c
> @@ -206,7 +206,7 @@ static int ctr_encrypt(struct skcipher_request *req)
>         while (walk.nbytes > 0) {
>                 const u8 *src = walk.src.virt.addr;
>                 u8 *dst = walk.dst.virt.addr;
> -               int bytes = walk.nbytes;
> +               unsigned int bytes = walk.nbytes;
>
>                 if (unlikely(bytes < AES_BLOCK_SIZE))
>                         src = dst = memcpy(buf + sizeof(buf) - bytes,
> --
> 2.39.5
>

