Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB7ECA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 13:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pe5SE8cLTPPyLKyF6S5l44TjxJSycuwoPwH53Hc4MBc=; b=f4+jL9MUjGWDnCUrGcUrpA0YYf
	C+o4nI2hZhX2y1WwUnIq9SCCDo+ppPcg4RrIoWHJKIhnfqfPS8vV0CZ07QnGPe6bqR6nUvyOqfkTO
	OlwZCpEC/mPkTcqiiJnRqUYeniVtmYhwKnf7Y4B+PhdCSug1vZ2Y+K4W3gxQYxD7fDpqydfKC2+3f
	X7tiEFVemAHqxBMiehroD5Up/fNHo5ysdiO9T+UILdVeIvmHMOn29DelrEKpFCwpREJYtCZK0xy7Q
	6MMqsR4JovPCSicsFK97ajFU7V+X0dPdKugiPbbw0cVL6xmFKlU145crsb8xcxgWnZK1sj/OcLI6l
	o8TRGvOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqtQ6-0000000C2pc-2XHs;
	Tue, 26 Aug 2025 13:09:02 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqtKn-0000000C1mf-3py9;
	Tue, 26 Aug 2025 13:03:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=pe5SE8cLTPPyLKyF6S5l44TjxJSycuwoPwH53Hc4MBc=; b=s5T3h8QunORHMVi1lJq+TueBjc
	cEFljtvjN5QJ03jRIuUbqZT2dzYWLCkq7EIgZ1HjiZepKSvKZUS4jhIftbJpUomzAxLkXpo4MhYIl
	ZCvpLQBdWeqllwk2L5LEakNCj50aVxzY1I5n8BnO+qCbmyfysUZaBrevf4ZwX/NHQuj2PrtwGK3Is
	jhSt6FlQLnGrrRwVWOG3VEhB1mGDJu+1EhbkwSGhAG25rhQM5DyWklhsvsXQh2tW5FYLoYbc8dttl
	tsa9sX+EEmcEbn/jBCdJY0wOlh7GZntWiVjKPlxT8hw9CmspDWHiAZfhSZSTIR8f/mKGoVnI/OKYV
	DfymEZ2w==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqtKk-00000002CWx-1CxP;
	Tue, 26 Aug 2025 13:03:31 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id E7FAC3002C5; Tue, 26 Aug 2025 15:03:29 +0200 (CEST)
Date: Tue, 26 Aug 2025 15:03:29 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: mingo@redhat.com, will@kernel.org, mark.rutland@arm.com,
	acme@kernel.org, namhyung@kernel.org,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	irogers@google.com, adrian.hunter@intel.com,
	kan.liang@linux.intel.com, linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-rockchip@lists.infradead.org, dmaengine@vger.kernel.org,
	linux-fpga@vger.kernel.org, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, coresight@lists.linaro.org,
	iommu@lists.linux.dev, linux-amlogic@lists.infradead.org,
	linux-cxl@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 12/19] perf: Ignore event state for group validation
Message-ID: <20250826130329.GX4067720@noisy.programming.kicks-ass.net>
References: <cover.1755096883.git.robin.murphy@arm.com>
 <d6cda4e2999aba5794c8178f043c91068fa8080c.1755096883.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d6cda4e2999aba5794c8178f043c91068fa8080c.1755096883.git.robin.murphy@arm.com>
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

On Wed, Aug 13, 2025 at 06:01:04PM +0100, Robin Murphy wrote:
> It may have been different long ago, but today it seems wrong for these
> drivers to skip counting disabled sibling events in group validation,
> given that perf_event_enable() could make them schedulable again, and
> thus increase the effective size of the group later. Conversely, if a
> sibling event is truly dead then it stands to reason that the whole
> group is dead, so it's not worth going to any special effort to try to
> squeeze in a new event that's never going to run anyway. Thus, we can
> simply remove all these checks.

So currently you can do sort of a manual event rotation inside an
over-sized group and have it work.

I'm not sure if anybody actually does this, but its possible.

Eg. on a PMU that supports only 4 counters, create a group of 5 and
periodically cycle which of the 5 events is off.

So I'm not against changing this, but changing stuff like this always
makes me a little fearful -- it wouldn't be the first time that when it
finally trickles down to some 'enterprise' user in 5 years someone comes
and finally says, oh hey, you broke my shit :-(


