Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB20C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 12:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8a1GCGlKI0hbxdnLWtR0wnkUzPZf85ii5hdyKl+PYuY=; b=dFC/OH1j3ImidF+SEutqeGFW41
	AhODFgHJ7JZnwu3+i2WjO1kWQEgFobe74RRJEWwUUehIKBwrSyLcxGdXe44dzGCDn/7JOkCMP4sfg
	PnI5BYKZuSQ37xlsEXo6WWnNA31v6T9g6P+JOlwwfyO+tEOEy4EOe7O/hyUk6GW3KhpjN2T3RKpt6
	Gw5LprjLFIxb0P6snqMCe9m2bWEJSAZYOGTO5Vfy/MPZ9z76AcjoXv3ZimYRUGL703srgjOgceTd6
	mSgx3lH/aYa+3HHdtJc0VvTRDwkX26s0qo1WHKrTrKAecn+LLNwoZLKPHY6DAv1zoWRfl7d2TIdNT
	Kca2E9Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCHA7-0000000BrdQ-0ctH;
	Tue, 06 May 2025 12:12:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCFIG-0000000BWxR-42of
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 10:12:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2BE1E6113B;
	Tue,  6 May 2025 10:12:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC39FC4CEE4;
	Tue,  6 May 2025 10:12:52 +0000 (UTC)
Date: Tue, 6 May 2025 11:12:50 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, will@kernel.org, nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com, morbo@google.com,
	justinstitt@google.com, broonie@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com,
	shameerali.kolothum.thodi@huawei.com, james.morse@arm.com,
	hardevsinh.palaniya@siliconsignals.io, ardb@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH v2] arm64/cpufeature: annotate arm64_use_ng_mappings with
 ro_after_init to prevent wrong idmap generation
Message-ID: <aBngorZeIASsJEvY@arm.com>
References: <20250502180412.3774883-1-yeoreum.yun@arm.com>
 <174626735218.2189871.10298017577558632540.b4-ty@arm.com>
 <aBYkGJmfWDZHBEzp@arm.com>
 <aBZ7P3/dUfSjB0oV@e129823.arm.com>
 <aBkL-zUpbg7_gCEp@arm.com>
 <aBnDqvY5c6a3qQ4H@e129823.arm.com>
 <fbfded61-cfe2-4416-9098-ef39ef3e2b62@arm.com>
 <aBnOJS6TZxlZiYQ/@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBnOJS6TZxlZiYQ/@e129823.arm.com>
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

On Tue, May 06, 2025 at 09:53:57AM +0100, Yeoreum Yun wrote:
> > >>>> On Sat, May 03, 2025 at 11:16:12AM +0100, Catalin Marinas wrote:
> > >>>>> On Fri, 02 May 2025 19:04:12 +0100, Yeoreum Yun wrote:
> > >>>>>> create_init_idmap() could be called before .bss section initialization
> > >>>>>> which is done in early_map_kernel().
> > >>>>>> Therefore, data/test_prot could be set incorrectly by PTE_MAYBE_NG macro.
> > >>>>>>
> > >>>>>> PTE_MAYBE_NG macro set NG bit according to value of "arm64_use_ng_mappings".
> > >>>>>> and this variable places in .bss section.
> > >>>>>>
> > >>>>>> [...]
> > >>>>>
> > >>>>> Applied to arm64 (for-next/fixes), with some slight tweaking of the
> > >>>>> comment, thanks!
> > >>>>>
> > >>>>> [1/1] arm64/cpufeature: annotate arm64_use_ng_mappings with ro_after_init to prevent wrong idmap generation
> > >>>>>       https://git.kernel.org/arm64/c/12657bcd1835
> > >>>>
> > >>>> I'm going to drop this for now. The kernel compiled with a clang 19.1.5
> > >>>> version I have around (Debian sid) fails to boot, gets stuck early on:
[...]
> Personally, I don't believe this because the create_init_idmap()
> maps the the .rodata section with PAGE_KERNEL pgprot
> from __initdata_begin to _end.
> 
> and at the mark_readonly() the pgprot is changed to PAGE_KERNEL_RO
> But, arm64_use_ng_mappings is accessed with write before mark_readonly()
> only via smp_cpus_done().
> 
> JFYI here is map information:
> 
> // mark_readlonly() changes to ro perm below ranges:
> ffff800081b30000 g       .rodata	0000000000000000 __start_rodata
> ffff800082560000 g       .rodata.text	0000000000000000 __init_begin
> 
> // create_init_idmap() maps below range with PAGE_KERNEL.
> ffff8000826d0000 g       .altinstructions	0000000000000000 __initdata_begin
> ffff800082eb0000 g       .bss	0000000000000000 _end
> 
> ffff8000824596d0 g     O .rodata	0000000000000001 arm64_use_ng_mappings

So arm64_use_ng_mappings is mapped as read-only since .rodata is before
__initdata_begin.

-- 
Catalin

