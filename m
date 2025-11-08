Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C877CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Nov 2025 21:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yfsU/nDdp/nsVmfUVfH04O1UZRq0LD+1oxtN41aybOY=; b=DuscXW2AVdRL0ZRW2ULymcodD3
	H8JjUrsgx2MAp41TNV4jmKPCq5N8myRZDpxqGVrEyk7j8SLzOrQ/u7RKuJ3eFeL8vYUZFSA1/gPMg
	h4rcUtlUk6WoE+3yefOAI41AZckhwDNUVydtYwdwFdu6vLGp/fmiqfxJ2gqQ4ciqQm1uhtpHEyjfe
	GlljVNSGeoa2/8aLiBqTbVoS38Av++h0kbBkQNWSl/46wxg3q2Kjp1gUN/nv6bgn4MTnjtFJulBwu
	Q/uUEozOlIY5xHsWvFb7nMqsRfvtPFJGtRODb4Qx2C7zKtlpYmXR2PzqqO/PEQbq4GR6rPFwvzsJg
	zL99yC8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHqLk-00000003Ta4-3heQ;
	Sat, 08 Nov 2025 21:19:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHqLh-00000003TXy-1zlO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Nov 2025 21:19:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3135540A2F;
	Sat,  8 Nov 2025 21:19:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 859EBC2BC9E;
	Sat,  8 Nov 2025 21:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762636793;
	bh=kBAZ8AOF544L6vZ+vxvpcNt3XqojsED13+xldvuDG8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MdDhKs7ts6uQNBIiTC55xDkfGH8fKCbYLirWzaVhhfYJOlY6K4LPFJDtHiuSanrW2
	 OoMmW8hQBNbcRZWo8iDZpHwmfE1DVwgYzQ2Sf8hpnTm9qeIWKxJ0/GEgHqUMfNcFAy
	 n4mXU69r1ioFEQKK66Xo9SdQga1R1RSHw+xv9e+vvzAj3olUpfbSWwHSICtM7qaNn+
	 TmsmAGoftlbkDXK5QY0Y5sMiWfWZmCaFZDT9Cbo78ZY1Srl60NIGKZF2cNX1pjKKe7
	 hqvy/Lgl1DvXqJ4L0YFSBfYjBUVh+5LsTaaneVKTsto8zS2VI3wAYsn18wxAhgUMir
	 2035eEOuntdPA==
Date: Sat, 8 Nov 2025 22:17:19 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Simon Glass <sjg@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Masahiro Yamada <masahiroy@kernel.org>,
	J =?iso-8859-1?Q?=2E_Neusch=E4fer?= <j.ne@posteo.net>,
	Tom Rini <trini@konsulko.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>, Kees Cook <kees@kernel.org>,
	Rong Xu <xur@google.com>, Will Deacon <will@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 5/7] kbuild: Allow adding modules into the FIT ramdisk
Message-ID: <aQ-zXyOr2FPz2V0Z@levanger>
References: <20251006230205.521341-1-sjg@chromium.org>
 <20251006230205.521341-6-sjg@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251006230205.521341-6-sjg@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_131953_567024_44ABFCA3 
X-CRM114-Status: GOOD (  19.28  )
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

On Mon, Oct 06, 2025 at 05:01:56PM -0600, Simon Glass wrote:
> Support 'make image.fit FIT_MODULES=1' to put all the modules into a
> ramdisk image within the FIT.
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> Suggested-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> Acked-by: Nathan Chancellor <nathan@kernel.org>
> ---
> 
> Changes in v4:
> - Rename the Makefile variable from 'EXTRA' to 'MAKE_FIT_FLAGS'
> - Use an empty FIT_MODULES to disable the feature, instead of '0'
> - Make use of the 'modules' dependency to ensure modules are built
> - Pass the list of modules to the script
> 
>  arch/arm64/boot/Makefile |  4 ++++
>  scripts/Makefile.lib     | 10 ++++++++--
>  2 files changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/Makefile b/arch/arm64/boot/Makefile
> index b5a08333bc57..d10c85f96aea 100644
> --- a/arch/arm64/boot/Makefile
> +++ b/arch/arm64/boot/Makefile
> @@ -43,6 +43,10 @@ $(obj)/Image.zst: $(obj)/Image FORCE
>  $(obj)/Image.xz: $(obj)/Image FORCE
>  	$(call if_changed,xzkern)
>  
> +ifeq ($(FIT_MODULES),1)
> +.PHONY: modules
> +$(obj)/image.fit: modules
> +endif

This does not work for me.  I tried:

    make clean
    make image.fit FIT_MODULES=1

but modules are not built as KBUILD_MODULES is not set in top-level
Makefile.  Works for me with the following diff:


diff --git a/Makefile b/Makefile
index d14824792227..e6b8bcbdb073 100644
--- a/Makefile
+++ b/Makefile
@@ -772,7 +772,13 @@ endif
 # in addition to whatever we do anyway.
 # Just "make" or "make all" shall build modules as well
 
-ifneq ($(filter all modules nsdeps compile_commands.json clang-%,$(MAKECMDGOALS)),)
+modules-targets := all
+modules-targets += $(if $(FIT_MODULES), image.fit)
+modules-targets += modules
+modules-targets += nsdeps
+modules-targets += compile_commands.json
+modules-targets += clang-%
+ifneq ($(filter $(modules-targets),$(MAKECMDGOALS)),)
   KBUILD_MODULES := y
 endif
 
diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index 73a10f65ce8b..f7f0c144908a 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -174,6 +174,7 @@ endif
 all:	$(notdir $(KBUILD_IMAGE))
 
 image.fit: dtbs
+image.fit: $(if $(FIT_MODULES), modules)
 
 vmlinuz.efi image.fit: Image
 $(BOOT_TARGETS): vmlinux
diff --git a/arch/arm64/boot/Makefile b/arch/arm64/boot/Makefile
index d10c85f96aea..b5a08333bc57 100644
--- a/arch/arm64/boot/Makefile
+++ b/arch/arm64/boot/Makefile
@@ -43,10 +43,6 @@ $(obj)/Image.zst: $(obj)/Image FORCE
 $(obj)/Image.xz: $(obj)/Image FORCE
 	$(call if_changed,xzkern)
 
-ifeq ($(FIT_MODULES),1)
-.PHONY: modules
-$(obj)/image.fit: modules
-endif
 $(obj)/image.fit: $(obj)/Image $(obj)/dts/dtbs-list FORCE
 	$(call if_changed,fit)
 


Kind regards
Nicolas

