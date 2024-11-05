Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02267D3610E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 19:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SHlKYmWrJexsI52/Kyz9hNTkPpxRQSSlSxiJa48ASWg=; b=tAx1/e0uvUSFXHsFs0GaYS0nNZ
	RUUaqNm3a344VVjoqNCPuqLpNx+HSL30WT809NXvxXiqxU/qE50gGGBDhzWe9lDH9aBpn/M2lNZDL
	bEVZZy18MkEnfE8uxE8X2QXeNHxF3A46AacUd9IhwG4R0CC5MXi6cuzeNLKSG659bddq/FmLcRQUl
	jyOJAQphkFVNJ+4alUiQfmKB3Y9wXn2NmfzENJorsGfFbxXEjrstuxdYnXepdJoQMXtO6iRaq0ZkA
	51Cu62mc6k/rLFmlIRW38vv7j5ceVHOSRf/7+LXOZg1Rcimgm2IDsHCDgBZm3AvBM4CnG8IiY4+cj
	rAu5sFag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8PUE-00000000amt-3fcj;
	Tue, 05 Nov 2024 19:45:10 +0000
Received: from gentwo.org ([62.72.0.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8PLn-00000000ZHT-3Rpn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 19:36:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1730835385;
	bh=SHlKYmWrJexsI52/Kyz9hNTkPpxRQSSlSxiJa48ASWg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=gur4LC2ENdoTLE5NBd9oeUipAzLvjujzbc1S4BDW5aVfMtIYlqZPGj/kxOVfmkdoH
	 Mdqu3peD0iAWAw8ACHJujfjLDLwO8nbRoX00ZBbcdIjYrRlW6TzoabCcl+85JIy6Sc
	 IEkq8PzsnqHjkzf63DkFeNDo4Npki//p9t1ZAKgk=
Received: by gentwo.org (Postfix, from userid 1003)
	id 299BA4027E; Tue,  5 Nov 2024 11:36:25 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id 276364026F;
	Tue,  5 Nov 2024 11:36:25 -0800 (PST)
Date: Tue, 5 Nov 2024 11:36:25 -0800 (PST)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: Haris Okanovic <harisokn@amazon.com>
cc: ankur.a.arora@oracle.com, catalin.marinas@arm.com, 
    linux-pm@vger.kernel.org, kvm@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
    will@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
    dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
    pbonzini@redhat.com, wanpengli@tencent.com, vkuznets@redhat.com, 
    rafael@kernel.org, daniel.lezcano@linaro.org, peterz@infradead.org, 
    arnd@arndb.de, lenb@kernel.org, mark.rutland@arm.com, mtosatti@redhat.com, 
    sudeep.holla@arm.com, misono.tomohiro@fujitsu.com, maobibo@loongson.cn, 
    joao.m.martins@oracle.com, boris.ostrovsky@oracle.com, 
    konrad.wilk@oracle.com
Subject: Re: [PATCH 1/5] asm-generic: add smp_vcond_load_relaxed()
In-Reply-To: <20241105183041.1531976-2-harisokn@amazon.com>
Message-ID: <f46a71b5-8e0f-c2a9-b3f8-d499c10f227a@gentwo.org>
References: <20240925232425.2763385-1-ankur.a.arora@oracle.com> <20241105183041.1531976-1-harisokn@amazon.com> <20241105183041.1531976-2-harisokn@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_113627_969202_8559D73E 
X-CRM114-Status: UNSURE (   7.56  )
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

On Tue, 5 Nov 2024, Haris Okanovic wrote:

> +/**
> + * smp_vcond_load_relaxed() - (Spin) wait until an expected value at address
> + * with no ordering guarantees. Spins until `(*addr & mask) == val` or
> + * `nsecs` elapse, and returns the last observed `*addr` value.
> + *
> + * @nsecs: timeout in nanoseconds

Please use an absolute time in nsecs instead of a timeout. You do not know
what will happen to your execution thread until the local_clock_noinstr()
is run.



