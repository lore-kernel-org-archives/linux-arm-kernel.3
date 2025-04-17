Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C11C369C9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 18:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ecnj2zDTOiyy1RfeybYhp0dG+5dokwfjlp6yCchtpCw=; b=1kPb7b8/t1PBbhTeQvd1fJPV0J
	6i37J1yA1vRPimWLzYSzyFiIgApNXf+RTczn83nyAbVk+LwoHSku4rXAU4i3qOEA8cYXwWELzraZb
	hFhegFjcR+JPhHGZR3OF/lyR/XU13xPrY8VN+3GvajoUd8IqpPoY4z4NoCOxTf2XmWewwU6iQsJxi
	q1rzV1poj0UwEkVlwuqR3ZBOcJI9fIUtr5kkXECTZ9MpMRzMMlVwxKC9cva25jHfnCBdMdIlblG9C
	9+FtZw4uXNSeSAQnWanGg4GzLfXF1iijs2b+7lDVBkMtlQasopsHrgCSNH1V+hNjPVyFUfHsL4PHs
	iUpX1eVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5TXs-0000000DwxK-2VzK;
	Thu, 17 Apr 2025 18:01:04 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5T4j-0000000DrBs-3nPx;
	Thu, 17 Apr 2025 17:30:59 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZdlF70NSvz6M4gh;
	Fri, 18 Apr 2025 01:26:51 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id C9D32140595;
	Fri, 18 Apr 2025 01:30:51 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 17 Apr
 2025 19:30:51 +0200
Date: Thu, 17 Apr 2025 18:30:49 +0100
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
Subject: Re: [PATCH 0/8] iio: more timestamp alignment
Message-ID: <20250417183049.0000336c@huawei.com>
In-Reply-To: <20250417-iio-more-timestamp-alignment-v1-0-eafac1e22318@baylibre.com>
References: <20250417-iio-more-timestamp-alignment-v1-0-eafac1e22318@baylibre.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500011.china.huawei.com (7.191.174.215) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_103058_087194_67A6A9C7 
X-CRM114-Status: GOOD (  11.42  )
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

On Thu, 17 Apr 2025 11:52:32 -0500
David Lechner <dlechner@baylibre.com> wrote:

> Wile reviewing [1], I noticed a few more cases where we can use
> aligned_s64 or need __aligned(8) on data structures used with
> iio_push_to_buffers_with_timestamp().
> 
> [1]: https://lore.kernel.org/linux-iio/20250413103443.2420727-1-jic23@kernel.org/
> 
> Signed-off-by: David Lechner <dlechner@baylibre.com>

I have a bunch of these in a 'too hard before sending that patch
pile' as well.  Hopefully you've covered many of those :) There
were definitely more bugs than I expected to see when I started that
effort!  I thought we'd tracked all these down long ago :(

Jonathan

> ---
> David Lechner (8):
>       iio: adc: dln2-adc: use aligned_s64 for timestamp
>       iio: adc: mt6360-adc: use aligned_s64 for timestamp
>       iio: addac: ad74413r: use aligned_s64 for timestamp
>       iio: chemical: pms7003: use aligned_s64 for timestamp
>       iio: chemical: sps30: use aligned_s64 for timestamp
>       iio: imu: adis16550: align buffers for timestamp
>       iio: imu: inv_mpu6050: align buffer for timestamp
>       iio: pressure: mprls0025pa: use aligned_s64 for timestamp
> 
>  drivers/iio/accel/bmc150-accel.h           | 2 +-
>  drivers/iio/adc/dln2-adc.c                 | 2 +-
>  drivers/iio/adc/mt6360-adc.c               | 4 ++--
>  drivers/iio/addac/ad74413r.c               | 5 +++--
>  drivers/iio/chemical/pms7003.c             | 5 +++--
>  drivers/iio/chemical/sps30.c               | 2 +-
>  drivers/iio/imu/adis16550.c                | 2 +-
>  drivers/iio/imu/inv_mpu6050/inv_mpu_ring.c | 2 +-
>  drivers/iio/pressure/mprls0025pa.h         | 2 +-
>  9 files changed, 14 insertions(+), 12 deletions(-)
> ---
> base-commit: 3159d40a2ca0ae14e69e1cae8b12f04c933d0445
> change-id: 20250416-iio-more-timestamp-alignment-6c6c6a87ebda
> 
> Best regards,


