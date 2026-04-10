Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B170F364DB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 11:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y8NdNRGtwhtWcDNvSDVggpyHxQmncgqsTb92i4P+zdo=; b=QENZ35HupyjD6o/8ypIuCpqurE
	wOoUi9badiXmFloA4ZsWKGL5CDna/q0ahxGyqBlNeE2bwssb2Lx/v4va1J5REXbHQHTXqV5QIowFI
	cjAd9R4ypNR4XCs4TejicsPGAbEK53Dv36aKU8IjfP12Q7MesaewN2kObzau+kC/3IfYPziyVD7+T
	URaqjixk+qIx38I6+oQlBn6v7HXTKp7i0NKVooHXVJIdpY663OZlMNy7eO/VMf3sQkmCJV4gWrv+g
	Sya1PdK2IzYCSjwjSsz7zLy+SzdwXc0Ls+KBRhI/Em1sPrhF6ZS87dU8gqpUF9CoyvP29cMxnkZ30
	pHs3cD0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB9gs-0000000C3aK-0FhD;
	Fri, 10 Apr 2026 11:06:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB9gp-0000000C3ZF-14em
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 11:06:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 182982682;
	Fri, 10 Apr 2026 04:06:11 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0A1EF3FAF5;
	Fri, 10 Apr 2026 04:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775819176; bh=1zPAYfJ4alGeBTx9+bPmnEwVBkcQtAPgmbjN7nc0Fag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VwBgSBJoksX644oGKv4mneqiYz7YCISSwJEiPHkWj/MMSv/GVUZbGA9Q9x4Emk5qG
	 NGF+vcjNByj0MDlAn6qjPEt1VOG3A/g828rYT7GsLwc7jwAg10LJEIaR9JiD9iv7Og
	 bIoINeNP6Eb1mPGe03KcWgpGktjF1V77SfS//pI0=
Date: Fri, 10 Apr 2026 12:06:12 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Kameron Carr <kameroncarr@linux.microsoft.com>
Cc: will@kernel.org, suzuki.poulose@arm.com, steven.price@arm.com,
	ryan.roberts@arm.com, dev.jain@arm.com, yang@os.amperecomputing.com,
	shijie@os.amperecomputing.com, kevin.brodsky@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] arm64: mm: support set_memory_encrypted/decrypted
 for vmalloc addresses
Message-ID: <adjZpFIgXQYOvyTq@arm.com>
References: <20260406213317.216171-1-kameroncarr@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260406213317.216171-1-kameroncarr@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_040619_349014_1572FA0C 
X-CRM114-Status: GOOD (  13.39  )
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

On Mon, Apr 06, 2026 at 02:33:17PM -0700, Kameron Carr wrote:
> Currently __set_memory_enc_dec() only handles linear map (lm) addresses
> and returns -EINVAL for anything else. This means callers using
> vmalloc'd buffers cannot mark memory as shared/protected with the RMM
> via set_memory_decrypted()/set_memory_encrypted().
> 
> Extend the implementation to handle vmalloc (non-linear-map) addresses
> by introducing __set_va_addr_enc_dec(). For vmalloc addresses, the page
> table entries are not contiguous in the physical address space, so the
> function walks the vm_area's pages array and issues per-page RSI calls
> to transition each page between shared and protected states.
> 
> The original linear-map path is factored out into __set_lm_addr_enc_dec(),
> and __set_memory_enc_dec() now dispatches to the appropriate helper based
> on whether the address is a linear map address.

Could you give more details about the user of set_memory_decrypted() on
vmalloc()'ed addresses? I think this came up in the past and I wondered
whether something like GFP_DECRYPTED would be simpler to implement (even
posted a hack but without vmalloc() support). If it is known upfront
that the memory will be decrypted, it's easier/cheaper to do this on the
page allocation time to change the linear map and just use
pgprot_decrypted() for vmap(). No need to rewrite the page table after
mapping the pages.

-- 
Catalin

