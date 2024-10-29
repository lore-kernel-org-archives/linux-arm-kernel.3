Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C942D3A67B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 18:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q2CXyOyiMyozAJjqL3drcaZfq+20DV7QLITz0htcMVs=; b=Q7nKzjaLaVQXSs1mVGeSK9omjp
	1zdMrCk1M/O6w4bVSZ93I+83nvhvTrvh49oTrIhPw6dJ+Smn7Drori5TZ2+JIAojCcSlxZl7jTDjJ
	Kg7/amjbWj5wTHm396GLCI/Rzu19TssFSjLVtLWHUbElCYUv1dk8w5tDwn9AttF9KH6O3qnujNP97
	OU+nhI3HM34YY2ZENnepIs7o8Vmq4xQZtycqAH2PByBz6NP9vCSTXxbU0mWdw/xmUs1ncllh/3ch6
	Fdfq24XaECnrqh2GFPh+fuhvc2bj39B5rMaJuAnvR073cmtcCABuatDaRjqXB0VmKw/s8QjpfXmhx
	2gCBfIdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5rFv-0000000FYdS-0o2J;
	Tue, 29 Oct 2024 18:47:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5pMX-0000000FAYk-1x9A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 16:46:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DDC61113E;
	Tue, 29 Oct 2024 09:46:59 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.2.76.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B7FE53F73B;
	Tue, 29 Oct 2024 09:46:29 -0700 (PDT)
Date: Tue, 29 Oct 2024 16:46:28 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: linux-perf-users@vger.kernel.org, Ryan.Roberts@arm.com,
	Kiel.Friedt@arm.com, Julio.Suarez@arm.com,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	Besar Wicaksono <bwicaksono@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] perf arm-spe: Use old behavior when opening old SPE files
Message-ID: <20241029164628.GA24446@e132581.arm.com>
References: <20241029143734.291638-1-james.clark@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241029143734.291638-1-james.clark@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_094633_569772_FACC55E8 
X-CRM114-Status: GOOD (  14.03  )
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

On Tue, Oct 29, 2024 at 02:37:33PM +0000, James Clark wrote:
> 
> Since the linked commit, we stopped interpreting data source if the
> perf.data file doesn't have the new metadata version. This means that
> perf c2c will show no samples in this case.
> 
> Keep the old behavior so old files can be opened, but also still show
> the new warning that updating might improve the decoding.
> 
> Also re-write the warning to be more concise and specific to a user.
> 
> Fixes: ba5e7169e548 ("perf arm-spe: Use metadata to decide the data source feature")
> Signed-off-by: James Clark <james.clark@linaro.org>

Reviewed-by: Leo Yan <leo.yan@arm.com>

