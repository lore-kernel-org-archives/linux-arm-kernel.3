Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7963E6F06C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 16:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EnoPL8JYn0D0UydGSTuqKtY8xMkFeDOgsr/U4xtEKKc=; b=PblCLkQCcpZwwDLSbRx0pdgsv3
	Bni3MU0Je/3vL0VcDJDFjUAaNz0hxGzVD6HJSIg/BXr93vIf4JSzyjZKP3H6A/Jpz4UMIuCYl+Uox
	+YqrOyKg1v3K4gHKO0WM5FN6LmzqH9BmFueOJLKmhchDz+ejULqEkrgfvC5nvCbawPGhVJU6UdSu1
	IyRuRhBcScEQCVF5UI5aFKZ30oJVWTwA4G6CfKpyikUvICC4aRpDansQzAdaTl7/vlQhTZRqIjX6B
	nciAXhebWBIZisuguJVbxqcxxWmCG9yKA4HrpMwpCdcg8GXzyUJt5TPkaGC2nXZ0aOfIhErrvaxWp
	SrQJvpPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6ufA-00000007hug-3w4a;
	Fri, 01 Nov 2024 16:38:16 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6ubg-00000007hHG-0FMq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 16:34:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 74EAEA443EB;
	Fri,  1 Nov 2024 16:32:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76D7BC4CECD;
	Fri,  1 Nov 2024 16:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730478878;
	bh=qTEpZeX5h5BrvEm5uvCJhihnL5J4dBpTWfPtxvKIQr8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=WEEZYmFhVei4xYtLqNT5xERqEDKa4LsyeSJA+vRyONXu1PON2O9YAA28WvhzumSm/
	 P7ss/OsrhaAwQPUCt3fxzGY8oMkvwDroediE64Y4qPJ1GKUoN0cG8Y69aM57YVvD5e
	 WmL4Wqz8nj1/GjJrrYynROUzphMc6LF3lCfXgGxbBquZLuwOkq3+VQ7LHAaXamgB2s
	 qJ3TOYuyToFdAk/3ebKBMRfBUtLk5bDYb+drPbM64j8rP3Qmxwzk/wXyNhADWciOvJ
	 oBC3u5avJcQPoS8hhF+NUwwfVm+JjhMn4yBUNEvrYdOxFKYY8JtDV5YX2kcviJ7ffk
	 O+oqIcHc9Idfw==
Date: Fri, 1 Nov 2024 16:34:29 +0000
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
Subject: Re: [PATCH v2 09/15] iio: accel: sca3000: use bool for event state
Message-ID: <20241101163429.29745c05@jic23-huawei>
In-Reply-To: <20241031-iio-fix-write-event-config-signature-v2-9-2bcacbb517a2@baylibre.com>
References: <20241031-iio-fix-write-event-config-signature-v2-0-2bcacbb517a2@baylibre.com>
	<20241031-iio-fix-write-event-config-signature-v2-9-2bcacbb517a2@baylibre.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_093440_198219_DBCC598B 
X-CRM114-Status: GOOD (  15.80  )
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

On Thu, 31 Oct 2024 16:27:04 +0100
Julien Stephan <jstephan@baylibre.com> wrote:

> Since the write_event_config callback now uses a bool for the state
> parameter, update the signatures of the functions it calls accordingly.
> 
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
Applied
> ---
>  drivers/iio/accel/sca3000.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iio/accel/sca3000.c b/drivers/iio/accel/sca3000.c
> index 36cbfcbba04d6920ba68bebd70d21bc3898a044d..3fb0f386c3db603714a746c28be36ee78d1b2a6a 100644
> --- a/drivers/iio/accel/sca3000.c
> +++ b/drivers/iio/accel/sca3000.c
> @@ -1158,7 +1158,7 @@ static int sca3000_read_event_config(struct iio_dev *indio_dev,
>  	return ret;
>  }
>  
> -static int sca3000_freefall_set_state(struct iio_dev *indio_dev, int state)
> +static int sca3000_freefall_set_state(struct iio_dev *indio_dev, bool state)
>  {
>  	struct sca3000_state *st = iio_priv(indio_dev);
>  	int ret;
> @@ -1181,7 +1181,7 @@ static int sca3000_freefall_set_state(struct iio_dev *indio_dev, int state)
>  }
>  
>  static int sca3000_motion_detect_set_state(struct iio_dev *indio_dev, int axis,
> -					   int state)
> +					   bool state)
>  {
>  	struct sca3000_state *st = iio_priv(indio_dev);
>  	int ret, ctrlval;
> 


