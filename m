Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27FAEC5DF63
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 16:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bKX9RgsFiP1r7FApfoPALLGgJl9OMxZlavqohIlPsAc=; b=QX05oyUek5Hke26MIK8uN62jmH
	+XJd5lDdT34s4V2Q2FfFMlYfGMeRbQTxguLxdjxJNRBuxbq2ERYTM46WcNly7jB4fg/v3TPd73CYK
	eDyybGpRLbvWMHx7jCRqInm9hxK4oSpYdixPAcWZzptZHfO9K+Ug6RQr7iK4ibU0ZWZHC7TRIEQ8M
	d0rw79JrGfRXDNz85N3LZbdWt/A1172xNFlCh3KFRdkSt1s3Bl1myhoWvnQxmmY4VBRzff9A6/k3N
	5Wa4X7qatN24vIPJSTe5+FRDv7eT/QT9mJvX1pANWrUvw99cAsk0eJMySzhu1j2r+A918zvpQI3bk
	vpjVKyQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtpOP-0000000EVah-3y92;
	Tue, 11 Aug 2026 16:31:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtpOO-0000000EVaX-2W0y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 16:31:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 46EC04401B;
	Tue, 11 Aug 2026 16:31:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFEDF1F00A3D;
	Tue, 11 Aug 2026 16:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786465916;
	bh=bKX9RgsFiP1r7FApfoPALLGgJl9OMxZlavqohIlPsAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h+flfhO4kYLTodQvAdAvjsxFMapmlLBH+q2EncdGl/XDF0OhaaZbOVFaesOAys1ge
	 aX2qFssi6oUgUpQavsTbKNaHdudDjbn1dF9K3RB9i9QzIsigOXj0uepgPbhwkCMYRU
	 eYj5sePqrFfE3B3bacvOWt07qHsPBtVfKrUeibEokZ/UBuqwE24Hdi1YG5xwcYF8eO
	 8Kw8fH/Yr16/pH1Szn1LjbiC1FfbCt+txlVL6Fh7p1CUKcuiztJkt699jSaIvWnrD+
	 VibcGSD5ahjgiu3CvKmXWJ5OmwAuGC2OrqpDT7xVrzwIjJzNJLoyiR9uDFvZrIRmac
	 sXkEiZ2JZ+n5A==
Date: Tue, 11 Aug 2026 18:31:52 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Sascha Bischoff <Sascha.Bischoff@arm.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	nd <nd@arm.com>, "maz@kernel.org" <maz@kernel.org>
Subject: Re: [PATCH v2 2/2] irqchip/gic-v5: Synchronize CPU interface disable
Message-ID: <antOeLXBm2yqVjZx@red-moon>
References: <20260811152630.942023-1-sascha.bischoff@arm.com>
 <20260811152630.942023-3-sascha.bischoff@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811152630.942023-3-sascha.bischoff@arm.com>
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

On Tue, Aug 11, 2026 at 03:27:31PM +0000, Sascha Bischoff wrote:
> The write disabling the GICv5 CPU interface is only guaranteed to take
> effect after a context synchronization event. Without one, execution can
> return from gicv5_cpu_disable_interrupts() while an interrupt is still
> able to be taken.
> 
> Add an ISB after the ICC_CR0_EL1 write to ensure interrupts are
> disabled before the function returns. No corresponding ISB is added
> when enabling the interface, as interrupt delivery is asynchronous and
> there is no obvious benefit to waiting for it.
> 
> Fixes: 7ec80fb3f025 ("irqchip/gic-v5: Add GICv5 PPI support")
> Link: https://sashiko.dev/#/patchset/20260724104819.1296803-1-sascha.bischoff@arm.com?part=6
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> ---
>  drivers/irqchip/irq-gic-v5.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Lorenzo Pieralisi <lpieralisi@kernel.org>

> diff --git a/drivers/irqchip/irq-gic-v5.c b/drivers/irqchip/irq-gic-v5.c
> index e9d1795235a66..6a99c541b559b 100644
> --- a/drivers/irqchip/irq-gic-v5.c
> +++ b/drivers/irqchip/irq-gic-v5.c
> @@ -983,6 +983,7 @@ static void gicv5_cpu_disable_interrupts(void)
>  
>  	cr0 = FIELD_PREP(ICC_CR0_EL1_EN, 0);
>  	write_sysreg_s(cr0, SYS_ICC_CR0_EL1);
> +	isb();
>  }
>  
>  static void gicv5_cpu_enable_interrupts(void)
> -- 
> 2.34.1

