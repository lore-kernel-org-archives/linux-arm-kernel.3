Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7955C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 21:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6pWS6UFOhe9i4/+rtYoRtmh+LDBHour1WcHut23/qrU=; b=UHiBm+PQpSHw+MDcxk8TMX4oLp
	xMvGYvLoX+pc9xrdCNG64g8AqIW6LJcTG/qd6SlDZYaxOLfuVouvWSNowG/FEKLdV4+DL8+N9g45e
	Z8Nazo4sfOZTEqrTwedk3ZoXBBrvKKnFsGuGQr8ou99yyCNfy7+Tcj9qXoaP28Q+rE72WhJKh25Mb
	uUxRDG7d2dAx+W0LylFOK5CZbXJ6CyjSRtXoscosbIRO3JneV3FsRo7zy4tca1RLSHmocZf5/Q2Lq
	qMk0NZPpVJawdhg/U0rr2EIEd/U5GbI3z/SOZA6fhb/iXuaQD+D3O84l7uY4X/zkw3VAeYuaPQy1j
	vs+Flxjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9sjJ-0000000AtDd-12dI;
	Tue, 29 Apr 2025 21:43:05 +0000
Received: from smtp-fw-52004.amazon.com ([52.119.213.154])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9sfI-0000000Asd9-29pj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 21:38:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1745962737; x=1777498737;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6pWS6UFOhe9i4/+rtYoRtmh+LDBHour1WcHut23/qrU=;
  b=V5n0dDb+iKAWi1yR2+vVDIm1GNGvAVyAqE20CzGLwQnOlggecFcCW2uM
   GKn+auM9N55NASuujW+AdXstEIATtbCfKO5JWkjtw5HbTr4zgkKFq/91s
   XOESHvPdnOWca/iv+b/j9Qo7204r1QEy9QkVL+7EiEFg7risoKCPdZyZN
   A=;
X-IronPort-AV: E=Sophos;i="6.15,250,1739836800"; 
   d="scan'208";a="292876582"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.43.8.2])
  by smtp-border-fw-52004.iad7.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 21:38:52 +0000
Received: from EX19MTAUWA001.ant.amazon.com [10.0.38.20:37204]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.21.68:2525] with esmtp (Farcaster)
 id 9febca8e-c496-45a3-a44b-1c2b580bfebb; Tue, 29 Apr 2025 21:38:51 +0000 (UTC)
X-Farcaster-Flow-ID: 9febca8e-c496-45a3-a44b-1c2b580bfebb
Received: from EX19D016UWA004.ant.amazon.com (10.13.139.119) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Tue, 29 Apr 2025 21:38:51 +0000
Received: from 88665a51a6b2.amazon.com (10.106.178.54) by
 EX19D016UWA004.ant.amazon.com (10.13.139.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Tue, 29 Apr 2025 21:38:48 +0000
From: Cristian Prundeanu <cpru@amazon.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: Cristian Prundeanu <cpru@amazon.com>, K Prateek Nayak
	<kprateek.nayak@amd.com>, Hazem Mohamed Abuelfotoh <abuehaze@amazon.com>,
	"Ali Saidi" <alisaidi@amazon.com>, Benjamin Herrenschmidt
	<benh@kernel.crashing.org>, Geoff Blake <blakgeof@amazon.com>, Csaba Csoma
	<csabac@amazon.com>, Bjoern Doebel <doebel@amazon.com>, Gautham Shenoy
	<gautham.shenoy@amd.com>, Swapnil Sapkal <swapnil.sapkal@amd.com>, "Joseph
 Salisbury" <joseph.salisbury@oracle.com>, Dietmar Eggemann
	<dietmar.eggemann@arm.com>, Ingo Molnar <mingo@redhat.com>, Linus Torvalds
	<torvalds@linux-foundation.org>, Borislav Petkov <bp@alien8.de>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-tip-commits@vger.kernel.org>, <x86@kernel.org>
Subject: EEVDF regression still exists
Date: Tue, 29 Apr 2025 16:38:17 -0500
Message-ID: <20250429213817.65651-1-cpru@amazon.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.106.178.54]
X-ClientProxiedBy: EX19D043UWC004.ant.amazon.com (10.13.139.206) To
 EX19D016UWA004.ant.amazon.com (10.13.139.119)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_143856_705623_D343E966 
