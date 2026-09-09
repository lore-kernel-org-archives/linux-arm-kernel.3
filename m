Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA1FC79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 07:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HYah3uA+r1kGGwUj3wqj+G+RHCOLv0YNwo6nuTVfIPU=; b=RdQ/uuDg9sqwfbC2zltZ6b+i3+
	HBpW+d/zTpNwlBvzy063tv7CDfALGsXcwUqvuLX1RPjsYY59O9SnpE3mILDKNHu4sxLiNUoAPuYIh
	xBzBoREqAyjKfGvvdtqgMQk/Pu/25KDXjcSJLl2thwJXRVW+HCjCY/m8BXgBkClSwlCpjAthqbwZa
	rT2GGP3fJzNwjfpzI8YVyApA6G1dh6Q3ibAVI0J8P8FXm/k3FxPNet0iTRRkyoGwYTjUq1ICuvNyQ
	8rszfSWI5OrsunCuVpKma2oz3l2uXcJZMGCd5p9u+XnW1m2ry7Nur1uNq0cR2S7350uuvsBvhXuy1
	Qa9uSNyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Cbv-0000000Axt0-2dy5;
	Wed, 09 Sep 2026 07:20:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Cbs-0000000AxsF-3snJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 07:20:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 883F61576;
	Wed,  9 Sep 2026 00:20:36 -0700 (PDT)
Received: from [10.57.73.177] (unknown [10.57.73.177])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 23F153F7D8;
	Wed,  9 Sep 2026 00:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788938440; bh=HYah3uA+r1kGGwUj3wqj+G+RHCOLv0YNwo6nuTVfIPU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dQDQUeoyd7rs5J3jJ2hcytzoFlCrUnuzWP/nB2QjLK0BzOhs9FoYIWjtpl4cvn6qQ
	 V6997eLToNmC4iplPw1+KazMVhObpi6NE1jR/Shmi2nrP7e8aR5/i1v3oAvusylahm
	 NVcSza6cWx3MNd86cbw8I3q7WzjD7IqJNeTmEkBc=
Message-ID: <c92baaa9-1c1a-4f1e-903e-7b98ec9f694c@arm.com>
Date: Wed, 9 Sep 2026 09:20:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] sched: Enable preferred SMT siblings on NVIDIA
 Olympus
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
References: <20260908082345.103087-1-arighi@nvidia.com>
Content-Language: en-GB
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
In-Reply-To: <20260908082345.103087-1-arighi@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_002045_104552_CB595F0D 
X-CRM114-Status: UNSURE (   8.29  )
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

On 08.09.26 10:23, Andrea Righi wrote:

[...]

> The series was tested on a two-node Vera system using an 88-thread
> single-precision GEMM on the 88 physical cores of NUMA node 0.

Can we use 'OpenBLAS benchmark/sgemm.goto' as an open alternative for
your NVIDIA internal single-precision GEMM benchmark?

IIUC, you used it for the 'Prefer fully idle cores for NOHZ balancing'
work: https://lore.kernel.org/r/anIq6pU5KXTTFCDN@gpd4

If yes, I assume you would run something like:

export OMP_NUM_THREADS=88
numactl -C XXX --membind=0 ./benchmark/sgemm.goto 16384 16384 16384

Essentially you want to show that those 88 compute intensive tasks each
runs on his own core alone and so you get a higher TFLOPS value.

[...]

