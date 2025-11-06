Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33199CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 13:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ORo1xqmWZ5pKXroAjbSmyJ1XsOLfjCUVVUX+CFoxLU=; b=Kvy0H2UavzZLDHPL7Up/LBsBsz
	7IlqXVaw1G9wbRKlG+mDhoyMdCj+euPZyJmJWTeAH3Tx9GJ7r/B3TbGZfiqUI685IKRAyuI4dxSwx
	MtcnC8ZLYA03YHrYiNtP40/6o/vqfFSOb+OGZ2A+NsCkW8UNi7iZd+q587QNchXNB+ws8I6plzbiA
	k2XOP+SbhyT9ASOXFnzcldhKKRUAy8Jh6rOgz9d/qk5PW+wU2QDwjdEtQ46RUUCgg8eyVYnDMUU+H
	/JJWMTRJb0uL4hwRFTPP0a9Lgv9reYUMIkCwTf8MAtClfdG0qR58AX0k4UrHT/bSY/s6CytOvFbUP
	aClgz96A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH0QJ-0000000Fdg4-2Sgy;
	Thu, 06 Nov 2025 13:53:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH0QH-0000000FdfR-0wbD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 13:53:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CB65F1596;
	Thu,  6 Nov 2025 05:52:59 -0800 (PST)
Received: from arm.com (RQ4T19M611-5.cambridge.arm.com [10.1.31.13])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CC1713F66E;
	Thu,  6 Nov 2025 05:53:06 -0800 (PST)
Date: Thu, 6 Nov 2025 13:53:04 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Willy Tarreau <w@1wt.eu>
Cc: Yicong Yang <yangyccccc@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: Overhead of arm64 LSE per-CPU atomics?
Message-ID: <aQyoQMHA_2HuK9sH@arm.com>
References: <31847558-db84-4984-ab43-a5f6be00f5eb@paulmck-laptop>
 <aQU7l-qMKJTx4znJ@arm.com>
 <5ab48722-8323-45af-b585-23b34af3017e@paulmck-laptop>
 <e819db66-7f60-464d-9ee8-4e8ee3e59acf@paulmck-laptop>
 <aQXtqoUEtDr-xUeS@arm.com>
 <3868c862-cf16-4259-829e-e9004028b3c1@gmail.com>
 <aQtQRSoL8GGVNrUQ@arm.com>
 <20251105134231.GF22848@1wt.eu>
 <aQtkA0cOb6Fm9Mrc@arm.com>
 <20251106074439.GB24713@1wt.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106074439.GB24713@1wt.eu>
X-TUID: aDGuSLsQUONB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_055309_410644_4FF5B7EF 
X-CRM114-Status: GOOD (  19.92  )
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

On Thu, Nov 06, 2025 at 08:44:39AM +0100, Willy Tarreau wrote:
> Do you have pointers to some docs suggesting what instructions to use
> when you prefer a near or far operation, like here with stadd vs ldadd ?

Unfortunately, the architecture spec does not make any distinction
between far or near atomics, that's rather a microarchitecture and
system implementation detail. Some of the information is hidden in
specific CPU TRMs and the behaviour may differ between implementations.

I hope Arm will publish some docs/blogs to give some guidance to
software folk (and other non-Arm Ltd microarchitects; it would be good
if they are all aligned, though some may see this as their value-add).

> Also does this mean that with LSE a pure store will always be far unless
> prefetched ? Or should we trick stores using stadd mem,0 / ldadd mem,0
> to hint a near vs far store for example ?

For the Arm Ltd implementations, _usually_ store-only atomics are
executed far while those returning a value are near. But that's subject
to implementation-defined configurations (e.g. IMP_CPUECTLR_EL1). Also
the hardware may try to be smarter, e.g. detect contention and switch
from one behaviour to another.

> I'm also wondering about CAS,
> if there's a way to perform the usual load+CAS sequence exclusively using
> far operations to avoid cache lines bouncing in contended environments,
> because there are cases where a constant 50-60ns per CAS would be awesome,
> or maybe even a CAS that remains far in case of failure or triggers the
> prefetch of the line in case of success, for the typical
> CAS(ptr, NULL, mine) used to try to own a shared resource.

Talking to other engineers in Arm, I learnt that the architecture even
describes a way the programmer can hint at CAS loops. Instead of an LDR,
use something (informally) called ICAS - a CAS where the Xs and Xt
registers are the same (actual registers, not the value they contain).
The in-memory value comparison with Xs either passes and the written
value would be the same (imp def whether a write actually takes place)
or fails (in theory, hw is allowed to write the same old value back). So
while the value in Xs is less relevant, CAS will return the value in
memory. The hardware detects the ICAS+CAS constructs and aims to make
them faster.

From the C6.2.50 in the Arm ARM (the CAS description):

  For a CAS or CASA instruction, when <Ws> or <Xs> specifies the same
  register as <Wt> or <Xt>, this signals to the memory system that an
  additional subsequent CAS, CASA, CASAL, or CASL access to the
  specified location is likely to occur in the near future. The memory
  system can respond by taking actions that are expected to enable the
  subsequent CAS, CASA, CASAL, or CASL access to succeed when it does
  occur.

I guess something to add to Breno's microbenchmarks.

-- 
Catalin

