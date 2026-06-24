Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21B2FCDB481
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 13:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:In-Reply-To:MIME-Version:References:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JVKkeSAj9cEIT5s5aHGZfnYhC/Asr1gCUKNdYQVD9Y4=; b=3yxU+R2xkg6g/z4Q1JQikUu/99
	AKjXZVweugek8mwB3a8khWFkBuLAdIDuBLs8HDgR15+5Lp2BmfajmwayNVFE//6h3p/0dMtkKL63G
	cKXeQhiP3JT1QrsLu8mUWHLn1qf5d6RqjVWafdPdjVXGSZW6gle+c15pr1HC+2tCwNG0Kxr1ayotF
	BGA1qwYZ15vXBJVeey5IfBlCv+7leOadfTguKfGlIcTnCP0LDpV0VBkQfxQsFdPWAU/kKX5krT8KG
	JOcg7BiROpILxz0K2xuzFIwHKndVOZxkig2XfGTPuQ7CcJ0GLSqvMLo+NaF5bVXcPjg/aRg5/PXps
	VDOmaU4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcO1S-00000007rCx-18Y5;
	Wed, 24 Jun 2026 13:52:10 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcO1P-00000007rCa-1fA4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 13:52:09 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-69690062350so1266754a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 06:52:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782309125; cv=none;
        d=google.com; s=arc-20240605;
        b=P/VOnRemqk9R/Zr66Jemy3O1dE23PZwq/f0ZyU9uYWIWo8H4OOHci/xUpfb2Ro/MLM
         210SrCGlrAyK2EiASnuPbWKkd1RrYPeJGNQGFoUAAA7CQShj1PoFAuRXdyvhlsCZUzCU
         dxCFgliiD8aLcVvBQV4uHJNAlgvdb1rbZx4FSrguXcvDVmQiik01IQ9u/MIbhUf+hNUw
         c3DlPQKWOK73R0CNAH8k6brc8PJoLTy+isTH+N8BMDaDagXZbuymIL+WiZmtUNh8OSmz
         CbLTp9/B1zUSfL/8hlEOa25UcYYi35HZx5xvAiLOuJGcHEcLGDVjZDcLIYgEQQxoPjjx
         9H1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :mail-followup-to:from:dkim-signature;
        bh=JVKkeSAj9cEIT5s5aHGZfnYhC/Asr1gCUKNdYQVD9Y4=;
        fh=/zRWhKF1EC3TTrJb/ZjT+DuVXCg7ETJGuQJ/EGBj8Y4=;
        b=e1iGqFMAeFwhUNlDHwh8MVKK9m/0xsAZ88FJrdLhqsdpCbqcv6VWa9nvjVETxVIDiN
         Lhlpa8Rtlbi85C989OE4pMvD06FSawd+aO+S/htMkbgJQxBWkSPcB5Q7s0IyoTjlzlyr
         bE7+ZtPYc9TDSWuOBN2OgQFBxdFv95zfORBJtw/ZBnSi3vEZ2HybVzqqpo+FIP8DK0Jc
         nzi1xwMOdo3PbEbfR7zOEnOWWDQsqRjTH3NajlTtNlai9G9QVSjj8108zdXEByPaDy7J
         3ITnG3jretTs+SUPEtt7gZ8x7NEfi578hw0qAUHOmblfsig+3F9uNnDH36rJc33CLrnE
         09cA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782309125; x=1782913925; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :mail-followup-to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JVKkeSAj9cEIT5s5aHGZfnYhC/Asr1gCUKNdYQVD9Y4=;
        b=fEclaedW3LoKh2LT6KzTHhSyrGUmL6XnQi65SqHOI5pEkKb599kIFGShCAXCANLcpw
         kOJ+hM7PlZkGaXoq834Vd31YL0X0F1wTJp9//TTzxkqBnlnE0av1dHpSGQYuMdbDKGZl
         7PT7VriNQ1yfQOh90y07vKdh1qvd4SaBlDPkwv1Q0Pt0/LYdA8xjJATO/ImM10tGS/a9
         o2vg4SvUeB9X67aaDsXhkXbCfww/X8Q9t+xajVFhWjqApqEvXl5/Mf9fQePyLOfNd6cV
         x8IEYnt0HaW6E9Oq4tRClfU4+GfhNgh7MwFB4B3D/h25fid7Par8G2sZO7xwOwaLYolG
         vYjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782309125; x=1782913925;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :mail-followup-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JVKkeSAj9cEIT5s5aHGZfnYhC/Asr1gCUKNdYQVD9Y4=;
        b=Qfienva1zsfSTYP3Eyg8dsNKr6ZxOzvOcWT9RpKwiiVmAxaX78p5a3FdRyaWIJV73K
         MxV+0NUXqEQSXLj3qfReoOlupvwIfJdVnswjHBmoGcHsbsOJgNHxg07//uBOVzFLH0Br
         QPUvCZmTcBniom12usEs5nXpVXyhr2SpXtyZiGocEnVDK61BoBKIvwSDjBzkW2dCv6dN
         nP0oIzOv3eIKOphjEpLuLFPpnd0s3PUXxp5F2cmV6myn7yj1nePljOGxmG8NPyRzjfDO
         fh9YtkOWQ4/tfl6oEXRitj1V5u2QGPYU5GMNf0c3gTM6ALmnxRgFw0TNRF2q7f+MTIzY
         z1WA==
