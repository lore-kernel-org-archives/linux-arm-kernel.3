Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB1EBC55822
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 22:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kMV7HR0/CnmihINLeNXxLTzPch53Pj6muqbezN11jys=; b=ZPHpclX6eWcD94S1PFBrYERddA
	IQrZFhOM9GLth2tFYpTcbGF+RCI3Kd2eV7tXxKLHNaOSnD1RHY/cEwYTbCwx2qLZoagExv0Ruf3I4
	y+zTbwSVsayc6p9C2/V0/4hCP8GyRxD1sOca8OFLUTSCxKN7MGNJqJLrGFeZFPURIfdncsmYjV5sJ
	zcJt3gmN/TpYnWDtTdR8lmtVr2X8C9wsHPcwYTCmkLuw8wYR+AwF6/N4iARwMaXWhS2+WfOEo9DXY
	LrWH1R5mY5nXPnYAEDGD3avUmyO8fNhx6AIyFMFpgetFXg9FVYiToWCZqyjuXE7c+kVLI166V/ynl
	BCwCHsIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrNzx-00000002tig-28m6;
	Tue, 04 Aug 2026 22:52:37 +0000
Received: from gentwo.org ([62.72.0.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrNzu-00000002tiK-3F6w
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 22:52:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1785879627;
	bh=kMV7HR0/CnmihINLeNXxLTzPch53Pj6muqbezN11jys=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=c32dVb87oheYpHTCYBu4Zwtx7RyuIzDCmq5LWekWI3DHAiodHDoJcaJSA4i49L9MT
	 lh2khhxfNJbD9DhJ7L++CgNtUeSN/JeH/sYalP7ThMS2Q5EbmyY38W8X4vTyGRuCAm
	 7dN1Iy2GTazRY5X37jYr7i60KKXAPQXJKryy3NUQ=
Received: by gentwo.org (Postfix, from userid 1003)
	id 66A3E408AE; Tue, 04 Aug 2026 14:40:27 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id 64A5840287;
	Tue, 04 Aug 2026 14:40:27 -0700 (PDT)
Date: Tue, 4 Aug 2026 14:40:27 -0700 (PDT)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
cc: Linus Torvalds <torvalds@linux-foundation.org>, 
    "David Hildenbrand (Arm)" <david@kernel.org>, 
    Mark Rutland <mark.rutland@arm.com>, 
    Yang Shi <yang@os.amperecomputing.com>, 
    Ryan Roberts <ryan.roberts@arm.com>, dennis@kernel.org, tj@kernel.org, 
    urezki@gmail.com, catalin.marinas@arm.com, will@kernel.org, 
    akpm@linux-foundation.org, hca@linux.ibm.com, gor@linux.ibm.com, 
    agordeev@linux.ibm.com, linux-mm@kvack.org, 
    linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
    Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [RFC v2 PATCH 0/16] Optimize this_cpu_*() ops for non-x86 (ARM64
 for this series)
In-Reply-To: <anIhSGs70TTzymHM@lucifer>
Message-ID: <8d6119c7-2216-fcdd-d0b9-cc60ccc8caf3@gentwo.org>
References: <0344c559-1959-4531-9265-d5a5180eb7cd@arm.com> <fc21c840-1584-4844-963f-80cea7f2e674@os.amperecomputing.com> <amCPBrdltFSE_fEf@J2N7QTR9R3> <25d1e09b-53e4-7cd5-87db-b58437e4e690@gentwo.org> <4887267b-dc26-4c33-96ca-8dff054a0d1f@kernel.org>
 <anHuLy52o5S9Nlwp@lucifer> <CAHk-=wgJ0wO=T+1G5zJwoeE-N4bAptCNo2TFirK364iPhnGG6A@mail.gmail.com> <dadd8268-3cef-3a3a-e277-b593bef3b788@gentwo.org> <CAHk-=wha5um2rB9u7EDeEhZJyaWOUFye-wTKzsykQqJH41RNdw@mail.gmail.com> <CAHk-=whjfRaeYsAVS9VfYO5uaSB43sT7zPOmNWR6gC8h=t60=g@mail.gmail.com>
 <anIhSGs70TTzymHM@lucifer>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_155234_833351_E2547BD1 
X-CRM114-Status: GOOD (  17.00  )
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

On Tue, 4 Aug 2026, Lorenzo Stoakes (ARM) wrote:

> On Tue, Aug 04, 2026 at 10:01:45AM -0700, Linus Torvalds wrote:
> > So I'm just trying to clarify my stance - I don't hate percpu TLB
> > contents per se. I hate the notion of codifying them.
>
> I do worry that changing per-CPU data structures to support this is exactly
> codifying this (and will encourage other arches to follow suit).
>
> And I really don't think there's any way to implement this without
> fundamentally changing core mm or assumptions that core mm can make.

Would it be possible to discuss the technical issues instead of throwing
up this and that foggy objection? Lets not get into the complexities of
restarting a critical section from an interrupt handler that you are
proposing but lets just look at the code generated for this_cpu_*
operations:

The fundamental problem is that your patchset does


<preeamble establishing restart point>
RMV per cpu op
<post handling cleaning up setup of restart point>


What x86 does and what we can get ARM to do is:

RMW per cpu op




Why do you think that your solution that requires a complex restart
mechanism is better?


These are operations that are key to the performance in critical parts of
memory management and this code is replicated by being inlined thousands
of times in the kernel.



