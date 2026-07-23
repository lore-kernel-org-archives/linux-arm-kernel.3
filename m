Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA55C531F7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 15:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+k5jSvDUMU4cPoKCVbhaqWyx0o46NejDYXogafOH/14=; b=TiJgP0bEtI6IDyTU1+GICLg7l3
	V0FUVsqHq64/AsjXi8V+4mSPTmgV6NeEY+7UMHXMTNdPxWi5l2HXEUvQ96IjxMI09CMx36DYiNdc7
	V8dTKgE8DndDV3Esy4nU+3HMrACeUvx0qdDHfN1W033mEz9anT4RzvuvWhADsOOw1kXIxA+RjZ84d
	QZxZ4wQ5LtLDY7cl7zz4Y+R5l43mzg4w0oUlP01Jkf7Fbt115p6r8Otu3W4gcRqIsSBbDdn/jmbkq
	RC7eOfowFtkherNY9k6YwSoiAskB1FG+aQrfxne9Wm4xP5AuXipLScaTHBTjXFOmw/vnq7A8owes9
	vov2CSng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmvo7-0000000EfKa-3zzd;
	Thu, 23 Jul 2026 15:57:59 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmvo4-0000000EfK2-3BE7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 15:57:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=+k5jSvDUMU4cPoKCVbhaqWyx0o46NejDYXogafOH/14=; b=gAyuiqoaNTqTsUT9injp3BMG12
	nfA6QwCZL8GbIkkY1cyrdejhukJJS8PU9RzJhPnS22TcosMiR9DIIBxS8m7CPYO50EaW5wBaqpmUT
	hkqAM7oKggKSDB0V1l+O5SZTedqwsWHn8XjshgBGfMFiCyUkXZ37wHBeDWF2Hp+b8C7AWKNC8QDVI
	Iw1uXONA6sWCxIotmNASIrvvggneFglyqtIiITurqS2tvUD8T5yDSogk6OOWSIYsabBo08mn0cGUV
	Zegw0Glp7nm5yuLKnq2v2lzt9ViIQA4672vOibC9VGjdzDkFVXGUQJkV08ygDSSD9opOnF1EYvg/o
	FGSk8UrA==;
Received: from [179.118.191.219] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wmvnS-003VA4-9g; Thu, 23 Jul 2026 17:57:18 +0200
Message-ID: <a701b60b-d343-4a7f-b298-e76c6c3a6cbc@igalia.com>
Date: Thu, 23 Jul 2026 12:57:10 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] arm64: vdso32: Implement
 __vdso_futex_robust_try_unlock()
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Peter Zijlstra <peterz@infradead.org>, Florian Weimer <fweimer@redhat.com>,
 Darren Hart <dvhart@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 Davidlohr Bueso <dave@stgolabs.net>, Arnd Bergmann <arnd@arndb.de>,
 Uros Bizjak <ubizjak@gmail.com>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?=
 <linux@weissschuh.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, kernel-dev@igalia.com
References: <20260720-tonyk-robust_arm-v6-0-7e68c122047e@igalia.com>
 <20260720-tonyk-robust_arm-v6-4-7e68c122047e@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20260720-tonyk-robust_arm-v6-4-7e68c122047e@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_085757_091424_E09DF3E6 
X-CRM114-Status: UNSURE (   8.43  )
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

Em 20/07/2026 13:03, André Almeida escreveu:
> Based on aarch64 implementation, provide a 32 bit entry point for
> this vDSO.
> 
> In order to keep compatibility with arm64_futex_robust_unlock_get_pop(),
> make sure to store the pop address at r2 and the compare result value
> at r3.
> 
> Signed-off-by: André Almeida <andrealmeid@igalia.com>

[...]

> +__u32 __vdso_futex_robust_list32_try_unlock(__u32 *lock, __u32 tid, __u32 *pop)
> +{
> +	register __u32 *pop_reg asm("r2") = pop, result_reg asm("r3") = 0;
> +	__u32 val, zero = 0;
> +
> +	asm volatile (
> +		".globl						  "
> +		"__futex_list32_try_unlock_cs_start,		  "
> +		"__futex_list32_try_unlock_cs_success,		  "
> +		"__futex_list32_try_unlock_cs_end		\n"
> +
> +		"retry:						\n"
> +		"	ldrex %[val], %[lock]			\n"
> +		"	cmp %[tid], %[val]			\n"
> +		"	bne __futex_list32_try_unlock_cs_end	\n"
> +		"	strex %[result], %[zero], %[lock]	\n"

Actually, this should be `stlex` instead for the store release semantics.

> +		"__futex_list32_try_unlock_cs_start:		\n"
> +		"	cmp %[result], #0			\n"
> +		"	bne retry				\n"
> +		"__futex_list32_try_unlock_cs_success:		\n"
> +		"	str %[zero], %[pop_reg]			\n"
> +		"__futex_list32_try_unlock_cs_end:		\n"
> +
> +		: [val] "=&r" (val), [result] "=r" (result_reg)
> +		: [tid] "r" (tid), [lock] "Q" (*lock), [pop_reg] "Q" (*pop_reg), [zero] "r" (zero)
> +		: "cc", "memory"
> +	);
> +
> +	return val;
> +}
> 


