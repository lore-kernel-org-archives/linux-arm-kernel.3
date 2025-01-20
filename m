Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC086C02181
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 14:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sK/wK+1KK0THZ4S75KxQ3s4DvzzvcvDqikYguKGQ/f8=; b=BwGZdckA4DNz/d37/78l8P+sib
	jOW9baq6SMgGX+Rzn5NYZu1oikNxSyHIOT+OcevLUOtibImugqVfROO9GO2sKhtmtRCp8A5ZpoWkn
	ZTuPrY6EoLnL/nxAZ4dSBLV7W7PkbmiaZpLSbHQnWTOp/ufBePlVA7ENDXjATEC0NDvXBBAjECgd0
	juxTjaG6O3msTyD48S4BKebNjWS07XURhiL34eWDasZOG5S2G5josxdUTf+H9wMFiklM9ua+JeDAd
	NX0i7sP2K653/glB/Ycdpwb/yG0BLIGU01H7P9VOjgeCXM3RlU2qBklvN706Sw17MaMAMP3+jGNCg
	ZYZmN9eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZsKy-00000005k2h-2Fvd;
	Mon, 20 Jan 2025 14:01:08 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZsJg-00000005jmu-0sst
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jan 2025 13:59:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D4CB8A40C9B;
	Mon, 20 Jan 2025 13:57:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A087EC4CEDD;
	Mon, 20 Jan 2025 13:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1737381587;
	bh=a6/AeNn2g3zqwiTDXTEbJ7QC16P6u39284X4lAoEtog=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2MLcyzMYI9JONm6c1Gur2116gUNJAsgCEiKKY84RpZP6gkBZb11gm9p9UXYtX/s7c
	 P9HCGU5kwWBjRYSrlmEIAQaMiccLo16sVEch//3ABkEC8U/Km4QE3aNgrTb1KVxLeJ
	 xSfZLdVjtGpqPO+/0HhTEgNcSppIjvAsQ3LAPrxU=
Date: Mon, 20 Jan 2025 14:59:44 +0100
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
Message-ID: <2025012002-tactics-murky-aaab@gregkh>
References: <20250109165419.1623683-1-florian.fainelli@broadcom.com>
 <20250109165419.1623683-2-florian.fainelli@broadcom.com>
 <62786457-d4a1-4861-8bec-7e478626f4db@broadcom.com>
 <2025011247-enable-freezing-ffa2@gregkh>
 <27bbea11-61fa-4f41-8b39-8508f2d2e385@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27bbea11-61fa-4f41-8b39-8508f2d2e385@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_055948_374890_363094A3 
X-CRM114-Status: GOOD (  26.91  )
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

On Mon, Jan 13, 2025 at 07:44:50AM -0800, Florian Fainelli wrote:
> 
> 
> On 1/12/2025 3:54 AM, Greg KH wrote:
> > On Thu, Jan 09, 2025 at 09:01:13AM -0800, Florian Fainelli wrote:
> > > On 1/9/25 08:54, Florian Fainelli wrote:
> > > > From: Ard Biesheuvel <ardb@kernel.org>
> > > > 
> > > > commit 97d6786e0669daa5c2f2d07a057f574e849dfd3e upstream
> > > > 
> > > > As a hardening measure, we currently randomize the placement of
> > > > physical memory inside the linear region when KASLR is in effect.
> > > > Since the random offset at which to place the available physical
> > > > memory inside the linear region is chosen early at boot, it is
> > > > based on the memblock description of memory, which does not cover
> > > > hotplug memory. The consequence of this is that the randomization
> > > > offset may be chosen such that any hotplugged memory located above
> > > > memblock_end_of_DRAM() that appears later is pushed off the end of
> > > > the linear region, where it cannot be accessed.
> > > > 
> > > > So let's limit this randomization of the linear region to ensure
> > > > that this can no longer happen, by using the CPU's addressable PA
> > > > range instead. As it is guaranteed that no hotpluggable memory will
> > > > appear that falls outside of that range, we can safely put this PA
> > > > range sized window anywhere in the linear region.
> > > > 
> > > > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > > > Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> > > > Cc: Will Deacon <will@kernel.org>
> > > > Cc: Steven Price <steven.price@arm.com>
> > > > Cc: Robin Murphy <robin.murphy@arm.com>
> > > > Link: https://lore.kernel.org/r/20201014081857.3288-1-ardb@kernel.org
> > > > Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> > > > Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> > > 
> > > Forgot to update the patch subject, but this one is for 5.10.
> > 
> > You also forgot to tell us _why_ this is needed :(
> 
> This is explained in the second part of the first paragraph:
> 
> The consequence of this is that the randomization offset may be chosen such
> that any hotplugged memory located above memblock_end_of_DRAM() that appears
> later is pushed off the end of the linear region, where it cannot be
> accessed.
> 
> We use both memory hotplug and KASLR on our systems and that's how we
> eventually found out about the bug.

And you still have 5.10.y ARM64 systems that need this?  Why not move to
a newer kernel version already?

Anyway, I need an ack from the ARM64 maintainers that this is ok to
apply here before I can take it.

thanks,

greg k-h

