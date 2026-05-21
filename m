Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13838CD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 09:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0chucKSxIxMImRF4ab1C0iTNacki3NqqCTkFos9OEuE=; b=XAFPriro4+UE1DaCbrpzP61+DA
	k93/xht2jouQifYZS400tnXgcWXQZzVFXVbtbkXY8NUt/SHH2Fv48hiqWkHAOR29HnxpIfZ71p5ot
	0Po+HL8CuMfEEHQjvjJrwkuGdTwlFHJcRe44zLFMJJjjjFcl/1CSZv87GTdA8o/24F+5mDlU4JoXS
	osC4OdZTztLeIvYE6kpp6Y3c5PQn5+qfNccdKW1+1swXBABb7wsG/0gVj/cLTva0+VWDovyeY/+GR
	sSjkPW9K/WoGeyuqte2K/lFKcNAfRMgQbJxe6Z69DtG1XsfhWGUknVxw66onF1cWe//8gWhLoB1tU
	6Nww5Ebg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPzMl-00000007FSO-02IN;
	Thu, 21 May 2026 09:06:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPzMj-00000007FRq-2EeK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 09:06:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id CDB5C601FA;
	Thu, 21 May 2026 09:06:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id BA0631F000E9;
	Thu, 21 May 2026 09:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779354412;
	bh=0chucKSxIxMImRF4ab1C0iTNacki3NqqCTkFos9OEuE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=P3mrLih5x0pu8nQDHtlwWUhxQawDZVLViB9rQFD0Ef2rlSxi+N8t6wELWONvcNgWn
	 Fp/cOL88m0R7Ejk328LMFt8oB71XJSjtLu6ksx27u9nIG8sTEvEinDuWt3tqsf+E7R
	 ccp7BZwXGvJk03Yf2yjKVk9U2k3BVldh1+O4Nu1e7RCaMYAoyk42kS125TyuMMI2cS
	 zdHlxe1Pk8FqoG0o2CKVuiCpvhRvL+S7pQJJ4oF5e9AeTL4KyinC21bZ/myf9ggfNd
	 eknFms+7oeD+w8fXrO+dfawz+hox6aUSuXQmCdai703ae5NTMb/awDlmTqdnKkFgzA
	 SE+hiwhsJZVcg==
From: Thomas Gleixner <tglx@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-rt-devel@lists.linux.dev
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Sebastian
 Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams
 <clrkwllms@kernel.org>, Steven
	Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH] irqchip/exynos-combiner: switch to raw_spinlock
In-Reply-To: <20260520220422.3522908-1-m.szyprowski@samsung.com>
References: <CGME20260520220432eucas1p10502ca0f9368bd6de5ce027ad8170109@eucas1p1.samsung.com>
 <20260520220422.3522908-1-m.szyprowski@samsung.com>
Date: Thu, 21 May 2026 11:06:48 +0200
Message-ID: <87ecj5w2qf.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, May 21 2026 at 00:04, Marek Szyprowski wrote:

> The exynos-combiner driver uses a regular spinlock to protect access to
> the combiner interrupt status register in combiner_handle_cascade_irq(),
> which is invoked in hard IRQ context as a chained interrupt handler.
>
> When PREEMPT_RT is enabled on ARM, regular spinlock is converted to a
> sleeping lock (mutex-based), which must not be used in atomic context
> such as hard interrupt handlers. Switch the irq_controller_lock to
> raw_spinlock, which remains a true non-sleeping spinlock even under
> PREEMPT_RT.

Mechanically this makes sense, but out of curiosity I have to ask:

> -static DEFINE_SPINLOCK(irq_controller_lock);
> +static DEFINE_RAW_SPINLOCK(irq_controller_lock);
>  
>  struct combiner_chip_data {
>  	unsigned int hwirq_offset;
> @@ -72,9 +72,9 @@ static void combiner_handle_cascade_irq(struct irq_desc *desc)
>  
>  	chained_irq_enter(chip, desc);
>  
> -	spin_lock(&irq_controller_lock);
> +	raw_spin_lock(&irq_controller_lock);
>  	status = readl_relaxed(chip_data->base + COMBINER_INT_STATUS);
> -	spin_unlock(&irq_controller_lock);
> +	raw_spin_unlock(&irq_controller_lock);

What is this lock actually protecting?

Each combiner has it's own @base address, so there is no concurrency
problem between two cascade interrupts being handled at the same time.

That means the only possible problem would be that the same cascade
interrupt is handled on two CPUs concurrently. Is that even possible?

Thanks,

        tglx

