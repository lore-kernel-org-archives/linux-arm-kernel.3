Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3578CD10BE5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Oct 2024 06:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dMbiS79IRWkAjW+tIrkhW4M9vtmrftvVQ8uN7qrKRsg=; b=Ux1rmst/861CvOH9KAZx0sV8u9
	2u3K8Hin/nb3XaXEqyVWB475uveGLwjcZQzQvygX2ch4ZyGq+zgYoyiMKomjJ2+HwfBCUUcb3/fGj
	j/gkRMLFRo6SmpT5DimBvW+RVffkgQ98to9AluLVFH88hyE6pZrU8+mf49LBgtcpq2+hcOtb0kPlQ
	GA371EkE3UtJpiTGC39rVhUwaPaKC2VWcJQG3gU5BdVPJdAM6XwtzmbgpA7xqArsoccKrdZPMzeKB
	8Hzs5/H6zyFgf3ZSjLdnPt3vTgPJYVqpq04xro+BUrKeqiSS7U48Po4pp4Xe7W8obAaZCSmB40R04
	xuHgkRcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4aic-000000064W9-2vtn;
	Sat, 26 Oct 2024 06:56:15 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4ah1-000000064EG-2wuG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Oct 2024 06:54:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=dMbiS79IRWkAjW+tIrkhW4M9vtmrftvVQ8uN7qrKRsg=; b=J663dotrqKoH+Ubl5Kih8StJn4
	ZDlkJ63soehxCJgpW74JjsMXip25dUteBV+Onjt4DKJj/S8HTzRZ8ByywvcQIOa9JL/SwugxnEtYz
	aV4PE6/zWDPp/7rxH/CKTiNvUXtxwndEPxycbjZCzmUfcn+FBYaFvZDUHzHBHqRLwyxQaYh4cR4fa
	E8hUw4TNNZFzZ0yVgU8tI8UMV5C23F4tmvVge/QNFcDyoxlzBzkE2cHpijm1gC6+spb7hQzkSX6wU
	lBBVleqreIWdGdgbOGp5I2Ka55Wmw9h6bYOwxNGYkILVvzn4jnHopoWMAdzIMb5rDrp8wJsn5wZ17
	HCY2B99Q==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1t4agd-00CFso-2F;
	Sat, 26 Oct 2024 14:54:12 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 26 Oct 2024 14:54:11 +0800
Date: Sat, 26 Oct 2024 14:54:11 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	David Hildenbrand <david@redhat.com>,
	Greg Marsden <greg.marsden@oracle.com>,
	Ivan Ivanov <ivan.ivanov@suse.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Miroslav Benes <mbenes@suse.cz>, Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [RFC PATCH v1 20/57] crypto: Remove PAGE_SIZE compile-time
 constant assumption
Message-ID: <ZxySE1gdlTxV3OXO@gondor.apana.org.au>
References: <20241014105514.3206191-1-ryan.roberts@arm.com>
 <20241014105912.3207374-1-ryan.roberts@arm.com>
 <20241014105912.3207374-20-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241014105912.3207374-20-ryan.roberts@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_235435_765157_BFA5B43A 
X-CRM114-Status: GOOD (  12.15  )
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

On Mon, Oct 14, 2024 at 11:58:27AM +0100, Ryan Roberts wrote:
> To prepare for supporting boot-time page size selection, refactor code
> to remove assumptions about PAGE_SIZE being compile-time constant. Code
> intended to be equivalent when compile-time page size is active.
> 
> Updated BUILD_BUG_ON() to test against limit.
> 
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
> 
> ***NOTE***
> Any confused maintainers may want to read the cover note here for context:
> https://lore.kernel.org/all/20241014105514.3206191-1-ryan.roberts@arm.com/
> 
>  crypto/lskcipher.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Herbert Xu <herbert@gondor.apana.org.au>
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

