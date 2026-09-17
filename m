Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C51C982D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 15:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vqEFvvHV/L3sKvFUjQ6Yn8sSGdOHHV39s6af9+YkAzo=; b=a2XhDrGNUgriRbn5aeISqFVIKq
	t0lH6MxiujSy8LS/dbWCFN+ARO2jHp8memD64ayLnmMXabOQbF6mcYenvxU8iGrwcD+UcMJP6+Xfp
	ilQnkR4CPgec1h/jDO1va4rHSRuIQSIYZzKR0Z/n2BRZbVrmj+9u7WncV0mBeOzGv/Ar6betrsVJ+
	4OBuQ49xWShIRgEesb5Ift2q7xx/MoUEyZ2EpdOmNg/QdD74IGMOyArNGt7ad/qlZ04pkq/M6eIg9
	lC4cqaLFRclx0bFsmPzAYzBaoDhP/rpQ0xRjhhG39qfoR4ezM8qTZhGo03ATErIuGUCjUWwt2Kwv0
	NRpTdeMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ESn-0000000BmJl-0Wje;
	Thu, 17 Sep 2026 15:55:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ESl-0000000BmJL-2Eu6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 15:55:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0819A1476;
	Thu, 17 Sep 2026 08:55:46 -0700 (PDT)
Received: from [192.168.178.100] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AA3B53F7B4;
	Thu, 17 Sep 2026 08:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789660549; bh=pu6OxP7sHRarHbFxvyGvIy2jdeMp3whl0Ww+2w+Yqk4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FLgeeuFP12OYalq4ufgX2DESTMiE2Tp/2noR1ohfQnyzFdFKH/4YTsCF7BL2DiffS
	 yxR8VV9A+e9avG4QOYLmvQPUlvbQisERazLgW5Sg35hefwU7+8YHgN/SAyL/A5/1+4
	 JIApr13pTg/Sab2zAkV1CufEkYRfeIXMoxFgX9VE=
Message-ID: <b7fbe8bc-56b4-4705-b5d8-4a377eb062ee@arm.com>
Date: Thu, 17 Sep 2026 17:55:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] arm64: topology: fix arch_freq_get_on_cpu()
 overflow above 4.19 GHz
To: Peter Zijlstra <peterz@infradead.org>, Oleg Keri <okerixx@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Ingo Molnar <mingo@redhat.com>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>, Sumit Gupta <sumitg@nvidia.com>,
 Beata Michalska <beata.michalska@arm.com>,
 Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 driver-core@lists.linux.dev, Viresh Kumar <viresh.kumar@linaro.org>,
 linux-pm@vger.kernel.org
References: <20260917125112.2283-1-okerixx@gmail.com>
 <20260917125112.2283-2-okerixx@gmail.com>
 <20260917153224.GJ4121339@noisy.programming.kicks-ass.net>
Content-Language: en-GB
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
In-Reply-To: <20260917153224.GJ4121339@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_085551_627121_3E2049F4 
X-CRM114-Status: GOOD (  10.25  )
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

On 17.09.26 17:32, Peter Zijlstra wrote:
> On Thu, Sep 17, 2026 at 02:51:11PM +0200, Oleg Keri wrote:

[...]
>> diff --git a/include/linux/topology.h b/include/linux/topology.h
>> index 709a2dcf4c73..0a4ee12a98d5 100644
>> --- a/include/linux/topology.h
>> +++ b/include/linux/topology.h
>> @@ -351,4 +351,6 @@ static inline unsigned long topology_get_cpu_scale(int cpu)
>>  
>>  void topology_set_cpu_scale(unsigned int cpu, unsigned long capacity);
>>  
>> +#define cap_scale(v, s)		((v)*(s) >> SCHED_CAPACITY_SHIFT)
> 
> This might not be a very good generic helper, since it relies on either
> of the variables to be u64 for correctness.

So moving it to a static inline function instead?

static inline u64 cap_scale(u64 value, u64 scale)
{
       return value * scale >> SCHED_CAPACITY_SHIFT;
}

