Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD284F9D0E8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 16:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ulLOFji6SKxaUiK7THMkr+37xvXXbrRxtZAw3C6KkOE=; b=FSc6lB7Ln8hjVldfHGt2iBLCpr
	arK0DPDQ4NBobfHCsaQuMSUNN4QuZgUVDWJapZZyNv2F9feK7Qcwb8qRtlY0vmRqkwXR4JEYWFqc8
	7589yak/0jLMeGjbIN5zBYNlsDQGPP3lHHcfH2r245pdq1bCnOd6kZz435XYamsdaVbcJHBnsLf06
	Mfh8a47K8hSSgDM5yeDI6m6XW6n0dT1vzJ+Z+RhlRGm/DK1qnc+r21FxjblnfV0N6JBd+4vAnetL6
	/se2brpY08MnKGNfMnqi4qSfieNELjDQHcr34SnliJ84Rz/sF44nzOXhPAmfMLIrGgK5TQLo5tnAc
	xOnvMXKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCgu0-000000001wl-2ZRc;
	Tue, 14 Apr 2026 16:46:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCgtx-000000001wM-3uNN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 16:46:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 127C74521;
	Tue, 14 Apr 2026 09:46:06 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0C20F3F641;
	Tue, 14 Apr 2026 09:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776185171; bh=16pb6KLi+++M3ZqOyN+jvU0dPCTd8Gdsh1FMrIuIiQ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a2JEQqAQaG3kDpEKeXjDkbbui1cfzz00+HGMz3lWZhh7xjvJu9/vNBNk0XAbvzsGO
	 bg116VQPIierhXtLi86akaK+E6XrTGSdg969zmjYvw53WpXgHO+HFkKcuEJh1d3LDo
	 BrKPq4RaS1vMIVxwXUBnagI7pHh/YoPy1Ocp0Ax0=
Date: Tue, 14 Apr 2026 17:46:06 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Kameron Carr <kameroncarr@linux.microsoft.com>
Cc: will@kernel.org, suzuki.poulose@arm.com, steven.price@arm.com,
	ryan.roberts@arm.com, dev.jain@arm.com, yang@os.amperecomputing.com,
	shijie@os.amperecomputing.com, kevin.brodsky@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] arm64: mm: support set_memory_encrypted/decrypted
 for vmalloc addresses
Message-ID: <ad5vTmfDWSAVrLab@arm.com>
References: <20260406213317.216171-1-kameroncarr@linux.microsoft.com>
 <adjZpFIgXQYOvyTq@arm.com>
 <001301dcc932$21cb6d80$65624880$@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <001301dcc932$21cb6d80$65624880$@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_094614_334801_51CAA366 
X-CRM114-Status: GOOD (  25.63  )
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

On Fri, Apr 10, 2026 at 02:36:42PM -0700, Kameron Carr wrote:
> On Friday, April 10, 2026 4:06 AM, Catalin Marinas wrote:
> > Could you give more details about the user of set_memory_decrypted() on
> > vmalloc()'ed addresses? I think this came up in the past and I wondered
> > whether something like GFP_DECRYPTED would be simpler to implement (even
> > posted a hack but without vmalloc() support). If it is known upfront
> > that the memory will be decrypted, it's easier/cheaper to do this on the
> > page allocation time to change the linear map and just use
> > pgprot_decrypted() for vmap(). No need to rewrite the page table after
> > mapping the pages.
[...]
> In this use case, whether to decrypt the memory can always be known at
> time of allocation, so a solution like GFP_DECRYPTED is an option.
> 
> I think I found the hack you mentioned
> (https://lore.kernel.org/linux-arm-kernel/ZmNJdSxSz-sYpVgI@arm.com/). The
> feedback in Michael Kelley's reply covers the key considerations well.

Yes, that's the thread. It started originally as a GICv3 need
(eventually we went for genpool).

> He likely had netvsc's use of vmalloc in mind when he made the point
> "GFP_DECRYPTED should work for the three memory allocation interfaces and
> their variants: alloc_pages(), kmalloc(), and vmalloc()." His other
> points already cover the concerns I had in mind around handling errors
> from set_memory_decrypted()/encrypted(), etc.
> 
> What is the current status of your proposed GFP_DECRYPTED implementation?
> Is this something you are actively working on?

Not really. But I've been looking at it again and I think it adds more
problems than it solves. A GFP flag would be passed down to
kmem_cache_alloc() and confuse the slab management if some pages are
encrypted, others not for the same kmem_cache (SLAB_NO_MERGE wouldn't
help). I wonder whether something like SLAB_DECRYPTED would work better
for this if we really need it (not aware of any user though).

Anyway, let's ignore slab for now and look at vmalloc(). I can see
hv_ringbuffer_init() using an explicit vmap(pgprot_decrypted()). While
you could do this, it might be better to just add a VM_DECRYPTED flag
and a few wrappers like vmalloc_decrypted(). It would call
set_memory_decrypted() for the allocated pages and use
pgprot_decrypted() for vmap. On vfree(), it will have to set the pages
back to encrypted. It should be fairly mechanical to do (or a 5 min job
for an LLM ;)).

-- 
Catalin

