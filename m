Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94446CD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 07:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ojBKerXcsom5YLOUywnRgFuJgAkEyWjWD8C2JpwtbUw=; b=JQ10T52h6+zTHLEQcfA2AW6g2Z
	jmg/0wVZfXh3q4p6JVu4O8QdQ0aw+bwA7cRAWA/EcrcxerZMqTZOHM6q8q28FYRnsBpByNOubKpo9
	XrHTXtYZJ7NNWT/z+6JbosPaxP3n2SLyioM2Dyvw8KIyyFyZYTR5fDUigGWk2AIB2wypejWIrBTik
	eopANIm9TFmEqG0Z0UL4PMJJHMqdKQs4rr1LQP4qWrJFbkiYe9eNUtnQ62pUWfDAXMFQhOpMm1uWM
	C4YeG2xd9HoGuJwB/KdmHfcW56Lo4Ysfs0JBg1kPI9JAIrNQYgWltYWzqZBIau9Vzm9B1IjCP0Npj
	eBma14nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNQNB-00000004ohg-18G9;
	Thu, 14 May 2026 07:20:45 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNQN8-00000004ogn-06pr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 07:20:43 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-48e6db3ff7eso31428305e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 00:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778743240; x=1779348040; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ojBKerXcsom5YLOUywnRgFuJgAkEyWjWD8C2JpwtbUw=;
        b=YPcSZpUsehVGIT6lflljB4w16G/nt6XSlB4Ar62sj9ZToLYqzwREkg2TzX0cZGIYq7
         TYaViFPWL/uuZxOjwXl06ClMgZk4+1fWKJ/uyCRhYCKMGiKYloISywNg6FdRhUuYLDPx
         Ov8rosNpLkNP87anaQY6qsUwAxXY1EVepiUQ1NoyBz3IJ5+ZaeoTdv7rGb9YMMua2Cl9
         V03V9B8MNb+NaIWi0PTYOP1U3/xsjwz1r3l045Cj7rdrqtDP1DAa+MB56TGGbYFYLRg/
         wxhKoxuVydkdVFraIXMBbchnQp0/nPdbqE0bZW1QRB7PuElsolvn3667x1+lhj8qdNFw
         Dk/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778743240; x=1779348040;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ojBKerXcsom5YLOUywnRgFuJgAkEyWjWD8C2JpwtbUw=;
        b=XKyeAx0ffJUTrd4l+ktzGs02/81ql0W+E00b7AdFGff4bsw5FknioMhAffAn0OmTTd
         AyPDN42By5x2WAcORKxEHXAhSmTDQKOq4hG/67vgdsBF70zMjH48l+SXyXYZLmYsn7IU
         w5vLsiH05UMqQhdTiiWtn6WQy3PqIkefCSodED94xAXZsJqFHlkS8kb3zRhQVjFy6v76
         ubz6L9WgnScSrR+lKbUSYlzCpAPHD1O+ObGMLkkBujhTamhWza1pkwLN5BI7qW8+lZcg
         x8pRWpiGlSkF2wZuhrwJfYDvsNFSzHfIvq4V5q2ukioKWkJa1rXhnMVEEWu3fV088iqx
         0NXA==
X-Forwarded-Encrypted: i=1; AFNElJ+LQm0HjSy4sDj5VFnm9oWB5j0tlQjR71KgA3eFZ+J2H23P2fEK+Z3CelbiZtZKXcquAQWAgSrgudWYm3q63e/1@lists.infradead.org
X-Gm-Message-State: AOJu0YysVJUCkDbs+8Y7HC2Pswh2idx7Vi53jX+Sio3YVkijbPX+32Ew
	Oi4eDMng75/EPsxqXl5efbJ//uoZLhwF6hoiJkti20yaRixMeQH0lPPaK7JzjNwRnJw=
