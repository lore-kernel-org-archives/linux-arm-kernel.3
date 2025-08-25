Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 320D2CA0FE9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 12:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hn66cCUB0Y2jVSqd/CUbhBNhJ1LVn4cLvjZk6V7mFFI=; b=SrE6OxE++Cs574AisiTD0f3efg
	t1ghnmvVc5Ijqfc5jWM+r5seZ5bwa1siWNnn1+YV/EJjwz/lkJgf7jeV+/iK+y5DLweeO4mXBo1wd
	i9MGVwaTAR9dOrXlRQer6Y2FY7yobrFPs+1dyr6CD1VokzAMV7Pn/wRZhvfwca6EFlYA/bbT3KGCD
	ykCVh2RN08Pil7HZWXlAEYIgX9sm+qj8RFUk5evDZgmaDXTRRdHuMcRAGKv8szTror4Ru92k+CoM4
	NNIdS333AkbsrJBWZAR9bipms1o7cGat9XUsgejM/fsGehoCe29OJ18H4vNgV9LExanMHpd710Wcq
	OI8AsTTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqWij-00000007zKj-0cJh;
	Mon, 25 Aug 2025 12:54:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqVTw-00000007mKi-10Jo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 11:35:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BBFE441B07;
	Mon, 25 Aug 2025 11:35:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C408C4CEED;
	Mon, 25 Aug 2025 11:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756121723;
	bh=G/61tsIfBpP7VYIx9gVTeDZEHhYHjn2CEFnLTjnYXG4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nvDuF3H6+1NBwrq7nZs/ZMfcyEsTv0fFs/ZGXeBCsb37uLyju05gFfzD//QLGlI6k
	 dN5TLXERIujUDB7a11P+FR9WpiDdaT+rdNC/SxeiC8E7q7ZJMOs2SnNRalD5wq4oJ2
	 GfD60mM6gf3O35IKU0qXi+39/nFXFqF8KObK26Ms4aLRiDkSe1wrjXfTrbuWuCfnQF
	 yhK5zdjN+hHyKEHEChellx6Y+VKnIvrQIJaO5OifVqw+Y/TFH5PW2vPHSdLcbUUCXN
	 xmwaU56ZZ3e7t5NnKD4P8uVz4EJuGe63faWTe5HhcnmpxjyDyMjVu4CgFnsTHSgFuh
	 RIHHXiOP8pK0g==
Date: Mon, 25 Aug 2025 12:35:08 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Dixit Parmar <dixitparmar19@gmail.com>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen
 <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, Ray
 Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Support Opensource <support.opensource@diasemi.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Haibo Chen
 <haibo.chen@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Cai Huoqing <cai.huoqing@linux.dev>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Andreas Klinger <ak@it-klinger.de>, Crt
 Mori <cmo@melexis.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 04/10] iio: health: Drop unnecessary -ENOMEM messages
Message-ID: <20250825123508.7f9e9271@jic23-huawei>
In-Reply-To: <20250822-enomam_logs-v1-4-db87f2974552@gmail.com>
References: <20250822-enomam_logs-v1-0-db87f2974552@gmail.com>
	<20250822-enomam_logs-v1-4-db87f2974552@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_043524_331611_FB30B7C0 
X-CRM114-Status: GOOD (  17.41  )
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

On Fri, 22 Aug 2025 09:19:52 +0530
Dixit Parmar <dixitparmar19@gmail.com> wrote:

> The drivers do not require their own error messages for error
> -ENOMEM, memory allocation failures. So remove the dev_err
> messages from the probe().
> 
> Signed-off-by: Dixit Parmar <dixitparmar19@gmail.com>
Some code movement in here so I had applied the equivalent.

J
> ---
>  drivers/iio/health/afe4403.c | 4 +---
>  drivers/iio/health/afe4404.c | 4 +---
>  2 files changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/iio/health/afe4403.c b/drivers/iio/health/afe4403.c
> index 1582cfc03579..8e5db2235de0 100644
> --- a/drivers/iio/health/afe4403.c
> +++ b/drivers/iio/health/afe4403.c
> @@ -531,10 +531,8 @@ static int afe4403_probe(struct spi_device *spi)
>  						   "%s-dev%d",
>  						   indio_dev->name,
>  						   iio_device_id(indio_dev));
> -		if (!afe->trig) {
> -			dev_err(afe->dev, "Unable to allocate IIO trigger\n");
> +		if (!afe->trig)
>  			return -ENOMEM;
> -		}
>  
>  		iio_trigger_set_drvdata(afe->trig, indio_dev);
>  
> diff --git a/drivers/iio/health/afe4404.c b/drivers/iio/health/afe4404.c
> index 99ff68aed27c..11a0f465fd68 100644
> --- a/drivers/iio/health/afe4404.c
> +++ b/drivers/iio/health/afe4404.c
> @@ -538,10 +538,8 @@ static int afe4404_probe(struct i2c_client *client)
>  						   "%s-dev%d",
>  						   indio_dev->name,
>  						   iio_device_id(indio_dev));
> -		if (!afe->trig) {
> -			dev_err(afe->dev, "Unable to allocate IIO trigger\n");
> +		if (!afe->trig)
>  			return -ENOMEM;
> -		}
>  
>  		iio_trigger_set_drvdata(afe->trig, indio_dev);
>  
> 


