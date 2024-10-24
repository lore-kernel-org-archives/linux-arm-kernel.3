Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68315D0BB6E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 08:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R+giDtgoTZeIOBH66q4LFLWeMzDuXsmv8So+huQMkLY=; b=QH5+mBNPhWfC416dilM1eLA3iH
	LoUwJa/Xo+3HLvi/EVhxb7myHiP14OeTqtTSuUtE8AXxzQLoFxU9Bxrz1FiAvYMri3Udg8YX8U/AH
	9V0+yDS9fC8H5rm828rocHZvNtFwJvjB736z0855EbXrXRdoWOxZih0pMH8vTHa3orcug0y2wsulu
	TO2ZPG1Gk7HuKp8ApOnG+YLO/u6+KNW7YdYKxyej/JtnRUJPt7blbRUOM/LZFTQSYZN24zUmZJ1RD
	Wa7pAHopPaEpJoj2SdMEuGTL+PULtzEeOaKX9tzLTNdEc0x8HluawsVED9xh+OEH5lI61idIsAZjN
	gjRkCrmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3t1L-0000000HFSY-15Na;
	Thu, 24 Oct 2024 08:16:39 +0000
Received: from gate.crashing.org ([63.228.1.57])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3sz7-0000000HEci-0XPI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 08:14:22 +0000
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 49O8CnMd029293;
	Thu, 24 Oct 2024 03:12:50 -0500
Message-ID: <e82c45088ed5aad81f44d4297ff19565e2472ba7.camel@kernel.crashing.org>
Subject: Re: [PATCH 0/2] [tip: sched/core] sched: Disable PLACE_LAG and
 RUN_TO_PARITY and move them to sysctl
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: "Prundeanu, Cristian" <cpru@amazon.com>,
        K Prateek Nayak
	 <kprateek.nayak@amd.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc: "linux-tip-commits@vger.kernel.org" <linux-tip-commits@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Ingo Molnar
 <mingo@redhat.com>, "x86@kernel.org" <x86@kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
        "Doebel, Bjoern"
 <doebel@amazon.de>,
        "Mohamed Abuelfotoh, Hazem" <abuehaze@amazon.com>,
        "Blake, Geoff" <blakgeof@amazon.com>,
        "Saidi, Ali" <alisaidi@amazon.com>, "Csoma, Csaba" <csabac@amazon.com>,
        "gautham.shenoy@amd.com"
 <gautham.shenoy@amd.com>
Date: Thu, 24 Oct 2024 19:12:49 +1100
In-Reply-To: <C0E39DE3-EEEB-4A08-850F-A4B7EC809E3A@amazon.com>
References: <C0E39DE3-EEEB-4A08-850F-A4B7EC809E3A@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_011421_441067_C8F4A52D 
X-CRM114-Status: GOOD (  10.93  )
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

On Sat, 2024-10-19 at 02:30 +0000, Prundeanu, Cristian wrote:
>=20
> The hammerdb test is a bit more complex than sysbench. It uses two
> independent physical machines to perform a TPC-C derived test [1], aiming
> to simulate a real-world database workload. The machines are allocated as
> an AWS EC2 instance pair on the same cluster placement group [2], to avoi=
d
> measuring network bottlenecks instead of server performance. The SUT
> instance runs mysql configured to use 2 worker threads per vCPU (32
> total); the load generator instance runs hammerdb configured with 64
> virtual users and 24 warehouses [3]. Each test consists of multiple
> 20-minute rounds, run consecutively on multiple independent instance
> pairs.

Would it be possible to produce something that Prateek and Gautham
(Hi Gautham btw !) can easily consume to reproduce ?

Maybe a container image or a pair of container images hammering each
other ? (the simpler the better).

Cheers,
Ben.

