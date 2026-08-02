Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46888C55171
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 18:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oS63NQlYDX3UkgpwTZTp0r+Evq8Hp+633HbhULQ7qtE=; b=KIjj1Yje+ITQxETfj2yFfbQNqS
	hTea81Y2Pj7FdPlhcJ/HMxjgqPFCiEtPtOp08v0u6UNZE4lZeRimQ1z+DN0H3WRto87nz8HD031Ql
	IwOCeG8nr3TsnMoM9XM10hR/WndybCcuRLkm9GmdQqcA3h5kGW8oXKeZEbxGej/F4UP6rYdhkcAnt
	GV9TBo2Xau4OJ/Zov0xefVTOTTg1/nCI+42XMqUfJJYfUbjfGGfSlvZCUHPYVVlINMWjdDck4AC/0
	FIZdzgeEAL9QmVASSSVajQFNUJtn1CYc4u0OTf41pYIuWz4ViZZtzL1zrvdErntw9RaDtNk5O5bjP
	06K2I+2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqb8o-0000000Fwv1-3Ila;
	Sun, 02 Aug 2026 18:42:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqb8n-0000000Fwuv-2PSW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 18:42:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 93E8543957;
	Sun,  2 Aug 2026 18:42:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 815C11F000E9;
	Sun,  2 Aug 2026 18:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785696148;
	bh=oS63NQlYDX3UkgpwTZTp0r+Evq8Hp+633HbhULQ7qtE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Bh9HDnZMWR+fJPzAEZ1xUVocFpcMoa88bHHyFvH42apzT4DpvgmqYvwUpKniTdJK8
	 4Ehh5GlHvhDkzE0mv5uJOSSPMEczSiSjyQwzYsFxTK0OC7x9BqabBnqwc/uZebizIy
	 DeeXaG5aThrX60f1qzCuf3oUfwPOgKohvYGyKOSncXnuCVRLOvHZHswaE09Nu4uGeG
	 tiPGACKXlU/d8gLlWIZMdl0sGSKDvQJta3sZX2NuUyVHdIaG3Z4DeTtx+yKS68tAC4
	 NjOmCwQYV1Fm8zXCbRJh2LBxUDJ9dKRbAAt3ICYCyJiFxQkMcqBPbe7ImpBNTe4e9j
	 yVGZW1nNceBlA==
Date: Sun, 2 Aug 2026 19:42:23 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Cc: Fan Wu <fanwu01@zju.edu.cn>, nuno.sa@analog.com, michal.simek@amd.com,
 bgolaszewski@baylibre.com, DileepKumar.Nagavarapu@amd.com,
 linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, Conall O'Griofa
 <conall.ogriofa@amd.com>
Subject: Re: [PATCH] iio: adc: xilinx-xadc: free IRQ before cancelling the
 unmask worker on unbind
Message-ID: <20260802194133.467ae096@jic23-huawei>
In-Reply-To: <750f615a-c00f-4e98-9bcf-8fa8704acfba@baylibre.com>
References: <20260802082851.433476-1-fanwu01@zju.edu.cn>
	<750f615a-c00f-4e98-9bcf-8fa8704acfba@baylibre.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Sun, 2 Aug 2026 10:39:58 -0500
David Lechner <dlechner@baylibre.com> wrote:

> On 8/2/26 3:28 AM, Fan Wu wrote:
> > The ZYNQ XADC interrupt handler xadc_zynq_interrupt_handler() arms the
> > zynq_unmask_work delayed work via schedule_delayed_work() every time an
> > alarm condition is observed, and that worker re-arms itself for as long
> > as the alarm stays asserted.
> > 
> > In xadc_probe() the IRQ is requested with devm_request_irq() before the
> > devm_add_action_or_reset() that registers xadc_cancel_delayed_work().
> > Because devres release runs in LIFO order, on unbind the delayed work is
> > cancelled before the IRQ is freed. The IRQ is still live at that point,
> > so a pending alarm can make the handler run once more and re-arm
> > zynq_unmask_work after it has been cancelled; that instance then runs
> > after the xadc structure that embeds zynq_unmask_work has been freed, a
> > use-after-free in xadc_zynq_unmask_worker().
> > 
> > Register the cancel-work devm action before requesting the IRQ so devres
> > LIFO teardown frees (and synchronizes) the IRQ first, then cancels the
> > delayed work. After free_irq() the handler can no longer re-arm the
> > work, and the subsequent cancel_delayed_work_sync() drains any instance
> > armed just before the IRQ was torn down.
> > 

This seems a bit too verbose to me.  A simpler explanation might get to the
key detail faster. Something like:

The driver clears outstanding work using a devm callback. That work is
queued up by schedule_delayed_work() in the alarm irq handler.
Reorder the work clear to occur after the devm cleanup for the irq
ensuring no additional work can be queued after the workqueue is
cleared. In practice this means registering the devm callback earlier
than the call to devm_irq_request_threaded().

If this was AI generated description (which I do as well sometimes)
it is useful to tell the AI to be brief.

> > This issue was found by an in-house static analysis tool.
> > 
> > Fixes: 2a9685d1a3b7 ("iio: adc: xilinx: use more devres helpers and remove remove()")
> > Cc: stable@vger.kernel.org
> > Assisted-by: Codex:gpt-5.6
> > Signed-off-by: Fan Wu <fanwu01@zju.edu.cn>
> > ---
> > 
> >  drivers/iio/adc/xilinx-xadc-core.c | 11 +++++++----
> >  1 file changed, 7 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/iio/adc/xilinx-xadc-core.c b/drivers/iio/adc/xilinx-xadc-core.c
> > --- a/drivers/iio/adc/xilinx-xadc-core.c
> > +++ b/drivers/iio/adc/xilinx-xadc-core.c
> > @@ -1395,13 +1395,16 @@ static int xadc_probe(struct platform_device *pdev)
> >  	}
> > 
> >  	if (irq > 0) {
> > -		ret = devm_request_irq(dev, irq, xadc->ops->interrupt_handler,
> > -				       0, dev_name(dev), indio_dev);
> > +		/* devm LIFO: register the cancel-work action before the IRQ,
> > +		 * so unbind frees the IRQ first, then drains the work.
> > +		 */

Wrong comment style.  Otherwise this seems correct to me but I'd like the
AMD / Xilinx folk to take a look.  Added a couple more +CC.

Not sure we need the comment, or perhaps the comment should just be
/* Clear out an work queued by the interrupt */

> > +		ret = devm_add_action_or_reset(dev, xadc_cancel_delayed_work,
> > +					       &xadc->zynq_unmask_work);
> >  		if (ret)
> >  			return ret;
> > 
> > -		ret = devm_add_action_or_reset(dev, xadc_cancel_delayed_work,
> > -					       &xadc->zynq_unmask_work);
> > +		ret = devm_request_irq(dev, irq, xadc->ops->interrupt_handler,
> > +				       0, dev_name(dev), indio_dev);
> >  		if (ret)
> >  			return ret;
> >  	}
> > --
> > 2.43.0
> >   
> 
> Makes sense.
> 
> Reviewed-by: David Lechner <dlechner@baylibre.com>
> 


