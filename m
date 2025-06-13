Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA77C71135
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 05:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oTmKBJlMorLr5a5LInNozxhvLN2jsh96HUsPIOSges8=; b=gVyqRaKWcdguk1/nLMeyRPi1BY
	zYi6z/8IUDiscFnF11ey+QoqDXs54gCvUiguXN5HMblzRpL+lSQG0Tl+xY0IUGVs+BLbfvOA83/ob
	HQpomABubJ+oe4LYSBmYgP2SeT19THyfq6CEDPYff6aW4K+prSTizXyNdcN/JZf80CZQvIyNTuL2H
	UPI9okEXOyiU3s7TrmMnVwtQZwpq9kaBhVa/B9HsOlszig7NWEMcu+4DGCiDmaQNcS/fs4ie/cmJp
	OGWmnxmPWwuvLESOe+WePIOw4scXcHXU3oVaOygu1Slv6t++rr5ZsHxxH7J6xtgpZypVQHlzLXqnu
	AjKFTJBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPxGd-0000000FQLI-1FyO;
	Fri, 13 Jun 2025 05:47:55 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPx8A-0000000FOlY-1kLr;
	Fri, 13 Jun 2025 05:39:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=oTmKBJlMorLr5a5LInNozxhvLN2jsh96HUsPIOSges8=; b=MpUKvseYkq6vJrGW2wEeJYJbyd
	9erfk9k/OIelxhqtST2G63Etxjf/l4waEtio+lwGS/YvJWxHfrgBi7vT90612S2yjiaqZg1yp15VQ
	+0/WMgh/vWFN+5EgWp3ePM0JPWxCCpPWUI0u5QyzgQ4rkMbrihzPy4P6vEiyqF0fdglweaZbKgPz3
	lcGc8LrVFasnavMmSFfunXd6iOB/a1rCbFuV0dhbTYtYvRyMxWPlr/CehCMPWOA2oG4goBifYOIWq
	IzJcLJ6dtEyg2eFqAxj8/SFtUE7Z7jjo6CbGdNHcee5UbceM6xFGgNpq2B+CHnWG+fWFvlVe4T6VL
	vyjVaA/w==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uPx7z-00CqA6-2c;
	Fri, 13 Jun 2025 13:39:00 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 13 Jun 2025 13:38:59 +0800
Date: Fri, 13 Jun 2025 13:38:59 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org, ardb@kernel.org,
	Jason@zx2c4.com, torvalds@linux-foundation.org
Subject: Re: [PATCH 07/16] crypto: sha512 - replace sha512_generic with
 wrapper around SHA-512 library
Message-ID: <aEu5cyDOMcKteW_b@gondor.apana.org.au>
References: <20250611020923.1482701-8-ebiggers@kernel.org>
 <aEjo6YZn59m5FnZ_@gondor.apana.org.au>
 <20250611033957.GA1484147@sol>
 <aEj8J3ZIYEFp_XT4@gondor.apana.org.au>
 <20250611035842.GB1484147@sol>
 <20250613053624.GA163131@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613053624.GA163131@sol>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_223910_452704_3E64F1B6 
X-CRM114-Status: UNSURE (   8.23  )
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

On Thu, Jun 12, 2025 at 10:36:24PM -0700, Eric Biggers wrote:
>
> You do know that most of the sha512 asynchronous hash drivers use custom state
> formats and not your new one, right?  So your code in ahash_do_req_chain() is
> broken for most asynchronous hash drivers anyway.

Every driver needs to be converted by hand.  Once a driver has
been converted it'll be marked as block-only which activates
the fallback path in ahash.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

