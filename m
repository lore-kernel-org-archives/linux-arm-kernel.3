Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5C9ACD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 13:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k8RDT23gkMNXguGXL5C2X5G/nYVTX72HdDgIRNjQMbk=; b=q7yVhthKEl7Xx4RklXAoAoVX+K
	6DVoz2Zt9UpUB9vwjBtZdjJZemYh/gT2vAuFzlJw4d1PnKp57AA06dtIwYuJCQhmrWIWC3HjT+Yp9
	1pcf4WGnwLm+wYeZou7DxgTCYZgVqeD1Qjb27i+jgHoByhpVvtMRmF6wN8/MIjkxVVr4Ao1BpPWv0
	fTfzQ5x5d1l2oIVDNO63zzDntHRpF2vwAinxuDvCGpWxAlnqIrd+GBYmujnaZ3rQu87TgKABWkqDZ
	emOE4yjOWbv1+QRsXYsB/a/elyuG0A3MRAABM+8UhLfhKHta/4XWCXHjb8HQJGgJMzMmEWKTOu0vP
	WYP7aOCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waZ7t-00000002TIw-2Q2D;
	Fri, 19 Jun 2026 13:19:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waZ7q-00000002TIa-1HNC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 13:19:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5382A2972;
	Fri, 19 Jun 2026 06:19:07 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D522D3F763;
	Fri, 19 Jun 2026 06:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781875151; bh=IXPRMUIPVIuAYINomf/QT3LL4Z4pishbHkKoEcIwfTU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HNSAIoqRQuhLmKaaQOBEoRus9h3+8kB2v4jzvU25WorCkv6IPC04GdKMbynmzdPmX
	 DzfveUneQIpjba7UBaNnGBlL/gXeyBGteVAH8BUgPzcfSv6gfkCHHXbtnopRfJIed3
	 Ug4A/BUWCKr8G1v5YI4VM633WANr8cElnPDPi2O0=
Date: Fri, 19 Jun 2026 14:19:05 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Harry Yoo <harry@kernel.org>
Cc: Dev Jain <dev.jain@arm.com>, ryabinin.a.a@gmail.com,
	akpm@linux-foundation.org, corbet@lwn.net, glider@google.com,
	andreyknvl@gmail.com, dvyukov@google.com, vincenzo.frascino@arm.com,
	kasan-dev@googlegroups.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, ryan.roberts@arm.com,
	anshuman.khandual@arm.com, kaleshsingh@google.com,
	21cnbao@gmail.com, david@kernel.org, will@kernel.org
Subject: Re: [RFC PATCH 0/2] kasan: hw_tags: Add option to tag only at
 allocation time
Message-ID: <ajVByfkLbetzA8bB@arm.com>
References: <20260612044425.763060-1-dev.jain@arm.com>
 <b1502a60-09a1-4699-886b-93d041de7023@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1502a60-09a1-4699-886b-93d041de7023@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_061914_475648_BEF96B9C 
X-CRM114-Status: GOOD (  20.40  )
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

On Thu, Jun 18, 2026 at 10:35:15PM +0900, Harry Yoo wrote:
> On 6/12/26 1:44 PM, Dev Jain wrote:
> > Introduce a boot option to tag only at allocation time of the objects. This
> > reduces KASAN MTE overhead, the tradeoff being reduced ability of
> > catching bugs.
> 
> I think most of overhead when enabling MTE comes from loading and
> validing tags for every memory access (either in SYNC or ASYNC mode),
> rather than from storing tags.

I guess it depends on the workload. Lots of allocations for short-lived
buffers (e.g. network traffic) may notice the additional tagging more
than the actual tag checking.

Of course, it would be nice to get some numbers from those who have
access to MTE capable hardware.

> > Now, when a memory object will be freed, it will retain the random tag it
> > had at allocation time. This compromises on catching UAF bugs, till the
> > time the object is not reallocated, at which point it will have a new
> > random tag.
> > 
> > Hence, not catching "use-after-free-before-reallocation" and not catching
> > "double-free" will be the compromise for reduced KASAN overhead.
> 
> I doubt users who care about security enough to enable HW_TAGS KASAN
> are willing to compromise on security just to save a few instructions
> to store tags in the free path.
> 
> To me, it looks like too much of a compromise on security for little
> performance gain.

I don't think there's much compromise on security for use-after-free.
The buffer will be re-tagged later so use-after-realloc should be
caught, especially if we ensure that a different tag will be used (I
don't think Dev's patches do this).

Of course, if you want MTE as a debug/bug-finding feature, tagging on
both allocation and freeing is highly recommended. This patchset is
aimed for those wanting to run MTE in production and squeeze a bit more
performance out of it (with the compromise of not detecting
use-after-free, only prevent access after re-allocation).

-- 
Catalin

