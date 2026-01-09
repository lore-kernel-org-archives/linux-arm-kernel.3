Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91DA2D1A63A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 14:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WIcwzr81HwpLkhDtSPQKTQ27eex4m9UQsXCqMJBW3yM=; b=Ir846C65lq59C0MWbT7f6RLtGY
	hvG7xPcG5sOq/nQURBgWP7FKj6CQ6GMs2P1nBtj5BRL7VsTbARlffzYdG8bjo4NahWY494+UGpLa2
	Wpo45uqaFO4/6KyWlhc95S87Uy6D8NuYQlJA5O0yOxIgFV1zsvPVRflXAyTkz+Qc8kuKsnVE0w7ms
	1GhlbQqtktxn/HhteBXVoRK+3D0ZBnZKyYYSjSmdJm29DBRG7qhpnrK6hCrEQLBbKlJJZ1Q65vRii
	uhK1B9tN15/xzvjBE9ZmIE85J+tFgqqyZvTCZvhzxNe/lm+4WC3o5THOL/VncOj3kUM86EmddXrPx
	d3DK0iyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veDJA-00000002Omc-37SU;
	Fri, 09 Jan 2026 14:17:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veDJA-00000002OmT-23kL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 14:17:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9469460122;
	Fri,  9 Jan 2026 14:17:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 557A6C4CEF1;
	Fri,  9 Jan 2026 14:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767968263;
	bh=vd6qb39sTCFIUF7Ocpe41fwG41sMttVN9wEPA6KuLdQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VF2XfVtsVmxwgr7tNzF6S0PyJO39O2U1i8oLEPbI9UicTnmj3CA3DCV/TKVdUCS64
	 ZkHCVp44eV2grPDXSkPW0Z8aG9vRddVH/p63dPSSd1ph33FncCIEKGEERzrS+UCV0p
	 Hnz3RKFUrv5pBvfPwvMQ+T+r1fBA5T34KRTqeumkeQbSZJxmj4YF7VJ5f3n8LlDkMc
	 C6giBS8IyHow7R+YXARHYsLkXqbK9nuhk/uqP05QmbfwJzU2AkePgc/+aUvppcqSXY
	 rvyubWUR7Z93PsF2dmIviy3JmsFvfdonb57CEtEhrYqRj+k1Ez9FiXjjOTHgNwrIEz
	 TbSJm+pyb+0+w==
Date: Fri, 9 Jan 2026 14:17:36 +0000
From: Will Deacon <will@kernel.org>
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	bpf@vger.kernel.org, arnd@arndb.de, catalin.marinas@arm.com,
	peterz@infradead.org, akpm@linux-foundation.org,
	mark.rutland@arm.com, harisokn@amazon.com, cl@gentwo.org,
	ast@kernel.org, rafael@kernel.org, daniel.lezcano@linaro.org,
	memxor@gmail.com, zhenglifeng1@huawei.com,
	xueshuai@linux.alibaba.com, joao.m.martins@oracle.com,
	boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
Subject: Re: [PATCH v8 04/12] arm64: support WFET in
 smp_cond_relaxed_timeout()
Message-ID: <aWEOALG07jHC_oHC@willie-the-truck>
References: <20251215044919.460086-1-ankur.a.arora@oracle.com>
 <20251215044919.460086-5-ankur.a.arora@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215044919.460086-5-ankur.a.arora@oracle.com>
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

On Sun, Dec 14, 2025 at 08:49:11PM -0800, Ankur Arora wrote:
> Extend __cmpwait_relaxed() to __cmpwait_relaxed_timeout() which takes
> an additional timeout value in ns.
> 
> Lacking WFET, or with zero or negative value of timeout we fallback
> to WFE.
> 
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
> ---
>  arch/arm64/include/asm/barrier.h |  8 ++--
>  arch/arm64/include/asm/cmpxchg.h | 72 ++++++++++++++++++++++----------
>  2 files changed, 55 insertions(+), 25 deletions(-)

Sorry, just spotted something else on this...

> diff --git a/arch/arm64/include/asm/barrier.h b/arch/arm64/include/asm/barrier.h
> index 6190e178db51..fbd71cd4ef4e 100644
> --- a/arch/arm64/include/asm/barrier.h
> +++ b/arch/arm64/include/asm/barrier.h
> @@ -224,8 +224,8 @@ do {									\
>  extern bool arch_timer_evtstrm_available(void);
>  
>  /*
> - * In the common case, cpu_poll_relax() sits waiting in __cmpwait_relaxed()
> - * for the ptr value to change.
> + * In the common case, cpu_poll_relax() sits waiting in __cmpwait_relaxed()/
> + * __cmpwait_relaxed_timeout() for the ptr value to change.
>   *
>   * Since this period is reasonably long, choose SMP_TIMEOUT_POLL_COUNT
>   * to be 1, so smp_cond_load_{relaxed,acquire}_timeout() does a
> @@ -234,7 +234,9 @@ extern bool arch_timer_evtstrm_available(void);
>  #define SMP_TIMEOUT_POLL_COUNT	1
>  
>  #define cpu_poll_relax(ptr, val, timeout_ns) do {			\
> -	if (arch_timer_evtstrm_available())				\
> +	if (alternative_has_cap_unlikely(ARM64_HAS_WFXT))		\
> +		__cmpwait_relaxed_timeout(ptr, val, timeout_ns);	\
> +	else if (arch_timer_evtstrm_available())			\
>  		__cmpwait_relaxed(ptr, val);				\

Don't you want to make sure that we have the event stream available for
__cmpwait_relaxed_timeout() too? Otherwise, a large timeout is going to
cause problems.

Will