X-CRM114-Status: GOOD (  12.99  )
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

Peter,

Here are the latest results for the EEVDF impact on database workloads. 
The regression introduced in kernel 6.6 still persists and doesn't look 
like it is improving.

This time I've compared apples to apples - default 6.5 vs default 6.12+ 
and SCHED_BATCH on 6.5 vs SCHED_BATCH on 6.12+. The results are below.

Kernel   | Runtime     | Throughput | P50 latency
aarm64   | parameters  | (NOPM)     | (larger is worse)
---------+-------------+------------+------------------
6.5.13   | default     |  baseline  |  baseline
---------+-------------+------------+------------------
6.12.25  | default     |  -5.1%     |  +7.8%
---------+-------------+------------+------------------
6.14.4   | default     |  -7.4%     |  +9.6%
---------+-------------+------------+------------------
6.15-rc4 | default     |  -7.4%     |  +10.2%
======================================================
6.5.13   | SCHED_BATCH |  baseline  |  baseline
---------+-------------+------------+------------------
6.12.25  | SCHED_BATCH |  -8.1%     |  +8.7%
---------+-------------+------------+------------------
6.14.4   | SCHED_BATCH |  -7.9%     |  +8.3%
---------+-------------+------------+------------------
6.15-rc4 | SCHED_BATCH |  -10.6%    |  +11.8%
---------+-------------+------------+------------------

The tests were run with the mysql reproducer published before (link and 
instructions below), using two networked machines running hammerdb and 
mysql respectively. The full test details and reports from "perf sched 
stats" are also posted [1], not included here for brevity.

[1] https://github.com/aws/repro-collection/blob/main/repros/repro-mysql-EEVDF-regression/results/20250428/README.md


At this time, we have accumulated numerous data points and many hours of 
testing exhibiting this regression. The only counter arguments I've seen 
are relying on either synthetic test cases or unrealistic simplified tests 
(e.g. SUT and loadgen on the same machine, or severely limited thread 
count). It's becoming painfully obvious that EEVDF replaced CFS before it 
was ready to be released; yet most of what we've been debating is whether 
SCHED_BATCH is a good enough workaround.

Please let's take a fresh approach at what's happening, and find out why 
the scheduler is underperforming. I'm happy to provide additional data if 
it helps debug this. I've backported and forward ported Swapnil's "perf 
sched stats" command [2] so it is ready to run on any kernel from 6.5 up 
to 6.15, and the reproducer already runs it automatically for convenience.

[2] https://lore.kernel.org/lkml/20250311120230.61774-1-swapnil.sapkal@amd.com/


Instructions for reproducing the above tests (same as before):

1. Code: The reproducer scenario and framework can be found here: 
https://github.com/aws/repro-collection

2. Setup: I used a 16 vCPU / 32G RAM / 1TB RAID0 SSD instance as SUT, 
running Ubuntu 22.04 with the latest updates. All kernels were compiled 
from source, preserving the same config across versions (as much as 
possible) to minimize noise - in particular, CONFIG_HZ=250 was used 
everywhere.

3. Running: To run the repro, set up a SUT machine and a LDG (loadgen) 
machine on the same network, clone the git repo on both, and run:

(on the SUT) ./repro.sh repro-mysql-EEVDF-regression SUT --ldg=<loadgen_IP> 

(on the LDG) ./repro.sh repro-mysql-EEVDF-regression LDG --sut=<SUT_IP>

The repro will build and test multiple combinations of kernel versions and 
scheduler settings, and will prompt you when to reboot the SUT and rerun 
the same above command to continue the process.

More instructions can be found both in the repo's README and by running 
'repro.sh --help'.

