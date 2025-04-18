Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11521C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 15:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lnN6DOW/fFY8PCqW+ghVlCjVAXN+wvV9R83j5cAnbtU=; b=dmamoE9HuFRRN+JVb8OulS8kw0
	9Trlh/hrcqKu1A6R3+iiThR5tfVu5qhnP8G43b23E92IkPBWqXE8Huvp9CrUEfbYvP27KiNOGBfMQ
	dzgbQd0TcOn/uoV5GBMVX71yxD6vWHk0IXutkLUnbTUY9VtFVG7Ej2kmPcUW+oBGY0/kqvr4zL/9U
	N8RKR3Phh/h9eSE+rwF++NnqkGFe4WLCskVtaEKzYRSG2W+bevBlFwVSJKBm2aY7BaW3c0vtrZjqb
	L7/AA5KD3BWNKQfcAAiuMK1UNIGE7yiWJx6Xy1asEm2j2frF8YNLwYIT1xIueacCSvr9AjyqTNpmM
	ZwccBijQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5nDy-0000000GZ2i-2SA7;
	Fri, 18 Apr 2025 15:01:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5n7z-0000000GWsz-3XWH;
	Fri, 18 Apr 2025 14:55:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8BFA861120;
	Fri, 18 Apr 2025 14:55:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 365D2C4CEE2;
	Fri, 18 Apr 2025 14:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744988139;
	bh=xxlkDC+ptsSipdaVzvxKfGZrXkHdinbpI+m0wsLD/9E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Iq3bCdwZz4DOlIjIszgQ8EVTtbNWOo5QHdeE4MppyoHFRYIXug+s6DZYQCbpHl7Xz
	 feszW9ykNafiBxRYRF/pLBwq24IzeUpwmhX3mpYrOorJaiEAJElQsonF29adeRMK7K
	 ZkgonCBfr/VPoxN8h4hYwwZyptv545Vris7VYhO8y1Eb+4bK9zokjPWhA623y2880b
	 dMbiQ6WBGgFRRcJEc58TYsmioxDQ/UzY/YiyDG+oWv2NoQMt6y3zN8Moe7K0tkbVSP
	 qkYo37OR0fyH7S67mHM052BKI20ZoFRcLPcm8DYZX/eNXrhygUYOg2EvY9882WxRTN
	 7K7XcC0ThDZYQ==
Date: Fri, 18 Apr 2025 15:55:30 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Andy Shevchenko
 <andy@kernel.org>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Lars-Peter Clausen
 <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, Cosmin
 Tanislav <cosmin.tanislav@analog.com>, Tomasz Duszynski
 <tduszyns@gmail.com>, Jean-Baptiste Maneyrol
 <jean-baptiste.maneyrol@tdk.com>, Andreas Klinger <ak@it-klinger.de>, Petre
 Rodan <petre.rodan@subdimension.ro>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 6/8] iio: imu: adis16550: align buffers for timestamp
Message-ID: <20250418155530.088e398d@jic23-huawei>
In-Reply-To: <651b1f91-fd5e-4d59-b78b-fdd7f89247e4@baylibre.com>
References: <20250417-iio-more-timestamp-alignment-v1-0-eafac1e22318@baylibre.com>
	<20250417-iio-more-timestamp-alignment-v1-6-eafac1e22318@baylibre.com>
	<aAEzeY_p6a8Pr-zn@smile.fi.intel.com>
	<f4db1a95-106f-4fa4-9318-3ee172e29cdb@baylibre.com>
	<20250417184429.00002403@huawei.com>
	<651b1f91-fd5e-4d59-b78b-fdd7f89247e4@baylibre.com>
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

On Thu, 17 Apr 2025 15:48:44 -0500
David Lechner <dlechner@baylibre.com> wrote:

> On 4/17/25 12:44 PM, Jonathan Cameron wrote:
> > On Thu, 17 Apr 2025 12:07:37 -0500
> > David Lechner <dlechner@baylibre.com> wrote:
> >   
> >> On 4/17/25 11:59 AM, Andy Shevchenko wrote:  
> >>> On Thu, Apr 17, 2025 at 11:52:38AM -0500, David Lechner wrote:    
> >>>> Align the buffers used with iio_push_to_buffers_with_timestamp() to
> >>>> ensure the s64 timestamp is aligned to 8 bytes.
> >>>>
> >>>>  drivers/iio/accel/bmc150-accel.h | 2 +-
> >>>>  drivers/iio/imu/adis16550.c      | 2 +-    
> >>>
> >>> Looks like a stray squash of the two independent commits.    
> >>
> >> Oops, sure enough.
> >>  
> >>>
> >>> ...
> >>>     
> >>>>  	struct bmc150_accel_trigger triggers[BMC150_ACCEL_TRIGGERS];
> >>>>  	struct mutex mutex;
> >>>>  	u8 fifo_mode, watermark;
> >>>> -	s16 buffer[8];
> >>>> +	s16 buffer[8] __aligned(8);    
> >>>
> >>> As for the code, would it be possible to convert to actually use a sturcture
> >>> rather than an array?    
> >>
> >> I do personally prefer the struct pattern, but there are very many other drivers
> >> using this buffer pattern that I was not tempted to try to start converting them.  
> > 
> > For drivers like this one where there is no room for the timestamp
> > to sit earlier for minimal channels I think it is worth that conversion
> > if we are touching them anyway. 
> > 
> > Jonathan
> >   
> There is actually a lot more wrong in this driver, so will save that for a
> separate series.
> 
ok.  That is probably fair enough.
I'll not pick this up though given the smashing of 2 patches.

So this one will need a v2.

Jonathan



