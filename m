Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38BC0C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 03:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ypo01vEghGy27nPQeItYqzxY2hP/jSSCN3P/bWLwnyg=; b=pij454G8jUdLyEQ+1rkkVhGTb+
	yipnP3KeGQ2CF3dD+wpAuxCoX25mDQ2UusdxyH/0L2J7KohItLjCP7YSnjgYQ5D6eibC0CXjQy6Ji
	1BNhel3DTjvV4/9IeQMYIHLKi8zG6s58jJ8Mcskw69cSt7DiRZZ9pPutYLOQjYZimWC7Hs+9vuaae
	aawnRFiIhR4dQb9RHtzqn8YPkTepdIr8JyP+Z0DbLJCsJupAP9ZtPIskaBmHYjvQt5FBt0cRwbBLF
	Pj6THCpSOvtlDSLMb80ib0+r7fnsfhOjy+6e8H45Xm6BcpS7kSKo0nCpP19Ocz4FNZOqGRSBDROCq
	XPHaWoRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5ceG-0000000F0co-3td0;
	Fri, 18 Apr 2025 03:44:16 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5cZZ-0000000Ezs0-1yIB;
	Fri, 18 Apr 2025 03:39:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ypo01vEghGy27nPQeItYqzxY2hP/jSSCN3P/bWLwnyg=; b=MWds7QQ5JPbuMv2nNP62mZrmbF
	Bq+va6ic3n9cE4To97pskQEOiYEgsVK/Xh8YuuAOKuIIID1z2Vq3HbZxQR+CYja/g25SPlAkVRUl+
	H9u9EF0MzbL5Mi8IsgXzItMNafiBhN+YDzET3Y9HViK1SEU7axHGeYqC9LhSPKWfG7EfR+Nvr10pf
	3g47jJR3eiFrDSksGYzS1b0S2RXn9rrEZ0+/URVOKCvjVfjHiqO3FGvkTbRRop+Bjj9y62pQPQXVh
	sey566NEI3Y5b5FUM0KMzQX/NoqvpplvIJxlE3X8eh9UpsQuZaJN/320owLJMMOldzgO3/MGmbseG
	rBqKJH2Q==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u5cZU-00Gejm-1k;
	Fri, 18 Apr 2025 11:39:21 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 18 Apr 2025 11:39:20 +0800
Date: Fri, 18 Apr 2025 11:39:20 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
	x86@kernel.org, Jason@zx2c4.com, ardb@kernel.org,
	Alexander Potapenko <glider@google.com>
Subject: Re: [PATCH 01/15] crypto: arm - remove CRYPTO dependency of library
 functions
Message-ID: <aAHJaH69Ngr0Ojh2@gondor.apana.org.au>
References: <20250417182623.67808-2-ebiggers@kernel.org>
 <aAHCIL_sYIS_1JQH@gondor.apana.org.au>
 <20250418032845.GA38960@quark.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418032845.GA38960@quark.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_203925_506360_606C8095 
X-CRM114-Status: UNSURE (   5.70  )
X-CRM114-Notice: Please train this message.
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

On Thu, Apr 17, 2025 at 08:28:45PM -0700, Eric Biggers wrote:
>
> Only x86 and s390 support KMSAN.

OK that's subtle but I'm glad it's not an issue.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

