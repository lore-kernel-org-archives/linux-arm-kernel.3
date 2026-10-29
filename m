Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46F3606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 21:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Rc8kjBVE;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OrI+asDx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DX4A7jq1CXzKQrspT1o5uwX5xayxjUsi8drR3g2wMS0=; b=Rc8kjBVEWjc3qrm4hJ9/ae7uue
	9CqiNLH1VG7LMrcYW3w1wiwPvXogIRQu1uVjfISMF9m1fDZC7tQ0U0a66fjZ9kzIxVesq5foOgRd8
	BJ/VG1HdvUlfxPxe/MRj37kNWZT2Y8ejYBzbmz070uW0IRVE6b7cRl7jQAjyGT0miyJh3BmrvsA79
	VkwdrST/Zfier90e0CiWZoNAWUy5/F/cqAu9fC98+3rcbPJVqJzND+tw9GOd9aTaFJntZOHcCfXM8
	vzIJyRoK/rlss/0TyKE/xjrd0Z1DPCSM4ffWmqxzT+Z905/9fTC1v2mxyN4JZHvWVzdDKC++tSPiB
	5Dk7gu5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMXs1-0000000AQkW-0Vj6;
	Thu, 29 Oct 2026 21:41:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMXrz-0000000AQkP-25yn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 21:41:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A495843DF0;
	Thu, 29 Oct 2026 21:41:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBEC21F01824;
	Thu, 29 Oct 2026 21:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793310069;
	bh=DX4A7jq1CXzKQrspT1o5uwX5xayxjUsi8drR3g2wMS0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OrI+asDx/ZZr8nZngTcpGFdpZ1DNs33qxqstWnQiMA7nEVHTNLe7llw2lWCyz3fRh
	 7VrPsn4PEXVlF4CCI6iju4bs6qvynJhLGYy8vxoqbZpPm2cMEvFZpuxf2il/WScP9F
	 a8jGuDnYjqjpjEgMtfuRUl/zMDGnBuDovtgw9VqNda0wq9bmWwdr0mnX3guTQx4GwQ
	 3PTlluVaOonFJKosINfwLbuJYpNgnZ6wqtbfCJvoi+5tvX3sSdMSz536ANahKJkY93
	 oyXsQQQsXg1cb3GgnwJQKfEoNsqaJsMhiF5k+vdI3VonRjOyNbc2QNqksO6+osyhBb
	 9uVcPT3gx8RkA==
Date: Thu, 29 Oct 2026 14:41:05 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Christoph Hellwig <hch@lst.de>, Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH 0/4] Get rid of all NEON intrinsics stdint.h type hacks
Message-ID: <20261029214105.GA44297@ax162>
References: <20261029135020.272082-6-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029135020.272082-6-ardb+git@google.com>
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Ard,

On Thu, Oct 29, 2026 at 02:50:20PM +0100, Ard Biesheuvel wrote:
> Recent Clang has become more finicky when it comes to overriding the
> type macros that the freestanding stdint.h consumes when defining the
> uintXX_t types, and so it is time to finally get rid of this entirely.

Just as information for other folks:

  https://github.com/llvm/llvm-project/pull/227722#issuecomment-6065215071

> So instead of making stdint.h (which comes from the compiler when
> -ffreestanding is set on the command line) agree with the kernel's
> linux/types.h header, avoid the latter entirely in the compilation units
> that actually use the NEON intrinsics (which are always leaf functions
> that are not tightly coupled to kernel APIs).

I had not even considered this as an option, thanks a lot for exploring
it and sending this series as a result. I definitely think this is the
preferred route forward based on my discussions with clang folks
upstream since they were quite unhappy with stdint.h being overridden in
this manner.

> Note that the disagreements are about long vs. long long on arm64, and
> long vs. int on 32-bit ARM, so never about types that actually have
> conflicting representations.
> 
> Ard Biesheuvel (4):
>   lib/crc: Don't include <linux/types.h> in NEON intrinsics code
>   xor: arm/arm64: Move NEON xor_gen() dispatch into the glue code
>   arm64: Drop stdint.h type overrides from asm/neon-intrinsics.h
>   ARM: Drop stdint.h type overrides from asm/neon-intrinsics.h

This passes my arm and arm64 test matrix with LLVM 23.1.4 and a version
of LLVM 24 with the breaking change mentioned above. This will be needed
in stable but I don't mind taking a look at the backports when the time
comes.

Tested-by: Nathan Chancellor <nathan@kernel.org>

-- 
Cheers,
Nathan

