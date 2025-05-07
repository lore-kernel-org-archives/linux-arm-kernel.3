Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC938C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 20:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QYpT8xPggjLgVwGHA4ksr1+8mbcUIcSfnFYvdoU9A58=; b=aItJuaCgBtHo0LtoxXmT/Rcrpw
	c+rKRckwj5Bcg4NnJJSy1o87M3mklN9CH++zWPwLkWrod9n4Z+tjS5C8W13XdfP4FgDdDB5CRubH0
	1aXn1P15S5GhN+bwAOPFBMU6AjGdr+IR9HVzRxqRd2dDIpRlXfUu73qb3Gpdr3wGjOBiRkisvR04H
	hvLx6NGGtY69CPMLbvcqlzn2hHP6NUChHdEfiGMKVP4fJHO5KEnVLDJksAvnd5jc1Bo6m0sJQxtNd
	ctoR+IS3XaqUiv3hlxeq3cZ+RnO1Bmbkd+JBrf0oGIXpG0P7JrAtjSyWJzVFYWwT2pLJUwITrMLcR
	J+j/wtEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCl1E-0000000Ge9d-3b2y;
	Wed, 07 May 2025 20:05:28 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCkyf-0000000Gdul-306g
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 20:02:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EAB96A4DB08;
	Wed,  7 May 2025 20:02:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 473DFC4CEE2;
	Wed,  7 May 2025 20:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746648168;
	bh=q+4Vm1PYBH6CIdNM0Gw2b0w1O7TXzA+u8T153cPkbyY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OcX6uh3HhrZUHz+qYg8oXuS0Ko0agKZkUuL1RFxiOAO3blr43KaqIGb2+eI/jY+tl
	 h+bcuT4qABfWls3iQ4+lYNE7mJrE6WTb+oIo3VI40QbjUc7ZxHe7841+jZUYERDbp7
	 ZJ/xiCMwKUKPC8lIuH7YI71oNj/akff4FMmQzfT8tWY1ktMCV0M/aqAutxqn3rv0jB
	 41qMsriP5NiAXQcScDxm90Pb8PIpx51gWQbGpKupwa0mdDHKP8/glTmCjte/ST1byj
	 muPicNCBuvzJ+xpzeXocCuFQJrAUH29Qv5TL7C1l1raxOhovKwqHLXY8HUzeUOcOvT
	 TVGw+GqphxaPQ==
Date: Wed, 7 May 2025 21:02:39 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Cc: Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko
 <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Eugen Hristev <eugen.hristev@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 1/7] iio: make IIO_DMA_MINALIGN minimum of 8 bytes
Message-ID: <20250507210239.138b3e0a@jic23-huawei>
In-Reply-To: <20250505-iio-introduce-iio_declare_buffer_with_ts-v5-1-814b72b1cae3@baylibre.com>
References: <20250505-iio-introduce-iio_declare_buffer_with_ts-v5-0-814b72b1cae3@baylibre.com>
	<20250505-iio-introduce-iio_declare_buffer_with_ts-v5-1-814b72b1cae3@baylibre.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_130249_891683_1B315ADD 
X-CRM114-Status: GOOD (  22.42  )
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

On Mon, 05 May 2025 11:31:42 -0500
David Lechner <dlechner@baylibre.com> wrote:

> Add a condition to ensure that IIO_DMA_MINALIGN is at least 8 bytes.
> On some 32-bit architectures, IIO_DMA_MINALIGN is 4. In many cases,
> drivers are using this alignment for buffers that include a 64-bit
> timestamp that is used with iio_push_to_buffers_with_ts(), which expects
> the timestamp to be aligned to 8 bytes. To handle this, we can just make
> IIO_DMA_MINALIGN at least 8 bytes.
> 
> Signed-off-by: David Lechner <dlechner@baylibre.com>
Dropped again...

In file included from drivers/input/touchscreen/tsc2007_iio.c:8:
./include/linux/iio/iio.h:784:5: warning: '__alignof__' is not defined, evaluates to 0 [-Wundef]
  784 | #if ARCH_DMA_MINALIGN < sizeof(s64)
      |     ^
./include/linux/cache.h:181:27: note: expanded from macro 'ARCH_DMA_MINALIGN'
  181 | #define ARCH_DMAmake[3]: *** [scripts/Makefile.build:461: drivers/hid] Error 2
_MINALIGN __alignof__(unsigned long long)
      |                           ^
In file included from drivers/input/touchscreen/tsc2007_iio.c:8:
./include/linux/iio/iio.h:784:5: error: function-like macro '__alignof__' is not defined
./include/linux/cache.h:181:27: note: expanded from macro 'ARCH_DMA_MINALIGN'
  181 | #define ARCH_DMA_MINALIGN __alignof__(unsigned long long)
      |   

With an LLVM build on x86.

> ---
>  include/linux/iio/iio.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
> index 638cf2420fbd85cf2924d09d061df601d1d4bb2a..7e1e3739328d103262071bd34ba5f6631163c122 100644
> --- a/include/linux/iio/iio.h
> +++ b/include/linux/iio/iio.h
> @@ -775,8 +775,18 @@ static inline void *iio_device_get_drvdata(const struct iio_dev *indio_dev)
>   * to in turn include IIO_DMA_MINALIGN'd elements such as buffers which
>   * must not share  cachelines with the rest of the structure, thus making
>   * them safe for use with non-coherent DMA.
> + *
> + * A number of drivers also use this on buffers that include a 64-bit timestamp
> + * that is used with iio_push_to_buffer_with_ts(). Therefore, in the case where
> + * DMA alignment is not sufficient for proper timestamp alignment, we align to
> + * 8 bytes instead.
>   */
> +#if ARCH_DMA_MINALIGN < sizeof(s64)
> +#define IIO_DMA_MINALIGN sizeof(s64)
> +#else
>  #define IIO_DMA_MINALIGN ARCH_DMA_MINALIGN
> +#endif
> +
>  struct iio_dev *iio_device_alloc(struct device *parent, int sizeof_priv);
>  
>  /* The information at the returned address is guaranteed to be cacheline aligned */
> 


