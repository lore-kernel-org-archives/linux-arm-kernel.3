Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE586C19776
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 06:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X3P+kR5e/IyP7N9s93UkKUPZZyDLn4Xj9sQvCcTjm6U=; b=mtOCmvhf4PIn07RwarES0zUUFC
	zlA0n6LbZP1CowahTZ38LXfgzh1UhfyTOs3vJmvJUUNLaXGNnUhfo7y5p2nADFR4ZkwPCk+b1aR1u
	mSXuwMdwiULQ+H9Ie7xBpEmYdiIn1Fzzn9YJfSPwtzM86uOumUbmg/+ohumN6Jv/0KQIiir/SWpHG
	OcB4kMGroyvQ2DicOEqeukJr153bYOWgZIQYXvjbuyEv4P2vJyr87PM009DL14oO/eSRbGABludWn
	oJhEHyTM8O9/HrW1tMiTho+caofk6ZQ/YmZXkrF0xIkyTal/Qi83TY99nnQG2BA+IjiwQkjP50ESF
	sLYFqWlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnAbP-00000002UmQ-2FuB;
	Wed, 26 Feb 2025 06:09:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnAZu-00000002Uaj-1jSf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 06:07:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F410F6112A;
	Wed, 26 Feb 2025 06:07:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53CA6C4CED6;
	Wed, 26 Feb 2025 06:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740550048;
	bh=ZyHSW2CFJY0phCrOV3ftPgjBH4sON/3HnsEMzS5mjrs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dIZ9LpwAcREXQgfuNg0zyNw0M++bvgoKOyYmGBHqKBWJWIkoYcu+Sm1wJ8tWOUEZh
	 EnRA0v7pJNyg+h1sZYC8QkXrwzrlQH24Zzku0cZm99ayVIxijNVEBS0K/LruEWa8dT
	 /hKigNIP8L0xmkTai29HFfvIkz/ayat6ka7Vel+0SD+hwTpopXHvo0TtdnZ/3xwKzQ
	 x2ilMqyS7yU8GnKatLUixjjy4COKOFtxw6qAmfTxiliNM5KapWNaR6v44zxjFGKNrQ
	 3Ep/Rd4/juKbj150cjM6pJHukAy107hyro8VaICi4NEhenpUukLcRfhaxEVth95Gzo
	 mP2bYYkBWGW9w==
Date: Tue, 25 Feb 2025 22:07:25 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Arnd Bergmann <arnd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Will Deacon <will@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Harald Freudenberger <freude@linux.ibm.com>,
	Holger Dengler <dengler@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
	Jarkko Sakkinen <jarkko@kernel.org>, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH] crypto: lib/Kconfig - Select and hide arch options
Message-ID: <20250226060725.GA41090@sol.localdomain>
References: <20250225164216.4807-1-arnd@kernel.org>
 <20250225213344.GA23792@willie-the-truck>
 <f7c298b8-7989-49e7-90a2-5356029a6283@app.fastmail.com>
 <c4896a12-8abe-4fe6-b381-86b23d32b332@app.fastmail.com>
 <Z75xKexTUNm_FnSK@gondor.apana.org.au>
 <Z76aUfPIbhPAsHbv@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z76aUfPIbhPAsHbv@gondor.apana.org.au>
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

On Wed, Feb 26, 2025 at 12:36:33PM +0800, Herbert Xu wrote:
> The ARCH_MAY_HAVE patch missed arm64, mips and s390.  But it may
> also lead to arch options being enabled but ineffective because
> of modular/built-in conflicts.
> 
> As the primary user of all these options wireguard is selecting
> the arch options anyway, make the same selections at the lib/crypto
> option level and hide the arch options from the user.
> 
> Fixes: 1047e21aecdf ("crypto: lib/Kconfig - Fix lib built-in failure when arch is modular")
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Arnd Bergmann <arnd@kernel.org>
> Closes: https://lore.kernel.org/oe-kbuild-all/202502232152.JC84YDLp-lkp@intel.com/
> Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

As I said earlier, fixing the arch-optimized code to be enabled automatically is
the right way to do it.  There are still some issues with this patch, though:

>  config CRYPTO_LIB_CHACHA
>  	tristate "ChaCha library interface"
> +	select CRYPTO
>  	select CRYPTO_LIB_CHACHA_GENERIC if CRYPTO_ARCH_HAVE_LIB_CHACHA=n
> +	select CRYPTO_CHACHA20_X86_64 if X86 && 64BIT
> +	select CRYPTO_CHACHA20_NEON if ARM || (ARM64 && KERNEL_MODE_NEON)
> +	select CRYPTO_CHACHA_MIPS if CPU_MIPS32_R2
> +	select CRYPTO_CHACHA_S390 if S390
> +	select CRYPTO_CHACHA20_P10 if PPC64 && CPU_LITTLE_ENDIAN && VSX

There's no need to have a select for every architecture, with the dependencies
redundantly listed.  Instead just 'default' each of the arch-optimized options
to CRYPTO_LIB_CHACHA.

> config CRYPTO_CHACHA20_X86_64
>	tristate
>	depends on X86 && 64BIT
>	default CRYPTO_CHACHA20
>	select CRYPTO_ARCH_HAVE_LIB_CHACHA
[...]
>
> config CRYPTO_CHACHA20
> 	tristate "ChaCha"
> 	select CRYPTO_LIB_CHACHA_GENERIC
> 	select CRYPTO_SKCIPHER

This introduces a problem where to enable optimized ChaCha in the crypto API
users will now need to enable CRYPTO_LIB_CHACHA, instead of
CRYPTO_CHACHA20_X86_64 etc. as was needed before.  LIB symbols should never be
user-selectable, so that makes no sense.

The way it should work is that CRYPTO_CHACHA20 should just select
CRYPTO_LIB_CHACHA (and thus also the optimized code).

And similarly for the other algorithms, which should be in their patches.

- Eric

