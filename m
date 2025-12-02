Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E137DD116F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 12:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h0zULD9gusz16XUtadDBYVIJ6/mqS/3pwSn5FKpva0s=; b=uMHHINLqU2T1R8ihSKKnuPSENH
	ok/6tlH2V0LdAALo2RAbtX3WioTCbtNCvsHY/coIV1S/J+Z3He7SfIUCM8FJ6yMpBS59+bxqtZo46
	ADKrRyUU/aCA6kO/Ux75L2LdOuB7xbNmK6IRz5EVRciKkgfCetYNar+m96IrfOUfEF8Q432XXqqEK
	hEicW+BX9uGQf0EJu4rpPgovmVNeviS/tSLap9jp7GAP9/XoGBIdslNsJGCC0pR3otizY6Ho6WwZv
	C7lLyW7bQSamxeMRXPsmS6Pr4uwg1VSpP6Fw69B4WNKnaBb792Ibw5HoUFCBPLaw7hYrvLaelwfq4
	rMUZaCew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQP4q-00000005Lpu-3Yfg;
	Tue, 02 Dec 2025 12:01:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQP4p-00000005Lp0-086h
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 12:01:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6AD51153B;
	Tue,  2 Dec 2025 04:01:42 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 646D23F73B;
	Tue,  2 Dec 2025 04:01:49 -0800 (PST)
Date: Tue, 2 Dec 2025 12:01:47 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	Leo Yan <leo.yan@linux.dev>, linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 5/7] perf cs-etm: Don't use hard coded config bits when
 setting up TRCCONFIGR
Message-ID: <20251202120147.GW724103@e132581.arm.com>
References: <20251201-james-perf-config-bits-v1-0-22ecbbf8007c@linaro.org>
 <20251201-james-perf-config-bits-v1-5-22ecbbf8007c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201-james-perf-config-bits-v1-5-22ecbbf8007c@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_040151_125697_D73403C9 
X-CRM114-Status: GOOD (  11.35  )
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

On Mon, Dec 01, 2025 at 04:41:08PM +0000, Coresight ML wrote:
> Perf only looks at attr.config when determining what was programmed into
> TRCCONFIGR. These bits could theoretically be in any of the config
> fields. Use the evsel__get_config_val() helper so it's agnostic to
> which config field they are in.
> 
> The kernel will also stop publishing the TRCCONFIGR register bits in a
> header [1] so preempt that by defining them here.
> 
> [1]: https://lore.kernel.org/linux-arm-kernel/20251128-james-cs-syncfreq-v8-10-4d319764cc58@linaro.org/
> Signed-off-by: James Clark <james.clark@linaro.org>

Reviewed-by: Leo Yan <leo.yan@arm.com>

