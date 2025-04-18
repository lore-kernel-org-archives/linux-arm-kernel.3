Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF83C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 15:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wzXJHRI4Nv+Jdosxy97jHtP9UCAHfFRdyvLWEtu7VQY=; b=IF2SFSMVcKfgjwEcXCuc/HbwMc
	E0ctOc9d9EdfWF5RA1mfQAd1yVJ212of9KtSuPit2PsKT/XtPr9FwLX/rqVX7QpRlCg0NHC/wRdf9
	CWQvqpdx/pbpYeoaBJoXgPN2SjggnjI14HUNmOUliICG3DJpGQvQB4ke1B2bZYHRTVJAX/KYmSH8I
	pHUAKN9d0R77gBX53FIvwKeM+6IKsyE+B/PIT9iv/SYpFWndeKu0RNqpfvCu68WrDffUndK7rL+OX
	qjcrXwR5cp0SqEhVLg8PHFKVOuGiMo8tGdSEbtHvG31eq9sphFC0095I7Mk5ZRgsstw40suGLqyr4
	49yf/DBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5nTG-0000000GdOa-1QSa;
	Fri, 18 Apr 2025 15:17:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5nO4-0000000GbRr-0IkK;
	Fri, 18 Apr 2025 15:12:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9949161120;
	Fri, 18 Apr 2025 15:11:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB1EDC4CEE2;
	Fri, 18 Apr 2025 15:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744989135;
	bh=3zBMbevmftHKgtZjXChlH+4wGCH2oPPjVAd5sR/b+a8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=XmmkpSQg9Be6kXQaDSItIU+t/NedTQxFVGDKh2Xee68mDbgHJs7aoYzuE1Roej7NC
	 zfUBEFqp60rjQ/HmJ/aVpERhug+/TBUtXBRwYDRpZXNaO2Xhfh8CD/MyJ6QAdrHMCn
	 8JJBa8hD3/FFezgjrDkFV5M+PxVr0lMCLIYxx6uC6pcx7nXofbpO/zgzZWvzBozPTQ
	 6ZxvJ1Hx+0vbnrvcTPYdiQxdWKw22zjbhDvss+lK6nw6OJc8xYy+dnhhgTj4xRrbQJ
	 n5Nh+AUmzWbbnijWxaJ17cPGqyZQt1FHUPZjdjmRoGmt9iNRNUD8053yroEvDu9apJ
	 oP2+caXkZk2SA==
Date: Fri, 18 Apr 2025 16:12:05 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Cc: Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko
 <andy@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Cosmin Tanislav
 <cosmin.tanislav@analog.com>, Tomasz Duszynski <tduszyns@gmail.com>,
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, Andreas Klinger
 <ak@it-klinger.de>, Petre Rodan <petre.rodan@subdimension.ro>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 0/8] iio: more timestamp alignment
Message-ID: <20250418161205.23a30da9@jic23-huawei>
In-Reply-To: <20250417-iio-more-timestamp-alignment-v1-0-eafac1e22318@baylibre.com>
References: <20250417-iio-more-timestamp-alignment-v1-0-eafac1e22318@baylibre.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
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

On Thu, 17 Apr 2025 11:52:32 -0500
David Lechner <dlechner@baylibre.com> wrote:

> Wile reviewing [1], I noticed a few more cases where we can use
> aligned_s64 or need __aligned(8) on data structures used with
> iio_push_to_buffers_with_timestamp().
> 
> [1]: https://lore.kernel.org/linux-iio/20250413103443.2420727-1-jic23@kernel.org/
I picked up via one or other branch all but 1 (as that was already fixed), 6 and 8

Jonathan

> 
> Signed-off-by: David Lechner <dlechner@baylibre.com>
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


