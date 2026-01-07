Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A00CF6BE2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 03:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KZ0Ezbx1oIoMybLcOX+pGD35Vq9O/fBhGyTsUnRvMrw=; b=RCsdh1MGTeJE8uhuaHzYgqZ7mV
	3D34Ikah2dxe9WjVV19xUqZgS1jOmDyZM0DIQp5XU1LntKVdTXx++OSdUBDiMilxUtP7kqicS4wlU
	sdXyU0/ihHtQTD4inUczWmFiWIokAVkCo7aPxpPyRtgXjyYay/ZWjvhu3l8CDm6KrYrn1tPagt8cQ
	RI0+VoKz5qrBr8Ice9MKEIvxhR4+smIbpE8zIy2lv8fSIhlMK5Qw1Thsg2xr/1jnnZt/LGCPl6s7z
	KBhfAQ0bOAn55ruCyoro+pP/tScfJ8DjVqfNR1nmKJWYkLruOK0zZXmWbC6J1Qrd5yCViG7KALnj9
	4Gpnp+6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdK71-0000000E7R7-40to;
	Wed, 07 Jan 2026 03:21:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdK6z-0000000E7Ql-0W51
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 03:21:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CCF7A497;
	Tue,  6 Jan 2026 19:21:19 -0800 (PST)
Received: from localhost (a079125.arm.com [10.164.21.37])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B81363F5A1;
	Tue,  6 Jan 2026 19:21:25 -0800 (PST)
Date: Wed, 7 Jan 2026 08:51:22 +0530
From: Linu Cherian <linu.cherian@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Marc Zyngier <maz@kernel.org>, Dev Jain <dev.jain@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 11/13] arm64: mm: More flags for __flush_tlb_range()
Message-ID: <aV3RMohRCvzWnuwI@a079125.arm.com>
References: <20251216144601.2106412-1-ryan.roberts@arm.com>
 <20251216144601.2106412-12-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251216144601.2106412-12-ryan.roberts@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_192129_226653_1C8D46FA 
X-CRM114-Status: GOOD (  12.75  )
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

Ryan,

On Tue, Dec 16, 2025 at 02:45:56PM +0000, Ryan Roberts wrote:
> Refactor function variants with "_nosync", "_local" and "_nonotify" into
> a single __always_inline implementation that takes flags and rely on
> constant folding to select the parts that are actually needed at any
> given callsite, based on the provided flags.
> 
> Flags all live in the tlbf_t (TLB flags) type; TLBF_NONE (0) continues
> to provide the strongest semantics (i.e. evict from walk cache,
> broadcast, synchronise and notify). Each flag reduces the strength in
> some way; TLBF_NONOTIFY, TLBF_NOSYNC and TLBF_NOBROADCAST are added to
> complement the existing TLBF_NOWALKCACHE.

It would be nice to have some notes added on the below for better clarity 
* What a walk cache is and why we bother about them ?
* Why and how should we invalidate the walk caches ?

--
Linu Cherian.