X-Forwarded-Encrypted: i=1; AFNElJ/l12MphQk2BD0OPoXTGKN5HgXYg2pRH1bZUGFCd67/XH/aIFIXL/rwjkonvZjYg191VZdGi7+XWubA5Dq5fYq7@lists.infradead.org
X-Gm-Message-State: AOJu0Yz11OeCCC2mzE0hJqVmF7wz8bX3Y4XbMknEt+I0L/HnifIrPrPR
	mCwtYqeea9wP8Ndo+2n81Z6vm2zv5TqECwnpgWqMr9Ex5kiDuWcEsSu0R1VARiN75L8ADpNJwtM
	oG6rQIURlDI6/RGy5jp42B1dTrb9Q0WFZbsfHfyddew==
X-Gm-Gg: AfdE7clDc1zPk66ySdYkEcbBrrhcXSlU5icYYTb1ca//UZsxl8+UqgpYNHzdyYisZ42
	arArDDT4CqRMU08LdfTGYp5N/bwXjduQ3yt5GgBkGXrYDTkWd664TJcktStmHeLe84c1bIhTNjs
	HTDRbr87PkljcNHAIAV7QbZ4q2iSliYkQazFUGasM8xOpNEIsohr2nvGgqkSmJzwtQO2BCVnT0C
	BpHeuDUihxB/UIen4Q1JA0+Huop8wn2/DZvk3H7xDgrZT2QblAckTqc4FdytYPABVmvMPIkNCnt
	+yzX6m2u5fgp/9aVXMrqmSoaDA==
X-Received: by 2002:a17:907:60c9:b0:bfe:ed06:5a14 with SMTP id
 a640c23a62f3a-c119f6123b6mr182955966b.50.1782309124805; Wed, 24 Jun 2026
 06:52:04 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 06:52:03 -0700
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 06:52:03 -0700
From: Angelo Dureghello <adureghello@baylibre.com>
Mail-Followup-To: Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Angelo Dureghello <adureghello@baylibre.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
References: <20260618-wip-stmark2-dac-v6-0-48761dbb96d7@baylibre.com> <ajr4LvdPZKHrqDVp@ashevche-desk.local>
MIME-Version: 1.0
In-Reply-To: <ajr4LvdPZKHrqDVp@ashevche-desk.local>
Date: Wed, 24 Jun 2026 06:52:03 -0700
X-Gm-Features: AVVi8Ce0Oz4uWAyICirL9pSge-M3xWIHMYk0X2M6seIbhH3jA-_W8vl1mqu01X8
Message-ID: <CALSJ-wAFwYC38X0VUYYBX_AYsWChpFxDQtQ52KHhbFV2Bm=prg@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] add mcf54415 DAC driver
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Angelo Dureghello <adureghello@baylibre.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_065207_510546_0E3F789A 
X-CRM114-Status: GOOD (  19.28  )
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
On Wed, Jun 24, 2026 at 12:18:38AM +0300, Andy Shevchenko wrote:
> On Thu, Jun 18, 2026 at 11:04:14PM +0200, Angelo Dureghello wrote:
> > This patchset adds a minimalistic DAC driver for the NXP mcf54415/6/7/8
> > builtin DACs.
> >
> > Currently the driver enables the raw write only. Feature as dma, sync, or
> > format are not supoprted for this version.
> >
> > Additional options suppoerted by the DAC module will be added to the driver
> > later on, as needed.
> >
> > The same patchset prepares the m68k/coldfire architecture to support
> > the driver.
> >
> > Below some basic tests done on stmark2 mcf54415-based board, voltage check
> > on DAC0 and DAC1:
> >
> > ~ # cd /sys/bus/iio/devices/iio:device0/
> > /sys/bus/iio/devices/iio:device0 # ls
> > name               out_voltage_scale  uevent
> > out_voltage_raw    subsystem
> > /sys/bus/iio/devices/iio:device0 # cat name
> > mcf54415
> > /sys/bus/iio/devices/iio:device0 # echo 4095 > out_voltage_raw
> > /sys/bus/iio/devices/iio:device0 # echo 2048 > out_voltage_raw
> > /sys/bus/iio/devices/iio:device0 # echo 4096 > out_voltage_raw
> > sh: write error: Invalid argument
> > /sys/bus/iio/devices/iio:device0 # cat out_voltage_raw
> > 2048
> > /sys/bus/iio/devices/iio:device0 #
> >
> > Same behavior for /sys/bus/iio/devices/iio:device1.
> >
> > Generated a sine wave by shell script, sine shape is good.
>
> Heard a presentation (Embedded Recipes IIRC) where one tried sine and real
> sound (it was about sound DAC) was really awful. So, Can you try a bit more
> sophisticated signal?
>

sure can try some sound with this 12-bit, but don't think is possible now
with only raw output. My idea is with further patches, once ColdFire DMA
is fixed, to extend the driver and be able to sample higher frequencies.

> --
> With Best Regards,
> Andy Shevchenko
>
>
Regards,
angelo

