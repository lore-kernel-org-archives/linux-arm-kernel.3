Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79376F41808
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 15:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:In-Reply-To:References:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j3dPRMbHhjlBqmmhnyVPSXrV9NMmStYxWYwctCoc6i0=; b=J9YFf1yBbE85nuodt5qopy5opo
	Lf/7rZ0YnTs6E7gD1N/doDMeBJWaL3WHISquj7kEnRWiav796NzfF9IWeX6il3kQin2liiVI/rgN4
	vG192waxakEJ7fjYBdPw5IsTY5PoFW3B4nphQ0zQA/giUwjvrPVp4iAN7buOcTcIWmZb/zVGR1wLf
	USmSXDVFm+tj44Rn6OUzMmwTGFVKG35ZYgNrlDVCsOol8zESxO1XIAL28ilOUjup/o455QRPgc/xM
	6WKrqHED6GGwzagfEJQ5hrJiLxVuHmPCpYR8cLRNVjh6Ug9SdOx8qP5QXE5ODG5ID2/Q3mJt/jH2L
	RxcLYqMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzcIY-00000007ZZh-3Gon;
	Mon, 09 Mar 2026 15:13:34 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzcIW-00000007ZYU-0u9G
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 15:13:34 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4853fd7b59aso4404715e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 08:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynesim.co.uk; s=google; t=1773069210; x=1773674010; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:user-agent:in-reply-to
         :references:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=j3dPRMbHhjlBqmmhnyVPSXrV9NMmStYxWYwctCoc6i0=;
        b=KBjOskzK9UOvdRYTrBghBiXcWLO1x1loU0RCgK0XeRNouRn+GYaazDIDhPp3tKxoKL
         jM/gehWTLj/eadXXsNeONI2dl39taMUpXVo/qbGICqR1h8oFQcgdh5jRkJd3NuH9YnEX
         WsY04KT2t4mORD12kY4N+s9bFA7CLAOtaDNm7bSDELZKK8bS0sQSaeDdkevUvrmKeVQN
         B5JCKCpjsbKQOLgVwwVF00Lcw04bNcI+8Vr/CM1ibJiD2E7C1w/l+O3KONR+0KqVjlt1
         t0TMFxFxXkK7phXwC+zEyuy3nHhL/92Am9sMSnB9jBqq66kO/t70zpguYQNJSZ4NsSwX
         JUaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773069210; x=1773674010;
        h=content-transfer-encoding:mime-version:user-agent:in-reply-to
         :references:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j3dPRMbHhjlBqmmhnyVPSXrV9NMmStYxWYwctCoc6i0=;
        b=sSSmEOxJFwPwtAuHle+EnjIwaL5mpuAAuBjPF7FpSHt+XLyf701gJzv4dRRagDHprf
         0zIH4BIByCZT3ciXrjsm8mPRXy9V3B7RlQGfnZOmI+2v6wh77hKB7lCTZYxKoPqoUH9i
         RWRXIZ63bqM3Bg7npAdU+IAmXsXHzhI+3bRVE2cnPv1OZgmpOXIO1g+kZFjy4bcsRyMX
         +6vzcT+fgTPQPat6j2NmEfZG3l/pe3JstPMSnH8I9GQkt8BNVaWhfk7TWethjLRjNEj8
         Guxtm0l/6UsJGlB1TBL+x9EsMX91JNtAE4+CGvFegV1tJrIbGtkU/gey7FzqfWgdvdza
         6hOA==
X-Forwarded-Encrypted: i=1; AJvYcCXOcTeffGRbfIEiA5ObGv3GBGcki+pWOPfojZwbYD8VpABtfgTTupjIFa96yWiqiu902ByO8r8y7Zd6YmgVj7Wl@lists.infradead.org
X-Gm-Message-State: AOJu0Yy//Te8A9cP64rLzkojsir9SX/MYOfSfIt+Kqg1DVzvfsIARyv0
	9OcFT67jGj7oP2YNgUoBvL7J9j1Bqm3YKS3gTEXMBI/FI9oApKnhoeyluvj2uupx6Mc=
