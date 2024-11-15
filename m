Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EAC1D6DDED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 11:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+mvXcr5Z5PsIemwYslMa6Llzo3RDr0teFDNxaivqn1o=; b=aWCibN1LVoyHv7WlPH71e7Iiip
	CQNCak0l0SJK9RakIAi6vOJzRIbevYvzR76qmMKS4oyQq3VyqUCRsJY9QowgDDFM3/7kU457HZyqn
	Co99wqDx62WKV1RW2lDTYKmgMDGzgSE91DXIHPNREJxJnK3zRdGxT4n5v5Tdt7FzY+Wxk7pO+3ciH
	y4t2gdv1xpFhp1wli4SOCTc9dv/r5tKxUuXuEC6fDatZqIGzBC8nTbtJ83wl583rsGJeQgRxfSh9q
	614VjgdNH4AAH9Ecsxth/cSXh6oFhd2SVm73qWaH61QOmGPSOJvTIwv2LwPGUlpGq4rnyZAWH4Owi
	0CfwOF9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBuyQ-00000002asC-1MEo;
	Fri, 15 Nov 2024 11:58:50 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBuxT-00000002aZq-3nxW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 11:57:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=+mvXcr5Z5PsIemwYslMa6Llzo3RDr0teFDNxaivqn1o=; b=ObHsZmYvQQwQWpgg2Wam4dgyAO
	bpSn6HDHimxZ6j3KdkdVVwP5/NxWTLMu6XD8jdLvG+pt9dhlaccIqJrggmrFYIICbmOLte6HkhyJ9
	QhBrSI8qTCynMEiEguEreh0G+G2+CiJGeiaQLiRAyTQz5C0NWElJiYdSWeDu/2NuN99YFkmUhDTib
	P/ZML453RjKxk8mpolecU/4x9cZELXopDCZ7ahQwSGKwXPNgQiuxKx8ryh+fHtC1coc1GIU/1WoAs
	KUIGc+G2RDUTaCJtjJigVZNl4cvoQjtYIBB1tPLclV/HSAMk/MqqZWNAoD1tU8FgDuhaIc/txVN1a
	eYryOOBQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1tBuxN-00H1xs-0M;
	Fri, 15 Nov 2024 19:57:46 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 15 Nov 2024 19:57:45 +0800
Date: Fri, 15 Nov 2024 19:57:45 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	ebiggers@kernel.org, keescook@chromium.org,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v2 0/6] Clean up and improve ARM/arm64 CRC-T10DIF code
Message-ID: <Zzc3OfJj85LpI1uY@gondor.apana.org.au>
References: <20241105160859.1459261-8-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105160859.1459261-8-ardb+git@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_035751_943053_04EFA820 
X-CRM114-Status: GOOD (  18.65  )
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

On Tue, Nov 05, 2024 at 05:09:00PM +0100, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> I realized that the generic sequence implementing 64x64 polynomial
> multiply using 8x8 PMULL instructions, which is used in the CRC-T10DIF
> code to implement a fallback version for cores that lack the 64x64 PMULL
> instruction, is not very efficient.
> 
> The folding coefficients that are used when processing the bulk of the
> data are only 16 bits wide, and so 3/4 of the partial results of all those
> 8x8->16 bit multiplications do not contribute anything to the end result.
> 
> This means we can use a much faster implementation, producing a speedup
> of 3.3x on Cortex-A72 without Crypto Extensions (Raspberry Pi 4).
> 
> The same logic can be ported to 32-bit ARM too, where it produces a
> speedup of 6.6x compared with the generic C implementation on the same
> platform.
> 
> Changes since v1:
> - fix bug introduced in refactoring
> - add asm comments to explain the fallback algorithm
> - type 'u8 *out' parameter as 'u8 out[16]'
> - avoid asm code for 16 byte inputs (a higher threshold might be more
>   appropriate but 16 is nonsensical given that the folding routine
>   returns a 16 byte output)
> 
> Ard Biesheuvel (6):
>   crypto: arm64/crct10dif - Remove obsolete chunking logic
>   crypto: arm64/crct10dif - Use faster 16x64 bit polynomial multiply
>   crypto: arm64/crct10dif - Remove remaining 64x64 PMULL fallback code
>   crypto: arm/crct10dif - Use existing mov_l macro instead of __adrl
>   crypto: arm/crct10dif - Macroify PMULL asm code
>   crypto: arm/crct10dif - Implement plain NEON variant
> 
>  arch/arm/crypto/crct10dif-ce-core.S   | 249 ++++++++++-----
>  arch/arm/crypto/crct10dif-ce-glue.c   |  55 +++-
>  arch/arm64/crypto/crct10dif-ce-core.S | 335 +++++++++-----------
>  arch/arm64/crypto/crct10dif-ce-glue.c |  48 ++-
>  4 files changed, 376 insertions(+), 311 deletions(-)
> 
> -- 
> 2.47.0.199.ga7371fff76-goog

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

