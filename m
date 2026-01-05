Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E863CCD0408
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 21:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jiFEeW5gN2osECrGX/NxhvJp4KMe2lAyJaSIXSOT3Og=; b=2i/KiKFbQ2QHp4oDGYD98GEvSP
	YvuBzUTIqGQAkHCfB7t/e7X/Y67HhpVt4wtfo1Vc2niHCpKOP1tMiaLSi/vYBfj4aAh+hprMIlZlE
	dP0qx+jlLi4U8NxIkphZCC8CU4EM+g/RgDv7KBUY+fBqXnFFbuiY1vylO9A/XjU9EZaG2W8KNvb6W
	2GC1V43BiTiipANqFnnFHt0nWxyUD3JCUw21Gbq/bNqS7HG2qFWvsNl3dapsFFnkzUoURoSrdoVEd
	RdnLHewDKSdtQyXrgjUr3MBBZNxxBp6N4WelnKopixJHf+ATNkNhkL703ySdQUuktVsdthgGurDea
	NkmFsg5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcs1w-0000000C7OM-4C2o;
	Mon, 05 Jan 2026 21:22:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcs1r-0000000C7MS-1i2V
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 21:22:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 94C52339;
	Mon,  5 Jan 2026 13:22:09 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F3BDC3F694;
	Mon,  5 Jan 2026 13:22:15 -0800 (PST)
Date: Mon, 5 Jan 2026 21:22:13 +0000
From: Leo Yan <leo.yan@arm.com>
To: Puranjay Mohan <puranjay12@gmail.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Breno Leitao <leitao@debian.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, kernel-team@meta.com
Subject: Re: [RFC PATCH] perf/arm64: Add BRBE support for
 bpf_get_branch_snapshot()
Message-ID: <20260105212213.GA336318@e132581.arm.com>
References: <20260102214043.1410242-1-puranjay@kernel.org>
 <CANk7y0j7hAJ7OcH_HgN0cVGnUh=iBz=iuD9sYZmSy-koMjB_cg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANk7y0j7hAJ7OcH_HgN0cVGnUh=iBz=iuD9sYZmSy-koMjB_cg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_132219_488934_1F3775BF 
X-CRM114-Status: GOOD (  13.36  )
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

On Fri, Jan 02, 2026 at 09:51:15PM +0000, Puranjay Mohan wrote:
> Hi Catalin, Will, Mark, and Rob.
> 
> I don't have access to BRBE enabled hardware and Qemu doesn't support
> this as well therefore I just sent the compile tested version.
> 
> Can you help me with testing this:
> 
> The relevant bpf self test is:
> 
> ./test_progs -t get_branch_snapshot
> #132     get_branch_snapshot:SKIP
> Summary: 1/0 PASSED, 1 SKIPPED, 0 FAILED
> 
> skipped for my setup as it is not supported.

eBPF selftest build is quite heavy (many dependencies), finally I built
it cleanly.

I did a test on FVP RevC, the test hit NULL pointer deference and kernel
panic in armv8pmu_sched_task().  See https://termbin.com/peg4, the
backtrace should can give you hints for the issue.

Thanks,
Leo

P.s. some logs are duplicate, this might be caused by two cores both hit
the NULL pointer issue ?

