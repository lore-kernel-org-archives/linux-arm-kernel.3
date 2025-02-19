Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED8BC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 08:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BAPgLggpFEZphjKvVnI11zaBevshixxEoFKjgSsFVdo=; b=Fx9cDQWIWagaIdSETOxVeXkQvL
	wbsSvEc8Dq3JOPn+/2p/cKt2LBsIiEwXVgNPhtLPHOvLmWgpdBumHLplCwVWSzXbAa+uqrnLF6oK4
	RQfixilzP9lvGzgg4IcI/6pHkpUC6Plw33IpG/3QlZdkobGSiqXB2Cd6iVdBtQMsWJhSrgid2g2TO
	eLvJ8acd6FSS5HFrBFT1zL+7mk6AjAcU0K0Cg8MkrGxiy9/cs/2SwZ+FhHcDL/wvu6xG8wi0RIUH+
	kUdEEZnHs6o0I+xk3Uy6Juzvemy8PLpBOxNB9OnL/5tW+XfxaW0Q6WGS7PO/aAdJ71cQAQ2HJmT2F
	Rc8NYXPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkflY-0000000BdT1-3g8x;
	Wed, 19 Feb 2025 08:49:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkfJQ-0000000BTYc-012s
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 08:20:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 234B21682;
	Wed, 19 Feb 2025 00:20:23 -0800 (PST)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C8C523F5A1;
	Wed, 19 Feb 2025 00:20:00 -0800 (PST)
Date: Wed, 19 Feb 2025 09:19:56 +0100
From: Beata Michalska <beata.michalska@arm.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	sudeep.holla@arm.com, will@kernel.org, catalin.marinas@arm.com,
	sfr@canb.auug.org.au, ionela.voinescu@arm.com,
	linux-next@vger.kernel.org, sumitg@nvidia.com,
	yang@os.amperecomputing.com, vanshikonda@os.amperecomputing.com,
	lihuisong@huawei.com, zhanjie9@hisilicon.com,
	ptsm@linux.microsoft.com
Subject: Re: [PATCH] arm64: Utilize for_each_cpu_wrap for reference lookup
Message-ID: <Z7WULBZPsh8QK3DV@arm.com>
References: <20250218192412.2072619-1-beata.michalska@arm.com>
 <Z7TqFLU0Kwg9cUjO@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7TqFLU0Kwg9cUjO@thinkpad>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_002008_096615_100CEEF6 
X-CRM114-Status: GOOD (  26.57  )
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

On Tue, Feb 18, 2025 at 03:14:23PM -0500, Yury Norov wrote:
> On Tue, Feb 18, 2025 at 07:24:12PM +0000, Beata Michalska wrote:
> > While searching for a reference CPU within a given policy,
> > arch_freq_get_on_cpu relies on cpumask_next_wrap to iterate over
> > all available CPUs and to ensure each is verified only once.
> > Recent changes to cpumask_next_wrap will handle the latter no more,
> > so switching to for_each_cpu_wrap, which  preserves expected behavior
> > while ensuring compatibility with the updates.
> 
> This is technically correct, but I would rather point that for
> iterating over each CPU, it's better to use a dedicated iterator
> instead of opencoded loop.

I can certainly add that.
> 
> > Fixes: 16d1e27475f6 ("arm64: Provide an AMU-based version of arch_freq_get_on_cpu")
> > Signed-off-by: Beata Michalska <beata.michalska@arm.com>
> > ---
> >  based on arm64 for-next/amuv1-avg-freq
> > 
> >  arch/arm64/kernel/topology.c | 16 ++++++++++------
> >  1 file changed, 10 insertions(+), 6 deletions(-)
> > 
> > diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> > index a09b0551ec59..9e3583720668 100644
> > --- a/arch/arm64/kernel/topology.c
> > +++ b/arch/arm64/kernel/topology.c
> > @@ -254,7 +254,7 @@ int arch_freq_get_on_cpu(int cpu)
> >  		if (!housekeeping_cpu(cpu, HK_TYPE_TICK) ||
> >  		    time_is_before_jiffies(last_update + msecs_to_jiffies(AMU_SAMPLE_EXP_MS))) {
> >  			struct cpufreq_policy *policy = cpufreq_cpu_get(cpu);
> > -			int ref_cpu = cpu;
> > +			int ref_cpu;
> >  
> >  			if (!policy)
> >  				return -EINVAL;
> > @@ -265,11 +265,15 @@ int arch_freq_get_on_cpu(int cpu)
> >  				return -EOPNOTSUPP;
> >  			}
> >  
> > -			do {
> > -				ref_cpu = cpumask_next_wrap(ref_cpu, policy->cpus,
> > -							    start_cpu, true);
> > -
> > -			} while (ref_cpu < nr_cpu_ids && idle_cpu(ref_cpu));
> > +			for_each_cpu_wrap(ref_cpu, policy->cpus, cpu + 1) {
> > +				if (ref_cpu == start_cpu) {
> > +					/* Prevent verifying same CPU twice */
> > +					ref_cpu = nr_cpu_ids;
> > +					break;
> 
> If start_cpu == cpu, and you begin with 'cpu + 1', you will never
> check the 'cpu' for idle, right? Maybe like this?
> 
>         unsigned int start_cpu = cpu + 1;
> 
This is not entirely a pure for-each case here.
If this loop is reached, it means the start_cpu did not meet the criteria, and
we are trying to find another CPU within the policy that might. Which is why we
pick up the next in line and check whether it is suitable or not.
Testing for idle is just a shortcut, as an idle CPU will most probably not be
considered a good reference either way.

---
BR
Beata
> > +				}
> > +				if (!idle_cpu(ref_cpu))
> > +					break;
> > +			}
> >  
> >  			cpufreq_cpu_put(policy);
> >  
> > -- 
> > 2.25.1

