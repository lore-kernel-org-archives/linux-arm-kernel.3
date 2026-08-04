Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB4DC55822
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 18:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4pNvk/hVxan4X92LEuNLrhC26XmWg6H10cQTm3nYIy8=; b=Z8bRSiE2RZqrAvGzpwZ1IViszw
	4dpaPkVbgp7Z/0p0z/QRGHFutZ7nvPfiT/NaYr29jNtJgovY3ZppBBSAV+/qMTYQ5STacAgy4DEll
	oSlVHnXqpRwUHv2OUIze2PRqwjN0A4pm09XbdEzSHTsPaS7jx5AF6JnFtVZ6Cns+SZJnUl7pS3zvY
	ljf5+Hn2hnvr5364Wnu06G7WGA9/rkVponaQnv4VenzdjrlLEy7SO8BqeNYOf8IEKFIR8WcaC3UeI
	4/oPuxo0Fe+UISB/3ib3QAsCoGYdnGmBhaHMHSnGLfjLYaXLQVedsYt+vaJBZTWy4OO7pC6gCmTRs
	KPrd5ieg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJXS-00000002ZYH-3Xx0;
	Tue, 04 Aug 2026 18:06:54 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJXR-00000002ZXf-3Hro
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 04 Aug 2026 18:06:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4pNvk/hVxan4X92LEuNLrhC26XmWg6H10cQTm3nYIy8=; b=TpyaRaYZLg/n2BYtHJXErQH29W
	6pY46PDbcU/PJH6PFMKJMixpiZtwudk778hqs51AMMiK/YZTaHHmwNyd5NQnvASuFayXom6gJ/viN
	CBa9xLRHNV2SDR9WVxhUb9u1vohm90k5Vqbs4Kh+XAiMe28Xfa2rKTBBJzp7xy7LZ5N4maISrddCD
	M7UQfCBzU4lu+qb3CLknfmWgfsJ0R31KepvHYgd3/fWwlH9ldg4ILGUOdWyEnfN9MxQDjwF0pv4q8
	ZJeRe9Wqm1Ij/J4TxN4bPCrPtfEEv30uJE5Z2zqzfPZ7ZRjDlgfbTtm/YYGyDbgIERxzyby5g2tsA
	ITpE0eFA==;
Received: from willy by casper.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJXP-00000004SL5-3nTg;
	Tue, 04 Aug 2026 18:06:51 +0000
Date: Tue, 4 Aug 2026 19:06:51 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	"Christoph Lameter (Ampere)" <cl@gentwo.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	Ryan Roberts <ryan.roberts@arm.com>, dennis@kernel.org,
	tj@kernel.org, urezki@gmail.com, catalin.marinas@arm.com,
	will@kernel.org, akpm@linux-foundation.org, hca@linux.ibm.com,
	gor@linux.ibm.com, agordeev@linux.ibm.com, linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [RFC v2 PATCH 0/16] Optimize this_cpu_*() ops for non-x86 (ARM64
 for this series)
Message-ID: <anIqO2AiVlLTEPOd@casper.infradead.org>
References: <20260715180455.515692-1-yang@os.amperecomputing.com>
 <0344c559-1959-4531-9265-d5a5180eb7cd@arm.com>
 <fc21c840-1584-4844-963f-80cea7f2e674@os.amperecomputing.com>
 <amCPBrdltFSE_fEf@J2N7QTR9R3>
 <25d1e09b-53e4-7cd5-87db-b58437e4e690@gentwo.org>
 <4887267b-dc26-4c33-96ca-8dff054a0d1f@kernel.org>
 <anHuLy52o5S9Nlwp@lucifer>
 <anH1CgpwS3PHeDRq@lucifer>
 <20260804144054.GE27883@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804144054.GE27883@nvidia.com>
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

On Tue, Aug 04, 2026 at 11:40:54AM -0300, Jason Gunthorpe wrote:
> That said there is still a merit for things like replicating .text, and
> I think we will also have some multi-socket systems that would benefit
> from this too..

Are you referring to kernel text replication or userspace text
replication?  If the latter, I don't think we need per-CPU page tables
to do it.

