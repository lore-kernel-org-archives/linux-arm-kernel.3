Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A1EAC55822
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 21:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4YwgPW4vgXkOtwCrUFfOx8SqTrD0YbybXeQIXMZk7Uo=; b=xOgbnUsKzW/JGCElMIpfVpV9JK
	2BB+J6YxbTSeW7H+eDw5Or2setHJIBUUrB/ABoryBexCekIXtqFaUY70yN5Luh5Qpn7y6uBGVWr/K
	2svQiqbH6nSXJyXW73zK5p6xva6Cy2SFIEXUWckokc9yZ0O7fgK2XcbhYHnW7KODzMalN7hmvxLjF
	7vLOCGLMkcpsnoond9t39+gAyE4ggDOR5rznXDlhZiBwQRss/Fv6OshNBLBvZn/0bHQEzSqERFyUL
	GeOC24v2otqqAoGydB4YgGBBwXS1irBQgT9WcxRBqlOoUisxkczL0QcyXgq3rxUOfSr9nfdtj8o54
	iaWMaW4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrMpM-00000002pMs-4A76;
	Tue, 04 Aug 2026 21:37:36 +0000
Received: from gentwo.org ([62.72.0.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrMpK-00000002pMM-45Y4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 21:37:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1785878717;
	bh=M/vpVfOy0ZJgZObdzgYIGpqP1l9lPmPwrb1z7aUnbOU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Ih+A+O9u/vqY3y2yQbQLUy9ZGbUCaRGM9+alosQw4rgd1vTGEQWgSORSDb3CeHAv8
	 k5cKagTzvV67klavjupMCCotkRDvhlTsNDtODCpQVZpx63uh+H5llAefcJzIHvfbLT
	 hpEPtn06WQr13xj26rknRumyVv9OVS/yINQPJLaA=
Received: by gentwo.org (Postfix, from userid 1003)
	id 57B10408AE; Tue, 04 Aug 2026 14:25:17 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id 5686F40287;
	Tue, 04 Aug 2026 14:25:17 -0700 (PDT)
Date: Tue, 4 Aug 2026 14:25:17 -0700 (PDT)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, 
    Mark Rutland <mark.rutland@arm.com>, 
    Yang Shi <yang@os.amperecomputing.com>, 
    Ryan Roberts <ryan.roberts@arm.com>, dennis@kernel.org, tj@kernel.org, 
    urezki@gmail.com, catalin.marinas@arm.com, will@kernel.org, 
    akpm@linux-foundation.org, hca@linux.ibm.com, gor@linux.ibm.com, 
    agordeev@linux.ibm.com, linux-mm@kvack.org, 
    linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
    Linus Torvalds <torvalds@linux-foundation.org>, 
    Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [RFC v2 PATCH 0/16] Optimize this_cpu_*() ops for non-x86 (ARM64
 for this series)
In-Reply-To: <84b31836-1d10-4bec-a469-468b91fd4645@kernel.org>
Message-ID: <9f146ce0-4adc-0c00-a2d8-c01b47edc9d1@gentwo.org>
References: <20260715180455.515692-1-yang@os.amperecomputing.com> <0344c559-1959-4531-9265-d5a5180eb7cd@arm.com> <fc21c840-1584-4844-963f-80cea7f2e674@os.amperecomputing.com> <amCPBrdltFSE_fEf@J2N7QTR9R3> <25d1e09b-53e4-7cd5-87db-b58437e4e690@gentwo.org>
 <4887267b-dc26-4c33-96ca-8dff054a0d1f@kernel.org> <anHuLy52o5S9Nlwp@lucifer> <63ea8156-a109-b2a2-6d35-1c17ad7f1a9d@gentwo.org> <84b31836-1d10-4bec-a469-468b91fd4645@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_143735_029108_093AD975 
X-CRM114-Status: GOOD (  14.29  )
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

On Tue, 4 Aug 2026, David Hildenbrand (Arm) wrote:

> > rather hacky restart logic. It relies on a long preemable and postscript
> > to each per cpu operations.

> But I am sure you did you homework and have data to back up your claims. Please
> share that data, because I am very curious.

The comparison here is a single instruction on one side and abnd the per
cpu operation prefixed with a preeamble and another instruction / set of
instructions on the other side.

Even if its only one before and one after then we are still looking at 3
instructions instead of one. This is a frequently used operation in the
VM.

You need data to show that one instruction  is faster than 3???

> Mark's solution is the obvious improvement to the problem, doing it just like
> s390 already does.

Well there is interest by the S390 folks to move to what we proposed from
what I can tell.


> If the proposed solution has a significant benefit over Mark's solution it could
> be discussed as a next step; and it must be backed with sufficient data to
> warrant all this complexity here.

You cannot accept that one instruction is faster than the same
instruction prefixed with another and something else at its tail?


