Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD21C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 10:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uOyIk933GD+b7dd6EC2wVjpJI4G+1av0Knj6VFiz1Y8=; b=3Esr+0K2rFdFVSIT7YN2bisb4Z
	z1Da5nc5PeMYTxlBLNwkisguYdB2cwYeqQOr4cDMPgF4cYT3bIS5sdNbsKu+P+QfUrUG6hL8f9yRL
	qXHul78iD4PWl4SEUSofZ0iGHbcozd3lKqxTJllGo39YyuMCh+DATDdsbTij6ixMnPsr3i7EWe1b6
	y0LrscobAmwB6jfi4KK6PNbF9zZRdtYJto9nZe91xm0fEqcGD0rVQx19YGhuZhC5ol+H13l7Btubi
	6ieswiJ/DQaB4bD84wNbNpasADyFb/Fkt2PEml+/L+5ql85jdGIzaE1pyyjoAwreJoWIpMFirfdNK
	wj3unbWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8z9q-00000003LtS-0IgS;
	Sun, 27 Apr 2025 10:22:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8z7u-00000003Lob-3707
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Apr 2025 10:20:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D2CCF5C0C41;
	Sun, 27 Apr 2025 10:18:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C48CEC4CEE3;
	Sun, 27 Apr 2025 10:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745749245;
	bh=UvgX/22nEMLGVHnLX7utgwefDV5CfKGMP+fQPcGv4Q8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Mc+LLps/OnHxQfbiaghh+dEvxoV3Tu6fQOxBLkQ/rdYm27bU20RcLqL3a9YmusXM5
	 CS+/188Z1gv96pms5EKq1PJ/3ynRurt6g+z1sZVQLY4Sr/E8ke8RMIANy4VNuY8ZtU
	 O/csuIRW74bWlRCxv5qi1miUsupmS1z4uxFcnk5cxEkrjiXFxtQcZTZB/YR1zsqizi
	 VcddKI4RMtewnXSIjbuFWddJ/+x8n8F/uB1mLjc1nPmqEoZ4yi+AiSFtA2oTvaJf+A
	 efRx5rTreJQNcidxZ9jMT8nyWtVu38+aKrM1rtQI3Z9BvOF6Lo6LDdzsT6udCocyyk
	 tsRD8/vZCyVsg==
Date: Sun, 27 Apr 2025 11:20:35 +0100
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
Message-ID: <20250427112035.112d086d@jic23-huawei>
In-Reply-To: <8a57a332-c2a6-4825-a5f7-d765ea15bd6f@baylibre.com>
References: <20250425-iio-introduce-iio_declare_buffer_with_ts-v3-0-f12df1bff248@baylibre.com>
	<20250425-iio-introduce-iio_declare_buffer_with_ts-v3-1-f12df1bff248@baylibre.com>
	<20250426123509.0b04f0f9@jic23-huawei>
	<8a57a332-c2a6-4825-a5f7-d765ea15bd6f@baylibre.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_032046_908608_3AA4D654 
X-CRM114-Status: GOOD (  27.32  )
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

On Sat, 26 Apr 2025 17:34:10 -0500
David Lechner <dlechner@baylibre.com> wrote:

