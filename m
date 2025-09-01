Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D27B5CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 13:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dXKtdZdVRU5jaokeCxU4a3pcHC4KSVTuFmm06WjEP+0=; b=jILM4fJbuPzfW8+qdFxjczFYQi
	Fhp7ZUkXy4n1AKro/+yfdqxqd16rwyiUoO3Ctnb5vhLY1rMBMi3sbcgGRIqv4BGBc8vn5DJKsYJuh
	NshVo9Hvl+10AoPO9ZQHWy8iRwMk4on6DZaZdzTVt9Nv5gbD8zSoa/xTOWwr+sSBw7+owlnJztWid
	cgsNFnn04Aay+8aJ6bskYlA3LDSwqxDfgD7xSW9u5k20KvUwxVNQIpPQHGp3Zjutz2lUr1qVrqMKm
	lrKoHEPsdQJEdj/igwVPgUr6Lh+kFiHkpNQhYAEQeJGM81ZcA10IbnkTIFkH6smS+MB1FhGl9e1L2
	DVqa42vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut4uS-0000000Ck9y-2r4L;
	Mon, 01 Sep 2025 13:49:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut2je-0000000C3j7-1yLZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 11:30:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5DED34462E;
	Mon,  1 Sep 2025 11:30:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B9EEC4CEF0;
	Mon,  1 Sep 2025 11:30:02 +0000 (UTC)
Date: Mon, 1 Sep 2025 12:29:59 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org,
	arnd@arndb.de, will@kernel.org, peterz@infradead.org,
	akpm@linux-foundation.org, mark.rutland@arm.com,
	harisokn@amazon.com, cl@gentwo.org, ast@kernel.org,
	memxor@gmail.com, zhenglifeng1@huawei.com,
	xueshuai@linux.alibaba.com, joao.m.martins@oracle.com,
	boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
Subject: Re: [PATCH v4 1/5] asm-generic: barrier: Add
 smp_cond_load_relaxed_timewait()
Message-ID: <aLWDt9NpfYO_Utky@arm.com>
References: <20250829080735.3598416-1-ankur.a.arora@oracle.com>
 <20250829080735.3598416-2-ankur.a.arora@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250829080735.3598416-2-ankur.a.arora@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_043006_520616_8F081758 
X-CRM114-Status: GOOD (  11.73  )
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

On Fri, Aug 29, 2025 at 01:07:31AM -0700, Ankur Arora wrote:
> Add smp_cond_load_relaxed_timewait(), which extends
> smp_cond_load_relaxed() to allow waiting for a finite duration.
> 
> The additional parameter allows for the timeout check.
> 
> The waiting is done via the usual cpu_relax() spin-wait around the
> condition variable with periodic evaluation of the time-check.
> 
> The number of times we spin is defined by SMP_TIMEWAIT_SPIN_COUNT
> (chosen to be 200 by default) which, assuming each cpu_relax()
> iteration takes around 20-30 cycles (measured on a variety of x86
> platforms), amounts to around 4000-6000 cycles.
> 
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Will Deacon <will@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: linux-arch@vger.kernel.org
> Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>

Apart from the name, this looks fine (I'd have preferred the "timeout"
suffix).

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

