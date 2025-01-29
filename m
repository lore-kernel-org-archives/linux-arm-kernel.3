Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD142C02193
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 09:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WcT+gFJL3v0i+qc0vhVShOFZHHbM/gza7ASTv76qnSY=; b=JOvs94fbKze32O0DRVbJKm2fEs
	27Tc/Gy4gnSdNxe6Na7SQU2LTwOtW5Rgvi1mPTDYZVnX6PymBQjWKXU5o3WPAX3UFpsELFX0wRhUL
	2GEinJTQygfAKRJMqSB+XGn6qhN6IXJP2qdMICvfY6ou+3ClSoL4GwkEfSxSiNXSTJcfHFTZifshD
	NrtkULcLUbNNlf65SyklsOZmfWUX99qSZfAMg/yMtlYHnRr/w6dFTSyRDjISZ9GDpei2dt457v8/u
	dh+cHC8KqQFMKqAIJkGdp83AEUPxDYYI5tH434gaX4NbhSGcUpcLX8K9ivWUvZ33F/HdcBNX705/P
	kaORbCOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td4F5-00000006dmE-0jXI;
	Wed, 29 Jan 2025 09:20:15 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td4Dk-00000006dhC-103J
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 09:18:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 053B3A41636;
	Wed, 29 Jan 2025 09:17:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B290AC4CED3;
	Wed, 29 Jan 2025 09:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738142330;
	bh=ylFtjY1uRHckE3DQwK4zxg8tdjAce036+ERZbbMF4J4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uZMFdC3NATWPzu7IsHqeuI3zzskdWYMru1c96EzX4lVTILNUfHTGiHCLF359awXN5
	 CTOppbak81D0JHK1EwjkxM099l/SaTYZCGqVl8+/YpbrezzoAHO6I2fYvYadAJ3BD1
	 DLemGS7GZTcHkXcJ9eIiWgzdLpLuQSodCd2STRlk=
Date: Wed, 29 Jan 2025 10:17:17 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: stable@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Will Deacon <will@kernel.org>, Steven Price <steven.price@arm.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Baruch Siach <baruch@tkos.co.il>, Petr Tesarik <ptesarik@suse.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Yang Shi <yang@os.amperecomputing.com>,
	"moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: mm: account for hotplug memory when randomizing
 the linear region
Message-ID: <2025012938-abreast-explain-f5f7@gregkh>
References: <20250109165419.1623683-1-florian.fainelli@broadcom.com>
 <20250109165419.1623683-2-florian.fainelli@broadcom.com>
 <62786457-d4a1-4861-8bec-7e478626f4db@broadcom.com>
 <2025011247-enable-freezing-ffa2@gregkh>
 <27bbea11-61fa-4f41-8b39-8508f2d2e385@broadcom.com>
 <2025012002-tactics-murky-aaab@gregkh>
 <41550c7f-1313-41b4-aa2e-cb4809ad68c2@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <41550c7f-1313-41b4-aa2e-cb4809ad68c2@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_011852_406912_90BC6CA0 
X-CRM114-Status: GOOD (  35.28  )
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

On Mon, Jan 20, 2025 at 08:33:12AM -0800, Florian Fainelli wrote:
> 
> 
> On 1/20/2025 5:59 AM, Greg KH wrote:
> > On Mon, Jan 13, 2025 at 07:44:50AM -0800, Florian Fainelli wrote:
> > > 
> > > 
> > > On 1/12/2025 3:54 AM, Greg KH wrote:
> > > > On Thu, Jan 09, 2025 at 09:01:13AM -0800, Florian Fainelli wrote:
> > > > > On 1/9/25 08:54, Florian Fainelli wrote:
> > > > > > From: Ard Biesheuvel <ardb@kernel.org>
> > > > > > 
> > > > > > commit 97d6786e0669daa5c2f2d07a057f574e849dfd3e upstream
> > > > > > 
> > > > > > As a hardening measure, we currently randomize the placement of
> > > > > > physical memory inside the linear region when KASLR is in effect.
> > > > > > Since the random offset at which to place the available physical
> > > > > > memory inside the linear region is chosen early at boot, it is
> > > > > > based on the memblock description of memory, which does not cover
> > > > > > hotplug memory. The consequence of this is that the randomization
> > > > > > offset may be chosen such that any hotplugged memory located above
> > > > > > memblock_end_of_DRAM() that appears later is pushed off the end of
> > > > > > the linear region, where it cannot be accessed.
> > > > > > 
> > > > > > So let's limit this randomization of the linear region to ensure
> > > > > > that this can no longer happen, by using the CPU's addressable PA
> > > > > > range instead. As it is guaranteed that no hotpluggable memory will
> > > > > > appear that falls outside of that range, we can safely put this PA
> > > > > > range sized window anywhere in the linear region.
> > > > > > 
> > > > > > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > > > > > Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> > > > > > Cc: Will Deacon <will@kernel.org>
> > > > > > Cc: Steven Price <steven.price@arm.com>
> > > > > > Cc: Robin Murphy <robin.murphy@arm.com>
> > > > > > Link: https://lore.kernel.org/r/20201014081857.3288-1-ardb@kernel.org
> > > > > > Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> > > > > > Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> > > > > 
> > > > > Forgot to update the patch subject, but this one is for 5.10.
> > > > 
> > > > You also forgot to tell us _why_ this is needed :(
> > > 
> > > This is explained in the second part of the first paragraph:
> > > 
> > > The consequence of this is that the randomization offset may be chosen such
> > > that any hotplugged memory located above memblock_end_of_DRAM() that appears
> > > later is pushed off the end of the linear region, where it cannot be
> > > accessed.
> > > 
> > > We use both memory hotplug and KASLR on our systems and that's how we
> > > eventually found out about the bug.
> > 
> > And you still have 5.10.y ARM64 systems that need this?  Why not move to
> > a newer kernel version already?
> 
> We still have ARM64 systems running 5.4 that need this, and the same bug
> applies to 5.10 that we used to support but dropped in favor of 5.15/6.1.
> Those are the kernel versions used by Android, and Android TV in particular,
> so it's kind of the way it goes for us.
> 
> > 
> > Anyway, I need an ack from the ARM64 maintainers that this is ok to
> > apply here before I can take it.
> 
> Just out of curiosity, the change is pretty innocuous and simple to review,
> why the extra scrutiny needed here?

Why shouldn't the maintainers review a proposed backport patch for core
kernel code that affects everyone who uses that arch?

thanks,

greg k-h

