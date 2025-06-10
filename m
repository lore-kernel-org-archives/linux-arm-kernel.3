Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E3B8C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 12:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ElZooU3CNCyqKkNfeNkQwCo1PtAimQ5tNeABrqN0df4=; b=lqZDACKXhTWxdTob8MzUttPrXR
	15OpJpRKIgTDXUphDGlw4EIAQeGKjVvnzSZlVazU/s/ZzPBDIJJoOZNIuh/+Qb5IB5b9xssOtt7Dq
	vHH3E4ELoHra5lVlzi2Tj1oyau7dR202QPi3Bkqdta+G03ahvOsBzfQHNugxYOK83kfMKY5NhEGpn
	9R7iu1Q+FWPt1O5A26obDfukjrqCKTNMfoQtLKy71dcTrWCinqj9iwwlGlrQ9l3bBQ1CtCb6d3lw5
	QqQd9XpGiveOCPzGeLktbWjtPgeHeHkH+mtvwD9a7n3BBVNYpSbm04GYll5qOY8U3JFDOM7+kABkC
	ynho5I9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOxyM-00000006kqi-1xPt;
	Tue, 10 Jun 2025 12:20:58 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOxNz-00000006gCx-2gBZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 11:43:25 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55ABhGWi2272226;
	Tue, 10 Jun 2025 06:43:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749555796;
	bh=ElZooU3CNCyqKkNfeNkQwCo1PtAimQ5tNeABrqN0df4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=CpI7t8Fmy7fmU+FegDv3dQll4pRyI4Vvu7qAc4p57UXrXj+QNOsOFcocrYaaAoaDj
	 r81GTeS9OrLifAb3A0nyYHAsJ1gJ30BNdbDralFO9dU86V4L9ta4UPQBHIuoGi2+kl
	 ufg3hGCjptVeCVr8Hs9Sf5c0SYAAnPXbE6sBq/94=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55ABhGdg225032
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 10 Jun 2025 06:43:16 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 10
 Jun 2025 06:43:16 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 10 Jun 2025 06:43:16 -0500
Received: from localhost (lcpd911.dhcp.ti.com [172.24.227.226])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55ABhFw92838964;
	Tue, 10 Jun 2025 06:43:15 -0500
Date: Tue, 10 Jun 2025 17:13:14 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Sudeep Holla <sudeep.holla@arm.com>
CC: Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson
	<ulf.hansson@linaro.org>, <arm-scmi@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-pm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <vigneshr@ti.com>,
        <khilman@baylibre.com>
Subject: Re: [RFC PATCH] pmdomain: arm: scmi_pm_domain: Do lazy init as part
 of probe
Message-ID: <20250610114314.dpfedrbok2pmfgxu@lcpd911>
References: <20250530103527.2244951-1-d-gole@ti.com>
 <20250530-honest-chital-of-growth-db31e1@sudeepholla>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250530-honest-chital-of-growth-db31e1@sudeepholla>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_044323_808815_34BC389A 
X-CRM114-Status: GOOD (  34.05  )
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

Hi,

On May 30, 2025 at 17:31:08 +0100, Sudeep Holla wrote:
> On Fri, May 30, 2025 at 04:05:27PM +0530, Dhruva Gole wrote:
> > Optimize the SCMI power domain driver to only initialize domains that are
> > actually referenced in the device tree. Previously, the driver would
> > initialize all possible domains up to the maximum ID, which could lead to
> > unnecessary firmware calls and longer probe times.
> > 
> > Key changes:
> > - Scan device tree to identify which power domains are actually referenced
> 
> How do this work with runtime DT overlays ?

Thanks for bringing this up, I hadn't considered runtime DT overlays for
this particular patch.
Off the top of my mind, we can initialize all at probe, but only query state
for referenced ones.

> 
> > - Use bitmap to track needed domains instead of initializing all
> > - Only perform state queries and initialization for referenced domains
> > - Maintain proper array sizing for power domain framework compatibility
> > - Keep full provider structure to support late binding
> > 
> > This optimization reduces probe time and unnecessary firmware interactions
> > by only initializing power domains that are actually used in the system.
> 
> Why is this very specific to power domains only ? This must apply for other
> domains like perf or clock or reset ?

Yes, it should. Starting out with just power domains for now though. I
haven't looked at other places like perf and clock yet.

> 
> > For example, in a system with 100 possible domains but only 3 referenced
> > in the device tree, we now only initialize those 3 domains instead of
> > all 100.
> > 
> 
> Well, how much of these PD will get used in the final products ? I can
> understand the need to use just 3 in devel platforms. Just trying to see
> how realistic is the scenario ? Is there any other optimisation possible
> from the firmware ? Does getting the state of a PD takes so much time
> on the platform in question ?

Well, it's not only about how much time it takes on any particular platform
to query the state of a PD. Even if say it takes 10us to query it, it will
add a whole 1ms to the probe time. This mean 1ms more of boot time, and
perhaps boot time experts can chime in here but every optimisation
possible matters!
ARM systems are usually very strict on boot time requirements.

Even if we somehow optimise the firmware, to me it seems like kernel is
wasting time querrying for something that it doesn't need at that moment.

Just replying here to your next reply on the thread:
> And I missed another point. Someone will soon complain Linux no longer
> turns off unused power domains. So I am inclined against this optimisation.
> We need to consider all the above point before .

I agree on some points like the runtime overlay. However I am not sure
why Linux should be the one to turn OFF power domains that it's
_unaware_ of. "unused" would probably be a wrong assumption to make.
There maybe other entities that would be using power domains that
are not in the device tree. (For eg. an RTOS running on the same system
accessing a PD that is controlled by the SCP firmware but not mentioned in the
device tree.)

While one may argue that's why firmware should be the one to keep ref
counts to avoid resource conflicts, one could also argue that firmwares
could be the one to turn off unused power domains.

Why should the kernel touch something that it hasn't been told about
explicitly in the DT? Isn't the whole point of DT to be the literal
hardware descriptor for the kernel? So if something doesn't exist in the
DT, kernel shouldn't have other places telling it does - in this context
power domains.

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated

