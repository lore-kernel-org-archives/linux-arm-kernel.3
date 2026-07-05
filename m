Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C4CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 07:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RX3le/qPT7zqjelY/UP38ySnAKXxuX0WuhVciQD3IWY=; b=FvcI2+o3HJ23YR+ga4gjmyMGbh
	ZWBFKYZQ7FTyDtWPqUG2aYx9rzWHuTazjJkMKlRUT231YBhNHA7dRZFn5ktTESRciAwkNVguUwYWX
	ZodmGlheGYvKMvFo3B3Q/EHl34vHz7PrqoBRds7n2Oar4xgGbD/5K+hkfHvLB84zO0easKuQgbaQP
	CIJy8y15cpFatCD8JGQdMwn+giZk6z5Jkcbk1qkWnbb8tVeBxqxMLbuFAv4p1ri8Ea71Jx3lKAy8v
	4CILqMnZ2IZDBkNB5dTpnf9Q+CSx3eqbv7idV9UnVDgOInARyX+EpTIMnweoSn5UIas11Ik1AlXRB
	UO0p2aQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgHXa-000000093r6-293q;
	Sun, 05 Jul 2026 07:45:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgHXZ-000000093qz-4Brj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 07:45:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0BC2540F2B;
	Sun,  5 Jul 2026 07:45:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB79A1F000E9;
	Sun,  5 Jul 2026 07:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1783237524;
	bh=RX3le/qPT7zqjelY/UP38ySnAKXxuX0WuhVciQD3IWY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=gRnFhPHbpFC/3ywofs1mMe8NkJOCzc+3slJfghrYxsxz+YxgEIGInp3iiGlEp1eca
	 XT0aXsnw0ZrgZ1Z6y994vzNW+BgoxKw0PjUXP8gfAvSTX3cltwi1+T7VGZSTB2S7En
	 5lafFxltUOJsBNji181n5RIUffNZSvJXONR3ZDKo=
Date: Sun, 5 Jul 2026 00:45:23 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Dev Jain <dev.jain@arm.com>
Cc: muchun.song@linux.dev, osalvador@suse.de, ljs@kernel.org,
 david@kernel.org, liam@infradead.org, riel@surriel.com, vbabka@kernel.org,
 harry@kernel.org, jannh@google.com, lance.yang@linux.dev, kas@kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, apopple@nvidia.com,
 rcampbell@nvidia.com, ziy@nvidia.com, matthew.brost@intel.com,
 joshua.hahnjy@gmail.com, rakie.kim@sk.com, byungchul@sk.com,
 gourry@gourry.net, ying.huang@linux.alibaba.com, ak@linux.intel.com,
 nao.horiguchi@gmail.com, mel@csn.ul.ie, j-nomura@ce.jp.nec.com,
 pfalcato@suse.de, tglx@kernel.org, dave.hansen@intel.com,
 jpoimboe@kernel.org, catalin.marinas@arm.com, will@kernel.org,
 linux-arm-kernel@lists.infradead.org, ryan.roberts@arm.com,
 anshuman.khandual@arm.com
Subject: Re: [PATCH v3 0/6] Fix incorrect access of hugetlb pte entries
Message-Id: <20260705004523.12817419684173cb1ed1dc57@linux-foundation.org>
In-Reply-To: <20260703114202.365553-1-dev.jain@arm.com>
References: <20260703114202.365553-1-dev.jain@arm.com>
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

On Fri,  3 Jul 2026 11:41:53 +0000 Dev Jain <dev.jain@arm.com> wrote:

> There are various places which use ptep_get() to get the pte entry
> corresponding to a hugetlb folio. Some arches (like s390) have special
> handling to compute the pteval, so they provide huge_ptep_get(). Use this
> helper consistently.
> 
> Additionally, some code paths may provide huge_ptep_get with an unaligned
> address. This is a problem on arm64 (I checked other arches and it looks
> fine for them), which is fixed in patch 1. The fix is made to be
> backport-friendly: the cleaner fix would be to perhaps pass the hstate
> to huge_ptep_get() - that is wider churn and we can do that later.

Thanks, I added this series to mm-new.

That means 7.2 will be released with these bugs unfixed, which may be a
mistake.  But without knowing the userspace impact of these bugs, I
cannot make this call :(


Sashiko is worried about [6/6]:
	https://sashiko.dev/#/patchset/20260703114202.365553-1-dev.jain@arm.com

