Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF5FC61CE7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 04:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FaUxGj4VtfSrMWJ+tBWopr/w3bGCwOfzq4u3E//ODvI=; b=vsEnTGwG6q92asCWgeU9q3ey/p
	dh3hNMOUerl20a79vALxV4SIFVTITwQpyzW349+KUzFkChxo+MGHRulc555Aqq14QKt9Nh/3OaY++
	GBfElE5Ol71bmhxPm6iHcR42WxRffzAsKlasVnrD6y23uq6duTfAuS131IJwC6gWfcjUuLiZmuJVu
	P3UprUZi4HluZSUZkgMLWoyrle02M6ytR4y81eQ5w3F2McygIek03QToGcHDEdfMdUyEW+h5tTemA
	oE00qof1MlmhsLO/l20npf3Q15hcBEfGIf9edJZC6sRYGXOf1Lpisa3Hu2cwAyMZv/ze8o3HFWV6T
	2EFOuHug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPCdO-00000008nT6-2Ufa;
	Wed, 11 Jun 2025 04:00:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPCQl-00000008lhT-0j3k;
	Wed, 11 Jun 2025 03:47:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FaUxGj4VtfSrMWJ+tBWopr/w3bGCwOfzq4u3E//ODvI=; b=bQVjoM1MxucWRw4BndYWLkPEXk
	1SVFZ7J6aifBB7bUtKfmJzw/dG9WIEdhl/P4TAO85By26qCTqOvUD0ScfdnmS4uRh+l+h0vZ2Xb6A
	E3Bsgy+o5QKI0Ml4VDp9A+/2Or7j6zr67FLNrY62cxUc8hmAh0VeVpCLdglG8K4sbECaFJQuvuVH6
	xeXj5Ir6/YYatxtTlXsqmLhQhgx+50hc5Bt3tiBPvbfJPz7Bfklfsuq4RUrLU2jv/mXf1hrGmZ6JK
	5bKAqM3hfgeCe/9YTiXrMmt+zqv9+tUBUtu/bVsydbHz/ITMPPXZDXNrx9ZygvexXzqKnPV8EBy8m
	i1PiZcrQ==;
Received: from abb.hmeau.com ([144.6.53.87])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPCQg-0000000267M-3LPe;
	Wed, 11 Jun 2025 03:47:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=FaUxGj4VtfSrMWJ+tBWopr/w3bGCwOfzq4u3E//ODvI=; b=mkFa3OhC+Qo4uggq0lm+VesVgK
	ws5RLDEtaTsq4bUYSBpul0obfyudjKCh/9tUf+YUaCcXdNPAIqDUATISwpCILd5hxw2B3ByCr7wZM
	CiaXuBOcN1xsetLKjVg/ex3IbYABc3Uec4Yv02lkMzqtMm/rVW/x0qmK1tU3JDKqMd06vYQz6OL4H
	wxzG2kV9vwkdEtrzGsOlS954o/HhO+YsgXgFbP+INSiUq1g1MwjULr6MpamQeCsQgax9LuV/VPcwE
	+X61xGRTLI6NKWhWfIqnDiaZ0lgwTtuudG76/yMtoYPyPBMt1wZStvPLtENAGMHHmj8UXrtRyvHsw
	Xs2BEJkg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uPCQJ-00CFcx-0o;
	Wed, 11 Jun 2025 11:46:48 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Wed, 11 Jun 2025 11:46:47 +0800
Date: Wed, 11 Jun 2025 11:46:47 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org, ardb@kernel.org,
	Jason@zx2c4.com, torvalds@linux-foundation.org
Subject: Re: [PATCH 07/16] crypto: sha512 - replace sha512_generic with
 wrapper around SHA-512 library
Message-ID: <aEj8J3ZIYEFp_XT4@gondor.apana.org.au>
References: <20250611020923.1482701-8-ebiggers@kernel.org>
 <aEjo6YZn59m5FnZ_@gondor.apana.org.au>
 <20250611033957.GA1484147@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611033957.GA1484147@sol>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_044711_733904_793F0ADF 
X-CRM114-Status: GOOD (  13.64  )
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

On Tue, Jun 10, 2025 at 08:39:57PM -0700, Eric Biggers wrote:
>
> Do you have a concrete example (meaning, a specific driver) where this actually
> matters?  Historically, export and import have always had to be paired for the
> same transformation object, i.e. import was called only with the output of
> export.  There is, and has never been, any test that tests otherwise.  This
> seems like a brand new "requirement" that you've made up unnecessarily.

It's not just drivers that may be using fallbacks, the ahash API
code itself now relies on this to provide fallbacks for cases that
drivers can't handle, such as linear addresses.

I did add the testing for it, which revealed a few problems with
s390 so it was reverted for 6.16.  But I will be adding it back
after the s390 issues have been resolved.
 
> I'll add export and import functions if you insist, but it seems pointless.
>
> Could you at least provide proper definitions for the legacy structs so that I
> don't have to do pointer arithmetic to generate them?

Just expose the sha512 block functions and use them as is.  There
is no need to do the export/import dance.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

