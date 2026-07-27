Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA92C53209
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 22:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0JjD6lkFG+20UmtbdWZxcSfJM0w+DF0///X2tria5TU=; b=RNWttA0E8flleAbW0HOrkJHs27
	lJQ2iPOTcRy3ZUMZFF+/vPnthV/tO3AAVmolTTiefxKhUla2Nk8eAJx5np6jcFZU6W4S9ng84OJFO
	4CQuoeZw1bu5igzGjkfTi0Ijp1sc0nM0m+GBO+3uFXsLCcUZUazDkGg875Ck1UPq7KBJhHaoXOwCN
	6qd2GvkR71mWL4OLQe1K1qrhC2lvMmeNC6cDHdPx3YQ0azWqg8hXwyhr4lN5aUk+xiWypp8BfetTk
	WoWPmLPvJF0SrxRj78olB6iq4E0cHlZuQTfbuegStWLmHJbKMX2gvdCziTfZZQtFUKchSlieXiJSt
	rxOPJBOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woTdI-000000040SY-0W26;
	Mon, 27 Jul 2026 22:17:12 +0000
Received: from gentwo.org ([62.72.0.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woTdF-000000040Rk-1FjE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 22:17:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1785189987;
	bh=0JjD6lkFG+20UmtbdWZxcSfJM0w+DF0///X2tria5TU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GsmIl0hXdDi2A+F3WW3vwTaE1qAEDh8CDi57M+9dpVeT7GPRHBTxFgdMnhzxeVyXC
	 1GmsQ5DzDRWgK4lpCB8RH3ku6XZwWRqSn7DdV96ERj/Se2GsDU7W0Q1nrhIzd4W+BB
	 SUUi6XIXSIQpNVqEBcWKk/1mSXCEO25lBAPx+vuI=
Received: by gentwo.org (Postfix, from userid 1003)
	id 5D65B406C9; Mon, 27 Jul 2026 15:06:27 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id 5A28340112;
	Mon, 27 Jul 2026 15:06:27 -0700 (PDT)
Date: Mon, 27 Jul 2026 15:06:27 -0700 (PDT)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: Mark Rutland <mark.rutland@arm.com>
cc: Yang Shi <yang@os.amperecomputing.com>, 
    Ryan Roberts <ryan.roberts@arm.com>, dennis@kernel.org, tj@kernel.org, 
    urezki@gmail.com, catalin.marinas@arm.com, will@kernel.org, 
    david@kernel.org, akpm@linux-foundation.org, hca@linux.ibm.com, 
    gor@linux.ibm.com, agordeev@linux.ibm.com, linux-mm@kvack.org, 
    linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC v2 PATCH 0/16] Optimize this_cpu_*() ops for non-x86 (ARM64
 for this series)
In-Reply-To: <amCPBrdltFSE_fEf@J2N7QTR9R3>
Message-ID: <25d1e09b-53e4-7cd5-87db-b58437e4e690@gentwo.org>
References: <20260715180455.515692-1-yang@os.amperecomputing.com> <0344c559-1959-4531-9265-d5a5180eb7cd@arm.com> <fc21c840-1584-4844-963f-80cea7f2e674@os.amperecomputing.com> <amCPBrdltFSE_fEf@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_151709_355864_27B509C5 
X-CRM114-Status: GOOD (  16.73  )
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

On Wed, 22 Jul 2026, Mark Rutland wrote:

> I expect that should come with a reasonable benefit, but I don't have
> benchmark figures yet as I haven't finished converting the xchg and
> cmpxchg implementations.
>
> > It sounds like it just moved the cost from one place to the other
> > place and it also seems hacky TBH.


Yang Shi's patch has *no* critical section. There is no additional code
for the RMV instruction. The RMV instruction is executed on the correct
per cpu area. One of the reasons for the performance win is the
eliminattion of these critical sections. Your approach still has some form
of prologue and posthandling like the current preempt approach and
therefore will not be able to have the same performance gains.

The code is more efficient, there is no restart necessary and the
technique is already widely used on x86 for a long time.

Having the ability in general to map mmemory differently depending on the
cpu opens up a number of other optimization like

1. Per Node areas. Calculations of addresses for per node data and RMV
operations on per node data becomes as trivial as the per cpu data
handling. This will further reduce and eliminate critical sections
currently necessary to handle per node data modifications for NUMA
configurations which are increasingly becoming important for large core
configurations on ARM64.

2. Kernel text replication. Kernel text can be replicated per node or
per whatever memory is closer to the executing code. This avoids transfers
via the on chip memory busses and increases performance. We have seen
20-50% on that one.

3. Readonly data replication. A similar approach is possible for kernel
read only data.

3. Read-mostly replication. This is a bit more complex and the writes
become more expensive since updates have to be made to all copies but
a read-mostly variable is rarely written and the replication will reduce
the latencies to reach these variables.


4. Custom sets of cores that operate on shared data that is replicated
per node or some custom set of cores. This is for example
useful for network devices that have the ability to do I/O via a split
PCI bus or other construct where I/O lanes are duplicated to sets of
cores.


What we are proposing here is a basic new feature that simplifies code and
allows addititonal performance and functional features that are so far not
possible on ARM64.

