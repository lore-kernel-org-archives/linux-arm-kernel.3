Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD7210FCAC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 19:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w2uw4evRo6JNFyYESoQnF2PDXwA6jNSxktZVnH97twc=; b=0Vz2P+MoV5SgXvihn4jnKczr0E
	Inen8zwfp3gDXhIYd7MDjk0LBgqLZ5bGALUVGp2R6LqHXQqjS+K7TX9gdsmP+MgVj9zKSWf5s3U0Q
	6UadnpZscihZdW3yY41XH4xvnzQ8neztipvDX0R59V888m4tC0DvrnQsdfZcdYDunsfQhA0mcUtTr
	/nylwDjoohmAWYfcPah4uYuo+EGrfcgOI+BCeB+q8BoAQ9hXgeuKSgNVPIeuBxPzYiqzzFfsRZq+6
	F7wGlUr1jfhkVMTkwtHtJ5/X9rrhkc+9ToM7/BG2X5PdfJDHKQ7dd9rbQdhvv0hbOuQh2rQQzNwoe
	+5MZybxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w81jB-0000000G2Tz-0s26;
	Wed, 01 Apr 2026 19:59:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w81j7-0000000G2Ta-3wSH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 19:59:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 19EA8407EA;
	Wed,  1 Apr 2026 19:59:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9C4AC4CEF7;
	Wed,  1 Apr 2026 19:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775073585;
	bh=1E8S6zwaRhyrQHTY9xCDgGhQPsQKm8RgNaujalA9hRM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ki3d4th3VNz5G1xa/d0ahz6QHzFVoF/mhM44pFM6iK83NRb/m8dYExRRC6fiEAX+V
	 sb/t5rSk05ApDpyS97AX+q1ysvgv1zZ06ErmpxiFtGTSlspYL8qf32yXqKxAzQQ6pC
	 nS6gZTE7Bsb9GdjLNOWmgiZRh6nm4qodl99MaVcZJ0mXRyS8Ja4Ouv8E9dnk6NL1U0
	 TbTeuc4yG575e69ea1subPgc8UJhTzeLnnhuVoJejIv+7jIrrbKmK33opVZeRRq4gT
	 rz5fUDta5oqXeZ7c0eDMH/52b3bq+GtttuucqRFzUckddPyoEjXBqMld761GFQwEbs
	 YxaeohEV/adRA==
Date: Wed, 1 Apr 2026 12:59:43 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Demian Shulhan <demyansh@gmail.com>
Subject: Re: [PATCH 0/5] crc64: Tweak intrinsics code and enable it for ARM
Message-ID: <20260401195943.GA2466@quark>
References: <20260330144630.33026-7-ardb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330144630.33026-7-ardb@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_125945_999313_B6E58179 
X-CRM114-Status: GOOD (  15.41  )
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

On Mon, Mar 30, 2026 at 04:46:31PM +0200, Ard Biesheuvel wrote:
> Apply some tweaks to the new arm64 crc64 NEON intrinsics code, and wire
> it up for the 32-bit ARM build. Note that true 32-bit ARM CPUs usually
> don't implement the prerequisite 64x64 PMULL instructions, but 32-bit
> kernels are commonly used on 64-bit capable hardware too, which do
> implement the 32-bit versions of the crypto instructions if they are
> implemented for the 64-bit ISA (as per the architecture).
> 
> Cc: Demian Shulhan <demyansh@gmail.com>
> Cc: Eric Biggers <ebiggers@kernel.org>
> 
> Ard Biesheuvel (5):
>   lib/crc: arm64: Drop unnecessary chunking logic from crc64
>   lib/crc: arm64: Use existing macros for kernel-mode FPU cflags
>   ARM: Add a neon-intrinsics.h header like on arm64
>   lib/crc: arm64: Simplify intrinsics implementation
>   lib/crc: arm: Enable arm64's NEON intrinsics implementation of crc64

I think patches 3 and 4 should be swapped, so it's cleanups first (which
make sense regardless of the 32-bit ARM support) and then the 32-bit ARM
support.

I do think we should be aware that even with the code mostly shared
using the NEON intrinsics, the 32-bit ARM support (which works only on
CPUs that support PMULL, i.e. are also 64-bit capable) doesn't come for
free.  We should expect to deal with occasional issues related to the
intrinsics with certain compiler versions, compiler flags, etc.

I assume that "32-bit kernels on ARMv8 CPUs" is currently still a big
enough niche to bother with this, despite that niche getting smaller
over time.  But as I mentioned I do think we should try to simplify it
as much as possible, e.g. by supporting little-endian only and avoiding
#ifdefs based on things like the compiler whenever possible.

- Eric

