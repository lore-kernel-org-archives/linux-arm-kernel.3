Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7284C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Jun 2025 23:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XvazyvwxShm3jdhWrAClsKz30F6PFYivxxTEcAhL24s=; b=oZCTF2pjizDXu3GrmxF67UPtg6
	+rAsOIYjZsyP5ss1rad29N+VuB9hTzgoFzGyBuuQT/Pt/DikoNYXe40kI8xNAk/7juvySQuHfC15X
	Z/2Y62z/DWDWw6Z+FUJFZHk6HdQTL92dZP/Nb2qYzfvPDNKH5P1zTGPqScOKKjBBNwHaxlcQAtuUx
	x0sNf6/rYB3oxE8eYZSP80JxaVboy8XnthNCKaFRtMDrkFsYXs50C39LaXrjb70F2BzYEFXil2xSB
	EyOdZnjeJ4CPJSv5q+HggGmul/sZ99g92StcG3gU7fr+yPJznwykHI9YRN9pAx0wLM2QlAClxj5rm
	DM4I+TbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW18B-00000000pkp-3tM5;
	Sun, 29 Jun 2025 23:08:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW15t-00000000pcO-1XlX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Jun 2025 23:05:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A6E4A61152;
	Sun, 29 Jun 2025 23:05:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92564C4CEEB;
	Sun, 29 Jun 2025 23:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1751238350;
	bh=W82owXpwGpTGovuRtiMl4ETQSnevrtiA8edoKdquAuc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tF6VIh2NGztTz8j/GldWe58g5f5QqvEyYmFNuGIA72367L4gYrgGcHFfR5sGvT1NN
	 jcOJ7lRGh4r+rmQ5QhfztpZqqdv5uOnaI+jq1hjgCXRmZClbK2H96DHL3hvyD+7g8O
	 8xcy4nIKS0qqfTGgGd3shk0pT49MogJn4ynP4DOI=
Date: Sun, 29 Jun 2025 16:05:49 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Dev Jain <dev.jain@arm.com>
Cc: ryan.roberts@arm.com, david@redhat.com, willy@infradead.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com,
 will@kernel.org, Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com,
 vbabka@suse.cz, jannh@google.com, anshuman.khandual@arm.com,
 peterx@redhat.com, joey.gouly@arm.com, ioworker0@gmail.com,
 baohua@kernel.org, kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
 christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, hughd@google.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
Subject: Re: [PATCH v4 0/4] Optimize mprotect() for large folios
Message-Id: <20250629160549.da922e78d202c510a1ec68f8@linux-foundation.org>
In-Reply-To: <20250628113435.46678-1-dev.jain@arm.com>
References: <20250628113435.46678-1-dev.jain@arm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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

On Sat, 28 Jun 2025 17:04:31 +0530 Dev Jain <dev.jain@arm.com> wrote:

> This patchset optimizes the mprotect() system call for large folios
> by PTE-batching. No issues were observed with mm-selftests, build
> tested on x86_64.

um what.  Seems to claim that "selftests still compiles after I messed
with stuff", which isn't very impressive ;)  Please clarify?

> We use the following test cases to measure performance, mprotect()'ing
> the mapped memory to read-only then read-write 40 times:
> 
> Test case 1: Mapping 1G of memory, touching it to get PMD-THPs, then
> pte-mapping those THPs
> Test case 2: Mapping 1G of memory with 64K mTHPs
> Test case 3: Mapping 1G of memory with 4K pages
> 
> Average execution time on arm64, Apple M3:
> Before the patchset:
> T1: 7.9 seconds   T2: 7.9 seconds   T3: 4.2 seconds
> 
> After the patchset:
> T1: 2.1 seconds   T2: 2.2 seconds   T3: 4.3 seconds

Well that's tasty.

> Observing T1/T2 and T3 before the patchset, we also remove the regression
> introduced by ptep_get() on a contpte block. And, for large folios we get
> an almost 74% performance improvement, albeit the trade-off being a slight
> degradation in the small folio case.
> 


