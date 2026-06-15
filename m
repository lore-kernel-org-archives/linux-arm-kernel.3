Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 408A0CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 12:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yPWsw0AQ+8ETl/LxiKcoFdE+zv5BWN43KLzjcHQPL3E=; b=jSuAYOGWdVd6OEuUtULipcslfc
	CxN/TLfMqoVQJIBKaqKdlnipfuvojx8S/2O0urnF9CSDTj2RbPbwH+ZMi7f99Dp1nfM5O5gpLqYIJ
	B1U7FcsdIO0EsrcdDxQA8eACuerFChWDWeAZUHLf21Pe94uVx1F53L4+S24noMXdwcDCQhqkqW4d2
	EJaAbvAgxFI+7rDJ2A0ZbdAgywc3eAKIbYeBnSEPdZ7i4AIY9rlKYMymxkwv2G71nqkGir/6mutTl
	zO1ZEV94VmLw/KxhZX7p8+pxzalwjLCY+oDcF9dwNjd1jUQ6hX72iqERZiS/0s1WflgWEUXi7fD44
	zZSzxlJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6be-0000000EDk9-3wnB;
	Mon, 15 Jun 2026 12:39:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6bc-0000000EDji-2Scu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 12:39:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 491F1328D;
	Mon, 15 Jun 2026 05:39:48 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0CA0E3F905;
	Mon, 15 Jun 2026 05:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781527193; bh=kZSBouNcgnBKWX0ECo7+eUKRe/z+K7axYFcWodvnhBw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JRNf79MXpqjApZZXUVdA9wGEyQos1t68Tfoa2qQ7tD3B6+DCxRac7U3Tydcim2vGE
	 Afoc0+WDGwe+5a2bHVuij3dPo35+QjA1Tdg82+2Y8IdSO0OfRSeSLuvRcmvcLzwuEx
	 dXiy/HxHyW02zBa9i/kKSTshoBAkr1S4ErzsvkwQ=
Date: Mon, 15 Jun 2026 13:39:43 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Linu Cherian <linu.cherian@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	Huang Ying <ying.huang@linux.alibaba.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: tlbflush: Don't broadcast if mm was only
 active on local cpu
Message-ID: <ai_yj7GA_q1hD9cr@J2N7QTR9R3.cambridge.arm.com>
References: <20260523134710.3827956-1-linu.cherian@arm.com>
 <ai6KzFgfMAxqplcr@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ai6KzFgfMAxqplcr@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_053956_782430_17D428D1 
X-CRM114-Status: GOOD (  18.28  )
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

Hi Will,

On Sun, Jun 14, 2026 at 12:04:44PM +0100, Will Deacon wrote:
> On Sat, May 23, 2026 at 07:17:10PM +0530, Linu Cherian wrote:

> >  static inline void flush_tlb_mm(struct mm_struct *mm)
> >  {
> >  	unsigned long asid;
> > +	bool local;
> >  
> > -	dsb(ishst);
> > +	local = flush_tlb_user_pre(mm, TLBF_NONE);
> >  	asid = __TLBI_VADDR(0, ASID(mm));
> > -	__tlbi(aside1is, asid);
> > -	__tlbi_user(aside1is, asid);
> > -	__tlbi_sync_s1ish(mm);
> > +	if (local) {
> > +		__tlbi(aside1, asid);
> > +		__tlbi_user(aside1, asid);
> > +		dsb(nsh);
> > +	} else {
> > +		__tlbi(aside1is, asid);
> > +		__tlbi_user(aside1is, asid);
> > +		__tlbi_sync_s1ish(mm);
> > +	}
> > +	flush_tlb_user_post(local);
> 
> I think you've changed this since Ryan's original patch, but why are you
> only calling __tlbi_sync_s1ish() for the !local case? Doesn't that break
> the erratum workaround when running as a VM if the vCPU is migrated?

The errata mitigated by __tlbi_sync_s1ish() only affect broadcast
maintenance (the 'ish' in the name was intended to convey that). No
workaround is necessary for local TLB maintenance; aside from anything
else, when some PE executes the DSB to complete the maintenance, that
DSB alone is sufficient to complete memory accesses made by that PE.

If it would make things clearer, we could add a __tlbi_sync_s1nsh()
helper for the local case, which would boil down to a DSB NSH.

Regardless of the erratum, to correctly handle a vCPU being migrated
from pCPU-x to pCPU-y, we rely on:

* The host to set HCR_EL2.FB to ensure that TLB maintenance is
  broadcast to the ISH domain.

* The host to set HCR_EL2.BSU to ensure the DSB is upgrade to ISH such
  that any guest-issued DSB NSH will it can complete any TLB maintenance
  that was upgraded to ISH.

* The host to issue a DSB ISH on pCPU-x before the vCPU can run on
  pCPU-y, to complete any outstanding maintenance that was issued on
  pCPU-x. IIUC a DSB ISH on pCPU-y is not architecturally sufficient; it
  must be executed on the same CPU which issued the TLB maintenance.

... but as above, all of that should be independent of any of the errata
that require the workaround.

Mark.

