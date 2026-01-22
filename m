Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F9E1C44500
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 11:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jx2pCN9Ec8TyjQCYt+K4aC5SwbCBhnd7JzdHLYj43+I=; b=GZwVXzXSS5NO08Nh1zmThYzEXN
	WYWJ5JwtFQwjCeQw8TOF2OAdHbkEx36qTPVqoVqOcjgDhZUJ2/UDO/FcJXtruOcYKdKmXvWjWiwH3
	X0hSgMxEvKZqZATTTtGeW16Ytx4VLQqh/ETCQD9jdH2YTGtJwIuKrSsWKkIL4CEGOVritOGUzQNnU
	Ipbwgm25V8XzoweS+GR9DztiSI568eONb310cP+cR133eFbI8+uyASeM3LPfql9FJcQ//m43hwd/x
	JR+pQw9v+zhHcll2JjiBZJGm75brgayU3AhYZ9hTNGw/nRLHXUK9rELk7D+UR8P2kYfdQ6I8FbFZC
	xU3ytE2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vitBj-00000006zz6-3WlG;
	Thu, 22 Jan 2026 11:49:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vitBg-00000006zyQ-2v9e
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 11:49:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF9C41476;
	Thu, 22 Jan 2026 03:49:11 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 579503F632;
	Thu, 22 Jan 2026 03:49:17 -0800 (PST)
Date: Thu, 22 Jan 2026 11:49:15 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Usama Anjum <usama.anjum@foss.arm.com>
Cc: Carl Worth <carl@os.amperecomputing.com>, Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Taehyun Noh <taehyun@utexas.edu>,
	Peter Collingbourne <pcc@google.com>
Subject: Re: [PATCH v2 2/2] arm64: mte: Set TCMA1 whenever MTE is present in
 the kernel
Message-ID: <aXIOu2_ZvNXyl1SJ@arm.com>
References: <20251030-mte-tighten-tco-v2-0-e259dda9d5b3@os.amperecomputing.com>
 <20251030-mte-tighten-tco-v2-2-e259dda9d5b3@os.amperecomputing.com>
 <7e47cccb-5d9f-470d-9de1-8caddc300646@foss.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e47cccb-5d9f-470d-9de1-8caddc300646@foss.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_034920_787404_B057BFF7 
X-CRM114-Status: GOOD (  20.61  )
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

On Thu, Jan 22, 2026 at 10:23:01AM +0000, Usama Anjum wrote:
> On 15/01/2026 11:07 pm, Carl Worth wrote:
> > Set the TCMA1 bit so that access to TTBR1 addresses with 0xf in their
> > tag bits will be treated as tag unchecked.
> > 
> > This is important to avoid unwanted tag checking on some
> > systems. Specifically, SCTLR_EL1.TCF can be set to indicate that no
> > tag check faults are desired. But the architecture doesn't guarantee
> > that in this case the system won't still perform tag checks.
> > 
> > Use TCMA1 to ensure that undesired tag checks are not performed. This
> > bit was already set in the KASAN case. Adding it to the non-KASAN case
> > prevents tag checking since all TTBR1 address will have a value of 0xf
> > in their tag bits.
> > 
> > This patch has been measured on an Ampere system to improve the following:
> > 
> > * Eliminate over 98% of kernel-side tag checks during "perf bench
> >    futex hash", as measured with "perf stat".
> > 
> > * Eliminate all MTE overhead (was previously a 25% performance
> >    penalty) from the Phoronix pts/memcached benchmark (1:10 Set:Get
> >    ration with 96 cores).
> > 
> > Reported-by: Taehyun Noh <taehyun@utexas.edu>
> > Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
> > Signed-off-by: Carl Worth <carl@os.amperecomputing.com>
> 
> Fixes tag is required here so that the fix traverses to the stable kernels.
> I've not found the most appropriate commit:
> 
> 973b9e373306 ("arm64: mte: move register initialization to C")
> bfc62c598527 ("arm64: kasan: allow enabling in-kernel MTE")
> 
> In my opinion, bfc62c598527 should be in the fixes-by tag. At a minimum, the
> back porting should be done till 973b9e373306.

We can always submit it for stable backports even without a fixes tag.
It's more of a hardware implementation choice than actually fixing a
kernel bug. The previous behaviour was also correct.

-- 
Catalin

