Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C439EC02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 17:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QMQi9P7mgZSLjWYGfJaTAUWNWhaxbVZX6rSghrmmJyE=; b=1xunacxCDNMkvuVUSmCWTKD4j1
	j9VM8nZMYIDvHUdBMEmEGJkEeswwZ3fSF9G5swiGbfwpPhfblgviKfkaQobhuozMQ0ixGHl6MtHNo
	QqFvcpJ2nD3pa7yHRmTiJd2OxRpE5Oxlp868WXpOBiWGRW/sARK/wsQI1w/PRJm89LsKI0ll2r39w
	Dh2HJh/q4FQwKaWh1AcETVHj/LFaaHMgZRWGxYzOnqrUxuQ4vMifTSFdUVsiqHMKxhbdvv51pZ0rv
	UBic7YrNgzlsqUZ3CRYDI/8uFb4oEOt+Y25tm6Cr83QqeLgSFWgcWOOJulL905Sq0mgYFfp7UAUfN
	7kcMzJnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taHz0-00000008T2U-28y5;
	Tue, 21 Jan 2025 17:24:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taHx8-00000008Sli-2ZaC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 17:22:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CE6B8106F;
	Tue, 21 Jan 2025 09:22:41 -0800 (PST)
Received: from localhost (e132581.arm.com [10.2.76.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB3E33F66E;
	Tue, 21 Jan 2025 09:22:12 -0800 (PST)
Date: Tue, 21 Jan 2025 17:22:02 +0000
From: Leo Yan <leo.yan@arm.com>
To: "mark.barnett@arm.com" <mark.barnett@arm.com>
Cc: peterz@infradead.org, mingo@redhat.com, acme@kernel.org,
	namhyung@kernel.org, irogers@google.com, ben.gainey@arm.com,
	deepak.surti@arm.com, ak@linux.intel.com, will@kernel.org,
	james.clark@arm.com, mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	adrian.hunter@intel.com, linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 5/5] perf: Record sample last_period before updating
Message-ID: <20250121172202.GB416913@e132581.arm.com>
References: <20250106120156.227273-1-mark.barnett@arm.com>
 <20250106120156.227273-6-mark.barnett@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250106120156.227273-6-mark.barnett@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_092214_694375_31A8B7E5 
X-CRM114-Status: GOOD (  16.50  )
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

On Mon, Jan 06, 2025 at 12:01:56PM +0000, mark.barnett@arm.com wrote:
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

I found conflict when I applied this patch on linux-next [1], with the
commit below:

commit faac6f105ef169e2e5678c14e1ffebf2a7d780b6
Author: Yabin Cui <yabinc@google.com>
Date:   Wed May 15 12:36:09 2024 -0700

    perf/core: Check sample_type in perf_sample_save_brstack

    Check sample_type in perf_sample_save_brstack() to prevent
    saving branch stack data when it isn't required.

    Suggested-by: Namhyung Kim <namhyung@kernel.org>
    Signed-off-by: Yabin Cui <yabinc@google.com>
    Signed-off-by: Ingo Molnar <mingo@kernel.org>
    Reviewed-by: Ian Rogers <irogers@google.com>
    Acked-by: Namhyung Kim <namhyung@kernel.org>
    Link: https://lore.kernel.org/r/20240515193610.2350456-4-yabinc@google.com


Please consider to rebase the patch to fix conflict in next spin.

Thanks,
Leo

[1] git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

