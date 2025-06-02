Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D087C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 10:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VsBm6T/zpc3E5TZOPZMkcG9yt/5ksnxZDlOMSqby9Wk=; b=l+JIGN1AafQ6NcK+F4eg7QKMEj
	BdbGHvg8lNXpLwECPxNaAjKX5TsCQZDnusyeb5NWMFEZR/adDPnXknk+3lj7gGKUs82YoE3u3qX+W
	aKG6+7fmrg2nqz4IBmpnqYsAXL7F7kX6ZZSTM9ZFThWhQwAlLxfWisw4pwyZNOUU6UXFu2xA0thkA
	20qgYq3YmZ7tdwWF7PtquC3Hzm4Uu85jLRfIKwlXLcNpvaam3s3kA4JJjvvN8ed2ykhhJ+cxIJTNF
	94eWi9Rm13Q5iqmK30Pbl5LdRfGtAEQodwPghuIvDzysc3q6e4ZxCAhjFfrbVKCq/eo2ade2i9n4n
	sHexF44Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM298-00000007ADd-19Pb;
	Mon, 02 Jun 2025 10:11:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM26s-000000079g2-33Zr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 10:09:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B4F684A80F;
	Mon,  2 Jun 2025 10:09:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B2D4C4CEEB;
	Mon,  2 Jun 2025 10:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748858977;
	bh=ze3EWGUrWoP3ETJXn+QaBX790+BbWokYszuyea87Eqc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BD+72zi0AkrWhTpjeuzWAtdgmsKVgDujTzLdnxBZy5GH6fjFQZ2OJ03CYt5bqJ6SG
	 1en6cR2mvddpz31FtiD3Ab+zwfQ6N+6gNPxAZik6RdcVmTxCQl+yAppSpP5i1Rmf7o
	 S8gSFNXHOAsTMlb9sUVKdux5jstuMfGZN//dlKSfb3u0Dt0l0sNN9R5zmpqyIGVlUD
	 De1SlrN/YlpJntVxjs5WVwWI2TGVwT6BvqNV0B+7Xi/osTWlx9oVg+tRo2ImYjRpSQ
	 V+K2xoklKguCPxrs9En8cRkj7dcCRX5cKgNEMAYJSzYFdDIrJIiTwt3BaCfSCMVuAw
	 qaaM5D6iTUPbA==
Date: Mon, 2 Jun 2025 11:09:32 +0100
From: Will Deacon <will@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb+git@google.com>,
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org, catalin.marinas@arm.com,
	nathan@kernel.org
Subject: Re: [PATCH] arm64: Disable LLD linker ASSERT()s for the time being
Message-ID: <20250602100932.GA919@willie-the-truck>
References: <20250529073507.2984959-2-ardb+git@google.com>
 <20250530133811.GB30622@willie-the-truck>
 <CAMj1kXHypqdC9O+8WH7n1=aDOySMScZc2y526S3gc_-QNpqO=w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXHypqdC9O+8WH7n1=aDOySMScZc2y526S3gc_-QNpqO=w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_030938_808779_D4118648 
X-CRM114-Status: GOOD (  31.44  )
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

On Fri, May 30, 2025 at 04:23:16PM +0200, Ard Biesheuvel wrote:
> On Fri, 30 May 2025 at 15:38, Will Deacon <will@kernel.org> wrote:
> >
> > On Thu, May 29, 2025 at 09:35:08AM +0200, Ard Biesheuvel wrote:
> > > From: Ard Biesheuvel <ardb@kernel.org>
> > >
> > > It turns out that the way LLD handles ASSERT()s in the linker script can
> > > result in spurious failures, so disable them for the newly introduced
> > > BSS symbol export checks.
> > >
> > > Link: https://github.com/ClangBuiltLinux/linux/issues/2094
> > > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > > ---
> > >  arch/arm64/kernel/image-vars.h | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > >
> > > diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-vars.h
> > > index c5266430284b..86f088a16147 100644
> > > --- a/arch/arm64/kernel/image-vars.h
> > > +++ b/arch/arm64/kernel/image-vars.h
> > > @@ -10,6 +10,10 @@
> > >  #error This file should only be included in vmlinux.lds.S
> > >  #endif
> > >
> > > +#if defined(CONFIG_LD_IS_LLD) && CONFIG_LLD_VERSION < 210000
> > > +#define ASSERT(...)
> > > +#endif
> > > +
> > >  #define PI_EXPORT_SYM(sym)           \
> > >       __PI_EXPORT_SYM(sym, __pi_ ## sym, Cannot export BSS symbol sym to startup code)
> > >  #define __PI_EXPORT_SYM(sym, pisym, msg)\
> > > @@ -142,4 +146,6 @@ KVM_NVHE_ALIAS(kvm_protected_mode_initialized);
> > >  _kernel_codesize = ABSOLUTE(__inittext_end - _text);
> > >  #endif
> > >
> > > +#undef ASSERT
> >
> > What about the ASSERT()s at the end of vmlinux.lds.S? Are they not
> > affected by the bug, for some reason?
> >
> > Also, even with this patch applied, I still see a link failure:
> >
> >   | ld.lld: error: assignment to symbol __init_end does not converge
> >
> > with the .config you sent me off-list.
> >
> 
> That is a different error that has been lurking for a while now; Arnd
> occasionally hits it but I haven't seen any other reports of it. AIUI,
> the issue is that INIT_IDMAP_DIR_PAGES and INIT_DIR_SIZE are defined
> in terms of (_end - KIMAGE_VADDR), resulting in a circular dependency.

Ok, I'll ignore that one for the moment, then...

> The config in the kernel test robot's report [0] appears to build fine
> with this patch applied.
> 
> 
> [0] https://lore.kernel.org/all/202505261019.OUlitN6m-lkp@intel.com/T/#u

... but I'm still not sure why the ASSERT()s in vmlinux.lds.S are not
affected. Is it just that we've not hit a .config which breaks with
those yet, or is it something more fundamental than that? I'd have
thought we'd need to so something like below (on top of your patch) to
fix this issue properly.

Will

--->8

diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-vars.h
index 86f088a16147..c5266430284b 100644
--- a/arch/arm64/kernel/image-vars.h
+++ b/arch/arm64/kernel/image-vars.h
@@ -10,10 +10,6 @@
 #error This file should only be included in vmlinux.lds.S
 #endif
 
-#if defined(CONFIG_LD_IS_LLD) && CONFIG_LLD_VERSION < 210000
-#define ASSERT(...)
-#endif
-
 #define PI_EXPORT_SYM(sym)		\
 	__PI_EXPORT_SYM(sym, __pi_ ## sym, Cannot export BSS symbol sym to startup code)
 #define __PI_EXPORT_SYM(sym, pisym, msg)\
@@ -146,6 +142,4 @@ KVM_NVHE_ALIAS(kvm_protected_mode_initialized);
 _kernel_codesize = ABSOLUTE(__inittext_end - _text);
 #endif
 
-#undef ASSERT
-
 #endif /* __ARM64_KERNEL_IMAGE_VARS_H */
diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
index e4a525a865c1..3f7a365f7113 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -150,6 +150,10 @@ PECOFF_FILE_ALIGNMENT = 0x200;
 #define PECOFF_EDATA_PADDING
 #endif
 
+#if defined(CONFIG_LD_IS_LLD) && CONFIG_LLD_VERSION < 210000
+#define ASSERT(...)
+#endif
+
 SECTIONS
 {
 	/*