X-Gm-Gg: Acq92OFdBb1GAp9+v3rTDdkvGQlWwmU/3S0zFOP/l+nlP5OAE2Wydvw3zH9bLiIaBXz
	DDgBzV2zk5RHQ63BZu1kEEza4sJaIrvTVkkQ7mGP7r5wGP7LhACN+XZH9glfr+/7bcJFby/tvli
	q5QHBqBUnWlLt+1VRPiqHosRG4wkCL/Z/o7tDsdqUUqTe5xL0rCOCWmfyKYt8mFQ0cVmJIKDcmo
	NSUGg+hjf5U5NRIPbPB3StM+YMuDta+e959LsCfOlqd+ZcaZbY3KY+r/ecgKyDdA5hxjGYZwG23
	zIB0QMM7VH3iYBQGavqphNHvPbgKnCan4luYJYpuG/1L5ZsjAYlGL8e7Ybqs8gjaJOXDqJ44TX0
	KFdLfhCFihsdB8hwlq6PvcyoW/tJ+hIAzbReMnKWk7zdvnvFNiaoZajjCVKJW6SDkwBwvR99D8m
	H35aJlK4t4b3S5JQ3poORUE5Nfc2nqrVIurTp3
X-Received: by 2002:a05:600c:1547:b0:485:ae14:8191 with SMTP id 5b1f17b1804b1-48fc9a02785mr93973495e9.5.1778743239978;
        Thu, 14 May 2026 00:20:39 -0700 (PDT)
Received: from archlinux ([2a07:7e81:7daa:0:62cf:84ff:feee:627])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fdc6f0ab7sm22461275e9.15.2026.05.14.00.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 00:20:39 -0700 (PDT)
Date: Thu, 14 May 2026 09:20:38 +0200
From: Angelo Dureghello <adureghello@baylibre.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Greg Ungerer <gerg@linux-m68k.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>, Arnd Bergmann <arnd@arndb.de>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
Subject: Re: [PATCH v2 09/11] m68k: stmark2: use ioport.h macros for resources
Message-ID: <cabngw2wuxh7cfx4cw4ik46dmxs72u47jyo6hcwgdd7a5whny2@dsp4cysetarw>
Mail-Followup-To: Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Greg Ungerer <gerg@linux-m68k.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Steven King <sfking@fdwdc.com>, Arnd Bergmann <arnd@arndb.de>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
References: <20260513-wip-stmark2-dac-v2-0-fcdae50cf51a@baylibre.com>
 <20260513-wip-stmark2-dac-v2-9-fcdae50cf51a@baylibre.com>
 <agTcoVbImqMgfQy5@ashevche-desk.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agTcoVbImqMgfQy5@ashevche-desk.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_002042_088425_626AFC62 
X-CRM114-Status: GOOD (  18.26  )
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

Hi Andy,

On 13.05.2026 23:18, Andy Shevchenko wrote:
> On Wed, May 13, 2026 at 11:14:33AM +0200, Angelo Dureghello wrote:
> 
> > Align also other resource declaration using DEFINE_RES_.
> 
> DEFINE_RES_*()
> 
> ...
> 
> >  static struct resource dspi_spi0_resource[] = {
> > -	[0] = {
> > -		.start = MCFDSPI_BASE0,
> > -		.end   = MCFDSPI_BASE0 + 0xFF,
> > -		.flags = IORESOURCE_MEM,
> > -		},
> > -	[1] = {
> > -		.start = 12,
> > -		.end   = 13,
> > -		.flags = IORESOURCE_DMA,
> > -	},
> > -	[2] = {
> > -		.start = MCF_IRQ_DSPI0,
> > -		.end   = MCF_IRQ_DSPI0,
> > -		.flags = IORESOURCE_IRQ,
> > -	},
> > +	DEFINE_RES_MEM(MCFDSPI_BASE0, 0x100),
> > +	DEFINE_RES_DMA(12),
> > +	DEFINE_RES_DMA(13),
> > +	DEFINE_RES_IRQ(MCF_IRQ_DSPI0),
> >  };
> 
> This conversion drops hard indices, would it be a problem (for example,
> some code modifies the fields based on the [hard coded] index...)?
> 
> If not, perhaps good to mention in the commit message and move IRQ to be the
> second one?
>

i can't see any directly-related code accessing these resources by index,
so would not change this if there isn't any risk. 
Also i see DEFINE_RES_() stuff widely used in other arch, so thios make me
think accessing by index is something wrong.

> -- 
> With Best Regards,
> Andy Shevchenko

Regards,
angelo

> 
> 

