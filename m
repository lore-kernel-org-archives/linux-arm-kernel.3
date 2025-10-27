Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D4ECCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 02:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mx+VoEY0CT/CKfx1nDM5Jt1hgguzcel3vSopk965SuI=; b=oOZFBYHb41u+zVXpQtkCSTagNo
	2OqM/rVZxwtOS+1bFqUVlFwnUvj4PrR+ey09MdJCkjZ9k7pd3Up9A11PKncSk8px/tVtJ9kaHURwV
	y6oWm06qZ52vlBkYRxAEQkF5UWkM0LXO7LRU+Q75k8oWmYas7kQAqbJuFJAFWJcrGSFpEhldG3Nig
	b+OKAVAFmU5Nt/LCJY+pVgNnXXcesBWSCbLzl8b2iUeS010Cl4nH+y12ZKhHKItK/bZHAwTvRK956
	Wm4igcnFTz6m6Rvu5yPBovr6NrYYzRCG46KMjT2dgdSfBXioMoz59aplVt/mbAGBQR0JpVyCqTcI6
	ckB85S4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDCZz-0000000CzH1-0H1a;
	Mon, 27 Oct 2025 02:03:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDCZy-0000000CzGN-0tha
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 27 Oct 2025 02:03:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=mx+VoEY0CT/CKfx1nDM5Jt1hgguzcel3vSopk965SuI=; b=Q44vbB8QriswB94saEH9OSMoct
	OHElHRvMgRiUAP+Jt+WrSXslYTFQcYH8XZEyvT4/RhIfCcePpEahyTESiPfpZBnqzEuIaKbYJtEz9
	cYCPaMVXJgR9GL7R0SVDQM9TVPGxALXnjneHEHlbl1Z4UmLiIYGVuQGRYiVpgoxNfSIjZ/HtLaVy8
	QTXM/xVvnc7j7ispUeymH/Bj1Cc1VoUQTfEVc2Gg8qNeCTUaxH5tvPHgR7ONsXuDo/u0kS9P4oqib
	yTrKtVZwUtgkqdNXXv0KHGVV8lInmm/fFpBnHzU8nD9aXNTTyhzqFchP4hIYsG5omAD5I6kSeUB7x
	SK/dYXOQ==;
Received: from out30-110.freemail.mail.aliyun.com ([115.124.30.110])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDBi9-00000001E7e-3QLs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 01:07:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1761530588; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=mx+VoEY0CT/CKfx1nDM5Jt1hgguzcel3vSopk965SuI=;
	b=Kd1+Swt2+wA6G/SIIh9ClUVawv/AQJtRpPRfdKQNQoaLdoZikn4X9+udgt0GZPSX4T4hwbyuzbrWwF1uhcAlr81Rag51IwYyNV18rv0vxBaP39833sTGz+B0QbQml54s6tVYTCzhPv2r5iamkJoXSRY0WL3jDmpzNQQBZ9uoaGE=
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0Wr-dZdy_1761530575 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 27 Oct 2025 10:03:04 +0800
From: "Huang, Ying" <ying.huang@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,  Catalin Marinas
 <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>,  David Hildenbrand <david@redhat.com>,
  Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,  Vlastimil Babka
 <vbabka@suse.cz>,  Zi Yan <ziy@nvidia.com>,  Baolin Wang
 <baolin.wang@linux.alibaba.com>,  Ryan Roberts <ryan.roberts@arm.com>,
  Yang Shi <yang@os.amperecomputing.com>,  "Christoph Lameter (Ampere)"
 <cl@gentwo.org>,  Dev Jain <dev.jain@arm.com>,  Barry Song
 <baohua@kernel.org>,  Anshuman Khandual <anshuman.khandual@arm.com>,
  Kefeng Wang <wangkefeng.wang@huawei.com>,  Kevin Brodsky
 <kevin.brodsky@arm.com>,  Yin Fengwei <fengwei_yin@linux.alibaba.com>,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
  linux-mm@kvack.org
Subject: Re: [PATCH -v3 0/2] arm, tlbflush: avoid TLBI broadcast if page
 reused in write fault
In-Reply-To: <20251023013524.100517-1-ying.huang@linux.alibaba.com> (Huang
	Ying's message of "Thu, 23 Oct 2025 09:35:22 +0800")
References: <20251023013524.100517-1-ying.huang@linux.alibaba.com>
Date: Mon, 27 Oct 2025 10:02:54 +0800
Message-ID: <87cy69hzjl.fsf@DESKTOP-5N7EMDA>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=ascii
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_010750_343582_4C58CAF4 
X-CRM114-Status: GOOD (  13.27  )
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

Huang Ying <ying.huang@linux.alibaba.com> writes:

> This series is to optimize the system performance via avoiding TLBI
> broadcast if page is reused in the write protect fault handler.  More
> details of the background and the test results can be found in [2/2].
>
> Changelog:
>
> v3:
>
> - Various code cleanup and improved design and document in [1/2],
>   Thanks Lorenzo and David's comments!
> - Fixed a typo and improved function interface in [2/2], Thanks Ryan's
>   comments!
>
> v2:
>
> - Various code cleanup in [1/2], Thanks David's comments!
> - Remove unnecessary __local_flush_tlb_page_nosync() in [2/2], Thanks Ryan's comments!
> - Add missing contpte processing, Thanks Rayn and Catalin's comments!
>
> Huang Ying (2):
>   mm: add spurious fault fixing support for huge pmd
>   arm64, tlbflush: don't TLBI broadcast if page reused in write fault
>
>  arch/arm64/include/asm/pgtable.h  | 14 ++++---
>  arch/arm64/include/asm/tlbflush.h | 56 ++++++++++++++++++++++++++++
>  arch/arm64/mm/contpte.c           |  3 +-
>  arch/arm64/mm/fault.c             |  2 +-
>  include/linux/huge_mm.h           |  2 +-
>  include/linux/pgtable.h           |  4 ++
>  mm/huge_memory.c                  | 33 ++++++++++------
>  mm/internal.h                     |  2 +-
>  mm/memory.c                       | 62 +++++++++++++++++++++++--------
>  9 files changed, 140 insertions(+), 38 deletions(-)

Hi, Andrew and Catalin,

This patchset needs to be merged across trees.  [1/2] is a mm change,
[2/2] is an arm64 change, and [2/2] depends on [1/2].  Because the
user-visible change is in arm64, I think it may be slightly better to
merge the patchset through the arm64 tree.  The opposite way works for
me too.  If you were OK with the patchset itself, which way do you
prefer?

---
Best Regards,
Huang, Ying

