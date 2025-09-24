Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51DD9CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 08:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J4cKTSeea7/czdVYO122nuGfInlG59hXiu0r7c4Sres=; b=qbY1WkrQje8t34DcYlXjbOoo4H
	5HXVF2OkrojMX2t0mVSvNAbQKG1Zt2MpktkEvo3BH3g9/9YeoT2JgCjE8CTxNMqfrMhvJRYGPp93p
	0sbxyF/wHG9VkFeIIgvgMINbpXD7LZLXJnFrkJIVkXjm3EDO0DHu18PtJoEmQswVWeczthB4j2dzC
	AndglLeC93fivTFGCB4tnswiM/BJ32T2Yy2C73n2DcqDdDYRilSNBPxXqPoRahwdrVOlvbrK9N+uh
	w2qyUm03zDapkOaFhvr349RCGpOvxStSlhFHzy+3lnoP09BAY4NpAnftR5aSilxfpltTyeJ99SA0C
	RpQK/5+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1LCW-0000000FwFY-15LV;
	Wed, 24 Sep 2025 08:50:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1LCT-0000000FwEE-3zBg;
	Wed, 24 Sep 2025 08:50:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 91B4643CCC;
	Wed, 24 Sep 2025 08:50:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E087DC4CEE7;
	Wed, 24 Sep 2025 08:50:02 +0000 (UTC)
Date: Wed, 24 Sep 2025 09:50:00 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Lance Yang <lance.yang@linux.dev>
Cc: David Hildenbrand <david@redhat.com>, akpm@linux-foundation.org,
	lorenzo.stoakes@oracle.com, usamaarif642@gmail.com,
	yuzhao@google.com, ziy@nvidia.com, baolin.wang@linux.alibaba.com,
	baohua@kernel.org, voidice@gmail.com, Liam.Howlett@oracle.com,
	cerasuolodomenico@gmail.com, hannes@cmpxchg.org,
	kaleshsingh@google.com, npache@redhat.com, riel@surriel.com,
	roman.gushchin@linux.dev, rppt@kernel.org, ryan.roberts@arm.com,
	dev.jain@arm.com, ryncsn@gmail.com, shakeel.butt@linux.dev,
	surenb@google.com, hughd@google.com, willy@infradead.org,
	matthew.brost@intel.com, joshua.hahnjy@gmail.com, rakie.kim@sk.com,
	byungchul@sk.com, gourry@gourry.net, ying.huang@linux.alibaba.com,
	apopple@nvidia.com, qun-wei.lin@mediatek.com,
	Andrew.Yang@mediatek.com, casper.li@mediatek.com,
	chinwen.chang@mediatek.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-mm@kvack.org, ioworker0@gmail.com, stable@vger.kernel.org
Subject: Re: [PATCH 1/1] mm/thp: fix MTE tag mismatch when replacing
 zero-filled subpages
Message-ID: <aNOwuKmbAaMaEMb7@arm.com>
References: <20250922021458.68123-1-lance.yang@linux.dev>
 <aNGGUXLCn_bWlne5@arm.com>
 <a3412715-6d9d-4809-9588-ba08da450d16@redhat.com>
 <aNKJ5glToE4hMhWA@arm.com>
 <aNLHexcNI53HQ46A@arm.com>
 <f2fe9c01-2a8d-4de9-abd5-dbb86d15a37b@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2fe9c01-2a8d-4de9-abd5-dbb86d15a37b@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_015010_009547_B9C53F51 
X-CRM114-Status: GOOD (  16.99  )
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

On Wed, Sep 24, 2025 at 10:49:27AM +0800, Lance Yang wrote:
> On 2025/9/24 00:14, Catalin Marinas wrote:
> > So alternative patch that also fixes the deferred struct page init (on
> > the assumptions that the zero page is always mapped as pte_special():
> 
> I can confirm that this alternative patch also works correctly; my tests
> for MTE all pass ;)

Thanks Lance for testing. I'll post one of the variants today.

> This looks like a better fix since it solves the boot hang issue too.

In principle, yes, until I tracked down why I changed it in the first
place - 68d54ceeec0e ("arm64: mte: Allow PTRACE_PEEKMTETAGS access to
the zero page"). ptrace() can read tags from PROT_MTE mappings and we
want to allow reading zeroes as well if the page points to the zero
page. Not flagging the page as PG_mte_tagged caused issues.

I can change the logic in the ptrace() code, I just need to figure out
what happens to the huge zero page. Ideally we should treat both in the
same way but, AFAICT, we don't use pmd_mkspecial() on the huge zero
page, so it gets flagged with PG_mte_tagged.

If I go with the first fix for the page merging, I'll look to defer the
zero page initialisation post page_alloc_init_late() in a separate
patch.

-- 
Catalin

