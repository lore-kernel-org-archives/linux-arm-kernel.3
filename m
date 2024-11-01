Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89AFBE6F06C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 15:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Ie7y5TP5Ccy15rTMXD8uXDQoLxMh7LkaQKnEcHntYo=; b=ec9frJsz14LpNgG1bushzf35uA
	DJ7INoSBgZlV1sgNeEcbhQmDsBwpbHnG4lzi0BdypvSgJVyPUuELSVzH18Vl6s+cl1wmFWrJ9leo7
	mFgNucoz5j5CFbuhVe4g0IEn62t3kU0YQWLaS99meurKL7gkEVdYkOCfSgnbN1sxb9oIV5P+O5jxv
	MEaafOhG35AgRpnJcD84RG6ARb4Qn/vQVNtbHUPGr+jjBo8SBItJMxrRCxtxycHVjt2sPJzVyFJ0Y
	qgrwhNEE+hSi3mhP+8+P3NXruw3I3q76lD72iPitJ+KqpeR8vBKbE9iDvawWqgyivnU/VSPCESkvw
	Ol3LW58g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6tj7-00000007XEN-3xFu;
	Fri, 01 Nov 2024 15:38:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6tgI-00000007Wk5-0Sae
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 15:35:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9566B5C4AAA;
	Fri,  1 Nov 2024 15:34:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5625C4CECD;
	Fri,  1 Nov 2024 15:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730475321;
	bh=uwTrmg5E+/4Xe9TIGAk2cAH3uSAcEGblqU7abk42CGk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Q3AiIkIU/BSsjG/DRK0gOBsQNCmallFcN03rt4Dn64kR6xgsju3LZdub0MGEhcFbO
	 8hVC7lrN2OqSTEB5eKdoNpk+yavuzjdG6TvlVlzJFHFsBoZg6v2t5i1UVtJI6u4uNL
	 C+GYScq1jm8Z5A+QG4H/DnxGU6Ag+0qbprQUXSZnulLE6Pu3iRb5/6iqc1BQXWVVbu
	 SkzRUcGyqaccScCfOrrGHpxBk4w/0/JdfESf6O52gSE4IacVL1tA4lgEJqjPSIZBVy
	 ywXIYDDdFa0pOL0fgDqnzHbPKfd5KOjSZ07O+i8vjcbIFVLbf83BU2S9A0rW67jPwW
	 FjFvCR9XuDoHg==
Date: Fri, 1 Nov 2024 15:35:09 +0000
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
Subject: Re: [PATCH v2 03/15] iio: light: tsl2772: simplify code in
 write_event_config callback
Message-ID: <20241101153509.11ae74b9@jic23-huawei>
In-Reply-To: <20241031-iio-fix-write-event-config-signature-v2-3-2bcacbb517a2@baylibre.com>
References: <20241031-iio-fix-write-event-config-signature-v2-0-2bcacbb517a2@baylibre.com>
	<20241031-iio-fix-write-event-config-signature-v2-3-2bcacbb517a2@baylibre.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_083522_229059_748E77D4 
X-CRM114-Status: GOOD (  16.11  )
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

On Thu, 31 Oct 2024 16:26:58 +0100
Julien Stephan <jstephan@baylibre.com> wrote:

> iio_ev_state_store is actually using kstrtobool to check user
> input, then gives the converted boolean value to the write_event_config
> callback.
> 
> Remove useless code in write_event_config callback.
> 
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
Applied.
> ---
>  drivers/iio/light/tsl2772.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iio/light/tsl2772.c b/drivers/iio/light/tsl2772.c
> index cab468a82b616a23394977da1d8822d29d8941d3..26082f239c4c3aeabfe73ed100d6e885f5266329 100644
> --- a/drivers/iio/light/tsl2772.c
> +++ b/drivers/iio/light/tsl2772.c
> @@ -1086,9 +1086,9 @@ static int tsl2772_write_interrupt_config(struct iio_dev *indio_dev,
>  	struct tsl2772_chip *chip = iio_priv(indio_dev);
>  
>  	if (chan->type == IIO_INTENSITY)
> -		chip->settings.als_interrupt_en = val ? true : false;
> +		chip->settings.als_interrupt_en = val;
>  	else
> -		chip->settings.prox_interrupt_en = val ? true : false;
> +		chip->settings.prox_interrupt_en = val;
>  
>  	return tsl2772_invoke_change(indio_dev);
>  }
> 


