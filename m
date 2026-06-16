Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23D28CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 05:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c1S0w+P/QW9r6MLKhBpljIxNYB1FXvjAapFvsTRpai4=; b=QOnX85dBGUQ05ogLFua6cJailT
	sSuxVfPVGeSZG07wUbs2fTMWRe/7xP1n9OmYe1bk7ahqdBrrHveU6cyQN/Bdr21L4D+KVQghl3eAx
	ZFNxPBl0V5L9lSaBpEnhxgpRNmJIEBAY2+pMHn0kebWvhX7uNNmu9ywoxzsOIqWmeBPTXcXqT4qEP
	xl0dwS1adeD8iOR3oNm3Vq2h4ANJpA7+aPud5OqFNys9Cbd1hiT96nOeba5v6PJgqDu8k6M4+sJ/d
	k3g0XF1Jz5cpCuiXLEYM0A49hq9iGDp1NOwUylVZl2gCpa6r7sIFZoPm3dznMhsNbUwHx2t7Gl+pC
	8hcYi/gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZLuJ-0000000FDw8-0bR8;
	Tue, 16 Jun 2026 05:00:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZLuG-0000000FDvg-3E3O
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 05:00:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8EADA3D4B;
	Mon, 15 Jun 2026 22:00:06 -0700 (PDT)
Received: from localhost (a079125.arm.com [10.164.21.37])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 833AF3F915;
	Mon, 15 Jun 2026 22:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781586011; bh=pKqht8xBTdJPB8coISoY8X6SJ1c7ZZAUQnZN+qy2n2I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p/tq9cRXU7CTPJIcLoxIeuxSFMhB2z8/9qBRupZLiPMX8aupEXzRIuKsaVG/0p6j3
	 x8VUhBLZ0ZmzVaZEPfTOs/czMpJAlLQQKhjmuCP2nq9cZdGAqS1kfog+nv9PhY494T
	 PxtJGZctd9VTRa78lBcu/41Y5qW6Ti0ctIr/FShg=
Date: Tue, 16 Jun 2026 10:30:07 +0530
From: Linu Cherian <linu.cherian@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Huang Ying <ying.huang@linux.alibaba.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	shameerali.kolothum.thodi@huawei.com
Subject: Re: [PATCH v2] arm64: tlbflush: Don't broadcast if mm was only
 active on local cpu
Message-ID: <ajDYV6RvujcJ7zOA@a079125.arm.com>
References: <20260523134710.3827956-1-linu.cherian@arm.com>
 <ai6KzFgfMAxqplcr@willie-the-truck>
 <bfc8803d-b375-477e-bba7-806edaf86578@arm.com>
 <ajAPnahwTe1OHQDp@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajAPnahwTe1OHQDp@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_220012_872186_1FAED6D8 
X-CRM114-Status: GOOD (  16.77  )
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

Hi,

On Mon, Jun 15, 2026 at 03:43:41PM +0100, Will Deacon wrote:
> On Mon, Jun 15, 2026 at 12:21:19PM +0100, Ryan Roberts wrote:
> > On 14/06/2026 12:04, Will Deacon wrote:
> > > On Sat, May 23, 2026 at 07:17:10PM +0530, Linu Cherian wrote:
> > >> From: Ryan Roberts <ryan.roberts@arm.com>
> > >>
> > >> Testing with 7.1-rc4 :
> > >> +-----------------------+---------------------------------------------------+-------------+
> > >> | Benchmark             | Result Class                                      |  Improvement|  
> > >> +=======================+===================================================+=============+
> > >> | perf/syscall          | fork (ops/sec)                                    |   (I) 3.25% |
> > >> +-----------------------+---------------------------------------------------+-------------+
> > >> | pts/memtier-benchmark | Protocol: Redis Clients: 100 Ratio: 1:5 (Ops/sec) |   (I) 2.70% |
> > >> | 			| Protocol: Redis Clients: 100 Ratio: 5:1 (Ops/sec) |   (I) 2.13% |
> > >> +-----------------------+---------------------------------------------------+-------------+
> > > 
> > > I think we need a much more comprehensive set of benchmarks before we can
> > > begin to consider a change like this.
> > 
> > I believe that Linu ran a wider set of benchmarks and didn't find any
> > regressions. These are just the ones that show improvement (Linu, please correct
> > me and/or provide details).
> 
> I think it's important to show the ones that suffer as well... and also
> look at different configurations (e.g. preemptible settings) and different
> environments (e.g. native vs in a VM).

All our tests were ran on the host. 
Yeah, agree that other suggested configurations/environments need to be anlayzed as well.

--
Thanks,
Linu Cherian.

