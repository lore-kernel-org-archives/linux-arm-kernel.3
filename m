Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10964C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 18:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=38gbht3KpWlsXPdZ8hJN+JDl7TnuSRKBtPBm0jl8/d4=; b=GOU/52GTxK3DUni5VYleluwqFT
	1qIohVckOH7n4rNd+UTeQH4wEsvSs09WJlqyVAm5qLYJcSQ5hTNrebGMzZiUTb4RSso9ydH14/QBi
	LhyYn6uV5hglo7i1AGsraI+WhaV0WY8wobCIt9CapbMTywKFxbGFIjQ+AzEPJ1HKD+mZNLmeQlwMi
	p/VP8bXv6S+vq9+g9ITwXJxonzrpYTM3YDZULIwtLUlgntUkxXuY5WP2/HQaDMny4s5mokO6vLPB/
	Dq1y4+QP4xjSXniMSyBCs2T7FxzoKfyIzFielEmEDD8p4FPK6411T93ceDovM9vh5dFhwszWCvr2G
	90mTI0Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCjnh-0000000GWMf-0Uej;
	Wed, 07 May 2025 18:47:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCjll-0000000GWCl-0yZA;
	Wed, 07 May 2025 18:45:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A6406629E5;
	Wed,  7 May 2025 18:45:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43067C4CEE9;
	Wed,  7 May 2025 18:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746643524;
	bh=b0Z2CtCQbrS6Cm6Atyr106vvviX+heraGGwK75dEIUM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ex6DbSwQi9n8oIBLyX47q8kuQwKQbQ0Wjt1QL7/sSP/5oCsmMIfNneg/7H3Id1bj3
	 vidrjBlo4LT6qTNjkmtOikzCkhVz4lUpuJ78RGUVGcoGUVVZ7p+4/Nt5ZLaKnmsSWv
	 hjwEQwfjKvHsOz+Hz9LUKfJeViO4JflKm2JGHJBzXU+uIlwbaXKY83Ftu00T48m2kv
	 Q9nbjHbKCkZTw3jZk0y+3VmNqyO5hYcLVGvQ+0fSyn7xPXQlzSZf0jfPu2NPQGSVKZ
	 ztGxmYuYjI87tVS60h+jrkYyEEv9MdbA4nB2SInPGC2i0ga2/j5ZIiGid1h9z3yDWn
	 XbfNs0/Ux3oXg==
Date: Wed, 7 May 2025 20:45:15 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, x86@kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-efi@vger.kernel.org,
	linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kselftest@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
	Marco Elver <elver@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com, sparclinux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH 3/8] stackleak: Rename CONFIG_GCC_PLUGIN_STACKLEAK to
 CONFIG_STACKLEAK
Message-ID: <aBuqO9BVlIV3oA2M@gmail.com>
References: <20250507180852.work.231-kees@kernel.org>
 <20250507181615.1947159-3-kees@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507181615.1947159-3-kees@kernel.org>
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


* Kees Cook <kees@kernel.org> wrote:

> -	  The STACKLEAK gcc plugin instruments the kernel code for tracking
> +	  The STACKLEAK options instruments the kernel code for tracking

speling.

Also, any chance to fix this terrible name? Should be something like 
KSTACKZERO or KSTACKCLEAR, to tell people that it doesn't leak the 
stack but prevents leaks on the stack by clearing it, and that it's 
about the kernel stack, not any other stack.

Thanks,

	Ingo

