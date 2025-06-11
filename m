Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ACE8C71134
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 19:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LK6ci1vveNNWltGc5MPe3m/5EinJoP4t/tjwOeVsM3E=; b=JQn8uLegcsVST6yOUcuzXXRfQ9
	gR8jul6rVMk2KvI8YJJd4d49mDM8EAuPnKZz19B7j9KCC8jUrhckP9sypfmeIZLPjb57uhznYdG8m
	l01uNPCT3nny0U28RPzBFaSwZpzRuZMXjwNw8W1XmxwzirhVKhI/ZWwbrr6CoBKCCqY6ESZDFPzbC
	8xbfxG98joaIfefEFKRBGbZ9DkKLmHIo9B52znvhUw+1UKoXOryi1Ls1I2Jdkn+7bb4MOWU3gL5qh
	Pc9GC4Fi5ZwcfBZBJg8QhxCQES1Tk9v7pzPIK0573gNQIFAZiShufG1SdbxB5vHtpsdgXW904bfgK
	haL+nlxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRYp-0000000B4sx-0e3K;
	Wed, 11 Jun 2025 19:56:35 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPOR5-0000000Ad6f-3ygj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 16:36:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E6DD6A516A8;
	Wed, 11 Jun 2025 16:36:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09B13C4CEE3;
	Wed, 11 Jun 2025 16:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749659782;
	bh=sclz4982E4WzBN3+77UXueLPKjZaQ8E9dIo5KXXJhDU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gr9Tkr4C3a+q0tp1tV/MbnrtfnQ54lTT+lFIVz+Um9u/CfxGTiBksQGPeaBSNpcuL
	 QHf0m6u+Qkq1y3uabTQOAYtq50kt77CYoQI6606AjD2jLqXpQvuQ+tk91sH2VX1CQt
	 ZOmg2O4qjTc3U7fYpeqcwn2hSBZlXknZbFI/goyKaXuYMuxAggboykF7fVxYjeJcEU
	 WqAtS2FEyKpRHvME+bIzdi5fQBPft3FHAPo6yrSlzutch9g582P1FA7SKuUupHK9pH
	 4n4oFIQaYt0dmEW1yQWah7Lse9ooe1Iyax/nnJBQ4nFIwiM76SLS9nBJr/M+rofH64
	 Daez8pQNQSlgw==
Date: Wed, 11 Jun 2025 17:36:13 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: Antonio Borneo <antonio.borneo@foss.st.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Andy Shevchenko <andy@kernel.org>, "David
 Lechner" <dlechner@baylibre.com>, Gatien Chevallier
 <gatien.chevallier@foss.st.com>, "Lee Jones" <lee@kernel.org>,
 <linux-iio@vger.kernel.org>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>
Subject: Re: [PATCH 3/5] iio: trigger: stm32-timer: Fix build warnings about
 export.h
Message-ID: <20250611173613.492b7fc5@jic23-huawei>
In-Reply-To: <f8b1adef-10f3-4cff-9e11-10c1a16f6ec5@foss.st.com>
References: <20250610124855.269158-1-antonio.borneo@foss.st.com>
	<20250610124855.269158-4-antonio.borneo@foss.st.com>
	<f8b1adef-10f3-4cff-9e11-10c1a16f6ec5@foss.st.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_093624_053181_CC299CA0 
X-CRM114-Status: GOOD (  16.76  )
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

On Tue, 10 Jun 2025 15:05:36 +0200
Fabrice Gasnier <fabrice.gasnier@foss.st.com> wrote:

> On 6/10/25 14:48, Antonio Borneo wrote:
> > After commit a934a57a42f6 ("scripts/misc-check: check missing #include
> > <linux/export.h> when W=1") and commit 7d95680d64ac ("scripts/misc-check:
> > check unnecessary #include <linux/export.h> when W=1") we get the build
> > warning with W=1:
> > 
> > drivers/iio/trigger/stm32-timer-trigger.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> > 
> > Fix it.
> > 
> > Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>  
> 
> Hi Antonio,
> 
> You can add my:
> Acked-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Applied to the togreg branch of iio.git - initially pushed out as testing
as I have some other stuff queued today that needs 0-day to look at it.

Thanks,

J
> 
> Thanks,
> Fabrice
> 
> > ---
> >  drivers/iio/trigger/stm32-timer-trigger.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/iio/trigger/stm32-timer-trigger.c b/drivers/iio/trigger/stm32-timer-trigger.c
> > index 925b864facca1..3b9a3a6cbb25c 100644
> > --- a/drivers/iio/trigger/stm32-timer-trigger.c
> > +++ b/drivers/iio/trigger/stm32-timer-trigger.c
> > @@ -6,6 +6,7 @@
> >   *
> >   */
> >  
> > +#include <linux/export.h>
> >  #include <linux/iio/iio.h>
> >  #include <linux/iio/sysfs.h>
> >  #include <linux/iio/timer/stm32-timer-trigger.h>  


