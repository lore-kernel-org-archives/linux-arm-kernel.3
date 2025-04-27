Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87DE2C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 00:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qIc1CnqWjP+VDV+/eTU2C9hwQs+hAGsJroIHvnLDXc0=; b=lkttUaszsBggc25L71/MXzSK7a
	xZZhITQkUZelr8j/lxv63w5Iq1Z7gbHIyKX0CN7eqyktg8h9SIozo0LSDuKYBD03V3n7Go5EysM5K
	zDrCfN7oEF59Bqkvj5PmIEKtJ3BBNsvCXpZQvik+W6k4qPF8YOUGgGS/Tm3M8Dftds0NR24lt8Ufb
	PrigarX2hD3yCipCdmIvZDlmvoH5LJuH3ueAmfaxQVhlJvJPw0SP7CPYjtj6OrTKagUvR3dFmnKbj
	HTlLlzfEPR2DAV98PTmxXXhCvH79OIuKzv7QguNv2sUnpGEfPaFlpjJV/QHGZrCu1bwPShJsrW2Hu
	S5HkDQxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8plV-00000002esi-2OiW;
	Sun, 27 Apr 2025 00:21:01 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8pjb-00000002ei7-0Aiq;
	Sun, 27 Apr 2025 00:19:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=qIc1CnqWjP+VDV+/eTU2C9hwQs+hAGsJroIHvnLDXc0=; b=LsUBruIGAs9uLBJRTk9h6fgdB0
	2xisb0QqkU5+qP/eEYOH3uvK2DCnuZkERHnCECKmdbX85eZlMfmPqVki9sSxjYrxdWFAhjUUMsUD3
	P2JtdRMdBzT9y1/R7BdqzGhm5+HW6Qeftz51Y5755VFfohf8/0ee7AMDCj9lJUk5Fsi5cY7ScWSiM
	wAarhpfnk8TKu4CA4qEF5xdYMq88s0cnneBOdtKkePk/L0Ss41Ue/EHUkeraGj4GuqVbngWnxOuPy
	zGJVAmP3Tblrt5KCk9xwxPfx3IMbexqk44KkQviPivswZwKydYQtt5WMVkj4AP4WS2Vj5Wn0x9m7M
	CuGifb1w==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u8pjU-001IyU-22;
	Sun, 27 Apr 2025 08:18:57 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sun, 27 Apr 2025 08:18:56 +0800
Date: Sun, 27 Apr 2025 08:18:56 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org,
	linux-s390@vger.kernel.org, x86@kernel.org, ardb@kernel.org,
	Jason@zx2c4.com, torvalds@linux-foundation.org
Subject: Re: [PATCH 11/13] crypto: x86/sha256 - implement library instead of
 shash
Message-ID: <aA138IKjqyZeQLgB@gondor.apana.org.au>
References: <20250426065041.1551914-12-ebiggers@kernel.org>
 <aAy6g3nblKtRj1l3@gondor.apana.org.au>
 <20250426180326.GA1184@sol.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250426180326.GA1184@sol.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_171903_081624_A40BAE25 
X-CRM114-Status: GOOD (  15.22  )
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

On Sat, Apr 26, 2025 at 11:03:26AM -0700, Eric Biggers wrote:
>
> The SHA-256 library functions currently work in any context, and this patch
> series preserves that behavior.  Changing that would be a separate change.

I've already removed the SIMD fallback path and your patch is
adding it back.

> But also as I've explained before, for the library API the performance benefit
> of removing the crypto_simd_usable() doesn't seem to be worth the footgun that
> would be introduced.  Your position is, effectively, that if someone calls one
> of the sha256*() functions from a hardirq, we should sometimes corrupt a random
> task's FPU registers.  That's a really bad bug that is very difficult to
> root-cause.  My position is that we should make it just work as expected.

kernel_fpu_begin already does a WARN_ON when called in hardirq
context and it can't safely use the FPU, there is no silent
corruption.

In fact if anything your patch is making the problem worse by
making a hardirq stochastically slow with no visible warnings
at all.

> Yes, no one *should* be doing SHA-256 in a hardirq.  But I don't think that
> means we should corrupt a random task's FPU registers if someone doesn't follow
> best practices, when we can easily make the API just work as expected.

If you really want to support this, do it in the FPU layer, not here.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

