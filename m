Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F1EDC71136
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 19:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GIIb/krqR6M0BW13m2zNVKe8LITY6PCEJsI+d/OiRLA=; b=L6QWwBKr9/KfkUi9dOpb91UL3a
	p70zXXrjDancFwROWZ/7Uou33RGs/OBEHjCCxgYrhS9ypi5jGE9GaaU99DDaBao0KrShD8j8bu7OA
	OjpLeiJ9L1QKnswhHymk/ENLbEWK7DkcNSvPVUmPtzy13mlunWbH3C5eK6dxowylnV7gDAw9NQ/pP
	jciQMMWLA4zYg2IujpjhnKYrCaeezCczbG4Wi9PRiOB1mP2NeIq6GjcoadXN7IcRonLGnJGuqVshf
	sFVbq6YdwLh+whKyD0KaZyWrgyiiq84youL7eJP8PEL8Z+HFlqpPTv+2vNakpcGEPvzlEPDvNHF5S
	2coFrr6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRYk-0000000B4n6-43UL;
	Wed, 11 Jun 2025 19:56:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPOPT-0000000Acs1-3ePO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 16:34:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F3ED46154F;
	Wed, 11 Jun 2025 16:34:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C8C1C4CEEA;
	Wed, 11 Jun 2025 16:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749659682;
	bh=WBdEf0/HZqkhDmCcxbwgGvvd9cOJk0qwHZjEEgt/ZCg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=R9CJ9dpp9w5VDPPesK/5/rpC4lTAgov0Lz0m5tWPIwOM1a8pucz2AQJ+RuXpVd+8e
	 eZ6LuqHLGtrCoDUyNmTpcDWZ5ccxi8xLL2VyhxtUaQaxz9ZL95NpwedI9bbEVyBaH3
	 lI/i8QKLVE+L9hwXgUMLBUC589xACUwMBSGRO+c5vZdvnHOg2Pa/GijMw2RgcTYDy+
	 0p8ZFhYrPxPQ6E9FaFC2nnBS5/+Y0G/qGfWs4MmauaK5rrGxb6tSaknwNxLXdUmb1o
	 +xgBPkQci1eGdMYHTMdfX3VQce/ZOi5dvkf2zOu44OuvtgHnnGpw+2Axs5DpJFhsKS
	 eqxai+HX0/7Qg==
Date: Wed, 11 Jun 2025 17:34:33 +0100
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
Subject: Re: [PATCH 2/5] iio: adc: stm32-dfsdm: Fix build warnings about
 export.h
Message-ID: <20250611173433.430c8eb4@jic23-huawei>
In-Reply-To: <7600b151-0487-4cb9-ab6e-3cc9c6012bdf@foss.st.com>
References: <20250610124855.269158-1-antonio.borneo@foss.st.com>
	<20250610124855.269158-3-antonio.borneo@foss.st.com>
	<7600b151-0487-4cb9-ab6e-3cc9c6012bdf@foss.st.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
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

On Tue, 10 Jun 2025 15:05:16 +0200
Fabrice Gasnier <fabrice.gasnier@foss.st.com> wrote:

> On 6/10/25 14:48, Antonio Borneo wrote:
> > After commit a934a57a42f6 ("scripts/misc-check: check missing #include
> > <linux/export.h> when W=1") and commit 7d95680d64ac ("scripts/misc-check:
> > check unnecessary #include <linux/export.h> when W=1") we get the build
> > warnings with W=1:
> > 
> > drivers/iio/adc/stm32-dfsdm-adc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> > drivers/iio/adc/stm32-dfsdm-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> > 
> > Fix them.
> > 
> > Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>  
> 
> Hi Antonio,
> 
> You can add my:
> Acked-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Applied to the togreg branch of iio.git.

Ta.

> 
> Thanks,
> Fabrice
> > ---
> >  drivers/iio/adc/stm32-dfsdm-adc.c  | 1 +
> >  drivers/iio/adc/stm32-dfsdm-core.c | 1 +
> >  2 files changed, 2 insertions(+)
> > 
> > diff --git a/drivers/iio/adc/stm32-dfsdm-adc.c b/drivers/iio/adc/stm32-dfsdm-adc.c
> > index f583924eb16bb..c2d21eecafe79 100644
> > --- a/drivers/iio/adc/stm32-dfsdm-adc.c
> > +++ b/drivers/iio/adc/stm32-dfsdm-adc.c
> > @@ -8,6 +8,7 @@
> >  
> >  #include <linux/dmaengine.h>
> >  #include <linux/dma-mapping.h>
> > +#include <linux/export.h>
> >  #include <linux/iio/adc/stm32-dfsdm-adc.h>
> >  #include <linux/iio/backend.h>
> >  #include <linux/iio/buffer.h>
> > diff --git a/drivers/iio/adc/stm32-dfsdm-core.c b/drivers/iio/adc/stm32-dfsdm-core.c
> > index 041dc9ebc0482..47e2d1338e9e6 100644
> > --- a/drivers/iio/adc/stm32-dfsdm-core.c
> > +++ b/drivers/iio/adc/stm32-dfsdm-core.c
> > @@ -8,6 +8,7 @@
> >  
> >  #include <linux/bitfield.h>
> >  #include <linux/clk.h>
> > +#include <linux/export.h>
> >  #include <linux/iio/iio.h>
> >  #include <linux/iio/sysfs.h>
> >  #include <linux/interrupt.h>  


