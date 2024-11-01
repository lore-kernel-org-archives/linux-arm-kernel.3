Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF38FE6F06D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 15:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wSlXYEnRx/bsZXCjlaJ/32oNYrsMZJcBD+/+UPB2oFc=; b=xGrG/w4sn6NQbC6IWBxlAhk8Er
	dgcINAyDAqgjtXSt01nDbEi4xR81qH8u3sZq/nUi9dXktSgq9OUokTFKVr4pSFppLiSfCsusjUPEz
	lwYgyNz4TXTnFpv1Se5UkpXTXt8/K0qDVGeMTtdoP7xVUFzrmHLrHx/yk3bVS/fv0P214Ddmp9Hzi
	LjBSCNhHi5a+sLMpEMVTq9HcaONV6UXOPJxihHtfWL8w9JP4nkVIQ4276Q06849ffdpQQNfG1X9FA
	LCPyFUmOskDcHWbn6VBZ9XnrS3o0ORhzKUaCguehY9VbSX2+OoZMHEVo10Ys0PiIC0WEPhE7qtOkK
	nMvgF4rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6twP-00000007ZBC-0w5J;
	Fri, 01 Nov 2024 15:52:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6ti2-00000007X2R-3Eac
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 15:37:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 431695C1628;
	Fri,  1 Nov 2024 15:36:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DB34C4CED1;
	Fri,  1 Nov 2024 15:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730475429;
	bh=7A7xoAlxFzqvHKjOX7THt9g8OUG8yAzJ9stzmiv/cWs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DYC00OtJJLTmceKdnDnDi/ze3IYHInLzbnPJwblyMVaZ6/79mK5qNn1SBTsLb2THP
	 wEREqCfpvTEaW5eef9G+TzESdyHDAqBsE1oTqLFuHosJ88c3NBvKmU+YtSnZ3oKrUh
	 Uzl4tqNObZKVsoPUoGqXbC6FT/AX2y+R0jCD16AQbRx0ABdAgP7+77wWIBR5vnJnZo
	 aUi86jXogCaDebDgWfXyKeM26AwlXLz6IkVtcmzqMBtbVKOyZl82LVACQfOuP4p01+
	 blVT77UVEHoRlXfrR2z5xR7w4Na1L+PRK7eYp0wJbonYPlKOCeuifbpSGEgls0PJ2w
	 Y760sWGMOHvSw==
Date: Fri, 1 Nov 2024 15:36:56 +0000
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
Subject: Re: [PATCH v2 05/15] iio: proximity: sx9500: simplify code in
 write_event_config callback
Message-ID: <20241101153656.43e27240@jic23-huawei>
In-Reply-To: <20241031-iio-fix-write-event-config-signature-v2-5-2bcacbb517a2@baylibre.com>
References: <20241031-iio-fix-write-event-config-signature-v2-0-2bcacbb517a2@baylibre.com>
	<20241031-iio-fix-write-event-config-signature-v2-5-2bcacbb517a2@baylibre.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_083710_889774_14ED60F3 
X-CRM114-Status: GOOD (  17.86  )
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

On Thu, 31 Oct 2024 16:27:00 +0100
Julien Stephan <jstephan@baylibre.com> wrote:

> iio_ev_state_store is actually using kstrtobool to check user
> input, then gives the converted boolean value to the write_event_config
> callback.
> 
> Remove useless code in write_event_config callback.
> 
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
Applied and pushed out as testing. Still time for other reviews if anyone
cares to take a look.

Thanks,

Jonathan

> ---
>  drivers/iio/proximity/sx9500.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iio/proximity/sx9500.c b/drivers/iio/proximity/sx9500.c
> index 3f4eace05cfc6a4679fe82854dc059aa4a710d6d..e3da709424d5b2bd4e746df7adc4a4969e62f2a6 100644
> --- a/drivers/iio/proximity/sx9500.c
> +++ b/drivers/iio/proximity/sx9500.c
> @@ -551,7 +551,7 @@ static int sx9500_write_event_config(struct iio_dev *indio_dev,
>  
>  	mutex_lock(&data->mutex);
>  
> -	if (state == 1) {
> +	if (state) {
>  		ret = sx9500_inc_chan_users(data, chan->channel);
>  		if (ret < 0)
>  			goto out_unlock;
> @@ -571,7 +571,7 @@ static int sx9500_write_event_config(struct iio_dev *indio_dev,
>  	goto out_unlock;
>  
>  out_undo_chan:
> -	if (state == 1)
> +	if (state)
>  		sx9500_dec_chan_users(data, chan->channel);
>  	else
>  		sx9500_inc_chan_users(data, chan->channel);
> 


