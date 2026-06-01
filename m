Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59342CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 18:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=59cFMsdGN50Z23cJPSQ1lnNSZqcYCB0qfK8q0FcI+dI=; b=b1sF670/6JNhtiPhUbnPCUNHyU
	b46/hwWdwLRUGsnTRuKhTiA3Cd+zd3+qeh/Yphhct+z1Cg24C9PWuq0x/cpwpRQeABdr2ViHZi0zQ
	aNqFejT5PBhysseOnWgk+NhKzvhvRS74cGalD8VLunglAmB1sYox2E/h2gmY0YOP5/wcqptsvj9H6
	AP4ftggpSPfLeotz8LFlmYOdpBPR2BFmP5Kl3QUjXpxEm/z0N6VxO7iDMALUxU5XHF/MzlCXKZPL1
	O0YK9CHIEMTWcMjQ2UBWGRpDFN94ei7o/ck2Fn4AUIS0mz77fVLVDnL4D6JJmWfTE/8rx+4D8XSo0
	BLUezcOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU7Dp-0000000BeZu-3ZxY;
	Mon, 01 Jun 2026 18:18:45 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU7Dm-0000000BeZH-3ZAe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 18:18:44 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-68d22476e88so126a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 11:18:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780337921; cv=none;
        d=google.com; s=arc-20240605;
        b=OTlWehbAJWNIcWj2Cqo4y1hTC2+uQ9SElJXALxIwxlvMUfmQyheGV3NPSbENzpq44S
         INcXqfCl8gIXGCsFDGwxQuyZ+Vik3evVf86EohEmkSS8XnQ7w7HfrQLC6Zrs6H0O87aG
         GnvCvog4DTWNw5Asn7Xu0kWftF7Y/HJNdw8atTKd0gcAXQwLS7oxiz0IDn+yJfgayiJe
         VNjyS+OCgEtqen0XKc3z6ckfIXUjuaFMDBAO2NkErz+hAQJmOsf8bAHXDEkLN+HZinND
         zLOvLdnwTGG4opYNNjn/P548xRBNVsUlXRhgqWyMC/20aGpC8r1iee5UDmfZ7S10+fr4
         cCRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=59cFMsdGN50Z23cJPSQ1lnNSZqcYCB0qfK8q0FcI+dI=;
        fh=mxwuzY/e1UykjvL1nw3865WkGC5TXLWD2SpGj/xtqVg=;
        b=UkED0I+KJ5AGRBxw3GQhybuVH+/De/dkFjxa//Fc7NwPlNDh3TOvVYXrGDqdbnZdde
         TYlzAfS7STzZzPHPRZoQ/PYHmnYc86Y+JrK4wFHoDzETKCGVajDAPeLuICWmLXEyGVsb
         V7AdYoefM7MmmSbSjDHxWlxfvaRYtKlS0FbHs6P8Roc9UKbXUmy6jqaqR/J7Z4ZQ58ci
         uidAT0BbnnyPaY7+dGmf4O54mRfxSbDq903LziC2BHEiUb1Yb10lMhcLYuC7NKWl8SbU
         5YSlTkku2lVDM7MCM9wNHfYDvtH5rq77andmioJMyhgF9MMiA0e7A7CKdCcJLSfJluUp
         T/yQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780337921; x=1780942721; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=59cFMsdGN50Z23cJPSQ1lnNSZqcYCB0qfK8q0FcI+dI=;
        b=iVfFMh+ula01JczkfFhEnEoYxk2Vgpiux+llylNfwxWjNQMhunaSAb0yCvCVmQ0Gzt
         SLbAz8LwUdQiGtWQik9z737Gw8A0RfliGX04jV5raZfJKiipdPJS3oLfYPuDQOc2vGwK
         5pEFEsgEhSh3pgumFkK2uw1zsdSDwNk3a3jzIniR4iVe8VYPCWcSpPVRPBHzHn5yiX4Q
         wrw/gpN4V6khME2JCt/ipoz6Umkp9KemnTYF28f86X3DovBxwgs0I8rB8mLMuPktX+7n
         VMXdk8vOTzHqqTTDsjIKDdSGbQRtzy0JltyHhWFWzu2a3X44wa4iCi3EimAvxcbPnORJ
         9qrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780337921; x=1780942721;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=59cFMsdGN50Z23cJPSQ1lnNSZqcYCB0qfK8q0FcI+dI=;
        b=ZDX2izA4nx46ptPoGyZlvMK3Qj3uZi0Ibeb3d/cajJtK6Z/qf04f7YvVR5gYFnAZ0M
         51hiYTwGkL6bh/xC0k3GiSCQgNuF4xxpEc9RLDd+HIwMTY60YRpB0+zHGhMgFXTTWSSb
         DCn9q+MEg7xI/oN8eMtXHS2o5GuIp6NiBRmmqQ3ezD3YpscgdeJfRQ72cewmxv5+WKP8
         2xcnrYjB9mKkaVIZaC+xZQdIbjwDIxeqVJ/SiN3cffnRbp96t1vJHgfKEvS5SfTBY+ef
         AS1+yIYdIFtR/vUme/9LxtsTitqRhtSbL9oYu1u2bwlr+foKsVmiR1Yge9fF8sJPrSW/
         AQQA==
