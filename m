Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 712CAC54F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 12:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s5MfiV0pCwt6oZcEN6c56AZWWbQZZepnoz0+uvh0FfY=; b=2feq1/tHVKLq+D/1FJokMWI5S/
	KyVmdMGIMVdR77DAclG/saNYa3lEQVAruaik6nYxPoX2Of6XvLVm9Jo+JFR3nX6OGcOhXckNGLz6d
	cVKgEovJzmSnAHB7o/jL0m1vFoT2lidaYtZ29g3s1mZNP9LXVGmNkgeRxyaAiXlUBv+y8IwSTEKj4
	xv4lSswAUMdh4vUHkv15rUspA5eU6xbWPd1XDgNQ3KKuyPh+SmvZqrhyXs2+wjFkWd8l8Mh9hMn3B
	zt5uj4LTjlCYSu/ue2cRavJPcvo4ectD965lB2VAuBphXuWMptBEeA8B6YqaIC01zNrJ44465MYMU
	DE5VSyXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpmiE-0000000CWWo-2Qg2;
	Fri, 31 Jul 2026 12:51:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpmiC-0000000CWWF-0nTy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 12:51:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 22EB8204C;
	Fri, 31 Jul 2026 05:51:33 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CF75F3F86F;
	Fri, 31 Jul 2026 05:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785502297; bh=pzoMoHN8Xbk+tBHJK4RtpsuB9qr2xAHSbWUTa2L+TEs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YboKNLhB9rvsoGAVCqlSNlUZKCuGpyDBGkA+QSqQzQr5L5JPB/PMQBTYx4FNFZBay
	 ikgCYLubmzgs/kqx8lHlVpFKzTKLrhUJMWmnJCMGjun3SyjQaBQQxhtTmqhhg+ZqK6
	 +deT62mhcmPbSnbZ5TuWP2DFDmqVykEM+Rc3dtpQ=
Date: Fri, 31 Jul 2026 13:51:26 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH RFC] arm64: Mark set_preempt_need_resched() access to
 .need_resched
Message-ID: <amyaRXx8zXxOMgTL@J2N7QTR9R3>
References: <d345dc9f-c61e-4db5-a342-11b0ff3fb846@paulmck-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d345dc9f-c61e-4db5-a342-11b0ff3fb846@paulmck-laptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_055140_276800_BD6D4C8E 
X-CRM114-Status: GOOD (  20.44  )
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
Cc: "Peter Zijlstra \(Intel\)" <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Paul,

On Thu, Jul 30, 2026 at 04:59:57PM -0700, Paul E. McKenney wrote:
> The .need_resched field can be accessed from both task level and
> from interrrupt handlers, so apply WRITE_ONCE() to the update in
> set_preempt_need_resched().  This also brings arm64 in line with s390
> (which uses atomic operations) and x86 (which uses inline assembly).
> Other architectures avoid this issue via the empty definition in
> include/asm-generic/preempt.h.
> 
> KCSAN located this issue.

Do you have the KCSAN splat to hand? Seeing the exact race (and the
relevant reader(s)) would be handy.

> Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Jinjie Ruan <ruanjinjie@huawei.com>
> Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Cc: <linux-arm-kernel@lists.infradead.org>
> 
> ---
>  preempt.h |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/preempt.h b/arch/arm64/include/asm/preempt.h
> index 932ea4b6204289..610853da140a78 100644
> --- a/arch/arm64/include/asm/preempt.h
> +++ b/arch/arm64/include/asm/preempt.h
> @@ -28,7 +28,7 @@ static inline void preempt_count_set(u64 pc)
>  
>  static inline void set_preempt_need_resched(void)
>  {
> -	current_thread_info()->preempt.need_resched = 0;
> +	WRITE_ONCE(current_thread_info()->preempt.need_resched, 0);
>  }

I was under the impression that we only used this in a context where we
couldn't have a nested writer (e.g. within a scheduler IRQ hook, with
IRQs disabled).

If we have concurrent writers, this is probably broken regardless of
whether it is single-copy-atomic, and I worry WRITE_ONCE() will mask a
bug.

If you can share the KCSAN splat, that'd really help.

I think we need READ_ONCE() in test_preempt_need_resched(), but today
that's only used by tracing to determine what to log.

Mark.

