Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BA7DCA0FEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 15:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R6vFVNJRVB+bu2nwcTJzte8jG6oVPL3Cag8hGJewTTY=; b=tbC0BxFYE05dT67mWqK9oIGEPB
	s1wA3szBMW1N96cZq+sODLn0y1qrM42OI2H57vC/b0xF+uyWjHYY9sV8lsofPg5Dv50K6GwtKXg0K
	oxcH3r3JGnJO9FxHyXcLtLSkOUtoAkMrLnBt4vyon6ROdCBGcqo1qbAZKN6x6/RbcX40wjtQoBdWN
	ZG2EvH5GaEX6ynQxP7jxGdxFFvoq+A2y3L2YwwHWmjXNNIs62ghtiWPbjTX7BAgGy6QZA97U6w3KX
	znuHXb+/WEoamtlse1+c96allS94MZRza0mESB6UCWlUqrhLnn4gDsWjDnbsT5atSfGz6bSCj09uk
	UHCOP5+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqw5G-0000000CYqe-0ynC;
	Tue, 26 Aug 2025 15:59:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqw1e-0000000CXUW-2dRW;
	Tue, 26 Aug 2025 15:55:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A3F871A25;
	Tue, 26 Aug 2025 08:55:49 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D7E113F694;
	Tue, 26 Aug 2025 08:55:51 -0700 (PDT)
Date: Tue, 26 Aug 2025 16:55:49 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: peterz@infradead.org, mingo@redhat.com, will@kernel.org,
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
Subject: Re: [PATCH 02/19] perf/hisilicon: Fix group validation
Message-ID: <aK3ZBUQ3QeB2egX7@J2N7QTR9R3>
References: <cover.1755096883.git.robin.murphy@arm.com>
 <c7b877e66ba0d34d8558c5af8bbb620e8c0e47d9.1755096883.git.robin.murphy@arm.com>
 <aK2XS_GhLw1EQ2ml@J2N7QTR9R3>
 <ab80cb84-42b2-4ce8-aa6c-4ce6be7a12b7@arm.com>
 <aK3TS3s5_Pczx1nu@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aK3TS3s5_Pczx1nu@J2N7QTR9R3>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_085558_761790_683DA3EA 
X-CRM114-Status: GOOD (  34.67  )
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

On Tue, Aug 26, 2025 at 04:31:23PM +0100, Mark Rutland wrote:
> On Tue, Aug 26, 2025 at 03:35:48PM +0100, Robin Murphy wrote:
> > On 2025-08-26 12:15 pm, Mark Rutland wrote:
> > > On Wed, Aug 13, 2025 at 06:00:54PM +0100, Robin Murphy wrote:
> > > > diff --git a/drivers/perf/hisilicon/hisi_pcie_pmu.c b/drivers/perf/hisilicon/hisi_pcie_pmu.c
> > > > index c5394d007b61..3b0b2f7197d0 100644
> > > > --- a/drivers/perf/hisilicon/hisi_pcie_pmu.c
> > > > +++ b/drivers/perf/hisilicon/hisi_pcie_pmu.c
> > > > @@ -338,21 +338,16 @@ static bool hisi_pcie_pmu_validate_event_group(struct perf_event *event)
> > > >   	int counters = 1;
> > > >   	int num;
> > > > -	event_group[0] = leader;
> > > > -	if (!is_software_event(leader)) {
> > > > -		if (leader->pmu != event->pmu)
> > > > -			return false;
> > > > +	if (leader == event)
> > > > +		return true;
> > > > -		if (leader != event && !hisi_pcie_pmu_cmp_event(leader, event))
> > > > -			event_group[counters++] = event;
> > > > -	}
> > > > +	event_group[0] = event;
> > > > +	if (leader->pmu == event->pmu && !hisi_pcie_pmu_cmp_event(leader, event))
> > > > +		event_group[counters++] = leader;
> > > 
> > > Looking at this, the existing logic to share counters (which
> > > hisi_pcie_pmu_cmp_event() is trying to permit) looks to be bogus, given
> > > that the start/stop callbacks will reprogram the HW counters (and hence
> > > can fight with one another).
> > 
> > Yeah, this had a dodgy smell when I first came across it, but after doing
> > all the digging I think it does actually work out - the trick seems to be
> > the group_leader check in hisi_pcie_pmu_get_event_idx(), with the
> > implication the PMU is going to be stopped while scheduling in/out the whole
> > group, so assuming hisi_pcie_pmu_del() doesn't clear the counter value in
> > hardware (even though the first call nukes the rest of the event
> > configuration), then the events should stay in sync.
> 
> I don't think that's sufficient. If nothing else, overflow is handled
> per-event, and for a group of two identical events, upon overflow
> hisi_pcie_pmu_irq() will reprogram the shared HW counter when handling
> the first event, and the second event will see an arbitrary
> discontinuity. Maybe no-one has spotted that due to the 2^63 counter
> period that we program, but this is clearly bogus.
> 
> In addition, AFAICT the IRQ handler doesn't stop the PMU, so in general
> groups aren't handled atomically, and snapshots of the counters won't be
> atomic.
> 
> > It does seem somewhat nonsensical to have multiple copies of the same event
> > in the same group, but I imagine it could happen with some sort of scripted
> > combination of metrics, and supporting it at this level saves needing
> > explicit deduplication further up. So even though my initial instinct was to
> > rip it out too, in the end I concluded that that doesn't seem justified.
> 

[...]

> As above, I think it's clearly bogus. I don't think we should have
> merged it as-is and it's not something I'd like to see others copy.
> Other PMUs don't do this sort of event deduplication, and in general it
> should be up to the user or userspace software to do that rather than
> doing that badly in the kernel.
> 
> Given it was implemented with no rationale I think we should rip it out.
> If that breaks someone's scripting, then we can consider implementing
> something that actually works.

FWIW, I'm happy to go do that as a follow-up, so if that's a pain, feel
free to leave that as-is for now.

Mark.

