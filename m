Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47A23C021A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 07:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D9ovBsZSJuez5zAuy/n3JYxuKYVqIz9lQR/+HvKF74A=; b=PSTJ65p+1+93zgHyNOd/PoYfDP
	iQ7lPf2YNSC5OkeyThji6/Qcd7d/I0ZgxG2rpfyAaBOkpiSWIqJR0FB8QfRZEvM/LdZe4Re8FpwoN
	gOIJIvU9dsTSrPId1J8bB5IL3U4vsw3oyX27W1Q6FMBgkqAeb1zvKL4dSuyJ+8MigRHnvAyIFgG2i
	kObhSB34tkJswD4nrc61kWmMelxBbG3R5qN+hekjhqeQxYxaG2D5kODxtTyRFBUsOfIcu4oabA5id
	yXEAY2ucRwoSS9mZe2tF4mw9koJ2xHuj/+WtYxNAxbBu4HkTtOMJPRljd7W/AobQnMV6CCLbzsOUp
	7aQz0Lzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiTXK-0000000A4ZI-3SPm;
	Thu, 13 Feb 2025 07:21:26 +0000
Received: from mail.avm.de ([212.42.244.120])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiTVt-0000000A4KI-1HYu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 07:19:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1739431188; bh=+UmDyGFYqbRGqxiUXDzk0wYia4DEJ/qtggUagtruh1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OHgeQudZxxT0wgi5FGAagv7q2QLFdFIkd0t7eygA7wxw/marKM8WnD45X7azm8HUM
	 31EnxHXdDNyET2f/Y/k98z4tGVCY2lYF5djVeG+CkfRgpvh9dAeohwS1GgQ4F+LZK3
	 zzyqrcRmkF8IiVKSYPI8wXg1bR22JFIxo0Lypzwg=
Received: from [212.42.244.71] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.52.1)
	(envelope-from <n.schier@avm.de>)
	id 67ad9d14-038b-7f0000032729-7f0000018ad4-1
	for <multiple-recipients>; Thu, 13 Feb 2025 08:19:48 +0100
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [212.42.244.71])
	by mail.avm.de (Postfix) with ESMTPS;
	Thu, 13 Feb 2025 08:19:48 +0100 (CET)
Received: from buildd.core.avm.de (buildd-sv-01.avm.de [172.16.0.225])
	by mail-auth.avm.de (Postfix) with ESMTPA id 39DA480175;
	Thu, 13 Feb 2025 08:19:49 +0100 (CET)
Received: by buildd.core.avm.de (Postfix, from userid 1000)
	id 2A47B182D0A; Thu, 13 Feb 2025 08:19:49 +0100 (CET)
Date: Thu, 13 Feb 2025 08:19:49 +0100
From: Nicolas Schier <n.schier@avm.de>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-doc@vger.kernel.org,
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH] kbuild: rust: add rustc-min-version support function
Message-ID: <20250213-masked-wombat-of-painting-8afb53@buildd>
References: <20250210164245.282886-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250210164245.282886-1-ojeda@kernel.org>
X-purgate-ID: 149429::1739431188-4EA08E17-E08D2BED/0/0
X-purgate-type: clean
X-purgate-size: 3033
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_231957_768730_9BE9EDC1 
X-CRM114-Status: GOOD (  20.55  )
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

On Mon, Feb 10, 2025 at 05:42:45PM +0100, Miguel Ojeda wrote:
> Introduce `rustc-min-version` support function that mimics
> `{gcc,clang}-min-version` ones, following commit 88b61e3bff93
> ("Makefile.compiler: replace cc-ifversion with compiler-specific macros").
> 
> In addition, use it in the first use case we have in the kernel (which
> was done independently to minimize the changes needed for the fix).
> 
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
> This is based on top of the fix so that the fix remains as simple as
> possible:
> 
>     https://lore.kernel.org/rust-for-linux/20250210163732.281786-1-ojeda@kernel.org/
> 
>  Documentation/kbuild/makefiles.rst | 14 ++++++++++++++
>  arch/arm64/Makefile                |  2 +-
>  scripts/Makefile.compiler          |  4 ++++
>  3 files changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
> index d36519f194dc..2608aa32c762 100644
> --- a/Documentation/kbuild/makefiles.rst
> +++ b/Documentation/kbuild/makefiles.rst
> @@ -670,6 +670,20 @@ cc-cross-prefix
>              endif
>      endif
> 
> +$(RUSTC) support functions
> +--------------------------
> +
> +rustc-min-version
> +  rustc-min-version tests if the value of $(CONFIG_RUSTC_VERSION) is greater
> +  than or equal to the provided value and evaluates to y if so.
> +
> +  Example::
> +
> +    rustflags-$(call rustc-min-version, 108500) := -Cfoo
> +
> +  In this example, rustflags-y will be assigned the value -Cfoo if
> +  $(CONFIG_RUSTC_VERSION) is >= 1.85.0.
> +
>  $(LD) support functions
>  -----------------------
> 
> diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
> index 2b25d671365f..1d5dfcd1c13e 100644
> --- a/arch/arm64/Makefile
> +++ b/arch/arm64/Makefile
> @@ -48,7 +48,7 @@ KBUILD_CFLAGS	+= $(CC_FLAGS_NO_FPU) \
>  KBUILD_CFLAGS	+= $(call cc-disable-warning, psabi)
>  KBUILD_AFLAGS	+= $(compat_vdso)
> 
> -ifeq ($(call test-ge, $(CONFIG_RUSTC_VERSION), 108500),y)
> +ifeq ($(call rustc-min-version, 108500),y)
>  KBUILD_RUSTFLAGS += --target=aarch64-unknown-none-softfloat
>  else
>  KBUILD_RUSTFLAGS += --target=aarch64-unknown-none -Ctarget-feature="-neon"
> diff --git a/scripts/Makefile.compiler b/scripts/Makefile.compiler
> index 8c1029687e2e..8956587b8547 100644
> --- a/scripts/Makefile.compiler
> +++ b/scripts/Makefile.compiler
> @@ -67,6 +67,10 @@ gcc-min-version = $(call test-ge, $(CONFIG_GCC_VERSION), $1)
>  # Usage: cflags-$(call clang-min-version, 110000) += -foo
>  clang-min-version = $(call test-ge, $(CONFIG_CLANG_VERSION), $1)
> 
> +# rustc-min-version
> +# Usage: rustc-$(call rustc-min-version, 108500) += -Cfoo
> +rustc-min-version = $(call test-ge, $(CONFIG_RUSTC_VERSION), $1)
> +
>  # ld-option
>  # Usage: KBUILD_LDFLAGS += $(call ld-option, -X, -Y)
>  ld-option = $(call try-run, $(LD) $(KBUILD_LDFLAGS) $(1) -v,$(1),$(2),$(3))
> --
> 2.48.1

Reviewed-by: Nicolas Schier <n.schier@avm.de>

