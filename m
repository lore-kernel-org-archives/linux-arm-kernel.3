Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3AA7CA0FE7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 15:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FcndkzIKdhQTHHJTPG9dU2kV/c8wF3eTUqiMjqK+Ok4=; b=Bv4F4l6WeNZBikIteHLPWQEC9p
	Z85mHu9nIF9AXysDncHXHim7R4miAFSq9ElqyiVZ+9MBXiKm0aywOSOkHcfwWsm9d9IKKP2aw+hpZ
	eZCDAbIa0uvycc0KZKbp7JRnWxQJrOO5GaMV2LD22XlMnCjg9YTDCqB4u3LWRhuFyVvqcxTdSpyK5
	mJeErZ4WsO3N5B//iunJbHvvKUFrePYgIEgsyx0sKF1UiZ2tVPcx+n33s2Da5xJzWgIFeUdvmnxgr
	UfEP6tS5J+T0D5C17AgnX9Ptl+PznR5ackBp8k3814dFBi+Xuyv4u4hif9x8owLWmdO/NiWs3mOfi
	sNz1676Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqvjQ-0000000CT88-29GI;
	Tue, 26 Aug 2025 15:37:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqvej-0000000CSWI-0uMT;
	Tue, 26 Aug 2025 15:32:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E872169E;
	Tue, 26 Aug 2025 08:32:08 -0700 (PDT)
Received: from [10.57.4.86] (unknown [10.57.4.86])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 893E73F63F;
	Tue, 26 Aug 2025 08:32:09 -0700 (PDT)
Message-ID: <6080e45d-032e-48c2-8efc-3d7e5734d705@arm.com>
Date: Tue, 26 Aug 2025 16:32:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/19] perf: Ignore event state for group validation
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@redhat.com, will@kernel.org, mark.rutland@arm.com, acme@kernel.org,
 namhyung@kernel.org, alexander.shishkin@linux.intel.com, jolsa@kernel.org,
 irogers@google.com, adrian.hunter@intel.com, kan.liang@linux.intel.com,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
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
References: <cover.1755096883.git.robin.murphy@arm.com>
 <d6cda4e2999aba5794c8178f043c91068fa8080c.1755096883.git.robin.murphy@arm.com>
 <20250826130329.GX4067720@noisy.programming.kicks-ass.net>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250826130329.GX4067720@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_083217_359881_A3AAC5B7 
X-CRM114-Status: GOOD (  21.46  )
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

On 2025-08-26 2:03 pm, Peter Zijlstra wrote:
> On Wed, Aug 13, 2025 at 06:01:04PM +0100, Robin Murphy wrote:
>> It may have been different long ago, but today it seems wrong for these
>> drivers to skip counting disabled sibling events in group validation,
>> given that perf_event_enable() could make them schedulable again, and
>> thus increase the effective size of the group later. Conversely, if a
>> sibling event is truly dead then it stands to reason that the whole
>> group is dead, so it's not worth going to any special effort to try to
>> squeeze in a new event that's never going to run anyway. Thus, we can
>> simply remove all these checks.
> 
> So currently you can do sort of a manual event rotation inside an
> over-sized group and have it work.
> 
> I'm not sure if anybody actually does this, but its possible.
> 
> Eg. on a PMU that supports only 4 counters, create a group of 5 and
> periodically cycle which of the 5 events is off.
> 
> So I'm not against changing this, but changing stuff like this always
> makes me a little fearful -- it wouldn't be the first time that when it
> finally trickles down to some 'enterprise' user in 5 years someone comes
> and finally says, oh hey, you broke my shit :-(

Eww, I see what you mean... and I guess that's probably lower-overhead 
than actually deleting and recreating the sibling event(s) each time, 
and potentially less bother then wrangling multiple groups for different 
combinations of subsets when one simply must still approximate a complex 
metric that requires more counters than the hardware offers.

I'm also not keen to break anything that wasn't already somewhat broken, 
especially since this patch is only intended as cleanup, so either we 
could just drop it altogether, or perhaps I can wrap the existing 
behaviour in a helper that can at least document this assumption and 
discourage new drivers from copying it. Am I right that only 
PERF_EVENT_STATE_{OFF,ERROR} would matter for this, though, and my 
reasoning for state <= PERF_EVENT_STATE_EXIT should still stand? As for 
the fiddly discrepancy with enable_on_exec between arm_pmu and others 
I'm not really sure what to think...

Thanks,
Robin.

