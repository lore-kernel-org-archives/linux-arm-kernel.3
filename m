Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D89C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 05:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9gfE2X9xP7erlqI3KPIjHQxBkm4SGTEH7VMOREGQ43I=; b=nhTOiTORRwkPeI07VHT3INFEvP
	HWPtCD+UTH4bSufwvK+q0pq/UAg0eB6mYy2bZzV6rYTmftTD0/6ODeodwkmtUH8e7JWPaCMLO5o9U
	tX5JEP/UzwjVp4VyreShFXeZFIf8JK14JGKpZHiJ2GOYF45aSA5PzCE9AQd9qjwf8NijDneO8JmU4
	jT3XwRmfDsxncSPuQxbcZKjQnSSR1viCg/n1gWaJbXfSOklCUN5o2rXebBeU8UdregKQhy5SRphfw
	5zkbg0NeTeUHa58UVuo9GlwCvao8ZEz/uyEDq2q//QOu6QjgfotlEb+sy/yeiSWmZU1Kw5Q4oT7g5
	SJUPzs3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti5Wo-00000006H5T-2Uu9;
	Wed, 12 Feb 2025 05:43:18 +0000
Received: from smtp-fw-9106.amazon.com ([207.171.188.206])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti5V1-00000006Gom-3Rll
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 05:41:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1739338887; x=1770874887;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9gfE2X9xP7erlqI3KPIjHQxBkm4SGTEH7VMOREGQ43I=;
  b=nRMcv++zPruedIS4oAEeORY9b+d7hC0G4+/wZmgGGMklBgJ8z4ucpxRA
   KyNdskKKF7RqPAGQh5B8UaS5TD1cNhuNDUDJwu4hJWAN7zAPvGLvb/ijr
   UnrsN0Kfn9hmBotoqOU9iRxEUOBAgI5Ig1boSM6A8Onaz3rJ6g90ZOJ/R
   U=;
X-IronPort-AV: E=Sophos;i="6.13,279,1732579200"; 
   d="scan'208";a="798097614"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.210])
  by smtp-border-fw-9106.sea19.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 05:41:26 +0000
Received: from EX19MTAUWB002.ant.amazon.com [10.0.38.20:25574]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.23.246:2525] with esmtp (Farcaster)
 id b73d078c-8489-43c2-8a48-97d423604b5d; Wed, 12 Feb 2025 05:41:25 +0000 (UTC)
X-Farcaster-Flow-ID: b73d078c-8489-43c2-8a48-97d423604b5d
Received: from EX19D016UWA004.ant.amazon.com (10.13.139.119) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.39;
 Wed, 12 Feb 2025 05:41:25 +0000
Received: from 88665a51a6b2.amazon.com (10.106.179.55) by
 EX19D016UWA004.ant.amazon.com (10.13.139.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.39;
 Wed, 12 Feb 2025 05:41:23 +0000
From: Cristian Prundeanu <cpru@amazon.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
CC: Cristian Prundeanu <cpru@amazon.com>, Hazem Mohamed Abuelfotoh
	<abuehaze@amazon.com>, Ali Saidi <alisaidi@amazon.com>, "Benjamin
 Herrenschmidt" <benh@kernel.crashing.org>, Geoff Blake <blakgeof@amazon.com>,
	Csaba Csoma <csabac@amazon.com>, Bjoern Doebel <doebel@amazon.com>, "Gautham
 Shenoy" <gautham.shenoy@amd.com>, Joseph Salisbury
	<joseph.salisbury@oracle.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, "Linus
 Torvalds" <torvalds@linux-foundation.org>, Borislav Petkov <bp@alien8.de>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-tip-commits@vger.kernel.org>, <x86@kernel.org>
Subject: Re: [PATCH 0/2] [tip: sched/core] sched: Disable PLACE_LAG and RUN_TO_PARITY and move them to sysctl
Date: Tue, 11 Feb 2025 23:41:13 -0600
Message-ID: <20250212054113.19938-1-cpru@amazon.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <feb31b6e-6457-454c-a4f3-ce8ad96bf8de@amd.com>
References: <20250119110410.GAZ4zcKkx5sCjD5XvH@fat_crate.local>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.106.179.55]
X-ClientProxiedBy: EX19D046UWB003.ant.amazon.com (10.13.139.174) To
 EX19D016UWA004.ant.amazon.com (10.13.139.119)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_214128_007433_5BD977CB 
X-CRM114-Status: GOOD (  19.54  )
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

Hi Prateek,

Thank you for the analysis details!

> Thank you for the reproducer. I haven't tried it yet (in part due
> to the slightly scary "Assumptions" section)

It wasn't meant to be scary, my apologies. It is meant to say that the 
reproducer will only perform testing-related tasks (which you'd normally 
do manually), without touching the infrastructure (firewall, networking, 
instance mangement, etc). As long as you set all that up the same way you 
do when you test manually, you will be fine. I'll clarify the README.

Should you run into any questions, please do not hesitate to contact me 
directly, and I'll help clear the path.

> v6.14-rc1                   baseline
> v6.5.0 (pre-EEVDF)          -0.95%
> v6.14-rc1 + NO_PL + NO_RTP  +6.06%

This is interesting. While you do reproduce the benefits of NO_PL+NO_RTP, 
your result shows no regression compared to the baseline CFS. I'm only 
speculating, but running both SUT and loadgen on the same machine is a 
large variation of the test setup, and can lead to result differences like 
this one.

> Digging through the scripts, I found that SCHED_BATCH setting is done
> via systemd in [3] via the "CPUSchedulingPolicy" parameter.
> [3] https://github.com/aws/repro-collection/blob/main/workloads/mysql/files/mysqld.service.tmpl

That is correct, the reproducer uses systemd to set the scheduler policy 
for mysqld.

> interestingly, if I do (version 1): [...]
> I more or less get the same results as baseline v6.14-rc1 (Weird!)
> But then if I do (version 2): [...]
> I see the performance reach to the same level as that with NO_PL +
> NO_RTP.

That's a good find. I will compare on my setup if performance changes when 
manually setting all mysqld tasks to SCHED_BATCH. And I haven't yet run 
perf sched stats on the reproducer, but it may hold useful insight. 
I'll follow up with more details as I gather them.

Your find also helps to point out that even when it works, SCHED_BATCH is 
a more complex and error prone mitigation than just disabling PL and RTP. 
The same reproducer setup that uses systemd to set SCHED_BATCH does show 
improvement in 6.12, but not in 6.13+. There may not even be a single 
approach that works well on both.

Conversely, setting NO_PLACE_LAG + NO_RUN_TO_PARITY is simply done at boot 
time, and does not require further user effort. It's even simpler if those 
two features are exposed via sysctl, making it trivial to pesist and query 
with standard Linux commands as needed. 

Peter, I've renewed my initial patch so it applies to the current 
sched/core, and removed the dependency on changing the default values 
first. I'd appreciate you considering it for merging [1].

[1] https://lore.kernel.org/20250212053644.14787-1-cpru@amazon.com

-Cristian

