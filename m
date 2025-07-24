Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55EB5C87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 13:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CBM71A5r716CRs7y3LydiT/PkH8MS+K3pnvRe4ld0lM=; b=x5jMEwiJR1UN+sHvJmslbXppu5
	rlzxmJrzA+XwkBHR1Xa+IwUmxAq6M7V0JraMDeex+VqxsscblGJ1Mge7QUydMWH9KCg2OqUggtd6E
	VVuSy2VkhMG8ZSiU2+SEPygV+5midFVoFVJLuq8UWFOgIWXbZqBsd7xRSDDTP7CuwMw0EROixpel3
	BaZ00hz0DYehWEC0D6R5SFmhTcoQ2CF3fMra7TUc+UgCWUIKRGpZh5umKmte7/WWlW+JEvLkmXGBd
	ALeFp8O99/T+ktEfrK3MmVNUQ7wn/P1SPOL9akz4ZY3skTRp3CM3KgT6dr9DSM0CBqTmHgXQkFDwU
	lmmfiONQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewOc-00000007bwp-3JXG;
	Thu, 24 Jul 2025 13:54:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueub2-00000007NWM-2OPo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 11:58:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E604E6114F;
	Thu, 24 Jul 2025 11:58:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A45DC4CEED;
	Thu, 24 Jul 2025 11:58:44 +0000 (UTC)
Date: Thu, 24 Jul 2025 12:58:41 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, david@redhat.com, will@kernel.org,
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
	rppt@kernel.org, surenb@google.com, mhocko@suse.com,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	suzuki.poulose@arm.com, steven.price@arm.com, gshan@redhat.com,
	linux-arm-kernel@lists.infradead.org, yang@os.amperecomputing.com,
	ryan.roberts@arm.com, anshuman.khandual@arm.com
Subject: Re: [PATCH v4] arm64: Enable permission change on arm64 kernel block
 mappings
Message-ID: <aIIf8Q7EVsQ5MGOX@arm.com>
References: <20250703151441.60325-1-dev.jain@arm.com>
 <aIHsiPtG0Ycm2DTe@arm.com>
 <b5570f50-8534-444b-8c7d-68d676840eef@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b5570f50-8534-444b-8c7d-68d676840eef@arm.com>
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

On Thu, Jul 24, 2025 at 04:10:18PM +0530, Dev Jain wrote:
> On 24/07/25 1:49 pm, Catalin Marinas wrote:
> > On Thu, Jul 03, 2025 at 08:44:41PM +0530, Dev Jain wrote:
> > > arm64 currently changes permissions on vmalloc objects locklessly, via
> > > apply_to_page_range, whose limitation is to deny changing permissions for
> > > block mappings. Therefore, we move away to use the generic pagewalk API,
> > > thus paving the path for enabling huge mappings by default on kernel space
> > > mappings, thus leading to more efficient TLB usage. However, the API
> > > currently enforces the init_mm.mmap_lock to be held. To avoid the
> > > unnecessary bottleneck of the mmap_lock for our usecase, this patch
> > > extends this generic API to be used locklessly, so as to retain the
> > > existing behaviour for changing permissions.
> > 
> > Is it really a significant bottleneck if we take the lock? I suspect if
> > we want to make this generic and allow splitting, we'll need a lock
> > anyway (though maybe for shorter intervals if we only split the edges).
> 
> The splitting primitive may or may not require a lock, Ryan and Yang had
> some discussion on the linear map block mapping thread. I am assuming
> that since we didn't need a lock in the past, there is no need to take it now,
> since we are only changing the pagetable walk API being used.

I vaguely remember Ryan's and Yang's discussion. I'd have to revisit it.
In the past we were not replacing block/table entries since there was no
page table splitting. If we are to add some splitting, even at the
edges, what would prevent some other caller of this API overlapping and
attempting to do the same split? It's not just vmalloc ranges but the
linear map as well that's touched by __change_memory_common().

-- 
Catalin

