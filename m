Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16B8DCC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 03:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RTVoV+gBOsZ6rOZ5w9p7Hh0T69lXfyi++mqrWhYN8ks=; b=enUHB4mVmfiED2X0/3gHzEW4xc
	1B50TGJtWl++tLPqb9j0R/gvXdhoWuljhAc3PIGvQQaGyBVXcTDvE6ysBVi4oUD86j6VKlClRfcld
	+cbvXNvI5LgNSYqS6q27Hw03OEODlPg1qf6eXWaKVGAVil9i6qrAwX913FBp6W6cuQ7SmP2tpt8EK
	VpFD6U8mOLJPDQfHMjPnktas5uPoXgqN1UC6IlIDbCoL1+ZiB80cV70uEu08Lz2OvJLjbW0HnZkSX
	TDgmEQYqsPKy9cvmsQMgEGCPK3RPl3gXZLQztWS7uKmV/rqi4x2e3+gflEKJugtCrImQYjlCkrNZN
	IT+HHmYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHZ4Y-00000001vQb-0Z4x;
	Fri, 16 Oct 2026 03:57:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHZ4W-00000001vQ4-035K
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 03:57:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 580FB14BF;
	Thu, 15 Oct 2026 20:57:26 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D7E303F673;
	Thu, 15 Oct 2026 20:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792123049; bh=nr+2Ba/wperxrB0oPnvRIv6ziasoepMJ6kBz6i1UOM8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n1mO5ZXHj64DVV9mh+/Muwc2p+1XILKpQ0uALrqw2Llxill/F821gw8aaTJHv7L4E
	 8r4DppLWdfkcJte2yYja7cjjsnWb1RPEdrbEidDg7uTR+ZDzUr3fxIrfyBqR1mC9Ru
	 pLRex3uB4/qqK8+GZz138MbPz6Cp+kuicURpklks=
Date: Fri, 16 Oct 2026 09:27:26 +0530
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Iurii Trukhin <yuri@trukhin.com>, Will Deacon <will@kernel.org>, 
	Kees Cook <kees@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: raise default ARCH_MMAP_RND_BITS for 48-bit
 and 52-bit VA
Message-ID: <4udh7nwi3is7xb4jhgsznyrm6w7i4hk5oeteqzzpswapi76ppk@65y3efxvo2bb>
References: <CAOx7e9K5sgNcWNj4CemyZd0Ar1ZjR4o44B4nryohq-Ue6TNdKA@mail.gmail.com>
 <atEAtHiHh0eeVPn3@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atEAtHiHh0eeVPn3@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_205732_174272_F10CDF9A 
X-CRM114-Status: GOOD (  17.50  )
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

On Thu, Oct 15, 2026 at 05:35:00PM +0100, Catalin Marinas wrote:
> On Wed, Oct 14, 2026 at 10:23:35PM -0700, Iurii Trukhin wrote:
> > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > index cab741a695f5..7bca47269dd5 100644
> > --- a/arch/arm64/Kconfig
> > +++ b/arch/arm64/Kconfig
> > @@ -313,6 +313,14 @@ config ARCH_MMAP_RND_BITS_MAX
> >  	default 16 if ARM64_16K_PAGES
> >  	default 18
> > 
> > +# default to 1 TiB (5 bits below ARCH_MMAP_RND_BITS_MAX) on 48-bit and
> > +# 52-bit VA; smaller VA sizes fall back to ARCH_MMAP_RND_BITS_MIN in
> > +# arch/Kconfig
> > +config ARCH_MMAP_RND_BITS
> > +	default 24 if (ARM64_VA_BITS=48 || ARM64_VA_BITS=52) && ARM64_64K_PAGES
> > +	default 26 if (ARM64_VA_BITS=48 || ARM64_VA_BITS=52) && ARM64_16K_PAGES
> > +	default 28 if (ARM64_VA_BITS=48 || ARM64_VA_BITS=52)
> 
> This looks fine but I was wondering what ARCH_MMAP_RND_BITS_DEFAULT (and
> the compat equivalent) is for. It turns out that an int always evaluates
> to 'n', so not taken into account. It might be worth removing them
> altogether as a separate patch. No-one seems to be using them.

I had the same observation looking into v7.3-rc7 but seems like that option
is already being removed via the following patch, already in next-20261015.

commit 8cdae75cebe06b8abea9cd3402442d47cf50b485
Author: Julian Braha <julianbraha@gmail.com>
Date:   Mon Aug 31 00:00:16 2026 +0100

    arch/Kconfig: fix dead conditions by removing dead options

    These two 'int' options:

    ARCH_MMAP_RND_BITS_DEFAULT
    ARCH_MMAP_RND_COMPAT_BITS_DEFAULT

[---snip---]

https://lore.kernel.org/all/20260830230016.2730093-1-julianbraha@gmail.com/

> 
> -- 
> Catalin

