Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0673C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 15:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G9Y9GarTUkEgcMjdtDmGLhhz0dE7KatvaVwuGg30Ce8=; b=lTAb5Ben5JwVZCU6dlZGZ9xDRl
	MYQd21Tj48qxFl0QpYbYBIAlCA2L9poorEt3w3Dz/nuwYH13+sl+6/CuIHEEtw8P5kC4DeM2euccf
	XL45NY9mjb8r9hdxJ/j1J7cKCBgq2ON/dJ4GB9Hg/lTy5uMhwuVmLRmkFjhgutdtN2boXkloIl0Nu
	2R10EpXR/RVURBtbDInUY+jj7UgX5B1mqF8C/HCPT1pDysDmWU8F3P9HilyGoLMrX9xBFwwG9+vAQ
	Rm7mtaQTSBao4NCeXBvthp9tLcUavBZ8bE6fCvcQjY2zIEh1d23QLhLpL6QYiqU4/CZok14CDz1Fj
	FgheSfdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaFwf-0000000FBdu-0nt5;
	Fri, 11 Jul 2025 15:45:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaFB7-0000000F5Iu-3nfZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 14:56:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 04A6360007;
	Fri, 11 Jul 2025 14:56:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B01CC4CEF0;
	Fri, 11 Jul 2025 14:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752245804;
	bh=zNp9EER2UQJ65Qwe/j75010fnZ8pc0YCPc+AdF0Qpl8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SS65MYjhvk+m+L4KXVaOaTAoGT4WO6qUzscxC0a723+W5hmjYg7yU+TGIkuRrl5SY
	 5Qhl3Sy/vD4C46h4nnndx1HCMyigEIkH6/yDVODbRjDOSEAUjWjjIN5wS1SCw580DK
	 kDF5VkX67AogDxd5HkZnYFK74byT7afmfh7FZVGKdAM5BHGzxhum3QaboioSKdxsPr
	 c9BN6C4AFys9xulwK1tdsEP8tfbKd3PqRqfm3pH7v3atY3gXLO6JdLq4QG5HCDBZn3
	 gluHXzbBa88TgRsOBtr2gn28lO1F3kVW9hRMnK/4UdMkejCwSbEdqt+/P/V6C4lC25
	 oMKxXFfleqRQg==
Date: Fri, 11 Jul 2025 15:56:38 +0100
From: Will Deacon <will@kernel.org>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, maddy@linux.ibm.com, tglx@linutronix.de,
	bigeasy@linutronix.de, vschneid@redhat.com,
	dietmar.eggemann@arm.com, rostedt@goodmis.org,
	linux-kernel@vger.kernel.org, catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com
Subject: Re: [PATCH 1/1] sched: preempt: Move dynamic keys into kernel/sched
Message-ID: <aHEmJvhUVG_x1FZx@willie-the-truck>
References: <20250610075344.1379597-1-sshegde@linux.ibm.com>
 <20250610075344.1379597-2-sshegde@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610075344.1379597-2-sshegde@linux.ibm.com>
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

On Tue, Jun 10, 2025 at 01:23:44PM +0530, Shrikanth Hegde wrote:
> Dynamic preemption can be static key or static call based.
> Static key is used to check kernel preemption depending on
> the current preemption model. i.e enable for lazy, full. 
> 
> Code is spread currently across entry/common.c, arm64 and latest being
> powerpc. There is little arch specific to it. For example, arm64,
> powerpc does the same thing. It is better to move it into kernel/sched 
> since preemption is more closely associated with scheduler.  
> 
> Plus, Any new arch that wants dynamic preemption enabled need to have 
> only HAVE_PREEMPT_DYNAMIC_KEY. 
> 
> This is more of code movement. No functional change. 
> 
> Suggested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---
>  arch/arm64/include/asm/preempt.h   |  1 -
>  arch/arm64/kernel/entry-common.c   |  8 --------
>  arch/powerpc/include/asm/preempt.h | 16 ----------------
>  arch/powerpc/kernel/interrupt.c    |  4 ----
>  include/linux/entry-common.h       |  1 -
>  include/linux/sched.h              |  8 ++++++++
>  kernel/entry/common.c              |  1 -
>  kernel/sched/core.c                |  4 ++++
>  8 files changed, 12 insertions(+), 31 deletions(-)
>  delete mode 100644 arch/powerpc/include/asm/preempt.h

Acked-by: Will Deacon <will@kernel.org>

Will

