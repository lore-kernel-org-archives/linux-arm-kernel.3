Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 479F3C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 19:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SxbU+97HuF9nHurWM9LQhWd4/w6NmzwDV6LumpmTfdE=; b=Z+cEjsfQGq2fmCCGklANFFtG4f
	KcX0NE2kuFDKqN7zNG70a1EHWD/bUuIR9pLw044NMyM2yc9RAc4VTfQvGwRrtyods56LWPc7qy4JQ
	IW7C5/vEiP1SInMxEqSXU+OHY8m3E0CO3N9U2XjABvLgt0g4w1EY9Z6Je3wQtQNb97M7QwAbdTTPO
	RvHbu3mD4QoNZGVwAQNFMR+ub+JS2C+LBtSi0qC97lwxbH08jQ6EUYoSq2Y1iiFerk/HqJG7fMNWV
	HIGNY0nzPitTyuW8vr9G/PyM819Kf/BxwHz1/l+GlOBKzI9y1+lM21Jl5WcIzvuGjfg4ldEtc3xhw
	8TNOv+eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD6ih-00000001dK9-1Gno;
	Thu, 08 May 2025 19:15:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD6cq-00000001ceI-1wHQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 19:09:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9F3D3614BA;
	Thu,  8 May 2025 19:09:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9E1CC4CEE7;
	Thu,  8 May 2025 19:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746731383;
	bh=me6txw57vhs5SsbfAubqX6TYDea8ZDjc37uBING6fJo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=C06H33rLlOoM4MMRXNqpurLteNidCyO7g2KSbZZv8gpUv3gbWQPJphmVV2h7BgZtA
	 zEkS9VT7o+j9TB+1TjLY8aBBBbb3LVb9+3TUK0+1ffBG7yHpfCwU83CN6ww9e9cjBm
	 D397oyRg0Fbq3KvaAN2quAE9XFnu/fCshZxhSy1YmTKyu5tNMSfUlf+JikWYRwyPsb
	 CCgR8NwaDhL2n1YfCXmieINf3UWvpJckLFKLxjtgxCPSznwL/QZb+mwevK92ssMRWT
	 zuoWho2URHV/VI7B8JHGSykTxSxCgo5W14NWdYmUin7KOtVDcKAy7jm7Pk/05j674d
	 9WXy5rHAVrIKg==
Date: Thu, 8 May 2025 20:09:33 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Cc: Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko
 <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Eugen Hristev <eugen.hristev@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Trevor Gamblin
 <tgamblin@baylibre.com>
Subject: Re: [PATCH v6 0/7] iio: introduce IIO_DECLARE_BUFFER_WITH_TS
Message-ID: <20250508200933.5b1ad6af@jic23-huawei>
In-Reply-To: <20250507-iio-introduce-iio_declare_buffer_with_ts-v6-0-4aee1b9f1b89@baylibre.com>
References: <20250507-iio-introduce-iio_declare_buffer_with_ts-v6-0-4aee1b9f1b89@baylibre.com>
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

On Wed, 07 May 2025 15:42:39 -0500
David Lechner <dlechner@baylibre.com> wrote:

> Creating a buffer of the proper size and correct alignment for use with
> iio_push_to_buffers_with_ts() is commonly used and not easy to get
> right (as seen by a number of recent fixes on the mailing list).
> 
> In general, we prefer to use this pattern for creating such buffers:
> 
> struct {
>     u16 data[2];
>     aligned_s64 timestamp;
> } buffer;
> 
> However, there are many cases where a driver may have a large number of
> channels that can be optionally enabled or disabled in a scan or the
> driver might support a range of chips that have different numbers of
> channels or different storage sizes for the data. In these cases, the
> timestamp may not always be at the same place relative to the data. To
> handle these, we allocate a buffer large enough for the largest possible
> case and don't care exactly where the timestamp ends up in the buffer.
> 
> For these cases, we propose to introduce new macros to make it easier
> it easier for both the authors to get it right and for readers of the
> code to not have to do all of the math to verify that it is correct.
> 
> I have just included a few examples of drivers that can make use of this
> new macro, but there are dozens more.
> 
Seems better.  Applied and pushed out as testing to see if any other
compiler versions don't like it!

J
> ---
> Changes in v6:
> - Rework IIO_DMA_MINALIGN to work around clang compiler issue.
> - Link to v5: https://lore.kernel.org/r/20250505-iio-introduce-iio_declare_buffer_with_ts-v5-0-814b72b1cae3@baylibre.com
> 
> Changes in v5:
> - Add new patch to set minimum alignment to 8 for IIO_DMA_MINALIGN.
> - Adjust IIO_DECLARE_DMA_BUFFER_WITH_TS() macro for above change.
> - Drop one ad4695 patch that was already applied.
> - Link to v4: https://lore.kernel.org/r/20250428-iio-introduce-iio_declare_buffer_with_ts-v4-0-6f7f6126f1cb@baylibre.com
> 
> Changes in v4:
> - Dropped static_assert()s from the first patch.
> - Handle case when IIO_DMA_MINALIGN < sizeof(timestamp).
> - Added one more patch for ad4695 to rename a confusing macro.
> - Link to v3: https://lore.kernel.org/r/20250425-iio-introduce-iio_declare_buffer_with_ts-v3-0-f12df1bff248@baylibre.com
> 
> Changes in v3:
> - Fixed a few mistakes, style issues and incorporate other feedback (see
>   individual commit message changelogs for details).
> - Link to v2: https://lore.kernel.org/r/20250422-iio-introduce-iio_declare_buffer_with_ts-v2-0-3fd36475c706@baylibre.com
> 
> Changes in v2:
> - Add 2nd macro for case where we need DMA alignment.
> - Add new patch for ad4695 to convert buffer from u8 to u16 before
>   making use of the new macro.
> - Drop the bmp280 patch since it was determined to have a better
>   alternative not using these macros.
> - Add a few more examples to show the non-DMA case, both in a struct and
>   stack allocated.
> - Link to v1: https://lore.kernel.org/r/20250418-iio-introduce-iio_declare_buffer_with_ts-v1-0-ee0c62a33a0f@baylibre.com
> 
> ---
> David Lechner (7):
>       iio: make IIO_DMA_MINALIGN minimum of 8 bytes
>       iio: introduce IIO_DECLARE_BUFFER_WITH_TS macros
>       iio: adc: ad4695: use IIO_DECLARE_DMA_BUFFER_WITH_TS
>       iio: adc: ad4695: rename AD4695_MAX_VIN_CHANNELS
>       iio: adc: ad7380: use IIO_DECLARE_DMA_BUFFER_WITH_TS
>       iio: accel: sca3300: use IIO_DECLARE_BUFFER_WITH_TS
>       iio: adc: at91-sama5d2: use IIO_DECLARE_BUFFER_WITH_TS
> 
>  drivers/iio/accel/sca3300.c        | 18 ++---------------
>  drivers/iio/adc/ad4695.c           | 11 +++++-----
>  drivers/iio/adc/ad7380.c           |  3 +--
>  drivers/iio/adc/at91-sama5d2_adc.c | 13 ++----------
>  include/linux/iio/iio.h            | 41 +++++++++++++++++++++++++++++++++++++-
>  5 files changed, 50 insertions(+), 36 deletions(-)
> ---
> base-commit: 7e9a82ab5b861d3c33c99a22c1245a5b262ee502
> change-id: 20250418-iio-introduce-iio_declare_buffer_with_ts-2f8773f7dad6
> 
> Best regards,


