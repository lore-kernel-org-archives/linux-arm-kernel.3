Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BBA0C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 17:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gBAuJhW7S3ZXQ2qvDNf9JatkhBim/pKGvLVV7RlONSg=; b=RfSMEUw28smUna8hgVC+PhMS/m
	7CdBju7AB1VEvRSY8iW2pjhj3PV75I+AGtZuD6Yu7c6mJmrmooqeNiCJ0wwGBpPIRJ36E+k5hK0eP
	wiax7UZLxFnzbH2v2w8qUKfFQ/1RIS+KUnfewOR9jOOXVskmAHkEyxKoBnf2j7taN3I0oOz9fum4Y
	2V+6fXgIxkaDsC0KOa6oeFjLbHKEYe4JCmqDSra+H879KYF487FdD4va4KYg1AIWyuy3pNuK8Ix0d
	GEv7SgUTxKHqFqwvDlBxHEhiyiNAPBjWYcW9DSToLDp3UPVGfi3pjkq4ksQ7UQ4yxoQxv59NTzUWt
	oh0jC8qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x402N-00000009uMB-3PSH;
	Tue, 08 Sep 2026 17:55:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x402M-00000009uLn-3ySa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 17:55:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 76F304034B;
	Tue,  8 Sep 2026 17:55:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 703FE1F00A3A;
	Tue,  8 Sep 2026 17:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1788890114;
	bh=gBAuJhW7S3ZXQ2qvDNf9JatkhBim/pKGvLVV7RlONSg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=hVzMVnSWPNFrjH8TWsZOHxRl0Old2NxIqVPRlGr2uN94NqWa7kezMsS/g0wy4UcGS
	 UtnZwWRgJJenERfATUGgoXTtmS+YyDkVLwdKouJCYBrNjcAty6d+qSlcrdxRWgLtn9
	 ZHsMfwRfPDq+5GrIQa7o17bWgKDLvrbv6j4vVFcc=
Date: Tue, 8 Sep 2026 10:55:12 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Tal Zussman <tz2294@columbia.edu>
Cc: Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng
 Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He
 <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, Youngjun Park
 <youngjun.park@lge.com>, David Hildenbrand <david@kernel.org>, Zi Yan
 <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Lance
 Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Kiryl
 Shutsemau <kas@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Rik van Riel
 <riel@surriel.com>, Vlastimil Babka <vbabka@kernel.org>, Harry Yoo
 <harry@kernel.org>, Jann Horn <jannh@google.com>, Johannes Weiner
 <hannes@cmpxchg.org>, Yosry Ahmed <yosry@kernel.org>, Chengming Zhou
 <chengming.zhou@linux.dev>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/8] mm: remove page_swap_entry()
Message-Id: <20260908105512.8854d7972c82b6b6f417b0f8@linux-foundation.org>
In-Reply-To: <20260908-folio_swap_entry-v2-0-ee6d01dfa5e1@columbia.edu>
References: <20260908-folio_swap_entry-v2-0-ee6d01dfa5e1@columbia.edu>
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

On Tue, 08 Sep 2026 11:16:30 -0400 Tal Zussman <tz2294@columbia.edu> wrote:

> A folio in the swap cache occupies folio_nr_pages() contiguous swap
> entries starting at folio->swap, so a page's swap entry is just
> folio->swap plus the page's index in the folio. The swap entry is
> folio state, but the only helper for it is page-based:
> page_swap_entry() takes a page and recomputes the folio its callers
> already hold. Several callers avoid it by open-coding the arithmetic
> on folio->swap instead.
> 
> Add folio_swap_entry() and folio_page_swap_entry(), convert all users,
> and remove page_swap_entry(), with a few other cleanups along the way.

Thanks, I'll queue this for testing and further review.

