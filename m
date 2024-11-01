Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD3B5E6F06E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 16:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dd0W/hQ79jf9Eg81tow1GQdew7pFzvO7S7cIlOCyKps=; b=yeMSWVj6dW89er6QwNfxNwD7kT
	+nYWOBjjhbeoiYEfkdD5Zr2vySjrTqUETQIF7ER/DSCEBvkjPUpBY4Y3kvyzM6c4uQZYHH+0kBLMY
	SI7jW6tJw/rC74GuY7xkVAr4dLG4Y96cPSz21Gm93zMqFCyNFHtfhw+z1doDhfp3LGKxSHEqDgiHi
	+E72QKEhZSkzdtKEJstczpNGg1miYGS/leKl+vfoPEzDUcGAy7s67GCYYu1atbkN7eS9NHPL+WnFs
	skZIBDbJQx4eDtVxPFRqltBnc0EV81cELW7CMeFUMTZIcOA/A8MVz6X5+bdRbkieGAKeX2i0eaCHm
	Jmjoli4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6uvi-00000007l6Q-2XDw;
	Fri, 01 Nov 2024 16:55:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6ulA-00000007jDP-3xTn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 16:44:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 58AFD5C54D6;
	Fri,  1 Nov 2024 16:43:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1145FC4CED3;
	Fri,  1 Nov 2024 16:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730479468;
	bh=1CfY2+o4mRhy02U7CFSYwo0qVuQU+kj4WkP+HlKqRn0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RUwoG//TVOvFq/Z1QHtZYQirIJMBlS/ZHXo9vBPUi0Cy17F9j38/a/zHCwtOEm+A+
	 jdAI7FoQWJ3E7573lT0saQ+1WwkRsUr30AomYt07P6Jm+HAD55oXdbAlh5JgFHBBcg
	 /TivdakH0u8CYOnH1xagXujZ4e7+vg4FIIUfiQC9/kUkDKREYlEuTHucOjUyKDNV43
	 16tmfjxwvKsDTI1rAC/Y7BUc/mC+Me2Nl1FXZcv/bTXZocBCLFYBI0Pu2XZyW91u7I
	 ZuYJZdvuiJJ9W/q5PRmAmH9rXDbLOLxB4bwEnwBWVn+TDgr9N6e/CSZG/uMhTF5l0s
	 2FGA5tFv/zEXA==
Date: Fri, 1 Nov 2024 16:44:14 +0000
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
Subject: Re: [PATCH v2 15/15] iio: light: apds9960: remove useless return
Message-ID: <20241101164414.4f14c75f@jic23-huawei>
In-Reply-To: <20241031-iio-fix-write-event-config-signature-v2-15-2bcacbb517a2@baylibre.com>
References: <20241031-iio-fix-write-event-config-signature-v2-0-2bcacbb517a2@baylibre.com>
	<20241031-iio-fix-write-event-config-signature-v2-15-2bcacbb517a2@baylibre.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_094429_074064_6FD01647 
X-CRM114-Status: GOOD (  17.36  )
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

On Thu, 31 Oct 2024 16:27:10 +0100
Julien Stephan <jstephan@baylibre.com> wrote:

> return 0 statement at the end of apds9960_read_event_config is useless.
> Remove it.
Strange that never triggered a build warning that I noticed.

Anyhow applied.  

So I did end up more or less (i.e. with tweaks) applying the whole series.
If you have time to follow up on the few cases I spotted where passing the
bool value into functions instead of an int may make for better
readability.

> 
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
>  drivers/iio/light/apds9960.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/iio/light/apds9960.c b/drivers/iio/light/apds9960.c
> index 7b3da88885693c488807da459ceaa1cbb3881bcd..d30441d3370309fce9d6c717d42b829ff1db3174 100644
> --- a/drivers/iio/light/apds9960.c
> +++ b/drivers/iio/light/apds9960.c
> @@ -749,8 +749,6 @@ static int apds9960_read_event_config(struct iio_dev *indio_dev,
>  	default:
>  		return -EINVAL;
>  	}
> -
> -	return 0;
>  }
>  
>  static int apds9960_write_event_config(struct iio_dev *indio_dev,
> 


