Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5340FC61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 14:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/QGm/YFP6xrwih2aqZGPXYJOhN5wWJFLJDg/51WYw20=; b=5Du3W1gQI1MhQM5FlTZYTMlIby
	aUpqOGmwvOHbR4k5np2UtqR3CkctxDl7zpRZGpyo6p4vysrbvIigayEyef8QCv/HZOQtSRuTkHJy6
	20KyAAofZ71I7017cZaIfrA5COZ/qEi3iEBzEQC71AsH8ne2Xz5k8t2zdZvdSMhG90dCyc5xDG4ZM
	g6da/N6jOJsqLKjB89TwUrgOI/jcmvfAPADHj/nQbco83D+ULlyRKMDTbcgPGVHGXishoRWZafM3a
	73ylPSdEz0J1kAAt/bPBUSiMggL9VkgTzhBdJJ31LpCObsg9wcp9Ofx2a8yOvJcR5RCLtHfVIKQW0
	/Eaq3WHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzb4a-00000004AHl-3oVt;
	Thu, 27 Aug 2026 14:27:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzb4Y-00000004AHR-0H6q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 14:27:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 77BF71691;
	Thu, 27 Aug 2026 07:27:12 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F32CB3F7D8;
	Thu, 27 Aug 2026 07:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787840836; bh=r0ySLqPyuNENyTpsvEaGFphpnJIcH3tX6bc1QHr9jqg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IeV45dqgx4mRaxoEbmuZZLi7m359mdGCaHjEZzT8ye+3dWAGoS8D9re32lynaa88z
	 JeSfSWhc2s3EO8J3VgE/iJvR6Od4/WQWFvSAn5IM61hKHm5org2eLQ1hd31ZLY6VFx
	 qy4wuTAMTjSNYGKKfU4BMKZpRvEeF5DPdPO/fCsU=
Date: Thu, 27 Aug 2026 15:27:14 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>,
	Leo Yan <leo.yan@linux.dev>, linux-arm-kernel@lists.infradead.org,
	coresight@lists.linaro.org, linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 05/14] perf cs-etm: Increase default timestamp
 generation period
Message-ID: <20260827142714.GM8904@e132581.arm.com>
References: <20260821-james-cs-unformatted-per-thread-fix-v2-0-00c4fd0701b4@linaro.org>
 <20260821-james-cs-unformatted-per-thread-fix-v2-5-00c4fd0701b4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821-james-cs-unformatted-per-thread-fix-v2-5-00c4fd0701b4@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_072718_148399_82909120 
X-CRM114-Status: GOOD (  14.45  )
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

On Fri, Aug 21, 2026 at 10:49:03AM +0100, James Clark wrote:
> The original purpose of timestamps in per-CPU mode was to roughly emit
> samples in the order they occurred across multiple CPUs, rather than
> emit all the trace from CPU 1 followed by all from CPU 2 etc.
> Previously there was no way to change the interval from the minimum of 1
> cycle, but custom intervals are now supported by the driver.
> 
> Drastically reduce the number of timestamps emitted by increasing the
> interval, which is more than enough to interleave sample generation.
> This reduces the size of the trace generated.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>

Reviewed-by: Leo Yan <leo.yan@arm.com>

