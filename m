Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 969CDCAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 16:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oy69FO5pELTawIEUifpuddedC05hKy2CShWlrXDly5E=; b=ndj0oCJP1SKn5dnfr+qgCTbXss
	Kr3ViC9qPNBsklJW5le1XNUseMUL1Dlzq364IgpgvkJCU9skE5wJUpuGle+sPT511MoktGZ7stvqW
	U7cD6hTcaKzq8seKYpvWIm2pBaBd7jDbNPnH3/IEcWIPgKDQaIvksj3u4g47lOXs54g06NSprd0XV
	SO1TQY7jVjdVyqezc/dX60FblFhC8zuXb+wRiw79AyWs+WB3m+TEpZtb7NkmuBXoiagmEVQCE2/M/
	Pc8qzmFFd+OuAmv4fp2atPOzgyCkb+b5vuPkdAIEs/9e09AoeZ1gH36gwKzN4DpXvvclaygHYXG5a
	mYpAo54w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2BkC-0000000330h-2K5s;
	Fri, 26 Sep 2025 16:56:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2BkA-0000000330a-2zff
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 16:56:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2191561EE8;
	Fri, 26 Sep 2025 16:56:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3E69C4CEF4;
	Fri, 26 Sep 2025 16:56:23 +0000 (UTC)
Date: Fri, 26 Sep 2025 17:56:21 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Christoph Lameter (Ampere)" <cl@gentwo.org>
Cc: Yang Shi <yang@os.amperecomputing.com>, muchun.song@linux.dev,
	osalvador@suse.de, david@redhat.com, akpm@linux-foundation.org,
	will@kernel.org, carl@os.amperecomputing.com, linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: hugetlb: avoid soft lockup when mprotect with
 PROT_MTE
Message-ID: <aNbFtaVr8f2klqdD@arm.com>
References: <20250926162034.1785899-1-yang@os.amperecomputing.com>
 <1038c7c7-81d6-f273-6fa1-93eb7206d5ed@gentwo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1038c7c7-81d6-f273-6fa1-93eb7206d5ed@gentwo.org>
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

On Fri, Sep 26, 2025 at 09:29:54AM -0700, Christoph Lameter (Ampere) wrote:
> On Fri, 26 Sep 2025, Yang Shi wrote:
> > When calling mprotect() with PROT_MTE, kernel will initialize MTE tags
> > for every single page in the affected area. Soft lockup was observed
> > when doing this for large HugeTLB memory area in our customer's workload
> > (~300GB memory):
> 
> AFAICT this is a bug fix. The hugetlb path should be doing a
> cond_resched() like the base page code does.
> 
> It is not MTE specific. If other processing takes a long time in the loop
> (setting up terabyte size mappings for hugetlb for example) then the
> softlockup could also be triggered on non MTE workloads.

Yeah, with MTE set_huge_pte_at() isn't just setting a pte but also
clearing the tags. So it can take considerable time.

The fix is indeed not related to MTE, so I don't think the Fixes tag
should mention MTE (but I'm fine with a cc stable). Let's say we change
a hugetlb from RW to RX and have to do cache maintenance, we'd trigger a
similar soft lockup, depending on how fast the system is.

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

