Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC90C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 08:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q7ra92S2TxTnRNeXWfAmnmJxMYA9//0DIsg+DFwp27U=; b=rXQm4i9ENTx0SCTQy4H7ecSrGM
	DsLHng53KnB+KVGJZNs5FlQLqUiQp+gCD9+ef/J5p6dZApwa4Vv5pd7pTqMv+FCZc5Hv5+zELpwat
	EBSFe5TEyftmwM+MKFxF5MhrWVZn3AlGjneiHqB3FF/rVjFrTDDAkWG3LYKp1mDwVmtJS69zyaX0D
	YTZdEl+LOAA7XNx9LegGYP79bQbwClIS7NrJt6B3AzfL3H2hiLAEU8WpU60Y0+ALRbiTXflIlZ+uU
	YfpSKnXRoeZZLjkxOQUKCM5Y+XKovw8+qWvAbtVNdY2ch6RyS8C+R95AsGLtfvZLE5wrMYx9+W4LO
	klZR/7kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61p2-00000002gjO-0l4e;
	Mon, 14 Sep 2026 08:13:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61oz-00000002gi8-2cnW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 08:13:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 294771570;
	Mon, 14 Sep 2026 01:13:42 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 65B693F7B4;
	Mon, 14 Sep 2026 01:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789373625; bh=IUx9npSbM6aOGbT981H4LjgrA0kKmEs/fDvfjpfynoU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ie0F5Yrzn4+JUTJXdJ59qKHeSnntkVs/evhaYFzCMI5fXmKYH+ALw+LAaNOIZflIx
	 cchmn6Qw7oauzbwstdIZIrMFDU5g5YkP0LZS323YQUWkpNicFH6hRlQqRd42sDydXD
	 VqDiywdnOT+pXi0AJXMsRgbNU6Aemrf8+CG/mmpE=
Date: Mon, 14 Sep 2026 09:13:43 +0100
From: Leo Yan <leo.yan@arm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: James Clark <james.clark@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Suyash Mahar <smahar@meta.com>, Leo Yan <leo.yan@linux.dev>,
	linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 00/14] perf cs-etm: Per-thread mode fixes and snapshot
 wrap support
Message-ID: <20260914081343.GF200420@e132581.arm.com>
References: <20260811-james-cs-unformatted-per-thread-fix-v1-0-90565318f5f8@linaro.org>
 <aqdL33fw9AoxTrPq@x2>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqdL33fw9AoxTrPq@x2>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_011349_701145_F4319B6C 
X-CRM114-Status: GOOD (  14.01  )
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

Hi Arnaldo,

On Sun, Sep 13, 2026 at 10:20:31PM -0300, Arnaldo Carvalho de Melo wrote:
> On Tue, Aug 11, 2026 at 04:30:03PM +0100, James Clark wrote:
> > Fix a few issues with per-thread mode:
> >   - With TRBE, thread migrations hit a queue without a decoder assert
> >   - On nVHE, everything looks like guest trace instead of host
> >   - Tracing multiple threads didn't really work
> 
> This series applies cleanly to perf-tools-next but has no Reviewed-by
> nor was processed by Sashiko.
> 
> Can somebody from the ARM camp take a look at it, please?

James has sent v2 [1] and I gave some words on it. Adrian also has one
comment for snapshot callbacks refactoring.

Sashiko also sent out review on the series.

Thanks,
Leo

[1] https://lore.kernel.org/linux-perf-users/20260821-james-cs-unformatted-per-thread-fix-v2-0-00c4fd0701b4@linaro.org/

