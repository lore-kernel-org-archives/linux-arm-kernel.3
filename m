Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F64C369DF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 13:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N6fHhtjcBZpuOYWBsN/5sB6z9sHIqXhlpjXGXRLMRO0=; b=LGswulWZLV24LgyxYGvPo9uLbO
	VeOqu/VM3msLtclSxSxmPMWjJ4L4X8rz0D+F1AfWXB0WcVEQHUGlNqlxeQUtqpxSma5/6szWp71L2
	zs552Q5Me5lSug9r49L6ox0cj5G4pnoKnScvBGW9l+7fv7isyBwUd20rTk1HrbOWp/Y9qj97JXJt9
	YhNs6oHKZ90Hb6z5YU81Y9fcgP/4ltG26X6QXJbEayLrYaV2oPHfc18HlsxeycjHxerRIALsm8Roe
	RE+sZ8/bnPuySDQyRp+IUiqUEEKb5lClH0Mdch+1lMe3GSrebGCwKi9OjmFOGs5vPRDq30uUR2U8+
	z/2h1j+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7ZnA-0000000AXBv-3nAR;
	Wed, 23 Apr 2025 13:05:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Y2b-0000000AHDP-41pg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 11:13:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 619BC614BF;
	Wed, 23 Apr 2025 11:13:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EAD1C4CEE2;
	Wed, 23 Apr 2025 11:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745406800;
	bh=fA+f5UwY4/94EsfucC8UNHh1rFGwKUGh2EpB+I1y004=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KNaYzo/Y1hJLK99y9Ik0HJC+ABzoSS/XiSJFQSlgO+9qO+enerwNq4LALCmEnwhy8
	 Co8tNVVWkiFTEpZoW3EUE31ob8nczRas95qpZyo3oBT0UJ0nb6btLjk7DRn7FXxQbe
	 F5VaGjtsf9mQoKruHPmXH3mjkc9tFQ/lxB92GRFfVkW7htLuXKhZuJuc/GKRzIQ6VP
	 s2zN2IcfMVmWBR4qUaW/61daEtGeycH71JUHpSshm4AfSZG7v4HrXm7mMQoP3SZR3J
	 wQPY3sbRA6/oNJtcrxAhvvlGelPMfjo4qBLa9rjqgabaXqX8Ht7pT0MwDB2zA4HsnW
	 inALIxXeMAVNA==
Date: Wed, 23 Apr 2025 14:13:11 +0300
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
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Ruihan Li <lrh2000@pku.edu.cn>
Subject: Re: [PATCH v3 5/7] mm, x86: Use for_each_valid_pfn() from
 __ioremap_check_ram()
Message-ID: <aAjLR4b6qsmzfRdw@kernel.org>
References: <20250423081828.608422-1-dwmw2@infradead.org>
 <20250423081828.608422-6-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423081828.608422-6-dwmw2@infradead.org>
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

On Wed, Apr 23, 2025 at 08:52:47AM +0100, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Instead of calling pfn_valid() separately for every single PFN in the
> range, use for_each_valid_pfn() and only look at the ones which are.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  arch/x86/mm/ioremap.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

-- 
Sincerely yours,
Mike.

