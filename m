Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE25C79F80
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 16:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NWFUWnZ6K0kaIQa0lax2jcCLiQ0kC63Ncs4dMPYXg+I=; b=3k+EOzKNxcqTCXUI6If6JW6uV1
	xbOw3b+hj1yEv5moe4r+d8VPVNSpQ432Z02XHfJ/O2EagnpiPDrU6/5wlU/GF/bHWU3RL4xopMzuM
	sJkxlsnWj7Txit/5/j5fVyClbRlmKLpi/E/HOHRUq01xWTB3IwP1MJSq00RPSYrZCh0wtcoF2J6Ih
	oU0/aGccqB9rhd/oOheDkJNXj3Zkks4oPnlljSpySq9t79yIADz6+CuY1Ar3DylCxuKzBF+S1Cctq
	8Ix0jgcW4/B6fzaVJTAFDBlV0yUp9iRqKh2jNWcYZxgOwozDgYq+wcZ276v4VOL/dCgal6/LJEEed
	qTlozygg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2X0W-00000002lN1-3R9T;
	Fri, 04 Sep 2026 16:43:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2X0U-00000002lMR-0xjx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 16:43:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 880DE152B;
	Fri,  4 Sep 2026 09:43:08 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CF7133F673;
	Fri,  4 Sep 2026 09:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788540192; bh=NWFUWnZ6K0kaIQa0lax2jcCLiQ0kC63Ncs4dMPYXg+I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VFflIllVWWur8MgIIluCe6ArvirPpjzkKINBQNHG7JxWalWtZCuY9WZf8T0x5ByKB
	 UEZnP63o6FocTm7tPHu+57zl0eT/Xudy2HWrhCOr3+/DBT+Z+zABlFvt5sgNffMQRH
	 w5+V2CaAWMSEwlx1dY+1esEhTntE0+4r1P5Zg1qE=
Date: Fri, 4 Sep 2026 17:43:09 +0100
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
Subject: Re: [PATCH 1/6] perf: cs-etm: Don't add global v0 HW_IDs to
 unformatted queues
Message-ID: <20260904164309.GZ8904@e132581.arm.com>
References: <20260821-james-cs-hw_id-output-failure-v1-0-9d532ddabcc3@linaro.org>
 <20260821-james-cs-hw_id-output-failure-v1-1-9d532ddabcc3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821-james-cs-hw_id-output-failure-v1-1-9d532ddabcc3@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_094314_914494_84B8F390 
X-CRM114-Status: GOOD (  10.91  )
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

On Fri, Aug 21, 2026 at 10:50:29AM +0100, James Clark wrote:
> In the case of mixed formatted and unformatted trace with v0 HW_IDs, or
> no HW_IDs at all resulting in the cs_etm__map_trace_ids_metadata()
> fallback, formatted queues will write their HW_IDs to unformatted
> queues.

I understand a session can support multiple sinks, but I don't expect
to mix up formatted and unformatted trace (see sinks_compatible()).

For the mentioned fallback, I am also struggling to establish a case.
Even AUX_OUTPUT_HW_ID records are absent randomly, I don't think this
impacts the queue's format initalization, no?

