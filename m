Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ED3FC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 21:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qGAVtFU1ZWDmCtLaT+G7B5o5ljsTh3nqCzq4ca6rlME=; b=2MikNbnfyLH4ixagmDQ5MT6JL+
	6x2dXEpIggED4Xvc3gugAk/C6XtXVKIOKWbDU2gmoPrCCUf03dswK8lqg9vzJm5IaR0iGPPWmln6z
	ZHcm9s4CPNFP9s7Xi7HiJtsdsZi6V2WdiN7SqefXllGSqRs7fc7CL0Nvy4TJDUp2hlyoXUKh0f+7w
	jwW8i6w7QFmhjF/tCXp5ok8KvPALiRdAqEjdQ8CFRSI3cajoumAaKDQSnJ8pDrAF50EwYCtt9C675
	no0juZoPZI3OewQnE9cEoofrBD4dybSCu2gU3nXxcc16Xx8FtvB/NRiRkbVwe9sfq/AkZvlDMm1vZ
	ISlVP8wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xADdj-0000000EVwF-0uOa;
	Fri, 25 Sep 2026 21:39:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xADdi-0000000EVw0-0E0b
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 21:39:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DE20960136;
	Fri, 25 Sep 2026 21:39:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55CA41F000FF;
	Fri, 25 Sep 2026 21:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790372368;
	bh=qGAVtFU1ZWDmCtLaT+G7B5o5ljsTh3nqCzq4ca6rlME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Uq3jK6lzFPBk2mUB+21kzIEJ3e7xo6lES0MeUECU8KDNeBmretRa77Q3OlwhtoQmE
	 JG8Dx0lTEjtjm2k8juBgSTzHaF2rroNVk1zww7OONmnk0v+x0FA56wC0MjZCrNSV/e
	 H2pVr0Zo24UJv/vG9L8beZRRHMlmE7YAN/RF7/BIf3sCxDQZGCKJr+E+v3UjzyyNbI
	 MirHao5U2KikMGzvv4h38MAzkcRcWP7PU8EZ2aiQo71N4cAbsRUfMEcbTXCJ/xYXPz
	 HyiCZr2awcrNsxXI7Kdq8YVAeSXWzjieQzGLgVnG89GGjnkOohpJbH4QMHQxQzDjRf
	 Ccal7IQ4ASL7g==
Date: Fri, 25 Sep 2026 14:39:26 -0700
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
Subject: Re: [PATCH RFC 9/9] MAINTAINERS: add an entry for the LZ4
 compression library
Message-ID: <20260925213926.GA1903@quark>
References: <20260925-lz4-vendor-upstream-v1-0-1c7ffbe21c4b@samsung.com>
 <CGME20260925113507eucas1p2ddb94f2077b679426aa86dd1d492eaf3@eucas1p2.samsung.com>
 <20260925-lz4-vendor-upstream-v1-9-1c7ffbe21c4b@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925-lz4-vendor-upstream-v1-9-1c7ffbe21c4b@samsung.com>
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

On Fri, Sep 25, 2026 at 01:27:39PM +0200, Michal Wilczynski wrote:
> lib/lz4/ has never had one: get_maintainer.pl returns only the LKML
> fallback for every file in it, including include/linux/lz4.h, which eight
> subsystems build against.
> 
> This matters more now than it did. With the previous patches lib/lz4 is
> vendored upstream sources, and someone has to bump them to new upstream
> releases and decide what the kernel-side glue may do. I am willing to do
> that, so add myself as its maintainer.
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  MAINTAINERS | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cc3cae2e378b34aeb705cef654c720ca9f2ba223..989e1b5fab21432dd7042d1e60c4bbad85beb925 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15606,6 +15606,12 @@ S:	Supported
>  F:	drivers/net/pcs/pcs-lynx.c
>  F:	include/linux/pcs-lynx.h
>  
> +LZ4 COMPRESSION LIBRARY
> +M:	Michal Wilczynski <m.wilczynski@samsung.com>
> +S:	Maintained
> +F:	include/linux/lz4.h
> +F:	lib/lz4/
> +

Should this entry cover lib/decompress_unlz4.c and
include/linux/decompress/unlz4.h as well?

- Eric

