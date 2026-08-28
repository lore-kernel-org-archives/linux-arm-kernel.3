Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B4FC61DCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 11:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/lOeYdMQM0yEpqRm+8VJ/e9jItYU1+vsePznvGbz10E=; b=OWZ2wDx+i8+pBfKoq5ETTeBHV2
	D7JcEumjZbX/ZYWrlvBRjcOnZsY6BLMmREQvavAs10tlvHSsOSZl7b8bv114uSYMzCVEvXM8YWROW
	aMqOnSKo1xaWnXePKYWimUgXslqR6Hr4uCrmCAl1YkF4ZZ4RSOvxkm58p1IVAkI8up7qfFWUIRYGi
	/U04wdNyddqXW9tZCGuYSwFv3QL8CkG1dXyB8+b3ksKmcuh4QJun5C78BE0+hsCDy8fWNO94HjmJ1
	1Q3i30A2IaVqVxWlW6c7CgzPmjUzMzF+yDbozzq0ukmB3qOTbz+7UEGwmmoCq8F0v809DhmXXsg4V
	G/0Ziamg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzvA5-00000005go0-1T47;
	Fri, 28 Aug 2026 11:54:21 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzvA4-00000005gns-1BEw;
	Fri, 28 Aug 2026 11:54:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/lOeYdMQM0yEpqRm+8VJ/e9jItYU1+vsePznvGbz10E=; b=g5q3o2RCbyi+Yqbp+LTKaPTquE
	7gXYHP3tdr0knxX02PNNzCPOBFWn57YdhfVMe2wVBn0jGTz5C70WZiFqi6q+gGpJPkpRmT276v/iI
	Nx0JCxTzmg7piqalBDEI5CPqK/IwzqOegpNF6bmFCbfFSyS7FPEGTGn4XOICrl7KJogrp6jKLKtiQ
	BFLUSYdoBlhM6+BShUVl6Sc7u4HOo0ZtjEDUm1F2Mv+GRSw0GDtY23DSYzC52ibhjXBiKIkIMO7OJ
	m942aboClPHVMssGPyAA7ZQN5VBksW6w6zHJtn0ckV3dbahbmennTJsAMre8Tcbx+K52/+vDwChBY
	c6XrVZ4w==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzv9w-0000000EdPK-1I3d;
	Fri, 28 Aug 2026 11:54:12 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 4D3CF30030F; Fri, 28 Aug 2026 13:54:10 +0200 (CEST)
Date: Fri, 28 Aug 2026 13:54:10 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: David Stevens <stevensd@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dave Chinner <david@fromorbit.com>, Qi Zheng <qi.zheng@linux.dev>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Kees Cook <kees@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>, suleiman@google.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org, linux-rt-devel@lists.linux.dev
Subject: Re: [RFC 06/10] Reclaim memory from blocked kernel stacks
Message-ID: <20260828115410.GL687043@noisy.programming.kicks-ass.net>
References: <20260827232948.2520558-1-stevensd@google.com>
 <20260827232948.2520558-7-stevensd@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827232948.2520558-7-stevensd@google.com>
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

On Thu, Aug 27, 2026 at 04:29:44PM -0700, David Stevens wrote:
> A new TASK_STACK_RECLAIM state is introduced for tasks that are
> blocked waiting for the stacks to be repopulated.

Not yet read the full patch, but *why*.

