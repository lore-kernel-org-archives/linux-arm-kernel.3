Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB5CC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 19:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RrhTrEhTqsq1bzwDJROXi4Wfcq2HDay/MnS7nv9NGZM=; b=twYTo41niUbREqzVDHBIo34X6J
	DAUsvY+PK5WSrEaaAfbr3cRZG3cUYsOjTs1uY+wbXQWAKNyZuLaUNynBvkrTYFrXq0pyYmqqwnQlp
	BH4RnE9ZDzPY0RVoXNr29cJCc1LBZ0IGnnO+FPrZ0kmioX8ceHoF/B9b9F10E1k391L9J8KqkM3Zl
	RGigT8OXrHCNTgCr9e4cwBtObAkHLhKstvZy40pUUc3RaHnUafewAjO3ZmhEzxMwy6H693XAjLGTw
	1rPwSl+i0S4SXX/j++2cJj5lqyZsUK9VqCU7ltl0ontjvuS//NqC3762O2ScabXI4Pihjap9LBcA2
	vz1mYnWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCkbe-0000000Gajm-2veP;
	Wed, 07 May 2025 19:39:02 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCkZi-0000000GaYz-0NNH;
	Wed, 07 May 2025 19:37:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D54FFA4DC08;
	Wed,  7 May 2025 19:37:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E255C4CEE2;
	Wed,  7 May 2025 19:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746646620;
	bh=lrmfyWvnM3QwZX0jYJbUO8H9wEWYYrgJ7OaSlLyzEgc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=adEj+BizyWGNYyIo5IgqAqEZv/fYXZwSE6hbDf5r3NKhwW3FLQgI40vKpeqr1qBIi
	 IZDndlHbUJsmMjZPIhKjr1vMIOoZKzeRi75y8DBhxxBZDfHtMl5G87s1YS59Qu+Ug4
	 M7Bd8RMx150oxVdRPqbjZT3zqbIrQnLuMvM6qTrxZk/EfDbL67wtKqXgIbFWPEDM89
	 DcDfZ5Z0nwBba+lNW31VpiwbKaAyT0t8v2xXiOirP3Vp0Jk/WTHKbdpIiWsfFgeiMy
	 0JoJj15rZjQPlqTneT7LfTJA1TcyUyBRShtC50Ov3mP3saiJ7e6dD1qYk/yJOU4tuu
	 7pjj9Ujhx261Q==
Date: Wed, 7 May 2025 12:36:57 -0700
From: Kees Cook <kees@kernel.org>
To: Ingo Molnar <mingo@kernel.org>
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
Message-ID: <202505071236.AC25A6CC2@keescook>
References: <20250507180852.work.231-kees@kernel.org>
 <20250507181615.1947159-3-kees@kernel.org>
 <aBuqO9BVlIV3oA2M@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBuqO9BVlIV3oA2M@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_123702_188144_10E0561F 
X-CRM114-Status: GOOD (  11.39  )
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

On Wed, May 07, 2025 at 08:45:15PM +0200, Ingo Molnar wrote:
> 
> * Kees Cook <kees@kernel.org> wrote:
> 
> > -	  The STACKLEAK gcc plugin instruments the kernel code for tracking
> > +	  The STACKLEAK options instruments the kernel code for tracking
> 
> speling.

Thanks!

> Also, any chance to fix this terrible name? Should be something like 
> KSTACKZERO or KSTACKCLEAR, to tell people that it doesn't leak the 
> stack but prevents leaks on the stack by clearing it, and that it's 
> about the kernel stack, not any other stack.

Yeah, better to name it for what it does rather than want to protects
against. The internal naming for what it does is "stack erase", so
perhaps KSTACK_ERASE ?

-Kees

-- 
Kees Cook

