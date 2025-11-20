Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 802A4CF885D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 20:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ItoiyKX6dX5XrURmJYgb2DIxO86yxDHfPhD3CX7BZdw=; b=DQU2kuU+CiusNQzeaCQKhyUTg/
	p3+7iAZoyOI7hHg36F1/ru445yQVLI5nIBmmTncxKJDxazFM3/ThrtgZlb/LEcFfqrOfM06KAmmMg
	KbHxsTlWoOsCFcRY6VXPHG8y096ajjtTAAuV1QB891TA+c8k/zzdsczpI9na1gq4rhBWGJ0ROz3T5
	9ImDlWRjBpJ0YtOUxB1VjnMjkiocrOpF7DDRvMK/n90R7lUYmNrWSldmcyV6/zbHQYDKhqKdu2kqw
	9IfyIuCJPzGEpO5LFlTYRwUb48i8omk1PVoaf0o2eAN9IrqALKogwvUgGobtqnZNEXXzST//IllC+
	cFsUgJPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMAzR-00000007KVa-0ldg;
	Thu, 20 Nov 2025 20:10:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMAzP-00000007KVU-2rLX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 20:10:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B103D60017;
	Thu, 20 Nov 2025 20:10:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8E7DC4CEF1;
	Thu, 20 Nov 2025 20:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763669446;
	bh=ob6T5V5jKAufVGPgdYe6GH+NUfh+v8mrwWJAY8/1TJk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uhi3+V7lWTG0qMFFscMOZH1oDtU/WVwEdjoedjpDlL8K8nIiSoiab1XU1TWy0x18F
	 BakfYYEbqIUW4e5tXcdPFvbX4o7S2qpDMtTNy/cEdKlacu+GzzuWGBcqCQwl6M1wDS
	 JwASQUcKPzCX+ZLcISb5iqp972QanSQ+Gsx11dmprOVNwknx1vSycKtNKt0HHrDThg
	 X6eOkFr2nhJ3rk//GtnkisbQMdsgcB5z4YUrXRvDVbD5lO3zaB7jpYoxPCqDr9CEgy
	 t5WHX/IW6u8ROnUxBKsJVFhORI1Y9UOFf7OC5cgH+0BhJ1RDKx/4imr6BQ/KX915N1
	 MktpsVZXuzVhw==
Date: Thu, 20 Nov 2025 21:09:15 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Simon Glass <sjg@chromium.org>, linux-arm-kernel@lists.infradead.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Tom Rini <trini@konsulko.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	J =?iso-8859-1?Q?=2E_Neusch=E4fer?= <j.ne@posteo.net>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>, Kees Cook <kees@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, Rong Xu <xur@google.com>,
	Tamir Duberstein <tamird@gmail.com>, Will Deacon <will@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 6/8] kbuild: Allow adding modules into the FIT ramdisk
Message-ID: <aR91a-VK_YuGd44g@levanger>
References: <20251119181333.991099-1-sjg@chromium.org>
 <20251119181333.991099-7-sjg@chromium.org>
 <20251120084201-53a3c98f-6a3c-4116-8635-be67d58fd57b@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251120084201-53a3c98f-6a3c-4116-8635-be67d58fd57b@linutronix.de>
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

On Thu, Nov 20, 2025 at 08:49:14AM +0100, Thomas Weißschuh wrote:
> On Wed, Nov 19, 2025 at 11:13:27AM -0700, Simon Glass wrote:
> > Support 'make image.fit FIT_MODULES=1' to put all the modules into a
> > ramdisk image within the FIT.
> > 
> > Add image.fit as a target which requires modules, so that modules will
> > built automatically when using FIT_MODULES is not empty.
> > 
> > Signed-off-by: Simon Glass <sjg@chromium.org>
> > Suggested-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> > Suggested-by: Reviewed-by: Nicolas Schier <nsc@kernel.org>
> > Acked-by: Nathan Chancellor <nathan@kernel.org>
> > ---
> > 
> > Changes in v6:
> > - Mention that FIT_MODULES just needs to be non-empty
> > - Make use of modules.order instead of using 'find'
> > 
> > Changes in v5:
> > - Build modules automatically if needed (fix from Nicolas Schier)
> > 
> > Changes in v4:
> > - Rename the Makefile variable from 'EXTRA' to 'MAKE_FIT_FLAGS'
> > - Use an empty FIT_MODULES to disable the feature, instead of '0'
> > - Make use of the 'modules' dependency to ensure modules are built
> > - Pass the list of modules to the script
> > 
> >  Makefile             | 1 +
> >  arch/arm64/Makefile  | 1 +
> >  scripts/Makefile.lib | 6 +++++-
> >  3 files changed, 7 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Makefile b/Makefile
> > index 8cd46222fc48..4eccaef95826 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -773,6 +773,7 @@ endif
> >  # Just "make" or "make all" shall build modules as well
> >  
> >  modules-targets := all
> > +modules-targets += $(if $(FIT_MODULES),image.fit)
> >  modules-targets += modules
> >  modules-targets += nsdeps
> >  modules-targets += compile_commands.json
> > diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
> > index 73a10f65ce8b..7036f251ab40 100644
> > --- a/arch/arm64/Makefile
> > +++ b/arch/arm64/Makefile
> > @@ -174,6 +174,7 @@ endif
> >  all:	$(notdir $(KBUILD_IMAGE))
> >  
> >  image.fit: dtbs
> > +image.fit: $(if $(FIT_MODULES),modules)
> >  
> >  vmlinuz.efi image.fit: Image
> >  $(BOOT_TARGETS): vmlinux
> > diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> > index 1d581ba5df66..28e0cc0865b1 100644
> > --- a/scripts/Makefile.lib
> > +++ b/scripts/Makefile.lib
> > @@ -398,11 +398,15 @@ MAKE_FIT := $(srctree)/scripts/make_fit.py
> >  # Use this to override the compression algorithm
> >  FIT_COMPRESSION ?= gzip
> >  
> > +# Set this to non-empty to include an initrd with all the kernel modules
> > +FIT_MODULES ?=
> > +
> >  quiet_cmd_fit = FIT     $@
> >        cmd_fit = $(MAKE_FIT) -o $@ --arch $(UIMAGE_ARCH) --os linux \
> > -		--name '$(UIMAGE_NAME)' \
> > +		--name '$(UIMAGE_NAME)' $(MAKE_FIT_FLAGS) \
> 
> Remnant of a previous revision?
> 
> >  		$(if $(findstring 1,$(KBUILD_VERBOSE)),-v) \
> >  		$(if $(FIT_DECOMPOSE_DTBS),--decompose-dtbs) \
> > +		$(if $(FIT_MODULES),--modules @$(objtree)/modules.order) \
> 
> I am wondering how module dependencies work without the depmod invocation
> and modules.dep file.

oh, good point.  Stripping and signing and module compression is also
done during 'modules_install'.


-- 
Nicolas

