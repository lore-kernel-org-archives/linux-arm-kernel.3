Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C945CAC5B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 16:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PW5yPUHWq9i3qZqiltusUhuTfYMh+BTZI7MGN8GF7lI=; b=rAUvJ6DT422S88fE2EIdRmL4XM
	Yf3IkEkvKAYUalvbb/en0G62+K95oAFLe5gyLflmUP/LF1TtfPtp68zPgUR6/Oy3LNYV4GUkSpLQu
	ID/dRQZd1mLpYxpEhU2vTB6M25xYsWFncItAQytN91WK60AnC9NSRTps3BGD9Pp2l0KhvuQC+Fy83
	lnzrkP0Cu2O4NuWLZKLfWh0qU1nzOMrMHjs8a/6RghbZvrGKNNTjgtiKO1J9VfLXfRdDAYjwoi0V2
	AKmdd3sAyBwUIHyAWOUaIggAnOtM2c6+98Mzah6MWdd1M/XpXjnizFuEPs4Z6Bs1VmsT1ciruRV0+
	EoQGzuuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1p7O-0000000BFsF-2A7L;
	Thu, 25 Sep 2025 16:46:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1p7M-0000000BFrI-2Xc2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 16:46:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D672B6117B;
	Thu, 25 Sep 2025 16:46:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3EE0C4CEF0;
	Thu, 25 Sep 2025 16:46:48 +0000 (UTC)
Date: Thu, 25 Sep 2025 17:46:46 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>, Christian Brauner <brauner@kernel.org>,
	Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>,
	Shuah Khan <shuah@kernel.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Wilco Dijkstra <wilco.dijkstra@arm.com>,
	Carlos O'Donell <codonell@redhat.com>,
	Florian Weimer <fweimer@redhat.com>, Szabolcs Nagy <nsz@port70.net>,
	Rich Felker <dalias@libc.org>, libc-alpha@sourceware.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH RFC 1/3] arm64/gcs: Support reuse of GCS for exited
 threads
Message-ID: <aNVx9vlgi8t81V6Y@arm.com>
References: <20250921-arm64-gcs-exit-token-v1-0-45cf64e648d5@kernel.org>
 <20250921-arm64-gcs-exit-token-v1-1-45cf64e648d5@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250921-arm64-gcs-exit-token-v1-1-45cf64e648d5@kernel.org>
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

On Sun, Sep 21, 2025 at 02:21:35PM +0100, Mark Brown wrote:
> diff --git a/arch/arm64/mm/gcs.c b/arch/arm64/mm/gcs.c
> index fd1d5a6655de..4649c2b107a7 100644
> --- a/arch/arm64/mm/gcs.c
> +++ b/arch/arm64/mm/gcs.c
> @@ -199,14 +199,37 @@ void gcs_set_el0_mode(struct task_struct *task)
>  
>  void gcs_free(struct task_struct *task)
>  {
> +	unsigned long __user *cap_ptr;
> +	unsigned long cap_val;
> +	int ret;
> +
>  	if (!system_supports_gcs())
>  		return;
>  
>  	if (!task->mm || task->mm != current->mm)
>  		return;
> -	if (task->thread.gcs_base)
> +	if (task->thread.gcs_base) {
>  		vm_munmap(task->thread.gcs_base, task->thread.gcs_size);
> +	} else if (task == current &&
> +		   task->thread.gcs_el0_mode & PR_SHADOW_STACK_EXIT_TOKEN) {

I checked the code paths leading here and task is always current. But
better to keep the test in case the core code ever changes.

> +		cap_ptr = (unsigned long __user *)read_sysreg_s(SYS_GCSPR_EL0);
> +		cap_ptr--;
> +		cap_val = GCS_CAP(cap_ptr);
> +
> +		/*
> +		 * We can't do anything constructive if this fails,
> +		 * and the thread might be exiting due to being in a
> +		 * bad state anyway.
> +		 */
> +		put_user_gcs(cap_val, cap_ptr, &ret);
> +
> +		/*
> +		 * Ensure the new cap is ordered before standard
> +		 * memory accesses to the same location.
> +		 */
> +		gcsb_dsync();
> +	}

The only downside is that, if the thread did not unwind properly, we
don't write the token where it was initially. We could save the token
address from clone3() and restore it there instead.

-- 
Catalin

