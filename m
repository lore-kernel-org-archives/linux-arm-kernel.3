Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A284C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 22:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BiTN9UiSFs9zKrHeeqDNp9IdOipgH6nZK4vxokb2X04=; b=za8MV/VgnxpWsbhjP8Qb5r5svB
	3CrDnNHOxNREWdE/2ihFfd7Q8qxgRKAC4B5WIPApD2EwpMr92AASpJ4r2ZiYfgC8+mx+IrizYaS7+
	3i4/mZcSqo/Ev+nOWAOg2TMdtIjqNez2AYFfPW20k6hL5TbY9ILXNCaxagV/Rq2WYwUlILl2+zKTf
	YGrNDj+uFZLxmLUyWXWmFkVC13NTsxQWWWpgGEwE8PYOZCuX2mKc5bNta4D1UFdhPYQQdJsQsRmgI
	eiI2iK/zF3nttIjMfKJTrE5drKxZUJYvgUqtqyRDSytgZMUbqsFV+pjQEIEVaYGAmrOugtNu8Iajh
	thO1br0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZdi8-0000000A7s3-4An0;
	Wed, 09 Jul 2025 22:56:20 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZaIC-00000009hVP-3EeH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 19:17:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EB219A548EE;
	Wed,  9 Jul 2025 19:17:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 635BFC4CEEF;
	Wed,  9 Jul 2025 19:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752088639;
	bh=jAgStzgTXM2O4+1cFvDzq8iYsGJs2o//jW34p27qwno=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EbUYyJSrCKCM8gLFTMV4Fi49SXucfus/W1v1iN4KMYD42BqPIf4RCcs0o375st9Wv
	 zDfk6ABrx1qopS7G/nbtsMcjwe+KQf+PDN9D0aEb8cCifMaFk2a59dgDLVrk7HRKsK
	 yAboIgYlLwIfkE3J0Ozp8WOcYWAsS0nhvzOBKUpA40oKkIrQD4tVkaPyVGYcWL0eiP
	 h4gDaouGHka7543w0uHxln4rc89vIl/N5T6znoSIpF4NZeJIDuNR3OflxOgtV8Ysky
	 Ig/iKUAqQN0gta8A+LrK85Ag+mDUPkiK/3HPw/fO8kO53B2eWIRGLAv9w3MmSPKbRD
	 ZRdMfAeAdP8/A==
Date: Wed, 9 Jul 2025 12:16:35 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-arm-kernel@lists.infradead.org, x86@kernel.org
Subject: Re: [PATCH 0/5] lib/crypto: Poly1305 fixes
Message-ID: <20250709191635.GA28537@sol>
References: <20250706231100.176113-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250706231100.176113-1-ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_121720_875007_2BC13DF8 
X-CRM114-Status: GOOD (  13.12  )
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

On Sun, Jul 06, 2025 at 04:10:55PM -0700, Eric Biggers wrote:
> This series is also available at:                                                                        
>                                                                         
>     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git poly1305-fixes
> 
> This series fixes the arm, arm64, and x86 Poly1305 functions to not
> corrupt random tasks' registers when called in the "wrong" context.  It
> also fixes a performance regression on x86 with short messages.
> 
> This series is needed for my upcoming poly1305_kunit test to pass.
> 
> Eric Biggers (5):
>   lib/crypto: arm/poly1305: Remove unneeded empty weak function
>   lib/crypto: arm/poly1305: Fix register corruption in no-SIMD contexts
>   lib/crypto: arm64/poly1305: Fix register corruption in no-SIMD
>     contexts
>   lib/crypto: x86/poly1305: Fix register corruption in no-SIMD contexts
>   lib/crypto: x86/poly1305: Fix performance regression on short messages
> 
>  lib/crypto/arm/poly1305-glue.c   |  8 ++----
>  lib/crypto/arm64/poly1305-glue.c |  3 +-
>  lib/crypto/x86/poly1305_glue.c   | 48 +++++++++++++++++++++++++++++++-
>  3 files changed, 51 insertions(+), 8 deletions(-)
> 
> 
> base-commit: f1da28dfadd26ef95bbd0b1ddf066e7ffe1505ff

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=libcrypto-next

- Eric

