Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 781DFCD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 16:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=esMWrLBQ2kLwc0esD2rBwWliAAyfi0GLNns5XwAS/C0=; b=QxFsIDJTLr8BLNndrG77iceYT3
	X/J8ODyCL6uRaZsjf1HWDlm9SC4J7Fyy5Oz5z8nPowmC2xctRwbHKPzuCAcV6RDYj08XC38Z71DDY
	KYgAehPOU293+jbYu5+lN0lRPptPSfJxzhdvIqzlycDUelrZXc5UBELWpoW1LGb0Kwtqy5bn75Dkz
	S4QVt0/Vh7VFA3IDvOryEt21M1JqZGROOauwuUHONUwMOM1cRYBqHk+rIbJxrG90hIi9XCqHkXk08
	+WbLAWSOjaV3xO/SIogjOIU8TaSF2T7h693hfsce7kw+429gd8Cg8IBsrGCOlAznLoFEywKJ1nJ1v
	Fnm9ER9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXiBL-00000009krI-25Z7;
	Thu, 11 Jun 2026 16:23:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXiBJ-00000009kr6-3LO2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 16:23:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7C0F041E5F;
	Thu, 11 Jun 2026 16:23:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F2501F00893;
	Thu, 11 Jun 2026 16:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781194981;
	bh=esMWrLBQ2kLwc0esD2rBwWliAAyfi0GLNns5XwAS/C0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=gSY6S5VIqgcXK+cyZKCJ2S+mn5vwvnvQxEmkOhBEQavO24PmXZ3P6lBOcrb59vv1e
	 6vPH5EuDfhB3iPnIs1BLue2lac5EPyhXVBE1zLYgF5NAv4kiDmMIHQos2Wwhod9kOl
	 RM1M+Qi/si4V/5T/W07bg5845iJ+pBsY99Tk9SgLjfCNAd+27kpgqT9i/LehK0UcAU
	 aVnRn5KqplWo4GMP3ylC6QKodq6K5FLRdHd9MVuWF4JZe2Ll5rWdLR/K/tRFGxizum
	 cHp6KtgvxsU9PBJmESZKJKpV3ieJ9z9e0r7xpm3K24DehiZak4QLLAaw4pyRHWwdN+
	 SFZ39mvxpvgXA==
Date: Thu, 11 Jun 2026 17:22:52 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Jaeyoung Chung <jjy600901@snu.ac.kr>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Vladimir Zapolskiy
 <vz@mleia.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Sangyun Kim <sangyun.kim@snu.ac.kr>,
 Kyungwook Boo <bookyungwook@gmail.com>
Subject: Re: iio: adc: KASAN wild-memory-access in complete() on early IRQ
Message-ID: <20260611172252.02256652@jic23-huawei>
In-Reply-To: <20260610115700.774689-1-jjy600901@snu.ac.kr>
References: <20260610115700.774689-1-jjy600901@snu.ac.kr>
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

On Wed, 10 Jun 2026 20:57:00 +0900
Jaeyoung Chung <jjy600901@snu.ac.kr> wrote:

> Hi,
> 
> lpc32xx_adc_probe() in drivers/iio/adc/lpc32xx_adc.c and
> spear_adc_probe() in drivers/iio/adc/spear_adc.c register their
> interrupt handler with devm_request_irq() before they initialize
> st->completion with init_completion(). If an interrupt arrives after
> devm_request_irq() and before init_completion(), the handler calls
> complete() on an uninitialized completion, causing a kernel panic.
> 
> The probe path, in lpc32xx_adc_probe():
> 
>     iodev = devm_iio_device_alloc(&pdev->dev, sizeof(*st)); /* st kzalloc-zeroed */
>     ...
>     retval = devm_request_irq(&pdev->dev, irq, lpc32xx_adc_isr, 0,
>                               LPC32XXAD_NAME, st);           /* register handler */
>     ...
>     init_completion(&st->completion);                       /* initialize completion */
> 
> spear_adc_probe() has the same ordering: devm_request_irq() for
> spear_adc_isr() before init_completion(&st->completion).
> 
> Both interrupt handlers, lpc32xx_adc_isr() and spear_adc_isr(), call
> complete():
> 
>     complete(&st->completion);
> 
> If the device raises an interrupt before init_completion() runs,
> complete() acquires the uninitialized wait.lock and walks the zeroed
> task_list in swake_up_locked(). The zeroed task_list makes list_empty()
> return false, so swake_up_locked() dereferences a NULL list entry,
> triggering a KASAN wild-memory-access.
> 
> Suggested fix: move init_completion(&st->completion) above
> devm_request_irq(), so the completion is valid before the handler can run.
> 
> Reported-by: Sangyun Kim <sangyun.kim@snu.ac.kr>
> Reported-by: Kyungwook Boo <bookyungwook@gmail.com>

Hi I think the report is valid, but I'm curious to whether you ran these
drivers given the hardware is pretty obscure!  If not how did KASAN detect
anything (unless there is a static analysis version I'm not aware of)

Given age of drivers and that this only occurs if a spurious IRQ turns
up I'm not going to rush to fix this.  However, I'd certainly welcome
patches.

Thanks,

Jonathan


> 
> Thanks,
> Jaeyoung Chung


