Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37049C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 14:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CnhMO1b6hRRnB93Fdjcwbr51m6r8ByhYTVJ6sKtTuAc=; b=uhCbKTjq6uvchUwLQCicK+e1Mn
	iSVphC8S4nyZSL2k9qkxXr6ivLlp8po15iWp20a+ec4p745IuycUaNvOsOIutSu5JQT9fJnGmq5wi
	hAc9MNxg6K3TbHxr6U6rgosuIWX0CUzY/1QWyrrvJO68FfxJeXelrvIvt+v6rFWbaL2Ejgq7h3cn8
	wo4VO26sIJTFwR4B4/z7Y3rqiRelu/P1eWzvZ1aBqw3SjKKL8ZIDT9bh4a+Bo0k+ZrEwaI2SUaCkE
	DqJmgoVu42yvB2hUrruWA4wOb39GfKbt3ApybKzYFfcvMEQtr97Rb7HLHiLCprJvDJoFcZ5873I/6
	j81JDfFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0LNF-000000092VC-1cl1;
	Thu, 03 Apr 2025 14:16:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0LJs-000000091t5-3QSz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 14:13:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8E8C05C553E;
	Thu,  3 Apr 2025 14:11:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 035D5C4CEE3;
	Thu,  3 Apr 2025 14:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743689603;
	bh=/vMOGYJHU3N99XcnouH6J7FcQMuSYe+/VfJBY8ovNzM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u+p6CC+gU0sA+GjrzK/KJv1pZ28LBj4hRjALrTyZbw16A9CGhfbMug7igY/rxzRQV
	 /UxPjojecDRtbWVa9Efjv/g53zKGzhNpDUKjjGnQASZSdl7kOxE8igx9mw2rZF9xGn
	 qOC3O+xLy7oMbLEd3bipPxt20w0LqK1DDp+tYASP14qVXo5x/dWpWB5Z+bObiOn5fJ
	 fhiDEWaGO7x88pGpdoPwWpg6g2Ayo9E+Ul12jTcJlwZ+wKu18rNwiZqAegeBqgbejr
	 OHS+kVO31Da0hKq1Q5oHfiw3AB6ttxEo+CXVCUvqa6mJyNYZpEhPpu19QyH+CxDtTl
	 BYxMrp7QrYYXw==
Date: Thu, 3 Apr 2025 17:13:15 +0300
From: Mike Rapoport <rppt@kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"Sauerwein, David" <dssauerw@amazon.de>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	David Hildenbrand <david@redhat.com>, Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mike Rapoport <rppt@linux.ibm.com>, Will Deacon <will@kernel.org>,
	kvmarm@lists.cs.columbia.edu, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [RFC PATCH 3/3] mm: Implement for_each_valid_pfn() for
 CONFIG_SPARSEMEM
Message-ID: <Z-6XexJWecbxnrmK@kernel.org>
References: <Z-vn-sMtNfwyJ9VW@kernel.org>
 <20250402201841.3245371-1-dwmw2@infradead.org>
 <20250402201841.3245371-3-dwmw2@infradead.org>
 <Z-4phOInXZlxFwk9@kernel.org>
 <e465ba32fb34b31eddb18890587960671b73234f.camel@infradead.org>
 <380d9bff359150f67ca6e0468f99ee746c1abdea.camel@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <380d9bff359150f67ca6e0468f99ee746c1abdea.camel@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_071324_927932_A7ED70C3 
X-CRM114-Status: GOOD (  19.43  )
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

On Thu, Apr 03, 2025 at 08:15:41AM +0100, David Woodhouse wrote:
> On Thu, 2025-04-03 at 08:07 +0100, David Woodhouse wrote:
> > 
> > I'll see if I can make it neater. I may drop the 'ret' variable
> > completely and just turn the match clause into unlock-and-return-true.
> > I *like* having a single unlock site. But I think I like simpler loop
> > code more than that.
> 
> That's better (IMO).
> 
> And I note that pfn_valid() already doesn't follow the modern fetish
> for having only one unlock site even when it makes the surrounding code
> more complex to do so.
> 
> static inline bool first_valid_pfn(unsigned long *p_pfn)
> {
> 	unsigned long pfn = *p_pfn;
> 	unsigned long nr = pfn_to_section_nr(pfn);
> 	struct mem_section *ms;
> 
> 	rcu_read_lock_sched();
> 
> 	while (nr <= __highest_present_section_nr) {
> 		ms = __pfn_to_section(pfn);

Maybe move the declaration here:

 	struct mem_section *ms = __pfn_to_section(pfn);

> 
> 		if (valid_section(ms) &&
> 		    (early_section(ms) || pfn_section_first_valid(ms, &pfn))) {
> 			*p_pfn = pfn;
> 			rcu_read_unlock_sched();
> 			return true;
> 		}
> 
> 		/* Nothing left in this section? Skip to next section */
> 		nr++;
> 		pfn = section_nr_to_pfn(nr);
> 	}
> 
> 	rcu_read_unlock_sched();
> 
> 	return false;
> }

-- 
Sincerely yours,
Mike.

