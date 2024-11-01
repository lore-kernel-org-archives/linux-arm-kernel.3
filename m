Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09713E6F069
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 15:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uw+u9+pHQVB4rIs8TIw0ZirS8UEdwovbPZ/DoEexm48=; b=mCQK6eyFQg3JJ8UxZEip+cYjup
	xIymTUJEbdg08pqMZgNTKsFFXuwNXYYKI/EZ5LpgqHZNDuK4nmjVJ/EaCMtUINb9U7Yufp6ti9jt6
	dSbGgj+gAxPf+EFeczBDfzY1pF9zam1CqNunI5agNWSxSQ6QTMr5+X/XzL8HQXJpBDvV+WKI+5P3n
	ni+oqdi9BI3AE1+cO1WcrWQuxtqgMVq43a9pIfFAiGMuZ0TrHnjzN/dGrOr5W9Y70mAAxF8MAQsfs
	gq/2CtojkoQAILlv2atx5QLhjy8Zy+Vb/DzPmITh/M6RXfji3gopfgqMatvbus6k+QIpy1B43XEDT
	9Ij4QbDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6to7-00000007Y73-4BZN;
	Fri, 01 Nov 2024 15:43:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6thF-00000007Wu4-19J4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 15:36:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D88A65C076E;
	Fri,  1 Nov 2024 15:35:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F13FC4CED1;
	Fri,  1 Nov 2024 15:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730475380;
	bh=CInveFC1m9HxfkdDgTiov6AuuZys4diPXXNz/tkR8p4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=c4OIx+gY5i/ZqGD7pB16BQSXB+sNUiTxnmiQ5jviDP+MUdg+r+xetscqBpuPSITk0
	 q4O9yc2wAs4VW9nno1436qfBtor3HhTvgpEOYeoDLEtu6ZqWeAXb7KOsFjUkcniyUt
	 VO3vpMdmV+sm3iHbFgWT1Ot9zjujPzWlnYYk0sy7WTBEUrEB9FPHMsTWoQHtkJttSE
	 9go7oGFdlZo9/6cFOL0ByHxGeKc90pStWaB1uttiXBxE4lGvUY2CpyRTlTFYa7zP6x
	 hgaEm9qfgn4gr1jAQ5iy1AEV1ryh0I8uqRSVne8qUYnXE8/YVwQKXCs6MMwVTyo+Mf
	 KXK9HQtOId3eQ==
Date: Fri, 1 Nov 2024 15:36:08 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Julien Stephan <jstephan@baylibre.com>
Cc: Mudit Sharma <muditsharma.info@gmail.com>, Lars-Peter Clausen
 <lars@metafoo.de>, Anshul Dalal <anshulusr@gmail.com>, Javier Carrasco
 <javier.carrasco.cruz@gmail.com>, Jean-Baptiste Maneyrol
 <jean-baptiste.maneyrol@tdk.com>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Cosmin Tanislav
 <cosmin.tanislav@analog.com>, Ramona Gradinariu
 <ramona.gradinariu@analog.com>, Antoniu Miclaus
 <antoniu.miclaus@analog.com>, Dan Robertson <dan@dlrobertson.com>, Marcelo
 Schmitt <marcelo.schmitt@analog.com>, Matteo Martelli
 <matteomartelli3@gmail.com>, Anand Ashok Dumbre
 <anand.ashok.dumbre@xilinx.com>, Michal Simek <michal.simek@amd.com>,
 Mariel Tinaco <Mariel.Tinaco@analog.com>, Jagath Jog J
 <jagathjog1996@gmail.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Subhajit
 Ghosh <subhajit.ghosh@tweaklogic.com>, Kevin Tsai <ktsai@capellamicro.com>,
 Linus Walleij <linus.walleij@linaro.org>, Benson Leung
 <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, chrome-platform@lists.linux.dev
Subject: Re: [PATCH v2 04/15] iio: proximity: irsd200: simplify code in
 write_event_config callback
Message-ID: <20241101153608.23a9c6f1@jic23-huawei>
In-Reply-To: <20241031-iio-fix-write-event-config-signature-v2-4-2bcacbb517a2@baylibre.com>
References: <20241031-iio-fix-write-event-config-signature-v2-0-2bcacbb517a2@baylibre.com>
	<20241031-iio-fix-write-event-config-signature-v2-4-2bcacbb517a2@baylibre.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_083621_389973_6B24A61D 
X-CRM114-Status: GOOD (  17.89  )
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

On Thu, 31 Oct 2024 16:26:59 +0100
Julien Stephan <jstephan@baylibre.com> wrote:

> iio_ev_state_store is actually using kstrtobool to check user
> input, then gives the converted boolean value to the write_event_config
> callback.
> 
> Remove useless code in write_event_config callback.
> 
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
Applied and pushed out as testing.  If anyone has time to review
I can still add tags (or pull the patches if there is something I missed!)

Thanks,

Jonathan

> ---
>  drivers/iio/proximity/irsd200.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/proximity/irsd200.c b/drivers/iio/proximity/irsd200.c
> index 6e96b764fed8b577d71c3146210679b0b61d4c38..fb0691da99ee621e19013a64d122f097e793efd9 100644
> --- a/drivers/iio/proximity/irsd200.c
> +++ b/drivers/iio/proximity/irsd200.c
> @@ -662,7 +662,7 @@ static int irsd200_write_event_config(struct iio_dev *indio_dev,
>  			return ret;
>  
>  		return regmap_field_write(
> -			data->regfields[IRS_REGF_INTR_COUNT_THR_OR], !!state);
> +			data->regfields[IRS_REGF_INTR_COUNT_THR_OR], state);
>  	default:
>  		return -EINVAL;
>  	}
> 


