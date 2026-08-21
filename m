Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB571C5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 23:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5V+eDhsR1l7gTGXw7zOCDC0m5/sh2YoqmdcVnpCZQgM=; b=dd6barYGLyuokEvuJHoG9wk+x2
	DYbEyyb0LQO3ku9j00RVOrm+IXxITl7VPlkuyUc+PseUjtlU+d6kSC1XHnzLYf9EcxpZiMFzGr/YN
	CWzIzRtUjrZlxrhzYqwJoq7cGxMXhUmWh6XBZagz+6SMm8x5cxYUsBXHy4FBNESu3vPND0M3K4zYT
	EUrueD4fYteWWXzdhmCdl+85kO/0+5uRoetDtUfUHuP3OqaXAg1JjMElYIsfkILpHVdhg39/pqkks
	A3j3RgdLpNZO+/BZsCg8pa3m5Qh1+k6/e2YRGzCOYXkDDshiDPGFg+hwETK1dCgpc2TVIbMjaG3fX
	qh9GwxhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxYnI-0000000EAMA-2S9T;
	Fri, 21 Aug 2026 23:37:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxYnH-0000000EALs-0Rn9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 23:37:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0E92640615;
	Fri, 21 Aug 2026 23:37:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B17B1F00A3A;
	Fri, 21 Aug 2026 23:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787355421;
	bh=5V+eDhsR1l7gTGXw7zOCDC0m5/sh2YoqmdcVnpCZQgM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=h38Q+32ShgEFW6b9POQWwnB6vfv8kstTsH7+rsl0ZxCgsAAImPzvnHvCLlHL0QCfN
	 veKWjwInFjanmdb1/cOWNmjJNm3zYV1JKisFNLL2v1ta4R07B1/6xZmn3Q+XRgOTNw
	 SI8QANa+07C3R/L9wBffnkbBlFPV3winnEYG/9Y7A/Sw1AcDEnrUy5z4N7mnkj1fMv
	 dwCcjzjtKEo+auWxvDFS75TMvFvxd4x0KDdVKRzXNCPdftx1gEVT3e0SHVYqw3xccX
	 TzneA9HV0l8hNzmXNo6JDkequ4C9ASDpX3ZtNrQbf9q1PE8PMQvTjVM9A1mF/AGGpT
	 6L6gAlQ/EF7WQ==
Date: Sat, 22 Aug 2026 00:36:56 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Cc: Fan Wu <fanwu01@zju.edu.cn>, dlechner@baylibre.com, nuno.sa@analog.com,
 michal.simek@amd.com, conall.ogriofa@amd.com, bgolaszewski@baylibre.com,
 DileepKumar.Nagavarapu@amd.com, linux-iio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v2] iio: adc: xilinx-xadc: free IRQ before cancelling
 the unmask worker on unbind
Message-ID: <20260822003656.4cd11afe@jic23-huawei>
In-Reply-To: <c87bd58e-2c23-467e-8ae2-8398052ee8d5@amd.com>
References: <20260803080343.467906-1-fanwu01@zju.edu.cn>
	<c87bd58e-2c23-467e-8ae2-8398052ee8d5@amd.com>
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

On Mon, 10 Aug 2026 23:27:37 +0530
Sai Krishna Potthuri <sai.krishna.potthuri@amd.com> wrote:

> On 8/3/2026 1:33 PM, Fan Wu wrote:
> > The ZYNQ XADC alarm IRQ handler queues zynq_unmask_work via
> > schedule_delayed_work(); that work is cleared by a devm callback.
> > Register the devm callback before devm_request_irq() so the devres LIFO
> > teardown frees the IRQ first, ensuring the handler can no longer queue
> > work by the time the workqueue is cleared. Otherwise the handler could
> > re-arm the work and run it after the xadc structure has been freed.
> > 
> > This issue was found by an in-house static analysis tool.
> > 
> > Fixes: 2a9685d1a3b7 ("iio: adc: xilinx: use more devres helpers and remove remove()")
> > Cc: stable@vger.kernel.org
> > Assisted-by: Codex:gpt-5.6
> > Reviewed-by: David Lechner <dlechner@baylibre.com>
> > Signed-off-by: Fan Wu <fanwu01@zju.edu.cn>  
> 
> Reviewed-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
> 

Applied to the fixes-togreg branch of iio.git.

I'll be rebasing that on rc1 once available.

Thanks,

Jonathan

> Regards
> Sai Krishna
> 
> 
> > ---
> > 
> > Changes in v2: shorten the commit message and replace the multi-line code
> > comment with a one-line note, per review feedback from Jonathan Cameron.
> > The devm registration reorder (the fix) is unchanged; David Lechner's
> > Reviewed-by was obtained on v1.
> > 
> >   drivers/iio/adc/xilinx-xadc-core.c | 9 +++++----
> >   1 file changed, 5 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/iio/adc/xilinx-xadc-core.c b/drivers/iio/adc/xilinx-xadc-core.c
> > --- a/drivers/iio/adc/xilinx-xadc-core.c
> > +++ b/drivers/iio/adc/xilinx-xadc-core.c
> > @@ -1395,13 +1395,14 @@ static int xadc_probe(struct platform_device *pdev)
> >   	}
> > 
> >   	if (irq > 0) {
> > -		ret = devm_request_irq(dev, irq, xadc->ops->interrupt_handler,
> > -				       0, dev_name(dev), indio_dev);
> > +		/* Clear out any work queued by the interrupt */
> > +		ret = devm_add_action_or_reset(dev, xadc_cancel_delayed_work,
> > +					       &xadc->zynq_unmask_work);
> >   		if (ret)
> >   			return ret;
> > 
> > -		ret = devm_add_action_or_reset(dev, xadc_cancel_delayed_work,
> > -					       &xadc->zynq_unmask_work);
> > +		ret = devm_request_irq(dev, irq, xadc->ops->interrupt_handler,
> > +				       0, dev_name(dev), indio_dev);
> >   		if (ret)
> >   			return ret;
> >   	}
> > --
> > 2.43.0  
> 


