Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA8CD58065
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 11:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qI5cqPydCy6loaD3+vJjer5igPbaebhQ8NFF6WG1rWg=; b=gLzDum7Su4BQnm7eqpawhFhRoU
	bhSKqUul9t3ezuJ57x5Tq1G7U090GddhW2IKQfU578l5kC4BMhsXAeOAO4pxB+4Mld0K6icKYdMk/
	Zfdb4N23L4lVpbr7iHJYkGkLg/2k350Vt/uJRB+AXqoq8XbXqNzVfTx3B1AR81HMm7NyaiBme/d8G
	fPkHJxvJMDR+2UNpHCM4T7B6wNNBSY53dTLA41wKNc1FOCnxnKm/6vrdJ1dvfzwrV7oJ3Do9rRuCe
	qZVS4V4CsDULv4syF3lqOf1KLz48XoPGiwfjW48Sx6QCGQVE/ClKHLxva+TBlxsgY72uxinWBGw/Z
	KeOFTJpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFXOj-00000007ubx-1bgo;
	Mon, 25 Nov 2024 11:36:57 +0000
Received: from smtp-fw-2101.amazon.com ([72.21.196.25])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFXNk-00000007uWt-3qOV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 11:35:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1732534557; x=1764070557;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qI5cqPydCy6loaD3+vJjer5igPbaebhQ8NFF6WG1rWg=;
  b=JDoRCSULqSsYpWqwTEVPDSWgdNba6natOYjVWkQQy9SPZpxJ9mYjozyW
   +pInyFAvk2nGdQOftL32RQYTdok7koO3H4lpI4khN79d2ezM51oKAIldE
   C1Gx+uZIP+5lG40KpEH7Q4sfekEqUO/1WSTVNbSEhAp90rhgupuIhez4g
   g=;
X-IronPort-AV: E=Sophos;i="6.12,182,1728950400"; 
   d="scan'208";a="445805720"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.124.125.6])
  by smtp-border-fw-2101.iad2.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 11:35:51 +0000
Received: from EX19MTAUWA001.ant.amazon.com [10.0.21.151:10311]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.43.2:2525] with esmtp (Farcaster)
 id f8329d89-d797-48b5-9e29-b69abe8c08e8; Mon, 25 Nov 2024 11:35:50 +0000 (UTC)
X-Farcaster-Flow-ID: f8329d89-d797-48b5-9e29-b69abe8c08e8
Received: from EX19D016UWA004.ant.amazon.com (10.13.139.119) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Mon, 25 Nov 2024 11:35:49 +0000
Received: from 88665a51a6b2.amazon.com (10.106.179.51) by
 EX19D016UWA004.ant.amazon.com (10.13.139.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Mon, 25 Nov 2024 11:35:47 +0000
From: Cristian Prundeanu <cpru@amazon.com>
To: <cpru@amazon.com>
CC: <kprateek.nayak@amd.com>, <abuehaze@amazon.com>, <alisaidi@amazon.com>,
	<benh@kernel.crashing.org>, <blakgeof@amazon.com>, <csabac@amazon.com>,
	<doebel@amazon.com>, <gautham.shenoy@amd.com>, <joseph.salisbury@oracle.com>,
	<dietmar.eggemann@arm.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-tip-commits@vger.kernel.org>,
	<mingo@redhat.com>, <peterz@infradead.org>, <x86@kernel.org>
Subject: Re: [PATCH 0/2] [tip: sched/core] sched: Disable PLACE_LAG and RUN_TO_PARITY and move them to sysctl
Date: Mon, 25 Nov 2024 05:35:35 -0600
Message-ID: <20241125113535.88583-1-cpru@amazon.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241017052000.99200-1-cpru@amazon.com>
References: <20241017052000.99200-1-cpru@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.106.179.51]
X-ClientProxiedBy: EX19D035UWB001.ant.amazon.com (10.13.138.33) To
 EX19D016UWA004.ant.amazon.com (10.13.139.119)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_033557_278758_DA2EC6DE 