X-Gm-Gg: ATEYQzxNEVCjwBq/AnKZ/+ocwA6GwfmuBQthxXLqTMIVvHkemgGoeUJzfXS73GGCPdV
	vcLvoUgeuIGHjsb+iPV2IoX9LBmBCljSLPtFR6jsU3BqCjipXyvDp80ukOxaTQ7/iunKUX/bReb
	nyQzA5Of4xfKTIQdFlhNB9SIB9I88eRMrJ57vRl8i74BK0o4C1NnILeDeFiWqAyln/mJzbl5KQK
	0VOHiYOfpbA1bW79+150edshGX0N1ivEoW0Qnp2qSP8vHbgTfckwQlnEEMtZCO0+3L4/n4PMKlc
	a9AcJS89lWB3sZvVN2JJ5kkKJBgw3QQd7r0ijquokrfSJwHsZo2h1pYg4TRyN0OeF2vAsd4F9rv
	b+cpnBmGFeoCUrFp0crC3YcNKMTzTW4RsukgiVuKAD6BQDJX/vaGRB0xl4ULuJBrsiAii0RpllM
	e4aOpfn5yG+BmtbXgxkmsnrG6XSuM8i0qZZ325U+1gLYpKtC8yePgNeNVZKrSFZO0H4JdoSuI1Q
	mRH5HykURR8aplIsZTDuGP5L1l4B3G3
X-Received: by 2002:a05:600c:358e:b0:485:3ec6:e634 with SMTP id 5b1f17b1804b1-4853ec6e713mr39780495e9.15.1773069209257;
        Mon, 09 Mar 2026 08:13:29 -0700 (PDT)
