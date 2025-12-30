Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D62E4EE0203
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 15:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tFiFjK/eYnpWBGowfx7zDet17nFgEgX4kpnfivQbYww=; b=KIRGvux5LVtVhMG3QljRvCvr19
	Ok2sCUhk50t1E0k6bDxNbsRKjctiF1NxfNXBVqxCIo3OuImT2pB7Qs+T2aPgqrzp2ioqm5LLMtfp2
	RWo9zbhganTOSmTjB9gy/my14JyX/n4fr2KtxNMP1xhIwjHavHBc8LdC1khDAqSP6AKixZPaPa2A/
	LHVKAuLCFtAmHGrIMSYty0gxaGzo2nIZpfCmuymEOaeG0hMwncF8uSFjiAzmu1YowtKrmrtT3uz6w
	YBXe3RdWO9pFXWWK5RbRVn+SWj3s1eAord4ZPrKwIpbYES2rBtz8MnYQiPTG+0zyeGqfyfux9t8cb
	q6DnkwKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vabIl-00000004ykL-1Tx3;
	Tue, 30 Dec 2025 15:06:23 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vabIh-00000004yj7-3j4n
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 15:06:22 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-37a34702a20so68394791fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Dec 2025 07:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767107177; x=1767711977; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tFiFjK/eYnpWBGowfx7zDet17nFgEgX4kpnfivQbYww=;
        b=QL5oZJnvRu9srMWB/0tG2iWlXHrRf3lfWQRX2gPDartnhvl94aWMl2Vuj7zvkj8Fk1
         KGhXsIp3zkMGJA4qJGmjkmf4gxPKA5GCNY1PUIat6qqgQmGr9pvMSXqX280aVL0uG84D
         ycpZdTfkZq3IFiyTBMGw7LCBXiKPTb6GLURTN5uc8ImB4zA493giIN3ktcoYAQdsqifU
         QYPkxTBqwfQFrezKHyWCfHaS6frVs9C92fMrtdI7aiD5d4usUTw/atQYGhN0Y+g5s6T3
         EspXD+g2JI4KSPtfPfD728gjx4hUYhceZlGGNPrTjlGr+4c34ZtVu7CANBCI5Vd8jqCf
         D/Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767107177; x=1767711977;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tFiFjK/eYnpWBGowfx7zDet17nFgEgX4kpnfivQbYww=;
        b=buY034D2p8pLADuIN/U1VqQOeW1/GokXGzTlI7UYp8M/HW1038KnHcu5OBi60l0zSm
         DAPHwybc7suvPnidtVhSC0rVecz4vgceOVjVLIAFyoVU8Vb0yPrNNWCdfRS3tz4B6ZXL
         1XdPzcgKWhClL1lVq2mHTznJH1Ha3ikEj2MaoY6+C0b2DH0TfDwZiBluVy1ItLMJTNgx
         ZMqUUBwhYKN2RibTd4jHDVn6NubhmhMl6xKpjZdxnliuLPjW2dOgzSpfZoUZa2Tl7Br8
         /GumixxtDdwi+WEftvgfim+gMyNn5DrdFEjEPNZBXLVct1i5PdR0WCK7PI257ZoJqZdS
         VYMA==
X-Forwarded-Encrypted: i=1; AJvYcCVXoCAlR9NRZC4naFxFeif80FsPC9c/Go3+ahfIb5J3Jk4vf79mKt1bYfWqi6McjFDjhNY4fqo4Up05er14L9li@lists.infradead.org
X-Gm-Message-State: AOJu0YyyI4upvg963pxBWI/xiP9ORTMAYKiA2GTMoX71LD4DLgwlPbLA
	0L+WBJ/J7LctS0M7Pj9wXkC3XUuoGWyjzdxIVtjrcpg3otV9a2L/DmzXYkU6IZUINf0=
X-Gm-Gg: AY/fxX61es+bRNzhf1shxfoW1dvUUdUsk6Fx6lUZT7T3Vdhr+MT0qEkq3Ed6a1jpGx3
	OjyvFZuqFp87QZEhQmOIClG/3athqvKlkTlNXfy2FLv9wTAfktlZQiw0zZ4Xj4xiyjrTbrY+cXo
	XUf24qJl6I0izlTUf/XqcO2Bzl18VxkjSnOuv3Ak20pJ+Igd1fSZjxvL0R01xeLjqNX1jsvTC6x
	4HbApx06KZFpoFZqyW29U7PHurV4zsAPhhDmoRExsRuT7V0jnFMjs5BWFAwNkWWrzL1XMRJ1xAF
	UahCtJoiksbqzyBkU+0nrvVui75mV/Q9Be11chRUbIeF7W4HkW7Wa8Vd5VAZpo9nu+MHtuIzkxB
	fGUyQLM7Eummg3a8QuP7rdhUADlhVWFxtUHjsgyLp0Mj/UAF9ESHBtGCsWvJFjEyGPzN94mWVM4
	JjADVHDvsPe1s1ooRsyL7Cy6msu+joNjJ0mVaaTwmvIVCc
X-Google-Smtp-Source: AGHT+IHq34tX7+mlt2/dJ7TIbz9SUfePMm284IENQ+mmLePJlEf0+OCvWLOMNWCxHN9z+mnd4zN8IA==
X-Received: by 2002:a05:651c:1541:b0:382:56ff:521b with SMTP id 38308e7fff4ca-38256ff5268mr58116991fa.25.1767107177131;
        Tue, 30 Dec 2025 07:06:17 -0800 (PST)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3812268ec5csm88795601fa.48.2025.12.30.07.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 07:06:16 -0800 (PST)
