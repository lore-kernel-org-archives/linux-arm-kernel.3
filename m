Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87DEACCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 19:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LG3DPz3haI+VaxNHPpED3nn+I0+UuvJeOuy2LUKaWkA=; b=1gPUvZ0Ydh86QXwp/0NYyA/Ib6
	14+aJaQT9P5IQp0lUc0GsLTBcgcp0bJynXCMrMPXErFGs+SsCBAdrQ7FtfZSkW7VRDecF4Dge0bDR
	2uMfF0ys9JqHGWvu8qIRtxTp/0pN93V+dYVrOMdTdEAfZyNU378woiq+vwDZtNN/3Z6RvNEmnaeYB
	OFcOuPa8MovXEtj9iKMC0xeAVRxkZBGMy9JaZTR3r40fasZrh55w502h52baNdFsHzCUA+iQl3EwF
	sE9n2+oDRfuLgRfRt3/DNrwRCI4aYpbmvCpsMxgeNXKDntLY4K5qBTbKMw4+WfUWBFyVVEfOBMwAa
	y6/hthQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAvHe-0000000EjNf-1gbQ;
	Mon, 20 Oct 2025 19:11:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAvHb-0000000EjMr-3ydM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 19:11:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F418C1007;
	Mon, 20 Oct 2025 12:10:53 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3843D3F59E;
	Mon, 20 Oct 2025 12:11:00 -0700 (PDT)
Message-ID: <a0120876-0f00-4e1a-aa17-5fe7c3512276@arm.com>
Date: Mon, 20 Oct 2025 20:10:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] smp: Introduce a helper function to check for
 pending IPIs
To: Ulf Hansson <ulf.hansson@linaro.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
 Maulik Shah <quic_mkshah@quicinc.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251020141718.150919-1-ulf.hansson@linaro.org>
 <20251020141718.150919-2-ulf.hansson@linaro.org>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20251020141718.150919-2-ulf.hansson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_121104_101667_39867F7F 
X-CRM114-Status: GOOD (  15.99  )
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

Hi Ulf,

Only a comment on the naming rather than a full review.

On 10/20/25 15:17, Ulf Hansson wrote:
> When governors used during cpuidle, tries to find the most optimal
> idlestate for a CPU or a group of CPUs, they are known to quite often fail.
> One reason for this, is that we are not taking into account whether there
> has been an IPI scheduled for any of the CPUs that are affected by the
> selected idlestate.
> 
> To enable pending IPIs to be taken into account for cpuidle decisions,
> let's introduce a new helper function, cpus_may_have_pending_ipi().

To me, "may" indicates permission, i.e. is allowed, rather than
correctness. Would "likely" be better here, cpus_likely_have_pending_ipi()?

> 
> Note that, the implementation is intentionally as lightweight as possible,
> in favor of always providing the correct information. For cpuidle decisions
> this is good enough.
> 
> Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> ---
> 
> Changes in v2:
> 	- Implemented a common function, rather than making it arch-specific. As
> 	suggested by Thomas and Marc.
> 	- Renamed the function to indicate that it doesn't provide correctness.
> 	- Clarified function description and commit message.
> 
-- 
Thanks,

Ben


