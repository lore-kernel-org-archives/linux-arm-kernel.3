Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E60B4C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 10:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dTFlbsmC0WjAMz9CQYs4K20vlagORcevhwzqv7FeHjg=; b=Y8PriJM1Z5keZXop7xYR9ZpRN4
	UQ36HVSc6aRBY7lQThHyVKaVo23YH+YVQm0L633dzgcrRJNQBSW2juWYJMICF6Iq2Fc6mb9Mymqq1
	8OIHXOAyynLByq8PgF5KlVxVh6z/62WYOikvUNk7c6GuV+MBmDVMtlUvCLdfweT0M+L4+oX+cONP0
	ThEQ7UT0UmLKAWiVNL4l67nsY4JoPPLVze7306+z2HeqgKX1UtNy/rXHUBeAAPg8K4Cdm0TcTn3a+
	sAj6iM64SjBniqSgkttDZcY/OAdn4nqEstjnZP/YqB5NnRQmcQArPL/haaMAV1Ki66Bn4mhIdAb6v
	s9fRfq8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti9cH-00000006v94-24Eb;
	Wed, 12 Feb 2025 10:05:13 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti9Gx-00000006py5-02W5
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 12 Feb 2025 09:43:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dTFlbsmC0WjAMz9CQYs4K20vlagORcevhwzqv7FeHjg=; b=ZKUNfn9YKrc+sODKhuuCqPIHU/
	EUk+PNBuuNAGWpkntmcAJcn9aEay6YbmY3I3dW/oNrdv7DjEpodbkwIvrEXh5r7y9pqgb5AO6RNmp
	60UY/sNaibBFCkJUkwnZJQmUTee0nsaoWuiWucVdQq7oXBml+IrBw+JdPo7HKwBT/4qrjyju8wUIz
	A+nZ3rsg7cfauDLma5ZrHC04J5p53wP86aZyxzy2rHyy4/f4Umoc/0iY6Sqz77Uj+xjwtUG7UeZxx
	bwtUJxO+uE8P+G+WUjuzSt4bR8Z+MzVJKr4mJL90r9FYWDgWZrVEFWs9fSny+N2u9rrJIVeV/sFZC
	XAbFSFdg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1ti9Gu-00000004Al6-1Win;
	Wed, 12 Feb 2025 09:43:08 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id F2CDF300318; Wed, 12 Feb 2025 10:43:07 +0100 (CET)
Date: Wed, 12 Feb 2025 10:43:07 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Cristian Prundeanu <cpru@amazon.com>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>,
	Hazem Mohamed Abuelfotoh <abuehaze@amazon.com>,
	Ali Saidi <alisaidi@amazon.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Geoff Blake <blakgeof@amazon.com>, Csaba Csoma <csabac@amazon.com>,
	Bjoern Doebel <doebel@amazon.com>,
	Gautham Shenoy <gautham.shenoy@amd.com>,
	Joseph Salisbury <joseph.salisbury@oracle.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Borislav Petkov <bp@alien8.de>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-tip-commits@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH 0/2] [tip: sched/core] sched: Disable PLACE_LAG and
 RUN_TO_PARITY and move them to sysctl
Message-ID: <20250212094307.GB19118@noisy.programming.kicks-ass.net>
References: <20250119110410.GAZ4zcKkx5sCjD5XvH@fat_crate.local>
 <20250212054113.19938-1-cpru@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212054113.19938-1-cpru@amazon.com>
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

On Tue, Feb 11, 2025 at 11:41:13PM -0600, Cristian Prundeanu wrote:

> Your find also helps to point out that even when it works, SCHED_BATCH is 
> a more complex and error prone mitigation than just disabling PL and RTP. 
> The same reproducer setup that uses systemd to set SCHED_BATCH does show 
> improvement in 6.12, but not in 6.13+. There may not even be a single 
> approach that works well on both.
> 
> Conversely, setting NO_PLACE_LAG + NO_RUN_TO_PARITY is simply done at boot 
> time, and does not require further user effort. 

For your workload. It will wreck other workloads.

Yes, SCHED_BATCH might be more fiddly, but it allows for composition.
You can run multiple workloads together and they all behave.

Maybe the right thing here is to get mysql patched; so that it will
request BATCH itself for the threads that need it.

