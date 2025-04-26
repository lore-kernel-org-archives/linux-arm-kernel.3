Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF869C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 11:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/CSzjC2sTbKPRVCvYy/1cpgxU0NvDZ8x/QFhN5oU4eU=; b=eeXdtZ6x+g5UTZVt8yDLjO8Ae9
	MTc0SJyuIOIU8Xij/VV2mmXTQiLEpgqkJB60w9e92DfJ7HB1Usl/6Q56nYGF2nnzy/gEdR/aXR/A6
	2T2xvEHygTmXyjrywvg1cRNtSRr0AzGoTBgVMeOEvp0dcQCeDur01kqlLb7+z0zGzFs4ISSxxqYHp
	8cz8mOfXBmow459GMmhdfqL9tkf4U4yyYiWTpFyABCpAMMXxVeElshgiayS7hug2SWefsqXZarjx8
	IXCG+lrbjfxiRBHh4WmJq+6diPW0jg4NvLuKev3A6YJO7II1aenwa5UgqBmgnE7SWVQmcZsoGgthy
	6Qu8flyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8dqM-00000001wNY-2S79;
	Sat, 26 Apr 2025 11:37:14 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8doV-00000001wDI-3MdO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Apr 2025 11:35:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 04C34A4D0AA;
	Sat, 26 Apr 2025 11:29:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74F7DC4CEE2;
	Sat, 26 Apr 2025 11:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745667318;
	bh=W5+9Ox8Zfwkqoo1wtMpLkQdOALYNITyDBGxiimDOcgo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=g/MczSbQSQ044Au5V+WIXPOi99BlpoIK8a5nH0UwMKC7lxZVZw1PkYexMWdvB718I
	 yVDqc55UwCECNOI++NgMgtVG/0WCDf2FW8kvgMZgSE3pVaja/ekwYmNUJ8w1Ng7xXO
	 117U43pqKc9gBvekkYM2EkLNywj2JXNyjIJNYinWRtL5AzmP9rnK2933aKTW33KWc1
	 WU5BvmkrSk3Lrfa8HI6W38CAwRe1mrUecnhA++VgpGM9U32Cs0aPFxt2H+5qaP9ADt
	 AM4E65EN/Iva0jHtft0GdBt4Utkp3vjZZ9FOUJEyMTApqV6pdngSQVhUnRQicVp2po
	 mqYsBcxhxUkFA==
Date: Sat, 26 Apr 2025 12:35:09 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Cc: Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko
 <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Eugen Hristev <eugen.hristev@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/6] iio: introduce IIO_DECLARE_BUFFER_WITH_TS macros
Message-ID: <20250426123509.0b04f0f9@jic23-huawei>
In-Reply-To: <20250425-iio-introduce-iio_declare_buffer_with_ts-v3-1-f12df1bff248@baylibre.com>
References: <20250425-iio-introduce-iio_declare_buffer_with_ts-v3-0-f12df1bff248@baylibre.com>
	<20250425-iio-introduce-iio_declare_buffer_with_ts-v3-1-f12df1bff248@baylibre.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_043519_975465_E1371CE1 
X-CRM114-Status: GOOD (  27.08  )
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

On Fri, 25 Apr 2025 16:08:43 -0500
David Lechner <dlechner@baylibre.com> wrote:

> Add new macros to help with the common case of declaring a buffer that
> is safe to use with iio_push_to_buffers_with_ts(). This is not trivial
> to do correctly because of the alignment requirements of the timestamp.
> This will make it easier for both authors and reviewers.
> 
> To avoid double __align() attributes in cases where we also need DMA
> alignment, add a 2nd variant IIO_DECLARE_DMA_BUFFER_WITH_TS().
> 
Generally good.  A few little things though...

