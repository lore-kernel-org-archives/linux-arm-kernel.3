Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC4BD2F033
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 14:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7VhVYjAL+9B/5gShYMZ4DL4GYoMJtixTu4K7JK6MEVM=; b=0G704fhngyGQBft2YbnJ2iljCK
	VGrlFMlSYZcu9z1Tb7fLBD5eT0TQ2uVFQ0wNkcRrf21hyBNBovm3I3B52cq1ParKCSHTy/SdOuXZ7
	CDLHfz1aCketb2s0i5jGM/d4wUzWLkbZUhksVkavCpc5XaBbgLnR6kUY8OY9QK1LJOFPbtDhazrjQ
	0DrbkUS9ATDhTTKpDdnUuHooAz00vG9jpMJleFxFyhOyU5ArXvLqsZuztonpBPXcfxbMIOyJ/Uo7h
	5jP/zrQmOmaYnGGFIGEUuzaoapHYiYA7vQzeg8cMUrkZyOXAFJxKUmq3SCGj6wp/ed9rOZCiw4db2
	3E1Xk7lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkjk9-0000000EMYr-2X0y;
	Tue, 27 Jan 2026 14:08:33 +0000
Received: from sinmsgout02.his.huawei.com ([119.8.177.37])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkjk5-0000000EMXn-1z2A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 14:08:32 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=7VhVYjAL+9B/5gShYMZ4DL4GYoMJtixTu4K7JK6MEVM=;
	b=metBWbtUdCsraqZM8TdPcGgtLBdcSkktI4ukGcjUaURF+l1pCsvjXbZap2TcnTZZ4QZGKbos2
	MovR4sky54CtHJsFrbg6y2dANAcRljo3+UORhXstCwvC5aRD6chXTEMBsPePnRfsdjKd4lzpBth
	EeQBoPY5S31gJayW3th1+pU=
Received: from frasgout.his.huawei.com (unknown [172.18.146.33])
	by sinmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4f0nHf4dQYz1vnyV;
	Tue, 27 Jan 2026 22:05:50 +0800 (CST)
Received: from mail.maildlp.com (unknown [172.18.224.107])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4f0nKq0nd2zJ46cX;
	Tue, 27 Jan 2026 22:07:43 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id 1F23340571;
	Tue, 27 Jan 2026 22:08:19 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 27 Jan
 2026 14:08:18 +0000
Date: Tue, 27 Jan 2026 14:08:16 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Ryan Roberts <ryan.roberts@arm.com>
CC: Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, Linus
 Torvalds <torvalds@linux-foundation.org>, Oliver Upton
	<oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, "Dev Jain"
	<dev.jain@arm.com>, Linu Cherian <Linu.Cherian@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 12/13] arm64: mm: Wrap flush_tlb_page() around
 ___flush_tlb_range()
Message-ID: <20260127140816.00001b43@huawei.com>
In-Reply-To: <8184baab-8774-4a73-8cee-d8d3e22553c0@arm.com>
References: <20260119172202.1681510-1-ryan.roberts@arm.com>
	<20260119172202.1681510-13-ryan.roberts@arm.com>
	<20260127125933.00006101@huawei.com>
	<8184baab-8774-4a73-8cee-d8d3e22553c0@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100009.china.huawei.com (7.191.174.83) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_060831_162277_2C1855EF 
X-CRM114-Status: GOOD (  35.68  )
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

On Tue, 27 Jan 2026 14:03:43 +0000
Ryan Roberts <ryan.roberts@arm.com> wrote:

> On 27/01/2026 12:59, Jonathan Cameron wrote:
> > On Mon, 19 Jan 2026 17:21:59 +0000
> > Ryan Roberts <ryan.roberts@arm.com> wrote:
> >   
> >> Flushing a page from the tlb is just a special case of flushing a range.
> >> So let's rework flush_tlb_page() so that it simply wraps
> >> ___flush_tlb_range(). While at it, let's also update the API to take the
> >> same flags that we use when flushing a range. This allows us to delete
> >> all the ugly "_nosync", "_local" and "_nonotify" variants.
> >>
> >> Thanks to constant folding, all of the complex looping and tlbi-by-range
> >> options get eliminated so that the generated code for flush_tlb_page()
> >> looks very similar to the previous version.
> >>
> >> Reviewed-by: Linu Cherian <linu.cherian@arm.com>
> >> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>  
> > 
> > So this does include the use of the
> > 
> > Case TLBF_NOBROADCAST from previous patch, but only whilst (I think)
> > slightly changing behavior.
> > 
> > Gah.  I'm regretting looking at this series. The original code is really hard to
> > read :)  Rather you than me to fix it!
> >   
> >>  static inline void flush_tlb_kernel_range(unsigned long start, unsigned long end)
> >>  {
> >>  	const unsigned long stride = PAGE_SIZE;
> >> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> >> index be9dab2c7d6a..f91aa686f142 100644
> >> --- a/arch/arm64/mm/fault.c
> >> +++ b/arch/arm64/mm/fault.c
> >> @@ -239,7 +239,7 @@ int __ptep_set_access_flags(struct vm_area_struct *vma,
> >>  	 * flush_tlb_fix_spurious_fault().
> >>  	 */
> >>  	if (dirty)
> >> -		local_flush_tlb_page(vma, address);
> >> +		__flush_tlb_page(vma, address, TLBF_NOBROADCAST);  
> > 
> > Ultimately I think this previously did __tlbi(vale1) and now does __tlbi(vae1)
> > Original call was to __local_flush_tlb_page_notify_nosync()  
> 
> No not quite; the new code is still doing __tlbi(vale1).
> 
> The trick is that the __flush_tlb_page() wrapper unconditionally adds
> TLBF_NOWALKCACHE to the flags. Since this API is operating on a *page* it is
> implicit that we should only be evicting a leaf entry (as per the old
> implementation).
> 
> You'll see I've also updated the documentation to make that clear in tlbflush.h.
> 
> Now that you have raised it, I can see how it might be confusing though, since
> __flush_tlb_page() does not explicitly have TLBF_NOWALKCACHE. We could require
> all __flush_tlb_page() callers to explicitly pass TLBF_NOWALKCACHE if you think
> that helps? It would still be implicit for flush_tlb_page() (the generic kernel
> API) though.

Ah. I'd indeed missed that tweaking of the flags.

Not sure. You probably have a better feel for this ABI than I do and the likely
expectations of users.

J

> 
> > 
> > I'd like to see that sort of change called out and explained in the patch description.
> > It's a broader scoped flush so not a bug, but still a functional change.  
> 
> As I say, the emitted code is the same. It's my new API that's the problem here...

> 
> Thanks,
> Ryan
> 
> >   
> >>  	return 1;
> >>  }
> >>    
> >   
> 
> 


