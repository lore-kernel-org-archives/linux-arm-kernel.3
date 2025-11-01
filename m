Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A99CCFA02
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Nov 2025 20:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w9esUrg9Ter9Q/ySJkb9E3El3zRpChNBYljx3GplElA=; b=RT+C47DQvW4jz8u0cLshTIbuNC
	H1he5Uza+bKjOAjDkIvltyYSjc8Lnbr6AvRBNZIueJ4QB9gD7g7EToJoVwYe5UJBX/7fpRJDnz0ET
	TZU3+OoPVYW0NSTwXLYJ3JzTvTY4hbIuatVc3b8dmCdiAre6eKny5y0ZYD4SKeJMk4Fv4JiGNKfDQ
	PHzkl2OwK3lDCYuCyss3ZzYQQlro4rICkD4dgCxHjvWyyXLny9zZnedc7VeZKo9fqFwm5FkvqV+qu
	PLDj8WmN7wrluGjzpVpGUExFDxoT7xgrllXoCBa5n9nBbxdqmuKi6NPw46WJOWexrWb7qtYi3c+Ol
	WwyQwZCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFHli-000000083s0-2LGt;
	Sat, 01 Nov 2025 20:00:10 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFHlf-000000083qA-2PEF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Nov 2025 20:00:09 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1762027189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=w9esUrg9Ter9Q/ySJkb9E3El3zRpChNBYljx3GplElA=;
	b=IsIe3nGjD4+mFIPS/cGK5p82zifs7tYWuZwqkL+xHoOK4UukXvx2+bt/aztkvd5zAgMhzj
	9YZZbgjGFUL/zmGeo5e+EDQlmSOY1h2Cp1SgtnoU5ZB8z9m8Nrcrwg/N6VkV8GD9OZFsF1
	PivkGmLsqBa2jbxMfdINE5YQTgCN8+9WD90IfHPVA7So8O/rccyEnCvzfuCvJAb32JeiUb
	e+tmQXmm2KgclYiKYVKTVd9ajmcVBFn4alhX5g1OqspAJNKHO5P18JcR3CVJ/Nij3+7mM8
	0V0yJ22Aw8iIhOsoGktIefD6cXr1df4NczCpwJmESG4e4mTDvQSknA+zd563wg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1762027189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=w9esUrg9Ter9Q/ySJkb9E3El3zRpChNBYljx3GplElA=;
	b=Xli0ltPigchfb4g6wBaN2i7pjcT0uon5IYxstMvKeKhqRyMbnOQJS7ymbFGPod+iA1DSrm
	JVl+U93Ifd31KHCQ==
To: Ulf Hansson <ulf.hansson@linaro.org>, "Rafael J . Wysocki"
 <rafael@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
 Maulik Shah <quic_mkshah@quicinc.com>, Sudeep Holla
 <sudeep.holla@arm.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>, Ben Horgan
 <ben.horgan@arm.com>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Ulf
 Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH v3 1/2] smp: Introduce a helper function to check for
 pending IPIs
In-Reply-To: <20251031110106.62394-2-ulf.hansson@linaro.org>
References: <20251031110106.62394-1-ulf.hansson@linaro.org>
 <20251031110106.62394-2-ulf.hansson@linaro.org>
Date: Sat, 01 Nov 2025 20:59:48 +0100
Message-ID: <875xbty157.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251101_130007_775102_93FD5B0C 
X-CRM114-Status: GOOD (  13.07  )
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

On Fri, Oct 31 2025 at 12:00, Ulf Hansson wrote:
> +/**
> + * cpus_peek_for_pending_ipi - Check for pending IPI for CPUs
> + * @mask: The CPU mask for the CPUs to check.
> + *
> + * This function walks through the @mask to check if there are any pending IPIs
> + * scheduled, for any of the CPUs in the @mask.
> + *
> + * It's important for the caller to know that this function does not guarantee
> + * correctness. It provides a snapshot, while being as lightweight as possible.

This read clumsy. Just say:

  * It does not guarantee correctness as it only can provide a racy snapshot.

or something like that.

> + * Returns true if there is a pending IPI scheduled and false otherwise.
> + */
> +bool cpus_peek_for_pending_ipi(const struct cpumask *mask)
> +{
> +	unsigned int cpu;
> +
> +	for_each_cpu(cpu, mask) {
> +		if (!llist_empty(per_cpu_ptr(&call_single_queue, cpu)))
> +			return true;
> +	}
> +
> +        return false;
   ^^^^^^^^
White space damage. Spaces instead of TAB.

Thanks,

        tglx