> Signed-off-by: David Lechner <dlechner@baylibre.com>
> ---
> 
> v3 changes:
> * Use leading double-underscore for "private" macro to match "private"
>   functions that do the same.
> * Use static_assert() from linux/build_bug.h instead of _Static_assert()
> * Fix incorrectly using sizeof(IIO_DMA_MINALIGN).
> * Add check that count argument is constant. (Note, I didn't include a
>   message in this static assert because it already gives a reasonable
>   message.)
> 
> /home/david/work/bl/linux/drivers/iio/accel/sca3300.c:482:51: error: expression in static assertion is not constant
>   482 |         IIO_DECLARE_BUFFER_WITH_TS(s16, channels, val);
>       |                                                   ^~~
> 
> v2 changes:
> * Add 2nd macro for DMA alignment
> ---
>  include/linux/iio/iio.h | 38 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
> index 638cf2420fbd85cf2924d09d061df601d1d4bb2a..1115b219271b76792539931edc404a67549bd8b1 100644
> --- a/include/linux/iio/iio.h
> +++ b/include/linux/iio/iio.h
> @@ -7,6 +7,8 @@
>  #ifndef _INDUSTRIAL_IO_H_
>  #define _INDUSTRIAL_IO_H_
>  
> +#include <linux/align.h>
> +#include <linux/build_bug.h>
>  #include <linux/device.h>
>  #include <linux/cdev.h>
>  #include <linux/compiler_types.h>
> @@ -777,6 +779,42 @@ static inline void *iio_device_get_drvdata(const struct iio_dev *indio_dev)
>   * them safe for use with non-coherent DMA.
>   */
>  #define IIO_DMA_MINALIGN ARCH_DMA_MINALIGN
> +
> +#define __IIO_DECLARE_BUFFER_WITH_TS(type, name, count) \
> +	static_assert(count); \

Why do we care if count is 0?  Or is intent to check if is constant?
If the thought is we don't care either way about 0 (as rather nonsensical)
and this will fail to compile if not constant, then perhaps a comment would
avoid future confusion?

> +	type name[ALIGN((count), sizeof(s64) / sizeof(type)) + sizeof(s64) / sizeof(type)]
> +
> +/**
> + * IIO_DECLARE_BUFFER_WITH_TS() - Declare a buffer with timestamp
> + * @type: element type of the buffer
> + * @name: identifier name of the buffer
> + * @count: number of elements in the buffer
> + *
> + * Declares a buffer that is safe to use with iio_push_to_buffer_with_ts(). In
> + * addition to allocating enough space for @count elements of @type, it also
> + * allocates space for a s64 timestamp at the end of the buffer and ensures
> + * proper alignment of the timestamp.
> + */
> +#define IIO_DECLARE_BUFFER_WITH_TS(type, name, count) \
> +	__IIO_DECLARE_BUFFER_WITH_TS(type, name, count) __aligned(sizeof(s64))
> +
> +/**
> + * IIO_DECLARE_DMA_BUFFER_WITH_TS() - Declare a DMA-aligned buffer with timestamp
> + * @type: element type of the buffer
> + * @name: identifier name of the buffer
> + * @count: number of elements in the buffer
> + *
> + * Same as IIO_DECLARE_BUFFER_WITH_TS(), but is uses __aligned(IIO_DMA_MINALIGN)
> + * to ensure that the buffer doesn't share cachelines with anything that comes
> + * before it in a struct. This should not be used for stack-allocated buffers
> + * as stack memory cannot generally be used for DMA.
> + */
> +#define IIO_DECLARE_DMA_BUFFER_WITH_TS(type, name, count) \
> +	__IIO_DECLARE_BUFFER_WITH_TS(type, name, count) __aligned(IIO_DMA_MINALIGN)
> +
> +static_assert(IIO_DMA_MINALIGN % sizeof(s64) == 0,
That message isn't super helpful if seen in a compile log as we aren't reading the code here
"IIO_DECLARE_DMA_BUFFER_WITH_TS() assumes that ...

> +	"macros above assume that IIO_DMA_MINALIGN also ensures s64 timestamp alignment");
> +
>  struct iio_dev *iio_device_alloc(struct device *parent, int sizeof_priv);
>  
>  /* The information at the returned address is guaranteed to be cacheline aligned */
> 


