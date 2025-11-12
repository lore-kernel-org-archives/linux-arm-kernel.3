Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91197CD3428
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 17:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UH00cLBOgn6XmQGO+qGldoVEAxQ8CjDrPyUc2vYa1vE=; b=3fHa/pvUl7eA9/RckGuqJHgWcl
	sNHhX6Y+GbxsWauSj0t3JsCrQPUBIVfMWsVMfb4XHnQEmhAIXrgBIPslzJ/cwn1mdc65iFN5fh9i3
	HK9vFjOWO114nCEuKquXYm/ea4H++8ZkkGYCF3ePreuQ9EJiSfv8ej8+tJc0yKep0leKLSgDzgkqT
	LnT28DDxYiNILqCqXDbdxsIZjPLwrrcwxW/0b9AA3mAg2gFvGP7ysZv55BNqNZke2usgqc7tE1hNW
	xPCttsThG7W6ZayZNPobGyu1mPdPjGiuedl64ByxDtaxtHzSPIA6X+GnP9pzT5nDJL0zEiLJL+UoD
	1xHypLMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJENC-00000009Dyn-1dIJ;
	Wed, 12 Nov 2025 17:11:10 +0000
Received: from gentwo.org ([62.72.0.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJEN6-00000009DyG-3V0R
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 17:11:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1762967462;
	bh=UH00cLBOgn6XmQGO+qGldoVEAxQ8CjDrPyUc2vYa1vE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jSImEvu1baT55TI/QIpvgq9TDLhb8ObaPYxF3D8AhV7cvnEKHAXjo6QZHuPknsZPz
	 UKZkydOyvmgakn6c9K7uIF3VxhsIpWRB+QT60jSgps2zyzCCX9q1GQ2mb3LjLNFkXM
	 cMOWOAGpJojODwN5tSKzpwkDjXw3OtyKBKsqEA/s=
Received: by gentwo.org (Postfix, from userid 1003)
	id 5E65C40251; Wed, 12 Nov 2025 09:11:02 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id 5BF874010D;
	Wed, 12 Nov 2025 09:11:02 -0800 (PST)
Date: Wed, 12 Nov 2025 09:11:02 -0800 (PST)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: Ryan Roberts <ryan.roberts@arm.com>
cc: Yang Shi <yang@os.amperecomputing.com>, catalin.marinas@arm.com, 
    will@kernel.org, linux-arm-kernel@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [v2 PATCH] arm64: mm: show direct mapping use in /proc/meminfo
In-Reply-To: <3af5d651-5363-47f7-b828-702d9a0c881c@arm.com>
Message-ID: <a6eec165-9c48-56aa-8b05-6bf73411e4bf@gentwo.org>
References: <20251023215210.501168-1-yang@os.amperecomputing.com> <3af5d651-5363-47f7-b828-702d9a0c881c@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_091104_916655_D158C633 
X-CRM114-Status: GOOD (  18.99  )
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

On Wed, 12 Nov 2025, Ryan Roberts wrote:

> I have a long-term aspiration to enable "per-process page size", where each user
> space process can use a different page size. The first step is to be able to
> emulate a page size to the process which is larger than the kernel's. For that
> reason, I really dislike introducing new ABI that exposes the geometry of the
> kernel page tables to user space. I'd really like to be clear on what use case
> benefits from this sort of information before we add it.

One is user space where you want to "emulate" other page sizes and the
other is kernel space.

The per process page size is likely going to end up
being a per VMA page size since these address spaces can be shared and the
VMA is already containing information about huge pages, memory policies
and other stuff relatd to memory layout. And yes it would be great to have
an accounting of the page sizes used in a VMA.


> nit: arm64 tends to use the term "linear map" not "direct map". I'm not sure why
> or what the history is. Given this is arch-specific should we be aligning on the
> architecture's terminology here? I don't know...

Other architectures are already exposing this data via the terminology
used here. The information is useful for seeing if there is an issue with
small pages that could be impacting kernel performance. It is surprising
coming from oter architectures that this information is not readily
available.


