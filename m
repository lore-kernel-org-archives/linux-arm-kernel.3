Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8850105D991
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 01:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Aa2nhyZ8CSqiTfYfbgZGn9kiHY9GicU1FEFQZfHb7GE=; b=z6VZDF+bNUuprf
	bk/xJ4iZ2V82fWdOGylUOSgyOypzNJr0ukkxa/CknU5GJBKzV/aNTbz01Ca8jxtAkKa1caCznGpyH
	wp8RqZtOFKocujRXNkhOiXCnMxUW8q4qarr4shjo7CL3HZrFAzGhFjLNZa70PCCl+uNZwA49jXGa5
	fkqWr73/zadkMAVNbe8PjDDfK0ees95rRdPdgRbZhZuy66vbhLj0cWy6vq2pVR7vgEIjZuTgRRQuJ
	USTkmhl6HLKqw6qNeVxtcBot8jtdJuH5PpSHYCIVtIVoE9/DnOZtexXvr+sPHSnms7Uq1y8SDkUkK
	1z4X3HSajiD/7IY6kkcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAHbr-0000000856E-1HD2;
	Wed, 08 Apr 2026 01:21:35 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAHbo-0000000855N-2bSS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 01:21:34 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Aa2nhyZ8CSqiTfYfbgZGn9kiHY9GicU1FEFQZfHb7GE=;
	b=Dbd0kK4e2k7QZq5GgJMsTKkTg75OGIv4kx7kS2S43GXGb2jw/FfScbvR74HDTbcNNaDDJ7nzU
	/D767baE7GsytrdOi0EvXbTSrl7Hb+U88hxbauoOwq+s49c2qRhrl+MMdK2+KnsGT+42XA7JOMu
	q0dqIWFNs5S9cRV5zv8tFGE=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4fr4qg0pnPzmVCl;
	Wed,  8 Apr 2026 09:15:11 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 719D540561;
	Wed,  8 Apr 2026 09:21:26 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 8 Apr 2026 09:21:25 +0800
Message-ID: <83b1f89e-e6da-ec48-c984-fd8939df0f36@huawei.com>
Date: Wed, 8 Apr 2026 09:21:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 03/10] entry: Move irqentry_enter() prototype later
Content-Language: en-US
To: Mark Rutland <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>
References: <20260407131650.3813777-1-mark.rutland@arm.com>
 <20260407131650.3813777-4-mark.rutland@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260407131650.3813777-4-mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_182133_000903_A8364D08 
X-CRM114-Status: GOOD (  15.16  )
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
Cc: vladimir.murzin@arm.com, will@kernel.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 2026/4/7 21:16, Mark Rutland wrote:
> Subsequent patches will rework the irqentry_*() functions. The end
> result (and the intermediate diffs) will be much clearer if the
> prototype for the irqentry_enter() function is moved later, immediately
> before the prototype of the irqentry_exit() function.
> 
> Move the prototype later.
> 
> This is purely a move; there should be no functional change as a result
> of this patch.
> 
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Cc: Andy Lutomirski <luto@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Jinjie Ruan <ruanjinjie@huawei.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Thomas Gleixner <tglx@kernel.org>
> Cc: Vladimir Murzin <vladimir.murzin@arm.com>
> Cc: Will Deacon <will@kernel.org>
> ---
>  include/linux/irq-entry-common.h | 44 ++++++++++++++++----------------
>  1 file changed, 22 insertions(+), 22 deletions(-)
> 
> diff --git a/include/linux/irq-entry-common.h b/include/linux/irq-entry-common.h
> index 93b4b551f7ae4..d1e8591a59195 100644
> --- a/include/linux/irq-entry-common.h
> +++ b/include/linux/irq-entry-common.h
> @@ -334,6 +334,28 @@ typedef struct irqentry_state {
>  } irqentry_state_t;
>  #endif
>  
> +/**
> + * irqentry_exit_cond_resched - Conditionally reschedule on return from interrupt
> + *
> + * Conditional reschedule with additional sanity checks.
> + */
> +void raw_irqentry_exit_cond_resched(void);
> +
> +#ifdef CONFIG_PREEMPT_DYNAMIC
> +#if defined(CONFIG_HAVE_PREEMPT_DYNAMIC_CALL)
> +#define irqentry_exit_cond_resched_dynamic_enabled	raw_irqentry_exit_cond_resched
> +#define irqentry_exit_cond_resched_dynamic_disabled	NULL
> +DECLARE_STATIC_CALL(irqentry_exit_cond_resched, raw_irqentry_exit_cond_resched);
> +#define irqentry_exit_cond_resched()	static_call(irqentry_exit_cond_resched)()
> +#elif defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
> +DECLARE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
> +void dynamic_irqentry_exit_cond_resched(void);
> +#define irqentry_exit_cond_resched()	dynamic_irqentry_exit_cond_resched()
> +#endif
> +#else /* CONFIG_PREEMPT_DYNAMIC */
> +#define irqentry_exit_cond_resched()	raw_irqentry_exit_cond_resched()
> +#endif /* CONFIG_PREEMPT_DYNAMIC */
> +

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  /**
>   * irqentry_enter - Handle state tracking on ordinary interrupt entries
>   * @regs:	Pointer to pt_regs of interrupted context
> @@ -367,28 +389,6 @@ typedef struct irqentry_state {
>   */
>  irqentry_state_t noinstr irqentry_enter(struct pt_regs *regs);
>  
> -/**
> - * irqentry_exit_cond_resched - Conditionally reschedule on return from interrupt
> - *
> - * Conditional reschedule with additional sanity checks.
> - */
> -void raw_irqentry_exit_cond_resched(void);
> -
> -#ifdef CONFIG_PREEMPT_DYNAMIC
> -#if defined(CONFIG_HAVE_PREEMPT_DYNAMIC_CALL)
> -#define irqentry_exit_cond_resched_dynamic_enabled	raw_irqentry_exit_cond_resched
> -#define irqentry_exit_cond_resched_dynamic_disabled	NULL
> -DECLARE_STATIC_CALL(irqentry_exit_cond_resched, raw_irqentry_exit_cond_resched);
> -#define irqentry_exit_cond_resched()	static_call(irqentry_exit_cond_resched)()
> -#elif defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
> -DECLARE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
> -void dynamic_irqentry_exit_cond_resched(void);
> -#define irqentry_exit_cond_resched()	dynamic_irqentry_exit_cond_resched()
> -#endif
> -#else /* CONFIG_PREEMPT_DYNAMIC */
> -#define irqentry_exit_cond_resched()	raw_irqentry_exit_cond_resched()
> -#endif /* CONFIG_PREEMPT_DYNAMIC */
> -
>  /**
>   * irqentry_exit - Handle return from exception that used irqentry_enter()
>   * @regs:	Pointer to pt_regs (exception entry regs)

