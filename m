Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39EF8C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 22:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k8g2DRYbUFc/WlQ2pAkletlhQtrwe1F0NZCL2F3+zUE=; b=v5nHgNqkPuVwU9qg3O/TSVjk+/
	Ujik85TD+CqqArkZ5ICk07pltyEIrpMxpuLgwqtaQIUgYId2smB2xT3z+2BLSMtKfehOHcWI6HsBQ
	Fqw/KXyjbFAyYkKDTlMEt0eiGUmbfWVddqXnzj4QQSLzOsjtUGhUpC1H4kWrDo5QwGmY3QhNZm9OK
	dMl9sx6o+1Pj2U8LL5Z06o3u2C+gOboPBEl9wGR9m4hm3tCuUFTH9cRHNbk7vVw8MCOXsw7doN43X
	bw47xFI+ztjz5XptJDx+t8l5mqdP/avsiO2iqQyHDnKcReoagaoXTuca/gRplHFBhRaGQWunHiJZp
	Ay1bQ6Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAE50-0000000EYFf-405M;
	Fri, 25 Sep 2026 22:07:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAE4z-0000000EYFL-25TM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 22:07:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 871CB60136;
	Fri, 25 Sep 2026 22:07:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3F871F000FF;
	Fri, 25 Sep 2026 22:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790374060;
	bh=k8g2DRYbUFc/WlQ2pAkletlhQtrwe1F0NZCL2F3+zUE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Blm+98gnNSmmT+B1FkGka5xELWe0Sas5kxh6t5tiDl8w5RPy2GIR156rg32qYAB8h
	 0WC2HIz9I9oTU8BMJGRhVpVPYDGzzRjyfJveq8tYuLsmMYq8PIg/rRdFm5JUc5XTUv
	 91GhFUgvrNiWWbRRvN59hi3Fpb3qet+Bo+uXdpaPUiXnSpzo4uJ6julwsKMhb0hI0F
	 fCnTm7iQaDrz5G7/S+Ybr+QBIQ138M/AuG4leepfCPOBvTzVcKAe7YoDWwTXpZPdWD
	 sWKIAoZzsyb+GWb/CE2bNAPLaHe7PFEY5aiF2ExoAzy1jo3Uh5k6xUgU2dktwiDBax
	 IMsJ0+SwguBcQ==
Date: Fri, 25 Sep 2026 15:07:37 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jens Axboe <axboe@kernel.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-block@vger.kernel.org, Yann Collet <yann.collet.73@gmail.com>,
	Nick Terrell <terrelln@meta.com>, Gao Xiang <xiang@kernel.org>,
	Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Phillip Lougher <phillip@squashfs.org.uk>,
	Sungguk <sungguk.na@samsung.com>,
	Jaehoon Chung <jh80.chung@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-erofs@lists.ozlabs.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-crypto@vger.kernel.org
Subject: Re: [PATCH RFC 0/9] lib/lz4: stop forking upstream LZ4, vendor it
 instead
Message-ID: <20260925220737.GB1903@quark>
References: <CGME20260925113450eucas1p2fcf838f00f35e1bce0ca04a694cd0cd2@eucas1p2.samsung.com>
 <20260925-lz4-vendor-upstream-v1-0-1c7ffbe21c4b@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925-lz4-vendor-upstream-v1-0-1c7ffbe21c4b@samsung.com>
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

On Fri, Sep 25, 2026 at 01:27:30PM +0200, Michal Wilczynski wrote:
> The in-kernel LZ4 is a fork. The decompressor was last synced with
> upstream v1.8.3 in 2018 and the compressor with v1.7.3 in 2017, both by
> hand. Upstream has made 488 commits against lib/ since, and the gap is
> maintained one cherry-pick at a time.
> 
> That has left real bugs in place for example the forked
> LZ4_decompress_fast() has no bounds checks, so corrupted input runs off
> the output buffer in both directions. 
> 
> This series vendors the upstream sources unmodified and adapts them at
> build time, so a re-sync becomes a directory copy:

At a high level, this looks good to me, and it's similar to what was
done with zstd.  I don't see any obvious issues with the integration.

There are disadvantages to directly integrating external projects like
this, vs. writing a small implementation from scratch for the kernel.
But the existing LZ4 code in the kernel isn't that, but rather a fork
from upstream anyway, and it's clearly not being maintained properly.

The upstream LZ4 codebase also already avoids many of the typical
incompatibilities with Linux kernel code that are often seen in
userspace projects (such as assuming FPU/SIMD/vector instructions can be
used at any time, or that the stack size is infinite, or that the C
standard library is available, or that it's reasonable to have hundreds
of files or 100MB of test data, etc.).

And writing properly optimized compression/decompression code is quite
difficult.  So yes, syncing with the latest LZ4 upstream seems like the
right choice for the kernel.

- Eric