X-Forwarded-Encrypted: i=1; AFNElJ++xoXfO8g8cH3ljfBjn6q7zLoQcbV2r8TAwqHgnsCyA5RMuohWUBs0MwsTXV4aLUCzNfVjDaXfDXhlnATbYmA1@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8uxxm7o0hXEiqu7yZp+pFLZlBPRr2EHFONMh0THPnPU58Sutw
	4Loxofrzs7ERSxvfIr+aQ1iOz0YX3JLjBikF4tfLgFWsqk5CNt61j/T9yxxm5DEeSSeq/acphGH
	ytE3Qz+Zj9Xw7gkd3Igm2405S9x62bezX3fa9sr0R
X-Gm-Gg: Acq92OFCniY0Ck3s72iwGOYGRlbby31ksa4bYYfs44gkJnel1wOAzdDhV2VkFARth8B
	STKh2oCmn/4Rcx+yZECQRNe2GRWnSBqm3Jbxf9brHmIZqVwK9ba0UmLbq0vasSmnzT6YwW8TD+G
	zr5g9IDiRp9CGWUcDJv+jDye13nMcpr7+Iy8u0MnpM2lJy6G0DHBKxBJMOAqnjJN6HxQw1TFytS
	E5w2sa/RwOGgJVm7r57DA1uj7ikyan1nkrk+gfH3vHsGdk38IS2nCPPZ84lk84Z2bk51ZXS/Epe
	79XHzPuWIK0L/cOZ+wOuhv8k92NJJgfkMfbSOMUgT5ZJHHku
X-Received: by 2002:a05:6402:21cc:b0:671:fff6:f82c with SMTP id
 4fb4d7f45d1cf-68de2cae1e0mr7831a12.2.1780337920407; Mon, 01 Jun 2026 11:18:40
 -0700 (PDT)
MIME-Version: 1.0
References: <20260527214510.3907973-1-xur@google.com> <20260527214510.3907973-3-xur@google.com>
 <178010203122.3743687.12531843798236779880.b4-review@b4>
In-Reply-To: <178010203122.3743687.12531843798236779880.b4-review@b4>
From: Rong Xu <xur@google.com>
Date: Mon, 1 Jun 2026 11:18:27 -0700
X-Gm-Features: AVHnY4Ka7L1qdwrv0z3rpuj3tWqUqBGydQxqUqYlMLvtTifJn-zPac3RV5uNXJ8
Message-ID: <CAF1bQ=RNokHJtf=8RGKyP12jNPKUvyztJVRaDZ2fnXSVzZ3L5g@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] kconfig: Remove the architecture specific config
 for Propeller
To: Nathan Chancellor <nathan@kernel.org>
Cc: Yabin Cui <yabinc@google.com>, Will Deacon <will@kernel.org>, Han Shen <shenhan@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Kees Cook <kees@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Linus Walleij <linusw@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Jinjie Ruan <ruanjinjie@huawei.com>, Lukas Bulwahn <lukas.bulwahn@redhat.com>, 
	linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>, 
	Helge Deller <deller@gmx.de>, Ryan Roberts <ryan.roberts@arm.com>, Marc Zyngier <maz@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Vincent Donnefort <vdonnefort@google.com>, 
	Alice Ryhl <aliceryhl@google.com>, x86@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_111842_950781_A7E5FE1E 
X-CRM114-Status: GOOD (  29.41  )
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

Thanks Nathan for the review! My response is inlined.

On Fri, May 29, 2026 at 5:47=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> On Wed, 27 May 2026 14:45:08 -0700, xur@google.com <xur@google.com> wrote=
:
> > diff --git a/arch/Kconfig b/arch/Kconfig
> > index e510c585ea84..e4eaca9c917c 100644
> > --- a/arch/Kconfig
> > +++ b/arch/Kconfig
> > @@ -879,12 +879,8 @@ config AUTOFDO_CLANG
> >
> >         If unsure, say N.
> >
> > -config ARCH_SUPPORTS_PROPELLER_CLANG
> > -     bool
> > -
> >  config PROPELLER_CLANG
> >       bool "Enable Clang's Propeller build"
> > -     depends on ARCH_SUPPORTS_PROPELLER_CLANG
>
> It does not look like '' or its predecessor,
> '-fbasic-block-sections=3Dlabels', are supported by all architectures?
> This will break allmodconfig for some architectures in that case, so
> this needs to addressed with some other dependency.

