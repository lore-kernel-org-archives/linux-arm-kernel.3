Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A38ACC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 01:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jdo3/IxMwB8Q6RAm8ZwQFpjzIGffxAXyzhXHZ3RcNYQ=; b=tkYVy5kyxnoBbNFPZrL2/65YMK
	ICws/MvEaqqBs9qTlXcpiXrqyz75UTgNzzGjY4fAxOpwtwHxs8Wg4uvy3SMuwHILRpcq3zWhAephd
	J5YwI9K5vsp4VaJQDpkdXiKXaZReRGz3eqd5k90VZM3iJCsW7W+GmrIqNP9iJLIq+QT0bJbjMRo1R
	CXcqz1wMJk26nOFJEOw3AJU96RijQ+n3GZOHf0FZdp6zCSi/cCcvhu2jDbznxcK2PABvXZBWTXdUO
	GelO8I/dvPfMImbh/nDyP+W3Ps79lMs5vfsSaZKS7SvU68KEMuDCuK0xCIYycJWKLIxUpNbYNlrf8
	7cOaihnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn6S2-000000022RA-15ce;
	Wed, 26 Feb 2025 01:43:06 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn6QU-000000022HJ-0xss
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 01:41:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=jdo3/IxMwB8Q6RAm8ZwQFpjzIGffxAXyzhXHZ3RcNYQ=; b=CvN5XUDJLLlwrhy2yvZ3JOn+mA
	66llyxU9BmPbO5yXQyiku1NmjCiS1kuS9BFF8Yp06Eqq24WFuOy39micBVHNgX3ViXpXs19PthvR/
	Wn9fLbmpxq9kdrF/dni3e0lPtym++ScEocHEK8MLciUAsI6lsVqr//2bFdZX5STFbLXwXndIoKsVO
	PZQ6MhZXoT/BiTrKcnlI/OL350i3vgAWwJmB8o8De+KtnrV2a6lTFKQ/ouDwLkRElW691cwJl0YRk
	/SiR5VaATjvDIh1KOZqglSm6ktFZm7wqGo36ulqjhlizNZB/3F21vRn8vd7OKxW/bwYZ5ZOJXuLL1
	sUyRl2ag==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1tn6Px-001nh1-2C;
	Wed, 26 Feb 2025 09:40:58 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Wed, 26 Feb 2025 09:40:57 +0800
Date: Wed, 26 Feb 2025 09:40:57 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Will Deacon <will@kernel.org>,
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
Subject: Re: [PATCH] crypto: lib/Kconfig - fix chacha/poly1305 dependencies
 more more
Message-ID: <Z75xKexTUNm_FnSK@gondor.apana.org.au>
References: <20250225164216.4807-1-arnd@kernel.org>
 <20250225213344.GA23792@willie-the-truck>
 <f7c298b8-7989-49e7-90a2-5356029a6283@app.fastmail.com>
 <c4896a12-8abe-4fe6-b381-86b23d32b332@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4896a12-8abe-4fe6-b381-86b23d32b332@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_174130_267339_E4D65B35 
X-CRM114-Status: GOOD (  11.78  )
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

On Tue, Feb 25, 2025 at 10:50:10PM +0100, Arnd Bergmann wrote:
>
> After looking at the original 0day report, I think the fix for
> that problem would have been
> 
> --- a/drivers/net/Kconfig
> +++ b/drivers/net/Kconfig
> @@ -94,6 +94,7 @@ config WIREGUARD
>         select CRYPTO_CHACHA_MIPS if CPU_MIPS32_R2
>         select CRYPTO_POLY1305_MIPS if MIPS
>         select CRYPTO_CHACHA_S390 if S390
> +       select CRYPTO_CURVE25519_PPC64 if PPC64 && CPU_LITTLE_ENDIAN
>         help
>           WireGuard is a secure, fast, and easy to use replacement for IPSec
>           that uses modern cryptography and clever networking tricks. It's

Thanks.  I wasn't aware wireguard was doing this.

Let me see if I can replicate this select matrix in lib/crypto
instead.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

