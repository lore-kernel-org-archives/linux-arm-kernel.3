Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9FEEC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 12:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vqnyp4/Fq34N9hxm5escP8zbq+JL1T7eSigGpRdWCnU=; b=kOh3saeKLQ9BxoRbL0M36O7o6P
	vgOpqE+lvV6DrKRBZ78wFyNR18ZDLCR2Zx5yLeb6UF+oxRIEJMNaM1+ClDOgi7LJvvOiLopyGswnq
	cdzgyKPoQvUFMB2Zb4rPzFbsfYpsIuB3vL+iaZ3rFcpNY7XSqj+XXYYqjRLkwE8xrfTOycng7iOJD
	F+na0yXWqEELo9zVLQzYRkUlu32mfbHL71aJAXV1tJWjBLza8zfTq/8dJXZziNz5hYzJukPMPR5sg
	XOti128VWC3Hfcjj0K6yZG/F7mFQmGeTOOGUTLYSWoZHJ63cq7yPdRF5bH/ehYV/J/nLnp04JIBU5
	Mgv9kZ3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tshhD-0000000BFD2-1z6m;
	Thu, 13 Mar 2025 12:29:55 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tshch-0000000BETH-0zSa;
	Thu, 13 Mar 2025 12:25:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 37EE6A4707D;
	Thu, 13 Mar 2025 12:19:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EED05C4CEDD;
	Thu, 13 Mar 2025 12:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741868713;
	bh=VMUOnEKoimQN6pwJj0HJ250fPvnAR+FrAocdRJsHq8I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HDz7LQrxn+5uMzYuKmUsr/MzQI/7LjUYAH6U0Rv69RHDL6kJTg7T/TlyBDu9nRw3f
	 +yscSRgZu10unC9voBYFntcNfukiIMd+J2bcz0am9R1N+EDQUjRDdCzHDa7E6jAT9G
	 elRWWLQjvLtJ+557HYrrxSzTWHiUmMyB6V6XwrGmcTe4DZAObyymSQ9P/m4v3yKCOP
	 xCAlBAwGAQVNMI3WMjv8hvbMIBFI0Nh29MW5H2CicZPp09a6Qz/dohbQ8rK8OUI9pq
	 70yUl1cBUcyKqDoTT3szQWbiaOW9pyrWRuXo8DTYexs+TSxJGXCTYPsEmUMP7nS12s
	 c+V7rKX2dyaMg==
Date: Thu, 13 Mar 2025 12:25:04 +0000
From: Will Deacon <will@kernel.org>
To: Alessandro Carminati <acarmina@redhat.com>
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Kees Cook <keescook@chromium.org>,
	Daniel Diaz <daniel.diaz@linaro.org>,
	David Gow <davidgow@google.com>,
	Arthur Grillo <arthurgrillo@riseup.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Maxime Ripard <mripard@kernel.org>,
	Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Guenter Roeck <linux@roeck-us.net>,
	Alessandro Carminati <alessandro.carminati@gmail.com>,
	Jani Nikula <jani.nikula@intel.com>,
	dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, loongarch@lists.linux.dev, x86@kernel.org,
	Linux Kernel Functional Testing <lkft@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v4 07/14] arm64: Add support for suppressing warning
 backtraces
Message-ID: <20250313122503.GA7438@willie-the-truck>
References: <20250313114329.284104-1-acarmina@redhat.com>
 <20250313114329.284104-8-acarmina@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250313114329.284104-8-acarmina@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_052515_344911_185A542D 
X-CRM114-Status: GOOD (  11.64  )
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

On Thu, Mar 13, 2025 at 11:43:22AM +0000, Alessandro Carminati wrote:
> diff --git a/arch/arm64/include/asm/bug.h b/arch/arm64/include/asm/bug.h
> index 28be048db3f6..044c5e24a17d 100644
> --- a/arch/arm64/include/asm/bug.h
> +++ b/arch/arm64/include/asm/bug.h
> @@ -11,8 +11,14 @@
>  
>  #include <asm/asm-bug.h>
>  
> +#ifdef HAVE_BUG_FUNCTION
> +# define __BUG_FUNC	__func__
> +#else
> +# define __BUG_FUNC	NULL
> +#endif
> +
>  #define __BUG_FLAGS(flags)				\
> -	asm volatile (__stringify(ASM_BUG_FLAGS(flags)));
> +	asm volatile (__stringify(ASM_BUG_FLAGS(flags, %c0)) : : "i" (__BUG_FUNC));

Why is 'i' the right asm constraint to use here? It seems a bit odd to
use that for a pointer.

Will

