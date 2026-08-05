Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB3DC55184
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 00:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xwWhxSFvLCrAUwUCJ+/6aXjbM/H8cn7WFr737NnKdX0=; b=lVflpZjmneDmt3opWD7HSsLdW1
	UtfuZ2PYNzivo1ugVKlrHLtxQ0C+ICxnSOqklsKaiC86sqwgibPD/4N1Ep0IzH4U98RsfW+A2NI00
	wW/cAlLDVL8ob/rWNfUrQUHZ0V/bX0oDJOHWMqxjMRXg0xYSQ2qI3ycvmKqJ/bRPDCu75YvP3UJCb
	huSNi/+vLkam25rQd/zjLdbuWYVZxGYM54Q/YumAnXBAsgiqVdw8n95MMYA5WIFQ9MvBH4dFunsHy
	Q3uDxDqr6VXrs7T2LCdr+hSFCBcaFnSbWO7oZmWDNwcfko6B0aciTu/jISLAjWxDVGHoW0HjfoPDC
	zayIYiwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrPei-00000002yzN-21Fx;
	Wed, 05 Aug 2026 00:38:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrPeg-00000002yz3-3nYx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 00:38:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2F73F60052;
	Wed,  5 Aug 2026 00:38:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24A8B1F000E9;
	Wed,  5 Aug 2026 00:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785890325;
	bh=xwWhxSFvLCrAUwUCJ+/6aXjbM/H8cn7WFr737NnKdX0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=kOhnKpPBPhfcceK4xplZklrx2yTbvA7rih4xFdnm1XalpUqizU54/L64dthiGTCU5
	 x+2ahrHGwJS3RppA1jIDB1obkV4xlwnBDkUgPcyEn8RpUhH3b3KsuTmIAve5CjnS1I
	 9+TBlimr84GLFij6q672vaNgQRcU2GdOxYRDyDYGuVbtLV0nxWk98NAXcmESw2yGdH
	 zsHcBFPtGBbNjcWXkoYkYLFY2/v26UC1a6wLHQYb/PD2gA6nykJlV+KEq8IzdxIeBi
	 r4iEWl4b9p48F6JesS9ozneQ0wxYQ1ugiriXjePPETEiVZ3O0upDEzpSm7Xh9aiPPo
	 iwecQpkfIdmEQ==
Date: Wed, 5 Aug 2026 01:38:39 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Varshini Rajendran <varshini.rajendran@microchip.com>
Cc: <ehristev@kernel.org>, <dlechner@baylibre.com>, <nuno.sa@analog.com>,
 <andy@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
 <srini@kernel.org>, <marcelo.schmitt@analog.com>, <radu.sabau@analog.com>,
 <joshua.crofts1@gmail.com>, <jorge.marques@analog.com>,
 <Jonathan.Santos@analog.com>, <jishnu.prakash@oss.qualcomm.com>,
 <antoniu.miclaus@analog.com>, <duje@dujemihanovic.xyz>,
 <mazziesaccount@gmail.com>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 02/17] nvmem: add DEFINE_FREE for nvmem_cell_put
 cleanup
Message-ID: <20260805013839.1c4d10f9@jic23-huawei>
In-Reply-To: <20260804113338.261782-3-varshini.rajendran@microchip.com>
References: <20260804113338.261782-1-varshini.rajendran@microchip.com>
	<20260804113338.261782-3-varshini.rajendran@microchip.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Tue, 4 Aug 2026 17:03:23 +0530
Varshini Rajendran <varshini.rajendran@microchip.com> wrote:

> Add cleanup.h helper for nvmem_cell_put() to enable automatic resource
> cleanup using __free(nvmem_cell_put) annotation.
> 
> Use IS_ERR_OR_NULL() since nvmem_cell_get() can return error pointers,
> and passing an ERR_PTR to nvmem_cell_put() would cause issues.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
https://sashiko.dev/#/patchset/20260804113338.261782-1-varshini.rajendran%40microchip.com
Has a question about whether this should be available when
!CONFIG_NVMEM

Seems like a reasonable suggestion to me given nvmem_cell_put() is stubbed
out.

Jonathan

> ---
>  include/linux/nvmem-consumer.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/include/linux/nvmem-consumer.h b/include/linux/nvmem-consumer.h
> index 34c0e58dfa26..35a2ea8b8957 100644
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
> @@ -54,6 +55,9 @@ struct nvmem_cell *nvmem_cell_get(struct device *dev, const char *id);
>  struct nvmem_cell *devm_nvmem_cell_get(struct device *dev, const char *id);
>  void nvmem_cell_put(struct nvmem_cell *cell);
>  void devm_nvmem_cell_put(struct device *dev, struct nvmem_cell *cell);
> +
> +DEFINE_FREE(nvmem_cell_put, struct nvmem_cell *, if (!IS_ERR_OR_NULL(_T)) nvmem_cell_put(_T))
> +
>  void *nvmem_cell_read(struct nvmem_cell *cell, size_t *len);
>  int nvmem_cell_write(struct nvmem_cell *cell, void *buf, size_t len);
>  int nvmem_cell_read_u8(struct device *dev, const char *cell_id, u8 *val);


