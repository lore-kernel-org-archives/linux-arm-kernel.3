Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E17FCCD343B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 15:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mLMASIExtTsI+DJxMs5PIhd3Dexj7SlwTA3wGVoTx6Y=; b=VXJA+mOEwplgcOkSTr0LtT3F/Q
	qvyUaSccp2RuV1FVgxi1v7oWD2U+L4Oh0HExi/waPSPOnDqIuMqVb04YUTaVV6uFspa09/Xmn62Vm
	ZfWvQKGx7UrWX0W0O5ABueQPbEClCdi3mVQiiAhZ9MiMNuL8bBz8IjzsV79QHCpQAp93zg6SLcxlc
	PIQf8tv+e4x8CVHLAGRN6JpHX4OoEHo04ibbPbRcFeipMculPb8YR4AKMgshTYkX0bfma0B1yMqwk
	LxBDwM2tjP7wb3M5qJ6dbRhGjnYmhLF632Q69mr2JvTKuhIAa7xhCTxVi3ZSxwgSXHxf3x6Nry3lZ
	F44Vw5mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKeWw-00000001PFh-0O5S;
	Wed, 06 May 2026 15:51:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKeWv-00000001PFK-2fc7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 15:51:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4C0E242A16;
	Wed,  6 May 2026 15:51:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8644CC2BCB0;
	Wed,  6 May 2026 15:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778082681;
	bh=75aSId5PszDYrjNHLi2AdXxsU5A0sZq9jWBMLBfqK6g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Ia5DiQDn0TWi9nXzq+V4BFoPt0g7X7307mPicIlIj4+iXuKOASbU1iiywRt8Qs89C
	 td5GTUtO/NvELJQE+X8dx2MMyxSblkunNRkgltEYl6LkcrB4eYOO2ByE88imaF2v4P
	 2UxiKcrDUevOEej+221AlAqz/kCHlWlqjtYuHGzGSWbZ8IhevlowM4CfdfELC3BANC
	 IWXYwtUXABMoP/ef7VY6KG4221T6jb2WpxXY1MG/wkefHdPgvHStJeczCvFh2UtwT6
	 PdrfmEj4nAbhBahJi8hTTVuzcuQ8tXOggbkqpO665Fm4WHdCdxdoLihBjemSGpD3Wa
	 lL1FgyB1YdvQA==
Date: Wed, 6 May 2026 16:51:12 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Maxwell Doose <m32285159@gmail.com>
Cc: salih.erim@amd.com, conall.ogriofa@amd.com, michal.simek@amd.com, David
 Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 linux-iio@vger.kernel.org (open list:XILINX AMS DRIVER),
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/ZYNQ
 ARCHITECTURE), linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH] iio: adc: xilinx-ams: Replace spin_lock() and unlock()
 calls with guard(spinlock*)()
Message-ID: <20260506165112.4425c378@jic23-huawei>
In-Reply-To: <20260504214613.121283-1-m32285159@gmail.com>
References: <20260504214613.121283-1-m32285159@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_085121_702022_392F14A3 
X-CRM114-Status: GOOD (  13.14  )
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

On Mon,  4 May 2026 16:46:12 -0500
Maxwell Doose <m32285159@gmail.com> wrote:

> Include linux/cleanup.h to take advantage of RAII macros.
> 
> Replace spin_lock() and unlock() calls with their RAII macro
> counterparts. This will help modernize the code and increase readability.
> 
> Remove "flags" variables where spin_lock_irqsave() has been replaced
> with guard(spinlock_irqsave)()
> 
> Signed-off-by: Maxwell Doose <m32285159@gmail.com>

Hi Maxwell

One thing inline.

Thanks,

Jonathan

>  static void ams_enable_channel_sequence(struct iio_dev *indio_dev)
> @@ -1060,9 +1058,8 @@ static void ams_unmask_worker(struct work_struct *work)
>  {
>  	struct ams *ams = container_of(work, struct ams, ams_unmask_work.work);
>  
> -	spin_lock_irq(&ams->intr_lock);
> +	guard(spinlock_irq)(&ams->intr_lock);

This increases the scope to include scheduling delayed work. Seems unwise
in general and should definitely be mentioned in the commit message.
Use a scoped_guard() here probably or leave it alone. 

>  	ams_unmask(ams);
> -	spin_unlock_irq(&ams->intr_lock);
>  
>  	/* If still pending some alarm re-trigger the timer */
>  	if (ams->current_masked_alarm)



