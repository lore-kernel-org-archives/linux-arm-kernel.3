Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27A75CFC29A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 18:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H+qKI0T3AN48nttjKqI2C1ItBR5pvb6YKTuhf/frMSA=; b=hEH/mIWMIWk0Uhe554lFGbelCp
	N84ikJUDStpP37M1i/GFJxvTDeuUc1/GFQxVTj/lB4focpQOJ0S4gkvRkmHakERgWez/RpDl2NMVs
	ALfrjOYP7eBv+m/U3Wc150UjY2V1FFLeiGdthJX/KgAftw3OBGQN+TI8LmWLOEUoXT2j0LafynvOE
	WYGCyeGcwDgqa2JY3nWW3L6Z0SZoRFMTW73uJBl2SP30M2oMcEY8Gdo77ZsD7DgXCpGbYd9IhJorN
	K9tA4cCoLA8zwpRe1DTygN9JUQ6BDueQcYCxPKl1oyoSoM/p2I5b1z9d6vTadnXiNqa3eEdINW8ON
	4YRMapXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMW5u-00000008raK-2bwV;
	Fri, 21 Nov 2025 18:42:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMW5s-00000008rZe-2VHh;
	Fri, 21 Nov 2025 18:42:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2E44943702;
	Fri, 21 Nov 2025 18:42:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFB4EC4CEF1;
	Fri, 21 Nov 2025 18:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763750570;
	bh=0bMZ4NLDj8CskLCEMHyms2+DxxfLSA3gVajQFVYgIow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OwfS76PxWsTyb+evI0DjzSdw52gt48ZkvUBIvhqu2K2chtrb1J5goM2bIhcK6YF17
	 2E6jYyd9wEhXy8Ly+42iLaN2hn4Sfkv75r5BoMILmn6GdQqeojmMsN3yRq8/2KhEKD
	 poytx9cTo5q78MOQMGe0mtWoxln3wO+iG3ZqK82cPdN/vF2jpmKIooXZgNdygXvriL
	 CZjHlg7Jgm/kqJ8rHoRWCuVdjqJ2FXMtlRGsf1q9D0jHzbEs60T40Q3Npktkah8zdY
	 XIrSPHV/iIQj+YOeBEK8Imx4rz3lGbXX+xbuA+l08mP4vyDtnJzOObgUwo1rVcRbGJ
	 4I43q2OgU7yGA==
Date: Fri, 21 Nov 2025 10:42:47 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, Ard Biesheuvel <ardb@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, linux-kbuild@vger.kernel.org, linux-efi@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] kbuild: Add KBUILD_VMLINUX_LIBS_PRELINK
Message-ID: <hka6ukulmkmxp7mrcmxmllco2sqof2elextc7ggcikazfzmwni@a4pnogedcr7r>
References: <20251119042708.27658-1-yangtiezhu@loongson.cn>
 <20251121070140.GA780042@ax162>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251121070140.GA780042@ax162>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_104252_660830_B2AB30FD 
X-CRM114-Status: GOOD (  13.58  )
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

On Fri, Nov 21, 2025 at 12:01:40AM -0700, Nathan Chancellor wrote:
> > @@ -1199,6 +1199,7 @@ KBUILD_VMLINUX_OBJS := built-in.a $(patsubst %/, %/lib.a, $(filter %/, $(libs-y)
> >  KBUILD_VMLINUX_LIBS := $(filter-out %/, $(libs-y))
> >  
> >  export KBUILD_VMLINUX_LIBS
> > +export KBUILD_VMLINUX_LIBS_PRELINK
> 
> This variable name is a little confusing to me since they do get added
> to vmlinux during linking, not before. I am not sure of a better one
> though, maybe KBUILD_VMLINUX_LIBS_FINAL?

I think that name was my idea.  Not sure what I was thinking, I guess
"prelink" was somehow meant to imply after the vmlinux.o whole-archive
link but before the "final" link.

"final" is indeed better.

> It may also make sense to
> introduce similar syntax to the existing libs-y syntax, maybe
> 
>   final-libs-y
> 
> or something like that?

Yeah, I suppose that would mirror how KBUILD_VMLINUX_LIBS is wired up.

> Also, since these objects are no longer in KBUILD_VMLINUX_LIBS, does
> this new variable need to be added to any of the other places in the
> build system that use KBUILD_VMLINUX_LIBS for things such as build
> dependencies?

Not sure about that one.  drivers/firmware/efi/libstub/lib.a is getting
built regardless so there must already be an implicit dependency?

-- 
Josh

