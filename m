Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C162F30296
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 01:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4gzZ03nNHxjmX6ollK7UA6v+BnaqmEfoBoWPhjaHKTQ=; b=X7nRgw30xKX8T/Qgz0vQJ0P7Oj
	MQ6B80WX1EtNkq4WlY3BqYHGc1HB+nsu1ViT73Eq/7aR/WV1ojcXLgcY6VerawuN8xqmSeEi+AZOZ
	w5NYieF2QBzX+sXpHub7vXii3YQSxmCMM7PsQoLtIwGkadRMdSKs6HQrn44kY2Oz5o32aCsmU+U0L
	fKhWmju/UrFbGY2LB7EI33GVL1+EVL5OTeJNKWPX39zXwHY4//iqBtgCPiEW+nAYR96K2324KB0J6
	1XGvupF9VCHpKUoUP1IMU6crolm1SS8biFH/sSpq8egv1NjObfUfYJKvoamlKfAZ7ZB0GnubpwyNr
	tN7j0xOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1x5H-000000038x1-449l;
	Mon, 16 Mar 2026 01:49:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1x5E-000000038wT-1a8K
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 01:49:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 21B6741AF2;
	Mon, 16 Mar 2026 01:49:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DE51C4CEF7;
	Mon, 16 Mar 2026 01:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1773625767;
	bh=49DKbJ2akvpTxFFdAzXpo9gxcykYKuOsV8l6BaRz7Zo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LqhsYN6aRdj0khaTOrMtu85Myq6Tp+iQVgIqKVCv4HCPxw5E2j1i1owENsDugu9qS
	 z8yiMjaYrdWBkrfbJc4pUA2iCe7Onm/84lGvucfz2q96rRzOInYVqqpnHBgW4Htk2T
	 ESZjOCMSOBbtNy3xGokfL9Dy1WG/Q17KM9MZMKuE=
Date: Sun, 15 Mar 2026 18:49:25 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 bpf@vger.kernel.org, arnd@arndb.de, catalin.marinas@arm.com,
 will@kernel.org, peterz@infradead.org, mark.rutland@arm.com,
 harisokn@amazon.com, cl@gentwo.org, ast@kernel.org, rafael@kernel.org,
 daniel.lezcano@linaro.org, memxor@gmail.com, zhenglifeng1@huawei.com,
 xueshuai@linux.alibaba.com, rdunlap@infradead.org,
 david.laight.linux@gmail.com, joao.m.martins@oracle.com,
 boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
Subject: Re: [PATCH v10 00/12] barrier: Add
 smp_cond_load_{relaxed,acquire}_timeout()
Message-Id: <20260315184925.b6f93386e918ca79614843e3@linux-foundation.org>
In-Reply-To: <20260316013651.3225328-1-ankur.a.arora@oracle.com>
References: <20260316013651.3225328-1-ankur.a.arora@oracle.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_184928_797599_C27D93AC 
X-CRM114-Status: GOOD (  12.89  )
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

On Sun, 15 Mar 2026 18:36:39 -0700 Ankur Arora <ankur.a.arora@oracle.com> wrote:

> Hi,
> 
> This series adds waited variants of the smp_cond_load() primitives:
> smp_cond_load_relaxed_timeout(), and smp_cond_load_acquire_timeout().
>
> ...
>

How are we to determine that this change is successful, useful, etc? 
Reduced CPU consumption?  Reduced energy usage?  Improved latencies?

>
> Finally update poll_idle() and resilient queued spinlocks to use them.

Have you identified other suitable sites for conversion?

> 
>  Documentation/atomic_t.txt           | 14 +++--
>  arch/arm64/Kconfig                   |  3 +
>  arch/arm64/include/asm/barrier.h     | 23 +++++++
>  arch/arm64/include/asm/cmpxchg.h     | 62 +++++++++++++++----
>  arch/arm64/include/asm/delay-const.h | 27 +++++++++
>  arch/arm64/include/asm/rqspinlock.h  | 85 --------------------------
>  arch/arm64/lib/delay.c               | 15 ++---
>  drivers/cpuidle/poll_state.c         | 21 +------
>  drivers/soc/qcom/rpmh-rsc.c          |  8 +--
>  include/asm-generic/barrier.h        | 90 ++++++++++++++++++++++++++++
>  include/linux/atomic.h               | 10 ++++
>  include/linux/atomic/atomic-long.h   | 18 +++---
>  include/linux/sched/idle.h           | 29 +++++++++
>  kernel/bpf/rqspinlock.c              | 77 +++++++++++++++---------
>  scripts/atomic/gen-atomic-long.sh    | 16 +++--
>  15 files changed, 320 insertions(+), 178 deletions(-)
>  create mode 100644 arch/arm64/include/asm/delay-const.h

Some sort of testing in lib/tests/ would be appropriate and useful.

