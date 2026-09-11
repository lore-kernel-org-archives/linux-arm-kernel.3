Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1069EC88E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 14:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ABQNg9se0fG9mFALHl2BCH0puJasE7QFl7nypacvR8=; b=os0t1HdEfstOISWXngrdEN17ag
	SbDKdRKDsUzYwshxXT1AMub2zv0V3VH5U1I5UVFgp0JEPQNT9nSbfkbPwivPJ8edvKEvGbFVYUa4O
	2udMTa+yxyB8GT+zPzZ6Zq/atvRp8ddTKYANHj/gUw9nujOrEVbH8HVG1B3++8iq3JKpuNdIwRRMg
	JAAfzwvbsugi5/idOBLGhPlmIbAO3lVEmnxZVr5T4JofETXkVP//y6bZ/LtuvJUomhfcVrNd5yxi9
	t1x4Foyi3WTn3oi9M3NCSPh8gUZ5FWOztS3/xVXOq/1DlD7ONKvPIQYcD8pz/r1YQo8svSPEoy9uk
	fK3MiA2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51yk-0000000GsRQ-0fO6;
	Fri, 11 Sep 2026 14:11:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51yh-0000000GsPe-2AHN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 14:11:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CBD7F16A3;
	Fri, 11 Sep 2026 07:11:38 -0700 (PDT)
Received: from [10.57.73.19] (unknown [10.57.73.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BE8CC3F7B4;
	Fri, 11 Sep 2026 07:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789135902; bh=xWDRCpoj9WdBEt44L+2RNU/fKnJEuXhR5O1t04EL2RM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tohXVArBKXDI653lw5Y93+F9TsGTSnLtrf7pLj0Ohcyc9b8lGL7yh5428aPO4vB2B
	 wFYmgo+YfQpoXqkp92OBsMZviKrg6tzf/iISYqyiKLCC/AVkBQP+zb+Wy9chCKs0Vw
	 6q+wcSq6E6QIWi3Kb2ZDhCKF3uu+aOulSGpPvo3w=
Message-ID: <1529268b-8e10-4fef-be6e-60b6dd1e74a0@arm.com>
Date: Fri, 11 Sep 2026 16:11:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] sched/fair: Honor asymmetric SMT priority in idle
 selection
To: Andrea Righi <arighi@nvidia.com>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>, Mark Rutland
 <mark.rutland@arm.com>, Christian Loehle <christian.loehle@arm.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>, Phil Auld <pauld@redhat.com>,
 Breno Leitao <leitao@debian.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260909062649.469633-1-arighi@nvidia.com>
 <20260909062649.469633-3-arighi@nvidia.com>
Content-Language: en-GB
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
In-Reply-To: <20260909062649.469633-3-arighi@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_071143_611215_D86275AD 
X-CRM114-Status: UNSURE (   8.33  )
X-CRM114-Notice: Please train this message.
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

On 09.09.26 08:26, Andrea Righi wrote:

[...]

> +static bool has_asym_smt_domain(int cpu)
> +{
> +	struct sched_domain *sd;
> +
> +	for_each_domain(cpu, sd) {
> +		if (!(sd->flags & SD_SHARE_CPUCAPACITY))
> +			break;
> +
> +		if (sd->flags & SD_ASYM_PACKING)
> +			return true;
> +	}
> +
> +	return false;
> +}

Replace for_each_domain() w/ sd = rcu_dereference_all(cpu_rq(cpu)->sd)
here as well?

[...]

