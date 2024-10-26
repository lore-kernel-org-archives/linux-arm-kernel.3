Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5CBCD10BF6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Oct 2024 12:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hNo4MGHmlnvfvzAfEEglyjPzqpgo7M7o7lEQlKho1Dg=; b=m7OjBVK/drdA+S3j5YWEDARYir
	tEUv1kqtWjI43Ou4+kHXVta2yygXGDhCz5jfjU4wjoDb5bc2cV3J9/+EDNit2UpQHi0P7SwMYFR3e
	PEOYRLeBcE6zgv04HYqgYNcxLYsdPoVTG1umN9bp/VaUr50J42eZO0uHryf/g9T4cRVhsa0EyeZA+
	zSa0NRleiGXxh+XZQtRmVv+VTaQHswDlI0KjHQDG0BSXVw7uE8Q/MgxcUVBY7sDxSnEhkmG+ZTVF9
	fC7NYZwXEK5kPQvLhPUbMq6lSIRebY8RE0fr7I6Kz/UcP6ItWEfybQecLCRNe1HHLJhPA++V8wGIx
	WvJZcVGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4fqZ-00000006bqd-1LY0;
	Sat, 26 Oct 2024 12:24:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4foV-00000006baJ-0oL2
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 26 Oct 2024 12:22:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=hNo4MGHmlnvfvzAfEEglyjPzqpgo7M7o7lEQlKho1Dg=; b=NTYUheNUJkqeYDHNwfIaEomma2
	Ff8l3sT0Qd8z3fxLOWtBOUGxf/0TFiqfb1QeWMgjDepy7a1aiMw7IOoyQQP6ZbWeHMtUF7GeXibob
	Rzt4dFo9P3If2GVJtQdMQyU+9l2IUDnGGdAGX8OAnV1uCEY2zapm6ytJp5O0M7ppPBpl+B8hy1d8S
	zr+rI8ybmYzTzziIByrZNL1tQ2Jkx6P+H00VSKGt8u4+DYCMNOia55Jq4eztJ5DfIrjvjLAgkYTUB
	lVmxu/KIrO9JNYjhsSrPeaXVrm2zCMC0Ap73uirpFsAPbSEN77b+vS9ILFsFp9Vp5CCSDCcSUIMIM
	3nHYiZiA==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4foS-00000009Eal-0rcO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Oct 2024 12:22:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6DEF4A4082B;
	Sat, 26 Oct 2024 12:20:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 873FAC4CEC6;
	Sat, 26 Oct 2024 12:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729945350;
	bh=nN9ySBQFhI6eChKsKY01UO/86r/vMQHDkXXeMgpaQuM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hEOeoPESHoSNQTqbqubJnp5p1c4P0R4aVFF9XaRXSalTHz/vjsXFMwWmCjCkMIVqK
	 DrptHqyoqXrMwF5gMZibAYCrs3Laqsh2YAlynRDlADU/NFYpHWb6uJfUHhiu4SZreu
	 5E7yKePUlRwgCfK7Xbi6T0tu5VqnlHze9AK5fVNlSpbUQIVDbHT+DkU8ejkNSpwEjV
	 IB1T0YGgx8ZZlR8ymYbJ6U8+xDDEpz/+5qlmHsWXVh/akxFMmkialIOfzHWSo5Og52
	 Iy8apVUzzUfCPnU1CsVyViSRphyyd9kNho4hWA003vwp7TTzgBMGxfkqtOrLI0ZirY
	 cc9/Z6q4wXjnA==
Date: Sat, 26 Oct 2024 13:22:04 +0100
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
Subject: Re: [PATCH 2/7] iio: light: ltr390: simplify code in
 write_event_config callback
Message-ID: <20241026132204.4466fb54@jic23-huawei>
In-Reply-To: <20241024-iio-fix-write-event-config-signature-v1-2-7d29e5a31b00@baylibre.com>
References: <20241024-iio-fix-write-event-config-signature-v1-0-7d29e5a31b00@baylibre.com>
	<20241024-iio-fix-write-event-config-signature-v1-2-7d29e5a31b00@baylibre.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241026_132236_477346_29413956 
X-CRM114-Status: GOOD (  15.20  )
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

On Thu, 24 Oct 2024 11:11:24 +0200
Julien Stephan <jstephan@baylibre.com> wrote:

> iio_ev_state_store is actually using kstrtobool to check user
> input, then gives the converted boolean value to the write_event_config
> callback.
> 
> Remove useless code in write_event_config callback.
> 
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
>  drivers/iio/light/ltr390.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/iio/light/ltr390.c b/drivers/iio/light/ltr390.c
> index 8e0a3fc3d923a6f65d2a629c87e7bfd35d82a507..ff6b5d8b582b33eba60b769dff529caa00fb7244 100644
> --- a/drivers/iio/light/ltr390.c
> +++ b/drivers/iio/light/ltr390.c
> @@ -558,9 +558,6 @@ static int ltr390_write_event_config(struct iio_dev *indio_dev,
>  	struct ltr390_data *data = iio_priv(indio_dev);
>  	int ret;
>  
> -	if (state != 1  && state != 0)
> -		return -EINVAL;
> -
>  	if (state == 0)

Once you apply the final patch, the == 0 here will make less sense.
Can tidy that up here or in that final patch by just making this
if (!state) etc

>  		return regmap_clear_bits(data->regmap, LTR390_INT_CFG, LTR390_LS_INT_EN);
>  
> 


