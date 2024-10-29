Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6226D5B874
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 05:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3kGxrzEKbAFqR/0z9ua6srjnJwz1K5VrV6j+QKOXBSA=; b=XTaQzz5D8B4Iy5yj2W8C/xIJ8g
	x5V+2unp1AOhbd88Y25lcqQwtG8tfCBAeCGIf9ezs273t3sShtYKenkaYdnqpuRbayWbkCmZA7u2L
	fOLAto99roF5AyEYfYhMAbENWpygEeYHstdDBzGzcWbO0QEY9niex7mUv40iMs2pTkHkdxrKG/LwJ
	MYEwfuLS5A6BieniM9DHpMGncl3LVy0Dl4lpVX5O31EU4/RHwq/VwNlR9TTH/XsFh8EVkPeVJQ/U6
	apHJJBqJsuQFkXlLvOSOWZrGgafNP93/v4v71P9VZxj9Dl/ZRd/zPOlLnmYWquMrYfQhsXGNCwiR/
	fl7oauNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5eKn-0000000DDYQ-3vQQ;
	Tue, 29 Oct 2024 05:00:01 +0000
Received: from smtp-fw-52005.amazon.com ([52.119.213.156])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5eJA-0000000DDQG-2z8B
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 04:58:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1730177901; x=1761713901;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3kGxrzEKbAFqR/0z9ua6srjnJwz1K5VrV6j+QKOXBSA=;
  b=vDfw5zguR5MdEU8D6HOSOFN91nI/QBiXg/WM/6loMEFcbV/zT06ElSOv
   KpwW6XI+Vc60Lmka4zHJINCBuXvMP38uXHjQmeonbH1Ha0gojkBH3GR8c
   e+1dHwphMI4KBFzwol1M/dSURkS1FncvxX3xdGAmK98AXQzojfmvdIf+f
   A=;
X-IronPort-AV: E=Sophos;i="6.11,241,1725321600"; 
   d="scan'208";a="691275556"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.43.8.6])
  by smtp-border-fw-52005.iad7.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 04:58:17 +0000
Received: from EX19MTAUWB001.ant.amazon.com [10.0.38.20:56547]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.34.72:2525] with esmtp (Farcaster)
 id 55ba7e0a-c931-44cc-8af9-06a2c5330a90; Tue, 29 Oct 2024 04:58:15 +0000 (UTC)
X-Farcaster-Flow-ID: 55ba7e0a-c931-44cc-8af9-06a2c5330a90
Received: from EX19D016UWA004.ant.amazon.com (10.13.139.119) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Tue, 29 Oct 2024 04:58:12 +0000
Received: from 88665a51a6b2.amazon.com (10.106.179.51) by
 EX19D016UWA004.ant.amazon.com (10.13.139.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Tue, 29 Oct 2024 04:58:10 +0000
From: Cristian Prundeanu <cpru@amazon.com>
To: "Gautham R. Shenoy" <gautham.shenoy@amd.com>
CC: <linux-tip-commits@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	"Peter Zijlstra" <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	<x86@kernel.org>, <linux-arm-kernel@lists.infradead.org>, Bjoern Doebel
	<doebel@amazon.com>, Hazem Mohamed Abuelfotoh <abuehaze@amazon.com>, "Geoff
 Blake" <blakgeof@amazon.com>, Ali Saidi <alisaidi@amazon.com>, Csaba Csoma
	<csabac@amazon.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, "K
 Prateek Nayak" <kprateek.nayak@amd.com>
Subject: Re: [PATCH 0/2] [tip: sched/core] sched: Disable PLACE_LAG and RUN_TO_PARITY and move them to sysctl
Date: Mon, 28 Oct 2024 23:57:49 -0500
Message-ID: <20241029045749.37257-1-cpru@amazon.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <ZxuujhhrJcoYOdMJ@BLRRASHENOY1.amd.com>
References: <ZxuujhhrJcoYOdMJ@BLRRASHENOY1.amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.106.179.51]
X-ClientProxiedBy: EX19D042UWA001.ant.amazon.com (10.13.139.92) To
 EX19D016UWA004.ant.amazon.com (10.13.139.119)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_215821_011444_7BE9E15D 
X-CRM114-Status: GOOD (  22.33  )
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

Hi Gautham,

On 2024-10-25, 09:44, "Gautham R. Shenoy" <gautham.shenoy@amd.com <mailto:gautham.shenoy@amd.com>> wrote:

> On Thu, Oct 24, 2024 at 07:12:49PM +1100, Benjamin Herrenschmidt wrote:
> > On Sat, 2024-10-19 at 02:30 +0000, Prundeanu, Cristian wrote:
> > > 
> > > The hammerdb test is a bit more complex than sysbench. It uses two
> > > independent physical machines to perform a TPC-C derived test [1], aiming
> > > to simulate a real-world database workload. The machines are allocated as
> > > an AWS EC2 instance pair on the same cluster placement group [2], to avoid
> > > measuring network bottlenecks instead of server performance. The SUT
> > > instance runs mysql configured to use 2 worker threads per vCPU (32
> > > total); the load generator instance runs hammerdb configured with 64
> > > virtual users and 24 warehouses [3]. Each test consists of multiple
> > > 20-minute rounds, run consecutively on multiple independent instance
> > > pairs.
> > 
> > Would it be possible to produce something that Prateek and Gautham
> > (Hi Gautham btw !) can easily consume to reproduce ?
> > 
> > Maybe a container image or a pair of container images hammering each
> > other ? (the simpler the better).
> 
> Yes, that would be useful. Please share your recipe. We will try and
> reproduce it at our end. In our testing from a few months ago (some of
> which was presented at OSPM 2024), most of the database related
> regressions that we observed with EEVDF went away after running these
> the server threads under SCHED_BATCH.

I am working on a repro package that is self contained and as simple to 
share as possible.

My testing with SCHED_BATCH is meanwhile concluded. It did reduce the 
regression to less than half - but only with WAKEUP_PREEMPTION enabled. 
When using NO_WAKEUP_PREEMPTION, there was no performance change compared 
to SCHED_OTHER.

(At the risk of stating the obvious, using SCHED_BATCH only to get back to 
the default CFS performance is still only a workaround, just as disabling 
PLACE_LAG+RUN_TO_PARITY is; these give us more room to investigate the 
root cause in EEVDF, but shouldn't be seen as viable alternate solutions.)

Do you have more detail on the database regressions you saw a few months 
ago? What was the magnitude, and which workloads did it manifest on?

-Cristian

