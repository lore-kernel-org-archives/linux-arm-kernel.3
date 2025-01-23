Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F664C02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 12:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q0ou4jd37epO0E4W2z7GZZTTMyCBKGCL5eTE2RxuZ2s=; b=IKXZtiIrzQu0kTIdlwoMM14dHO
	/EPxvw9pQ6rZN7WhigIAonf5/vXrXlZmnNLq3BY6tuOomGayQ32Vh6TPlEIV/wjxSOSbPNcl9Yt6L
	FfAghn2lR8iHw/bv7ZOl/Er/u9x5dRjuKu/L1++uTHxjeAE+vuUOSg3XiajC+gTNl2sLeyxpPMlC2
	2BWH/Jd5pOROTQzcVXiaXW4N5wAfGOnh6DvqCCvNoPDgOA2QjXBdllyMbRLWw4FwEw6OKNd0LkT5r
	BjrsFNLEdFR15NIfxmLWRTeYH/N3voBBLEr5INziLi44LAJ563Gbj+Ke1tstJRhODW7x3rSUnWRoK
	4Dj9Bf8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tawA4-0000000CQpk-2uLL;
	Thu, 23 Jan 2025 12:18:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taw8l-0000000CQen-408k
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 12:16:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 531861063;
	Thu, 23 Jan 2025 04:17:23 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 33A133F5A1;
	Thu, 23 Jan 2025 04:16:53 -0800 (PST)
Date: Thu, 23 Jan 2025 12:16:50 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: zuoqian <zuoqian113@gmail.com>,
	Ionela Voinescu <ionela.voinescu@arm.com>, rafael@kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>, viresh.kumar@linaro.org,
	cristian.marussi@arm.com, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: scpi: compare against frequency instead of rate
Message-ID: <Z5IzMhTOhtujyH0n@bogus>
References: <20250123075321.4442-1-zuoqian113@gmail.com>
 <ad11dfc1-5e88-4421-b427-3955d4220133@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad11dfc1-5e88-4421-b427-3955d4220133@stanley.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_041656_038006_20361799 
X-CRM114-Status: GOOD (  25.49  )
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

(for some reason I don't have the original email)

On Thu, Jan 23, 2025 at 02:12:14PM +0300, Dan Carpenter wrote:
> On Thu, Jan 23, 2025 at 07:53:20AM +0000, zuoqian wrote:
> > The CPU rate from clk_get_rate() may not be divisible by 1000
> > (e.g., 133333333). But the rate calculated from frequency is always
> > divisible by 1000 (e.g., 133333000).
> > Comparing the rate causes a warning during CPU scaling:
> > "cpufreq: __target_index: Failed to change cpu frequency: -5".
> > When we choose to compare frequency here, the issue does not occur.
> > 
> > Signed-off-by: zuoqian <zuoqian113@gmail.com>
> > ---
> >  drivers/cpufreq/scpi-cpufreq.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/cpufreq/scpi-cpufreq.c b/drivers/cpufreq/scpi-cpufreq.c
> > index cd89c1b9832c..3bff4bb5ab4a 100644
> > --- a/drivers/cpufreq/scpi-cpufreq.c
> > +++ b/drivers/cpufreq/scpi-cpufreq.c
> > @@ -39,8 +39,9 @@ static unsigned int scpi_cpufreq_get_rate(unsigned int cpu)
> >  static int
> >  scpi_cpufreq_set_target(struct cpufreq_policy *policy, unsigned int index)
> >  {
> > -	u64 rate = policy->freq_table[index].frequency * 1000;
> 
> policy->freq_table[index].frequency is a u32 so in this original
> calculation, even though "rate" is declared as a u64, it can't actually
> be more than UINT_MAX.
>

Agreed and understood.

> > +	unsigned long freq = policy->freq_table[index].frequency;
> >  	struct scpi_data *priv = policy->driver_data;
> > +	u64 rate = freq * 1000;
>
> So you've fixed this by casting policy->freq_table[index].frequency
> to unsigned long, which fixes the problem on 64bit systems but it still
> remains on 32bit systems.  It would be better to declare freq as a u64.
>

Just trying to understand if that matters. freq is in kHz as copied
from policy->freq_table[index].frequency and we compare it with
kHZ below as the obtained clock rate is divided by 1000. What am I
missing ? If it helps, it can be renamed as freq_in_khz and even keep
it as "unsigned int" as in struct cpufreq_frequency_table.

-- 
Regards,
Sudeep

