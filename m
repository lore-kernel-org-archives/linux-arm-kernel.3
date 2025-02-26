Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C07DAC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 08:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WG/BZB8dw3KJbqJYA4MeEP90bt5qmYBoQ2VtcFkN6bQ=; b=L6OtF9DMg0yDR9O1cbD6NR7NI2
	H9026fNRvvt/2J0hUzSrKvc9/pmI6BPo0yGCa6t0Qu9K5a6VnM6nMZu/ntzrrpxC0y8Dej2YqcHQw
	WPmx309r94XxoqhCjAk4O6vyIKanJC4Thrf4m4biL1mtdtYxpP4tp5kIloiw6QkqVG3DUJ/0Az9Q6
	3qadrDZ+bKZKRwrDiFG9K/wTPUQp4NS+JZXw89KA/0+/1SVHcyZ3ntCe04iBidNtTVsAiT9DYLvyi
	fmBeYx/D2eACbVRuGGcRqE+QI+SldqC1euP48+21/shqCs1A5QPSUvJy/nsxusxgcFTnnbJdYArXG
	olXz1BLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnCv3-00000002v1d-0MQi;
	Wed, 26 Feb 2025 08:37:29 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnCpl-00000002tZR-29S1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 08:32:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=WG/BZB8dw3KJbqJYA4MeEP90bt5qmYBoQ2VtcFkN6bQ=; b=hRaTwBlonDtEs5WWJDXcbJm7MU
	d4V9ZU6gHuJhkoi+hhZkS5kWAh65aYIBJTcW3+buIGJCXhqkaXgQ9PDIyPPhzH3nHEL5s0BMo74Ay
	ZQ1g0YhnFjKc7xk8lbHvBTR1rIBGK96J+TfAXWfTK4R7NRj8VBy/UjHmYuTO/b84eyf6qdI6Wfr+Y
	+baf0BP/9ndb6/emmAdd/YEU8pr6wLK4fIYy3EYMBtbaCqZ/jyeKA6m/D8Y1Nxa/jz+FksG6aR4IB
	/e3yhBCDN1MtgDD5i2uJvxQjkjgJPUPoFkAMvzVh58O+wk5F75j/yVAw4ngML9BIE98ykuLrredB9
	wHmg+PfA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1tnCpM-001sM7-0Y;
	Wed, 26 Feb 2025 16:31:37 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Wed, 26 Feb 2025 16:31:36 +0800
Date: Wed, 26 Feb 2025 16:31:36 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
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
Message-ID: <Z77RaBFMc7u4EEIc@gondor.apana.org.au>
References: <20250225164216.4807-1-arnd@kernel.org>
 <20250225213344.GA23792@willie-the-truck>
 <f7c298b8-7989-49e7-90a2-5356029a6283@app.fastmail.com>
 <c4896a12-8abe-4fe6-b381-86b23d32b332@app.fastmail.com>
 <Z75xKexTUNm_FnSK@gondor.apana.org.au>
 <Z76aUfPIbhPAsHbv@gondor.apana.org.au>
 <20250226060725.GA41090@sol.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226060725.GA41090@sol.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_003201_555890_FD9A510D 
X-CRM114-Status: GOOD (  10.20  )
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

On Tue, Feb 25, 2025 at 10:07:25PM -0800, Eric Biggers wrote:
>
> There's no need to have a select for every architecture, with the dependencies
> redundantly listed.  Instead just 'default' each of the arch-optimized options
> to CRYPTO_LIB_CHACHA.

Good point.

> The way it should work is that CRYPTO_CHACHA20 should just select
> CRYPTO_LIB_CHACHA (and thus also the optimized code).

Good catch.  I'll add them.

> And similarly for the other algorithms, which should be in their patches.

It's best to keep everything together as if done separately they
may introduce bisection issues between the patches.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

