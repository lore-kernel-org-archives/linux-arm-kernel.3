Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C95B1CA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 17:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6UaIwsAAFjadbrYplzkotURcQ5SnRdPh7/z/V55WSoI=; b=ykIjJ3iW42CAbp8exU1esoJrtb
	J/ShsRprxwDqt4xtB+s+IX6E8rsXeK9U/TE7yTuaQy1jGgkJkH/X5cnxKV3QCQjapndYpu1wBzATF
	NTDfec8svI4c5YcmxFBps/lGhEEWpkGVfZM1fu7c2HKVB+8Kngcrnqia6A5pCDurV9l8hPQHjV+Wb
	diM/cHDGhZJImuD3MKrNdLL/JR1S6KbFhzvJYpO1BWQDpu6cwN2Ch5ZMx4meJ8RxZ01lCFutHTQXJ
	b4ebm64ODF739iCQDqdURmymo1tErPn3khgUsw0/FjHQofCYJQNe8kkMPoMULfKW4cqUVMgUHukwn
	lipuTOvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCgy8-0000000C90E-1AI1;
	Fri, 02 Oct 2026 17:22:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCgy5-0000000C8zc-20su
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 17:22:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 14B262F;
	Fri,  2 Oct 2026 10:22:41 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 16DF23F85F;
	Fri,  2 Oct 2026 10:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790961764; bh=r1bFA/wmy6Ap4hGtjh0xolrIUAwgjGIPa6hz30QI12A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZiW3um5Ng6FQCYYSC2M090W3ZquSMnCMTaaO3cxrjvV9LpXa29iUPU7Vkhv5eyEbX
	 dIbjyZnL+E+1WMXfIYibOTOGvY6W89eKA4IP998ebbZea1oa48cIEpq++5pZ+5Itik
	 nbdmFyyGITvGX4oQRXBuKqUIxPZG46+CTbCl4T7o=
Date: Fri, 2 Oct 2026 18:22:42 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/4] perf: cs-etm: Respect --no-itrace option
Message-ID: <20261002172242.GH1208404@e132581.arm.com>
References: <20261002-james-cs-hw_id-output-failure-v3-0-1d8b6ef339c8@linaro.org>
 <20261002-james-cs-hw_id-output-failure-v3-4-1d8b6ef339c8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002-james-cs-hw_id-output-failure-v3-4-1d8b6ef339c8@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_102245_846261_A9A4164A 
X-CRM114-Status: GOOD (  12.96  )
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

On Fri, Oct 02, 2026 at 12:15:14PM +0100, James Clark wrote:
> If there is a bug in decoding then Perf will exit early and you can't
> investigate by using the raw dump mode. Make the --no-itrace option stop
> Coresight decoding after printing the aux header so decode errors don't
> stop the rest of the samples being printed.
> 
> pmu_type and evsel_is_auxtrace need to be set so that the
> unleader_auxtrace() behavior is the same as without --no-itrace.
> 
> Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>
> Signed-off-by: James Clark <james.clark@linaro.org>

Reviewed-by: Leo Yan <leo.yan@arm.com>

