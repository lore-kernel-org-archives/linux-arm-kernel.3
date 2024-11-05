Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D1ED36121
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 19:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OdnFQdcZbnKD7gZyYCPM2XvmjtLUUKuQfJuGybABfRg=; b=P6PdEt+IAy34GbDa1Oj0TBmJek
	r4ycvaqLVSi1icZzN9rInG9Q+Yz7wHCTndGy7SoUFZgGQl4JsW5nolvegJH09k5U8b3X6nJiP0WdD
	ma8ZsiQ/1FMgSf4OElfoE800/cIkDNPbhVElNnTw/1pybddlQIndE9na9F6MSjhTykpoY3tLoyonl
	LW8dOn16BAi+F8j1r+6mp4FLjlDo8wdUPxwSQFmmZBDYwiPKX+qc75Yh4FdWy8/0ncASWBLpgJVSP
	he7uUk504mc69EG5KDWnTmmaSOpkpzjcf6EGUJ2AEN8zvgozBYjbvd1938KrpZzcI7No8wgSg7gVC
	h2UJQvkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8PZH-00000000bVr-3aeC;
	Tue, 05 Nov 2024 19:50:23 +0000
Received: from gentwo.org ([62.72.0.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8PUp-00000000aug-0Jux
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 19:45:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1730835946;
	bh=1U3UU0vNK2UHqlFnB6QG7+izsLRF9HGSgXpwKtSG3OA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QExaPV0B5/PcD8M4wyyQL8ZSAkH2WoSHEwCG2/0klxJX0iv+ArrkvEkLOPp396e/D
	 m+gORqTG38L7ug2odYbT12ywp5Bz8o6bUuXdhAV/j1t2PNijJsfQnzDYDzWpbTdZ4F
	 4VogdWAIEQvMGxg8QW/d2ljyUEjWDBYg1KS7t/00=
Received: by gentwo.org (Postfix, from userid 1003)
	id 7C1A34027E; Tue,  5 Nov 2024 11:45:46 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id 7A4F24026F;
	Tue,  5 Nov 2024 11:45:46 -0800 (PST)
Date: Tue, 5 Nov 2024 11:45:46 -0800 (PST)
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
Subject: Re: [PATCH 5/5] cpuidle: implement poll_idle() using
 smp_vcond_load_relaxed()
In-Reply-To: <20241105183041.1531976-6-harisokn@amazon.com>
Message-ID: <aeac3141-c480-52f9-610e-d9d222f3ecad@gentwo.org>
References: <20240925232425.2763385-1-ankur.a.arora@oracle.com> <20241105183041.1531976-1-harisokn@amazon.com> <20241105183041.1531976-6-harisokn@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_114547_187395_7D9CF83E 
X-CRM114-Status: UNSURE (   6.64  )
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

>  {
> -	u64 time_start;
> -
> -	time_start = local_clock_noinstr();
> +	unsigned long flags;

Lets keep recording that start value here. Otherwise the timeout could me
later than expected.

