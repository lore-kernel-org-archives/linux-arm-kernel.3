Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D38A606A324
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 22:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WDgz6Vqf;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gr5Evwy/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MD/ud5bn1lltcSGfJDPA5Z7qCcJ2gM0givQb8/vfVIA=; b=WDgz6VqfjCUBzip+hRQKvNgK50
	zrUuKu20hBzp5Pt7M//2wFSUhYozIw/6T7Sc84QomSn01hmx5DO1zHTRU4LbAKNuM7A9YfnvYXAY6
	gg0XiNllfChyBlyiE1qS+UZsEYi+dwshTa7lMRDuqcPAHGY7WLiNy2hDX6+NesGb/6flshyvxFhPk
	3NXI+p5RtovJSEULGGMDO5g1hldZEM4Wc6Ebxrjlv7rv+oBxwER3eYvegimosmd4tIjkckNbhKw1l
	ObYUm2RsOYFYt+QeNpy+LDZbwpG3qCy/TPsIaqK73F+O29UYWFA45ScRLnlTNW3V9+JeEQ32Khgh9
	XY+csjQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNeHk-0000000FAe3-1IW7;
	Sun, 01 Nov 2026 22:44:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNeHj-0000000FAdm-0yac
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 22:44:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4F859601FF;
	Sun,  1 Nov 2026 22:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1AFD1F000C1;
	Sun,  1 Nov 2026 22:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793573058;
	bh=MD/ud5bn1lltcSGfJDPA5Z7qCcJ2gM0givQb8/vfVIA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Gr5Evwy/mzkVY6iMhTqthJIBmxhEOY8fNWU70xm4NNhLEyRs0rbrQzYfn5Rv7lcP3
	 tyHeIrtvP2VZD3JWwedOEHOxHljajeeQC4KEfZf0NRXAzmfWzSOH8pCHtzzCqXZ8V9
	 4csKCjl+7fsZ3R7BMbruYW7YepqhcW538tjenuo1aJv3EUvI1St8qUROn2JOZ99sMJ
	 jlgj2LUGct+A+8P0ZHIOfmBJgYhg7pf6txxwh8d24dM5vOkU8GiGFm0bHYra3k9xPi
	 lUTtwNcEr5oiq6MTGTHbvvj5i7kkHLWmhjwRsUaVmbEZpQ1DD/2b4L7IGwhzFNxXhz
	 tyldoud8rPfQA==
Date: Sun, 1 Nov 2026 15:44:12 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Demian Shulhan <demyansh@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Marco Elver <elver@google.com>, Ard Biesheuvel <ardb@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	David Gow <davidgow@google.com>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kunit-dev@googlegroups.com, netdev@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH 1/2] arm64: csum: Add fused copy and Internet checksum
Message-ID: <20261101224412.GA1185206@ax162>
References: <20260927131838.6774-1-demyansh@gmail.com>
 <20260927131838.6774-2-demyansh@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260927131838.6774-2-demyansh@gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Demian,

On Sun, Sep 27, 2026 at 03:17:57PM +0200, Demian Shulhan wrote:
> diff --git a/arch/arm64/lib/csum-copy-neon.c b/arch/arm64/lib/csum-copy-neon.c
> new file mode 100644
> index 000000000000..bfeaf2beba39
> --- /dev/null
> +++ b/arch/arm64/lib/csum-copy-neon.c
> @@ -0,0 +1,168 @@
...
> +#include <linux/types.h>
> +#include <asm/neon-intrinsics.h>

Please avoid combining these files, it will be forbidden soon:

  https://lore.kernel.org/20261029135020.272082-9-ardb+git@google.com/

-- 
Cheers,
Nathan

