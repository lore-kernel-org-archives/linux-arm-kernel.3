Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9738AC369CA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 19:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NavMAhX2VAHEbhiYeDnZbQQONqalfAmvIAdt4Hu1Exs=; b=SoAGdz/rNUEa6akH8ukfoafET9
	k4NDuaS/6JG7trMSZU370kbV5dzq7z9wUZgRN2Q3+vKvE6e9ucSzeepiPoDgEhDG0rzMHvhJusfy+
	Na4CutwXEILualPxetXujdUFbRjROYRpElweR4Z7t6IJTHU+AOkk5A+0b0gUXVM9jEcLA3Fj96JBC
	YEqXVCbqKqeeDPEXKB44c32waHptwXIC9c+jJW35/VzipyO0nZP4FOJ41PY6ZjnV8bvaQwF1NmsbB
	PYSB57AKgcNFN0ox5Cq0g5kR740nc1aZK7XKEqsyFYJys5yV8DNRo5AIf55M3uYjiEIGYHTkeUpGa
	Ov7A5tLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Ug2-0000000E9HI-2VCB;
	Thu, 17 Apr 2025 19:13:34 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5T9N-0000000DsTf-3lt4;
	Thu, 17 Apr 2025 17:35:47 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZdlLH61B4z6K8r4;
	Fri, 18 Apr 2025 01:31:19 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 701A5140146;
	Fri, 18 Apr 2025 01:35:37 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 17 Apr
 2025 19:35:36 +0200
Date: Thu, 17 Apr 2025 18:35:35 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: David Lechner <dlechner@baylibre.com>
CC: Jonathan Cameron <jic23@kernel.org>, Nuno =?ISO-8859-1?Q?S=E1?=
	<nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Lars-Peter Clausen
	<lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, "Cosmin
 Tanislav" <cosmin.tanislav@analog.com>, Tomasz Duszynski
	<tduszyns@gmail.com>, Jean-Baptiste Maneyrol
	<jean-baptiste.maneyrol@tdk.com>, Andreas Klinger <ak@it-klinger.de>, "Petre
 Rodan" <petre.rodan@subdimension.ro>, <linux-iio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 4/8] iio: chemical: pms7003: use aligned_s64 for
 timestamp
Message-ID: <20250417183535.00004d87@huawei.com>
In-Reply-To: <20250417-iio-more-timestamp-alignment-v1-4-eafac1e22318@baylibre.com>
References: <20250417-iio-more-timestamp-alignment-v1-0-eafac1e22318@baylibre.com>
	<20250417-iio-more-timestamp-alignment-v1-4-eafac1e22318@baylibre.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500011.china.huawei.com (7.191.174.215) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_103546_082660_1FE979B0 
X-CRM114-Status: GOOD (  18.05  )
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

On Thu, 17 Apr 2025 11:52:36 -0500
David Lechner <dlechner@baylibre.com> wrote:

> Follow the pattern of other drivers and use aligned_s64 for the
> timestamp. This will ensure that the timestamp is correctly aligned on
> all architectures.
> 
> Also move the unaligned.h header while touching this since it was the
> only one not in alphabetical order.
> 
> Signed-off-by: David Lechner <dlechner@baylibre.com>
> ---
>  drivers/iio/chemical/pms7003.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iio/chemical/pms7003.c b/drivers/iio/chemical/pms7003.c
> index d0bd94912e0a3492641acd955adbc2184f4a11b3..e05ce1f12065c65d14b66ab86e291fab47805dec 100644
> --- a/drivers/iio/chemical/pms7003.c
> +++ b/drivers/iio/chemical/pms7003.c
> @@ -5,7 +5,6 @@
>   * Copyright (c) Tomasz Duszynski <tduszyns@gmail.com>
>   */
>  
> -#include <linux/unaligned.h>
>  #include <linux/completion.h>
>  #include <linux/device.h>
>  #include <linux/errno.h>
> @@ -19,6 +18,8 @@
>  #include <linux/module.h>
>  #include <linux/mutex.h>
>  #include <linux/serdev.h>
> +#include <linux/types.h>
> +#include <linux/unaligned.h>
>  
>  #define PMS7003_DRIVER_NAME "pms7003"
>  
> @@ -76,7 +77,7 @@ struct pms7003_state {
>  	/* Used to construct scan to push to the IIO buffer */
>  	struct {
>  		u16 data[3]; /* PM1, PM2P5, PM10 */
> -		s64 ts;
> +		aligned_s64 ts;

Bug I think..  So another one that really needs a fixes tag.
For all these we might be lucky with padding on the allocations
but we shouldn't really rely on that.

>  	} scan;
>  };
>  
> 


