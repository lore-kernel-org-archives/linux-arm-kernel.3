Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1ADAC53219
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 10:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/JnmBgXxFDtCMN2wDB2IoufqkaTKn0f8mfPW/klL5BI=; b=iP0s7BzMGThpxEGWb1H1L/9OCP
	D5U7L+agHDvBIu6wdbYkv/ZjzolYgYC8Jg+pqRh6R3hJpCk7p66u8bo8yguEczV3QMmo1s1/tN2DO
	lwUSYhqu7i2fk3pDpsura6viRvgc0mh9NR/nseJW6ky4L9fdVsPt868SSYAqkIQ4WFc6Bjemkf0Gd
	b6M/zRm3WiFPnRfeMWYgdltooz4jqxDP6Nqih/J2tMApNuk0jdomZyET6muziBqmVBEq9caKURwAz
	kN2H3ecw/T2mxJCumFxXqgOu7HBQUby4W9uB5ZLDRbR8I9I/LcF5FgsN8FNf48hj3Bg2e8uf/7JiM
	bwinGosQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woITZ-00000002Tm7-1ri7;
	Mon, 27 Jul 2026 10:22:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woITY-00000002Tli-1oia;
	Mon, 27 Jul 2026 10:22:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B0081601EC;
	Mon, 27 Jul 2026 10:22:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5E151F000E9;
	Mon, 27 Jul 2026 10:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785147743;
	bh=/JnmBgXxFDtCMN2wDB2IoufqkaTKn0f8mfPW/klL5BI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gsYY3yMsnWmKGvnXvXG4cAJ9uYD/g70GCEZQyJYYALUaBP30DL0mK8UiL1pB/EbhK
	 nc+d8D//BvpV+fsOKUHm9FDZGks+LTCZNNnpygfauGfGDeviZ7a4Gqo4kdtWxeck/h
	 N5qCMmAK1Dz1wbvXTixVEc38OGcBuCgNrMt0sN0dX9WpHNIOzTARNfgEcid/hOxfeT
	 3z4xkHMzT2u5IB1Guj2HJz8xjNhJ7A/m+YluYaX2fPMRcTaMbRpym80eUIvDHQmf4G
	 ID4MUbBHhJPHP/6PWnOj7KYtY4zzJo2RU/OQ8P+F7MVjo8Q1DldhHmb47Hgfz1kxZd
	 WoAIbmR4uVBoA==
Date: Mon, 27 Jul 2026 13:22:09 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Borislav Petkov <bp@alien8.de>, linux-mm@kvack.org,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Lutomirski <luto@kernel.org>,
	Brendan Jackman <jackmanb@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>, Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev,
	x86@kernel.org, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH RFC 00/18] arch, mm: create a generic
 set_memory/change_page_attr core
Message-ID: <amcxUS95HBsQhvWn@kernel.org>
References: <20260721-generic-set-memory-v0-1-v1-0-2c1fc62306b3@kernel.org>
 <20260721171943.GEal-qLx4p5YbocQNV@fat_crate.local>
 <fa75382e-878a-4064-a9b1-43bd2c9dedce@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa75382e-878a-4064-a9b1-43bd2c9dedce@intel.com>
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

On Wed, Jul 22, 2026 at 10:03:03AM -0700, Dave Hansen wrote:
> On 7/21/26 10:19, Borislav Petkov wrote:
> > On Tue, Jul 21, 2026 at 07:23:23PM +0300, Mike Rapoport (Microsoft) wrote:
> >> Currently there are 6 independent implementations for set_memory and
> >> set_direct_map APIs.
> > So with all mm/x86/CPA patches flying around, can we first agree on which tree
> > is going to collect everything?
> > 
> > And if I want to review patches in that area, what am I applying it ontop?
> > linux-next perhaps...
> > 
> > Let's sort out the workflow first so that we don't get lost on fruitless bug
> > chases and fingerpointing.
> 
> Just practically, I think this series needs to be ignored for a bit. Bug
> fixes first, features and cleanups second.

Ignored is a bit strong, I'd still love to get feedback on the concept.
 
> When the time is right, it probably needs to get get acks from all the
> affected architectures and go through mm. Folks can ack it now, but I
> don't think anyone should even consider merging it until ~7.3-rc1.

FWIF, I didn't plan to send non-RFC version before 7.3-rc1.

-- 
Sincerely yours,
Mike.

