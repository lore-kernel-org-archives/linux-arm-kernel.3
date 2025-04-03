Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 955B6C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 14:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M5hjQBOOXSibuiDnMLaol/6Mg3J87NueN56dAc55I0E=; b=JpTtOY8Tf2eFHzMJwhZlZrLoo3
	y9ypcSUYX1Lyf82zs9LK6Zy2PmkgR/aF/TnJy7Hsszd2TAE6UDaWcKL2xxOjsxqj/HNFWNY90qBsm
	APZaTrKZ4YFZji7ryNi883pO42OiYitQxmdsrleoTEtTpl7qHcYlkASWGy5shNxSoZe2wN0F43kbv
	Xa75pHqznBP+CUeS8n2GTdBuPTyFJuxvMrYB67izUV5NkdlGh2x4Mb3KqRAG16EdgtUtZt0piOgcL
	5SKmalxPgP/SdnVegPxkkvoZIVOphe4+lDuJ4KZ3diingUU56q2wQ7ZGfmhrU9yhipUv+F+xx/gL9
	4JPnXqdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0LdA-000000095Gz-30gi;
	Thu, 03 Apr 2025 14:33:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0LVM-000000093qi-0NxV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 14:25:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5F95268431;
	Thu,  3 Apr 2025 14:25:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 908ADC4CEE3;
	Thu,  3 Apr 2025 14:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743690315;
	bh=tkMdYu9t5824/EU4dyTb0cxwDhM/gxde1CbSplGldzM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ka40iZjPw89KP7aEPQCTzPyRorfgRmK7zTLjMQrT4UuOS8V2Bbk/H20fNhAlXnUvt
	 mOAyIGNrj/h0x0BxRGyLZ3CLoNKMQ4UKu2PcRBnC98hblDubLwHjV5NTv/ZiQ2xggF
	 bydhXqc2xYMsTTG5PBELGVSAomByAJbFYT1KsFupzIsBPw0MJ8YybS0T2xAOb2uYwU
	 LHnoy8zABqx9FxwcvkcCzb+aWKu4BWGaQuzCpzq3Z2lG5GToYbBTt41AAD8bOZfF50
	 Xjg49Bl0RfFtF77JKdgvgirBQlNJL/qgQFCxudletSKhQ+MJ76sO5fJBVD2pnuUgf1
	 SGTkEH3ZqJ1fg==
Date: Thu, 3 Apr 2025 17:25:06 +0300
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
Message-ID: <Z-6aQjOB_aU4CEAp@kernel.org>
References: <Z-vn-sMtNfwyJ9VW@kernel.org>
 <20250402201841.3245371-1-dwmw2@infradead.org>
 <20250402201841.3245371-3-dwmw2@infradead.org>
 <Z-4phOInXZlxFwk9@kernel.org>
 <e465ba32fb34b31eddb18890587960671b73234f.camel@infradead.org>
 <380d9bff359150f67ca6e0468f99ee746c1abdea.camel@infradead.org>
 <Z-6XexJWecbxnrmK@kernel.org>
 <0d89238f3ad9444abfc905a79ff14388a61cf00d.camel@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0d89238f3ad9444abfc905a79ff14388a61cf00d.camel@infradead.org>
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

On Thu, Apr 03, 2025 at 03:17:44PM +0100, David Woodhouse wrote:
> On Thu, 2025-04-03 at 17:13 +0300, Mike Rapoport wrote:
> >  
> > > static inline bool first_valid_pfn(unsigned long *p_pfn)
> > > {
> > >  	unsigned long pfn = *p_pfn;
> > >  	unsigned long nr = pfn_to_section_nr(pfn);
> > >  	struct mem_section *ms;
> > > 
> > >  	rcu_read_lock_sched();
> > > 
> > >  	while (nr <= __highest_present_section_nr) {
> > >  		ms = __pfn_to_section(pfn);
> > 
> > Maybe move the declaration here:
> > 
> >  	struct mem_section *ms = __pfn_to_section(pfn);
> 
> Ack.
> 
> https://git.infradead.org/users/dwmw2/linux.git/shortlog/refs/heads/for_each_valid_pfn

Fine with me, keep the RB tag :)


-- 
Sincerely yours,
Mike.

