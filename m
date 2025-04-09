Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B08C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 11:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GUZC2dpXxXNqbfR+oiD/p3uOMkYo7UqjSUCujBB5WuE=; b=wHiLELditrdO9Di9GzhDRwqP/E
	FpbJax0ku3hmQwTFCzxBrmEs98ksw52X/5oCEnO9RRZrVqBC25r3Bx7Uu+D06PlTKYefR2c20/2nx
	IE412cjkTSH61h7l8QXpuJHonrc+abspy7IMs2kXhDhqELX94Io0Na8YixjxnGjUT1/RifXn35qbu
	TW4g68VKL+CeE5ho2qm+u32bYYKIHc0/O25LeuDBv4UUj4ZRIwZldDNoq7wFppQuA9AOaz0aSaPyN
	IY2RWjRmUwvhjhCG3quh1AIGc/YgAsSjgZ2MQl9yYgOsBM3R1gL2EBkuSGr9ZZm6Yt+VRMG3yVERq
	JhemdiyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2TpB-0000000722v-4AZE;
	Wed, 09 Apr 2025 11:42:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Tmn-000000071fp-2vrI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 11:40:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 65302615EB;
	Wed,  9 Apr 2025 11:39:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0025C4CEE3;
	Wed,  9 Apr 2025 11:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744198804;
	bh=DLBwwNWnA+fgJ6dwEkWaa43c/CIIIb95epf0rVpyE1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m7Pybuc9nNJOmvYGtlFb+aAVj+YgJCFhfVZHHSlqC998vKiRcZPKIb+HM0Rch09jw
	 +qVUrbTkCzmnpv1B71Ue1/uT4u/UcxlUWtnRINGSk8vf5fzpzWndfuHmeEuXsKITLZ
	 J8bXKGgJT8gO60BR+UizPc9GM/xRa99aBZX2VXl+Hpj89W+ChnZZkOif5s70tuU1o3
	 RybfJeijLs5vbrBeRk3do0aUDpSaaKYQQVRyw9Tsf16FSjRWmPFk7dRCVOiz1WXWhl
	 zG1l68R8IeLd8j5voAJmdysMwcZZEpGia7W9U+Rk8z92c9PO+8QI/q2OkwbJGenWDa
	 HM/uWIW85/8Ag==
Date: Wed, 9 Apr 2025 13:39:58 +0200
From: Ingo Molnar <mingo@kernel.org>
To: mark.barnett@arm.com
Cc: peterz@infradead.org, mingo@redhat.com, acme@kernel.org,
	namhyung@kernel.org, irogers@google.com, ben.gainey@arm.com,
	deepak.surti@arm.com, ak@linux.intel.com, will@kernel.org,
	james.clark@arm.com, mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	adrian.hunter@intel.com, linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/5] perf: Record sample last_period before updating
Message-ID: <Z_ZcjvdC0W3Kq2kq@gmail.com>
References: <20250408171530.140858-1-mark.barnett@arm.com>
 <20250408171530.140858-2-mark.barnett@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408171530.140858-2-mark.barnett@arm.com>
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


* mark.barnett@arm.com <mark.barnett@arm.com> wrote:

> From: Mark Barnett <mark.barnett@arm.com>
> 
> This change alters the PowerPC and x86 driver implementations to record
> the last sample period before the event is updated for the next period.
> 
> A common pattern in PMU driver implementations is to have a
> "*_event_set_period" function which takes care of updating the various
> period-related fields in a perf_event structure. In most cases, the
> drivers choose to call this function after initializing a sample data
> structure with perf_sample_data_init. The x86 and PowerPC drivers
> deviate from this, choosing to update the period before initializing the
> sample data. When using an event with an alternate sample period, this
> causes an incorrect period to be written to the sample data that gets
> reported to userspace.
> 
> Link: https://lore.kernel.org/r/20240515193610.2350456-4-yabinc@google.com
> Signed-off-by: Mark Barnett <mark.barnett@arm.com>
> ---
>  arch/powerpc/perf/core-book3s.c  | 3 ++-
>  arch/powerpc/perf/core-fsl-emb.c | 3 ++-
>  arch/x86/events/core.c           | 4 +++-
>  arch/x86/events/intel/core.c     | 5 ++++-
>  arch/x86/events/intel/knc.c      | 4 +++-
>  5 files changed, 14 insertions(+), 5 deletions(-)

I've picked up this patch into tip:perf/core, because I think it makes 
sense standalone as well.

Thanks,

	Ingo

