Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F58CE8D44
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 15:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HoyLw1vBRzfbe7y18qv3BekspAvWvfPmLJaNDkdEegI=; b=J3OIvYj56htLGcQWtZqBV2WV2W
	35WF20J9uk6oEAAynSiApDfyMyy+bihwP50IP/banCD3xSKdoYjySIBTuOn29K7o1qx0kXqq2D5mF
	ZLoIlM0tQQAYNWcQRrl8TaAHJnhV1ssAz2p2Oc1w2vInr+BWeiVQW30OJSREXErSnpe0YLmKAtmmZ
	BO2KRiflwWMuGtmtoO1xaBR7Ozh8TGvPvRHtZ94jnFuQVPWY/lwMlokyahdWKzex1VK34s58EBV9S
	0Op4xOGUVEO1xa9yAFG8ZuhUVIHhuRRb4gtffij+H0RBCUGudTjJCyh4XkfD8qmFxokM+d1m0sBuT
	P+6ybKHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvk3-0000000CZKI-3wzt;
	Fri, 14 Nov 2025 15:29:39 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvk1-0000000CZGz-0PTU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 15:29:38 +0000
Date: Fri, 14 Nov 2025 16:29:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1763134174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HoyLw1vBRzfbe7y18qv3BekspAvWvfPmLJaNDkdEegI=;
	b=RnUY5rWIqJEh3dj9C7DXa7u8wSk/KK5l0Gkawp1HjwW5YwZ398UBLl7sh5FrIMlETbTeHq
	zMVUYBL1C5xOBj6nNNOoK/m6qXc38hzlycsirEcVjPil9YMucIdrdASId0L/FgDW/TW2tW
	asE4tN1dHC+psx6l0PvYCpIqQ6g2JWZZp+BSwq7EHBREaNSntivO4tjoWqVDYo/Z9Nn6mn
	N48ZG02WTGd+2eeR7iXOxawGiZaPZ8EPBzl6yGbKoLujw5OaJxFkYJee29FLVM+Fv7rXc4
	Idf5KH1HzrI0dOgxy6EKRNO/ZtGMS8yfSy17nJFHNrJ5AzNA0KzgIqYu0KVKjQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1763134174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HoyLw1vBRzfbe7y18qv3BekspAvWvfPmLJaNDkdEegI=;
	b=O85WkXy/vomNF9nDuy6zVsOWSErHJa0CNPb3rgZbOgbNIgJgbI4226HrXfvTbc+iJj6WcL
	AdIM3wKwbzE7JrBQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Simon Glass <sjg@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Nicolas Schier <nicolas@fjasle.eu>, Masahiro Yamada <masahiroy@kernel.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, Tom Rini <trini@konsulko.com>, 
	Ahmad Fatoum <a.fatoum@pengutronix.de>, J =?utf-8?Q?=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>, 
	"Reviewed-by : Nicolas Schier" <nsc@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Kees Cook <kees@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Parth Pancholi <parth.pancholi@toradex.com>, 
	Rong Xu <xur@google.com>, Tamir Duberstein <tamird@gmail.com>, 
	Will Deacon <will@kernel.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 6/8] kbuild: Allow adding modules into the FIT ramdisk
Message-ID: <20251114162255-10e006c6-dadc-44df-a8ed-ab4a00fc6402@linutronix.de>
References: <20251114142741.1919072-1-sjg@chromium.org>
 <20251114142741.1919072-7-sjg@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114142741.1919072-7-sjg@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_072937_283337_77123909 
X-CRM114-Status: GOOD (  22.13  )
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

On Fri, Nov 14, 2025 at 07:27:32AM -0700, Simon Glass wrote:
> Support 'make image.fit FIT_MODULES=1' to put all the modules into a
> ramdisk image within the FIT.
> 
> Add image.fit as a target which requires modules, so that modules will
> built automatically when using FIT_MODULES=1
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> Suggested-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> Suggested-by: Reviewed-by: Nicolas Schier <nsc@kernel.org>
> Acked-by: Nathan Chancellor <nathan@kernel.org>
> ---
> 
> Changes in v5:
> - Build modules automatically if needed (fix from Nicolas Schier)
> 
> Changes in v4:
> - Rename the Makefile variable from 'EXTRA' to 'MAKE_FIT_FLAGS'
> - Use an empty FIT_MODULES to disable the feature, instead of '0'
> - Make use of the 'modules' dependency to ensure modules are built
> - Pass the list of modules to the script
> 
>  Makefile             |  1 +
>  arch/arm64/Makefile  |  1 +
>  scripts/Makefile.lib | 10 ++++++++--
>  3 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 8cd46222fc48..4eccaef95826 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -773,6 +773,7 @@ endif
>  # Just "make" or "make all" shall build modules as well
>  
>  modules-targets := all
> +modules-targets += $(if $(FIT_MODULES),image.fit)
>  modules-targets += modules
>  modules-targets += nsdeps
>  modules-targets += compile_commands.json
> diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
> index 73a10f65ce8b..7036f251ab40 100644
> --- a/arch/arm64/Makefile
> +++ b/arch/arm64/Makefile
> @@ -174,6 +174,7 @@ endif
>  all:	$(notdir $(KBUILD_IMAGE))
>  
>  image.fit: dtbs
> +image.fit: $(if $(FIT_MODULES),modules)
>  
>  vmlinuz.efi image.fit: Image
>  $(BOOT_TARGETS): vmlinux
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 1d581ba5df66..c6a3aa653035 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -398,11 +398,17 @@ MAKE_FIT := $(srctree)/scripts/make_fit.py
>  # Use this to override the compression algorithm
>  FIT_COMPRESSION ?= gzip
>  
> +# Set this to 1 to include an initrd with all the kernel modules
> +FIT_MODULES ?=

'0' will also trigger that behavior.

> +
>  quiet_cmd_fit = FIT     $@
> -      cmd_fit = $(MAKE_FIT) -o $@ --arch $(UIMAGE_ARCH) --os linux \
> -		--name '$(UIMAGE_NAME)' \
> +      cmd_fit = $(if $(FIT_MODULES), \
> +		find $(objtree) -name '*.ko' > $(objtree)/.modules-list 2>/dev/null &&) \

This will include stale module files. You can get an up-to-date list from
$(objtree)/modules.order with a bit post-processing.
Maybe kbuild can be extended to also create a list of the .ko files.
(I would be interested in that for my own usecases, too)

> +		$(MAKE_FIT) -o $@ --arch $(UIMAGE_ARCH) --os linux \
> +		--name '$(UIMAGE_NAME)' $(MAKE_FIT_FLAGS) \
>  		$(if $(findstring 1,$(KBUILD_VERBOSE)),-v) \
>  		$(if $(FIT_DECOMPOSE_DTBS),--decompose-dtbs) \
> +		$(if $(FIT_MODULES),--modules @$(objtree)/.modules-list) \
>  		--compress $(FIT_COMPRESSION) -k $< @$(word 2,$^)
>  
>  # XZ
> -- 
> 2.43.0
> 

