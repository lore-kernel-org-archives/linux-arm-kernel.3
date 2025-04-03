Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4343C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 06:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PISLU56ZkvMlIZrjFNEHkFMuuADS/mIkd+ouBkO3DKY=; b=R22SVThMwS1UquqwyAnsw9IAZv
	I6ZIvUxEIDFQpGgjFD8F0I5sU2Mt0SPlw5sjpUMuJ8eg/kyky30fqMVh43G5TreLOnbGARf13BeXO
	6qaKROsjWNja4y583yW4T9DymoPe5RW4HgAIi44mGwwsK4XCOpQbIWF1zZ8tAASPQ1ydlR+FbpLrN
	6N+vB0OcUwXPhIHYce8Z7AH1l44fWhkNsPUfqb6WLWYX/CbcBnajcAkDwk7HFtfhUtHcOaYuqx/7L
	Ghs3HA2csuJbfy9rAq8wTkncpzPoudAh2ybHoIXHm19adFKnrKxTZuWa2E1t994YElTp1y7kndte7
	oWCR1jHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0E4Q-00000007vHs-06MI;
	Thu, 03 Apr 2025 06:28:58 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Dzp-00000007ul4-1SeO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 06:24:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B66DCA46466;
	Thu,  3 Apr 2025 06:18:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8FC1C4CEE3;
	Thu,  3 Apr 2025 06:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743661452;
	bh=GFvYpsXQvk6dxCYwoiQKJ2z5FTbh5QigoUHrYN255FY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eZTi5DzqiJVNB71Vp/b930nyv5R8JfheUpK2OUGe1zHqos2M5ckAZcuY0uXHL+/jk
	 DSAAIg82wRixkfZy/2bZhUh+HAAZDTqK0vEmPAmIFDiAjRd96Xtx2ls9KkfsPID+oq
	 yDy2IYeCxaPpeVO8BgDj9OlUi6pQCcf1/W0Z/BzTxB0WQ2VuG0AoR97Di3EEjiqSao
	 3UnxDWVvLXaRZ7uIyV+YaV+/A8m8fGzIkYCHF6NIaiQaNstSr2tbbe6ojUUSuralnr
	 RFoqPo9+1Q3ynv4rcDpmUZeo8pqV2XWrpmPAIQtuFxMggirlmwSUAbODKTzgr4/vbo
	 WjKfBlqSGs4UA==
Date: Thu, 3 Apr 2025 09:24:04 +0300
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
Message-ID: <Z-4phOInXZlxFwk9@kernel.org>
References: <Z-vn-sMtNfwyJ9VW@kernel.org>
 <20250402201841.3245371-1-dwmw2@infradead.org>
 <20250402201841.3245371-3-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402201841.3245371-3-dwmw2@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_232413_448025_02EE51F4 
X-CRM114-Status: GOOD (  20.69  )
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

On Wed, Apr 02, 2025 at 09:18:41PM +0100, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Introduce a pfn_first_valid() helper which takes a pointer to the PFN and
> updates it to point to the first valid PFN starting from that point, and
> returns true if a valid PFN was found.
> 
> This largely mirrors pfn_valid(), calling into a pfn_section_first_valid()
> helper which is trivial for the !CONFIG_SPARSEMEM_VMEMMAP case, and in
> the VMEMMAP case will skip to the next subsection as needed.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

with a small nit below

> +static inline bool first_valid_pfn(unsigned long *p_pfn)
> +{
> +	unsigned long pfn = *p_pfn;
> +	unsigned long nr = pfn_to_section_nr(pfn);
> +	struct mem_section *ms;
> +	bool ret = false;
> +
> +	ms = __pfn_to_section(pfn);
> +
> +	rcu_read_lock_sched();
> +
> +	while (!ret && nr <= __highest_present_section_nr) {

This could be just for(;;), we anyway break when ret becomes true or we get
past last present section.

> +		if (valid_section(ms) &&
> +		    (early_section(ms) || pfn_section_first_valid(ms, &pfn))) {
> +			ret = true;
> +			break;
> +		}
> +
> +		nr++;
> +		if (nr > __highest_present_section_nr)
> +			break;
> +
> +		pfn = section_nr_to_pfn(nr);
> +		ms = __pfn_to_section(pfn);
> +	}
> +
> +	rcu_read_unlock_sched();
> +
> +	*p_pfn = pfn;
> +
> +	return ret;
> +}
> +
> +#define for_each_valid_pfn(_pfn, _start_pfn, _end_pfn)	       \
> +	for ((_pfn) = (_start_pfn);			       \
> +	     first_valid_pfn(&(_pfn)) && (_pfn) < (_end_pfn);  \
> +	     (_pfn)++)
> +
>  #endif
>  
>  static inline int pfn_in_present_section(unsigned long pfn)
> -- 
> 2.49.0
> 

-- 
Sincerely yours,
Mike.

