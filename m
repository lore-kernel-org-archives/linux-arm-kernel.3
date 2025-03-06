Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B01C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 13:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kRLjBcv/Z82dL2FO72DOMePk5qkXQN0qRQOusPPHgjU=; b=dZkZgWQes2MJ2L7J1mAlsZu1L+
	qmHQWadDPsyW8aNUluYzfq98JnAXnSADAE1iBp0gWXTpefT/+zkiKBV9S1+cyOsp6VrfxB1qrSiP2
	Bjb8r82wkYs0no2koSIE05w7XnJqgzqgKozZaUW+gWSInyHpzyxGhpSocsmIZM8w1+6lKbB/eEtRt
	eR3dGfgj5h3Ty8Yctg+V5FxCq84g+P1M+PKvLYvihxGgoaCX4v62sjWgCbGZRGpkE63Vg/Xbue5h+
	rEDO096CRNwQmEDeqXbQ8XwPenTplp5cbbhLsk++04N9X3PRcLaNbO/C7g68FiV9IB8OVs+rBjKgo
	8/Be2d0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqAuD-0000000AzkZ-3MGR;
	Thu, 06 Mar 2025 13:04:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqAYs-0000000AxN4-0Fgo
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 06 Mar 2025 12:42:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=kRLjBcv/Z82dL2FO72DOMePk5qkXQN0qRQOusPPHgjU=; b=irnCkzlUxgSbX9ZZ7LY9I3sxBv
	vevJM2ZTPu2ffzbnz9no7VakT+yKYguw6hT5TPETH9uPocOonmeIgry665F1YZxkshdP6jPaHGuK/
	sQCir0KgfLXjvpTrSfpqKGDGQoIEiX7H6NNVs7F7STs4QZyGkjPl3NfssjCtgd297Dh4Iix96eeJW
	cQ0En5kntIBGzmIAL6ZObgZTtSIwE1509js1vVfoyq0nAFS+xyGnxQgoSAoFwZwTgm6cUkSt+yC5O
	LGmWdMtbOkVjrujUJx8tlDjaWofCR3IqeFOZRSPIgXmh10ZGMab7T1V4c1p/jzhcoFuDVOVpE9Pdg
	8rygSVFg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqAYp-000000014ha-0Hee
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 12:42:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A266E1007;
	Thu,  6 Mar 2025 04:42:57 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 58BBA3F673;
	Thu,  6 Mar 2025 04:42:42 -0800 (PST)
Date: Thu, 6 Mar 2025 12:42:39 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Jacky Bai <ping.bai@nxp.com>, lpieralisi@kernel.org, rafael@kernel.org,
	daniel.lezcano@linaro.org, james.morse@arm.com, d-gole@ti.com,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	khilman@baylibre.com, quic_tingweiz@quicinc.com,
	quic_yuanjiey@quicinc.com
Subject: Re: [PATCH v3] cpuidle: psci: Init cpuidle only for present CPUs
Message-ID: <Z8mYP7AGBPeDTvXn@bogus>
References: <20250306061805.2318154-1-ping.bai@nxp.com>
 <CAPDyKForY4VNZtqietDPt2FQM3p4OsaoE_oJb0PPLUAh98WsHQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKForY4VNZtqietDPt2FQM3p4OsaoE_oJb0PPLUAh98WsHQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_124247_307664_38501A63 
X-CRM114-Status: GOOD (  17.95  )
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

On Thu, Mar 06, 2025 at 11:53:14AM +0100, Ulf Hansson wrote:
> On Thu, 6 Mar 2025 at 07:17, Jacky Bai <ping.bai@nxp.com> wrote:
> >
> > for_each_possible_cpu() is currently used to initialize cpuidle
> > in the PSCI cpuidle driver.
> >
> > However, in cpu_dev_register_generic(), for_each_present_cpu()
> > is used to register CPU devices which means the CPU devices are
> > only registered for present CPUs and not all possible CPUs.
> >
> > With nosmp or maxcpus=0, only the boot CPU is present, leading
> > to the failure:
> >
> >   |  Failed to register cpuidle device for cpu1
> >
> > Change for_each_possible_cpu() to for_each_present_cpu() in the
> > PSCI cpuidle driver to ensure it only registers cpuidle devices
> > for CPUs that are actually present.
> >
> > Fixes: b0c69e1214bc ("drivers: base: Use present CPUs in GENERIC_CPU_DEVICES")
> > Reviewed-by: Dhruva Gole <d-gole@ti.com>
> > Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> > Tested-by: Yuanjie Yang <quic_yuanjiey@quicinc.com>
> > Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> 
> Is this problem specific to cpuidle-psci?
> 
> Others are using for_each_possible_cpu() when registering their cpuidle drivers.
> 

Good point. I assumed as this was very old patch, only this is left without
conversion to using present_cpumask. Looks like there are many other drivers
that need similar change. May be PSCI is most commonly used ones these days
and hardly anyone tests with nosmp or maxcpus=1 on those platforms.

But yes, all the users of for_each_possible_cpu() need to move to
for_each_present_cpu() if they are relying on CPU device being registered.

-- 
Regards,
Sudeep

