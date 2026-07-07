Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09757C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 14:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2+T/Jggvqz6cZ+zi/SQhTFIKS0RfRSrRiwzkzIBLZwg=; b=ePDv829APNhcHKEe4FjNsXjYBZ
	6/HRv6SFAmYRfAJewALH/g99dZ/MmYZTux1NFHYsiS2Q88Edai/yzUfa3oriQlAUCeig5e7h+sXCp
	aiP1nQ03rWQaLLNH/4uCuh8RX5tSk9cXVLaw7mQPLkR2bmZYDd0H4H5ikV05cePj2wNqBuxAA6rlN
	auxYiZhPrRkv1NX4eP6ZWnzb8ZAxEA8rptJ98vpe6sV6Ufw1Cxy4TLu43P0RSR4vPZPuj2KKLSHHH
	KJBgfIDw7dVyDLh9kcP+m1JKBimNBR0pTWhUjSsJcpdTmmTN5dZhhtjQpjpeMGmoiUQxbpCw53kpd
	USGxTXuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh6jC-0000000FAob-1wFy;
	Tue, 07 Jul 2026 14:24:50 +0000
Received: from out-172.mta1.migadu.com ([95.215.58.172])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh6j8-0000000FAnZ-2a6B
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 14:24:48 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783434272;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2+T/Jggvqz6cZ+zi/SQhTFIKS0RfRSrRiwzkzIBLZwg=;
	b=DfqxHamDlz5qcPAWYuuHVuYkYYUJwZ96BSHL0ZJrhPEGwqr6ZvD6DuUNw8//aiTXYUKYbz
	pXgnmUU6kS8cFmiu4vA/Z+2KN//6fnfdJH89gNnoiR4XFd72NE2dyRouZUlX3Id9Pi50JK
	g0iQ4ZR4nlKToLXxtJXAO4ePYkZWsWY=
From: Usama Arif <usama.arif@linux.dev>
To: Puranjay Mohan <puranjay@kernel.org>
Cc: Usama Arif <usama.arif@linux.dev>,
	bpf@vger.kernel.org,
	Puranjay Mohan <puranjay12@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Leo Yan <leo.yan@arm.com>,
	Rob Herring <robh@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Shuah Khan <shuah@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Ravi Bangoria <ravi.bangoria@amd.com>,
	Stephane Eranian <eranian@google.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH v5 2/4] perf/core: Clear the whole branch entry in perf_clear_branch_entry()
Date: Tue,  7 Jul 2026 07:24:22 -0700
Message-ID: <20260707142424.1687033-1-usama.arif@linux.dev>
In-Reply-To: <20260616155716.2631508-3-puranjay@kernel.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_072446_864070_1DAE2E6E 
X-CRM114-Status: GOOD (  15.89  )
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

On Tue, 16 Jun 2026 08:57:07 -0700 Puranjay Mohan <puranjay@kernel.org> wrote:

> perf_clear_branch_entry_bitfields() resets the bitfields of struct
> perf_branch_entry one at a time and deliberately leaves from/to alone,
> since callers overwrite those immediately. The list of assignments has to
> be kept in sync with the struct by hand, and it has already drifted:
> new_type and priv were added to perf_branch_entry but never cleared here,
> so stale values can leak into the records handed to userspace.
> 
> Clear the entry with a single struct assignment instead:
> 
> 	*br = (struct perf_branch_entry){ };
> 
> Every caller writes from/to right after the clear, so zeroing them as well
> is harmless and the dead stores are elided on the x86 LBR read paths.
> There is no longer anything to keep in sync when a field is added.
> 
> The helper no longer touches only the bitfields, so rename it to
> perf_clear_branch_entry() and update the callers, fixing up the
> br+nr/br+out spacing on the touched lines while at it.
> 
> Fixes: b190bc4ac9e6 ("perf: Extend branch type classification")
> Fixes: 5402d25aa571 ("perf: Capture branch privilege information")
> Suggested-by: James Clark <james.clark@linaro.org>
> Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
> ---
>  arch/x86/events/amd/brs.c   |  2 +-
>  arch/x86/events/amd/lbr.c   |  2 +-
>  arch/x86/events/intel/lbr.c |  6 +++---
>  drivers/perf/arm_brbe.c     |  2 +-
>  include/linux/perf_event.h  | 16 ++--------------
>  5 files changed, 8 insertions(+), 20 deletions(-)
> 

Acked-by: Usama Arif <usama.arif@linux.dev> 