> On 4/26/25 6:35 AM, Jonathan Cameron wrote:
> > On Fri, 25 Apr 2025 16:08:43 -0500
> > David Lechner <dlechner@baylibre.com> wrote:
> >   
> 
> ...
> 
> >> @@ -777,6 +779,42 @@ static inline void *iio_device_get_drvdata(const struct iio_dev *indio_dev)
> >>   * them safe for use with non-coherent DMA.
> >>   */
> >>  #define IIO_DMA_MINALIGN ARCH_DMA_MINALIGN
> >> +
> >> +#define __IIO_DECLARE_BUFFER_WITH_TS(type, name, count) \
> >> +	static_assert(count); \  
> > 
> > Why do we care if count is 0?  Or is intent to check if is constant?
> > If the thought is we don't care either way about 0 (as rather nonsensical)
> > and this will fail to compile if not constant, then perhaps a comment would
> > avoid future confusion?  
> 
> I would be inclined to just leave out the check. But yes, it is just checking
> that count is constant and we don't expect 0.
> 
> >   
> >> +	type name[ALIGN((count), sizeof(s64) / sizeof(type)) + sizeof(s64) / sizeof(type)]
> >> +
> >> +/**
> >> + * IIO_DECLARE_BUFFER_WITH_TS() - Declare a buffer with timestamp
> >> + * @type: element type of the buffer
> >> + * @name: identifier name of the buffer
> >> + * @count: number of elements in the buffer
> >> + *
> >> + * Declares a buffer that is safe to use with iio_push_to_buffer_with_ts(). In
> >> + * addition to allocating enough space for @count elements of @type, it also
> >> + * allocates space for a s64 timestamp at the end of the buffer and ensures
> >> + * proper alignment of the timestamp.
> >> + */
> >> +#define IIO_DECLARE_BUFFER_WITH_TS(type, name, count) \
> >> +	__IIO_DECLARE_BUFFER_WITH_TS(type, name, count) __aligned(sizeof(s64))
> >> +
> >> +/**
> >> + * IIO_DECLARE_DMA_BUFFER_WITH_TS() - Declare a DMA-aligned buffer with timestamp
> >> + * @type: element type of the buffer
> >> + * @name: identifier name of the buffer
> >> + * @count: number of elements in the buffer
> >> + *
> >> + * Same as IIO_DECLARE_BUFFER_WITH_TS(), but is uses __aligned(IIO_DMA_MINALIGN)
> >> + * to ensure that the buffer doesn't share cachelines with anything that comes
> >> + * before it in a struct. This should not be used for stack-allocated buffers
> >> + * as stack memory cannot generally be used for DMA.
> >> + */
> >> +#define IIO_DECLARE_DMA_BUFFER_WITH_TS(type, name, count) \
> >> +	__IIO_DECLARE_BUFFER_WITH_TS(type, name, count) __aligned(IIO_DMA_MINALIGN)
> >> +
> >> +static_assert(IIO_DMA_MINALIGN % sizeof(s64) == 0,  
> > That message isn't super helpful if seen in a compile log as we aren't reading the code here
> > "IIO_DECLARE_DMA_BUFFER_WITH_TS() assumes that ...
> >   
> >> +	"macros above assume that IIO_DMA_MINALIGN also ensures s64 timestamp alignment");
> >> +  
> 
> Seems we actually have an arch (openrisc) that triggers this [1]. This arch
> doesn't define ARCH_DMA_MINALIGN so it falls back to:
> 
> #define ARCH_DMA_MINALIGN __alignof__(unsigned long long)
> 
> Apparently this is only of those 32-bit arches that only does 4 byte alignment.
> From the official docs [2]:
> 
> 	Current OR32 implementations (OR1200) do not implement 8 byte alignment,
> 	but do require 4 byte alignment. Therefore the Application Binary
> 	Interface (chapter 16) uses 4 byte alignment for 8 byte types. Future
> 	extensions such as ORVDX64 may require natural alignment.
> 
> [1]: https://lore.kernel.org/linux-iio/20250425-iio-introduce-iio_declare_buffer_with_ts-v3-0-f12df1bff248@baylibre.com/T/#m91e0332673438793ff76949037ff40a34765ca30
> [2]: https://openrisc.io/or1k.html
> 
> 
> It looks like this could work (it compiles for me):
> 
> 	__aligned(MAX(IIO_DMA_MINALIGN, sizeof(s64)))
> 
> If that is OK we could leave out the static_assert(), unless we think there
> could be an arch with IIO_DMA_MINALIGN not a power of 2?!
> 
That change seems fine.  Non power of 2 arch would be fun but implausible any time soon :)


