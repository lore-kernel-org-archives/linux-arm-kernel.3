Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C439BE7DEEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 14:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DIWJ3QDsIlEoYX64jrKdZjhC06uyp5mqaYHvEkc3LRg=; b=T4tPN9QC/4A3bNwmmyVue06Ks5
	wr3NLcLDTI1bKy5svAqmddYu55IItxoPe6kga9WABHiKSVPrCvR3Ci4M2UaJ7tlWHNyknKFrZwiJN
	kR3H41JZtIjXAife1Dksz0/XnpLRz6aGynXnwjpY+E1b4Ew4s1U7afwzenXHE+KL7Yh3nzUeEFAKc
	fTLMqWnXiC0gtVHfU/QKmnnfqH02oAYXZOdmwPCCMxdaauocD3nMVMWqIJkxRWheLH0RPgc1O3G8K
	RPMTqlbLaXNMkvRCMoAWzJ0d6lBYGRfnJXalpsg9kOdaareHBxlmumeigw4Aiof9LUPC5t+lT4MJg
	t/2rliZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmuiJ-000000055AB-3WWx;
	Mon, 02 Feb 2026 14:15:39 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmuiG-0000000559m-3y6M
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 14:15:38 +0000
Date: Mon, 2 Feb 2026 15:15:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1770041731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DIWJ3QDsIlEoYX64jrKdZjhC06uyp5mqaYHvEkc3LRg=;
	b=39g5kb/r9I4iZpeyez3XcoHFXG9nGqcUB03TR+hP82TMARVMxY1PXo7EkSCeeiWYrA83D2
	9zxbeOp31ZzN8rpVtpL/6EH/dYspyOEG68gXOzMxBly5S+7rxvVKJVP+nPdfsrzO6nwmRR
	kqPjPSkfgTj7+g4Jy692hmklFF6Z+QSYGKHCBcsaEis1pFsoQBq8TjiaV4wj1fIZw7oSOO
	xqMVxhH2+XnLn3h2U7sTw34847dCqScO/JGvKgzr1JL92wIx0O1Yi/gNIa8xoyCmsLV+Me
	5c9UefUlay0rsroQW28nHbZydBC3gqBvQXECSO6mXaHg/Prxs39I3skNwEGx+Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1770041731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DIWJ3QDsIlEoYX64jrKdZjhC06uyp5mqaYHvEkc3LRg=;
	b=aZ3jd/0mZnoUaQKxNMS22ZPCpi5zse+m55GRVSELamYe622m5j8GHwvVx+vP2dGNPs70tm
	lLu+ihr6M3PjnKAQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Naman Jain <namjain@linux.microsoft.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Tamir Duberstein <tamird@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Kees Cook <kees@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Saurabh Singh Sengar <ssengar@linux.microsoft.com>
Subject: Re: [RFC PATCH] kbuild: Make --build-id linker flag configurable
Message-ID: <20260202151101-d5558a6f-88d0-41dd-8816-18957a029ce8@linutronix.de>
References: <20260202110631.978412-1-namjain@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202110631.978412-1-namjain@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_061537_136171_7F4C9E21 
X-CRM114-Status: GOOD (  27.91  )
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

Hi Naman,

On Mon, Feb 02, 2026 at 11:06:31AM +0000, Naman Jain wrote:
> Build ID hashes include file paths, so building the same source from
> different directories produces different binaries. This breaks
> reproducible builds.
> 
> Add KBUILD_BUILD_ID variable (default: sha1) to allow overriding:
> 
>     make KBUILD_BUILD_ID=none
> 
> The variable is exported to VDSO Makefiles which also include a
> fallback default for standalone invocation.
> 
> Signed-off-by: Naman Jain <namjain@linux.microsoft.com>
> ---
> Hi,
> Sending this change for RFC, as it is quite possible that this is a
> generic problem and I may be missing something.
> 
> I am trying to implement reproducible builds for one of my product
> kernel. I referred https://reproducible-builds.org/docs/build-path/
> and tried to use both -fdebug-prefix-map=OLD=NEW and
> -fmacro-prefix-map=OLD=NEW, but still could not achieve bit by bit
> binary reproducibility without overwriting build-id to none. 
> If I move the kernel to same path in other setup, I was able to create
> same binary hash, however, without it, there is some difference in
> build-id hash values.

Can you force the same build path during package building?
That should avoid this issue.

> Reproducibility wiki says "In most cases however, post-processing is
> required to either remove the build path or to normalize it to a
> predefined value.". I have tried that, and it works, but wanted to
> conclude if that is my last option here.

I am not a fan of this aproach. The build id should stay usable.
Can you figure out where the build paths are used?
You may need to also compare the debug symbols.

> Thanks.
> 
> ---
>  Makefile                          | 8 ++++++--
>  arch/arm64/kernel/vdso/Makefile   | 5 ++++-
>  arch/arm64/kernel/vdso32/Makefile | 5 ++++-
>  arch/x86/entry/vdso/Makefile      | 5 ++++-
>  4 files changed, 18 insertions(+), 5 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 3373308d2217c..3fcff4af200d7 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1132,8 +1132,12 @@ KBUILD_AFLAGS   += $(KAFLAGS)
>  KBUILD_CFLAGS   += $(KCFLAGS)
>  KBUILD_RUSTFLAGS += $(KRUSTFLAGS)
>  
> -KBUILD_LDFLAGS_MODULE += --build-id=sha1
> -LDFLAGS_vmlinux += --build-id=sha1
> +# Can be overridden for reproducible builds by using "make KBUILD_BUILD_ID=none"
> +KBUILD_BUILD_ID ?= sha1
> +export KBUILD_BUILD_ID
> +
> +KBUILD_LDFLAGS_MODULE += --build-id=$(KBUILD_BUILD_ID)
> +LDFLAGS_vmlinux += --build-id=$(KBUILD_BUILD_ID)
>  
>  KBUILD_LDFLAGS	+= -z noexecstack
>  ifeq ($(CONFIG_LD_IS_BFD),y)
> diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Makefile
> index 7dec05dd33b70..b3ee5982b4676 100644
> --- a/arch/arm64/kernel/vdso/Makefile
> +++ b/arch/arm64/kernel/vdso/Makefile
> @@ -9,6 +9,9 @@
>  # Include the generic Makefile to check the built vdso.
>  include $(srctree)/lib/vdso/Makefile.include
>  
> +# Fallback for standalone builds, normally inherited from top-level Makefile
> +KBUILD_BUILD_ID ?= sha1
> +

What kind of standalone builds?
This doesn't look like it belongs into this patch.

(...)