Thanks for catching this. Yes. -fbasic-block-address-map currently
only supports Arm64 and X86_64 as of now.
We thought people would only enable this config if they knew Propeller
was supported on that architecture.
But the allmodconfig build breaks this assumption.  I think I have to
keep this config for propeller, and make arm64 opt-in.

>
>   | $ make -skj"$(nproc)" ARCH=3Darm LLVM=3D1 mrproper allmodconfig all
>   | ...
>   | clang: error: unsupported option '-fbasic-block-address-map' for targ=
et 'armv6k-unknown-linux-gnueabi'
>   | ...
>   |
>   | $ make -skj"$(nproc)" ARCH=3Ds390 LLVM=3D1 mrproper allmodconfig all
>   | ...
>   | clang: error: unsupported option '-fbasic-block-address-map' for targ=
et 's390x-unknown-linux-gnu'
>   | ...
>
> Maybe something like
>
>   depends on CC_IS_CLANG && $(cc-option,-fbasic-block-address-map)
>
> then cleaning up scripts/Makefile.propeller to use it exclusively?

I think keep ARCH_SUPPORTS_PROPELLER_CLANG is cleaner.

>
> >
> > diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinu=
x.lds.S
> > index e1ac876200a3..44a42e7c66cf 100644
> > --- a/arch/arm64/kernel/vmlinux.lds.S
> > +++ b/arch/arm64/kernel/vmlinux.lds.S
> > @@ -368,6 +368,9 @@ SECTIONS
> >
> >       STABS_DEBUG
> >       DWARF_DEBUG
> > +#ifdef CONFIG_PROPELLER_CLANG
> > +        .llvm_bb_addr_map : { *(.llvm_bb_addr_map) }
>
> I would prefer to take the opportunity to consolidate this into
> include/asm-generic/vmlinux.lds.h with something like this:
>
>   | diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmli=
nux.lds.S
>   | index 44a42e7c66cf..8aaf404980a7 100644
>   | --- a/arch/arm64/kernel/vmlinux.lds.S
>   | +++ b/arch/arm64/kernel/vmlinux.lds.S
>   | @@ -368,9 +368,7 @@ SECTIONS
>   |
>   |     STABS_DEBUG
>   |     DWARF_DEBUG
>   | -#ifdef CONFIG_PROPELLER_CLANG
>   | -        .llvm_bb_addr_map : { *(.llvm_bb_addr_map) }
>   | -#endif
>   | +   PROPELLER_DATA
>   |     MODINFO
>   |     ELF_DETAILS
>   |
>   | diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.=
lds.S
>   | index 4711a35e706c..d93611675d8a 100644
>   | --- a/arch/x86/kernel/vmlinux.lds.S
>   | +++ b/arch/x86/kernel/vmlinux.lds.S
>   | @@ -423,9 +423,7 @@ SECTIONS
>   |
>   |     STABS_DEBUG
>   |     DWARF_DEBUG
>   | -#ifdef CONFIG_PROPELLER_CLANG
>   | -   .llvm_bb_addr_map : { *(.llvm_bb_addr_map) }
>   | -#endif
>   | +   PROPELLER_DATA
>   |
>   |     MODINFO
>   |     ELF_DETAILS
>   | diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/=
vmlinux.lds.h
>   | index 60c8c22fd3e4..7a157a1320b9 100644
>   | --- a/include/asm-generic/vmlinux.lds.h
>   | +++ b/include/asm-generic/vmlinux.lds.h
>   | @@ -1011,6 +1011,13 @@
>   |  #define PERCPU_DECRYPTED_SECTION
>   |  #endif
>   |
>   | +#ifdef CONFIG_PROPELLER_CLANG
>   | +#define PROPELLER_DATA                                              =
       \
>   | +   .llvm_bb_addr_map : { *(.llvm_bb_addr_map) }
>   | +#else
>   | +#define PROPELLER_DATA
>   | +#endif
>   | +
>   |
>   |  /*
>   |   * Default discarded sections.
>
> That keeps the ifdef in one place and makes it easy to add this to other
> architecture linker scripts as they gain support for Propeller. Are
> there any other architectures that need this added? Or are arm64 and
> x86_64 the only supported architectures?

I think this is good idea to move to vmlinux.lds.h. I'll change the
patch accordingly.

>
> --
> Cheers,
> Nathan
>