Date: Tue, 30 Dec 2025 17:06:14 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	D Scott Phillips <scott@os.amperecomputing.com>,
	Mark Brown <broonie@kernel.org>, Bill Mills <bill.mills@linaro.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Anders Roxell <anders.roxell@linaro.org>
Subject: ARM64_BTI_KERNEL and gcc? (was Re: Revisiting c0a454b9044f )
Message-ID: <aVPqZjjTWt13rmKV@nuoska>
References: <20250714195205.GA3723043@ax162>
 <aHY4d46ehF-j_pbw@J2N7QTR9R3>
 <20250716182641.GA2746700@ax162>
 <aHj-6xGYQ6RDvUHE@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aHj-6xGYQ6RDvUHE@J2N7QTR9R3>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_070619_972006_6BD5FB4B 
X-CRM114-Status: GOOD (  37.13  )
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

Hi,

On Thu, Jul 17, 2025 at 02:47:23PM +0100, Mark Rutland wrote:
> On Wed, Jul 16, 2025 at 12:26:41PM -0600, Nathan Chancellor wrote:
> > On Tue, Jul 15, 2025 at 12:16:07PM +0100, Mark Rutland wrote:
> > > The concern from the kernel side is simply whether we get unexpected BTI
> > > failures. IIUC so long as compiler and linker agree we should be good,
> > > and we simply need to forbid broken combinations.
> > 
> > Mark Brown did mention something about the module loader as well so I
> > was not sure if that was relevant here.
> 
> Sorry, I had forgotten anout that, and that is a concern.
> 
> If a single module has executable sections placed more than 128MiB apart
> we'd potentially have the same problem with any cross-section branch.
> Truly handling that would be quite tricky and require a fair amount of
> rework, so the best bet is probably to reject loading modules that are
> too large (or where we specifically find such cross-section branches
> needing veneers).
> 
> Note that exported symbols and address-taken functions should have a
> BTI, so this only really matters for cross-section calls within a single
> module.
> 
> I suspect it should be relatively simple but I'm not sure exactly where
> to plumb that in. I can put that on my TODO list if no-one gets around
> to it.
> 
> > > > Or should the kernel adjust its expectations now that the ABI and
> > > > toolchains all agree?
> > > 
> > > Yes, we can probably rework this.
> > > 
> > > IIUC we'd need to forbid BTI with:
> > > 
> > > * GCC + old GNU LD
> > > * GCC + old LLD
> > > * new clang + old GNU LD
> > > * new clang + old LLD
> > > 
> > > ... and can enable BTI otherwise.
> > > 
> > > Does that make sense to you?
> > 
> > So something like this if I understand correctly?
> > 
> > Cheers,
> > Nathan
> > 
> > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > index 393d71124f5d..fe523f9f2d61 100644
> > --- a/arch/arm64/Kconfig
> > +++ b/arch/arm64/Kconfig
> > @@ -2097,7 +2097,11 @@ config ARM64_BTI_KERNEL
> >  	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=94697
> >  	depends on !CC_IS_GCC || GCC_VERSION >= 100100
> >  	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=106671
> > -	depends on !CC_IS_GCC
> > +	# https://sourceware.org/bugzilla/show_bug.cgi?id=30076
> > +	depends on !CC_IS_GCC || LD_VERSION >= 24100 || LLD_VERSION >= 210000
> > +	# https://github.com/llvm/llvm-project/commit/7af2b51e761f49974a64c3009882239cea618f2a
> > +	# https://github.com/llvm/llvm-project/commit/098b0d18add97dea94e16006486b2fded65e228d
> > +	depends on !CC_IS_CLANG || CLANG_VERSION < 210000 || (CLANG_VERSION >= 210000 && (LD_VERSION >= 24100 || LLD_VERSION >= 210000))
> 
> Yep, something like that.
> 
> I was thinking that we could factor this out into a separate config,
> like we have for BUILTIN_RETURN_ADDRESS_STRIPS_PAC, as that'll make it
> easier to avoid duplication, e.g.
> 
> | config TOOLCHAIN_HAS_WORKING_BTI
> | 	bool
> | 	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=94697
> | 	default n if CC_IS_GCC && GCC_VERSION < 100100
> |	# Newer LD/LLD handle BTI in veneers automatically
> | 	default y if LD_IS_LLD && LLD_VERSION >= 210000
> | 	default y if LD_IS_GNU && LD_VERSION >= 24100
> | 	# Newer clang requires newer LD/LLD above
> | 	default y if CC_IS_CLANG && CLANG_VERSION < 210000
> | 	default n
> 
> ... and we can easily extend that to handle fixed stable versions, like with
> BUILTIN_RETURN_ADDRESS_STRIPS_PAC.

Has there been patches to implement this somewhere?

I'm checking yocto genericarm64 kernel config and noticed that ARM64_BTI_KERNEL
was effectively disabled with gcc in generated .config. Maybe some additional
tagging or config could be used to mark it as not supported with gcc
since the disappearing "CONFIG_ARM64_BTI_KERNEL=y" was not expected, and
enabling this is recomended in a number of places including
arch/arm64/configs/hardening.config and
https://kspp.github.io/Recommended_Settings#arm64

Cheers,

-Mikko

