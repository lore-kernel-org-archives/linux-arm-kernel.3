Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEABDC19F2E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 08:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jiPcZapR216itPgDV41PdhwEbp2fRiThI86FlwLZTVA=; b=wRmkS2YaSBzUXB0+VkCzarlkaa
	OGqZDLLOme5rZhIftdTCXwMRUJidmeZsorjmgTGkqRY3Tas7Do364pJBHKJeBvNICR4b7XahO/MzH
	gAKe0ADQlFv4v/3JfOXHhnkFPS3+/qVNmE13SpWJUDMxzHIZvG2cgDoNo0LDkZBj6R5vfY+K4/zl3
	OYofb7SiuVgPj52fqwhth+3TrS1XUv3iFZVk7DMpGCv9eQ4XG31m8E0J7eRcG2pj1LOgnh9zVj8AX
	g0hxte3XwqRyx3siwqPj7MeXuv9Gg+cZmLMJKBm+dlguw0mXHURWkKceVvs/+P6R33pxjqbM5bnGX
	yTQDjs7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnZW5-00000006kUJ-3STN;
	Thu, 27 Feb 2025 08:45:13 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnZUX-00000006jrt-1Zau
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 08:43:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=jiPcZapR216itPgDV41PdhwEbp2fRiThI86FlwLZTVA=; b=GsRmCFqWzGCGd5G+zhMOhUMliV
	cvZYzsxKo30kJ+tvuntDdmv1EkdyiT0+RGypU3QuqxpBqjsmnSUpF1KQU6I08bJLDR964dnyF1dg2
	F+hRMofLDZkexeOuz6TJIBgcOgYD9e1FkzFYhTWrW4tOXm3izNYMQIKBiVxOvR9VWbfx2DMLc0209
	2U9reGjCRZC6/5tRtAkyM8XYsb4BO0sGHkWzjsMU2O6Hc8b5CHNlDooaTzPulqLwb1B18CHh17Z7E
	ksxKtGLzPh9rNCN+j9JS2t9utYmWIFsJNWGFUqZfk8XAPqdt5vR9G4T9uNTl71HMzUAzeG3P8/0tE
	oef5neBw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1tnZTz-002Cin-38;
	Thu, 27 Feb 2025 16:43:05 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 27 Feb 2025 16:43:03 +0800
Date: Thu, 27 Feb 2025 16:43:03 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, Will Deacon <will@kernel.org>,
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
	Eric Biggers <ebiggers@google.com>,
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
	Jarkko Sakkinen <jarkko@kernel.org>, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-s390@vger.kernel.org
Subject: Re: [v3 PATCH] crypto: lib/Kconfig - Hide arch options from user
Message-ID: <Z8All3G80gGXzfaU@gondor.apana.org.au>
References: <20250225164216.4807-1-arnd@kernel.org>
 <20250225213344.GA23792@willie-the-truck>
 <f7c298b8-7989-49e7-90a2-5356029a6283@app.fastmail.com>
 <c4896a12-8abe-4fe6-b381-86b23d32b332@app.fastmail.com>
 <Z75xKexTUNm_FnSK@gondor.apana.org.au>
 <Z76aUfPIbhPAsHbv@gondor.apana.org.au>
 <Z77aFJCVuXeDXRrs@gondor.apana.org.au>
 <Z8AY16EIqAYpfmRI@gondor.apana.org.au>
 <134f64aa-65bd-4de0-9ac6-52326e35d6d6@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <134f64aa-65bd-4de0-9ac6-52326e35d6d6@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_004337_416260_16DB926C 
X-CRM114-Status: GOOD (  21.14  )
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

On Thu, Feb 27, 2025 at 09:32:51AM +0100, Arnd Bergmann wrote:
>
> This looks like a good approach. Once it works correctly,
> it should be possible to clean up the 'select' statements
> in wireguard as well and just 'select CRYPTO_LIB_CHACHA' etc.

Yes that's the idea.

> I think the more common style is to put the 'default'
> lines before 'select'.

It is the customary place in the crypto tree.

> It appears that the two above are missing a
> 'depends on KERNEL_MODE_NEON' line. There is still
> a runtime check that prevents it from being used on
> non-neon machines, but I think you should add these
> lines here since it's no longer possible to turn
> them off individually when building a kernel for a
> non-NEON target.

Good catch.  But I think this was deliberate as it also includes
a non-NEON implementation:

commit b36d8c09e710c71f6a9690b6586fea2d1c9e1e27
Author: Ard Biesheuvel <ardb@kernel.org>
Date:   Fri Nov 8 13:22:14 2019 +0100

    crypto: arm/chacha - remove dependency on generic ChaCha driver
    
    Instead of falling back to the generic ChaCha skcipher driver for
    non-SIMD cases, use a fast scalar implementation for ARM authored
    by Eric Biggers. This removes the module dependency on chacha-generic
    altogether, which also simplifies things when we expose the ChaCha
    library interface from this module.
    
    Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
    Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
 
> I'm not sure why we need the extra "_INTERNAL" symbols, but I
> may be missing something here. What problem does this solve
> for you?

Without them Kconfig will bomb out because of a loop centering
on CONFIG_CRYPTO.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

