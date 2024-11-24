Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A4BE668AD
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Nov 2024 13:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rsCroRDoP3xTxJMEPKznCXLu0YWs94ms/bzhIFDJJmg=; b=h2AAjW63TcOBfEvGXdQXjzu5c9
	v2LYhNVRC4OdOr+osCvlEukxcUsHxybMmM4sDQD2Pe6tN6KSGk0pz9kg9cCMS9/5PGPRQ/nzKD6cS
	W2eMeO9Xb1CoHhMoU+JQawQKDuuK5oN90cHvNw7Gsc3h2n5AHgWiS7QuMr1D16RXBMAukIzqQjwwX
	tXSs4EaiibhY63jJZWWd0qYdwtvzaDiiH17tS4e/QRRDl2mqOLE5F17wDN86y0YvAIF1n7PHl8NNa
	128/AQjlVkH3GbWPMa0gzdEQxfRSNoFr9ARcHur9loR8Sn19TRyP7MKZpcnmJJrRJUw6M9vesv/yp
	E4jF5IPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFCNP-00000005rNp-2OHr;
	Sun, 24 Nov 2024 13:10:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFCGJ-00000005phK-1gQi
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Nov 2024 13:02:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3A0FC5C432C;
	Sun, 24 Nov 2024 13:02:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48B6DC4CECC;
	Sun, 24 Nov 2024 13:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732453370;
	bh=V0Bs0Zy6s73HavYwwymncXPcs1ZrjCVcI3abEBI8kTo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kvgsWMVFDc8l3JAe/gPaphm8u9pGpy8kBrXIHOyFRUMmn6TtyoMF6OCneBCQSdacj
	 KsOz6wtjYSXlCCWByw1JHoT6gYN4b7nMm9eqnmYjV0Fs/A1T/1TnHU/oKnoimBro1o
	 b66ii7FId/S2qyMAlFrgv75ppIOA9xULNGtQFbDvWPCB9K4Wh4PsjIpsBk1M5XxYeA
	 oVYt2IYlIVlJNqnYIqF0Xvo5hUvGr1+9rQb2XrXncfUBrlJws11bdcxHg+rb8x7mXh
	 yKF3kL+GqsXuWto+2Es8l38TQKx9RLFtZMNAznpgglzFk6rvQqdUTi26hNL+EAuF/a
	 UkHh1s6pS05Sg==
Date: Sun, 24 Nov 2024 13:02:41 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, <linux-iio@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] iio: adc: stm32-dfsdm: handle label as an optional
 property
Message-ID: <20241124130241.60e922ff@jic23-huawei>
In-Reply-To: <20241114102459.2497178-1-olivier.moysan@foss.st.com>
References: <20241114102459.2497178-1-olivier.moysan@foss.st.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_050251_485493_F98B9AA7 
X-CRM114-Status: GOOD (  20.30  )
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

On Thu, 14 Nov 2024 11:24:59 +0100
Olivier Moysan <olivier.moysan@foss.st.com> wrote:

> The label property is defined as optional in the DFSDM binding.
> Parse the label property only when it is defined in the device tree.
> 
> Fixes: 3208fa0cd919 ("iio: adc: stm32-dfsdm: adopt generic channels bindings")
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
This could be done by just ignoring the return of fw_node_property_read_string()
but your fix will do a little more such as report an error if the property is
the wrong type etc, so I'll take it.

Applied to the fixes-togreg branch of iio.git.

Thanks,

Jonathan

> ---
>  drivers/iio/adc/stm32-dfsdm-adc.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iio/adc/stm32-dfsdm-adc.c b/drivers/iio/adc/stm32-dfsdm-adc.c
> index 2037f73426d4..e304e3714020 100644
> --- a/drivers/iio/adc/stm32-dfsdm-adc.c
> +++ b/drivers/iio/adc/stm32-dfsdm-adc.c
> @@ -691,11 +691,14 @@ static int stm32_dfsdm_generic_channel_parse_of(struct stm32_dfsdm *dfsdm,
>  		return -EINVAL;
>  	}
>  
> -	ret = fwnode_property_read_string(node, "label", &ch->datasheet_name);
> -	if (ret < 0) {
> -		dev_err(&indio_dev->dev,
> -			" Error parsing 'label' for idx %d\n", ch->channel);
> -		return ret;
> +	if (fwnode_property_present(node, "label")) {
> +		/* label is optional */
> +		ret = fwnode_property_read_string(node, "label", &ch->datasheet_name);
> +		if (ret < 0) {
> +			dev_err(&indio_dev->dev,
> +				" Error parsing 'label' for idx %d\n", ch->channel);
> +			return ret;
> +		}
>  	}
>  
>  	df_ch =  &dfsdm->ch_list[ch->channel];