X-CRM114-Status: GOOD (  23.21  )
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

Here are more results with recent 6.12 code, and also using SCHED_BATCH.
The control tests were run anew on Ubuntu 22.04 with the current pre-built
kernels 6.5 (baseline) and 6.8 (regression out of the box).

When updating mysql from 8.0.30 to 8.4.2, the regression grew even larger.
Disabling PLACE_LAG and RUN _TO_PARITY improved the results more than
using SCHED_BATCH.

Kernel   | default  | NO_PLACE_LAG and | SCHED_BATCH | mysql
         | config   | NO_RUN_TO_PARITY |             | version
---------+----------+------------------+-------------+---------
6.8      | -15.3%   |                  |             | 8.0.30
6.12-rc7 | -11.4%   | -9.2%            | -11.6%      | 8.0.30
         |          |                  |             |
6.8      | -18.1%   |                  |             | 8.4.2
6.12-rc7 | -14.0%   | -10.2%           | -12.7%      | 8.4.2
---------+----------+------------------+-------------+---------

Confidence intervals for all tests are smaller than +/- 0.5%.

I expect to have the repro package ready by the end of the week. Thank you
for your collective patience and efforts to confirm these results.


On 2024-11-01, Peter Zijlstra wrote:

>> (At the risk of stating the obvious, using SCHED_BATCH only to get back to 
>> the default CFS performance is still only a workaround,
>
> It is not really -- it is impossible to schedule all the various
> workloads without them telling us what they really like. The quest is to
> find interfaces that make sense and are implementable. But fundamentally
> tasks will have to start telling us what they need. We've long since ran
> out of crystal balls.

Completely agree that the best performance is obtained when the tasks are
individually tuned to the scheduler and explicitly set running parameters.
This isn't different from before.

But shouldn't our gold standard for default performance be CFS? There is a
significant regression out of the box when using EEVDF; how is seeking
additional tuning just to recover the lost performance not a workaround?

(Not to mention that this additional tuning means shifting the burden on
many users who may not be familiar enough with scheduler functionality.
We're essentially asking everyone to spend considerable effort to maintain
status quo from kernel 6.5.)


On 2024-11-14, Joseph Salisbury wrote:

> This is a confirmation that we are also seeing a 9% performance
> regression with the TPCC benchmark after v6.6-rc1.  We narrowed down the
> regression was caused due to commit:
> 86bfbb7ce4f6 ("sched/fair: Add lag based placement")
> 
> This regression was reported via this thread:
> https://lore.kernel.org/lkml/1c447727-92ed-416c-bca1-a7ca0974f0df@oracle.com/
> 
> Phil Auld suggested to try turning off the PLACE_LAG sched feature. We
> tested with NO_PLACE_LAG and can confirm it brought back 5% of the
> performance loss.  We do not yet know what effect NO_PLACE_LAG will have
> on other benchmarks, but it indeed helps TPCC.

Thank you for confirming the regression. I've been monitoring performance
on the v6.12-rcX tags since this thread started, and the results have been
largely constant.

I've also tested other benchmarks to verify whether (1) the regression
exists and (2) the patch proposed in this thread negatively affects them.
On postgresql and wordpress/nginx there is a regression which is improved
when applying the patch; on mongo and mariadb no regression manifested, and
the patch did not make their performance worse.


On 2024-11-19, Dietmar Eggemann wrote:

> #cat /etc/systemd/system/mysql.service
>
> [Service]
> CPUSchedulingPolicy=batch
> ExecStart=/usr/local/mysql/bin/mysqld_safe

This is the approach I used as well to get the results above.

> My hunch is that this is due to the 'connection' threads (1 per virtual
> user) running in SCHED_BATCH. I yet have to confirm this by only
> changing the 'connection' tasks to SCHED_BATCH.

Did you have a chance to run with this scenario?

