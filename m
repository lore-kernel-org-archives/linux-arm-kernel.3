Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2841CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Jun 2026 20:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cmUoJYqaVdVHGV7w7+TmyHFK+lvk5ocel9J4vmj8ogo=; b=pC8iI4l6m+jO3aNcuSUaIvl0El
	8ZtXHgSk7RAHRH+eBXEoBnT3ZQehojGLEwVV9FPd9l+K4TONf0OMkcS49AZH5aJNcBUaOnpPD+YYm
	Da1MX8HdmI4xb1mzi20kDOIb8qR/bLr9YFnKHGohKYM7jZwvJ3cGSbQh+5IO8r5DJnLM1t3RVUIlu
	lh+5e1yfq8nKeU571btq4PapttxBfcrO2fOnmovB31nnyFQhoiWf0GFftNurQ8vNx/waFU0e98mqg
	XWsk3jQAxz4WTk/AaAcy4cN7ahliDzKc7skfo5QAgVJkraAO0LOb0O8LOVIz30A7wPG+tk0mLyzUx
	UwGtvX4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYrSp-0000000DHIM-2dIu;
	Sun, 14 Jun 2026 20:29:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYrSn-0000000DHIG-39Yr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Jun 2026 20:29:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D7E4540138;
	Sun, 14 Jun 2026 20:29:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 931491F000E9;
	Sun, 14 Jun 2026 20:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781468988;
	bh=cmUoJYqaVdVHGV7w7+TmyHFK+lvk5ocel9J4vmj8ogo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aYDwSm0383Gdgkg6dRBN6iou+Hh0+xVWh+A7/C9B1O+WfdGdJs/gZ2xxZ2mZFqQrG
	 3GRC3iiE++STQf19+vmj//iQnB2GlGhRi+lVqeC7AsCA7kZ5cjkmM82H19CBDRqJ+v
	 NFX5jO1S62yAnh9albUSwgXsIezzCbzQIDdSGMJtQXUmHurn3+mujGe+NHrCLD+Swf
	 f03DFhawbt9ZfNXpmeI6X2iKBw6TxVY9Ggfv6WMi8WdlGrAx8slDoWior29fxjbHb8
	 I+CsDpirW6/7E/qUt620Y41Lb7Mpty/4i37thGO6YCOHJBUCkpuu4DRe8JCUN9cDbb
	 wbRQXOn7xHBSw==
Date: Sun, 14 Jun 2026 10:29:47 -1000
From: Tejun Heo <tj@kernel.org>
To: Will Deacon <will@kernel.org>
Cc: David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>, sched-ext@lists.linux.dev,
	bpf@vger.kernel.org, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/8] mm: Add ptep_try_set() for lockless empty-slot
 installs
Message-ID: <ai8PO0NThJeuQYzy@slm.duckdns.org>
References: <20260522172219.1423324-1-tj@kernel.org>
 <20260522172219.1423324-2-tj@kernel.org>
 <ai50IpfcvBiTZ7Ss@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ai50IpfcvBiTZ7Ss@willie-the-truck>
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

Hello,

On Sun, Jun 14, 2026 at 10:28:02AM +0100, Will Deacon wrote:
> > +/*
> > + * Note: strictly-zero compare is narrower than pte_none(), but the gap is
> > + * harmless: a fresh kernel PTE has no software bits set.
> > + */
> 
> This comment really confused me :/
> 
> What is a "fresh" kernel PTE and why do you specifically call out "software
> bits" if the CAS requires all 64 bits to be 0? Why is that narrower than
> pte_none() given that pte_none() for arm64 is:
> 
> #define pte_none(pte)           (!pte_val(pte))

Yeah, that's complete non-sense for arm. The comment is about x86's
pte_none() excluding DIRTY and ACCESSED due to an erratum when testing none
and how that doesn't matter here. This shouldn't have been copied to arm.
I'll send a patch to remove that.

Thanks.

-- 
tejun

