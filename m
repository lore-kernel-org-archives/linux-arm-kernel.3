Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C620C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Jun 2025 23:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=koeyGqy9geqWWGboYYe/s1BFD6/F+f/laW8jqXjMlgA=; b=WCbRgfogHgkgoqxCijxy+zUB4y
	6pHO42Ek4iqgdopgoR84FuAbJlezqhEOPw0wCIVPTabF5pHcYbQr0ts2ql/BqxcNHts5zegQ2FfYS
	dArAmsj35bwA3zJXwmy+VnIR2AHGs5XVNkmctPtDpu3Jz3dpJAQcGVyaaeNTr62F/NVmvz8/rcCgL
	rsdWnfIGChYbzHzKd6JeGvWk+69/jsIB+YTVO3YKolOxbrwC31Tf6fKu92jdX2CZSQpm/1YZ3fBbF
	wFXcI4OUMii0eqUU6zScDqmrdSDHp0/M/DHo9vODWkXQywDPW98K6tr/8UarDiv2D8V/oo3qrQ9EV
	zz0qvHAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOPlR-000000039Ww-0QhJ;
	Sun, 08 Jun 2025 23:49:21 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOPjJ-000000039I4-0uOV;
	Sun, 08 Jun 2025 23:47:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5C5A0A4F6B4;
	Sun,  8 Jun 2025 23:47:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8491AC4CEEE;
	Sun,  8 Jun 2025 23:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749426428;
	bh=He/qqF7BxEbAQ+KhVIwOAYIjY3DpawZEJHr+Xte/K6Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EPyWCyBVPXpu72efvExgg8gLAw9penLyFzlo1qRsspsqyd4JZoFxW7hHQvlnEtIIa
	 1BxGaS04c9RuFEve+dtCt1LEb2SSISR2VgjLm0WYXRDHNt8nXsOorMQAj8PjQpmAB0
	 F5rfSxl/09kNUJny72FkrWqXDDqrWHkySwoyI3r23w9s9UZxhxYgVcxmIH21znQLYr
	 RAY4VaCbmTRnWUl2bEewz1enz7kzJYX9fFC9W66bUVBifTQ9wgF652vwOiRoE9mHCR
	 SyixTBnJQbaXXeJQKz8gWyl2YRqW1kNgBMYmIhv1mCruOadbFAPFkGtBFHhXGzcMB6
	 +EWaHxDKp/9YA==
Date: Sun, 8 Jun 2025 16:46:46 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
	x86@kernel.org, linux-arch@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH 00/13] lib/crc: improve how arch-optimized code is
 integrated
Message-ID: <20250608234646.GE1259@sol>
References: <20250601224441.778374-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250601224441.778374-1-ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_164709_382683_91B00703 
X-CRM114-Status: GOOD (  22.93  )
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

On Sun, Jun 01, 2025 at 03:44:28PM -0700, Eric Biggers wrote:
> This series improves how lib/crc supports arch-optimized code.  First,
> instead of the arch-optimized CRC code being in arch/$(SRCARCH)/lib/, it
> will now be in lib/crc/$(SRCARCH)/.  Second, the API functions (e.g.
> crc32c()), arch-optimized functions (e.g. crc32c_arch()), and generic
> functions (e.g. crc32c_base()) will now be part of a single module for
> each CRC type, allowing better inlining and dead code elimination.  The
> second change is made possible by the first.
> 
> As an example, consider CONFIG_CRC32=m on x86.  We'll now have just
> crc32.ko instead of both crc32-x86.ko and crc32.ko.  The two modules
> were already coupled together and always both got loaded together via
> direct symbol dependency, so the separation provided no benefit.
> 
> Note: later I'd like to apply the same design to lib/crypto/ too, where
> often the API functions are out-of-line so this will work even better.
> In those cases, for each algorithm we currently have 3 modules all
> coupled together, e.g. libsha256.ko, libsha256-generic.ko, and
> sha256-x86.ko.  We should have just one, inline things properly, and
> rely on the compiler's dead code elimination to decide the inclusion of
> the generic code instead of manually setting it via kconfig.
> 
> Having arch-specific code outside arch/ was somewhat controversial when
> Zinc proposed it back in 2018.  But I don't think the concerns are
> warranted.  It's better from a technical perspective, as it enables the
> improvements mentioned above.  This model is already successfully used
> in other places in the kernel such as lib/raid6/.  The community of each
> architecture still remains free to work on the code, even if it's not in
> arch/.  At the time there was also a desire to put the library code in
> the same files as the old-school crypto API, but that was a mistake; now
> that the library is separate, that's no longer a constraint either.
> 
> Patches 1 and 2, which I previously sent out by themselves, are
> prerequisites because they eliminate the need for the CRC32 library API
> to expose the generic functions.
> 
> Eric Biggers (13):
>   crypto/crc32: register only one shash_alg
>   crypto/crc32c: register only one shash_alg

Applied the first 2 patches to
https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=crc-next

The remaining patches have new versions in the v2 series.

- Eric

