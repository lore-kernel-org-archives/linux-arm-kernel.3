Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CD35CCD1BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 19:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UbBBeYBFZH5ophEa2nhxznXN91y7nH+iWW5dUK79ZfM=; b=Ac77v+elDdRHn6/DFGe933SeWL
	+qrIY2o0+Pbd3A/0pzBsNEu7hbucaSkZYw17uXo77w23EU2s0a6VCEMSPGJmMRJO11n5QvWDz4MCZ
	9mFMUVf5nKzu7zzFmbHTy21VpRFvTW3MXUK5GTExhl7YRHyqbsnULOGdi04EVBkirxBqpnrmjY6sN
	HGF5Y6CgVFd5XoXTvzUl/rXnbOqlY2MtdYHl1UEYf/+R1WpDDqrDzwLX1OX2kNjyq0BUNOYPwWgsG
	PMZg+awkV+T5xQawPImG/oxEl+Um/0q+h65EnEptCiRQL5jyRWaXAOeT300Q9pMd+mHvOCMmZhx4s
	tt67TJjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBeQ0-000000047u0-13rV;
	Wed, 22 Oct 2025 19:22:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBePz-000000047tk-1Ggj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 19:22:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7C6386057F;
	Wed, 22 Oct 2025 19:22:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E000C4CEE7;
	Wed, 22 Oct 2025 19:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1761160962;
	bh=hQnzupzHHgSi4cofh0YJDQqv3isCGVIcYStvBh1mYXM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=YFN8csLzGHpCp1X+A3OFEYYmru95A84qxriKEZDIvqcO9DbY03YYDjGxsPFDMcyug
	 SH7fQU7WKReNKK+KIvM+6V3tHyX97UI34YaBI4kETmkAkXpexe4hFaeA4+09VR0TmH
	 ufb727p9iiRS6WiIKFXSVtYb8KTDO/LRkUoJLPEc=
Date: Wed, 22 Oct 2025 12:22:41 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Conor Dooley <conor@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, <linux-cxl@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-arch@vger.kernel.org>,
 <linux-mm@kvack.org>, Dan Williams <dan.j.williams@intel.com>,
 "H . Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 <james.morse@arm.com>, Will Deacon <will@kernel.org>, Davidlohr Bueso
 <dave@stgolabs.net>, <linuxarm@huawei.com>, Yushan Wang
 <wangyushan12@huawei.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, <x86@kernel.org>, Andy Lutomirski
 <luto@kernel.org>, Dave Jiang <dave.jiang@intel.com>
Subject: Re: [PATCH v4 0/6] Cache coherency management subsystem
Message-Id: <20251022122241.d2aa0d7864f67112aa7691bf@linux-foundation.org>
In-Reply-To: <20251022113349.1711388-1-Jonathan.Cameron@huawei.com>
References: <20251022113349.1711388-1-Jonathan.Cameron@huawei.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 22 Oct 2025 12:33:43 +0100 Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:

> Support system level interfaces for cache maintenance as found on some
> ARM64 systems. This is needed for correct functionality during various
> forms of memory hotplug (e.g. CXL). Typical hardware has MMIO interface
> found via ACPI DSDT.
> 
> Includes parameter changes to cpu_cache_invalidate_memregion() but no
> functional changes for architectures that already support this call.

I see additions to lib/ so presumably there is an expectation that
other architectures might use this.

Please expand on this.  Any particular architectures in mind?  Any
words of wisdom which maintainers of those architectures might benefit
from?

> How to merge?  When this is ready to proceed (so subject to review
> feedback on this version), I'm not sure what the best route into the
> kernel is. Conor could take the lot via his tree for drivers/cache but
> the generic changes perhaps suggest it might be better if Andrew
> handles this?  Any merge conflicts in drivers/cache will be trivial
> build file stuff. Or maybe even take it throug one of the affected
> trees such as CXL.

Let's not split the series up.  Either CXL or COnor's tree is fine my
me.


