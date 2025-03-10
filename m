Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ADCEC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 11:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BVwMozZT1UuVo58i2jxHgULvSXi7PekjsC9r1wBi4+E=; b=y60QROClYV37Q5COG5DMAWh75Y
	bJHSMAQ7WCXqc8NxJyfwJOKT6CSuwIcxn0QqJD9scr9o1re72uW2rO+0qy76bu0Fzb8tpy+u287lV
	cDKfgnJkiduspJKPanv4+/FTwhcvcc0RzjhPlGbWQkNAUmPonrLRjHkIe3eQjAUgrFF8MKv4cpvmq
	u7e6F8XWg6EGvI/ZMuy0iYT6ENnUUV9U6YWRNHFG/KSmFbiYIXUbyeAf7kaGK9NoRHnxo/Kld5/ec
	uUb8b3RIiK2iSyoyYS147/2E1BNTE+cGx+m3fBKvpHYZMFMfj8iftn9XyEjpSn9Vb85GDOD+urEJR
	Rvp5boMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trbN7-00000002RDk-099x;
	Mon, 10 Mar 2025 11:32:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trand-00000002LFG-1THz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 10:55:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B3D9152B;
	Mon, 10 Mar 2025 03:56:08 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 81E653F5A1;
	Mon, 10 Mar 2025 03:55:56 -0700 (PDT)
Date: Mon, 10 Mar 2025 10:55:51 +0000
From: Leo Yan <leo.yan@arm.com>
To: Mark Barnett <mark.barnett@arm.com>
Cc: peterz@infradead.org, mingo@redhat.com, acme@kernel.org,
	namhyung@kernel.org, irogers@google.com, ben.gainey@arm.com,
	deepak.surti@arm.com, ak@linux.intel.com, will@kernel.org,
	james.clark@arm.com, mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	adrian.hunter@intel.com, linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/5] perf: Allow periodic events to alternate between
 two sample periods
Message-ID: <20250310105551.GB9682@e132581.arm.com>
References: <20250106120156.227273-1-mark.barnett@arm.com>
 <20250106120156.227273-2-mark.barnett@arm.com>
 <20250121130154.GA416913@e132581.arm.com>
 <c62a9f8a-312d-4f9e-9022-265e53564101@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c62a9f8a-312d-4f9e-9022-265e53564101@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_035557_447949_FCE27BE4 
X-CRM114-Status: GOOD (  12.57  )
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

On Fri, Mar 07, 2025 at 08:28:13PM +0000, Mark Barnett wrote:
> On 1/21/25 13:01, Leo Yan wrote:
> > >   	local64_set(&hwc->period_left, hwc->sample_period);
> > > +	if (attr->alt_sample_period) {
> > > +		hwc->sample_period = attr->alt_sample_period;
> > > +		hwc->using_alt_sample_period = true;
> > > +	}
> > 
> > My understanding it sets a short sample window for the first period.
> > Would it initialize the `hwc->period_left` with the updated sample
> > period?
> > 
> 
> It sets the long period first: hwc->period_left is used to program the PMU
> when setting up the event, and hwc->sample_period is queued up as the next
> period to switch to.

Makes sense to me.  Thanks for explanation.

Leo

