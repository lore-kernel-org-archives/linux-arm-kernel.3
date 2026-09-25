Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A422BC98321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 12:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZosHltBnwqptbncYYV2cFytr5ieYaMD4AEKATkdnXvc=; b=gZD0eci4sVjegCdyDuP0hQGS98
	n1Vd8sj0B9+G6Uh+/+sYPHmDSzM1kBYrCb1kG7XNaVaqp+SjpQ9MKxW2q7ihh81HlWBmOBkQ36qe3
	vKapwjFuJ9NN/PkPRqpQUHpP9S7hIriUboMjk/B9FrzebfU1/A5Y6FveFAlECbA1sXDI1tHKjlQgX
	X63wnkbAlSzE22/WWb1af0UMlAyHi8qnfQbhAQ6hzS3g+IdHHX4wp31RWoicR9SQ0RK8LZLiEvZF2
	XG9cHPXn5XKLccE9x2oRuBDk6RTZGP677Rvu8z11d4Vr67FXGqZINcitQ2JWoHtjVBXgFQhZfgjhH
	z+BaY7vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA4fK-0000000DH8Y-2CdW;
	Fri, 25 Sep 2026 12:04:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA4fH-0000000DH7r-24ix
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 12:04:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8A445169C;
	Fri, 25 Sep 2026 05:04:23 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 79FB83F86C;
	Fri, 25 Sep 2026 05:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790337867; bh=DPm5L5X/OUylB/usQmYiJR4vbpUS6o8ZX2aJMLsfXdU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rbt3k4oPsHwxM0DkF9YdGKCMn7dRYGK6VycvlsaXA95ufMBJvBDXPhxZSF8padwH8
	 Z9zCr6JtZakbEIcih8o9/kxcmtM6TJBRMtayP+ULhPBzrS0TYHn07pXtjezm8QzQfh
	 BOx1jxJU7YNB75Cl3CCVJEkaOji1kum+SR9HbUAM=
Date: Fri, 25 Sep 2026 13:04:17 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Charlie Garner <charlie@akao.au>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Viresh Kumar <viresh.kumar@linaro.org>, Dhruva Gole <d-gole@ti.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: perf: ignore an implausible
 sustained frequency
Message-ID: <arZjQdIy__kGCAyY@pluto>
References: <20260923152245.44624-1-charlie@akao.au>
 <20260925-native-glorious-kelpie-8bf5dd@sudeepholla>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925-native-glorious-kelpie-8bf5dd@sudeepholla>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_050431_625730_92F1F554 
X-CRM114-Status: GOOD (  40.00  )
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

On Fri, Sep 25, 2026 at 11:00:46AM +0100, Sudeep Holla wrote:
> On Thu, Sep 24, 2026 at 12:52:45AM +0930, Charlie Garner wrote:
> > On a Dell Inspiron 14 Plus 7441 (Snapdragon X Plus X1P64100, soc_id 615)
> > the SCMI firmware reports a sustained frequency below the lowest available
> > OPP for performance domains NCC1 and NCC2. It reports zero for both
> > sustained_freq_khz and sustained_perf_level there, while NCC0 reports
> > 3417600 kHz at level 12. All three domains use level indexing mode, so
> > mult_factor is fixed at 1000 and the OPP frequencies come from
> > indicative_freq; this is not a units or mult_factor problem.
> > 

Hi

seems like I did not receive the original mail anywhhere...

> > scmi_dvfs_device_opps_add() then flags every OPP in NCC1 and NCC2 as turbo:
> > 
> > 	data.turbo = freq > dom->sustained_freq_khz * 1000UL;
> > 
> > cpufreq_frequency_table_cpuinfo() skips boost-flagged entries and fails
> > when none are left:
> > 
> > 	if ((!cpufreq_boost_enabled() || !policy->boost_enabled)
> > 	    && (pos->flags & CPUFREQ_BOOST_FREQ))
> > 		continue;
> > 	...
> > 	if (min_freq == ~0)
> > 		return -EINVAL;
> > 
> > cpufreq_policy_online() drops the policy on that error without logging
> > anything. Only one of the three performance domains ends up with a policy.
> > The part has 10 cores (the x1e80100 DT describes 12, CPUs 7 and 11 fail to
> > boot): 4 of them can scale, the other 6 get no policy, no governor, and no
> > cpufreq cooling device.
> > 
> > This cannot be worked around by enabling boost. policy->boost_enabled is
> > still 0 during that validation, and both places that set it -
> > boost_supported in cpufreq_table_validate_and_sort(), boost_enabled in
> > cpufreq_online() - run after the call that already returned -EINVAL. A
> > domain whose OPPs are all flagged turbo can therefore never get a policy.
> > 
> > Confirmed by probing dev_pm_opp_add_dynamic() on the affected machine: all
> > 13 OPPs are added with turbo=0 for domain NCC0 and turbo=1 for every CPU in
> > NCC1 and NCC2, across an identical 710400-3417600 kHz table. The raw domain
> > attributes above were read the same way, with a kprobe on
> > scmi_dvfs_device_opps_add() fetching the perf_dom_info fields.
> > 
> > A sustained frequency below the lowest OPP carries no information - it
> > cannot separate sustained levels from boost levels. Treat it as "this
> > domain has no turbo levels" instead of letting it disable the domain
> > entirely, and say so once with a FW_BUG warning, since the failure is
> > otherwise silent. A sustained frequency equal to the lowest OPP is left
> > alone, it already leaves that OPP non-turbo.
> > 
> > Fixes: a897575e79d7 ("firmware: arm_scmi: Add support for marking certain frequencies as turbo")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Charlie Garner <charlie@akao.au>
> > ---
> > 
> > Notes:
> >     The SCMI quirks framework (quirks.c) would also work here, and this
> >     platform already has two quirks enabled. I went with a generic check
> >     because a sustained frequency below every OPP is meaningless on any
> >     platform, and the check is a no-op for firmware that reports a sane value.
> >     Happy to turn it into a quirk if you'd prefer that.
> > 
> 
> I am unable to decide which is better approach. I am more inclined to quirks
> so that other systems are not penalised by unnecessary checks but at the same
> time it seems like a sensible generic check.
> 
> Cristian,
> 
> Any strong opinion/inclination ?

No. It is probably an out of spec behaviour that makes sense to spot and
rectify in the original code instead of being doomed to add a string of quirks,
but I am more concerned about upcoming SCMI v4.0 QoS Perf extensions spec which
is public BUT still to come in the implementation, since it makes an extensive
usage of sustained_freq for its own calculation AFAICR

So while now this is flagged as FW_BUG and we carry on because it only impacts
boost, in the future we probably need to shutdown an entire set of features
when this is spotted at discovery, since for anything else that boost I dont
think there is a safe way to guess the proper AND safe sustained levels if
the FW is rotten...

But I suppose we'll take care of that when that time will come...

Thanks,
Cristian

