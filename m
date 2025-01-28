Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB3EC0218D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 23:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/0W2o0hkDJje6TvICiv/xRrM6lz4rUh/UvN51cJhJUo=; b=L9y8BW5wBZ/nMrB+WRyVqKMvwW
	/0Hub/L/RuUzEUFWXh6f8VUXOj2TuagNz0JrP0+WZaTBRLEbcPY4++FoTzsHE5VX59lIDhaDRmRZC
	uUQWEjuoNne71bLtqbQui2Hw4FfgR0dCtvUSHOlYnBcTYz4HHVmAw4T/cfmhBVpSX8vWLjU5gy3tL
	HbKQpGeTH9IdvUyVbPFldhhDv3pDfu+JNMeb/IUjPJvpvV3nX125/38wqkWitPhpxW0T/PadYCFYO
	OcNFkkv7WZKGPiZyc1V4ttkTljbj/Qr5ATe6MF3Cbd6LbQpHAfbDolX3ibiLbEZMqurqGd9HEP/UO
	y7BQlllg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcujZ-000000061ER-3QjP;
	Tue, 28 Jan 2025 23:11:05 +0000
Received: from smtp-fw-52005.amazon.com ([52.119.213.156])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcuiF-0000000615W-1ii2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 23:09:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1738105784; x=1769641784;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/0W2o0hkDJje6TvICiv/xRrM6lz4rUh/UvN51cJhJUo=;
  b=vmrVWWhxNVSMminwtepKQjbe6wWmrPppA05gOLYu7EbKkLezwntPlFoV
   1mZpeVHZbjBCIPosyup1Erbdzfvfe9/DoQ+FsPT+lh98Nx/65yX0bE4/F
   qKo4xz9WTfnU+EWgLKRfPiHStqGxn+G6WttCgqzmpMsyxvJdeMtqmeLvh
   U=;
X-IronPort-AV: E=Sophos;i="6.13,242,1732579200"; 
   d="scan'208";a="714298510"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.43.8.6])
  by smtp-border-fw-52005.iad7.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2025 23:09:39 +0000
Received: from EX19MTAUWC001.ant.amazon.com [10.0.21.151:57712]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.4.10:2525] with esmtp (Farcaster)
 id c0c7093e-98ea-47a8-98a5-47be9e4a4b48; Tue, 28 Jan 2025 23:09:38 +0000 (UTC)
X-Farcaster-Flow-ID: c0c7093e-98ea-47a8-98a5-47be9e4a4b48
Received: from EX19D016UWA004.ant.amazon.com (10.13.139.119) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.39;
 Tue, 28 Jan 2025 23:09:38 +0000
Received: from 88665a51a6b2.amazon.com (10.106.179.50) by
 EX19D016UWA004.ant.amazon.com (10.13.139.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.39;
 Tue, 28 Jan 2025 23:09:35 +0000
From: Cristian Prundeanu <cpru@amazon.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: <cpru@amazon.com>, <kprateek.nayak@amd.com>, <abuehaze@amazon.com>,
	<alisaidi@amazon.com>, <benh@kernel.crashing.org>, <blakgeof@amazon.com>,
	<csabac@amazon.com>, <doebel@amazon.com>, <gautham.shenoy@amd.com>,
	<joseph.salisbury@oracle.com>, <dietmar.eggemann@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-tip-commits@vger.kernel.org>, <mingo@redhat.com>, <x86@kernel.org>,
	<torvalds@linux-foundation.org>, <bp@alien8.de>
Subject: Re: [PATCH 0/2] [tip: sched/core] sched: Disable PLACE_LAG and RUN_TO_PARITY and move them to sysctl
Date: Tue, 28 Jan 2025 17:09:26 -0600
Message-ID: <20250128230926.11715-1-cpru@amazon.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: 20241017052000.99200-1-cpru@amazon.com
References: 20250119110410.GAZ4zcKkx5sCjD5XvH@fat_crate.local
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.106.179.50]
X-ClientProxiedBy: EX19D040UWA001.ant.amazon.com (10.13.139.22) To
 EX19D016UWA004.ant.amazon.com (10.13.139.119)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_150943_603657_9607F46B 
X-CRM114-Status: GOOD (  14.12  )
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

Thank you for the recent scheduler rework which went into kernel 6.13. 
Here are the latest test results using mysql+hammerdb, using a standalone 
reproducer (details and instructions below).

Kernel | Runtime      | Throughput | P50 latency
aarm64 | parameters   | (NOPM)     | (larger is worse)
-------+--------------+------------+------------------
6.5    | default      |  baseline  |  baseline
-------+--------------+------------+------------------
6.8    | default      |  -6.9%     |  +7.9%
       | NO_PL NO_RTP |  -1%       |  +1%
       | SCHED_BATCH  |  -9%       |  +10.7%
-------+--------------+------------+------------------
6.12   | default      |  -5.5%     |  +6.2%
       | NO_PL NO_RTP |  -0.4%     |  +0.1%
       | SCHED_BATCH  |  -4.1%     |  +4.9%
-------+--------------+------------+------------------
6.13   | default      |  -4.8%     |  +5.4%
       | NO_PL NO_RTP |  -0.3%     |  +0.01%
       | SCHED_BATCH  |  -4.8%     |  +5.4%
-------+--------------+------------+------------------

A performance improvement is noticeable in kernel 6.13 over 6.12, both in 
latency and throughput. At the same time, SCHED_BATCH no longer has the 
same positive effect it had in 6.12.

Disabling PLACE_LAG and RUN_TO_PARITY is still as effective as before. 
For this reason, I'd like to ask once again that this patch set be 
considered for merging and for backporting to kernels 6.6+.

> This patchset disables the scheduler features PLACE_LAG and RUN_TO_PARITY 
> and moves them to sysctl.
>
> Replacing CFS with the EEVDF scheduler in kernel 6.6 introduced 
> significant performance degradation in multiple database-oriented 
> workloads. This degradation manifests in all kernel versions using EEVDF, 
> across multiple Linux distributions, hardware architectures (x86_64, 
> aarm64, amd64), and CPU generations.

When weighing the relevance of various testing approaches, please keep in 
mind that mysql is a real-life workload, while the test which prompted the 
introduction of PLACE_LAG is much closer to a synthetic benchmark.


Instructions for reproducing the above tests:

1. Code: The repro scenario that was used for this round of testing can be 
found here: https://github.com/aws/repro-collection

2. Setup: I used a 16 vCPU / 32G RAM / 1TB RAID0 SSD instance as SUT, 
running Ubuntu 22.04 with the latest updates. All kernels were compiled 
from source, preserving the same config (as much as possible) to minimize 
noise - in particular, CONFIG_HZ=250 was used everywhere.

3. Running: To run the repro, set up a SUT machine and a LDG (loadgen) 
machine on the same network, clone the git repo on both, and run:

(on the SUT) ./repro.sh repro-mysql-EEVDF-regression SUT --ldg=<loadgen_IP> 

(on the LDG) ./repro.sh repro-mysql-EEVDF-regression LDG --sut=<SUT_IP>

The repro will build and test multiple combinations of kernel versions and 
scheduler settings, and will prompt you when to reboot the SUT and rerun 
the same command to continue the process.

More instructions can be found both in the repo's README and by running 
'repro.sh --help'.

