Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7AD1606A328
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 04:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2+jFqLjB;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=dcoBMuqC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:Cc:
	References:Date:To:Content-Type:Mime-Version:Message-Id:
	Content-Transfer-Encoding:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QZwA1ylfcTQpoiqvqbwvBbujn8CAZYbBXuwI3cwgUxk=; b=2+jFqLjBd7z2BMhpuUCnKDrw39
	m6Cy5QfGGU3vf6IAM90fe6uY/ekY39AJSGD5Rq6y2x+v558HCFmNCzLxCvVJCsl068JmjR7jnjW7S
	8cwgM4CcibiYXWU9/gPgVI/UBccuyTi4qmvEiU4RBFMjBRtKAMs4XUlEgIt6Wp7JZ3iseBKK6iH1R
	IOtxGVDs1/rsgoscgLFclcd0+mG+KLIFDugfdMEy18f5wNyrkSGCVYzkRDAGqrh453bz7Zby9hyOz
	L/YztAYHd7oBo+CF6L7i7Zy/mNO24KCLt8/xNu117uchzpx/IsHIP03T8y6HIyo3MS9znJKUCVZep
	0MOZt8/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOotD-00000007kvJ-23BR;
	Thu, 05 Nov 2026 04:15:51 +0000
Received: from va-1-115.ptr.blmpb.com ([209.127.230.115])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOotA-00000007kt9-3YBk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 04:15:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1793852139; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=QZwA1ylfcTQpoiqvqbwvBbujn8CAZYbBXuwI3cwgUxk=;
 b=dcoBMuqC9Ugy3/YP8rWZ9pogd982RtlOsQiKGJDu90izjwKAI0D12GAblLdJ/1/2xWrPHM
 JD3nRIEe9hdHLCUDNiNNCgnAWjsqQgyzVB8WeEHdVc6AYV1534xJR2186bXWA4gzG7XbNS
 S1qtyz8ztDMYWjbQzel8ZBHCkf8SohvKVIUs+tOezwhfXd7d0m2jeeJ2VPoLOWOj+BpUmT
 nIfn/1yWVA/7WBu9Nz90YTzuM902nJsja1PFa6SU9c/7tLjDb+PyR+t81Onyz4dr0fPZkP
 +6yRdXCmmW7GQxKqK/J6HDDjmVJaFa8ZXjuOI8z4wsMFebocPTStJMvUgTjxeQ==
From: "Zhao Gongyi" <zhaogongyi@bytedance.com>
X-Original-From: Zhao Gongyi <zhaogongyi@bytedance.com>
Content-Transfer-Encoding: 7bit
Message-Id: <56ed8952-fb5a-4f88-90c9-6fe5476237cc@bytedance.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
To: "Will Deacon" <will@kernel.org>, 
	"Catalin Marinas" <catalin.marinas@arm.com>
Date: Thu, 5 Nov 2026 12:15:24 +0800
User-Agent: Mozilla Thunderbird
X-Lms-Return-Path: <lba+26aec02e9+76a468+lists.infradead.org+zhaogongyi@bytedance.com>
References: <20261023110710.10145-1-zhaogongyi@bytedance.com> <at-czRUYRPRxi9dy@arm.com> <aus2Aq12Z-PKvoW7@willie-the-truck>
Cc: <mark.rutland@arm.com>, <oleg@redhat.com>, <ruanjinjie@huawei.com>, 
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] arm64: ptrace: don't warn on missing siginfo in a group-stop
In-Reply-To: <aus2Aq12Z-PKvoW7@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_201548_980472_8F8FBF76 
X-CRM114-Status: GOOD (  10.75  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Will,

On 11/4/26 9:41 PM, Will Deacon wrote:
> I can't quite get my head around what it means to set NT_ARM_SYSTEM_CALL
> in this context. Suddenly, in_syscall() will return true, which has
> implications for things like signal handling that seem bizarre if we're
> not actually in a syscall. Should we be avoiding this situation to start
> with?
> 

I ran an additional arm64 KVM test with SIGUSR1 and SIGUSR2 queued at a
group-stop. After the tracer set NT_ARM_SYSTEM_CALL to __NR_getpid, the
second signal-handling pass saw syscallno=172 (the control saw -1),
although the task had not entered a syscall. I did not observe an
incorrect restart: x0 held the first signal number (10) by that point.

system_call_set() assigns syscallno before calling
update_syscall_orig_x0_after_ptrace(), so retaining the early return
will not prevent that state. I can investigate separately whether the
regset write should be rejected at such a stop.


> I was trying to limit the scope of this hack as much as possible, so I
> think I'd prefer the early return tbh (i.e. just drop the WARN_ON_ONCE()
> and update the comment).
> 

Agreed. I'll retain the early return, drop WARN_ON_ONCE(), update the 
comment, and send v3 with that minimal change.

Thanks,
Gongyi