Received: from CTHALPA.outer.uphall.net (cpc92886-cmbg20-2-0-cust122.5-4.cable.virginm.net. [82.20.18.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8ec97sm30024898f8f.5.2026.03.09.08.13.28
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Mon, 09 Mar 2026 08:13:28 -0700 (PDT)
From: John Cox <jc@kynesim.co.uk>
To: =?utf-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, John Cox <john.cox@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>, review list <kernel-list@raspberrypi.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, Stefan Wahren <wahrenst@gmx.net>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 5/6] media: platform: Add Raspberry Pi HEVC decoder driver
Date: Mon, 09 Mar 2026 15:13:27 +0000
Message-ID: <0nntqkl5vfiobr911s4fehl8sj9g6iidkc@4ax.com>
References: <20260304-media-rpi-hevc-dec-v6-0-93868ae6dff8@raspberrypi.com> <20260304-media-rpi-hevc-dec-v6-5-93868ae6dff8@raspberrypi.com> <f65f6e40-39f4-4744-bd92-46b38618c6f9@igalia.com>
In-Reply-To: <f65f6e40-39f4-4744-bd92-46b38618c6f9@igalia.com>
User-Agent: ForteAgent/8.00.32.1272
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_081332_311589_16F6AFBA 
X-CRM114-Status: GOOD (  29.16  )
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

Hi

>Hi Dave,
>
>On 3/4/26 11:05, Dave Stevenson wrote:
>> From: John Cox <john.cox@raspberrypi.com>
>>=20
>> The BCM2711 and BCM2712 SoCs used on Rapsberry Pi 4 and Raspberry
>
>s/Rapsberry/Raspberry
>
>> diff --git a/drivers/media/platform/raspberrypi/hevc_dec/Kconfig =
b/drivers/media/platform/raspberrypi/hevc_dec/Kconfig
>> new file mode 100644
>> index 000000000000..ae1fd079e5c9
>> --- /dev/null
>> +++ b/drivers/media/platform/raspberrypi/hevc_dec/Kconfig
>> @@ -0,0 +1,17 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +
>> +config VIDEO_RPI_HEVC_DEC
>> +	tristate "Rasperry Pi HEVC decoder"
>
>s/Rapsberry/Raspberry
>
>> +	depends on VIDEO_DEV && VIDEO_DEV
>
>VIDEO_DEV is listed twice.
>
>
>[...]
>
>> +
>> +/*
>> + * Stop the clock for this context
>> + * clk_disable_unprepare does ref counting so this will not actually
>> + * disable the clock if there are other running contexts
>> + */
>> +void hevc_d_hw_stop_clock(struct hevc_d_dev *dev)
>
>I believe it would be more idiomatic if you use runtime PM to handle
>this stop_clock()/start_clock() semantics.
>
>> +{
>> +	clk_disable_unprepare(dev->clock);
>
>In the case that the clock is actually disabled (no other running
>contexts), I believe the IRQs should be also disabled before disabling
>the clock.

I'll fix that

>> +}
>> +
>> +/* Always starts the clock if it isn't already on this ctx */
>> +int hevc_d_hw_start_clock(struct hevc_d_dev *dev)
>> +{
>> +	int rv;
>> +
>> +	rv =3D clk_set_min_rate(dev->clock, dev->max_clock_rate);
>> +	if (rv) {
>> +		dev_err(dev->dev, "Failed to set clock rate\n");
>> +		return rv;
>> +	}
>
>After I land [1], you will be able to drop this call and just add
>`maximize =3D true` to the HEVC clock.
>
>[1]=20
>https://lore.kernel.org/dri-devel/20260218-v3d-power-management-v6-1-406=
83fd39865@igalia.com/
>
>> +
>> +	rv =3D clk_prepare_enable(dev->clock);
>> +	if (rv) {
>> +		dev_err(dev->dev, "Failed to enable clock\n");
>> +		return rv;
>> +	}
>
>Considering that the clock was disabled, I believe you should re-enable
>IRQs and reset any pending interrupts here, just like you do in
>hw_setup().
>
>> +	return 0;
>> +}
>> +

I'll fix that

>[...]
>
>> diff --git =
a/drivers/media/platform/raspberrypi/hevc_dec/hevc_d_video.c =
b/drivers/media/platform/raspberrypi/hevc_dec/hevc_d_video.c
>> new file mode 100644
>> index 000000000000..d39a2e228595
>> --- /dev/null
>> +++ b/drivers/media/platform/raspberrypi/hevc_dec/hevc_d_video.c
>> @@ -0,0 +1,634 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Raspberry Pi HEVC driver
>> + *
>> + * Copyright (C) 2026 Raspberry Pi Ltd
>> + *
>> + * Based on the Cedrus VPU driver, that is:
>> + *
>> + * Copyright (C) 2016 Florent Revest =
<florent.revest@free-electrons.com>
>> + * Copyright (C) 2018 Paul Kocialkowski =
<paul.kocialkowski@bootlin.com>
>> + * Copyright (C) 2018 Bootlin
>> + */
>> +
>> +#include <media/videobuf2-dma-contig.h>
>> +#include <media/v4l2-device.h>
>> +#include <media/v4l2-ioctl.h>
>> +#include <media/v4l2-event.h>
>> +#include <media/v4l2-mem2mem.h>
>> +
>> +#include "hevc_d.h"
>> +#include "hevc_d_h265.h"
>> +#include "hevc_d_hw.h"
>> +#include "hevc_d_video.h"
>> +
>> +static inline struct hevc_d_ctx *hevc_d_file2ctx(struct file *file)
>> +{
>> +	return container_of(file->private_data, struct hevc_d_ctx, fh);
>> +}
>> +
>> +/* constrain x to y,y*2 */
>> +static inline unsigned int constrain2x(unsigned int x, unsigned int =
y)
>> +{
>> +	return (x < y) ?
>> +			y :
>> +			(x > y * 2) ? y : x;
>> +}
>
>constrain2x() doesn't seem to be used anywhere in the driver.

Good point - I'll remove it

>[...]
>
>> +
>> +void hevc_d_prepare_src_format(struct v4l2_pix_format_mplane =
*pix_fmt)
>> +{
>> +	size_t size;
>> +	u32 w;
>> +	u32 h;
>> +
>> +	w =3D pix_fmt->width;
>> +	h =3D pix_fmt->height;
>> +	if (!w || !h) {
>> +		w =3D HEVC_D_DEFAULT_WIDTH;
>> +		h =3D HEVC_D_DEFAULT_HEIGHT;
>> +	}
>> +	if (w > HEVC_D_MAX_WIDTH)
>> +		w =3D HEVC_D_MAX_WIDTH;
>> +	if (h > HEVC_D_MAX_HEIGHT)
>> +		h =3D HEVC_D_MAX_HEIGHT;
>> +
>> +	if (!pix_fmt->plane_fmt[0].sizeimage ||
>> +	    pix_fmt->plane_fmt[0].sizeimage > SZ_32M) {
>> +		/* Unspecified or way too big - pick max for size */
>> +		size =3D hevc_d_bit_buf_size(w, h, 2);
>> +	}
>> +	/* Set a minimum */
>> +	size =3D max_t(u32, SZ_4K, pix_fmt->plane_fmt[0].sizeimage);
>
>The size computed by hevc_d_bit_buf_size() inside the if-block is
>immediately overwritten here unconditionally.
>
>Should the else case be explicit? Something like:
>
>     if (!pix_fmt->plane_fmt[0].sizeimage ||
>         pix_fmt->plane_fmt[0].sizeimage > SZ_32M) {
>         size =3D hevc_d_bit_buf_size(w, h, 2);
>     } else {
>         size =3D pix_fmt->plane_fmt[0].sizeimage;
>     }
>     size =3D max_t(u32, SZ_4K, size);

Yes that would be correct - I'll fix that

>[...]
>
>> +
>> +static int hevc_d_start_streaming(struct vb2_queue *vq, unsigned int =
count)
>> +{
>> +	struct hevc_d_ctx *ctx =3D vb2_get_drv_priv(vq);
>> +	struct hevc_d_dev *dev =3D ctx->dev;
>> +	int ret =3D 0;
>> +
>> +	v4l2_m2m_update_start_streaming_state(ctx->fh.m2m_ctx, vq);
>> +
>> +	if (V4L2_TYPE_IS_OUTPUT(vq->type)) {
>> +		ret =3D hevc_d_hw_start_clock(dev);
>> +		if (ret)
>> +			goto fail_cleanup;
>> +
>> +		ret =3D hevc_d_h265_start(ctx);
>> +		if (ret)
>> +			goto fail_stop_clock;
>> +	}
>> +
>> +	return 0;
>> +
>> +fail_stop_clock:
>> +	hevc_d_hw_stop_clock(dev);
>> +fail_cleanup:
>> +	v4l2_err(&dev->v4l2_dev, "%s: qtype=3D%d: FAIL\n", __func__, =
vq->type);
>> +	hevc_d_queue_cleanup(vq, VB2_BUF_STATE_QUEUED);
>> +	return ret;
>> +}
>> +
>> +static void hevc_d_stop_streaming(struct vb2_queue *vq)
>> +{
>> +	struct hevc_d_ctx *ctx =3D vb2_get_drv_priv(vq);
>> +	struct hevc_d_dev *dev =3D ctx->dev;
>> +
>> +	if (V4L2_TYPE_IS_OUTPUT(vq->type)) {
>> +		hevc_d_h265_stop(ctx);
>> +		hevc_d_hw_stop_clock(dev);
>> +	}
>> +
>> +	hevc_d_queue_cleanup(vq, VB2_BUF_STATE_ERROR);
>> +
>> +	vb2_wait_for_all_buffers(vq);
>> +
>> +	v4l2_m2m_update_stop_streaming_state(ctx->fh.m2m_ctx, vq);
>
>The order here looks a bit odd to me. Shouldn't we stop the clock after
>we stop the streaming state and wait for all buffers?

I don't believe that is in fact broken. the call to
hevc_d_h265_stop(ctx) should ensure the hardware has stopped so it
should be safe to stop the clocks, the subsequent calls tidy up the
remaining state.

Many thanks

John Cox

>Best regards,
>- Ma=C3=ADra

