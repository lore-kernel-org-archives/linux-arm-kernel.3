Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F38CD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Jun 2026 13:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w1zSXlK3cbmAX8g+lPSOm/wYRudOkCobp760867N46o=; b=BdUfnKkl7ChsYoT2+H1whL4xiY
	EVKth67XVd9aUmMNGLegmAt6dNHSHjSyLXz8g0xWdPC+gpWZSY+B7AMe9dPgYeI7Tu7czZSKGU2f2
	+XqvI8Se9mDR7E486ProK3UKRjzSD3lwfHvkYdHLIuMKSUdmoSPBQPydgT7xrsQbaM4vk7y3ii0UU
	YxyfglmwYoKagSVzxbkzL93ofCIAWk5KkODkFGnETp9Tb2mVk11s9cpgf0YyS32SNO58q6hU9J/Ll
	rFVwhE92oEMW+hr3fhlZaJRzOggA+7PsnQkcI6ZASEtlsYw9Kq2fV64e1VDEuIUG4mWh3sKZ2pNDr
	rvveNuzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYlFF-0000000D3WG-0vdS;
	Sun, 14 Jun 2026 13:51:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYlFD-0000000D3W8-16Gj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Jun 2026 13:51:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D9D596008A;
	Sun, 14 Jun 2026 13:51:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C056F1F000E9;
	Sun, 14 Jun 2026 13:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781445080;
	bh=w1zSXlK3cbmAX8g+lPSOm/wYRudOkCobp760867N46o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=YhMQO6DvS8kATupMUl2LumsW1JaWOkhDEAwfDiVnYtXXoKRLtFfEFDZMPH0L/EbFc
	 BuvR2u7J3+aFyKTt/QnOj4ZaGvv7h/dkzlfDqnGewp7AhDwj/ervxeegQ9B3YXBbwo
	 YqglFGvVAf4GX51ujDOu8yT6wUC5F36kFdZGiNFn57wzh4k3O07W9GFxAZTIM7h2up
	 3xJ1xVdz5L2gvdqAAurY2MSD+fu9WTZsxfzGJFjTE746eCuj7t30k52cXXa2lJswf+
	 yFj8yMW2UJsDsd9iG6Lg4HQU+6SixecjpTaON+ql3vZGHPWtFa8bQll/pJYhj77swW
	 Lsv8Ccz54XRxQ==
Date: Sun, 14 Jun 2026 14:51:10 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Maxwell Doose <m32285159@gmail.com>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Vladimir Zapolskiy
 <vz@mleia.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, Hartmut
 Knaack <knaack.h@gmx.de>, linux-iio@vger.kernel.org (open list:IIO
 SUBSYSTEM AND DRIVERS), linux-arm-kernel@lists.infradead.org (moderated
 list:ARM/LPC32XX SOC SUPPORT), linux-kernel@vger.kernel.org (open list),
 Sangyun Kim <sangyun.kim@snu.ac.kr>, Kyungwook Boo
 <bookyungwook@gmail.com>, Jaeyoung Chung <jjy600901@snu.ac.kr>
Subject: Re: [PATCH 0/2] iio: adc: Initialize completions before requesting
 IRQs
Message-ID: <20260614145110.1214b74b@jic23-huawei>
In-Reply-To: <20260613005812.160572-1-m32285159@gmail.com>
References: <20260613005812.160572-1-m32285159@gmail.com>
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

On Fri, 12 Jun 2026 19:58:09 -0500
Maxwell Doose <m32285159@gmail.com> wrote:

> Hi all,
> 
> This short patch series fixes the issues raised by Jaeyoung Chung,
> Sangyun Kim, and Kyungwook Boo regarding init_completion() and spurious
> IRQs. The report is linked below [1], but I will also put it here
> inline:
> 
> "lpc32xx_adc_probe() in drivers/iio/adc/lpc32xx_adc.c and
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
> Reported-by: Kyungwook Boo <bookyungwook@gmail.com>"
> 
> + Reported-by: Jaeyoung Chung <jjy600901@snu.ac.kr>
> 
> Quick note, I ended up editing the report a little in the individual
> commits to match the driver we were fixing.
> 
> [1] Link: https://lore.kernel.org/linux-iio/20260610115700.774689-1-jjy600901@snu.ac.kr/

Applied to the fixes-togreg branch of iio.git and marked for stable.
Note that I'll be rebasing on rc1 once available.

Thanks

Jonathan

> 
> Maxwell Doose (2):
>   iio: adc: lpc32xx: Initialize completion before requesting IRQ
>   iio: adc: spear: Initialize completion before requesting IRQ
> 
>  drivers/iio/adc/lpc32xx_adc.c | 4 ++--
>  drivers/iio/adc/spear_adc.c   | 3 +--
>  2 files changed, 3 insertions(+), 4 deletions(-)
> 


