Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA4E4CD6E7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 13:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J0R4eBG2pFYNvoAv6aArk0OSJ05uyndW9ZEtAs++bJk=; b=Rp2QML+s15kJBObYprXMCsmYhV
	Y8GJPhDsjkqM4k64SeXAAyA9Qfv6+wLB3mmKTy+Ro61LwicUOdoaVGToTwl1aHTHFW420a5R2rhMS
	xTF3PSlrrNVbY5Omvk6qakcIJ2Q4L946+CmxiwGC0N6zmJsPbLHzyzdHSsva7c2+MIJxB1jwbmK40
	YQLACQOj3BuL+zLrxK5jUC7goxWmmwJcY9vVU5Con49F4os6Y1f7gcAAK3qXSC80NXar/GybSdL97
	izr/6Yp2ij/2pKCMMVkm95PSGgrqaj88YGO9aqmmdGXpkPXYb615ryOroAtwaomPIjVcmlUUSOhEL
	/8gngjVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVUzj-00000000hC1-1ZFX;
	Fri, 05 Jun 2026 13:53:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVUzi-00000000hBv-0Pxa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 13:53:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 07217601E3;
	Fri,  5 Jun 2026 13:53:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82EE71F00898;
	Fri,  5 Jun 2026 13:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780667632;
	bh=J0R4eBG2pFYNvoAv6aArk0OSJ05uyndW9ZEtAs++bJk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=A9St+RvVrzyZl1ZMltNKutIQ4v56AK9zs+Vr6o/Gw9W8YZzAgleY83Gj5tnrWqydv
	 AdT056a/FPR/9138v3+ImH4wqZtMbBAYNqbYRQPuIe9Tt4Q8tsPXSyqMYCwyrd4RMv
	 A77jBow2Hfw7i08PjR8ogFZQ9YU3f7fvI7U+y+5KYtTh6fESF/Ezz9WCfT+21oizXA
	 5vS0IiejhSADD+AjeTi1nsCORC1GBX2JrZy+nrPEcfktzLtTj85ZM7HuO9kxmfAgeO
	 abA/pREttTxluz8Ydipn9WHLOzoipIwUI1hZwuS7laf3zAoMttwO/y/Z0OatWqDVf9
	 sc9zAKaZVrkOQ==
Date: Fri, 5 Jun 2026 08:53:51 -0500
From: Rob Herring <robh@kernel.org>
To: Puranjay Mohan <puranjay@kernel.org>
Cc: bpf@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Leo Yan <leo.yan@arm.com>, Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Shuah Khan <shuah@kernel.org>, Breno Leitao <leitao@debian.org>,
	Ravi Bangoria <ravi.bangoria@amd.com>,
	Stephane Eranian <eranian@google.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Usama Arif <usama.arif@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v4 3/4] perf/arm64: Add BRBE support for
 bpf_get_branch_snapshot()
Message-ID: <20260605135351.GA3587043-robh@kernel.org>
References: <20260527121207.2312181-1-puranjay@kernel.org>
 <20260527121207.2312181-4-puranjay@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260527121207.2312181-4-puranjay@kernel.org>
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

On Wed, May 27, 2026 at 05:11:59AM -0700, Puranjay Mohan wrote:
> Enable bpf_get_branch_snapshot() on ARM64 by implementing the
> perf_snapshot_branch_stack static call for BRBE.
> 
> BRBE is paused before masking exceptions to avoid branch buffer
> pollution from trace_hardirqs_off(). Exceptions are then masked with
> local_daif_save() to prevent PMU overflow pseudo-NMIs from interfering.
> If an overflow between pause and DAIF save re-enables BRBE, the snapshot
> detects this via BRBFCR_EL1.PAUSED and bails out.
> 
> Branch records are read using perf_entry_from_brbe_regset() with a NULL
> event pointer to bypass event-specific filtering. The buffer is
> invalidated after reading.
> 
> Introduce a for_each_brbe_entry() iterator to deduplicate bank
> iteration between brbe_read_filtered_entries() and the snapshot.
> 
> Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
> ---
>  drivers/perf/arm_brbe.c  | 127 ++++++++++++++++++++++++++++++++-------
>  drivers/perf/arm_brbe.h  |   9 +++
>  drivers/perf/arm_pmuv3.c |   5 +-
>  3 files changed, 119 insertions(+), 22 deletions(-)

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

