Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 602D0CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 17:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=obs5QabdERcPxLnjJp0UEyjNC2ZFr2WFHzRj7Dz361U=; b=iOH7cy2elA57vpiRy90a6AaqiW
	cwW+sScsL6dSSBe1/ZT8uGU4+UCwhXgBJTfqNgpw99y9bAzVj2HcwPs10yjrvsxyM447YRp96aIg+
	7pB4smMttAteybWE517yXzD06TaLp8Ex4OOHfaJxgsRSvqbtE+9RbjtuMV9X/bVOPPAC2ATL0AIIE
	eENY+9/MYPoLoSSluyM+cBNJdUJBsIlTyUUGiyVPob9kIN72nEnv+v2JRGVeeAAPLUNiGQwVNZBPB
	aEPC/PY+NU4uAPRGqgl/7BpvFs7gQwxBvNBA9mqgGPRFpD5HogDXm97y+ZmW8ZNMDM1h6zB9KHSkm
	Yd8m78jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGgvN-0000000E8DB-1MWb;
	Wed, 05 Nov 2025 17:03:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGgvK-0000000E8CY-1R3w
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 17:03:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BC43B44318;
	Wed,  5 Nov 2025 17:03:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7475AC4CEF5;
	Wed,  5 Nov 2025 17:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762362232;
	bh=fg8T6HLm59/38dJ+JLRKlWSwFCUyza7TxNKcYtn9qTc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oqdTQMEpi2Ckqu0wfUfjkgZ2N/CsHg3nchqrCOWiqlI5Lm+SoWMDuo1Qvs7w2GYda
	 wo6oU2hbtYFYsvlS1VYTAJ0tdkxXsyOsK5RvOYEIUlVkvwtAqAdHUqZ5IqkoihrMc3
	 m6iFlsk6vbN/fkpS0UH839f2gSKLGzT9qO+Fj6Zv9xaZSK/s29nByz9Y42RTIYR7Bo
	 okwduZ3FHNzw8oaqW8wOdLx72JNesjcaLIDWuupT9/AUM2ZKczMAgOLmZNZ0zMvW3n
	 FCq8vnik0cRJUMgP/JBaiL2NpSXKlq5FNN2UgMjNQa1phl6zF+2do2Jk0CE8IooHhV
	 g+wXBR0QEOawQ==
Date: Wed, 5 Nov 2025 17:03:48 +0000
From: Will Deacon <will@kernel.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, ryan.roberts@arm.com,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/mm: Add a fallback stub for pgd_page_paddr()
Message-ID: <aQuDdE_Tj3di7q3P@willie-the-truck>
References: <20251014110633.304961-1-anshuman.khandual@arm.com>
 <aQoORmgliayA0s_a@willie-the-truck>
 <e660e033-6300-4deb-b034-4d26746d8d01@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e660e033-6300-4deb-b034-4d26746d8d01@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_090354_425814_5E2315D0 
X-CRM114-Status: GOOD (  15.96  )
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

On Wed, Nov 05, 2025 at 08:24:40AM +0530, Anshuman Khandual wrote:
> On 04/11/25 8:01 PM, Will Deacon wrote:
> > On Tue, Oct 14, 2025 at 12:06:33PM +0100, Anshuman Khandual wrote:
> >> Add a fallback stub for pgd_page_paddr() when (PGTBALE_LEVELS <= 4) which
> > 
> > typo
> 
> Sure will change - s/Add/Adds
> > 
> >> helps in intercepting any unintended usage and which is also in line with
> >> existing stubs for similar [pud|p4d]_page_paddr() helpers.
> > 
> > Are you saying the kernel compiles in this case without your patch? Which
> > definition of pgd_page_paddr() does it end up using?
> 
> Kernel compiles for PGTBALE_LEVELS <= 4 just fine without this patch as both
> its current users p4d_offset_phys() and p4d_offset_lockless() are wrapped in
> with PGTBALE_LEVELS > 4.

Ok, but your patch is trying to catch broken users of the macro, right?
So my question is, would such a user compile today? If not, then your
patch is pointless.

Will

