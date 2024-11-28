Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA541D690F3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 10:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3cjb0+0e787fmSia9xKiS5vCKypEydvQhshZnRtBb4s=; b=07KOgm08Hi/a9rSfa5z0IY9+Kc
	k+HNM1+ZQf+zUDcYdhmm8YcgjVDyRY4uQsL3ZOai2ntoj8Bl4VxtPhRJb2CceMMo1f+/tjK4jrkY6
	At0iv6p0WuZ4jpyMOfantSuqEO+xcxqs/VnZwLITwGFKS1fynJdjMi3RP4aUSaI1VW3E2LFzMbWSe
	Hp7eAXgXi/+pATRF+fJRYpAKp4HZrRriKhAUfPjtsaRmiUcwMVGCK6k15W19i7fMxR520dF8NxecM
	sq8q4n9jx8J+honQnQWeNM4UkommBuVPvaYetR177DaEkJQngPLgtd65aKXsOu4Mib/9b6sBWSMKQ
	NkuxEinA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGbrH-0000000FGhG-31DL;
	Thu, 28 Nov 2024 10:34:51 +0000
Received: from smtp-fw-9102.amazon.com ([207.171.184.29])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGbqH-0000000FGYY-3fp2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 10:33:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1732790030; x=1764326030;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3cjb0+0e787fmSia9xKiS5vCKypEydvQhshZnRtBb4s=;
  b=RNouv8Z8+ePlFNIcyGyeDN71pcQLH13h5FwEwUyNrIe+wMdsd6/TucJD
   Z36zhnO1MrRvMwednMdvvrzBo7F4qDQOygwvwCaZ1X55KuQsunPEEi87/
   /3o2+e52Gwyq3TU5ZtgR0tq5QsPe06uwcn+hgECd4irtiXHBy/xeDpi/D
   I=;
X-IronPort-AV: E=Sophos;i="6.12,192,1728950400"; 
   d="scan'208";a="473917503"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.214])
  by smtp-border-fw-9102.sea19.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 10:33:45 +0000
Received: from EX19MTAUWA001.ant.amazon.com [10.0.7.35:49797]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.22.41:2525] with esmtp (Farcaster)
 id 252a3a4d-81ab-4111-b181-493c14bd6249; Thu, 28 Nov 2024 10:33:44 +0000 (UTC)
X-Farcaster-Flow-ID: 252a3a4d-81ab-4111-b181-493c14bd6249
Received: from EX19D016UWA004.ant.amazon.com (10.13.139.119) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Thu, 28 Nov 2024 10:33:44 +0000
Received: from 88665a51a6b2.amazon.com (10.106.178.48) by
 EX19D016UWA004.ant.amazon.com (10.13.139.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Thu, 28 Nov 2024 10:33:41 +0000
From: Cristian Prundeanu <cpru@amazon.com>
To: <cpru@amazon.com>
CC: <abuehaze@amazon.com>, <alisaidi@amazon.com>, <benh@kernel.crashing.org>,
	<blakgeof@amazon.com>, <csabac@amazon.com>, <dietmar.eggemann@arm.com>,
	<doebel@amazon.com>, <gautham.shenoy@amd.com>, <joseph.salisbury@oracle.com>,
	<kprateek.nayak@amd.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-tip-commits@vger.kernel.org>,
	<mingo@redhat.com>, <peterz@infradead.org>, <x86@kernel.org>
Subject: Re: [PATCH 0/2] [tip: sched/core] sched: Disable PLACE_LAG and RUN_TO_PARITY and move them to sysctl
Date: Thu, 28 Nov 2024 04:32:36 -0600
Message-ID: <20241128103236.22777-1-cpru@amazon.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241125113535.88583-1-cpru@amazon.com>
References: <20241125113535.88583-1-cpru@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.106.178.48]
X-ClientProxiedBy: EX19D038UWB001.ant.amazon.com (10.13.139.148) To
 EX19D016UWA004.ant.amazon.com (10.13.139.119)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_023349_948179_7DC2FD7A 
X-CRM114-Status: GOOD (  13.82  )
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

On 2024-11-26, K Prateek Nayak wrote:

> Would it be possible to use the perf-tool built there to collect
> the scheduling stats for MySQL benchmark runs on both v6.5 and v6.8 and
> share the output of "perf sched stats diff" and the two perf.data files
> recorded?

I'll add this to the list of my next tests. Thank you for mentioning it!


On 2024-11-26, Dietmar Eggemann wrote:

> SUT kernel arm64 (mysql-8.4.0)
> (2) 6.12.0-rc4                -12.9%
> (3) 6.12.0-rc4 NO_PLACE_LAG   +6.4%		
> (4) v6.12-rc4  SCHED_BATCH    +10.8%

This is very interesting; our setups are close, yet I have not seen any 
feature or policy combination that performs above the 6.5 CFS baseline.
I look forward to seeing your results with the repro when it's ready.

Did you only use NO_PLACE_LAG or was it together with NO_RUN_TO_PARITY?

Was SCHED_BATCH used with the default feature set (all enabled)?

Which distro/version did you use for the SUT?

> Maybe a difference in our test setup can explain the different test results:
>
> I use:
>
> HammerDB Load Generator <-> MySQL SUT
> 192 VCPUs               <-> 16 VCPUs
> 
> Virtual users: 256
> Warehouse count: 64
> 3 min rampup
> 10 min test run time
> performance data: NOPM (New Operations Per Minute)
>
> So I have 256 'connection' tasks running on the 16 SUT VCPUS.

My setup:

SUT     - 16 vCPUs, 32 GB RAM
Loadgen - 64 vCPU, 128 GB RAM (anything large enough to not be a 
 bottleneck should work)

Virtual users:  4 x vCPUs = 64
Warehouses:     24
Rampup:         5 min
Test runtime:   20 min x 10 times, each on 4 different SUT/Loadgen pairs
Value recorded: geometric_mean(NOPM)

