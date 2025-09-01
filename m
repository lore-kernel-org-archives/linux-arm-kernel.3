Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A64D2CA0FFF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 17:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zx2LRhRNtwc6qV8N+nwIDzHm6RjnubaCShJvOh3SKhY=; b=B7C+tnYc7l+8rmuDkcXz+9+DYz
	XT8xyGwV3jHEvFvaThG7f1ulte17dGyPUWMqsu9HJ+gNe159jknrOqEYRVgBKfG8yT3wrLe+hKdSY
	L08sEIY519BQkADjJeAkoCOSpcoqPJ5y9ScnxPOS9kNlHTEgJ88FtNk/KqL1sdNA9zGgrGePzHJaA
	dVpWT0XyzwGjWG3rRbGthBF/324UgfkXSiB3/UEHo4HtYF3qZuN1kaZbLB7w1o1UlsvpJskUrANTP
	G524ycKwwXc5zL3bwrn8xRezZ0C9f8mki3k1LT1k1vaub4I5hoMlYF7bQO9gJAdJg2QhuIaJcyiji
	wVXe/iUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut8am-0000000DUSd-2Kks;
	Mon, 01 Sep 2025 17:45:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut5Vq-0000000CpxT-3Aln
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 14:28:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6EED144C50;
	Mon,  1 Sep 2025 14:28:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AF62C4CEF0;
	Mon,  1 Sep 2025 14:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756736882;
	bh=79YhD1biW7ZRAbWexbw6r9UIo8+R0Ehi9QzCMPNdDb0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YzAQYKzYOdJ3Q71t1i2a14NKnIRG3n/WMD3ZFyAehHTZcJusoFFuNtDI2+HYZCtj4
	 wk4jXKHQxLBdQ/Wwob+BiDoE7bcA3zFC9B0eRyi7Kfl4+gmWXl8HuIHV2Af5e9fgwA
	 k9kw3BDo2FcbU50hWaofq1m8IK+QrX0RmYGl2DNtGvaotpXICnparE35Y4MV2Fgiq5
	 5DMOJp4CNBhGnYB20E8CWFZprn65hFKxKfRI0r2dTONJbvqIUGV2TGTOHgvLj0O5JQ
	 t5EmUEtJBtKDLedgo9+7Jmh8ty/H6KSolSb9QH8nHkMnNj4dqhY7W8+tFatLVLqv3G
	 4q+9NkXdezl/A==
Date: Mon, 1 Sep 2025 17:27:53 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "Roy, Patrick" <roypat@amazon.co.uk>
Cc: "ackerleytng@google.com" <ackerleytng@google.com>,
	"david@redhat.com" <david@redhat.com>,
	"Manwaring, Derek" <derekmn@amazon.com>,
	"Thomson, Jack" <jackabt@amazon.co.uk>,
	"Kalyazin, Nikita" <kalyazin@amazon.co.uk>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"seanjc@google.com" <seanjc@google.com>,
	"tabba@google.com" <tabba@google.com>,
	"vbabka@suse.cz" <vbabka@suse.cz>,
	"will@kernel.org" <will@kernel.org>,
	"Cali, Marco" <xmarcalx@amazon.co.uk>
Subject: Re: [PATCH v5 04/12] KVM: guest_memfd: Add flag to remove from
 direct map
Message-ID: <aLWtaZYi65aLtTAP@kernel.org>
References: <aLBtwIhQpX6AR2Z6@kernel.org>
 <20250901142220.30610-1-roypat@amazon.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250901142220.30610-1-roypat@amazon.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_072802_822624_BD1153FA 
X-CRM114-Status: GOOD (  20.77  )
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

On Mon, Sep 01, 2025 at 02:22:22PM +0000, Roy, Patrick wrote:
> On Thu, 2025-08-28 at 15:54 +0100, Mike Rapoport wrote:
> > On Thu, Aug 28, 2025 at 09:39:21AM +0000, Roy, Patrick wrote:
> >
> >>  static inline void kvm_gmem_mark_prepared(struct folio *folio)
> >>  {
> >> +     struct inode *inode = folio_inode(folio);
> >> +
> >> +     if (kvm_gmem_test_no_direct_map(inode))
> >> +             set_direct_map_valid_noflush(folio_page(folio, 0), folio_nr_pages(folio), false);
> > 
> > This may fail to split large mapping in the direct map. Why not move this
> > to kvm_gmem_prepare_folio() where you can handle returned error?
> 
> Argh, yeah, got that the wrong way around. Will update the error handling.
> 
> > I think that using set_direct_map_invalid_noflush() here and
> > set_direct_map_default_noflush() in kvm_gmem_free_folio() better is
> > clearer and makes it more obvious that here the folio is removed from the
> > direct map and when freed it's direct mapping is restored.
> > 
> > This requires to export two symbols in patch 2, but I think it's worth it.
> 
> Mh, but set_direct_map_[default|invalid]_noflush() only take a single struct
> page * argument, so they'd either need to gain a npages argument, or we add yet
> more functions to set_memory.h.  Do you still think that's worth it? 

Ah, right, misremembered that. Let's keep set_direct_map_valid_noflush().
 
-- 
Sincerely yours,
Mike.

