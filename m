Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77AB7C79FBB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 23:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:References:
	In-Reply-To:CC:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cpm7fRwjhhvI0gL9ZWF/CWGjObI1IMCPM/5oBJgqSTI=; b=k02IjjlxLThszrQsHqHuIwHUwY
	nRDyKTPsxNDvcc1j/3Upfu6kpkInpNFEF9uHgCdk63vQRhCbX6aOjog6ZfSUK8DnQzLYeFKTBmPlG
	hyVze45wg3OQSw9P+yr0g+kS2W74MYluZoFhIh5cKVPqRPIjGM4YJKbQgNkFkleTJo2OvgUG5r7QA
	hu871PC9z4vvYbaPztx1Yxc1STMqgDlHt06z6Aq1Woql2z6QoTI5G6wKuVsceCYoUq09PPEKTATWO
	GpKtaYj0eWFzKE9jiEwGC9/OH1z/y2UL3XAOAq0M3EG3HtNkJMKO/+nWDx50yNCf9BOXRN4RitBJF
	pH/W+RSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4npA-0000000FVlQ-0zQX;
	Thu, 10 Sep 2026 23:04:56 +0000
Received: from pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com ([35.83.148.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4np7-0000000FVkq-1MyH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 23:04:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1789081493; x=1820617493;
  h=mime-version:content-transfer-encoding:subject:from:to:
   cc:in-reply-to:references:date:message-id;
  bh=Cpm7fRwjhhvI0gL9ZWF/CWGjObI1IMCPM/5oBJgqSTI=;
  b=ltRlb9PwlmWnlXZBUKxx6D4/9e5MmnKPvF8wKv20K3ySRSoBsoleKWje
   jZp/2GjxvGFc0Zzg1gur6yg66JL9P9k08ikNKLXTDd9kneqB8OwmuqYWx
   b8fdHRnRQOXoKYpHNgGhj9XQCNufDJfzxql1jAE91SOEeRpZB1k9M8luc
   /jiut1mhuHHqj6BgCyKn9KJfYsyklWz5WKAnpGejozdSZSZov7vkaTiN2
   622PICFBJdN3m+ud0kk4JvSKWtIJiMAa+Gq1CoduQLM0ggxmwDLq8zjQg
   Gcv4m7yvHNPiZN7JZu/acG2qN3oFOUJ1rMuFbdHW0YuMTTKC2upDqtdAz
   A==;
X-CSE-ConnectionGUID: syaoVgMbQSW/3j6FV4MDug==
X-CSE-MsgGUID: rGLszRc0RAmv4QW0+sJ8yA==
X-IronPort-AV: E=Sophos;i="6.27,96,1787011200"; 
   d="scan'208";a="28168128"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 23:04:49 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.105:21450]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.10.49:2525] with esmtp (Farcaster)
 id 2a193d5d-bee9-42f9-b267-05771716733e; Thu, 10 Sep 2026 23:04:49 +0000 (UTC)
X-Farcaster-Flow-ID: 2a193d5d-bee9-42f9-b267-05771716733e
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Thu, 10 Sep 2026 23:04:48 +0000
Received: from u34cccd802f2d52.ant.amazon.com (10.106.178.32) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.46;
 Thu, 10 Sep 2026 23:04:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v15 12/16] cpuidle/poll_state: Wait for need-resched
 via tif_need_resched_relaxed_wait()
From: Haris Okanovic <harisokn@amazon.com>
To: Ankur Arora <ankur.a.arora@oracle.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arch@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-pm@vger.kernel.org>,
	<bpf@vger.kernel.org>, <arnd@arndb.de>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <peterz@infradead.org>, <akpm@linux-foundation.org>,
	<mark.rutland@arm.com>, <harisokn@amazon.com>, <cl@gentwo.org>,
	<ast@kernel.org>, <rafael@kernel.org>, <daniel.lezcano@linaro.org>,
	<memxor@gmail.com>, <zhenglifeng1@huawei.com>, <xueshuai@linux.alibaba.com>,
	<rdunlap@infradead.org>, <david.laight.linux@gmail.com>,
	<broonie@kernel.org>, <joao.m.martins@oracle.com>,
	<boris.ostrovsky@oracle.com>, <konrad.wilk@oracle.com>, <ashok.bhat@arm.com>
In-Reply-To: <20260831202251.305046-13-ankur.a.arora@oracle.com>
References: <20260831202251.305046-1-ankur.a.arora@oracle.com>
 <20260831202251.305046-13-ankur.a.arora@oracle.com>
Date: Thu, 10 Sep 2026 18:04:27 -0500
Message-ID: <178908146776.2725577.2613699832033292946.b4-review@b4>
X-Mailer: b4 0.15.2
X-Originating-IP: [10.106.178.32]
X-ClientProxiedBy: EX19D033UWA002.ant.amazon.com (10.13.139.10) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_160453_433487_0A7EADEE 
X-CRM114-Status: UNSURE (   9.56  )
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

On Mon, 31 Aug 2026 13:22:47 -0700, Ankur Arora <ankur.a.arora@oracle.com> wrote:
> diff --git a/drivers/cpuidle/poll_state.c b/drivers/cpuidle/poll_state.c
> index c7524e4c522a2..7443b3e971baf 100644
> --- a/drivers/cpuidle/poll_state.c
> +++ b/drivers/cpuidle/poll_state.c
> @@ -6,41 +6,22 @@
> [ ... skip 36 lines ... ]
> -			}
> -		}
> +		dev->poll_time_limit = !tif_need_resched_relaxed_wait(limit);
>  	}
>  	raw_local_irq_disable();
>  

Tested again on AWS Graviton3/4/5 (ARM Neoverse V1/V2/V3) with haltpoll changes
atop latest master 8ab1afb2e: still seeing average 6% improvement across various
workloads (mysql, postgresql, cassandra, memcached) in latency sensitive configuration.

The new unit tests all pass on both metal and virt variants of the same machines.

I hope we can merge this soon.

Tested-by: Haris Okanovic <harisokn@amazon.com>

-- 
Haris Okanovic
AWS Graviton


