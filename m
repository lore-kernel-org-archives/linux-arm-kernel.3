Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE44EF070B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 04:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FNs90UWUFg7F1Jb2HJimlsZX6woxU5aTVOhpGX9WvCk=; b=Dtw7BltHHPJaG/0gL3TELxp/Zs
	yTqHSQdJa186pe0Rbv69jyyt2YOAAf43eDlfeOK5hncFy+HedOuWcLPMw0IMZXULSv9jHZBkgaxFN
	h9oOtmTZ/7bQJCY7taUo4UXFcSleoX/BZAmEhGOwxomjjFaClXsX6n553WStbevmKMu2QCN0TsNPV
	p7hU5zpWPwRbI9+bN41OtXp3dFlJU9rSl4uunWGCWLOvL6g/BbptF85EAKz1Izj/2rxRTltcjaNXV
	6G6sv54ZhQE6lXSpK8skBllxKjpSldHIzShefMqYZDRWteyB1fAQS+6i3lJan3QhYIe6ic4+wet6O
	AcfDCNBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpJLS-0000000EpXb-1WGd;
	Mon, 09 Feb 2026 04:57:58 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpJLL-0000000EpXA-3g1G;
	Mon, 09 Feb 2026 04:57:51 +0000
Message-ID: <9414714a-ba13-4d17-8b4f-97a03b90d6c1@infradead.org>
Date: Sun, 8 Feb 2026 20:57:50 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 01/12] asm-generic: barrier: Add
 smp_cond_load_relaxed_timeout()
To: Ankur Arora <ankur.a.arora@oracle.com>, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org, bpf@vger.kernel.org
Cc: arnd@arndb.de, catalin.marinas@arm.com, will@kernel.org,
 peterz@infradead.org, akpm@linux-foundation.org, mark.rutland@arm.com,
 harisokn@amazon.com, cl@gentwo.org, ast@kernel.org, rafael@kernel.org,
 daniel.lezcano@linaro.org, memxor@gmail.com, zhenglifeng1@huawei.com,
 xueshuai@linux.alibaba.com, joao.m.martins@oracle.com,
 boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
References: <20260209023153.2661784-1-ankur.a.arora@oracle.com>
 <20260209023153.2661784-2-ankur.a.arora@oracle.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260209023153.2661784-2-ankur.a.arora@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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




> +/**
> + * smp_cond_load_relaxed_timeout() - (Spin) wait for cond with no ordering
> + * guarantees until a timeout expires.
> + * @ptr: pointer to the variable to wait on.
> + * @cond: boolean expression to wait for.

s/cond/cond_expr/

> + * @time_expr_ns: expression that evaluates to monotonic time (in ns) or,
> + *  on failure, returns a negative value.
> + * @timeout_ns: timeout value in ns
> + * Both of the above are assumed to be compatible with s64; the signed
> + * value is used to handle the failure case in @time_expr_ns.
> + *
> + * Equivalent to using READ_ONCE() on the condition variable.
> + *
> + * Callers that expect to wait for prolonged durations might want to
> + * take into account the availability of ARCH_HAS_CPU_RELAX.
> + */
> +#ifndef smp_cond_load_relaxed_timeout
> +#define smp_cond_load_relaxed_timeout(ptr, cond_expr,			\
> +				      time_expr_ns, timeout_ns)		\
> +({									\


-- 
~Randy


