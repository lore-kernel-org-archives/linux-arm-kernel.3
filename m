Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09619C61DB8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 23:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9BLd3zVhm1uyr2zWfOpGUqAHdfaRE3TGpoHRN6aaMSk=; b=uoO1fWwSzUKBUV5fSqmRf3z8Ma
	zC+yBHarsfEhWiByq7IaMMyLfGO3tLGPerdTNy+Jv8uq/w8iigIN253GmHWylVNh6mIPA+IUXrAld
	OlMW+VKcMr941zA1damcuczQLpYcvblkq9822w0QY5Lv6ldCPK0ImTX0CIFzyF4pKCilAjuoe/54T
	GPUdysy0NzRigpIOLxajutp27mX3lDPfZR2ktC+xz2uYeuAtL2WXXfn78xkC5BspMzetreBOaTpOy
	8M3/cEtcimXjxe9F9bJhVa1NZ0saFNxUVqtOzU78ZaQvC2NRU/RwcuEXE5TXylZgtc8iG01eggXb0
	hW3/nCyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uO3Hz-00000002DO5-36v1;
	Sat, 07 Jun 2025 23:49:27 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uO3Fn-00000002DHA-25M3;
	Sat, 07 Jun 2025 23:47:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 333DAA40311;
	Sat,  7 Jun 2025 23:47:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FE6DC4CEE4;
	Sat,  7 Jun 2025 23:47:07 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="jsPgU/cc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1749340025;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9BLd3zVhm1uyr2zWfOpGUqAHdfaRE3TGpoHRN6aaMSk=;
	b=jsPgU/ccygnXS60vh3VCJ8IeDnGtsomv+dciNUeunJ0SO8LqmCcTqPcJBkB2QFrLru1ll1
	E9OF1lkNEqMRShrw2za9BAoJsJQKmF9rvzmtd3v/rLI1EduGNSPRtry+Kyl+tncxIkS+aK
	UrU1VhYkP4pcQtnNoKmPvrZIA/DIb6Q=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 669734c3 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Sat, 7 Jun 2025 23:47:04 +0000 (UTC)
Date: Sat, 7 Jun 2025 17:47:02 -0600
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org,
	linux-arch@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v2 00/12] lib/crc: improve how arch-optimized code is
 integrated
Message-ID: <aETPdvg8qXv18MDu@zx2c4.com>
References: <20250607200454.73587-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250607200454.73587-1-ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_164711_835299_F3726C59 
X-CRM114-Status: GOOD (  14.05  )
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

On Sat, Jun 07, 2025 at 01:04:42PM -0700, Eric Biggers wrote:
> Having arch-specific code outside arch/ was somewhat controversial when
> Zinc proposed it back in 2018.  But I don't think the concerns are
> warranted.  It's better from a technical perspective, as it enables the
> improvements mentioned above.  This model is already successfully used
> in other places in the kernel such as lib/raid6/.  The community of each
> architecture still remains free to work on the code, even if it's not in
> arch/.  At the time there was also a desire to put the library code in
> the same files as the old-school crypto API, but that was a mistake; now
> that the library is separate, that's no longer a constraint either.

I can't express how happy I am to see this revived. It's clearly the
right way forward and makes it a lot simpler for us to dispatch to
various arch implementations and also is organizationally simpler.

Jason

