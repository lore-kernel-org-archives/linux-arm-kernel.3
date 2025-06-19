Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84072C7115D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 18:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6KgTUgptpiWMwjvOBVqoGa8FI++A6MkAZJ+pAv8RD5c=; b=CZYX1bJrQZimBSbIFl1NBZuc03
	ocaGt26xcY6DpHuKTUqVeDfJzh7DciCVzBe6r7VIgcAWHBGhXazeJk6DMSa+et2hyPVw5z58tz7bX
	GlahhMpQWSyc4oCROPjmEFId0rjkltQqkxyYeETjLQqiiMbIrKwdaGy6wRBdxYNoSx3cB+yyRi/bb
	cKQ1LCK+0rrXe3VTYvmCvZZz1Z4j7o5FL2Tv2dxlKZpczuMk62fnG/yoxCVhmzwRws44U4HQqql2l
	3nqaQjbHGmfrbA0gLDKMc0PYq2RPlyp1j846HxjvTsCy7M8/uXxNlBpIJZVfMqehnzF5d39KKam6f
	q+CZeMtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSKBB-0000000DxmL-3Utb;
	Thu, 19 Jun 2025 18:40:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSI2M-0000000DcBd-1h7s
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 16:22:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 56773113E;
	Thu, 19 Jun 2025 09:22:27 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E56733F66E;
	Thu, 19 Jun 2025 09:22:46 -0700 (PDT)
Date: Thu, 19 Jun 2025 17:22:44 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>
Subject: Re: [PATCH 01/12] drivers/perf: arm_spe: Store event reserved bits
 in driver data
Message-ID: <20250619162244.GH794930@e132581.arm.com>
References: <20250613-arm_spe_support_hitm_overhead_v1_public-v1-0-6faecf0a8775@arm.com>
 <20250613-arm_spe_support_hitm_overhead_v1_public-v1-1-6faecf0a8775@arm.com>
 <3a833298-10a1-4c6a-8a90-6836c47a1dcb@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a833298-10a1-4c6a-8a90-6836c47a1dcb@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_092250_486748_2645904F 
X-CRM114-Status: GOOD (  14.94  )
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

On Thu, Jun 19, 2025 at 12:28:27PM +0100, James Clark wrote:

[...]

> > @@ -77,6 +77,7 @@ struct arm_spe_pmu {
> >   	u16					pmsver;
> >   	u16					min_period;
> >   	u16					counter_sz;
> > +	u64					pmsevfr_res0;
> 
> IMO this is a premature optimization and we shouldn't store things that are
> only transformations of some other already stored value. It becomes another
> thing to worry about when it's valid to read and to potentially keep it up
> to date etc.
> 
> It's just one new one now, but eventually you end up with tons of them and
> then someone forgets to update a dependent one when the parent value changes
> and it makes a mess.
> 
> And arm_spe_pmu_event_init() isn't even a particularly hot path.

Makes sense. I will drop this one.

Thanks for suggestions!

Leo

