Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8043DE6F06E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 16:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WM0ayidRlllnRvvLUW8fGyTbbtH4p5l6+FLffKZfN/Y=; b=4o8gUGCZg36sEKa5oQPaWTWdw3
	//s0lLYfKhYV9Ym5Y8YHzOlVcJ7vBdsnvmMVryEADwUQQPowqWzPsZMH9Fl68N8EkIzV+7i/nko7q
	FRXzr/plJck90QadQ+ikITcxSozmKAYGa7uTofO6HzMlCvu+eUqPM+LvzUntVaewJyTfYNAOUT2yK
	UZf+BBianVenph6rKZyx3UOjnn+yjUWoujWB8DjXwcN4/ORUEkg8uHXkYinIpJda2pRIZG3+PVQXz
	zuxI1ALM72uZ9VfR4YPVP3hXORgZv8Gb5Si3QWLXKJbqiQ3iPcV8GHgETb+npRJtLSrVfmUcHlCzQ
	UMwCMa+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6umv-00000007jmI-1Llf;
	Fri, 01 Nov 2024 16:46:17 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6tfj-00000007WdB-2fDi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 15:34:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 49EF3A4310B;
	Fri,  1 Nov 2024 15:32:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50629C4CECD;
	Fri,  1 Nov 2024 15:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730475286;
	bh=3gF4dUs4I0hbZEB/vl2nNOfNJfrWUy9SgixJZc2ZpYg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ExR7YdMPH4ej6K7ujfnj4MwHuH/ToU0rvxAgB76QLIOBPcjQVQwD0RnU/KhoWucTr
	 7THMxdiDKds6yE9+xL6TTZTncVEfFMjP1V2Ik4AXfTlGUGzhUoxA7r7Ck89HCCh+QZ
	 Z0zaqgT4DcM9JJeSsr6hY4ZY/+XjCozJb5jzEAj0Aut+XaN+deDpesWtuh0olIVhEF
	 vU7bmW6UR4yxJdX1o3mSNkSR4399Uek5adBzhXoudUfhmcUtwvicAJFd+mlNwpNFA5
	 zM4ooysvKCmWA0G1nhHe6buqZl6LjmNTjOeTmxBMUtOxyXgNUDa5DWgJiBmKf/D0wH
	 BUZ+itl6SwQJQ==
Date: Fri, 1 Nov 2024 15:34:34 +0000
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
Subject: Re: [PATCH v2 02/15] iio: proximity: hx9023s: simplify code in
 write_event_config callback
Message-ID: <20241101153434.11d85f8b@jic23-huawei>
In-Reply-To: <20241031-iio-fix-write-event-config-signature-v2-2-2bcacbb517a2@baylibre.com>
References: <20241031-iio-fix-write-event-config-signature-v2-0-2bcacbb517a2@baylibre.com>
	<20241031-iio-fix-write-event-config-signature-v2-2-2bcacbb517a2@baylibre.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_083447_840882_618EA82B 
X-CRM114-Status: GOOD (  17.61  )
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

On Thu, 31 Oct 2024 16:26:57 +0100
Julien Stephan <jstephan@baylibre.com> wrote:

> iio_ev_state_store is actually using kstrtobool to check user
> input, then gives the converted boolean value to the write_event_config
> callback.
> 
> Remove useless code in write_event_config callback.
> 
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
Applied to the togreg branch of iio.git and pushed out as testing.
Note if anyone else has time to review, I can still add tags for now.

I'll probably push it out as an (in theory) not rebasing tree early
next week to give a bit of time in next before a pull request.

Jonathan

> ---
>  drivers/iio/proximity/hx9023s.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/proximity/hx9023s.c b/drivers/iio/proximity/hx9023s.c
> index d8fb34060d3db88a3ba5ecdc209b14be8e42e8b9..38441b1ee040c7c26047b0cb2ac443ecb8396df3 100644
> --- a/drivers/iio/proximity/hx9023s.c
> +++ b/drivers/iio/proximity/hx9023s.c
> @@ -879,7 +879,7 @@ static int hx9023s_write_event_config(struct iio_dev *indio_dev,
>  	struct hx9023s_data *data = iio_priv(indio_dev);
>  
>  	if (test_bit(chan->channel, &data->chan_in_use)) {
> -		hx9023s_ch_en(data, chan->channel, !!state);
> +		hx9023s_ch_en(data, chan->channel, state);
>  		__assign_bit(chan->channel, &data->chan_event,
>  			     data->ch_data[chan->channel].enable);
>  	}
> 


