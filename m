Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FD91C88E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 14:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2KBZHYychmDXb/7ON1UgL8gyckYpgs6QfPENVttHvSo=; b=4twKlJW/hoP/Lc02BFwINOKFYa
	H8S0sv55B+g7UjhRQPZXr+yrMbhkQMYpLBsQo0TSw7tgA1YGF+aMLcLXOugRL/3tWRrTrYaOoOQKu
	1UOUx2EDxrvrjnwhsf9oKK9sw1RhGlDxBJpfKeX3njr8xfmb9MIQBtfGnyYLMiKxsf+548OccEKPf
	GwE7IQTXX04x9EFfN81fjEa1gRIabjz3WS2PkLrOOj8h665CLK65tieppjXKf1lcPVI9nk08Rb2bb
	jxewgveDAl64jQcRxo0/Tu2yQVfSr9kNf0ixpJF6Gdh5IsQLJmF3KLIzfU6aZuGg1jEYn9qjmXOR8
	y6jNY6BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x522l-0000000Gt8P-2pSx;
	Fri, 11 Sep 2026 14:15:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x522f-0000000Gt7o-2Er6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 14:15:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9AD9C16F2;
	Fri, 11 Sep 2026 07:15:44 -0700 (PDT)
Received: from [10.57.73.19] (unknown [10.57.73.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B6D193F7B4;
	Fri, 11 Sep 2026 07:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789136148; bh=d6mzXbmJYFm0GynqcHkfdRTupKXChsoklSxL3P+yA9A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fmcup4RLpkQPrB7uRbMMbrAv43xH71VYNGkTpY8+FbNIAeNMuNklcinPYlN6V44AQ
	 TaJ5cHe04TW8rkSnz3vYYQzfIi7N4Nf9ZWEZGjFMV1CKICVhPyJtkiHWnEAM55SduO
	 eWCfO0AJalfAUzdhKo1Wd+i+j4Qb0aUvdYUqHgNw=
Message-ID: <2646dfa6-3f0f-49d1-a7d8-4b93fbd1ec71@arm.com>
Date: Fri, 11 Sep 2026 16:15:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: topology: Prefer PE0 on NVIDIA Olympus SMT
 cores
To: Andrea Righi <arighi@nvidia.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>, Mark Rutland
 <mark.rutland@arm.com>, Christian Loehle <christian.loehle@arm.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>, Phil Auld <pauld@redhat.com>,
 Breno Leitao <leitao@debian.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260909062649.469633-1-arighi@nvidia.com>
 <20260909062649.469633-2-arighi@nvidia.com>
 <89694e14-4be8-4c9e-9d7b-2808f87dd95f@arm.com> <aqGGlNce4TRLS1cW@gpd4>
 <1528999e-eb59-416f-b18f-2a7667e61a90@arm.com> <aqPFpUw9Y4Ui8ia-@gpd4>
Content-Language: en-GB
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
In-Reply-To: <aqPFpUw9Y4Ui8ia-@gpd4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_071552_306666_A8F592C1 
X-CRM114-Status: GOOD (  16.62  )
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

On 11.09.26 11:11, Andrea Righi wrote:
> Hi Dietmar,
> 
> On Thu, Sep 10, 2026 at 12:11:06PM +0200, Dietmar Eggemann wrote:
>> On 09.09.26 18:17, Andrea Righi wrote:
>>> On Wed, Sep 09, 2026 at 05:19:08PM +0200, Dietmar Eggemann wrote:
>>>> On 09.09.26 08:26, Andrea Righi wrote:

[...]
> I think we can avoid an arm64 override entirely and rely on the default
> implementation:
> 
> int __weak arch_asym_cpu_priority(int cpu)
> {
> 	return -cpu;
> }
> 
> The boot option would only add SD_ASYM_PACKING to the SMT domain. A rough
> prototype could look like this in kernel/sched/topology.c:
> 
> static bool sched_smt_asym_packing __read_mostly;
> 
> static int __init setup_sched_smt_asym_packing(char *str)
> {
> 	sched_smt_asym_packing = true;
> 	return 1;
> }
> __setup("sched_smt_asym_packing", setup_sched_smt_asym_packing);
> 
> int cpu_smt_flags(void)
> {
> 	int flags = SD_SHARE_CPUCAPACITY | SD_SHARE_LLC;
> 
> 	if (sched_smt_asym_packing)
> 		flags |= SD_ASYM_PACKING;
> 
> 	return flags;
> }
> 
> This would make the option generic rather than specific to arm64 or Olympus.
Ah, OK, no arm64 private 'struct sched_domain_topology_level
arm64_asym_smt_topology[]' anymore.

[...]

