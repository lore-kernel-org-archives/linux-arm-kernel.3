Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B6ECC982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 21:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y0SzIkkSBKfu/AxHDR83Lgh1/qGoUsppxH+ZJjLMZNc=; b=i0t9bMkfVrf+UYUc89nui1pf3R
	/F/Qsms7YYvA78X6OHmmHSYtLZeq55lHCir7N7jripnT85qxAyI1NHnBgxw5jinNgxBpFyIoNmqb1
	AakyRnzfjCbnODr9x/e1jY9baeUdxqmmkF1oLP0fhBFWhMNHqPxlGsOfQhkTFUSyOuAsSEhZZCc62
	WjOBjd1zTzVcsLapKdFH6J90CqC6+46T7rqCRNFir+rKamU+SmtIz45tBj1hr8hpwobBoRNyKbMI2
	LmU+TfmgRa8jFIHfpuEzuE8ZUTbV9kw/uH43Pktxp+q/iQgvobldYgxpymL9Itravp4GTL65PwB6k
	lR4u0TQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ftE-0000000FYQS-1pej;
	Fri, 18 Sep 2026 21:13:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ftD-0000000FYQM-11cP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 21:12:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 568896053B;
	Fri, 18 Sep 2026 21:12:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C810B1F00898;
	Fri, 18 Sep 2026 21:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789765978;
	bh=y0SzIkkSBKfu/AxHDR83Lgh1/qGoUsppxH+ZJjLMZNc=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=Y3iVVvtRPvtkHKUcFB+YOvt3WWnI5ExAUHksCFjRykPYrqJgJgJ8uvDKDGwSRgerY
	 AEORAydSUlVvfh54jXzbO2SpFApUeTFDdpwFtM5sGtwjkD21sP/ZQWNnSHDM2BdeM3
	 dxBA6lUlsILstz81senwCuL2ULNwP6/XARl7vahZtHBiwbmXG7neC2JtoTXwZd0AzU
	 G5m1l+4+uJb0PtBqeV2IMp7ql9/ikQHPbhNpum2rfCgwbTGsQRsBWzS+yFTwUASE2L
	 bkt6+yicW6LwWSTt/h3Iw58CPVMiglc5DsNQWgfvQsMc5UfMYcdTUdV5ToxK4wdk7l
	 DJmUAT5tovvPA==
Message-ID: <602a9221-1939-420d-8305-53454269d398@kernel.org>
Date: Fri, 18 Sep 2026 22:12:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/17] nvmem: add DEFINE_FREE for nvmem_cell_put
 cleanup
To: Varshini Rajendran <varshini.rajendran@microchip.com>,
 ehristev@kernel.org, jic23@kernel.org, dlechner@baylibre.com,
 nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, srini@kernel.org,
 marcelo.schmitt@analog.com, radu.sabau@analog.com, joshua.crofts1@gmail.com,
 jorge.marques@analog.com, Jonathan.Santos@analog.com,
 jishnu.prakash@oss.qualcomm.com, antoniu.miclaus@analog.com,
 duje@dujemihanovic.xyz, mazziesaccount@gmail.com, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260806074024.531259-1-varshini.rajendran@microchip.com>
 <20260806074024.531259-3-varshini.rajendran@microchip.com>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20260806074024.531259-3-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=UTF-8
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



On 8/6/26 8:40 AM, Varshini Rajendran wrote:
> Add cleanup.h helper for nvmem_cell_put() to enable automatic resource
> cleanup using __free(nvmem_cell_put) annotation.
> 
> Use IS_ERR_OR_NULL() since nvmem_cell_get() can return error pointers,
> and passing an ERR_PTR to nvmem_cell_put() would cause issues.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---

lgtm,

Acked-by: Srinivas Kandagatla <srini@kernel.org>


This series has multiple sub-system patches, who do you want to proceed
with this?

--srini

>  include/linux/nvmem-consumer.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/linux/nvmem-consumer.h b/include/linux/nvmem-consumer.h
> index 34c0e58dfa26..5315bd862f5f 100644
> --- a/include/linux/nvmem-consumer.h
> +++ b/include/linux/nvmem-consumer.h
> @@ -9,6 +9,7 @@
>  #ifndef _LINUX_NVMEM_CONSUMER_H
>  #define _LINUX_NVMEM_CONSUMER_H
>  
> +#include <linux/cleanup.h>
>  #include <linux/err.h>
>  #include <linux/errno.h>
>  #include <linux/notifier.h>
> @@ -243,6 +244,8 @@ static inline struct nvmem_device *nvmem_device_find(void *data,
>  
>  #endif /* CONFIG_NVMEM */
>  
> +DEFINE_FREE(nvmem_cell_put, struct nvmem_cell *, if (!IS_ERR_OR_NULL(_T)) nvmem_cell_put(_T))
> +
>  #if IS_ENABLED(CONFIG_NVMEM) && IS_ENABLED(CONFIG_OF)
>  struct nvmem_cell *of_nvmem_cell_get(struct device_node *np,
>  				     const char *id);


