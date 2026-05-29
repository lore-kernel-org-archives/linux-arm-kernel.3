Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 042E4CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 14:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SsYvQIujDmIdgNUBpvfrksPzotUo5Kccj0oELYXwLDY=; b=gBZ8RF3jdVV0/GVecReLFOdX/v
	EiLk83s9bKHlMQM0zJMAVYR3gsQOpzwJndEJLjlGovQzxz9EE4a4HxUS8CiZ5jMDAXIvtCajJ4hT0
	2J3hQF9ztH5UXiziEmMZZ9Yxl1JhxyfXGeD2JHh7v4pbJ45rWCocuZSI5PmF8vrhFyWLK90a5ogck
	GgX4+3bhCBy+8Css1vET64WUx7WZEcTQ8mmQS/1pGkwmZ3sD7OEKLZEsrqxpEJj1ujsysvwuCmRxf
	fIDZKpqDafGABFCjELx/4p9bmBMaZog+eWJD1hTaJKonDqimZ1sUunKd3DzNqYxk6LApOdlifPmW+
	Vr1eM+Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSych-00000007aUo-3T5z;
	Fri, 29 May 2026 14:55:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSycf-00000007aUP-23vk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 14:55:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 98EB5416DD;
	Fri, 29 May 2026 14:55:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E44D21F00893;
	Fri, 29 May 2026 14:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780066540;
	bh=SsYvQIujDmIdgNUBpvfrksPzotUo5Kccj0oELYXwLDY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cGxJdkb2Drs7MTaoLBbxzvqLt+NrmVwKoPTpM9pm3Hs88YUWBjbQ5EzLtNWWiV82v
	 rNHGYm69FM8TxyeVoEHMjljrsXtg9KMnCuNWlxTm+snUsRkYr2m8q6DlgAoxGbeLEy
	 P47xfp0nIPI8Vzme0mpl2lCf97Gnzlk2ry1PUQT3nmVFBa13u6a8ebgQO62b2I182C
	 x3r4vjIn0jer7d6UxmaFysE8WyIjJQQpgWatoy0kDj9OYtPXjDC8tzhpuy5E7EcTHP
	 rUXLKstTvJly11pQwX/JkXY4dy/PIhHyKmEiQ32I8p1qPweNHEW+Mm2tLC+2UImSJR
	 IgHobrX5oHn5A==
Date: Fri, 29 May 2026 11:55:36 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	Amir Ayupov <aaupov@meta.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] perf cs-etm: Queue context packets for frontend
Message-ID: <ahmo6AF3oGOvdzT8@x1>
References: <20260526-james-cs-context-tracking-fix-v1-0-ebd602e18287@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526-james-cs-context-tracking-fix-v1-0-ebd602e18287@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_075541_557026_E5D7A908 
X-CRM114-Status: GOOD (  16.84  )
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

On Tue, May 26, 2026 at 12:14:35PM +0100, James Clark wrote:
> Fix thread tracking when decoding Coresight trace and add a new test for
> it.
> 
> Unfortunately the test has to be added as a separate binary like the
> other existing Coresight workloads which needs a bit of makefile
> boilerplate. Ideally it would be a builtin Perf test workload, but Perf
> has a lot of dependencies and generates a lot of trace when starting up
> which makes tracing tests very slow because all that has to be decoded.
> 
> Hopefully I can find a generic way to enable Perf events at the
> beginning of the workload and then I can migrate everything from
> tools/perf/tests/shell/coresight to Perf test workloads, but that will
> have to be done as a separate change.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>

James, there are some review comments from Sashiko, some looks
legitimate, wdyt?

- Arnaldo

